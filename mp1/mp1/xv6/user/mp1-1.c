#include "kernel/types.h"
#include "user/user.h"
#include "user/threads.h"

#define NULL 0
#define DEBUG 1
#define SCHEDULE_DEBUG 0
#define EXTRA 0

int test_flag=0;
struct thread *t1;

#if EXTRA
void f6(void *arg)
{
    int i = 100;
    while(1) {
        printf("thread 6: %d\n", i++);
        if (i == 112) {
            thread_exit();
        }
        thread_yield();
    }
}
void f7(void *arg)
{
    int i = 1000;
    while(1) {
        printf("thread 7: %d\n", i++);
        if (i == 1015) {
            thread_exit();
        }
        thread_yield();
    }
}
#endif

void f5(void *arg)
{
    int i = 10;
    while(1) {
        printf("thread 5: %d\n", i++);
        if (i == 17) {
            thread_exit();
        }
        thread_yield();
    }
}

void f4(void *arg)
{
    int i = 1000;

    while(1) {
        printf("thread 4: %d\n", i++);
#if SCHEDULE_DEBUG
        schedule_preorder(t1);
#endif
        if (i == 1011) {
            thread_exit();
        }
        thread_yield();
    }
}

void f3(void *arg)
{
    int i = 10000;
#if DEBUG
    struct thread *t4 = thread_create(f4, NULL);
    thread_add_runqueue(t4);
    struct thread *t5 = thread_create(f5, NULL);
    thread_add_runqueue(t5);
#endif
    while(1) {
        printf("thread 3: %d\n", i++);
        if (i == 10003) 
        {
#if SCHEDULE_DEBUG
            test_flag=1;
#endif
            thread_exit();
        }
        thread_yield();
    }
}

void f2(void *arg)
{
    int i = 0;
#if EXTRA
    struct thread *t6 = thread_create(f6, NULL);
    thread_add_runqueue(t6);
    struct thread *t7 = thread_create(f7, NULL);
    thread_add_runqueue(t7);
#endif
    while(1) {
        printf("thread 2: %d\n", i++);
        if (i == 9) {
            thread_exit();
        }
        thread_yield();
    }
}

void f1(void *arg)
{
    int i = 100;

    struct thread *t2 = thread_create(f2, NULL);
    thread_add_runqueue(t2);
    struct thread *t3 = thread_create(f3, NULL);
    thread_add_runqueue(t3);
    
    while(1) {
        printf("thread 1: %d\n", i++);
        if (i == 105) {
            thread_exit();
        }
        thread_yield();
    }
}

int main(int argc, char **argv)
{
    printf("mp1-1\n");
    t1 = thread_create(f1, NULL);
    thread_add_runqueue(t1);
    thread_start_threading();
    printf("\nexited\n");
    exit(0);
}
