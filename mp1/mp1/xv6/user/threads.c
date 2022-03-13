#include "kernel/types.h"
#include "user/setjmp.h"
#include "user/threads.h"
#include "user/user.h"
#define NULL 0

static struct thread* current_thread = NULL;
static struct thread* root_thread = NULL;
static int id = 1;
static jmp_buf env_st;
//static jmp_buf env_tmp;
// TODO: necessary declares, if any


struct thread *thread_create(void (*f)(void *), void *arg){
    struct thread *t = (struct thread*) malloc(sizeof(struct thread));
    //unsigned long stack_p = 0;
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long) malloc(sizeof(unsigned long)*0x100);
    new_stack_p = new_stack +0x100*8-0x2*8;
    t->fp = f;
    t->arg = arg;
    t->ID  = id;
    t->buf_set = 0;
    t->stack = (void*) new_stack;
    t->stack_p = (void*) new_stack_p;
    id++;
    return t;
}
void thread_add_runqueue(struct thread *t){
    if(current_thread == NULL){
        // TODO
        current_thread=t;
        root_thread=t;
        t->left=NULL;
        t->right=NULL;
        t->parent=NULL;
    }
    else{
        // TODO
        if(current_thread->left != NULL && current_thread->right != NULL)
        {
            free(t);
        }
        else
        {
            if(current_thread->left==NULL)
            {
                current_thread->left=t;
            }
            else if(current_thread->right==NULL)
            {   
                current_thread->right=t;
            }
            t->parent=current_thread;
            t->left=NULL;
            t->right=NULL;
        }
        

    }
}
void thread_yield(void){
    // TODO
    setjmp(current_thread->env);
    schedule();
    dispatch();
}
void dispatch(void){
    // TODO
    if(current_thread->buf_set==0)
    {      
        if(setjmp(current_thread->env)==0)
        {
            current_thread->env->sp=(unsigned long)current_thread->stack_p;
            current_thread->env->ra=(unsigned long)current_thread->fp;
            current_thread->buf_set=1;
        }
        longjmp(current_thread->env,1);
        
    }
    else
    {
        longjmp(current_thread->env,1);
    }
}
void schedule(void){
    // TODO
    if(current_thread->left != NULL)
    {
        current_thread = current_thread->left;
    }
    else if(current_thread->left ==NULL && current_thread->parent->right!=NULL)
    {
        if(current_thread != current_thread->parent->right)
            current_thread = current_thread->parent->right;
        else if(current_thread == current_thread->parent->right)
        {
            current_thread=current_thread->parent;
            while(current_thread == current_thread->parent->right)
                current_thread=current_thread->parent->left;
            if(current_thread!=root_thread)
            {
                while(current_thread->parent->right==NULL && current_thread!=root_thread)
                    current_thread=current_thread->parent;
                if(current_thread!=root_thread)
                    current_thread=current_thread->parent->right;
            }

        }
    }
    else if(current_thread->left ==NULL && current_thread->parent->right ==NULL)
    {
        while(current_thread->parent->right==NULL && current_thread!=root_thread)
            current_thread=current_thread->parent;
        if(current_thread!=root_thread)
            current_thread = current_thread->parent->right; 
    }
}
void thread_exit(void){
    if(current_thread == root_thread && current_thread->left == NULL && current_thread->right == NULL){
        // TODO
        // Hint: No more thread to execute
        //free(current_thread->env->sp);
        free(current_thread);
        current_thread=NULL;
        root_thread=NULL;
        longjmp(env_st,1);
    }
    else{
        // TODO
        struct thread * cur= current_thread;
        struct thread * epr=exit_preorder(current_thread);
        if(epr == epr->parent->left)
            epr->parent->left=NULL;
        else if(epr == epr->parent->right)
            epr->parent->right=NULL;
        if(cur == root_thread)
            root_thread = epr;
        else
            epr->parent=cur->parent;
        epr->left=cur->left;
        epr->right=cur->right;
        if(cur == cur->parent->left)
            cur->parent->left=epr;
        else if (cur == cur->parent->right)
            cur->parent->right=epr;
        current_thread=epr;
        //free(cur->env->sp);
        free(cur);
        schedule();
        dispatch();
        
    }
}

struct thread * exit_preorder(struct thread *t)
{

    if(t->left ==NULL && t->right==NULL)
    {
        return t;
    }
    else if(t->right!=NULL)
    {
        struct thread * cur=t->right;
        while(cur->right!=NULL)
            cur=cur->right;
        return (struct thread *)exit_preorder(cur);
    }
    else if(t->right==NULL && t->left!=NULL)
    {
        return (struct thread *)exit_preorder(t->left);
    }
    return t;
}
void thread_start_threading(void){
    // TODO
    setjmp(env_st);
    if(setjmp(current_thread->env)==0)
    {
        current_thread->env->sp=(unsigned long)current_thread->stack_p;
        current_thread->env->ra=(unsigned long)current_thread->fp;
        current_thread->buf_set=1;
    }
    longjmp(current_thread->env,1);
}
