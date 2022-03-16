
user/_mp1-1:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <f5>:
    }
}
#endif

void f5(void *arg)
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	e052                	sd	s4,0(sp)
   e:	1800                	addi	s0,sp,48
    int i = 10;
    while(1) {
        printf("thread 5: %d\n", i++);
  10:	45a9                	li	a1,10
  12:	00001517          	auipc	a0,0x1
  16:	ec650513          	addi	a0,a0,-314 # ed8 <thread_start_threading+0x2e>
  1a:	00001097          	auipc	ra,0x1
  1e:	85e080e7          	jalr	-1954(ra) # 878 <printf>
  22:	44ad                	li	s1,11
  24:	00001a17          	auipc	s4,0x1
  28:	eb4a0a13          	addi	s4,s4,-332 # ed8 <thread_start_threading+0x2e>
        if (i == 17) {
  2c:	49c5                	li	s3,17
  2e:	a011                	j	32 <f5+0x32>
        printf("thread 5: %d\n", i++);
  30:	84ca                	mv	s1,s2
            thread_exit();
        }
        thread_yield();
  32:	00001097          	auipc	ra,0x1
  36:	c4e080e7          	jalr	-946(ra) # c80 <thread_yield>
        printf("thread 5: %d\n", i++);
  3a:	0014891b          	addiw	s2,s1,1
  3e:	85a6                	mv	a1,s1
  40:	8552                	mv	a0,s4
  42:	00001097          	auipc	ra,0x1
  46:	836080e7          	jalr	-1994(ra) # 878 <printf>
        if (i == 17) {
  4a:	ff3913e3          	bne	s2,s3,30 <f5+0x30>
            thread_exit();
  4e:	00001097          	auipc	ra,0x1
  52:	cbe080e7          	jalr	-834(ra) # d0c <thread_exit>
  56:	bfe9                	j	30 <f5+0x30>

0000000000000058 <f4>:
    }
}

