
user/_threads:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <thread_create>:
static jmp_buf env_st;
//static jmp_buf env_tmp;
// TODO: necessary declares, if any


struct thread *thread_create(void (*f)(void *), void *arg){
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	1800                	addi	s0,sp,48
   e:	89aa                	mv	s3,a0
  10:	892e                	mv	s2,a1
    struct thread *t = (struct thread*) malloc(sizeof(struct thread));
  12:	0b000513          	li	a0,176
  16:	00001097          	auipc	ra,0x1
  1a:	a46080e7          	jalr	-1466(ra) # a5c <malloc>
  1e:	84aa                	mv	s1,a0
    //unsigned long stack_p = 0;
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long) malloc(sizeof(unsigned long)*0x100);
  20:	6505                	lui	a0,0x1
  22:	80050513          	addi	a0,a0,-2048 # 800 <vprintf+0x6e>
  26:	00001097          	auipc	ra,0x1
  2a:	a36080e7          	jalr	-1482(ra) # a5c <malloc>
    new_stack_p = new_stack +0x100*8-0x2*8;
    t->fp = f;
  2e:	0134b023          	sd	s3,0(s1)
    t->arg = arg;
  32:	0124b423          	sd	s2,8(s1)
    t->ID  = id;
  36:	00001717          	auipc	a4,0x1
  3a:	b9e70713          	addi	a4,a4,-1122 # bd4 <id>
  3e:	431c                	lw	a5,0(a4)
  40:	08f4a823          	sw	a5,144(s1)
    t->buf_set = 0;
  44:	0804aa23          	sw	zero,148(s1)
    t->stack = (void*) new_stack;
  48:	e888                	sd	a0,16(s1)
    new_stack_p = new_stack +0x100*8-0x2*8;
  4a:	7f050513          	addi	a0,a0,2032
    t->stack_p = (void*) new_stack_p;
  4e:	ec88                	sd	a0,24(s1)
    id++;
  50:	2785                	addiw	a5,a5,1
  52:	c31c                	sw	a5,0(a4)
    return t;
}
  54:	8526                	mv	a0,s1
  56:	70a2                	ld	ra,40(sp)
  58:	7402                	ld	s0,32(sp)
  5a:	64e2                	ld	s1,24(sp)
  5c:	6942                	ld	s2,16(sp)
  5e:	69a2                	ld	s3,8(sp)
  60:	6145                	addi	sp,sp,48
  62:	8082                	ret

0000000000000064 <thread_add_runqueue>:
void thread_add_runqueue(struct thread *t){
    if(current_thread == NULL){
  64:	00001797          	auipc	a5,0x1
  68:	b7c7b783          	ld	a5,-1156(a5) # be0 <current_thread>
  6c:	c38d                	beqz	a5,8e <thread_add_runqueue+0x2a>
        t->right=NULL;
        t->parent=NULL;
    }
    else{
        // TODO
        if(current_thread->left != NULL && current_thread->right != NULL)
  6e:	6fd8                	ld	a4,152(a5)
  70:	cf15                	beqz	a4,ac <thread_add_runqueue+0x48>
  72:	73d8                	ld	a4,160(a5)
  74:	cf15                	beqz	a4,b0 <thread_add_runqueue+0x4c>
void thread_add_runqueue(struct thread *t){
  76:	1141                	addi	sp,sp,-16
  78:	e406                	sd	ra,8(sp)
  7a:	e022                	sd	s0,0(sp)
  7c:	0800                	addi	s0,sp,16
        {
            free(t);
  7e:	00001097          	auipc	ra,0x1
  82:	956080e7          	jalr	-1706(ra) # 9d4 <free>
            t->right=NULL;
        }
        

    }
}
  86:	60a2                	ld	ra,8(sp)
  88:	6402                	ld	s0,0(sp)
  8a:	0141                	addi	sp,sp,16
  8c:	8082                	ret
        current_thread=t;
  8e:	00001797          	auipc	a5,0x1
  92:	b4a7b923          	sd	a0,-1198(a5) # be0 <current_thread>
        root_thread=t;
  96:	00001797          	auipc	a5,0x1
  9a:	b4a7b123          	sd	a0,-1214(a5) # bd8 <root_thread>
        t->left=NULL;
  9e:	08053c23          	sd	zero,152(a0)
        t->right=NULL;
  a2:	0a053023          	sd	zero,160(a0)
        t->parent=NULL;
  a6:	0a053423          	sd	zero,168(a0)
  aa:	8082                	ret
                current_thread->left=t;
  ac:	efc8                	sd	a0,152(a5)
  ae:	a011                	j	b2 <thread_add_runqueue+0x4e>
                current_thread->right=t;
  b0:	f3c8                	sd	a0,160(a5)
            t->parent=current_thread;
  b2:	f55c                	sd	a5,168(a0)
            t->left=NULL;
  b4:	08053c23          	sd	zero,152(a0)
            t->right=NULL;
  b8:	0a053023          	sd	zero,160(a0)
  bc:	8082                	ret

00000000000000be <dispatch>:
    // TODO
    setjmp(current_thread->env);
    schedule();
    dispatch();
}
void dispatch(void){
  be:	1141                	addi	sp,sp,-16
  c0:	e406                	sd	ra,8(sp)
  c2:	e022                	sd	s0,0(sp)
  c4:	0800                	addi	s0,sp,16
    // TODO
    if(current_thread->buf_set==0)
  c6:	00001517          	auipc	a0,0x1
  ca:	b1a53503          	ld	a0,-1254(a0) # be0 <current_thread>
  ce:	09452783          	lw	a5,148(a0)
  d2:	e3b1                	bnez	a5,116 <dispatch+0x58>
    {      
        if(setjmp(current_thread->env)==0)
  d4:	02050513          	addi	a0,a0,32
  d8:	00001097          	auipc	ra,0x1
  dc:	a68080e7          	jalr	-1432(ra) # b40 <setjmp>
  e0:	ed01                	bnez	a0,f8 <dispatch+0x3a>
        {
            current_thread->env->sp=(unsigned long)current_thread->stack_p;
  e2:	00001797          	auipc	a5,0x1
  e6:	afe7b783          	ld	a5,-1282(a5) # be0 <current_thread>
  ea:	6f98                	ld	a4,24(a5)
  ec:	e7d8                	sd	a4,136(a5)
            current_thread->env->ra=(unsigned long)current_thread->fp;
  ee:	6398                	ld	a4,0(a5)
  f0:	e3d8                	sd	a4,128(a5)
            current_thread->buf_set=1;
  f2:	4705                	li	a4,1
  f4:	08e7aa23          	sw	a4,148(a5)
        }
        longjmp(current_thread->env,1);
  f8:	4585                	li	a1,1
  fa:	00001517          	auipc	a0,0x1
  fe:	ae653503          	ld	a0,-1306(a0) # be0 <current_thread>
 102:	02050513          	addi	a0,a0,32
 106:	00001097          	auipc	ra,0x1
 10a:	a72080e7          	jalr	-1422(ra) # b78 <longjmp>
    }
    else
    {
        longjmp(current_thread->env,1);
    }
}
 10e:	60a2                	ld	ra,8(sp)
 110:	6402                	ld	s0,0(sp)
 112:	0141                	addi	sp,sp,16
 114:	8082                	ret
        longjmp(current_thread->env,1);
 116:	4585                	li	a1,1
 118:	02050513          	addi	a0,a0,32
 11c:	00001097          	auipc	ra,0x1
 120:	a5c080e7          	jalr	-1444(ra) # b78 <longjmp>
}
 124:	b7ed                	j	10e <dispatch+0x50>

