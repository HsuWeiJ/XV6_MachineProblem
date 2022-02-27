#include "kernel/types.h"

#include "kernel/fs.h"
#include "kernel/stat.h"
#include "user/user.h"

#define DEBUG 0

static int filecnt=0;
static int dircnt=0;
static char * pathoffset;

int filenamesize(char * path)
{
  char *p=path;
  int size=0;
  while(*p != ' ')
  {
    p++;
    size++;
  }
  return size;
    
}
char*
fmtname(char *path)
{
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)		//只取'/'後面的檔名
    ;
  p++;

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
    return p;
  memmove(buf, p, strlen(p));								//將p複製到buf，此時p是只有後面檔名
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));				//補空白
  return buf;
}
int FindLevel(char *path, char *buf)
{
    //static char buf[DIRSIZ+1];
    char *p;
    int level=0;
    int offset=strlen(pathoffset);
    // Find first character after last slash.
    for(p=buf+strlen(buf); p >= (buf+offset) ; p--)		//只取'/'後面的檔名
      if(*p =='/')
        level++;
    //printf("strlen(path):%d\n",offset);
    //printf("strlen(buf):%d\n",strlen(buf));
    
    p++;

    // Return blank-padded name.
    /*
    if(strlen(p) >= DIRSIZ)
      return p;
    memmove(buf, p, strlen(p));								//將p複製到buf，此時p是只有後面檔名
    memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));				//補空白
    return buf;
    */
   return level;
}
void
tree(char *path,int line_space)
{
  char buf[512], *p;
  int fd;
  int fd_check;
  struct dirent de;
  struct dirent de_check;
  struct stat st;
  static int i=0;
  static int level=-1;
  int fd_flag;
  static char *filename=0;


  if((fd = open(path, 0)) < 0){
    return;
  }
  fd_check = open(path, 0);
  read(fd_check, &de_check, sizeof(de_check)) ;
  if(fstat(fd, &st) < 0){
    close(fd);
    return;
  }

  switch(st.type){
  case T_FILE:
    filecnt++;
    break;

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
      fprintf(2, "%s [error opening dir]\n", fmtname(path));
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
    *p++ = '/';
    dircnt++;
    while(read(fd, &de, sizeof(de)) == sizeof(de))
    {
      fd_flag=read(fd_check, &de_check, sizeof(de_check) );
        if(de.inum == 0)
          continue;
        memmove(p, de.name, DIRSIZ);
        p[DIRSIZ] = 0;
        if(stat(buf, &st) < 0){
          continue;
        }
        
      
      if(*fmtname(buf) != '.' ) 
      {
        
        level=FindLevel(path,buf);
        for(i=0;i<level;i++)
        {
          if(i==line_space && line_space>=0) 
          {
            printf("    ");
          }
            
          
          else if (i==level-1)
          {
            printf("|");
          }
                      
          else 
          {
            printf("|   ");
          }
            
        }
          
        printf("\n");
        for(i=0;i<level-1;i++)
        {
          if(i==line_space && line_space>=0)
          {
            printf("    ");
          }
            
          else
          {
            printf("|   ");

          }
            
        }
        filename=fmtname(buf);
        filename[filenamesize(fmtname(buf))]='\0';
        //memcpy(filename,fmtname(buf),filenamesize(fmtname(buf)));
        printf("+-- %s\n", filename);
        if(fd_flag != sizeof(de_check))
        {
          if(level>=0)
            level--;
          else
            level =-1;
        }
        else
          level =-1;

        
        tree(buf,level);
        #if DEBUG
          printf("LEN OF BUF: %d\n" ,strlen(fmtname(buf)));
          printf("fmtname(buf): %s\n" ,fmtname(buf));
          printf("*fmtname(buf): %c\n" ,*fmtname(buf));
          printf("*++fmtname(buf): %c\n" ,*(fmtname(buf)+1));
          printf("fmtname(buf)[1]: %c\n" ,fmtname(buf)[1]);
          printf("*++++fmtname(buf): %c\n" ,*(fmtname(buf)+2));
          printf("fmtname size:%d\n",filenamesize(fmtname(buf)));
        #endif
      }
	  	
    }
    break;
  }
  close(fd);
}
int main(int argc, char *argv[]) 
{
    // add your code!
  int  pc2p[2];
  pipe(pc2p);
  int buf=0;
  if(fork() != 0) 
  { // parent process
		
		
		wait(0);
    int buf_1;
    int buf_2;
		read(pc2p[0], &buf_1, sizeof(int)); 
    read(pc2p[0], &buf_2, sizeof(int)); 
    printf("\n%d directories, %d files\n",buf_1,buf_2);
   
   
	} 
  else 
  {   // child process
    if(argc == 2)
    {
          int fd;
      struct stat st;
      char * filename;
      if((fd = open(argv[1], 0)) < 0){
      fprintf(2, "%s [error opening dir]\n", argv[1]);
      dircnt++;
      goto end;
      }

      if(fstat(fd, &st) < 0){
      fprintf(2, "%s [error opening dir]\n", argv[1]);
      close(fd);
      dircnt++;
      goto end;
      }

      switch(st.type){
      case T_FILE:
        filename=fmtname(argv[1]);
        filename[filenamesize(fmtname(argv[1]))]='\0';
        printf("%s [error opening dir]\n", filename);
        dircnt++;
        goto end;
        break;
      case T_DIR:
        printf("%s\n", argv[1]);
        break;
      }
      pathoffset=argv[1];
      tree(argv[1],-1);
      
    
    }
    else
    {
      printf("[error opening dir]\n");
      dircnt++;
      goto end;
    }
    
end: 
    buf=dircnt-1;
    write(pc2p[1], &buf, sizeof(int)); 
    buf=filecnt;
    write(pc2p[1], &buf, sizeof(int)); 
    //char *test=pathoffset;

    #if DEBUG
   
      printf("path:%s \n",pathoffset);
      printf("path+offset:%s \n",test+6);
      printf("len::%d \n",strlen(pathoffset));
     #endif
    exit(0);
	}
	


	exit(0);
		
	
}
