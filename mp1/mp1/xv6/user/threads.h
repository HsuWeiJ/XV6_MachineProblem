#ifndef THREADS_H_
#define THREADS_H_

// TODO: necessary includes, if any
#include "kernel/types.h"
#include "kernel/fs.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "user/setjmp.h"
// TODO: necessary defines, if any
#define NULL 0


struct thread {
    void (*fp)(void *arg);
    void *arg;
    void *stack;
    void *stack_p;
    jmp_buf env;
    int ID;
    int buf_set; //1: indicate jmp_buf has been set, 0: indicate jmp_buf not set
    struct thread *left;
    struct thread *right;
    struct thread *parent;
};

struct thread *thread_create(void (*f)(void *), void *arg);
void thread_add_runqueue(struct thread *t);
void thread_yield(void);
void dispatch(void);
void schedule(void);
void thread_exit(void);
void thread_start_threading(void);
void schedule_preorder(struct thread* root);
void exit_preorder(struct thread *t);

#endif // THREADS_H_
