
#include "dump/dump.h"
#include "module1/module1.h"
#include "module2/module2.h"

int main(int argc, char** argv) {
	dump();
    module1_init();
    module2_init();

	return 0;
}