void f4(void *arg)
{
  58:	7179                	addi	sp,sp,-48
  5a:	f406                	sd	ra,40(sp)
  5c:	f022                	sd	s0,32(sp)
  5e:	ec26                	sd	s1,24(sp)
  60:	e84a                	sd	s2,16(sp)
  62:	e44e                	sd	s3,8(sp)
  64:	e052                	sd	s4,0(sp)
  66:	1800                	addi	s0,sp,48
    int i = 1000;

    while(1) {
        printf("thread 4: %d\n", i++);
  68:	3e800593          	li	a1,1000
  6c:	00001517          	auipc	a0,0x1
  70:	e7c50513          	addi	a0,a0,-388 # ee8 <thread_start_threading+0x3e>
  74:	00001097          	auipc	ra,0x1
  78:	804080e7          	jalr	-2044(ra) # 878 <printf>
  7c:	3e900493          	li	s1,1001
  80:	00001a17          	auipc	s4,0x1
  84:	e68a0a13          	addi	s4,s4,-408 # ee8 <thread_start_threading+0x3e>
#if SCHEDULE_DEBUG
        schedule_preorder(t1);
#endif
        if (i == 1011) {
  88:	3f300993          	li	s3,1011
  8c:	a011                	j	90 <f4+0x38>
        printf("thread 4: %d\n", i++);
  8e:	84ca                	mv	s1,s2
            thread_exit();
        }
        thread_yield();
  90:	00001097          	auipc	ra,0x1
  94:	bf0080e7          	jalr	-1040(ra) # c80 <thread_yield>
        printf("thread 4: %d\n", i++);
  98:	0014891b          	addiw	s2,s1,1
  9c:	85a6                	mv	a1,s1
  9e:	8552                	mv	a0,s4
  a0:	00000097          	auipc	ra,0x0
  a4:	7d8080e7          	jalr	2008(ra) # 878 <printf>
        if (i == 1011) {
  a8:	ff3913e3          	bne	s2,s3,8e <f4+0x36>
            thread_exit();
  ac:	00001097          	auipc	ra,0x1
  b0:	c60080e7          	jalr	-928(ra) # d0c <thread_exit>
  b4:	bfe9                	j	8e <f4+0x36>

00000000000000b6 <f2>:
        thread_yield();
    }
}

void f2(void *arg)
{
  b6:	7179                	addi	sp,sp,-48
  b8:	f406                	sd	ra,40(sp)
  ba:	f022                	sd	s0,32(sp)
  bc:	ec26                	sd	s1,24(sp)
  be:	e84a                	sd	s2,16(sp)
  c0:	e44e                	sd	s3,8(sp)
  c2:	e052                	sd	s4,0(sp)
  c4:	1800                	addi	s0,sp,48
    thread_add_runqueue(t6);
    struct thread *t7 = thread_create(f7, NULL);
    thread_add_runqueue(t7);
#endif
    while(1) {
        printf("thread 2: %d\n", i++);
  c6:	4581                	li	a1,0
  c8:	00001517          	auipc	a0,0x1
  cc:	e3050513          	addi	a0,a0,-464 # ef8 <thread_start_threading+0x4e>
  d0:	00000097          	auipc	ra,0x0
  d4:	7a8080e7          	jalr	1960(ra) # 878 <printf>
  d8:	4485                	li	s1,1
  da:	00001a17          	auipc	s4,0x1
  de:	e1ea0a13          	addi	s4,s4,-482 # ef8 <thread_start_threading+0x4e>
        if (i == 9) {
  e2:	49a5                	li	s3,9
  e4:	a011                	j	e8 <f2+0x32>
        printf("thread 2: %d\n", i++);
  e6:	84ca                	mv	s1,s2
            thread_exit();
        }
        thread_yield();
  e8:	00001097          	auipc	ra,0x1
  ec:	b98080e7          	jalr	-1128(ra) # c80 <thread_yield>
        printf("thread 2: %d\n", i++);
  f0:	0014891b          	addiw	s2,s1,1
  f4:	85a6                	mv	a1,s1
  f6:	8552                	mv	a0,s4
  f8:	00000097          	auipc	ra,0x0
  fc:	780080e7          	jalr	1920(ra) # 878 <printf>
        if (i == 9) {
 100:	ff3913e3          	bne	s2,s3,e6 <f2+0x30>
            thread_exit();
 104:	00001097          	auipc	ra,0x1
 108:	c08080e7          	jalr	-1016(ra) # d0c <thread_exit>
 10c:	bfe9                	j	e6 <f2+0x30>

000000000000010e <f3>:
{
 10e:	7179                	addi	sp,sp,-48
 110:	f406                	sd	ra,40(sp)
 112:	f022                	sd	s0,32(sp)
 114:	ec26                	sd	s1,24(sp)
 116:	e84a                	sd	s2,16(sp)
 118:	e44e                	sd	s3,8(sp)
 11a:	e052                	sd	s4,0(sp)
 11c:	1800                	addi	s0,sp,48
    struct thread *t4 = thread_create(f4, NULL);
 11e:	4581                	li	a1,0
 120:	00000517          	auipc	a0,0x0
 124:	f3850513          	addi	a0,a0,-200 # 58 <f4>
 128:	00001097          	auipc	ra,0x1
 12c:	968080e7          	jalr	-1688(ra) # a90 <thread_create>
    thread_add_runqueue(t4);
 130:	00001097          	auipc	ra,0x1
 134:	9c4080e7          	jalr	-1596(ra) # af4 <thread_add_runqueue>
    struct thread *t5 = thread_create(f5, NULL);
 138:	4581                	li	a1,0
 13a:	00000517          	auipc	a0,0x0
 13e:	ec650513          	addi	a0,a0,-314 # 0 <f5>
 142:	00001097          	auipc	ra,0x1
 146:	94e080e7          	jalr	-1714(ra) # a90 <thread_create>
    thread_add_runqueue(t5);
 14a:	00001097          	auipc	ra,0x1
 14e:	9aa080e7          	jalr	-1622(ra) # af4 <thread_add_runqueue>
        printf("thread 3: %d\n", i++);
 152:	6489                	lui	s1,0x2
 154:	71048593          	addi	a1,s1,1808 # 2710 <__global_pointer$+0xfb7>
 158:	00001517          	auipc	a0,0x1
 15c:	db050513          	addi	a0,a0,-592 # f08 <thread_start_threading+0x5e>
 160:	00000097          	auipc	ra,0x0
 164:	718080e7          	jalr	1816(ra) # 878 <printf>
 168:	71148493          	addi	s1,s1,1809
 16c:	00001a17          	auipc	s4,0x1
 170:	d9ca0a13          	addi	s4,s4,-612 # f08 <thread_start_threading+0x5e>
        if (i == 10003) 
 174:	6989                	lui	s3,0x2
 176:	71398993          	addi	s3,s3,1811 # 2713 <__global_pointer$+0xfba>
 17a:	a011                	j	17e <f3+0x70>
        printf("thread 3: %d\n", i++);
 17c:	84ca                	mv	s1,s2
        thread_yield();
 17e:	00001097          	auipc	ra,0x1
 182:	b02080e7          	jalr	-1278(ra) # c80 <thread_yield>
        printf("thread 3: %d\n", i++);
 186:	0014891b          	addiw	s2,s1,1
 18a:	85a6                	mv	a1,s1
 18c:	8552                	mv	a0,s4
 18e:	00000097          	auipc	ra,0x0
 192:	6ea080e7          	jalr	1770(ra) # 878 <printf>
        if (i == 10003) 
 196:	ff3913e3          	bne	s2,s3,17c <f3+0x6e>
            thread_exit();
 19a:	00001097          	auipc	ra,0x1
 19e:	b72080e7          	jalr	-1166(ra) # d0c <thread_exit>
 1a2:	bfe9                	j	17c <f3+0x6e>

00000000000001a4 <f1>:
    }
}

void f1(void *arg)
{
 1a4:	7179                	addi	sp,sp,-48
 1a6:	f406                	sd	ra,40(sp)
 1a8:	f022                	sd	s0,32(sp)
 1aa:	ec26                	sd	s1,24(sp)
 1ac:	e84a                	sd	s2,16(sp)
 1ae:	e44e                	sd	s3,8(sp)
 1b0:	e052                	sd	s4,0(sp)
 1b2:	1800                	addi	s0,sp,48
    int i = 100;

    struct thread *t2 = thread_create(f2, NULL);
 1b4:	4581                	li	a1,0
 1b6:	00000517          	auipc	a0,0x0
 1ba:	f0050513          	addi	a0,a0,-256 # b6 <f2>
 1be:	00001097          	auipc	ra,0x1
 1c2:	8d2080e7          	jalr	-1838(ra) # a90 <thread_create>
    thread_add_runqueue(t2);
 1c6:	00001097          	auipc	ra,0x1
 1ca:	92e080e7          	jalr	-1746(ra) # af4 <thread_add_runqueue>
    struct thread *t3 = thread_create(f3, NULL);
 1ce:	4581                	li	a1,0
 1d0:	00000517          	auipc	a0,0x0
 1d4:	f3e50513          	addi	a0,a0,-194 # 10e <f3>
 1d8:	00001097          	auipc	ra,0x1
 1dc:	8b8080e7          	jalr	-1864(ra) # a90 <thread_create>
    thread_add_runqueue(t3);
 1e0:	00001097          	auipc	ra,0x1
 1e4:	914080e7          	jalr	-1772(ra) # af4 <thread_add_runqueue>
    
    while(1) {
        printf("thread 1: %d\n", i++);
 1e8:	06400593          	li	a1,100
 1ec:	00001517          	auipc	a0,0x1
 1f0:	d2c50513          	addi	a0,a0,-724 # f18 <thread_start_threading+0x6e>
 1f4:	00000097          	auipc	ra,0x0
 1f8:	684080e7          	jalr	1668(ra) # 878 <printf>
 1fc:	06500493          	li	s1,101
 200:	00001a17          	auipc	s4,0x1
 204:	d18a0a13          	addi	s4,s4,-744 # f18 <thread_start_threading+0x6e>
        if (i == 105) {
 208:	06900993          	li	s3,105
 20c:	a011                	j	210 <f1+0x6c>
        printf("thread 1: %d\n", i++);
 20e:	84ca                	mv	s1,s2
            thread_exit();
        }
        thread_yield();
 210:	00001097          	auipc	ra,0x1
 214:	a70080e7          	jalr	-1424(ra) # c80 <thread_yield>
        printf("thread 1: %d\n", i++);
 218:	0014891b          	addiw	s2,s1,1
 21c:	85a6                	mv	a1,s1
 21e:	8552                	mv	a0,s4
 220:	00000097          	auipc	ra,0x0
 224:	658080e7          	jalr	1624(ra) # 878 <printf>
        if (i == 105) {
 228:	ff3913e3          	bne	s2,s3,20e <f1+0x6a>
            thread_exit();
 22c:	00001097          	auipc	ra,0x1
 230:	ae0080e7          	jalr	-1312(ra) # d0c <thread_exit>
 234:	bfe9                	j	20e <f1+0x6a>

0000000000000236 <main>:
    }
}

int main(int argc, char **argv)
{
 236:	1141                	addi	sp,sp,-16
 238:	e406                	sd	ra,8(sp)
 23a:	e022                	sd	s0,0(sp)
 23c:	0800                	addi	s0,sp,16
    printf("mp1-1\n");
 23e:	00001517          	auipc	a0,0x1
 242:	cea50513          	addi	a0,a0,-790 # f28 <thread_start_threading+0x7e>
 246:	00000097          	auipc	ra,0x0
 24a:	632080e7          	jalr	1586(ra) # 878 <printf>
    t1 = thread_create(f1, NULL);
 24e:	4581                	li	a1,0
 250:	00000517          	auipc	a0,0x0
 254:	f5450513          	addi	a0,a0,-172 # 1a4 <f1>
 258:	00001097          	auipc	ra,0x1
 25c:	838080e7          	jalr	-1992(ra) # a90 <thread_create>
 260:	00001797          	auipc	a5,0x1
 264:	d0a7b023          	sd	a0,-768(a5) # f60 <t1>
    thread_add_runqueue(t1);
 268:	00001097          	auipc	ra,0x1
 26c:	88c080e7          	jalr	-1908(ra) # af4 <thread_add_runqueue>
    thread_start_threading();
 270:	00001097          	auipc	ra,0x1
 274:	c3a080e7          	jalr	-966(ra) # eaa <thread_start_threading>
    printf("\nexited\n");
 278:	00001517          	auipc	a0,0x1
 27c:	cb850513          	addi	a0,a0,-840 # f30 <thread_start_threading+0x86>
 280:	00000097          	auipc	ra,0x0
 284:	5f8080e7          	jalr	1528(ra) # 878 <printf>
    exit(0);
 288:	4501                	li	a0,0
 28a:	00000097          	auipc	ra,0x0
 28e:	276080e7          	jalr	630(ra) # 500 <exit>

0000000000000292 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 292:	1141                	addi	sp,sp,-16
 294:	e422                	sd	s0,8(sp)
 296:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 298:	87aa                	mv	a5,a0
 29a:	0585                	addi	a1,a1,1
 29c:	0785                	addi	a5,a5,1
 29e:	fff5c703          	lbu	a4,-1(a1)
 2a2:	fee78fa3          	sb	a4,-1(a5)
 2a6:	fb75                	bnez	a4,29a <strcpy+0x8>
    ;
  return os;
}
 2a8:	6422                	ld	s0,8(sp)
 2aa:	0141                	addi	sp,sp,16
 2ac:	8082                	ret

00000000000002ae <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2ae:	1141                	addi	sp,sp,-16
 2b0:	e422                	sd	s0,8(sp)
 2b2:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 2b4:	00054783          	lbu	a5,0(a0)
 2b8:	cb91                	beqz	a5,2cc <strcmp+0x1e>
 2ba:	0005c703          	lbu	a4,0(a1)
 2be:	00f71763          	bne	a4,a5,2cc <strcmp+0x1e>
    p++, q++;
 2c2:	0505                	addi	a0,a0,1
 2c4:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 2c6:	00054783          	lbu	a5,0(a0)
 2ca:	fbe5                	bnez	a5,2ba <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 2cc:	0005c503          	lbu	a0,0(a1)
}
 2d0:	40a7853b          	subw	a0,a5,a0
 2d4:	6422                	ld	s0,8(sp)
 2d6:	0141                	addi	sp,sp,16
 2d8:	8082                	ret

00000000000002da <strlen>:

uint
strlen(const char *s)
{
 2da:	1141                	addi	sp,sp,-16
 2dc:	e422                	sd	s0,8(sp)
 2de:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 2e0:	00054783          	lbu	a5,0(a0)
 2e4:	cf91                	beqz	a5,300 <strlen+0x26>
 2e6:	0505                	addi	a0,a0,1
 2e8:	87aa                	mv	a5,a0
 2ea:	4685                	li	a3,1
 2ec:	9e89                	subw	a3,a3,a0
 2ee:	00f6853b          	addw	a0,a3,a5
 2f2:	0785                	addi	a5,a5,1
 2f4:	fff7c703          	lbu	a4,-1(a5)
 2f8:	fb7d                	bnez	a4,2ee <strlen+0x14>
    ;
  return n;
}
 2fa:	6422                	ld	s0,8(sp)
 2fc:	0141                	addi	sp,sp,16
 2fe:	8082                	ret
  for(n = 0; s[n]; n++)
 300:	4501                	li	a0,0
 302:	bfe5                	j	2fa <strlen+0x20>

0000000000000304 <memset>:

void*
memset(void *dst, int c, uint n)
{
 304:	1141                	addi	sp,sp,-16
 306:	e422                	sd	s0,8(sp)
 308:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 30a:	ca19                	beqz	a2,320 <memset+0x1c>
 30c:	87aa                	mv	a5,a0
 30e:	1602                	slli	a2,a2,0x20
 310:	9201                	srli	a2,a2,0x20
 312:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 316:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 31a:	0785                	addi	a5,a5,1
 31c:	fee79de3          	bne	a5,a4,316 <memset+0x12>
  }
  return dst;
}
 320:	6422                	ld	s0,8(sp)
 322:	0141                	addi	sp,sp,16
 324:	8082                	ret

0000000000000326 <strchr>:

char*
strchr(const char *s, char c)
{
 326:	1141                	addi	sp,sp,-16
 328:	e422                	sd	s0,8(sp)
 32a:	0800                	addi	s0,sp,16
  for(; *s; s++)
 32c:	00054783          	lbu	a5,0(a0)
 330:	cb99                	beqz	a5,346 <strchr+0x20>
    if(*s == c)
 332:	00f58763          	beq	a1,a5,340 <strchr+0x1a>
  for(; *s; s++)
 336:	0505                	addi	a0,a0,1
 338:	00054783          	lbu	a5,0(a0)
 33c:	fbfd                	bnez	a5,332 <strchr+0xc>
      return (char*)s;
  return 0;
 33e:	4501                	li	a0,0
}
 340:	6422                	ld	s0,8(sp)
 342:	0141                	addi	sp,sp,16
 344:	8082                	ret
  return 0;
 346:	4501                	li	a0,0
 348:	bfe5                	j	340 <strchr+0x1a>

000000000000034a <gets>:

char*
gets(char *buf, int max)
{
 34a:	711d                	addi	sp,sp,-96
 34c:	ec86                	sd	ra,88(sp)
 34e:	e8a2                	sd	s0,80(sp)
 350:	e4a6                	sd	s1,72(sp)
 352:	e0ca                	sd	s2,64(sp)
 354:	fc4e                	sd	s3,56(sp)
 356:	f852                	sd	s4,48(sp)
 358:	f456                	sd	s5,40(sp)
 35a:	f05a                	sd	s6,32(sp)
 35c:	ec5e                	sd	s7,24(sp)
 35e:	1080                	addi	s0,sp,96
 360:	8baa                	mv	s7,a0
 362:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 364:	892a                	mv	s2,a0
 366:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 368:	4aa9                	li	s5,10
 36a:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 36c:	89a6                	mv	s3,s1
 36e:	2485                	addiw	s1,s1,1
 370:	0344d863          	bge	s1,s4,3a0 <gets+0x56>
    cc = read(0, &c, 1);
 374:	4605                	li	a2,1
 376:	faf40593          	addi	a1,s0,-81
 37a:	4501                	li	a0,0
 37c:	00000097          	auipc	ra,0x0
 380:	19c080e7          	jalr	412(ra) # 518 <read>
    if(cc < 1)
 384:	00a05e63          	blez	a0,3a0 <gets+0x56>
    buf[i++] = c;
 388:	faf44783          	lbu	a5,-81(s0)
 38c:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 390:	01578763          	beq	a5,s5,39e <gets+0x54>
 394:	0905                	addi	s2,s2,1
 396:	fd679be3          	bne	a5,s6,36c <gets+0x22>
  for(i=0; i+1 < max; ){
 39a:	89a6                	mv	s3,s1
 39c:	a011                	j	3a0 <gets+0x56>
 39e:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 3a0:	99de                	add	s3,s3,s7
 3a2:	00098023          	sb	zero,0(s3)
  return buf;
}
 3a6:	855e                	mv	a0,s7
 3a8:	60e6                	ld	ra,88(sp)
 3aa:	6446                	ld	s0,80(sp)
 3ac:	64a6                	ld	s1,72(sp)
 3ae:	6906                	ld	s2,64(sp)
 3b0:	79e2                	ld	s3,56(sp)
 3b2:	7a42                	ld	s4,48(sp)
 3b4:	7aa2                	ld	s5,40(sp)
 3b6:	7b02                	ld	s6,32(sp)
 3b8:	6be2                	ld	s7,24(sp)
 3ba:	6125                	addi	sp,sp,96
 3bc:	8082                	ret

00000000000003be <stat>:

int
stat(const char *n, struct stat *st)
{
 3be:	1101                	addi	sp,sp,-32
 3c0:	ec06                	sd	ra,24(sp)
 3c2:	e822                	sd	s0,16(sp)
 3c4:	e426                	sd	s1,8(sp)
 3c6:	e04a                	sd	s2,0(sp)
 3c8:	1000                	addi	s0,sp,32
 3ca:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3cc:	4581                	li	a1,0
 3ce:	00000097          	auipc	ra,0x0
 3d2:	172080e7          	jalr	370(ra) # 540 <open>
  if(fd < 0)
 3d6:	02054563          	bltz	a0,400 <stat+0x42>
 3da:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 3dc:	85ca                	mv	a1,s2
 3de:	00000097          	auipc	ra,0x0
 3e2:	17a080e7          	jalr	378(ra) # 558 <fstat>
 3e6:	892a                	mv	s2,a0
  close(fd);
 3e8:	8526                	mv	a0,s1
 3ea:	00000097          	auipc	ra,0x0
 3ee:	13e080e7          	jalr	318(ra) # 528 <close>
  return r;
}
 3f2:	854a                	mv	a0,s2
 3f4:	60e2                	ld	ra,24(sp)
 3f6:	6442                	ld	s0,16(sp)
 3f8:	64a2                	ld	s1,8(sp)
 3fa:	6902                	ld	s2,0(sp)
 3fc:	6105                	addi	sp,sp,32
 3fe:	8082                	ret
    return -1;
 400:	597d                	li	s2,-1
 402:	bfc5                	j	3f2 <stat+0x34>

0000000000000404 <atoi>:

int
atoi(const char *s)
{
 404:	1141                	addi	sp,sp,-16
 406:	e422                	sd	s0,8(sp)
 408:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 40a:	00054603          	lbu	a2,0(a0)
 40e:	fd06079b          	addiw	a5,a2,-48
 412:	0ff7f793          	andi	a5,a5,255
 416:	4725                	li	a4,9
 418:	02f76963          	bltu	a4,a5,44a <atoi+0x46>
 41c:	86aa                	mv	a3,a0
  n = 0;
 41e:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 420:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 422:	0685                	addi	a3,a3,1
 424:	0025179b          	slliw	a5,a0,0x2
 428:	9fa9                	addw	a5,a5,a0
 42a:	0017979b          	slliw	a5,a5,0x1
 42e:	9fb1                	addw	a5,a5,a2
 430:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 434:	0006c603          	lbu	a2,0(a3)
 438:	fd06071b          	addiw	a4,a2,-48
 43c:	0ff77713          	andi	a4,a4,255
 440:	fee5f1e3          	bgeu	a1,a4,422 <atoi+0x1e>
  return n;
}
 444:	6422                	ld	s0,8(sp)
 446:	0141                	addi	sp,sp,16
 448:	8082                	ret
  n = 0;
 44a:	4501                	li	a0,0
 44c:	bfe5                	j	444 <atoi+0x40>

000000000000044e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 44e:	1141                	addi	sp,sp,-16
 450:	e422                	sd	s0,8(sp)
 452:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 454:	02b57463          	bgeu	a0,a1,47c <memmove+0x2e>
    while(n-- > 0)
 458:	00c05f63          	blez	a2,476 <memmove+0x28>
 45c:	1602                	slli	a2,a2,0x20
 45e:	9201                	srli	a2,a2,0x20
 460:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 464:	872a                	mv	a4,a0
      *dst++ = *src++;
 466:	0585                	addi	a1,a1,1
 468:	0705                	addi	a4,a4,1
 46a:	fff5c683          	lbu	a3,-1(a1)
 46e:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 472:	fee79ae3          	bne	a5,a4,466 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 476:	6422                	ld	s0,8(sp)
 478:	0141                	addi	sp,sp,16
 47a:	8082                	ret
    dst += n;
 47c:	00c50733          	add	a4,a0,a2
    src += n;
 480:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 482:	fec05ae3          	blez	a2,476 <memmove+0x28>
 486:	fff6079b          	addiw	a5,a2,-1
 48a:	1782                	slli	a5,a5,0x20
 48c:	9381                	srli	a5,a5,0x20
 48e:	fff7c793          	not	a5,a5
 492:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 494:	15fd                	addi	a1,a1,-1
 496:	177d                	addi	a4,a4,-1
 498:	0005c683          	lbu	a3,0(a1)
 49c:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 4a0:	fee79ae3          	bne	a5,a4,494 <memmove+0x46>
 4a4:	bfc9                	j	476 <memmove+0x28>

00000000000004a6 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 4a6:	1141                	addi	sp,sp,-16
 4a8:	e422                	sd	s0,8(sp)
 4aa:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 4ac:	ca05                	beqz	a2,4dc <memcmp+0x36>
 4ae:	fff6069b          	addiw	a3,a2,-1
 4b2:	1682                	slli	a3,a3,0x20
 4b4:	9281                	srli	a3,a3,0x20
 4b6:	0685                	addi	a3,a3,1
 4b8:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 4ba:	00054783          	lbu	a5,0(a0)
 4be:	0005c703          	lbu	a4,0(a1)
 4c2:	00e79863          	bne	a5,a4,4d2 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 4c6:	0505                	addi	a0,a0,1
    p2++;
 4c8:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 4ca:	fed518e3          	bne	a0,a3,4ba <memcmp+0x14>
  }
  return 0;
 4ce:	4501                	li	a0,0
 4d0:	a019                	j	4d6 <memcmp+0x30>
      return *p1 - *p2;
 4d2:	40e7853b          	subw	a0,a5,a4
}
 4d6:	6422                	ld	s0,8(sp)
 4d8:	0141                	addi	sp,sp,16
 4da:	8082                	ret
  return 0;
 4dc:	4501                	li	a0,0
 4de:	bfe5                	j	4d6 <memcmp+0x30>

00000000000004e0 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 4e0:	1141                	addi	sp,sp,-16
 4e2:	e406                	sd	ra,8(sp)
 4e4:	e022                	sd	s0,0(sp)
 4e6:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 4e8:	00000097          	auipc	ra,0x0
 4ec:	f66080e7          	jalr	-154(ra) # 44e <memmove>
}
 4f0:	60a2                	ld	ra,8(sp)
 4f2:	6402                	ld	s0,0(sp)
 4f4:	0141                	addi	sp,sp,16
 4f6:	8082                	ret