0000000000000126 <schedule>:
void schedule(void){
 126:	1141                	addi	sp,sp,-16
 128:	e422                	sd	s0,8(sp)
 12a:	0800                	addi	s0,sp,16
    // TODO
    if(current_thread->left != NULL)
 12c:	00001717          	auipc	a4,0x1
 130:	ab473703          	ld	a4,-1356(a4) # be0 <current_thread>
 134:	6f5c                	ld	a5,152(a4)
 136:	cb81                	beqz	a5,146 <schedule+0x20>
    {
        current_thread = current_thread->left;
 138:	00001717          	auipc	a4,0x1
 13c:	aaf73423          	sd	a5,-1368(a4) # be0 <current_thread>
        while(current_thread->parent->right==NULL && current_thread!=root_thread)
            current_thread=current_thread->parent;
        if(current_thread!=root_thread)
            current_thread = current_thread->parent->right; 
    }
}
 140:	6422                	ld	s0,8(sp)
 142:	0141                	addi	sp,sp,16
 144:	8082                	ret
    else if(current_thread->left ==NULL && current_thread->parent->right!=NULL)
 146:	775c                	ld	a5,168(a4)
 148:	73d4                	ld	a3,160(a5)
 14a:	ca81                	beqz	a3,15a <schedule+0x34>
        if(current_thread != current_thread->parent->right)
 14c:	02d70663          	beq	a4,a3,178 <schedule+0x52>
            current_thread = current_thread->parent->right;
 150:	00001797          	auipc	a5,0x1
 154:	a8d7b823          	sd	a3,-1392(a5) # be0 <current_thread>
 158:	b7e5                	j	140 <schedule+0x1a>
        while(current_thread->parent->right==NULL && current_thread!=root_thread)
 15a:	00001597          	auipc	a1,0x1
 15e:	a7e5b583          	ld	a1,-1410(a1) # bd8 <root_thread>
 162:	4501                	li	a0,0
 164:	4805                	li	a6,1
 166:	08e58563          	beq	a1,a4,1f0 <schedule+0xca>
 16a:	77d4                	ld	a3,168(a5)
 16c:	72d0                	ld	a2,160(a3)
 16e:	873e                	mv	a4,a5
 170:	8542                	mv	a0,a6
 172:	e649                	bnez	a2,1fc <schedule+0xd6>
 174:	87b6                	mv	a5,a3
 176:	bfc5                	j	166 <schedule+0x40>
            current_thread=current_thread->parent;
 178:	00001717          	auipc	a4,0x1
 17c:	a6f73423          	sd	a5,-1432(a4) # be0 <current_thread>
            while(current_thread == current_thread->parent->right)
 180:	77d8                	ld	a4,168(a5)
 182:	7354                	ld	a3,160(a4)
 184:	00d79b63          	bne	a5,a3,19a <schedule+0x74>
                current_thread=current_thread->parent->left;
 188:	6f5c                	ld	a5,152(a4)
            while(current_thread == current_thread->parent->right)
 18a:	77d8                	ld	a4,168(a5)
 18c:	7354                	ld	a3,160(a4)
 18e:	fed78de3          	beq	a5,a3,188 <schedule+0x62>
 192:	00001717          	auipc	a4,0x1
 196:	a4f73723          	sd	a5,-1458(a4) # be0 <current_thread>
            if(current_thread!=root_thread)
 19a:	00001597          	auipc	a1,0x1
 19e:	a3e5b583          	ld	a1,-1474(a1) # bd8 <root_thread>
 1a2:	f8f58fe3          	beq	a1,a5,140 <schedule+0x1a>
                while(current_thread->parent->right==NULL && current_thread!=root_thread)
 1a6:	00001697          	auipc	a3,0x1
 1aa:	a3a6b683          	ld	a3,-1478(a3) # be0 <current_thread>
 1ae:	76dc                	ld	a5,168(a3)
 1b0:	73d0                	ld	a2,160(a5)
 1b2:	4501                	li	a0,0
 1b4:	4805                	li	a6,1
 1b6:	ea11                	bnez	a2,1ca <schedule+0xa4>
 1b8:	00d58b63          	beq	a1,a3,1ce <schedule+0xa8>
 1bc:	77d8                	ld	a4,168(a5)
 1be:	7350                	ld	a2,160(a4)
 1c0:	86be                	mv	a3,a5
 1c2:	8542                	mv	a0,a6
 1c4:	ea19                	bnez	a2,1da <schedule+0xb4>
 1c6:	87ba                	mv	a5,a4
 1c8:	bfc5                	j	1b8 <schedule+0x92>
 1ca:	87b6                	mv	a5,a3
 1cc:	a819                	j	1e2 <schedule+0xbc>
 1ce:	d92d                	beqz	a0,140 <schedule+0x1a>
 1d0:	00001797          	auipc	a5,0x1
 1d4:	a0d7b823          	sd	a3,-1520(a5) # be0 <current_thread>
 1d8:	b7a5                	j	140 <schedule+0x1a>
 1da:	00001717          	auipc	a4,0x1
 1de:	a0f73323          	sd	a5,-1530(a4) # be0 <current_thread>
                if(current_thread!=root_thread)
 1e2:	f4f58fe3          	beq	a1,a5,140 <schedule+0x1a>
                    current_thread=current_thread->parent->right;
 1e6:	00001797          	auipc	a5,0x1
 1ea:	9ec7bd23          	sd	a2,-1542(a5) # be0 <current_thread>
 1ee:	bf89                	j	140 <schedule+0x1a>
 1f0:	d921                	beqz	a0,140 <schedule+0x1a>
 1f2:	00001797          	auipc	a5,0x1
 1f6:	9ee7b723          	sd	a4,-1554(a5) # be0 <current_thread>
 1fa:	b799                	j	140 <schedule+0x1a>
 1fc:	00001717          	auipc	a4,0x1
 200:	9ef73223          	sd	a5,-1564(a4) # be0 <current_thread>
        if(current_thread!=root_thread)
 204:	f2f58ee3          	beq	a1,a5,140 <schedule+0x1a>
            current_thread = current_thread->parent->right; 
 208:	00001797          	auipc	a5,0x1
 20c:	9cc7bc23          	sd	a2,-1576(a5) # be0 <current_thread>
}
 210:	bf05                	j	140 <schedule+0x1a>

0000000000000212 <thread_yield>:
void thread_yield(void){
 212:	1141                	addi	sp,sp,-16
 214:	e406                	sd	ra,8(sp)
 216:	e022                	sd	s0,0(sp)
 218:	0800                	addi	s0,sp,16
    setjmp(current_thread->env);
 21a:	00001517          	auipc	a0,0x1
 21e:	9c653503          	ld	a0,-1594(a0) # be0 <current_thread>
 222:	02050513          	addi	a0,a0,32
 226:	00001097          	auipc	ra,0x1
 22a:	91a080e7          	jalr	-1766(ra) # b40 <setjmp>
    schedule();
 22e:	00000097          	auipc	ra,0x0
 232:	ef8080e7          	jalr	-264(ra) # 126 <schedule>
    dispatch();
 236:	00000097          	auipc	ra,0x0
 23a:	e88080e7          	jalr	-376(ra) # be <dispatch>
}
 23e:	60a2                	ld	ra,8(sp)
 240:	6402                	ld	s0,0(sp)
 242:	0141                	addi	sp,sp,16
 244:	8082                	ret

0000000000000246 <exit_preorder>:
        
    }
}

struct thread * exit_preorder(struct thread *t)
{
 246:	1141                	addi	sp,sp,-16
 248:	e406                	sd	ra,8(sp)
 24a:	e022                	sd	s0,0(sp)
 24c:	0800                	addi	s0,sp,16

