#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <sys/sem.h>

#define SEMKEY 100

int k, n;
int semid;
int *L;
int *RL;
int *order;

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

void *child_op(void *order){
    printf("In Order: %d\n", *((int*) order));
    int thread_order = *((int*) order);
    //printf("**thread order %d ***\n" , thread_order);
    int max = L[thread_order * n / k ];
    int i;
        for(int i = thread_order * n / k; i < thread_order * n / k + n/k; i++){
            if(max < L[i]) max = L[i];
        }
    RL[thread_order] = max;
    //printf("Child %d found max as : %d\n" , thread_order, max);
    sem_signal(semid, 1);
    pthread_exit(NULL);
}

int main(int argc, char **argv){
    int i;

    if (argc < 3) {
        exit(1);
    }

    n = atoi(argv[1]);
    k = atoi(argv[2]);

    if (n % k != 0) {
        exit(1);
    }
        
    srand(time(NULL));
    L = (int *)malloc(sizeof(int) * n);
    for(int i = 0; i<n; i++){
        L[i] = rand() % 1000;
    }

    RL = (int *)malloc(sizeof(int) * k);

    pthread_t *thread_arr;

    thread_arr = (pthread_t *)malloc(sizeof(pthread_t) * k);
    
    semid = semget(SEMKEY, 1, IPC_CREAT|0700);
    semctl(semid, 0, 0);

    order = (int *) malloc(sizeof(int));

    for(int i = 0; i<k; i++){
        *order = i;
        printf("Order: %d\n", *order);
        pthread_create(&thread_arr[i] , NULL, child_op, (void *) order);
        //printf("After Order: %d\n", *order);
    }
    

    sem_wait(semid, k);
    sleep(1);
    
    int max_final = RL[0];
    for(int i=0; i<k; i++){
        if(max_final < RL[i]) max_final = RL[i];
    }

    printf("Maximum Number: %d\n" , max_final);




    pthread_exit(NULL);
    return 0;
}