00000000000004f8 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 4f8:	4885                	li	a7,1
 ecall
 4fa:	00000073          	ecall
 ret
 4fe:	8082                	ret

0000000000000500 <exit>:
.global exit
exit:
 li a7, SYS_exit
 500:	4889                	li	a7,2
 ecall
 502:	00000073          	ecall
 ret
 506:	8082                	ret

0000000000000508 <wait>:
.global wait
wait:
 li a7, SYS_wait
 508:	488d                	li	a7,3
 ecall
 50a:	00000073          	ecall
 ret
 50e:	8082                	ret

0000000000000510 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 510:	4891                	li	a7,4
 ecall
 512:	00000073          	ecall
 ret
 516:	8082                	ret

0000000000000518 <read>:
.global read
read:
 li a7, SYS_read
 518:	4895                	li	a7,5
 ecall
 51a:	00000073          	ecall
 ret
 51e:	8082                	ret

0000000000000520 <write>:
.global write
write:
 li a7, SYS_write
 520:	48c1                	li	a7,16
 ecall
 522:	00000073          	ecall
 ret
 526:	8082                	ret

0000000000000528 <close>:
.global close
close:
 li a7, SYS_close
 528:	48d5                	li	a7,21
 ecall
 52a:	00000073          	ecall
 ret
 52e:	8082                	ret

0000000000000530 <kill>:
.global kill
kill:
 li a7, SYS_kill
 530:	4899                	li	a7,6
 ecall
 532:	00000073          	ecall
 ret
 536:	8082                	ret

0000000000000538 <exec>:
.global exec
exec:
 li a7, SYS_exec
 538:	489d                	li	a7,7
 ecall
 53a:	00000073          	ecall
 ret
 53e:	8082                	ret

0000000000000540 <open>:
.global open
open:
 li a7, SYS_open
 540:	48bd                	li	a7,15
 ecall
 542:	00000073          	ecall
 ret
 546:	8082                	ret

0000000000000548 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 548:	48c5                	li	a7,17
 ecall
 54a:	00000073          	ecall
 ret
 54e:	8082                	ret

0000000000000550 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 550:	48c9                	li	a7,18
 ecall
 552:	00000073          	ecall
 ret
 556:	8082                	ret

0000000000000558 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 558:	48a1                	li	a7,8
 ecall
 55a:	00000073          	ecall
 ret
 55e:	8082                	ret

0000000000000560 <link>:
.global link
link:
 li a7, SYS_link
 560:	48cd                	li	a7,19
 ecall
 562:	00000073          	ecall
 ret
 566:	8082                	ret

0000000000000568 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 568:	48d1                	li	a7,20
 ecall
 56a:	00000073          	ecall
 ret
 56e:	8082                	ret

0000000000000570 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 570:	48a5                	li	a7,9
 ecall
 572:	00000073          	ecall
 ret
 576:	8082                	ret

0000000000000578 <dup>:
.global dup
dup:
 li a7, SYS_dup
 578:	48a9                	li	a7,10
 ecall
 57a:	00000073          	ecall
 ret
 57e:	8082                	ret

0000000000000580 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 580:	48ad                	li	a7,11
 ecall
 582:	00000073          	ecall
 ret
 586:	8082                	ret

0000000000000588 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 588:	48b1                	li	a7,12
 ecall
 58a:	00000073          	ecall
 ret
 58e:	8082                	ret

0000000000000590 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 590:	48b5                	li	a7,13
 ecall
 592:	00000073          	ecall
 ret
 596:	8082                	ret

0000000000000598 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 598:	48b9                	li	a7,14
 ecall
 59a:	00000073          	ecall
 ret
 59e:	8082                	ret