    if(t->left ==NULL && t->right==NULL)
 24e:	6d58                	ld	a4,152(a0)
 250:	cf11                	beqz	a4,26c <exit_preorder+0x26>
    {
        return t;
    }
    else if(t->right!=NULL)
 252:	715c                	ld	a5,160(a0)
 254:	cf99                	beqz	a5,272 <exit_preorder+0x2c>
    {
        struct thread * cur=t->right;
        while(cur->right!=NULL)
 256:	853e                	mv	a0,a5
 258:	73dc                	ld	a5,160(a5)
 25a:	fff5                	bnez	a5,256 <exit_preorder+0x10>
            cur=cur->right;
        return (struct thread *)exit_preorder(cur);
 25c:	00000097          	auipc	ra,0x0
 260:	fea080e7          	jalr	-22(ra) # 246 <exit_preorder>
    else if(t->right==NULL && t->left!=NULL)
    {
        return (struct thread *)exit_preorder(t->left);
    }
    return t;
}
 264:	60a2                	ld	ra,8(sp)
 266:	6402                	ld	s0,0(sp)
 268:	0141                	addi	sp,sp,16
 26a:	8082                	ret
    if(t->left ==NULL && t->right==NULL)
 26c:	715c                	ld	a5,160(a0)
 26e:	f7e5                	bnez	a5,256 <exit_preorder+0x10>
 270:	bfd5                	j	264 <exit_preorder+0x1e>
        return (struct thread *)exit_preorder(t->left);
 272:	853a                	mv	a0,a4
 274:	00000097          	auipc	ra,0x0
 278:	fd2080e7          	jalr	-46(ra) # 246 <exit_preorder>
 27c:	b7e5                	j	264 <exit_preorder+0x1e>

000000000000027e <thread_exit>:
void thread_exit(void){
 27e:	1101                	addi	sp,sp,-32
 280:	ec06                	sd	ra,24(sp)
 282:	e822                	sd	s0,16(sp)
 284:	e426                	sd	s1,8(sp)
 286:	e04a                	sd	s2,0(sp)
 288:	1000                	addi	s0,sp,32
    if(current_thread == root_thread && current_thread->left == NULL && current_thread->right == NULL){
 28a:	00001497          	auipc	s1,0x1
 28e:	9564b483          	ld	s1,-1706(s1) # be0 <current_thread>
 292:	00001917          	auipc	s2,0x1
 296:	94693903          	ld	s2,-1722(s2) # bd8 <root_thread>
 29a:	07248463          	beq	s1,s2,302 <thread_exit+0x84>
        struct thread * epr=exit_preorder(current_thread);
 29e:	8526                	mv	a0,s1
 2a0:	00000097          	auipc	ra,0x0
 2a4:	fa6080e7          	jalr	-90(ra) # 246 <exit_preorder>
        if(epr == epr->parent->left)
 2a8:	755c                	ld	a5,168(a0)
 2aa:	6fd8                	ld	a4,152(a5)
 2ac:	08a70663          	beq	a4,a0,338 <thread_exit+0xba>
        else if(epr == epr->parent->right)
 2b0:	73d8                	ld	a4,160(a5)
 2b2:	08a70663          	beq	a4,a0,33e <thread_exit+0xc0>
        if(cur == root_thread)
 2b6:	09248763          	beq	s1,s2,344 <thread_exit+0xc6>
            epr->parent=cur->parent;
 2ba:	74dc                	ld	a5,168(s1)
 2bc:	f55c                	sd	a5,168(a0)
        epr->left=cur->left;
 2be:	6cdc                	ld	a5,152(s1)
 2c0:	ed5c                	sd	a5,152(a0)
        epr->right=cur->right;
 2c2:	70dc                	ld	a5,160(s1)
 2c4:	f15c                	sd	a5,160(a0)
        if(cur == cur->parent->left)
 2c6:	74dc                	ld	a5,168(s1)
 2c8:	6fd8                	ld	a4,152(a5)
 2ca:	08e48263          	beq	s1,a4,34e <thread_exit+0xd0>
        else if (cur == cur->parent->right)
 2ce:	73d8                	ld	a4,160(a5)
 2d0:	08e48163          	beq	s1,a4,352 <thread_exit+0xd4>
        current_thread=epr;
 2d4:	00001797          	auipc	a5,0x1
 2d8:	90a7b623          	sd	a0,-1780(a5) # be0 <current_thread>
        free(cur);
 2dc:	8526                	mv	a0,s1
 2de:	00000097          	auipc	ra,0x0
 2e2:	6f6080e7          	jalr	1782(ra) # 9d4 <free>
        schedule();
 2e6:	00000097          	auipc	ra,0x0
 2ea:	e40080e7          	jalr	-448(ra) # 126 <schedule>
        dispatch();
 2ee:	00000097          	auipc	ra,0x0
 2f2:	dd0080e7          	jalr	-560(ra) # be <dispatch>
}
 2f6:	60e2                	ld	ra,24(sp)
 2f8:	6442                	ld	s0,16(sp)
 2fa:	64a2                	ld	s1,8(sp)
 2fc:	6902                	ld	s2,0(sp)
 2fe:	6105                	addi	sp,sp,32
 300:	8082                	ret
    if(current_thread == root_thread && current_thread->left == NULL && current_thread->right == NULL){
 302:	6cdc                	ld	a5,152(s1)
 304:	ffc9                	bnez	a5,29e <thread_exit+0x20>
 306:	70dc                	ld	a5,160(s1)
 308:	fbd9                	bnez	a5,29e <thread_exit+0x20>
        free(current_thread);
 30a:	8526                	mv	a0,s1
 30c:	00000097          	auipc	ra,0x0
 310:	6c8080e7          	jalr	1736(ra) # 9d4 <free>
        current_thread=NULL;
 314:	00001797          	auipc	a5,0x1
 318:	8c07b623          	sd	zero,-1844(a5) # be0 <current_thread>
        root_thread=NULL;
 31c:	00001797          	auipc	a5,0x1
 320:	8a07be23          	sd	zero,-1860(a5) # bd8 <root_thread>
        longjmp(env_st,1);
 324:	4585                	li	a1,1
 326:	00001517          	auipc	a0,0x1
 32a:	8ca50513          	addi	a0,a0,-1846 # bf0 <env_st>
 32e:	00001097          	auipc	ra,0x1
 332:	84a080e7          	jalr	-1974(ra) # b78 <longjmp>
 336:	b7c1                	j	2f6 <thread_exit+0x78>
            epr->parent->left=NULL;
 338:	0807bc23          	sd	zero,152(a5)
 33c:	bfad                	j	2b6 <thread_exit+0x38>
            epr->parent->right=NULL;
 33e:	0a07b023          	sd	zero,160(a5)
 342:	bf95                	j	2b6 <thread_exit+0x38>
            root_thread = epr;
 344:	00001797          	auipc	a5,0x1
 348:	88a7ba23          	sd	a0,-1900(a5) # bd8 <root_thread>
 34c:	bf8d                	j	2be <thread_exit+0x40>
            cur->parent->left=epr;
 34e:	efc8                	sd	a0,152(a5)
 350:	b751                	j	2d4 <thread_exit+0x56>
            cur->parent->right=epr;
 352:	f3c8                	sd	a0,160(a5)
 354:	b741                	j	2d4 <thread_exit+0x56>

0000000000000356 <thread_start_threading>:
void thread_start_threading(void){
 356:	1141                	addi	sp,sp,-16
 358:	e406                	sd	ra,8(sp)
 35a:	e022                	sd	s0,0(sp)
 35c:	0800                	addi	s0,sp,16
    // TODO
    setjmp(env_st);
 35e:	00001517          	auipc	a0,0x1
 362:	89250513          	addi	a0,a0,-1902 # bf0 <env_st>
 366:	00000097          	auipc	ra,0x0
 36a:	7da080e7          	jalr	2010(ra) # b40 <setjmp>
    if(setjmp(current_thread->env)==0)
 36e:	00001517          	auipc	a0,0x1
 372:	87253503          	ld	a0,-1934(a0) # be0 <current_thread>
 376:	02050513          	addi	a0,a0,32
 37a:	00000097          	auipc	ra,0x0
 37e:	7c6080e7          	jalr	1990(ra) # b40 <setjmp>
 382:	ed01                	bnez	a0,39a <thread_start_threading+0x44>
    {
        current_thread->env->sp=(unsigned long)current_thread->stack_p;
 384:	00001797          	auipc	a5,0x1
 388:	85c7b783          	ld	a5,-1956(a5) # be0 <current_thread>
 38c:	6f98                	ld	a4,24(a5)
 38e:	e7d8                	sd	a4,136(a5)
        current_thread->env->ra=(unsigned long)current_thread->fp;
 390:	6398                	ld	a4,0(a5)
 392:	e3d8                	sd	a4,128(a5)
        current_thread->buf_set=1;
 394:	4705                	li	a4,1
 396:	08e7aa23          	sw	a4,148(a5)
    }
    longjmp(current_thread->env,1);
 39a:	4585                	li	a1,1
 39c:	00001517          	auipc	a0,0x1
 3a0:	84453503          	ld	a0,-1980(a0) # be0 <current_thread>
 3a4:	02050513          	addi	a0,a0,32
 3a8:	00000097          	auipc	ra,0x0
 3ac:	7d0080e7          	jalr	2000(ra) # b78 <longjmp>
}
 3b0:	60a2                	ld	ra,8(sp)
 3b2:	6402                	ld	s0,0(sp)
 3b4:	0141                	addi	sp,sp,16
 3b6:	8082                	ret

00000000000003b8 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 3b8:	1141                	addi	sp,sp,-16
 3ba:	e422                	sd	s0,8(sp)
 3bc:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3be:	87aa                	mv	a5,a0
 3c0:	0585                	addi	a1,a1,1
 3c2:	0785                	addi	a5,a5,1
 3c4:	fff5c703          	lbu	a4,-1(a1)
 3c8:	fee78fa3          	sb	a4,-1(a5)
 3cc:	fb75                	bnez	a4,3c0 <strcpy+0x8>
    ;
  return os;
}
 3ce:	6422                	ld	s0,8(sp)
 3d0:	0141                	addi	sp,sp,16
 3d2:	8082                	ret

00000000000003d4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3d4:	1141                	addi	sp,sp,-16
 3d6:	e422                	sd	s0,8(sp)
 3d8:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 3da:	00054783          	lbu	a5,0(a0)
 3de:	cb91                	beqz	a5,3f2 <strcmp+0x1e>
 3e0:	0005c703          	lbu	a4,0(a1)
 3e4:	00f71763          	bne	a4,a5,3f2 <strcmp+0x1e>
    p++, q++;
 3e8:	0505                	addi	a0,a0,1
 3ea:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 3ec:	00054783          	lbu	a5,0(a0)
 3f0:	fbe5                	bnez	a5,3e0 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 3f2:	0005c503          	lbu	a0,0(a1)
}
 3f6:	40a7853b          	subw	a0,a5,a0
 3fa:	6422                	ld	s0,8(sp)
 3fc:	0141                	addi	sp,sp,16
 3fe:	8082                	ret

0000000000000400 <strlen>:

uint
strlen(const char *s)
{
 400:	1141                	addi	sp,sp,-16
 402:	e422                	sd	s0,8(sp)
 404:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 406:	00054783          	lbu	a5,0(a0)
 40a:	cf91                	beqz	a5,426 <strlen+0x26>
 40c:	0505                	addi	a0,a0,1
 40e:	87aa                	mv	a5,a0
 410:	4685                	li	a3,1
 412:	9e89                	subw	a3,a3,a0
 414:	00f6853b          	addw	a0,a3,a5
 418:	0785                	addi	a5,a5,1
 41a:	fff7c703          	lbu	a4,-1(a5)
 41e:	fb7d                	bnez	a4,414 <strlen+0x14>
    ;
  return n;
}
 420:	6422                	ld	s0,8(sp)
 422:	0141                	addi	sp,sp,16
 424:	8082                	ret
  for(n = 0; s[n]; n++)
 426:	4501                	li	a0,0
 428:	bfe5                	j	420 <strlen+0x20>

000000000000042a <memset>:

void*
memset(void *dst, int c, uint n)
{
 42a:	1141                	addi	sp,sp,-16
 42c:	e422                	sd	s0,8(sp)
 42e:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 430:	ca19                	beqz	a2,446 <memset+0x1c>
 432:	87aa                	mv	a5,a0
 434:	1602                	slli	a2,a2,0x20
 436:	9201                	srli	a2,a2,0x20
 438:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 43c:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 440:	0785                	addi	a5,a5,1
 442:	fee79de3          	bne	a5,a4,43c <memset+0x12>
  }
  return dst;
}
 446:	6422                	ld	s0,8(sp)
 448:	0141                	addi	sp,sp,16
 44a:	8082                	ret

