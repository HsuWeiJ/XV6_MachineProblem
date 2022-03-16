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
static volatile int pre_flag=0;
static struct thread* ex_pre_end = NULL;
static volatile int ex_pre_flag=0;

struct thread *thread_create(void (*f)(void *), void *arg){
    struct thread *t = (struct thread*) malloc(sizeof(struct thread));
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
            free(t->stack);
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
    if(setjmp(current_thread->env)==0)
    {
        
        schedule();
        dispatch();
        //current_thread->fp(current_thread->arg);
    }
    else 
        return; 
    
    
}
void dispatch(void){
    // TODO
    if(current_thread->buf_set==0)
    {   
        if(setjmp(current_thread->env)==0)
        {
            current_thread->env->sp=(unsigned long)current_thread->stack_p;
            //current_thread->env->ra=(unsigned long)current_thread->fp;
            current_thread->buf_set=1;
        }
        
        else
            current_thread->fp(current_thread->arg); 
        longjmp(current_thread->env,1);
        //current_thread->fp(current_thread->arg); 
        
    }
    else 
    {
        //current_thread->fp(current_thread->arg);
        longjmp(current_thread->env,1);

    }
}
void schedule(void){
    // TODO

    schedule_preorder(root_thread);

    if(pre_flag==1)
    {
        pre_flag=0;
        current_thread=root_thread;

    }
    
}
void schedule_preorder(struct thread* root )
{
    if(root!=NULL)
    {

        if(root == current_thread)
        {
            pre_flag=1;
        }
        else if(pre_flag==1)
        {
            pre_flag=0;
            current_thread=root;
            return;
        }
        
        schedule_preorder(root->left);
        schedule_preorder(root->right);
    }
    
}
void thread_exit(void){
    if(current_thread == root_thread && current_thread->left == NULL && current_thread->right == NULL){
        // TODO
        // Hint: No more thread to execute
        //free(current_thread->env->sp);
        free(current_thread->stack);
        free(current_thread);
        current_thread=NULL;
        root_thread=NULL;
        longjmp(env_st,1);
    }
    else{
        // TODO
        struct thread * cur= current_thread;
        ex_pre_end=NULL;
        exit_preorder(current_thread);

        if(ex_pre_end==current_thread)
        {
            schedule();
            if(ex_pre_end == ex_pre_end->parent->left)
                ex_pre_end->parent->left=NULL;
            else if(ex_pre_end == ex_pre_end->parent->right)
                ex_pre_end->parent->right=NULL;

            free(ex_pre_end->stack);
            free(ex_pre_end);
            dispatch();
        }
        else
        {
            if(ex_pre_end == ex_pre_end->parent->left)
                ex_pre_end->parent->left=NULL;
            else if(ex_pre_end == ex_pre_end->parent->right)
                ex_pre_end->parent->right=NULL;
            if(ex_pre_end==current_thread->left) ex_pre_end->left=NULL;
            else ex_pre_end->left=current_thread->left;
            if(ex_pre_end==current_thread->right) ex_pre_end->right =NULL;
            else ex_pre_end->right=current_thread->right;
            if(cur == root_thread)
            {              
                ex_pre_end->parent=NULL;
                
                if(current_thread->left!=NULL)
                    current_thread->left->parent=ex_pre_end;
                if(current_thread->right!=NULL)
                    current_thread->right->parent=ex_pre_end;
                current_thread=ex_pre_end;
                root_thread = ex_pre_end;
                root_thread->parent=NULL;

                
            }              
            else
            {
                ex_pre_end->parent=current_thread->parent;
                
                if(current_thread == current_thread->parent->left)
                    current_thread->parent->left=ex_pre_end;
                else if (current_thread == current_thread->parent->right)
                    current_thread->parent->right=ex_pre_end;
                if(current_thread->left!=NULL)
                    current_thread->left->parent=ex_pre_end;
                if(current_thread->right!=NULL)
                    current_thread->right->parent=ex_pre_end;
                current_thread=ex_pre_end;
            }

            free(cur->stack);
            free(cur);
            schedule();


            dispatch();
        }
        

        
    }

}

void exit_preorder(struct thread *t)
{
    if(t!=NULL)
    {
        if(t==current_thread && t->left==NULL && t->right==NULL)
        {
            ex_pre_end=t;
            return;
        }   
        ex_pre_end=t;
        
        exit_preorder(t->left);
        exit_preorder(t->right);
    }

}
void thread_start_threading(void){
    // TODO
    if(setjmp(env_st)==0);
    else 
        return;
    dispatch();

    
}