00000000000005a0 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 5a0:	1101                	addi	sp,sp,-32
 5a2:	ec06                	sd	ra,24(sp)
 5a4:	e822                	sd	s0,16(sp)
 5a6:	1000                	addi	s0,sp,32
 5a8:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 5ac:	4605                	li	a2,1
 5ae:	fef40593          	addi	a1,s0,-17
 5b2:	00000097          	auipc	ra,0x0
 5b6:	f6e080e7          	jalr	-146(ra) # 520 <write>
}
 5ba:	60e2                	ld	ra,24(sp)
 5bc:	6442                	ld	s0,16(sp)
 5be:	6105                	addi	sp,sp,32
 5c0:	8082                	ret

00000000000005c2 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5c2:	7139                	addi	sp,sp,-64
 5c4:	fc06                	sd	ra,56(sp)
 5c6:	f822                	sd	s0,48(sp)
 5c8:	f426                	sd	s1,40(sp)
 5ca:	f04a                	sd	s2,32(sp)
 5cc:	ec4e                	sd	s3,24(sp)
 5ce:	0080                	addi	s0,sp,64
 5d0:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5d2:	c299                	beqz	a3,5d8 <printint+0x16>
 5d4:	0805c863          	bltz	a1,664 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 5d8:	2581                	sext.w	a1,a1
  neg = 0;
 5da:	4881                	li	a7,0
 5dc:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 5e0:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 5e2:	2601                	sext.w	a2,a2
 5e4:	00001517          	auipc	a0,0x1
 5e8:	96450513          	addi	a0,a0,-1692 # f48 <digits>
 5ec:	883a                	mv	a6,a4
 5ee:	2705                	addiw	a4,a4,1
 5f0:	02c5f7bb          	remuw	a5,a1,a2
 5f4:	1782                	slli	a5,a5,0x20
 5f6:	9381                	srli	a5,a5,0x20
 5f8:	97aa                	add	a5,a5,a0
 5fa:	0007c783          	lbu	a5,0(a5)
 5fe:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 602:	0005879b          	sext.w	a5,a1
 606:	02c5d5bb          	divuw	a1,a1,a2
 60a:	0685                	addi	a3,a3,1
 60c:	fec7f0e3          	bgeu	a5,a2,5ec <printint+0x2a>
  if(neg)
 610:	00088b63          	beqz	a7,626 <printint+0x64>
    buf[i++] = '-';
 614:	fd040793          	addi	a5,s0,-48
 618:	973e                	add	a4,a4,a5
 61a:	02d00793          	li	a5,45
 61e:	fef70823          	sb	a5,-16(a4)
 622:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 626:	02e05863          	blez	a4,656 <printint+0x94>
 62a:	fc040793          	addi	a5,s0,-64
 62e:	00e78933          	add	s2,a5,a4
 632:	fff78993          	addi	s3,a5,-1
 636:	99ba                	add	s3,s3,a4
 638:	377d                	addiw	a4,a4,-1
 63a:	1702                	slli	a4,a4,0x20
 63c:	9301                	srli	a4,a4,0x20
 63e:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 642:	fff94583          	lbu	a1,-1(s2)
 646:	8526                	mv	a0,s1
 648:	00000097          	auipc	ra,0x0
 64c:	f58080e7          	jalr	-168(ra) # 5a0 <putc>
  while(--i >= 0)
 650:	197d                	addi	s2,s2,-1
 652:	ff3918e3          	bne	s2,s3,642 <printint+0x80>
}
 656:	70e2                	ld	ra,56(sp)
 658:	7442                	ld	s0,48(sp)
 65a:	74a2                	ld	s1,40(sp)
 65c:	7902                	ld	s2,32(sp)
 65e:	69e2                	ld	s3,24(sp)
 660:	6121                	addi	sp,sp,64
 662:	8082                	ret
    x = -xx;
 664:	40b005bb          	negw	a1,a1
    neg = 1;
 668:	4885                	li	a7,1
    x = -xx;
 66a:	bf8d                	j	5dc <printint+0x1a>