000000000000044c <strchr>:

char*
strchr(const char *s, char c)
{
 44c:	1141                	addi	sp,sp,-16
 44e:	e422                	sd	s0,8(sp)
 450:	0800                	addi	s0,sp,16
  for(; *s; s++)
 452:	00054783          	lbu	a5,0(a0)
 456:	cb99                	beqz	a5,46c <strchr+0x20>
    if(*s == c)
 458:	00f58763          	beq	a1,a5,466 <strchr+0x1a>
  for(; *s; s++)
 45c:	0505                	addi	a0,a0,1
 45e:	00054783          	lbu	a5,0(a0)
 462:	fbfd                	bnez	a5,458 <strchr+0xc>
      return (char*)s;
  return 0;
 464:	4501                	li	a0,0
}
 466:	6422                	ld	s0,8(sp)
 468:	0141                	addi	sp,sp,16
 46a:	8082                	ret
  return 0;
 46c:	4501                	li	a0,0
 46e:	bfe5                	j	466 <strchr+0x1a>

0000000000000470 <gets>:

char*
gets(char *buf, int max)
{
 470:	711d                	addi	sp,sp,-96
 472:	ec86                	sd	ra,88(sp)
 474:	e8a2                	sd	s0,80(sp)
 476:	e4a6                	sd	s1,72(sp)
 478:	e0ca                	sd	s2,64(sp)
 47a:	fc4e                	sd	s3,56(sp)
 47c:	f852                	sd	s4,48(sp)
 47e:	f456                	sd	s5,40(sp)
 480:	f05a                	sd	s6,32(sp)
 482:	ec5e                	sd	s7,24(sp)
 484:	1080                	addi	s0,sp,96
 486:	8baa                	mv	s7,a0
 488:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 48a:	892a                	mv	s2,a0
 48c:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 48e:	4aa9                	li	s5,10
 490:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 492:	89a6                	mv	s3,s1
 494:	2485                	addiw	s1,s1,1
 496:	0344d863          	bge	s1,s4,4c6 <gets+0x56>
    cc = read(0, &c, 1);
 49a:	4605                	li	a2,1
 49c:	faf40593          	addi	a1,s0,-81
 4a0:	4501                	li	a0,0
 4a2:	00000097          	auipc	ra,0x0
 4a6:	19c080e7          	jalr	412(ra) # 63e <read>
    if(cc < 1)
 4aa:	00a05e63          	blez	a0,4c6 <gets+0x56>
    buf[i++] = c;
 4ae:	faf44783          	lbu	a5,-81(s0)
 4b2:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 4b6:	01578763          	beq	a5,s5,4c4 <gets+0x54>
 4ba:	0905                	addi	s2,s2,1
 4bc:	fd679be3          	bne	a5,s6,492 <gets+0x22>
  for(i=0; i+1 < max; ){
 4c0:	89a6                	mv	s3,s1
 4c2:	a011                	j	4c6 <gets+0x56>
 4c4:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 4c6:	99de                	add	s3,s3,s7
 4c8:	00098023          	sb	zero,0(s3)
  return buf;
}
 4cc:	855e                	mv	a0,s7
 4ce:	60e6                	ld	ra,88(sp)
 4d0:	6446                	ld	s0,80(sp)
 4d2:	64a6                	ld	s1,72(sp)
 4d4:	6906                	ld	s2,64(sp)
 4d6:	79e2                	ld	s3,56(sp)
 4d8:	7a42                	ld	s4,48(sp)
 4da:	7aa2                	ld	s5,40(sp)
 4dc:	7b02                	ld	s6,32(sp)
 4de:	6be2                	ld	s7,24(sp)
 4e0:	6125                	addi	sp,sp,96
 4e2:	8082                	ret

00000000000004e4 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e4:	1101                	addi	sp,sp,-32
 4e6:	ec06                	sd	ra,24(sp)
 4e8:	e822                	sd	s0,16(sp)
 4ea:	e426                	sd	s1,8(sp)
 4ec:	e04a                	sd	s2,0(sp)
 4ee:	1000                	addi	s0,sp,32
 4f0:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4f2:	4581                	li	a1,0
 4f4:	00000097          	auipc	ra,0x0
 4f8:	172080e7          	jalr	370(ra) # 666 <open>
  if(fd < 0)
 4fc:	02054563          	bltz	a0,526 <stat+0x42>
 500:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 502:	85ca                	mv	a1,s2
 504:	00000097          	auipc	ra,0x0
 508:	17a080e7          	jalr	378(ra) # 67e <fstat>
 50c:	892a                	mv	s2,a0
  close(fd);
 50e:	8526                	mv	a0,s1
 510:	00000097          	auipc	ra,0x0
 514:	13e080e7          	jalr	318(ra) # 64e <close>
  return r;
}
 518:	854a                	mv	a0,s2
 51a:	60e2                	ld	ra,24(sp)
 51c:	6442                	ld	s0,16(sp)
 51e:	64a2                	ld	s1,8(sp)
 520:	6902                	ld	s2,0(sp)
 522:	6105                	addi	sp,sp,32
 524:	8082                	ret
    return -1;
 526:	597d                	li	s2,-1
 528:	bfc5                	j	518 <stat+0x34>

