s0: DC "Greatest Common divisor.\0"
s1: DC "Enter a:\0"
s2: DC "Enter b:\0"
s3: DC "GCD(a,b)=\0"
	addi x5,x0,s0
	ecall x0,x5,4	;out info
	addi x5,x0,s1
	ecall x1,x5,4	;prompt a
	ecall x6,x0,5	;input a
	addi x5,x0,s2
	ecall x1,x5,4	;prompt b
	ecall x7,x0,5	;input b
loop:	
	