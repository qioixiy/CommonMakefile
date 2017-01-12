#include <stdio.h>
#include "dump.h"

void dump() {
	printf("product info: %s\n", PRODUCT_INFO);
#if ENABLE_TALKING==1
	printf("product feature:%s\n", "Talking is enabled");
#else
	printf("product feature:%s\n", "Talking is disabled");
#endif
	printf("product spec:%s\n", ENABLE_SPEC?"Spec is defined":"Spec is not defined");

#if defined(__DEBUG__)
	printf("debug version\n");
#else
	printf("release version\n");
#endif
}