000000000000052a <atoi>:

int
atoi(const char *s)
{
 52a:	1141                	addi	sp,sp,-16
 52c:	e422                	sd	s0,8(sp)
 52e:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 530:	00054603          	lbu	a2,0(a0)
 534:	fd06079b          	addiw	a5,a2,-48
 538:	0ff7f793          	andi	a5,a5,255
 53c:	4725                	li	a4,9
 53e:	02f76963          	bltu	a4,a5,570 <atoi+0x46>
 542:	86aa                	mv	a3,a0
  n = 0;
 544:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 546:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 548:	0685                	addi	a3,a3,1
 54a:	0025179b          	slliw	a5,a0,0x2
 54e:	9fa9                	addw	a5,a5,a0
 550:	0017979b          	slliw	a5,a5,0x1
 554:	9fb1                	addw	a5,a5,a2
 556:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 55a:	0006c603          	lbu	a2,0(a3)
 55e:	fd06071b          	addiw	a4,a2,-48
 562:	0ff77713          	andi	a4,a4,255
 566:	fee5f1e3          	bgeu	a1,a4,548 <atoi+0x1e>
  return n;
}
 56a:	6422                	ld	s0,8(sp)
 56c:	0141                	addi	sp,sp,16
 56e:	8082                	ret
  n = 0;
 570:	4501                	li	a0,0
 572:	bfe5                	j	56a <atoi+0x40>

0000000000000574 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 574:	1141                	addi	sp,sp,-16
 576:	e422                	sd	s0,8(sp)
 578:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 57a:	02b57463          	bgeu	a0,a1,5a2 <memmove+0x2e>
    while(n-- > 0)
 57e:	00c05f63          	blez	a2,59c <memmove+0x28>
 582:	1602                	slli	a2,a2,0x20
 584:	9201                	srli	a2,a2,0x20
 586:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 58a:	872a                	mv	a4,a0
      *dst++ = *src++;
 58c:	0585                	addi	a1,a1,1
 58e:	0705                	addi	a4,a4,1
 590:	fff5c683          	lbu	a3,-1(a1)
 594:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 598:	fee79ae3          	bne	a5,a4,58c <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 59c:	6422                	ld	s0,8(sp)
 59e:	0141                	addi	sp,sp,16
 5a0:	8082                	ret
    dst += n;
 5a2:	00c50733          	add	a4,a0,a2
    src += n;
 5a6:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 5a8:	fec05ae3          	blez	a2,59c <memmove+0x28>
 5ac:	fff6079b          	addiw	a5,a2,-1
 5b0:	1782                	slli	a5,a5,0x20
 5b2:	9381                	srli	a5,a5,0x20
 5b4:	fff7c793          	not	a5,a5
 5b8:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 5ba:	15fd                	addi	a1,a1,-1
 5bc:	177d                	addi	a4,a4,-1
 5be:	0005c683          	lbu	a3,0(a1)
 5c2:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 5c6:	fee79ae3          	bne	a5,a4,5ba <memmove+0x46>
 5ca:	bfc9                	j	59c <memmove+0x28>

00000000000005cc <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 5cc:	1141                	addi	sp,sp,-16
 5ce:	e422                	sd	s0,8(sp)
 5d0:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 5d2:	ca05                	beqz	a2,602 <memcmp+0x36>
 5d4:	fff6069b          	addiw	a3,a2,-1
 5d8:	1682                	slli	a3,a3,0x20
 5da:	9281                	srli	a3,a3,0x20
 5dc:	0685                	addi	a3,a3,1
 5de:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 5e0:	00054783          	lbu	a5,0(a0)
 5e4:	0005c703          	lbu	a4,0(a1)
 5e8:	00e79863          	bne	a5,a4,5f8 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 5ec:	0505                	addi	a0,a0,1
    p2++;
 5ee:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 5f0:	fed518e3          	bne	a0,a3,5e0 <memcmp+0x14>
  }
  return 0;
 5f4:	4501                	li	a0,0
 5f6:	a019                	j	5fc <memcmp+0x30>
      return *p1 - *p2;
 5f8:	40e7853b          	subw	a0,a5,a4
}
 5fc:	6422                	ld	s0,8(sp)
 5fe:	0141                	addi	sp,sp,16
 600:	8082                	ret
  return 0;
 602:	4501                	li	a0,0
 604:	bfe5                	j	5fc <memcmp+0x30>

0000000000000606 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 606:	1141                	addi	sp,sp,-16
 608:	e406                	sd	ra,8(sp)
 60a:	e022                	sd	s0,0(sp)
 60c:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 60e:	00000097          	auipc	ra,0x0
 612:	f66080e7          	jalr	-154(ra) # 574 <memmove>
}
 616:	60a2                	ld	ra,8(sp)
 618:	6402                	ld	s0,0(sp)
 61a:	0141                	addi	sp,sp,16
 61c:	8082                	ret

000000000000061e <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 61e:	4885                	li	a7,1
 ecall
 620:	00000073          	ecall
 ret
 624:	8082                	ret

0000000000000626 <exit>:
.global exit
exit:
 li a7, SYS_exit
 626:	4889                	li	a7,2
 ecall
 628:	00000073          	ecall
 ret
 62c:	8082                	ret

000000000000062e <wait>:
.global wait
wait:
 li a7, SYS_wait
 62e:	488d                	li	a7,3
 ecall
 630:	00000073          	ecall
 ret
 634:	8082                	ret

0000000000000636 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 636:	4891                	li	a7,4
 ecall
 638:	00000073          	ecall
 ret
 63c:	8082                	ret

000000000000063e <read>:
.global read
read:
 li a7, SYS_read
 63e:	4895                	li	a7,5
 ecall
 640:	00000073          	ecall
 ret
 644:	8082                	ret

0000000000000646 <write>:
.global write
write:
 li a7, SYS_write
 646:	48c1                	li	a7,16
 ecall
 648:	00000073          	ecall
 ret
 64c:	8082                	ret

000000000000064e <close>:
.global close
close:
 li a7, SYS_close
 64e:	48d5                	li	a7,21
 ecall
 650:	00000073          	ecall
 ret
 654:	8082                	ret

0000000000000656 <kill>:
.global kill
kill:
 li a7, SYS_kill
 656:	4899                	li	a7,6
 ecall
 658:	00000073          	ecall
 ret
 65c:	8082                	ret

000000000000065e <exec>:
.global exec
exec:
 li a7, SYS_exec
 65e:	489d                	li	a7,7
 ecall
 660:	00000073          	ecall
 ret
 664:	8082                	ret

0000000000000666 <open>:
.global open
open:
 li a7, SYS_open
 666:	48bd                	li	a7,15
 ecall
 668:	00000073          	ecall
 ret
 66c:	8082                	ret

000000000000066e <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 66e:	48c5                	li	a7,17
 ecall
 670:	00000073          	ecall
 ret
 674:	8082                	ret

0000000000000676 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 676:	48c9                	li	a7,18
 ecall
 678:	00000073          	ecall
 ret
 67c:	8082                	ret

000000000000067e <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 67e:	48a1                	li	a7,8
 ecall
 680:	00000073          	ecall
 ret
 684:	8082                	ret

0000000000000686 <link>:
.global link
link:
 li a7, SYS_link
 686:	48cd                	li	a7,19
 ecall
 688:	00000073          	ecall
 ret
 68c:	8082                	ret

000000000000068e <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 68e:	48d1                	li	a7,20
 ecall
 690:	00000073          	ecall
 ret
 694:	8082                	ret

0000000000000696 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 696:	48a5                	li	a7,9
 ecall
 698:	00000073          	ecall
 ret
 69c:	8082                	ret

000000000000069e <dup>:
.global dup
dup:
 li a7, SYS_dup
 69e:	48a9                	li	a7,10
 ecall
 6a0:	00000073          	ecall
 ret
 6a4:	8082                	ret

00000000000006a6 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 6a6:	48ad                	li	a7,11
 ecall
 6a8:	00000073          	ecall
 ret
 6ac:	8082                	ret

00000000000006ae <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 6ae:	48b1                	li	a7,12
 ecall
 6b0:	00000073          	ecall
 ret
 6b4:	8082                	ret

00000000000006b6 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 6b6:	48b5                	li	a7,13
 ecall
 6b8:	00000073          	ecall
 ret
 6bc:	8082                	ret

