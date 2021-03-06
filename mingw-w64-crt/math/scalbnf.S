/**
 * This file has no copyright assigned and is placed in the Public Domain.
 * This file is part of the w64 mingw-runtime package.
 * No warranty is given; refer to the file DISCLAIMER.PD within this package.
 */
#include <_mingw_mac.h>

	.file	"scalbnf.S"
	.text
#ifdef _WIN64
	.align 8
#else
	.align 4
#endif
.globl __MINGW_USYMBOL(scalbnf)
	.def	__MINGW_USYMBOL(scalbnf);	.scl	2;	.type	32;	.endef
__MINGW_USYMBOL(scalbnf):
#ifdef _WIN64
	subq	$24, %rsp
	movq	%rdx,(%rsp)
	fildl	(%rsp)
	movss	%xmm0,(%rsp)
	flds	(%rsp)
	fscale
	fstp	%st(1)
	fstps	(%rsp)
	movss	(%rsp),%xmm0
	addq	$24, %rsp
	ret
#else
	fildl	8(%esp)
	flds	4(%esp)
	fscale
	fstp	%st(1)
	ret
#endif