000000000000066c <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 66c:	7119                	addi	sp,sp,-128
 66e:	fc86                	sd	ra,120(sp)
 670:	f8a2                	sd	s0,112(sp)
 672:	f4a6                	sd	s1,104(sp)
 674:	f0ca                	sd	s2,96(sp)
 676:	ecce                	sd	s3,88(sp)
 678:	e8d2                	sd	s4,80(sp)
 67a:	e4d6                	sd	s5,72(sp)
 67c:	e0da                	sd	s6,64(sp)
 67e:	fc5e                	sd	s7,56(sp)
 680:	f862                	sd	s8,48(sp)
 682:	f466                	sd	s9,40(sp)
 684:	f06a                	sd	s10,32(sp)
 686:	ec6e                	sd	s11,24(sp)
 688:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 68a:	0005c903          	lbu	s2,0(a1)
 68e:	18090f63          	beqz	s2,82c <vprintf+0x1c0>
 692:	8aaa                	mv	s5,a0
 694:	8b32                	mv	s6,a2
 696:	00158493          	addi	s1,a1,1
  state = 0;
 69a:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 69c:	02500a13          	li	s4,37
      if(c == 'd'){
 6a0:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 6a4:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 6a8:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 6ac:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 6b0:	00001b97          	auipc	s7,0x1
 6b4:	898b8b93          	addi	s7,s7,-1896 # f48 <digits>
 6b8:	a839                	j	6d6 <vprintf+0x6a>
        putc(fd, c);
 6ba:	85ca                	mv	a1,s2
 6bc:	8556                	mv	a0,s5
 6be:	00000097          	auipc	ra,0x0
 6c2:	ee2080e7          	jalr	-286(ra) # 5a0 <putc>
 6c6:	a019                	j	6cc <vprintf+0x60>
    } else if(state == '%'){
 6c8:	01498f63          	beq	s3,s4,6e6 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 6cc:	0485                	addi	s1,s1,1
 6ce:	fff4c903          	lbu	s2,-1(s1)
 6d2:	14090d63          	beqz	s2,82c <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 6d6:	0009079b          	sext.w	a5,s2
    if(state == 0){
 6da:	fe0997e3          	bnez	s3,6c8 <vprintf+0x5c>
      if(c == '%'){
 6de:	fd479ee3          	bne	a5,s4,6ba <vprintf+0x4e>
        state = '%';
 6e2:	89be                	mv	s3,a5
 6e4:	b7e5                	j	6cc <vprintf+0x60>
      if(c == 'd'){
 6e6:	05878063          	beq	a5,s8,726 <vprintf+0xba>
      } else if(c == 'l') {
 6ea:	05978c63          	beq	a5,s9,742 <vprintf+0xd6>
      } else if(c == 'x') {
 6ee:	07a78863          	beq	a5,s10,75e <vprintf+0xf2>
      } else if(c == 'p') {
 6f2:	09b78463          	beq	a5,s11,77a <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 6f6:	07300713          	li	a4,115
 6fa:	0ce78663          	beq	a5,a4,7c6 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6fe:	06300713          	li	a4,99
 702:	0ee78e63          	beq	a5,a4,7fe <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 706:	11478863          	beq	a5,s4,816 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 70a:	85d2                	mv	a1,s4
 70c:	8556                	mv	a0,s5
 70e:	00000097          	auipc	ra,0x0
 712:	e92080e7          	jalr	-366(ra) # 5a0 <putc>
        putc(fd, c);
 716:	85ca                	mv	a1,s2
 718:	8556                	mv	a0,s5
 71a:	00000097          	auipc	ra,0x0
 71e:	e86080e7          	jalr	-378(ra) # 5a0 <putc>
      }
      state = 0;
 722:	4981                	li	s3,0
 724:	b765                	j	6cc <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 726:	008b0913          	addi	s2,s6,8
 72a:	4685                	li	a3,1
 72c:	4629                	li	a2,10
 72e:	000b2583          	lw	a1,0(s6)
 732:	8556                	mv	a0,s5
 734:	00000097          	auipc	ra,0x0
 738:	e8e080e7          	jalr	-370(ra) # 5c2 <printint>
 73c:	8b4a                	mv	s6,s2
      state = 0;
 73e:	4981                	li	s3,0
 740:	b771                	j	6cc <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 742:	008b0913          	addi	s2,s6,8
 746:	4681                	li	a3,0
 748:	4629                	li	a2,10
 74a:	000b2583          	lw	a1,0(s6)
 74e:	8556                	mv	a0,s5
 750:	00000097          	auipc	ra,0x0
 754:	e72080e7          	jalr	-398(ra) # 5c2 <printint>
 758:	8b4a                	mv	s6,s2
      state = 0;
 75a:	4981                	li	s3,0
 75c:	bf85                	j	6cc <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 75e:	008b0913          	addi	s2,s6,8
 762:	4681                	li	a3,0
 764:	4641                	li	a2,16
 766:	000b2583          	lw	a1,0(s6)
 76a:	8556                	mv	a0,s5
 76c:	00000097          	auipc	ra,0x0
 770:	e56080e7          	jalr	-426(ra) # 5c2 <printint>
 774:	8b4a                	mv	s6,s2
      state = 0;
 776:	4981                	li	s3,0
 778:	bf91                	j	6cc <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 77a:	008b0793          	addi	a5,s6,8
 77e:	f8f43423          	sd	a5,-120(s0)
 782:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 786:	03000593          	li	a1,48
 78a:	8556                	mv	a0,s5
 78c:	00000097          	auipc	ra,0x0
 790:	e14080e7          	jalr	-492(ra) # 5a0 <putc>
  putc(fd, 'x');
 794:	85ea                	mv	a1,s10
 796:	8556                	mv	a0,s5
 798:	00000097          	auipc	ra,0x0
 79c:	e08080e7          	jalr	-504(ra) # 5a0 <putc>
 7a0:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 7a2:	03c9d793          	srli	a5,s3,0x3c
 7a6:	97de                	add	a5,a5,s7
 7a8:	0007c583          	lbu	a1,0(a5)
 7ac:	8556                	mv	a0,s5
 7ae:	00000097          	auipc	ra,0x0
 7b2:	df2080e7          	jalr	-526(ra) # 5a0 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 7b6:	0992                	slli	s3,s3,0x4
 7b8:	397d                	addiw	s2,s2,-1
 7ba:	fe0914e3          	bnez	s2,7a2 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 7be:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 7c2:	4981                	li	s3,0
 7c4:	b721                	j	6cc <vprintf+0x60>
        s = va_arg(ap, char*);
 7c6:	008b0993          	addi	s3,s6,8
 7ca:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 7ce:	02090163          	beqz	s2,7f0 <vprintf+0x184>
        while(*s != 0){
 7d2:	00094583          	lbu	a1,0(s2)
 7d6:	c9a1                	beqz	a1,826 <vprintf+0x1ba>
          putc(fd, *s);
 7d8:	8556                	mv	a0,s5
 7da:	00000097          	auipc	ra,0x0
 7de:	dc6080e7          	jalr	-570(ra) # 5a0 <putc>
          s++;
 7e2:	0905                	addi	s2,s2,1
        while(*s != 0){
 7e4:	00094583          	lbu	a1,0(s2)
 7e8:	f9e5                	bnez	a1,7d8 <vprintf+0x16c>
        s = va_arg(ap, char*);
 7ea:	8b4e                	mv	s6,s3
      state = 0;
 7ec:	4981                	li	s3,0
 7ee:	bdf9                	j	6cc <vprintf+0x60>
          s = "(null)";
 7f0:	00000917          	auipc	s2,0x0
 7f4:	75090913          	addi	s2,s2,1872 # f40 <thread_start_threading+0x96>
        while(*s != 0){
 7f8:	02800593          	li	a1,40
 7fc:	bff1                	j	7d8 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 7fe:	008b0913          	addi	s2,s6,8
 802:	000b4583          	lbu	a1,0(s6)
 806:	8556                	mv	a0,s5
 808:	00000097          	auipc	ra,0x0
 80c:	d98080e7          	jalr	-616(ra) # 5a0 <putc>
 810:	8b4a                	mv	s6,s2
      state = 0;
 812:	4981                	li	s3,0
 814:	bd65                	j	6cc <vprintf+0x60>
        putc(fd, c);
 816:	85d2                	mv	a1,s4
 818:	8556                	mv	a0,s5
 81a:	00000097          	auipc	ra,0x0
 81e:	d86080e7          	jalr	-634(ra) # 5a0 <putc>
      state = 0;
 822:	4981                	li	s3,0
 824:	b565                	j	6cc <vprintf+0x60>
        s = va_arg(ap, char*);
 826:	8b4e                	mv	s6,s3
      state = 0;
 828:	4981                	li	s3,0
 82a:	b54d                	j	6cc <vprintf+0x60>
    }
  }
}
 82c:	70e6                	ld	ra,120(sp)
 82e:	7446                	ld	s0,112(sp)
 830:	74a6                	ld	s1,104(sp)
 832:	7906                	ld	s2,96(sp)
 834:	69e6                	ld	s3,88(sp)
 836:	6a46                	ld	s4,80(sp)
 838:	6aa6                	ld	s5,72(sp)
 83a:	6b06                	ld	s6,64(sp)
 83c:	7be2                	ld	s7,56(sp)
 83e:	7c42                	ld	s8,48(sp)
 840:	7ca2                	ld	s9,40(sp)
 842:	7d02                	ld	s10,32(sp)
 844:	6de2                	ld	s11,24(sp)
 846:	6109                	addi	sp,sp,128
 848:	8082                	ret

000000000000084a <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 84a:	715d                	addi	sp,sp,-80
 84c:	ec06                	sd	ra,24(sp)
 84e:	e822                	sd	s0,16(sp)
 850:	1000                	addi	s0,sp,32
 852:	e010                	sd	a2,0(s0)
 854:	e414                	sd	a3,8(s0)
 856:	e818                	sd	a4,16(s0)
 858:	ec1c                	sd	a5,24(s0)
 85a:	03043023          	sd	a6,32(s0)
 85e:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 862:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 866:	8622                	mv	a2,s0
 868:	00000097          	auipc	ra,0x0
 86c:	e04080e7          	jalr	-508(ra) # 66c <vprintf>
}
 870:	60e2                	ld	ra,24(sp)
 872:	6442                	ld	s0,16(sp)
 874:	6161                	addi	sp,sp,80
 876:	8082                	ret

0000000000000878 <printf>:

void
printf(const char *fmt, ...)
{
 878:	711d                	addi	sp,sp,-96
 87a:	ec06                	sd	ra,24(sp)
 87c:	e822                	sd	s0,16(sp)
 87e:	1000                	addi	s0,sp,32
 880:	e40c                	sd	a1,8(s0)
 882:	e810                	sd	a2,16(s0)
 884:	ec14                	sd	a3,24(s0)
 886:	f018                	sd	a4,32(s0)
 888:	f41c                	sd	a5,40(s0)
 88a:	03043823          	sd	a6,48(s0)
 88e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 892:	00840613          	addi	a2,s0,8
 896:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 89a:	85aa                	mv	a1,a0
 89c:	4505                	li	a0,1
 89e:	00000097          	auipc	ra,0x0
 8a2:	dce080e7          	jalr	-562(ra) # 66c <vprintf>
}
 8a6:	60e2                	ld	ra,24(sp)
 8a8:	6442                	ld	s0,16(sp)
 8aa:	6125                	addi	sp,sp,96
 8ac:	8082                	ret

00000000000008ae <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8ae:	1141                	addi	sp,sp,-16
 8b0:	e422                	sd	s0,8(sp)
 8b2:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8b4:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b8:	00000797          	auipc	a5,0x0
 8bc:	6b87b783          	ld	a5,1720(a5) # f70 <freep>
 8c0:	a805                	j	8f0 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 8c2:	4618                	lw	a4,8(a2)
 8c4:	9db9                	addw	a1,a1,a4
 8c6:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 8ca:	6398                	ld	a4,0(a5)
 8cc:	6318                	ld	a4,0(a4)
 8ce:	fee53823          	sd	a4,-16(a0)
 8d2:	a091                	j	916 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 8d4:	ff852703          	lw	a4,-8(a0)
 8d8:	9e39                	addw	a2,a2,a4
 8da:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 8dc:	ff053703          	ld	a4,-16(a0)
 8e0:	e398                	sd	a4,0(a5)
 8e2:	a099                	j	928 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8e4:	6398                	ld	a4,0(a5)
 8e6:	00e7e463          	bltu	a5,a4,8ee <free+0x40>
 8ea:	00e6ea63          	bltu	a3,a4,8fe <free+0x50>
{
 8ee:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8f0:	fed7fae3          	bgeu	a5,a3,8e4 <free+0x36>
 8f4:	6398                	ld	a4,0(a5)
 8f6:	00e6e463          	bltu	a3,a4,8fe <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8fa:	fee7eae3          	bltu	a5,a4,8ee <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 8fe:	ff852583          	lw	a1,-8(a0)
 902:	6390                	ld	a2,0(a5)
 904:	02059713          	slli	a4,a1,0x20
 908:	9301                	srli	a4,a4,0x20
 90a:	0712                	slli	a4,a4,0x4
 90c:	9736                	add	a4,a4,a3
 90e:	fae60ae3          	beq	a2,a4,8c2 <free+0x14>
    bp->s.ptr = p->s.ptr;
 912:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 916:	4790                	lw	a2,8(a5)
 918:	02061713          	slli	a4,a2,0x20
 91c:	9301                	srli	a4,a4,0x20
 91e:	0712                	slli	a4,a4,0x4
 920:	973e                	add	a4,a4,a5
 922:	fae689e3          	beq	a3,a4,8d4 <free+0x26>
  } else
    p->s.ptr = bp;
 926:	e394                	sd	a3,0(a5)
  freep = p;
 928:	00000717          	auipc	a4,0x0
 92c:	64f73423          	sd	a5,1608(a4) # f70 <freep>
}
 930:	6422                	ld	s0,8(sp)
 932:	0141                	addi	sp,sp,16
 934:	8082                	ret

0000000000000936 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 936:	7139                	addi	sp,sp,-64
 938:	fc06                	sd	ra,56(sp)
 93a:	f822                	sd	s0,48(sp)
 93c:	f426                	sd	s1,40(sp)
 93e:	f04a                	sd	s2,32(sp)
 940:	ec4e                	sd	s3,24(sp)
 942:	e852                	sd	s4,16(sp)
 944:	e456                	sd	s5,8(sp)
 946:	e05a                	sd	s6,0(sp)
 948:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 94a:	02051493          	slli	s1,a0,0x20
 94e:	9081                	srli	s1,s1,0x20
 950:	04bd                	addi	s1,s1,15
 952:	8091                	srli	s1,s1,0x4
 954:	0014899b          	addiw	s3,s1,1
 958:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 95a:	00000517          	auipc	a0,0x0
 95e:	61653503          	ld	a0,1558(a0) # f70 <freep>
 962:	c515                	beqz	a0,98e <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 964:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 966:	4798                	lw	a4,8(a5)
 968:	02977f63          	bgeu	a4,s1,9a6 <malloc+0x70>
 96c:	8a4e                	mv	s4,s3
 96e:	0009871b          	sext.w	a4,s3
 972:	6685                	lui	a3,0x1
 974:	00d77363          	bgeu	a4,a3,97a <malloc+0x44>
 978:	6a05                	lui	s4,0x1
 97a:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 97e:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 982:	00000917          	auipc	s2,0x0
 986:	5ee90913          	addi	s2,s2,1518 # f70 <freep>
  if(p == (char*)-1)
 98a:	5afd                	li	s5,-1
 98c:	a88d                	j	9fe <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 98e:	00000797          	auipc	a5,0x0
 992:	61278793          	addi	a5,a5,1554 # fa0 <base>
 996:	00000717          	auipc	a4,0x0
 99a:	5cf73d23          	sd	a5,1498(a4) # f70 <freep>
 99e:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 9a0:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 9a4:	b7e1                	j	96c <malloc+0x36>
      if(p->s.size == nunits)
 9a6:	02e48b63          	beq	s1,a4,9dc <malloc+0xa6>
        p->s.size -= nunits;
 9aa:	4137073b          	subw	a4,a4,s3
 9ae:	c798                	sw	a4,8(a5)
        p += p->s.size;
 9b0:	1702                	slli	a4,a4,0x20
 9b2:	9301                	srli	a4,a4,0x20
 9b4:	0712                	slli	a4,a4,0x4
 9b6:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 9b8:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 9bc:	00000717          	auipc	a4,0x0
 9c0:	5aa73a23          	sd	a0,1460(a4) # f70 <freep>
      return (void*)(p + 1);
 9c4:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9c8:	70e2                	ld	ra,56(sp)
 9ca:	7442                	ld	s0,48(sp)
 9cc:	74a2                	ld	s1,40(sp)
 9ce:	7902                	ld	s2,32(sp)
 9d0:	69e2                	ld	s3,24(sp)
 9d2:	6a42                	ld	s4,16(sp)
 9d4:	6aa2                	ld	s5,8(sp)
 9d6:	6b02                	ld	s6,0(sp)
 9d8:	6121                	addi	sp,sp,64
 9da:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 9dc:	6398                	ld	a4,0(a5)
 9de:	e118                	sd	a4,0(a0)
 9e0:	bff1                	j	9bc <malloc+0x86>
  hp->s.size = nu;
 9e2:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 9e6:	0541                	addi	a0,a0,16
 9e8:	00000097          	auipc	ra,0x0
 9ec:	ec6080e7          	jalr	-314(ra) # 8ae <free>
  return freep;
 9f0:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 9f4:	d971                	beqz	a0,9c8 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f6:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 9f8:	4798                	lw	a4,8(a5)
 9fa:	fa9776e3          	bgeu	a4,s1,9a6 <malloc+0x70>
    if(p == freep)
 9fe:	00093703          	ld	a4,0(s2)
 a02:	853e                	mv	a0,a5
 a04:	fef719e3          	bne	a4,a5,9f6 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 a08:	8552                	mv	a0,s4
 a0a:	00000097          	auipc	ra,0x0
 a0e:	b7e080e7          	jalr	-1154(ra) # 588 <sbrk>
  if(p == (char*)-1)
 a12:	fd5518e3          	bne	a0,s5,9e2 <malloc+0xac>
        return 0;
 a16:	4501                	li	a0,0
 a18:	bf45                	j	9c8 <malloc+0x92>

0000000000000a1a <setjmp>:
 a1a:	e100                	sd	s0,0(a0)
 a1c:	e504                	sd	s1,8(a0)
 a1e:	01253823          	sd	s2,16(a0)
 a22:	01353c23          	sd	s3,24(a0)
 a26:	03453023          	sd	s4,32(a0)
 a2a:	03553423          	sd	s5,40(a0)
 a2e:	03653823          	sd	s6,48(a0)
 a32:	03753c23          	sd	s7,56(a0)
 a36:	05853023          	sd	s8,64(a0)
 a3a:	05953423          	sd	s9,72(a0)
 a3e:	05a53823          	sd	s10,80(a0)
 a42:	05b53c23          	sd	s11,88(a0)
 a46:	06153023          	sd	ra,96(a0)
 a4a:	06253423          	sd	sp,104(a0)
 a4e:	4501                	li	a0,0
 a50:	8082                	ret

0000000000000a52 <longjmp>:
 a52:	6100                	ld	s0,0(a0)
 a54:	6504                	ld	s1,8(a0)
 a56:	01053903          	ld	s2,16(a0)
 a5a:	01853983          	ld	s3,24(a0)
 a5e:	02053a03          	ld	s4,32(a0)
 a62:	02853a83          	ld	s5,40(a0)
 a66:	03053b03          	ld	s6,48(a0)
 a6a:	03853b83          	ld	s7,56(a0)
 a6e:	04053c03          	ld	s8,64(a0)
 a72:	04853c83          	ld	s9,72(a0)
 a76:	05053d03          	ld	s10,80(a0)
 a7a:	05853d83          	ld	s11,88(a0)
 a7e:	06053083          	ld	ra,96(a0)
 a82:	06853103          	ld	sp,104(a0)
 a86:	c199                	beqz	a1,a8c <longjmp_1>
 a88:	852e                	mv	a0,a1
 a8a:	8082                	ret

0000000000000a8c <longjmp_1>:
 a8c:	4505                	li	a0,1
 a8e:	8082                	ret

0000000000000a90 <thread_create>:
// TODO: necessary declares, if any
static volatile int pre_flag=0;
static struct thread* ex_pre_end = NULL;
static volatile int ex_pre_flag=0;

struct thread *thread_create(void (*f)(void *), void *arg){
 a90:	7179                	addi	sp,sp,-48
 a92:	f406                	sd	ra,40(sp)
 a94:	f022                	sd	s0,32(sp)
 a96:	ec26                	sd	s1,24(sp)
 a98:	e84a                	sd	s2,16(sp)
 a9a:	e44e                	sd	s3,8(sp)
 a9c:	1800                	addi	s0,sp,48
 a9e:	89aa                	mv	s3,a0
 aa0:	892e                	mv	s2,a1
    struct thread *t = (struct thread*) malloc(sizeof(struct thread));
 aa2:	0b000513          	li	a0,176
 aa6:	00000097          	auipc	ra,0x0
 aaa:	e90080e7          	jalr	-368(ra) # 936 <malloc>
 aae:	84aa                	mv	s1,a0
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long) malloc(sizeof(unsigned long)*0x100);
 ab0:	6505                	lui	a0,0x1
 ab2:	80050513          	addi	a0,a0,-2048 # 800 <vprintf+0x194>
 ab6:	00000097          	auipc	ra,0x0
 aba:	e80080e7          	jalr	-384(ra) # 936 <malloc>
    new_stack_p = new_stack +0x100*8-0x2*8;
    t->fp = f;
 abe:	0134b023          	sd	s3,0(s1)
    t->arg = arg;
 ac2:	0124b423          	sd	s2,8(s1)
    t->ID  = id;
 ac6:	00000717          	auipc	a4,0x0
 aca:	49670713          	addi	a4,a4,1174 # f5c <id>
 ace:	431c                	lw	a5,0(a4)
 ad0:	08f4a823          	sw	a5,144(s1)
    t->buf_set = 0;
 ad4:	0804aa23          	sw	zero,148(s1)
    t->stack = (void*) new_stack;
 ad8:	e888                	sd	a0,16(s1)
    new_stack_p = new_stack +0x100*8-0x2*8;
 ada:	7f050513          	addi	a0,a0,2032
    t->stack_p = (void*) new_stack_p;
 ade:	ec88                	sd	a0,24(s1)
    id++;
 ae0:	2785                	addiw	a5,a5,1
 ae2:	c31c                	sw	a5,0(a4)
    
    return t;
}
 ae4:	8526                	mv	a0,s1
 ae6:	70a2                	ld	ra,40(sp)
 ae8:	7402                	ld	s0,32(sp)
 aea:	64e2                	ld	s1,24(sp)
 aec:	6942                	ld	s2,16(sp)
 aee:	69a2                	ld	s3,8(sp)
 af0:	6145                	addi	sp,sp,48
 af2:	8082                	ret