00000000000006be <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 6be:	48b9                	li	a7,14
 ecall
 6c0:	00000073          	ecall
 ret
 6c4:	8082                	ret

00000000000006c6 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 6c6:	1101                	addi	sp,sp,-32
 6c8:	ec06                	sd	ra,24(sp)
 6ca:	e822                	sd	s0,16(sp)
 6cc:	1000                	addi	s0,sp,32
 6ce:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 6d2:	4605                	li	a2,1
 6d4:	fef40593          	addi	a1,s0,-17
 6d8:	00000097          	auipc	ra,0x0
 6dc:	f6e080e7          	jalr	-146(ra) # 646 <write>
}
 6e0:	60e2                	ld	ra,24(sp)
 6e2:	6442                	ld	s0,16(sp)
 6e4:	6105                	addi	sp,sp,32
 6e6:	8082                	ret

00000000000006e8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6e8:	7139                	addi	sp,sp,-64
 6ea:	fc06                	sd	ra,56(sp)
 6ec:	f822                	sd	s0,48(sp)
 6ee:	f426                	sd	s1,40(sp)
 6f0:	f04a                	sd	s2,32(sp)
 6f2:	ec4e                	sd	s3,24(sp)
 6f4:	0080                	addi	s0,sp,64
 6f6:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6f8:	c299                	beqz	a3,6fe <printint+0x16>
 6fa:	0805c863          	bltz	a1,78a <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 6fe:	2581                	sext.w	a1,a1
  neg = 0;
 700:	4881                	li	a7,0
 702:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 706:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 708:	2601                	sext.w	a2,a2
 70a:	00000517          	auipc	a0,0x0
 70e:	4b650513          	addi	a0,a0,1206 # bc0 <digits>
 712:	883a                	mv	a6,a4
 714:	2705                	addiw	a4,a4,1
 716:	02c5f7bb          	remuw	a5,a1,a2
 71a:	1782                	slli	a5,a5,0x20
 71c:	9381                	srli	a5,a5,0x20
 71e:	97aa                	add	a5,a5,a0
 720:	0007c783          	lbu	a5,0(a5)
 724:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 728:	0005879b          	sext.w	a5,a1
 72c:	02c5d5bb          	divuw	a1,a1,a2
 730:	0685                	addi	a3,a3,1
 732:	fec7f0e3          	bgeu	a5,a2,712 <printint+0x2a>
  if(neg)
 736:	00088b63          	beqz	a7,74c <printint+0x64>
    buf[i++] = '-';
 73a:	fd040793          	addi	a5,s0,-48
 73e:	973e                	add	a4,a4,a5
 740:	02d00793          	li	a5,45
 744:	fef70823          	sb	a5,-16(a4)
 748:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 74c:	02e05863          	blez	a4,77c <printint+0x94>
 750:	fc040793          	addi	a5,s0,-64
 754:	00e78933          	add	s2,a5,a4
 758:	fff78993          	addi	s3,a5,-1
 75c:	99ba                	add	s3,s3,a4
 75e:	377d                	addiw	a4,a4,-1
 760:	1702                	slli	a4,a4,0x20
 762:	9301                	srli	a4,a4,0x20
 764:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 768:	fff94583          	lbu	a1,-1(s2)
 76c:	8526                	mv	a0,s1
 76e:	00000097          	auipc	ra,0x0
 772:	f58080e7          	jalr	-168(ra) # 6c6 <putc>
  while(--i >= 0)
 776:	197d                	addi	s2,s2,-1
 778:	ff3918e3          	bne	s2,s3,768 <printint+0x80>
}
 77c:	70e2                	ld	ra,56(sp)
 77e:	7442                	ld	s0,48(sp)
 780:	74a2                	ld	s1,40(sp)
 782:	7902                	ld	s2,32(sp)
 784:	69e2                	ld	s3,24(sp)
 786:	6121                	addi	sp,sp,64
 788:	8082                	ret
    x = -xx;
 78a:	40b005bb          	negw	a1,a1
    neg = 1;
 78e:	4885                	li	a7,1
    x = -xx;
 790:	bf8d                	j	702 <printint+0x1a>

