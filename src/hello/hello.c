#include <stdio.h>
#include "hello.h"

void sayhello() {
	printf("Hello World!\n");
	printf("product info: %s\n", PRODUCT_INFO);
#if ENABLE_TALKING==1
	printf("product feature:%s\n", "Talking is enabled");
#else
	printf("product feature:%s\n", "Talking is disabled");
#endif
	printf("product spec:%s\n", ENABLE_SPEC?"Spec is defined":"Spec is not defined");
#if defined(DEBUG) || defined(__DEBUG__)
	printf("dubug version\n");
#else
	printf("release version\n");
#endif
}
