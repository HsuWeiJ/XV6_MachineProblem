// primes.c
#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

// 一次 sieve 调用是一个筛子阶段，会从 pleft 获取并输出一个素数 p，筛除 p 的所有倍数
// 同时创建下一 stage 的进程以及相应输入管道 pright，然后将剩下的数传到下一 stage 处理
void sieve(int pleft[2]) // pleft 是来自该 stage 左端进程的输入管道
{
	int p;
	read(pleft[0],&p,sizeof(int));	// 读第一个数，必然是素数
	if(p==-1)						// 如果是哨兵 -1，则代表所有数字处理完毕，退出程序
		exit(0);
	printf("prime : %d\n",p);

	int pright[2];
	pipe(pright);					// 创建用于输出到下一 stage 的进程的输出管道 pright

	if(fork()!=0)
	{
		// 父进程 （当前 stage）
		close(pright[0]);			// 同上，父进程只需要对子进程的输入管道进行写而不需要读，所以关掉父进程的读文件描述符
		int buf;
		while(read(pleft[0],&buf,sizeof(int)) && buf!=-1)
		{
			if(buf % p !=0)
			{
				write(pright[1],&buf,sizeof(int));
			}
		}
		buf=-1;
		write(pright[1],&buf,sizeof(int));
		wait(0);
		exit(0);					// 等待该进程的子进程完成，也就是下一 stage
	}
	else
	{
		// 子进程 （下一个 stage）
		close(pright[1]);
		close (pleft[0]);
		sieve(pright);	
	}
}
int main(int argc, char **argv) 
{
	// 主进程
	int input_pipe[2];
	pipe(input_pipe);	// 准备好输入管道，输入 2 到 35 之间的所有整数。

	if(fork()!=0)		//parent process
	{
		close(input_pipe[0]);	//no need to write in parent process
		int i;
		for(i=2;i<=35;i++)
		{
			write(input_pipe[1],&i,sizeof(int));
		}
		i=-1;
		write(input_pipe[1],&i,sizeof(int)); 	// 末尾输入 -1，用于标识输入完成
	}
	else
	{
		// 第一个 stage 的子进程
		close(input_pipe[1]);
		sieve(input_pipe);
		exit(0);
	}
	wait(0);
	exit(0);
}