0000000000000792 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 792:	7119                	addi	sp,sp,-128
 794:	fc86                	sd	ra,120(sp)
 796:	f8a2                	sd	s0,112(sp)
 798:	f4a6                	sd	s1,104(sp)
 79a:	f0ca                	sd	s2,96(sp)
 79c:	ecce                	sd	s3,88(sp)
 79e:	e8d2                	sd	s4,80(sp)
 7a0:	e4d6                	sd	s5,72(sp)
 7a2:	e0da                	sd	s6,64(sp)
 7a4:	fc5e                	sd	s7,56(sp)
 7a6:	f862                	sd	s8,48(sp)
 7a8:	f466                	sd	s9,40(sp)
 7aa:	f06a                	sd	s10,32(sp)
 7ac:	ec6e                	sd	s11,24(sp)
 7ae:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 7b0:	0005c903          	lbu	s2,0(a1)
 7b4:	18090f63          	beqz	s2,952 <vprintf+0x1c0>
 7b8:	8aaa                	mv	s5,a0
 7ba:	8b32                	mv	s6,a2
 7bc:	00158493          	addi	s1,a1,1
  state = 0;
 7c0:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 7c2:	02500a13          	li	s4,37
      if(c == 'd'){
 7c6:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 7ca:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 7ce:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 7d2:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 7d6:	00000b97          	auipc	s7,0x0
 7da:	3eab8b93          	addi	s7,s7,1002 # bc0 <digits>
 7de:	a839                	j	7fc <vprintf+0x6a>
        putc(fd, c);
 7e0:	85ca                	mv	a1,s2
 7e2:	8556                	mv	a0,s5
 7e4:	00000097          	auipc	ra,0x0
 7e8:	ee2080e7          	jalr	-286(ra) # 6c6 <putc>
 7ec:	a019                	j	7f2 <vprintf+0x60>
    } else if(state == '%'){
 7ee:	01498f63          	beq	s3,s4,80c <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 7f2:	0485                	addi	s1,s1,1
 7f4:	fff4c903          	lbu	s2,-1(s1)
 7f8:	14090d63          	beqz	s2,952 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 7fc:	0009079b          	sext.w	a5,s2
    if(state == 0){
 800:	fe0997e3          	bnez	s3,7ee <vprintf+0x5c>
      if(c == '%'){
 804:	fd479ee3          	bne	a5,s4,7e0 <vprintf+0x4e>
        state = '%';
 808:	89be                	mv	s3,a5
 80a:	b7e5                	j	7f2 <vprintf+0x60>
      if(c == 'd'){
 80c:	05878063          	beq	a5,s8,84c <vprintf+0xba>
      } else if(c == 'l') {
 810:	05978c63          	beq	a5,s9,868 <vprintf+0xd6>
      } else if(c == 'x') {
 814:	07a78863          	beq	a5,s10,884 <vprintf+0xf2>
      } else if(c == 'p') {
 818:	09b78463          	beq	a5,s11,8a0 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 81c:	07300713          	li	a4,115
 820:	0ce78663          	beq	a5,a4,8ec <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 824:	06300713          	li	a4,99
 828:	0ee78e63          	beq	a5,a4,924 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 82c:	11478863          	beq	a5,s4,93c <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 830:	85d2                	mv	a1,s4
 832:	8556                	mv	a0,s5
 834:	00000097          	auipc	ra,0x0
 838:	e92080e7          	jalr	-366(ra) # 6c6 <putc>
        putc(fd, c);
 83c:	85ca                	mv	a1,s2
 83e:	8556                	mv	a0,s5
 840:	00000097          	auipc	ra,0x0
 844:	e86080e7          	jalr	-378(ra) # 6c6 <putc>
      }
      state = 0;
 848:	4981                	li	s3,0
 84a:	b765                	j	7f2 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 84c:	008b0913          	addi	s2,s6,8
 850:	4685                	li	a3,1
 852:	4629                	li	a2,10
 854:	000b2583          	lw	a1,0(s6)
 858:	8556                	mv	a0,s5
 85a:	00000097          	auipc	ra,0x0
 85e:	e8e080e7          	jalr	-370(ra) # 6e8 <printint>
 862:	8b4a                	mv	s6,s2
      state = 0;
 864:	4981                	li	s3,0
 866:	b771                	j	7f2 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 868:	008b0913          	addi	s2,s6,8
 86c:	4681                	li	a3,0
 86e:	4629                	li	a2,10
 870:	000b2583          	lw	a1,0(s6)
 874:	8556                	mv	a0,s5
 876:	00000097          	auipc	ra,0x0
 87a:	e72080e7          	jalr	-398(ra) # 6e8 <printint>
 87e:	8b4a                	mv	s6,s2
      state = 0;
 880:	4981                	li	s3,0
 882:	bf85                	j	7f2 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 884:	008b0913          	addi	s2,s6,8
 888:	4681                	li	a3,0
 88a:	4641                	li	a2,16
 88c:	000b2583          	lw	a1,0(s6)
 890:	8556                	mv	a0,s5
 892:	00000097          	auipc	ra,0x0
 896:	e56080e7          	jalr	-426(ra) # 6e8 <printint>
 89a:	8b4a                	mv	s6,s2
      state = 0;
 89c:	4981                	li	s3,0
 89e:	bf91                	j	7f2 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 8a0:	008b0793          	addi	a5,s6,8
 8a4:	f8f43423          	sd	a5,-120(s0)
 8a8:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 8ac:	03000593          	li	a1,48
 8b0:	8556                	mv	a0,s5
 8b2:	00000097          	auipc	ra,0x0
 8b6:	e14080e7          	jalr	-492(ra) # 6c6 <putc>
  putc(fd, 'x');
 8ba:	85ea                	mv	a1,s10
 8bc:	8556                	mv	a0,s5
 8be:	00000097          	auipc	ra,0x0
 8c2:	e08080e7          	jalr	-504(ra) # 6c6 <putc>
 8c6:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 8c8:	03c9d793          	srli	a5,s3,0x3c
 8cc:	97de                	add	a5,a5,s7
 8ce:	0007c583          	lbu	a1,0(a5)
 8d2:	8556                	mv	a0,s5
 8d4:	00000097          	auipc	ra,0x0
 8d8:	df2080e7          	jalr	-526(ra) # 6c6 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 8dc:	0992                	slli	s3,s3,0x4
 8de:	397d                	addiw	s2,s2,-1
 8e0:	fe0914e3          	bnez	s2,8c8 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 8e4:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 8e8:	4981                	li	s3,0
 8ea:	b721                	j	7f2 <vprintf+0x60>
        s = va_arg(ap, char*);
 8ec:	008b0993          	addi	s3,s6,8
 8f0:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 8f4:	02090163          	beqz	s2,916 <vprintf+0x184>
        while(*s != 0){
 8f8:	00094583          	lbu	a1,0(s2)
 8fc:	c9a1                	beqz	a1,94c <vprintf+0x1ba>
          putc(fd, *s);
 8fe:	8556                	mv	a0,s5
 900:	00000097          	auipc	ra,0x0
 904:	dc6080e7          	jalr	-570(ra) # 6c6 <putc>
          s++;
 908:	0905                	addi	s2,s2,1
        while(*s != 0){
 90a:	00094583          	lbu	a1,0(s2)
 90e:	f9e5                	bnez	a1,8fe <vprintf+0x16c>
        s = va_arg(ap, char*);
 910:	8b4e                	mv	s6,s3
      state = 0;
 912:	4981                	li	s3,0
 914:	bdf9                	j	7f2 <vprintf+0x60>
          s = "(null)";
 916:	00000917          	auipc	s2,0x0
 91a:	2a290913          	addi	s2,s2,674 # bb8 <longjmp_1+0x6>
        while(*s != 0){
 91e:	02800593          	li	a1,40
 922:	bff1                	j	8fe <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 924:	008b0913          	addi	s2,s6,8
 928:	000b4583          	lbu	a1,0(s6)
 92c:	8556                	mv	a0,s5
 92e:	00000097          	auipc	ra,0x0
 932:	d98080e7          	jalr	-616(ra) # 6c6 <putc>
 936:	8b4a                	mv	s6,s2
      state = 0;
 938:	4981                	li	s3,0
 93a:	bd65                	j	7f2 <vprintf+0x60>
        putc(fd, c);
 93c:	85d2                	mv	a1,s4
 93e:	8556                	mv	a0,s5
 940:	00000097          	auipc	ra,0x0
 944:	d86080e7          	jalr	-634(ra) # 6c6 <putc>
      state = 0;
 948:	4981                	li	s3,0
 94a:	b565                	j	7f2 <vprintf+0x60>
        s = va_arg(ap, char*);
 94c:	8b4e                	mv	s6,s3
      state = 0;
 94e:	4981                	li	s3,0
 950:	b54d                	j	7f2 <vprintf+0x60>
    }
  }
}
 952:	70e6                	ld	ra,120(sp)
 954:	7446                	ld	s0,112(sp)
 956:	74a6                	ld	s1,104(sp)
 958:	7906                	ld	s2,96(sp)
 95a:	69e6                	ld	s3,88(sp)
 95c:	6a46                	ld	s4,80(sp)
 95e:	6aa6                	ld	s5,72(sp)
 960:	6b06                	ld	s6,64(sp)
 962:	7be2                	ld	s7,56(sp)
 964:	7c42                	ld	s8,48(sp)
 966:	7ca2                	ld	s9,40(sp)
 968:	7d02                	ld	s10,32(sp)
 96a:	6de2                	ld	s11,24(sp)
 96c:	6109                	addi	sp,sp,128
 96e:	8082                	ret

0000000000000970 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 970:	715d                	addi	sp,sp,-80
 972:	ec06                	sd	ra,24(sp)
 974:	e822                	sd	s0,16(sp)
 976:	1000                	addi	s0,sp,32
 978:	e010                	sd	a2,0(s0)
 97a:	e414                	sd	a3,8(s0)
 97c:	e818                	sd	a4,16(s0)
 97e:	ec1c                	sd	a5,24(s0)
 980:	03043023          	sd	a6,32(s0)
 984:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 988:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 98c:	8622                	mv	a2,s0
 98e:	00000097          	auipc	ra,0x0
 992:	e04080e7          	jalr	-508(ra) # 792 <vprintf>
}
 996:	60e2                	ld	ra,24(sp)
 998:	6442                	ld	s0,16(sp)
 99a:	6161                	addi	sp,sp,80
 99c:	8082                	ret

000000000000099e <printf>:

void
printf(const char *fmt, ...)
{
 99e:	711d                	addi	sp,sp,-96
 9a0:	ec06                	sd	ra,24(sp)
 9a2:	e822                	sd	s0,16(sp)
 9a4:	1000                	addi	s0,sp,32
 9a6:	e40c                	sd	a1,8(s0)
 9a8:	e810                	sd	a2,16(s0)
 9aa:	ec14                	sd	a3,24(s0)
 9ac:	f018                	sd	a4,32(s0)
 9ae:	f41c                	sd	a5,40(s0)
 9b0:	03043823          	sd	a6,48(s0)
 9b4:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 9b8:	00840613          	addi	a2,s0,8
 9bc:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 9c0:	85aa                	mv	a1,a0
 9c2:	4505                	li	a0,1
 9c4:	00000097          	auipc	ra,0x0
 9c8:	dce080e7          	jalr	-562(ra) # 792 <vprintf>
}
 9cc:	60e2                	ld	ra,24(sp)
 9ce:	6442                	ld	s0,16(sp)
 9d0:	6125                	addi	sp,sp,96
 9d2:	8082                	ret

00000000000009d4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9d4:	1141                	addi	sp,sp,-16
 9d6:	e422                	sd	s0,8(sp)
 9d8:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9da:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9de:	00000797          	auipc	a5,0x0
 9e2:	20a7b783          	ld	a5,522(a5) # be8 <freep>
 9e6:	a805                	j	a16 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 9e8:	4618                	lw	a4,8(a2)
 9ea:	9db9                	addw	a1,a1,a4
 9ec:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 9f0:	6398                	ld	a4,0(a5)
 9f2:	6318                	ld	a4,0(a4)
 9f4:	fee53823          	sd	a4,-16(a0)
 9f8:	a091                	j	a3c <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 9fa:	ff852703          	lw	a4,-8(a0)
 9fe:	9e39                	addw	a2,a2,a4
 a00:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 a02:	ff053703          	ld	a4,-16(a0)
 a06:	e398                	sd	a4,0(a5)
 a08:	a099                	j	a4e <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a0a:	6398                	ld	a4,0(a5)
 a0c:	00e7e463          	bltu	a5,a4,a14 <free+0x40>
 a10:	00e6ea63          	bltu	a3,a4,a24 <free+0x50>
{
 a14:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a16:	fed7fae3          	bgeu	a5,a3,a0a <free+0x36>
 a1a:	6398                	ld	a4,0(a5)
 a1c:	00e6e463          	bltu	a3,a4,a24 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a20:	fee7eae3          	bltu	a5,a4,a14 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 a24:	ff852583          	lw	a1,-8(a0)
 a28:	6390                	ld	a2,0(a5)
 a2a:	02059713          	slli	a4,a1,0x20
 a2e:	9301                	srli	a4,a4,0x20
 a30:	0712                	slli	a4,a4,0x4
 a32:	9736                	add	a4,a4,a3
 a34:	fae60ae3          	beq	a2,a4,9e8 <free+0x14>
    bp->s.ptr = p->s.ptr;
 a38:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 a3c:	4790                	lw	a2,8(a5)
 a3e:	02061713          	slli	a4,a2,0x20
 a42:	9301                	srli	a4,a4,0x20
 a44:	0712                	slli	a4,a4,0x4
 a46:	973e                	add	a4,a4,a5
 a48:	fae689e3          	beq	a3,a4,9fa <free+0x26>
  } else
    p->s.ptr = bp;
 a4c:	e394                	sd	a3,0(a5)
  freep = p;
 a4e:	00000717          	auipc	a4,0x0
 a52:	18f73d23          	sd	a5,410(a4) # be8 <freep>
}
 a56:	6422                	ld	s0,8(sp)
 a58:	0141                	addi	sp,sp,16
 a5a:	8082                	ret

0000000000000a5c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a5c:	7139                	addi	sp,sp,-64
 a5e:	fc06                	sd	ra,56(sp)
 a60:	f822                	sd	s0,48(sp)
 a62:	f426                	sd	s1,40(sp)
 a64:	f04a                	sd	s2,32(sp)
 a66:	ec4e                	sd	s3,24(sp)
 a68:	e852                	sd	s4,16(sp)
 a6a:	e456                	sd	s5,8(sp)
 a6c:	e05a                	sd	s6,0(sp)
 a6e:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a70:	02051493          	slli	s1,a0,0x20
 a74:	9081                	srli	s1,s1,0x20
 a76:	04bd                	addi	s1,s1,15
 a78:	8091                	srli	s1,s1,0x4
 a7a:	0014899b          	addiw	s3,s1,1
 a7e:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 a80:	00000517          	auipc	a0,0x0
 a84:	16853503          	ld	a0,360(a0) # be8 <freep>
 a88:	c515                	beqz	a0,ab4 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a8a:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a8c:	4798                	lw	a4,8(a5)
 a8e:	02977f63          	bgeu	a4,s1,acc <malloc+0x70>
 a92:	8a4e                	mv	s4,s3
 a94:	0009871b          	sext.w	a4,s3
 a98:	6685                	lui	a3,0x1
 a9a:	00d77363          	bgeu	a4,a3,aa0 <malloc+0x44>
 a9e:	6a05                	lui	s4,0x1
 aa0:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 aa4:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 aa8:	00000917          	auipc	s2,0x0
 aac:	14090913          	addi	s2,s2,320 # be8 <freep>
  if(p == (char*)-1)
 ab0:	5afd                	li	s5,-1
 ab2:	a88d                	j	b24 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 ab4:	00000797          	auipc	a5,0x0
 ab8:	1ac78793          	addi	a5,a5,428 # c60 <base>
 abc:	00000717          	auipc	a4,0x0
 ac0:	12f73623          	sd	a5,300(a4) # be8 <freep>
 ac4:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 ac6:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 aca:	b7e1                	j	a92 <malloc+0x36>
      if(p->s.size == nunits)
 acc:	02e48b63          	beq	s1,a4,b02 <malloc+0xa6>
        p->s.size -= nunits;
 ad0:	4137073b          	subw	a4,a4,s3
 ad4:	c798                	sw	a4,8(a5)
        p += p->s.size;
 ad6:	1702                	slli	a4,a4,0x20
 ad8:	9301                	srli	a4,a4,0x20
 ada:	0712                	slli	a4,a4,0x4
 adc:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 ade:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 ae2:	00000717          	auipc	a4,0x0
 ae6:	10a73323          	sd	a0,262(a4) # be8 <freep>
      return (void*)(p + 1);
 aea:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 aee:	70e2                	ld	ra,56(sp)
 af0:	7442                	ld	s0,48(sp)
 af2:	74a2                	ld	s1,40(sp)
 af4:	7902                	ld	s2,32(sp)
 af6:	69e2                	ld	s3,24(sp)
 af8:	6a42                	ld	s4,16(sp)
 afa:	6aa2                	ld	s5,8(sp)
 afc:	6b02                	ld	s6,0(sp)
 afe:	6121                	addi	sp,sp,64
 b00:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 b02:	6398                	ld	a4,0(a5)
 b04:	e118                	sd	a4,0(a0)
 b06:	bff1                	j	ae2 <malloc+0x86>
  hp->s.size = nu;
 b08:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 b0c:	0541                	addi	a0,a0,16
 b0e:	00000097          	auipc	ra,0x0
 b12:	ec6080e7          	jalr	-314(ra) # 9d4 <free>
  return freep;
 b16:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 b1a:	d971                	beqz	a0,aee <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b1c:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 b1e:	4798                	lw	a4,8(a5)
 b20:	fa9776e3          	bgeu	a4,s1,acc <malloc+0x70>
    if(p == freep)
 b24:	00093703          	ld	a4,0(s2)
 b28:	853e                	mv	a0,a5
 b2a:	fef719e3          	bne	a4,a5,b1c <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 b2e:	8552                	mv	a0,s4
 b30:	00000097          	auipc	ra,0x0
 b34:	b7e080e7          	jalr	-1154(ra) # 6ae <sbrk>
  if(p == (char*)-1)
 b38:	fd5518e3          	bne	a0,s5,b08 <malloc+0xac>
        return 0;
 b3c:	4501                	li	a0,0
 b3e:	bf45                	j	aee <malloc+0x92>

0000000000000b40 <setjmp>:
 b40:	e100                	sd	s0,0(a0)
 b42:	e504                	sd	s1,8(a0)
 b44:	01253823          	sd	s2,16(a0)
 b48:	01353c23          	sd	s3,24(a0)
 b4c:	03453023          	sd	s4,32(a0)
 b50:	03553423          	sd	s5,40(a0)
 b54:	03653823          	sd	s6,48(a0)
 b58:	03753c23          	sd	s7,56(a0)
 b5c:	05853023          	sd	s8,64(a0)
 b60:	05953423          	sd	s9,72(a0)
 b64:	05a53823          	sd	s10,80(a0)
 b68:	05b53c23          	sd	s11,88(a0)
 b6c:	06153023          	sd	ra,96(a0)
 b70:	06253423          	sd	sp,104(a0)
 b74:	4501                	li	a0,0
 b76:	8082                	ret

0000000000000b78 <longjmp>:
 b78:	6100                	ld	s0,0(a0)
 b7a:	6504                	ld	s1,8(a0)
 b7c:	01053903          	ld	s2,16(a0)
 b80:	01853983          	ld	s3,24(a0)
 b84:	02053a03          	ld	s4,32(a0)
 b88:	02853a83          	ld	s5,40(a0)
 b8c:	03053b03          	ld	s6,48(a0)
 b90:	03853b83          	ld	s7,56(a0)
 b94:	04053c03          	ld	s8,64(a0)
 b98:	04853c83          	ld	s9,72(a0)
 b9c:	05053d03          	ld	s10,80(a0)
 ba0:	05853d83          	ld	s11,88(a0)
 ba4:	06053083          	ld	ra,96(a0)
 ba8:	06853103          	ld	sp,104(a0)
 bac:	c199                	beqz	a1,bb2 <longjmp_1>
 bae:	852e                	mv	a0,a1
 bb0:	8082                	ret

0000000000000bb2 <longjmp_1>:
 bb2:	4505                	li	a0,1
 bb4:	8082                	ret