0000000000000af4 <thread_add_runqueue>:
void thread_add_runqueue(struct thread *t){
 af4:	1101                	addi	sp,sp,-32
 af6:	ec06                	sd	ra,24(sp)
 af8:	e822                	sd	s0,16(sp)
 afa:	e426                	sd	s1,8(sp)
 afc:	1000                	addi	s0,sp,32
 afe:	84aa                	mv	s1,a0
    if(current_thread == NULL){
 b00:	00000797          	auipc	a5,0x0
 b04:	4987b783          	ld	a5,1176(a5) # f98 <current_thread>
 b08:	c385                	beqz	a5,b28 <thread_add_runqueue+0x34>
        t->right=NULL;
        t->parent=NULL;
    }
    else{
        // TODO
        if(current_thread->left != NULL && current_thread->right != NULL)
 b0a:	6fd8                	ld	a4,152(a5)
 b0c:	cf0d                	beqz	a4,b46 <thread_add_runqueue+0x52>
 b0e:	73d8                	ld	a4,160(a5)
 b10:	cf0d                	beqz	a4,b4a <thread_add_runqueue+0x56>
        {
            free(t->stack);
 b12:	6908                	ld	a0,16(a0)
 b14:	00000097          	auipc	ra,0x0
 b18:	d9a080e7          	jalr	-614(ra) # 8ae <free>
            free(t);
 b1c:	8526                	mv	a0,s1
 b1e:	00000097          	auipc	ra,0x0
 b22:	d90080e7          	jalr	-624(ra) # 8ae <free>
 b26:	a805                	j	b56 <thread_add_runqueue+0x62>
        current_thread=t;
 b28:	00000797          	auipc	a5,0x0
 b2c:	46a7b823          	sd	a0,1136(a5) # f98 <current_thread>
        root_thread=t;
 b30:	00000797          	auipc	a5,0x0
 b34:	46a7b023          	sd	a0,1120(a5) # f90 <root_thread>
        t->left=NULL;
 b38:	08053c23          	sd	zero,152(a0)
        t->right=NULL;
 b3c:	0a053023          	sd	zero,160(a0)
        t->parent=NULL;
 b40:	0a053423          	sd	zero,168(a0)
 b44:	a809                	j	b56 <thread_add_runqueue+0x62>
        }
        else
        {
            if(current_thread->left==NULL)
            {
                current_thread->left=t;
 b46:	efc8                	sd	a0,152(a5)
 b48:	a011                	j	b4c <thread_add_runqueue+0x58>
            }
            else if(current_thread->right==NULL)
            {   
                current_thread->right=t;
 b4a:	f3c8                	sd	a0,160(a5)
            }
            t->parent=current_thread;
 b4c:	f4dc                	sd	a5,168(s1)
            t->left=NULL;
 b4e:	0804bc23          	sd	zero,152(s1)
            t->right=NULL;
 b52:	0a04b023          	sd	zero,160(s1)
        }
        

    }
}
 b56:	60e2                	ld	ra,24(sp)
 b58:	6442                	ld	s0,16(sp)
 b5a:	64a2                	ld	s1,8(sp)
 b5c:	6105                	addi	sp,sp,32
 b5e:	8082                	ret

0000000000000b60 <dispatch>:
    else 
        return; 
    
    
}
void dispatch(void){
 b60:	1141                	addi	sp,sp,-16
 b62:	e406                	sd	ra,8(sp)
 b64:	e022                	sd	s0,0(sp)
 b66:	0800                	addi	s0,sp,16
    // TODO
    if(current_thread->buf_set==0)
 b68:	00000517          	auipc	a0,0x0
 b6c:	43053503          	ld	a0,1072(a0) # f98 <current_thread>
 b70:	09452783          	lw	a5,148(a0)
 b74:	eba1                	bnez	a5,bc4 <dispatch+0x64>
    {   
        if(setjmp(current_thread->env)==0)
 b76:	02050513          	addi	a0,a0,32
 b7a:	00000097          	auipc	ra,0x0
 b7e:	ea0080e7          	jalr	-352(ra) # a1a <setjmp>
 b82:	e90d                	bnez	a0,bb4 <dispatch+0x54>
        {
            current_thread->env->sp=(unsigned long)current_thread->stack_p;
 b84:	00000797          	auipc	a5,0x0
 b88:	4147b783          	ld	a5,1044(a5) # f98 <current_thread>
 b8c:	6f98                	ld	a4,24(a5)
 b8e:	e7d8                	sd	a4,136(a5)
            //current_thread->env->ra=(unsigned long)current_thread->fp;
            current_thread->buf_set=1;
 b90:	4705                	li	a4,1
 b92:	08e7aa23          	sw	a4,148(a5)
        }
        
        else
            current_thread->fp(current_thread->arg); 
        longjmp(current_thread->env,1);
 b96:	4585                	li	a1,1
 b98:	00000517          	auipc	a0,0x0
 b9c:	40053503          	ld	a0,1024(a0) # f98 <current_thread>
 ba0:	02050513          	addi	a0,a0,32
 ba4:	00000097          	auipc	ra,0x0
 ba8:	eae080e7          	jalr	-338(ra) # a52 <longjmp>
    {
        //current_thread->fp(current_thread->arg);
        longjmp(current_thread->env,1);

    }
}
 bac:	60a2                	ld	ra,8(sp)
 bae:	6402                	ld	s0,0(sp)
 bb0:	0141                	addi	sp,sp,16
 bb2:	8082                	ret
            current_thread->fp(current_thread->arg); 
 bb4:	00000797          	auipc	a5,0x0
 bb8:	3e47b783          	ld	a5,996(a5) # f98 <current_thread>
 bbc:	6398                	ld	a4,0(a5)
 bbe:	6788                	ld	a0,8(a5)
 bc0:	9702                	jalr	a4
 bc2:	bfd1                	j	b96 <dispatch+0x36>
        longjmp(current_thread->env,1);
 bc4:	4585                	li	a1,1
 bc6:	02050513          	addi	a0,a0,32
 bca:	00000097          	auipc	ra,0x0
 bce:	e88080e7          	jalr	-376(ra) # a52 <longjmp>
}
 bd2:	bfe9                	j	bac <dispatch+0x4c>

