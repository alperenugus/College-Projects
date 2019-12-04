
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/sem.h>
#include <sys/shm.h>
#include <time.h>
#include <limits.h>
#include <string.h>

#define KEYSHM1 100 //Boxes
#define KEYSHM2 200 //Painted
#define KEYSHM3 300 //Current Color
#define KEYSHM4 400 //PIDs
#define KEYSHM5 500 //Order
#define KEYSHM6 600 //Index
#define KEYSHM7 700 //Color
#define KEYSEM 800  //Semaphore 1
#define KEYSEM2 900 //Semaphore 2

void sem_signal(int semid, int val)
{
    struct sembuf semaphore;
    semaphore.sem_num = 0;
    semaphore.sem_op = val;
    semaphore.sem_flg = 1;
    semop(semid, &semaphore, 1);
}

void sem_wait(int semid, int val)
{
    struct sembuf semaphore;
    semaphore.sem_num = 0;
    semaphore.sem_op = -val;
    semaphore.sem_flg = 1;
    semop(semid, &semaphore, 1);
}

int main(int argc, char **argv)
{
    int box_num, index, f;
    int semid, semid2, shmid_boxes, shmid_painted, shmid_current, shmid_pids, shmid_order, shmid_index, shmid_color;
    char str[255];
    char *ptr_boxes, *ptr_painted, *ptr_current;
    int *ptr_pids, *ptr_color, *ptr_order, *ptr_index;

    //Initialize Semaphores
    semid = semget(KEYSEM, 1, IPC_CREAT | 0700);
    semctl(semid, 0, SETVAL, 0);
    semid2 = semget(KEYSEM2, 1, IPC_CREAT | 0700);
    semctl(semid2, 0, SETVAL, 0);

    //If arguements are not well given, break!
    if (argc < 3)
    {
        printf("Do not forget command line arguements!\n");
        exit(1);
    }

    //Color counter
    shmid_color = shmget(KEYSHM7, sizeof(int), IPC_CREAT | 0700);
    ptr_color = (int *)shmat(shmid_color, NULL, 0);
    *ptr_color = 1;
    shmdt(ptr_color);

    //Global Index Variable in order to hold the order of the process to start its action
    shmid_index = shmget(KEYSHM6, sizeof(int), IPC_CREAT | 0700);
    ptr_index = (int *)shmat(shmid_index, NULL, 0);
    *ptr_index = 0;
    shmdt(ptr_index);

    //Opening the file
    FILE *inFile = fopen(argv[1], "r");
    fscanf(inFile, "%d", &box_num);
    //printf("%d\n" , box_num);

    //Get some place from the shared memory location for the Boxes Array
    shmid_boxes = shmget(KEYSHM1, box_num * sizeof(char), IPC_CREAT | 0700);
    ptr_boxes = (char *)shmat(shmid_boxes, NULL, 0);

    for (int i = 0; i < box_num; i++)
    {
        fscanf(inFile, "%s", str);
        *(ptr_boxes + i) = str[0];
    }

    //Closing the file
    fclose(inFile);

    //Setting the Current Color as the first Box's Color
    shmid_current = shmget(KEYSHM3, sizeof(char), IPC_CREAT | 0700);
    ptr_current = (char *)shmat(shmid_current, NULL, 0);
    *ptr_current = ptr_boxes[0];
    shmdt(ptr_current);
    shmdt(ptr_boxes);

    //Shared Memory Painted Array Initialization
    shmid_painted = shmget(KEYSHM2, box_num * sizeof(char), IPC_CREAT | 0700);
    ptr_painted = shmat(shmid_painted, NULL, 0);

    for (int i = 0; i < box_num; i++)
    {
        ptr_painted[i] = '-';
    }
    shmdt(ptr_painted);

    //Initialize PIDs Array
    shmid_pids = shmget(KEYSHM4, box_num * sizeof(int), IPC_CREAT | 0700);
    ptr_pids = (int *)shmat(shmid_pids, NULL, 0);
    for (int i = 0; i < box_num; i++)
    {
        ptr_pids[i] = 0;
    }
    shmdt(ptr_pids);

    shmid_order = shmget(KEYSHM5, sizeof(int), IPC_CREAT | 0700);
    ptr_order = (int *)shmat(shmid_order, NULL, 0);
    *ptr_order = 0;
    shmdt(ptr_order);

    //Create Children
    for (int i = 0; i < box_num; i++)
    {
        f = fork();
        index = i;
        if (f == 0)
            break;
        //printf("Child %d created.\n", index);
    }

    //PARENT
    if (f > 0)
    {
        sem_wait(semid, box_num);
        ptr_painted = (char *)shmat(shmid_painted, NULL, 0);
        ptr_pids = (int *)shmat(shmid_pids, NULL, 0);
        ptr_color = (int *)shmat(shmid_color, NULL, 0);

        FILE *outFile = fopen(argv[2], "w+");

        int painted_arr[box_num];
        int pids_arr[box_num];

        printf("Color Counter: %d\n" , *ptr_color);
        for (int i = 0; i < box_num; i++)
        {
            //printf("PID = %d ", ptr_pids[i]);
            //printf("Painted: %c\n", ptr_painted[i]);
            painted_arr[i] = ptr_pids[i];
            pids_arr[i] = ptr_painted[i];
        }

        fprintf(outFile, "%d\n" , *ptr_color);
        for (int i = 0; i < box_num; i++)
        {
            fprintf(outFile, "%d %c\n", ptr_pids[i], ptr_painted[i]);
        }

        fclose(outFile);

        shmdt(ptr_painted);
        shmdt(ptr_pids);
        shmdt(ptr_color);

        //Delete semaphore
        shmctl(semid, IPC_RMID, 0);
        //Delete the places taken from the shared memory
        shmctl(shmid_boxes, IPC_RMID, 0);
        shmctl(shmid_painted, IPC_RMID, 0);
        shmctl(shmid_current, IPC_RMID, 0);
        shmctl(shmid_pids, IPC_RMID, 0);
        shmctl(shmid_order, IPC_RMID, 0);
        shmctl(shmid_index, IPC_RMID, 0);
        shmctl(shmid_color, IPC_RMID, 0);
    }
    //CHILDREN
    else if (f == 0)
    {
        //Wait for the turn
        ptr_index = (int *)shmat(shmid_index, NULL, 0);
        while (index != *ptr_index)
            ;

        //Attach necessary pointers
        ptr_boxes = (char *)shmat(shmid_boxes, NULL, 0);
        ptr_painted = (char *)shmat(shmid_painted, NULL, 0);
        ptr_current = (char *)shmat(shmid_current, NULL, 0);
        ptr_pids = (int *)shmat(shmid_pids, NULL, 0);
        ptr_order = (int *)shmat(shmid_order, NULL, 0);
        ptr_color = (int *)shmat(shmid_color, NULL, 0);

        //Wait according to the color
        if (ptr_boxes[index] == 'R' || ptr_boxes[index] == 'Y' || ptr_boxes[index] == 'P')
            sleep(1);
        else
            sleep(2);

        printf("ID: %d Color: %c\n", getpid(), ptr_boxes[index]);

        ptr_painted[*ptr_order] = ptr_boxes[index];
        ptr_pids[*ptr_order] = getpid();
        ptr_boxes[index] = '-';
        *ptr_order += 1;

        //printf("My Index: %d\n", index);

        int next_index = 0;
        int flag = 0;
        //printf("Current ptr = %c\n" , *ptr_current);

        //printf("Ptr boxes = %c, Ptr current = %c\n" , ptr_boxes[index], *ptr_current);
        //Traverse the list, if any of them have the same color, next process should be the one having that index
        for (int i = 0; i < box_num; i++)
        {
            if (ptr_boxes[i] == *ptr_current)
            {
                next_index = i;
                flag = 1;
                break;
            }
        }
        //If no boxes have the same color, find the first color different than - symbol
        if (flag == 0)
        {
            for (int i = 0; i < box_num; i++)
            {
                if (ptr_boxes[i] != '-')
                {
                    next_index = i;
                    *ptr_current = ptr_boxes[i];
                    *ptr_color += 1;
                    break;
                }
            }
        }

        //printf("Next index: %d\n", next_index);

        //Detach pointers
        shmdt(ptr_boxes);
        shmdt(ptr_painted);
        shmdt(ptr_current);
        shmdt(ptr_pids);
        shmdt(ptr_order);
        shmdt(ptr_color);
        sem_signal(semid, 1);
        *ptr_index = next_index;
        shmdt(ptr_index);
    }

    else
    {
        printf("Error while creating the children!\n");
        return 0;
    }

    return 0;
}
