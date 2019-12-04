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

#define k_key 1
#define n_key 2
#define L_key 3
#define RL_key 4
#define SEM_key 5


void sem_signal(int semid, int val) {
    struct sembuf semaphore;
    semaphore.sem_num = 0;
    semaphore.sem_op = val;
    semaphore.sem_flg = 1;
    semop(semid, &semaphore, 1);
}

void sem_wait(int semid, int val) {
    struct sembuf semaphore;
    semaphore.sem_num = 0;
    semaphore.sem_op = -val;
    semaphore.sem_flg = 1;
    semop(semid, &semaphore, 1);
}

int main(int argc, char **argv) {
    
    int shmid_n, shmid_k, shmid_L, shmid_RL;
    int semaphore;
    int *ptr;
    int n, k, f, i, j;

    //Get n and k as command line arguments
    n = atoi(argv[1]);
    k = atoi(argv[2]);
    //printf("%d  %d" , n , k);


    if (n % k != 0) {
        printf("Enter valid numbers!");
        exit(1);
    }


    //Shared place for n
    shmid_n = shmget(n_key, sizeof(int), 0700|IPC_CREAT);
    ptr = (int *) shmat(shmid_n, NULL, 0);
    *ptr = n;
    shmdt(ptr);

    //Shared place for k
    shmid_k = shmget(k_key, sizeof(int), 0700|IPC_CREAT);
    ptr = (int *) shmat(shmid_k, NULL, 0);
    *ptr = k;
    shmdt(ptr);


    srand(time(NULL));
    //Shared place for List
    shmid_L = shmget(L_key, sizeof(int) * n, 0700|IPC_CREAT);
    ptr = (int *) shmat(shmid_L, NULL, 0);
    for (i = 0; i < n; i++) {
        ptr[i] = rand() % 1000;
        printf("%d ", ptr[i]);
    }
    printf("\n");
    shmdt(ptr);

    //Shared place for Result List
    shmid_RL = shmget(RL_key, sizeof(int) * k, 0700|IPC_CREAT);

    //Semaphore in order to make parent wait for all children to finish their jobs
    semaphore = semget(SEM_key, 1, IPC_CREAT|0700);
    semctl(semaphore, 0, SETVAL, 0);

    f = 1;
    for(i=0;i<k;i++){
		if(f>0){
			f=fork();
		}
		if(f==-1){
			printf("Error while forking!\n");
			exit(1);		
		}
		if(f==0){
            break;      
		}
	}

    //PARENT
    if(f>0){
        //Wait for the children to finish their jobs
        sem_wait(semaphore, k);

        //Get RL from shared memory
        ptr = (int *) shmat(shmid_RL, NULL, 0);

        int max_final = ptr[0];
        for(int j=0; j<k; j++){
            if(max_final < ptr[j]) max_final = ptr[j];
        }

        shmdt(ptr);

        printf("Maximum Number: %d\n" , max_final);

        shmctl(shmid_n, IPC_RMID, 0);
        shmctl(shmid_k, IPC_RMID, 0);
        shmctl(shmid_L, IPC_RMID, 0);
        shmctl(shmid_RL, IPC_RMID, 0);
        semctl(semaphore, 0, IPC_RMID, 0);
    }

    //CHILDREN
    else{
        int child_order = i;
        int child_index = i;

        //Child index from i * (n / k) to (i * n / k) + (n / k)

        //Get n
        ptr = (int *) shmat(shmid_n, NULL, 0);
        child_index *= *ptr;
        shmdt(ptr);

        //Get k
        ptr = (int *) shmat(shmid_k, NULL, 0);
        child_index /= *ptr;
        shmdt(ptr);

        //Get List
        ptr = (int *) shmat(shmid_L, NULL, 0);
        int max = ptr[child_index];
        for(int j = child_index; j < child_index + n/k; j++){
            if(max < ptr[j]) max = ptr[j];
        }

        shmdt(ptr);

        printf("Max from children %d: %d\n", child_order + 1 , max);

        ptr = (int *) shmat(shmid_RL, NULL, 0);
        ptr[child_order] = max;

        shmdt(ptr);
        
        //Increment Semaphore by 1
        sem_signal(semaphore, 1);

    }



    return 0;
}