0000000000000bd4 <schedule_preorder>:
    }
    
}
void schedule_preorder(struct thread* root )
{
    if(root!=NULL)
 bd4:	c135                	beqz	a0,c38 <schedule_preorder+0x64>
{
 bd6:	1101                	addi	sp,sp,-32
 bd8:	ec06                	sd	ra,24(sp)
 bda:	e822                	sd	s0,16(sp)
 bdc:	e426                	sd	s1,8(sp)
 bde:	1000                	addi	s0,sp,32
 be0:	84aa                	mv	s1,a0
    {

        if(root == current_thread)
 be2:	00000797          	auipc	a5,0x0
 be6:	3b67b783          	ld	a5,950(a5) # f98 <current_thread>
 bea:	02a78863          	beq	a5,a0,c1a <schedule_preorder+0x46>
        {
            pre_flag=1;
        }
        else if(pre_flag==1)
 bee:	00000717          	auipc	a4,0x0
 bf2:	39a72703          	lw	a4,922(a4) # f88 <pre_flag>
 bf6:	4785                	li	a5,1
 bf8:	02f70763          	beq	a4,a5,c26 <schedule_preorder+0x52>
            pre_flag=0;
            current_thread=root;
            return;
        }
        
        schedule_preorder(root->left);
 bfc:	6cc8                	ld	a0,152(s1)
 bfe:	00000097          	auipc	ra,0x0
 c02:	fd6080e7          	jalr	-42(ra) # bd4 <schedule_preorder>
        schedule_preorder(root->right);
 c06:	70c8                	ld	a0,160(s1)
 c08:	00000097          	auipc	ra,0x0
 c0c:	fcc080e7          	jalr	-52(ra) # bd4 <schedule_preorder>
    }
    
}
 c10:	60e2                	ld	ra,24(sp)
 c12:	6442                	ld	s0,16(sp)
 c14:	64a2                	ld	s1,8(sp)
 c16:	6105                	addi	sp,sp,32
 c18:	8082                	ret
            pre_flag=1;
 c1a:	4785                	li	a5,1
 c1c:	00000717          	auipc	a4,0x0
 c20:	36f72623          	sw	a5,876(a4) # f88 <pre_flag>
 c24:	bfe1                	j	bfc <schedule_preorder+0x28>
            pre_flag=0;
 c26:	00000797          	auipc	a5,0x0
 c2a:	3607a123          	sw	zero,866(a5) # f88 <pre_flag>
            current_thread=root;
 c2e:	00000797          	auipc	a5,0x0
 c32:	36a7b523          	sd	a0,874(a5) # f98 <current_thread>
            return;
 c36:	bfe9                	j	c10 <schedule_preorder+0x3c>
 c38:	8082                	ret

0000000000000c3a <schedule>:
void schedule(void){
 c3a:	1101                	addi	sp,sp,-32
 c3c:	ec06                	sd	ra,24(sp)
 c3e:	e822                	sd	s0,16(sp)
 c40:	e426                	sd	s1,8(sp)
 c42:	1000                	addi	s0,sp,32
    schedule_preorder(root_thread);
 c44:	00000497          	auipc	s1,0x0
 c48:	34c4b483          	ld	s1,844(s1) # f90 <root_thread>
 c4c:	8526                	mv	a0,s1
 c4e:	00000097          	auipc	ra,0x0
 c52:	f86080e7          	jalr	-122(ra) # bd4 <schedule_preorder>
    if(pre_flag==1)
 c56:	00000717          	auipc	a4,0x0
 c5a:	33272703          	lw	a4,818(a4) # f88 <pre_flag>
 c5e:	4785                	li	a5,1
 c60:	00f70763          	beq	a4,a5,c6e <schedule+0x34>
}
 c64:	60e2                	ld	ra,24(sp)
 c66:	6442                	ld	s0,16(sp)
 c68:	64a2                	ld	s1,8(sp)
 c6a:	6105                	addi	sp,sp,32
 c6c:	8082                	ret
        pre_flag=0;
 c6e:	00000797          	auipc	a5,0x0
 c72:	3007ad23          	sw	zero,794(a5) # f88 <pre_flag>
        current_thread=root_thread;
 c76:	00000797          	auipc	a5,0x0
 c7a:	3297b123          	sd	s1,802(a5) # f98 <current_thread>
}
 c7e:	b7dd                	j	c64 <schedule+0x2a>

0000000000000c80 <thread_yield>:
void thread_yield(void){
 c80:	1141                	addi	sp,sp,-16
 c82:	e406                	sd	ra,8(sp)
 c84:	e022                	sd	s0,0(sp)
 c86:	0800                	addi	s0,sp,16
    if(setjmp(current_thread->env)==0)
 c88:	00000517          	auipc	a0,0x0
 c8c:	31053503          	ld	a0,784(a0) # f98 <current_thread>
 c90:	02050513          	addi	a0,a0,32
 c94:	00000097          	auipc	ra,0x0
 c98:	d86080e7          	jalr	-634(ra) # a1a <setjmp>
 c9c:	c509                	beqz	a0,ca6 <thread_yield+0x26>
}
 c9e:	60a2                	ld	ra,8(sp)
 ca0:	6402                	ld	s0,0(sp)
 ca2:	0141                	addi	sp,sp,16
 ca4:	8082                	ret
        schedule();
 ca6:	00000097          	auipc	ra,0x0
 caa:	f94080e7          	jalr	-108(ra) # c3a <schedule>
        dispatch();
 cae:	00000097          	auipc	ra,0x0
 cb2:	eb2080e7          	jalr	-334(ra) # b60 <dispatch>
 cb6:	b7e5                	j	c9e <thread_yield+0x1e>

0000000000000cb8 <exit_preorder>:

}

