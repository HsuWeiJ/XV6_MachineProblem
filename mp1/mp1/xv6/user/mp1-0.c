#include "kernel/types.h"
#include "user/user.h"
#include "user/threads.h"

#define NULL 0
#define DEBUG 1
void f3(void *arg)
{
    int i = 10000;
    while (1) {
        printf("thread 3: %d\n", i++);
        if(i == 10005){
            thread_exit();
        }
        thread_yield();
    }
}

void f2(void *arg)
{
    int i = 0;
    while(1) {
        printf("thread 2: %d\n",i++);
        if (i == 10) {
            thread_exit();
        }
        thread_yield();
    }
}

void f1(void *arg)
{
    int i = 100;
#if DEBUG
    struct thread *t2 = thread_create(f2, NULL);
    thread_add_runqueue(t2);

    struct thread *t3 = thread_create(f3, NULL);
    thread_add_runqueue(t3);
#endif
    while(1) {
        printf("thread 1: %d\n", i++);
        //printf("thread 1 arg: %d\n", *(int *)arg);
        if (i == 110) {
            thread_exit();
        }
        thread_yield();
    }
}

int main(int argc, char **argv)
{
    int a=5;
    int *b=&a;
    printf("mp1-0\n");
    struct thread *t1 = thread_create(f1, b);
    thread_add_runqueue(t1);
    thread_start_threading();
    printf("\nexited\n");
    exit(0);
}