void exit_preorder(struct thread *t)
{
    if(t!=NULL)
 cb8:	c929                	beqz	a0,d0a <exit_preorder+0x52>
{
 cba:	1101                	addi	sp,sp,-32
 cbc:	ec06                	sd	ra,24(sp)
 cbe:	e822                	sd	s0,16(sp)
 cc0:	e426                	sd	s1,8(sp)
 cc2:	1000                	addi	s0,sp,32
 cc4:	84aa                	mv	s1,a0
    {
        if(t==current_thread && t->left==NULL && t->right==NULL)
 cc6:	00000797          	auipc	a5,0x0
 cca:	2d27b783          	ld	a5,722(a5) # f98 <current_thread>
 cce:	02a78563          	beq	a5,a0,cf8 <exit_preorder+0x40>
        {
            ex_pre_end=t;
            return;
        }   
        ex_pre_end=t;
 cd2:	00000797          	auipc	a5,0x0
 cd6:	2a97b723          	sd	s1,686(a5) # f80 <ex_pre_end>
        
        exit_preorder(t->left);
 cda:	6cc8                	ld	a0,152(s1)
 cdc:	00000097          	auipc	ra,0x0
 ce0:	fdc080e7          	jalr	-36(ra) # cb8 <exit_preorder>
        exit_preorder(t->right);
 ce4:	70c8                	ld	a0,160(s1)
 ce6:	00000097          	auipc	ra,0x0
 cea:	fd2080e7          	jalr	-46(ra) # cb8 <exit_preorder>
    }

}
 cee:	60e2                	ld	ra,24(sp)
 cf0:	6442                	ld	s0,16(sp)
 cf2:	64a2                	ld	s1,8(sp)
 cf4:	6105                	addi	sp,sp,32
 cf6:	8082                	ret
        if(t==current_thread && t->left==NULL && t->right==NULL)
 cf8:	6d5c                	ld	a5,152(a0)
 cfa:	ffe1                	bnez	a5,cd2 <exit_preorder+0x1a>
 cfc:	715c                	ld	a5,160(a0)
 cfe:	fbf1                	bnez	a5,cd2 <exit_preorder+0x1a>
            ex_pre_end=t;
 d00:	00000797          	auipc	a5,0x0
 d04:	28a7b023          	sd	a0,640(a5) # f80 <ex_pre_end>
            return;
 d08:	b7dd                	j	cee <exit_preorder+0x36>
 d0a:	8082                	ret

0000000000000d0c <thread_exit>:
void thread_exit(void){
 d0c:	7179                	addi	sp,sp,-48
 d0e:	f406                	sd	ra,40(sp)
 d10:	f022                	sd	s0,32(sp)
 d12:	ec26                	sd	s1,24(sp)
 d14:	e84a                	sd	s2,16(sp)
 d16:	e44e                	sd	s3,8(sp)
 d18:	1800                	addi	s0,sp,48
    if(current_thread == root_thread && current_thread->left == NULL && current_thread->right == NULL){
 d1a:	00000497          	auipc	s1,0x0
 d1e:	27e4b483          	ld	s1,638(s1) # f98 <current_thread>
 d22:	00000997          	auipc	s3,0x0
 d26:	26e9b983          	ld	s3,622(s3) # f90 <root_thread>
 d2a:	0b348463          	beq	s1,s3,dd2 <thread_exit+0xc6>
        ex_pre_end=NULL;
 d2e:	00000917          	auipc	s2,0x0
 d32:	25290913          	addi	s2,s2,594 # f80 <ex_pre_end>
 d36:	00093023          	sd	zero,0(s2)
        exit_preorder(current_thread);
 d3a:	8526                	mv	a0,s1
 d3c:	00000097          	auipc	ra,0x0
 d40:	f7c080e7          	jalr	-132(ra) # cb8 <exit_preorder>
        if(ex_pre_end==current_thread)
 d44:	00093903          	ld	s2,0(s2)
 d48:	0d248763          	beq	s1,s2,e16 <thread_exit+0x10a>
            if(ex_pre_end == ex_pre_end->parent->left)
 d4c:	0a893783          	ld	a5,168(s2)
 d50:	6fd8                	ld	a4,152(a5)
 d52:	10e90763          	beq	s2,a4,e60 <thread_exit+0x154>
            else if(ex_pre_end == ex_pre_end->parent->right)
 d56:	73d8                	ld	a4,160(a5)
 d58:	10e90763          	beq	s2,a4,e66 <thread_exit+0x15a>
            if(ex_pre_end==current_thread->left) ex_pre_end->left=NULL;
 d5c:	6cdc                	ld	a5,152(s1)
 d5e:	10f90763          	beq	s2,a5,e6c <thread_exit+0x160>
 d62:	08f93c23          	sd	a5,152(s2)
            if(ex_pre_end==current_thread->right) ex_pre_end->right =NULL;
 d66:	70dc                	ld	a5,160(s1)
 d68:	10f90463          	beq	s2,a5,e70 <thread_exit+0x164>
 d6c:	0af93023          	sd	a5,160(s2)
            if(cur == root_thread)
 d70:	11348263          	beq	s1,s3,e74 <thread_exit+0x168>
                ex_pre_end->parent=current_thread->parent;
 d74:	74dc                	ld	a5,168(s1)
 d76:	0af93423          	sd	a5,168(s2)
                if(current_thread == current_thread->parent->left)
 d7a:	74dc                	ld	a5,168(s1)
 d7c:	6fd8                	ld	a4,152(a5)
 d7e:	12e48063          	beq	s1,a4,e9e <thread_exit+0x192>
                else if (current_thread == current_thread->parent->right)
 d82:	73d8                	ld	a4,160(a5)
 d84:	12e48063          	beq	s1,a4,ea4 <thread_exit+0x198>
                if(current_thread->left!=NULL)
 d88:	6cdc                	ld	a5,152(s1)
 d8a:	c399                	beqz	a5,d90 <thread_exit+0x84>
                    current_thread->left->parent=ex_pre_end;
 d8c:	0b27b423          	sd	s2,168(a5)
                if(current_thread->right!=NULL)
 d90:	70dc                	ld	a5,160(s1)
 d92:	c399                	beqz	a5,d98 <thread_exit+0x8c>
                    current_thread->right->parent=ex_pre_end;
 d94:	0b27b423          	sd	s2,168(a5)
                current_thread=ex_pre_end;
 d98:	00000797          	auipc	a5,0x0
 d9c:	2127b023          	sd	s2,512(a5) # f98 <current_thread>
            free(cur->stack);
 da0:	6888                	ld	a0,16(s1)
 da2:	00000097          	auipc	ra,0x0
 da6:	b0c080e7          	jalr	-1268(ra) # 8ae <free>
            free(cur);
 daa:	8526                	mv	a0,s1
 dac:	00000097          	auipc	ra,0x0
 db0:	b02080e7          	jalr	-1278(ra) # 8ae <free>
            schedule();
 db4:	00000097          	auipc	ra,0x0
 db8:	e86080e7          	jalr	-378(ra) # c3a <schedule>
            dispatch();
 dbc:	00000097          	auipc	ra,0x0
 dc0:	da4080e7          	jalr	-604(ra) # b60 <dispatch>
}
 dc4:	70a2                	ld	ra,40(sp)
 dc6:	7402                	ld	s0,32(sp)
 dc8:	64e2                	ld	s1,24(sp)
 dca:	6942                	ld	s2,16(sp)
 dcc:	69a2                	ld	s3,8(sp)
 dce:	6145                	addi	sp,sp,48
 dd0:	8082                	ret
    if(current_thread == root_thread && current_thread->left == NULL && current_thread->right == NULL){
 dd2:	6cdc                	ld	a5,152(s1)
 dd4:	ffa9                	bnez	a5,d2e <thread_exit+0x22>
 dd6:	70dc                	ld	a5,160(s1)
 dd8:	fbb9                	bnez	a5,d2e <thread_exit+0x22>
        free(current_thread->stack);
 dda:	6888                	ld	a0,16(s1)
 ddc:	00000097          	auipc	ra,0x0
 de0:	ad2080e7          	jalr	-1326(ra) # 8ae <free>
        free(current_thread);
 de4:	00000497          	auipc	s1,0x0
 de8:	1b448493          	addi	s1,s1,436 # f98 <current_thread>
 dec:	6088                	ld	a0,0(s1)
 dee:	00000097          	auipc	ra,0x0
 df2:	ac0080e7          	jalr	-1344(ra) # 8ae <free>
        current_thread=NULL;
 df6:	0004b023          	sd	zero,0(s1)
        root_thread=NULL;
 dfa:	00000797          	auipc	a5,0x0
 dfe:	1807bb23          	sd	zero,406(a5) # f90 <root_thread>
        longjmp(env_st,1);
 e02:	4585                	li	a1,1
 e04:	00000517          	auipc	a0,0x0
 e08:	1ac50513          	addi	a0,a0,428 # fb0 <env_st>
 e0c:	00000097          	auipc	ra,0x0
 e10:	c46080e7          	jalr	-954(ra) # a52 <longjmp>
 e14:	bf45                	j	dc4 <thread_exit+0xb8>
            schedule();
 e16:	00000097          	auipc	ra,0x0
 e1a:	e24080e7          	jalr	-476(ra) # c3a <schedule>
            if(ex_pre_end == ex_pre_end->parent->left)
 e1e:	0a893783          	ld	a5,168(s2)
 e22:	6fd8                	ld	a4,152(a5)
 e24:	02e90863          	beq	s2,a4,e54 <thread_exit+0x148>
            else if(ex_pre_end == ex_pre_end->parent->right)
 e28:	73d8                	ld	a4,160(a5)
 e2a:	02e90863          	beq	s2,a4,e5a <thread_exit+0x14e>
            free(ex_pre_end->stack);
 e2e:	01093503          	ld	a0,16(s2)
 e32:	00000097          	auipc	ra,0x0
 e36:	a7c080e7          	jalr	-1412(ra) # 8ae <free>
            free(ex_pre_end);
 e3a:	00000517          	auipc	a0,0x0
 e3e:	14653503          	ld	a0,326(a0) # f80 <ex_pre_end>
 e42:	00000097          	auipc	ra,0x0
 e46:	a6c080e7          	jalr	-1428(ra) # 8ae <free>
            dispatch();
 e4a:	00000097          	auipc	ra,0x0
 e4e:	d16080e7          	jalr	-746(ra) # b60 <dispatch>
 e52:	bf8d                	j	dc4 <thread_exit+0xb8>
                ex_pre_end->parent->left=NULL;
 e54:	0807bc23          	sd	zero,152(a5)
 e58:	bfd9                	j	e2e <thread_exit+0x122>
                ex_pre_end->parent->right=NULL;
 e5a:	0a07b023          	sd	zero,160(a5)
 e5e:	bfc1                	j	e2e <thread_exit+0x122>
                ex_pre_end->parent->left=NULL;
 e60:	0807bc23          	sd	zero,152(a5)
 e64:	bde5                	j	d5c <thread_exit+0x50>
                ex_pre_end->parent->right=NULL;
 e66:	0a07b023          	sd	zero,160(a5)
 e6a:	bdcd                	j	d5c <thread_exit+0x50>
            if(ex_pre_end==current_thread->left) ex_pre_end->left=NULL;
 e6c:	4781                	li	a5,0
 e6e:	bdd5                	j	d62 <thread_exit+0x56>
            if(ex_pre_end==current_thread->right) ex_pre_end->right =NULL;
 e70:	4781                	li	a5,0
 e72:	bded                	j	d6c <thread_exit+0x60>
                ex_pre_end->parent=NULL;
 e74:	0a093423          	sd	zero,168(s2)
                if(current_thread->left!=NULL)
 e78:	6cdc                	ld	a5,152(s1)
 e7a:	c399                	beqz	a5,e80 <thread_exit+0x174>
                    current_thread->left->parent=ex_pre_end;
 e7c:	0b27b423          	sd	s2,168(a5)
                if(current_thread->right!=NULL)
 e80:	70dc                	ld	a5,160(s1)
 e82:	c399                	beqz	a5,e88 <thread_exit+0x17c>
                    current_thread->right->parent=ex_pre_end;
 e84:	0b27b423          	sd	s2,168(a5)
                current_thread=ex_pre_end;
 e88:	00000797          	auipc	a5,0x0
 e8c:	1127b823          	sd	s2,272(a5) # f98 <current_thread>
                root_thread = ex_pre_end;
 e90:	00000797          	auipc	a5,0x0
 e94:	1127b023          	sd	s2,256(a5) # f90 <root_thread>
                root_thread->parent=NULL;
 e98:	0a093423          	sd	zero,168(s2)
 e9c:	b711                	j	da0 <thread_exit+0x94>
                    current_thread->parent->left=ex_pre_end;
 e9e:	0927bc23          	sd	s2,152(a5)
 ea2:	b5dd                	j	d88 <thread_exit+0x7c>
                    current_thread->parent->right=ex_pre_end;
 ea4:	0b27b023          	sd	s2,160(a5)
 ea8:	b5c5                	j	d88 <thread_exit+0x7c>

0000000000000eaa <thread_start_threading>:
void thread_start_threading(void){
 eaa:	1141                	addi	sp,sp,-16
 eac:	e406                	sd	ra,8(sp)
 eae:	e022                	sd	s0,0(sp)
 eb0:	0800                	addi	s0,sp,16
    // TODO
    if(setjmp(env_st)==0);
 eb2:	00000517          	auipc	a0,0x0
 eb6:	0fe50513          	addi	a0,a0,254 # fb0 <env_st>
 eba:	00000097          	auipc	ra,0x0
 ebe:	b60080e7          	jalr	-1184(ra) # a1a <setjmp>
 ec2:	c509                	beqz	a0,ecc <thread_start_threading+0x22>
    else 
        return;
    dispatch();

    
}
 ec4:	60a2                	ld	ra,8(sp)
 ec6:	6402                	ld	s0,0(sp)
 ec8:	0141                	addi	sp,sp,16
 eca:	8082                	ret
    dispatch();
 ecc:	00000097          	auipc	ra,0x0
 ed0:	c94080e7          	jalr	-876(ra) # b60 <dispatch>
 ed4:	bfc5                	j	ec4 <thread_start_threading+0x1a>
