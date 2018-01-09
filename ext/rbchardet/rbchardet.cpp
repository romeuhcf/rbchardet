#include<ruby.h>
#include "rice/Class.hpp"
#include "uchardet.h"
//#include "rbchardet.h"

using namespace Rice;

std::string  rice_chardet(String txt) {

	uchardet_t  handle = uchardet_new();
	char       *charset;

	int retval = uchardet_handle_data(handle, txt.c_str(), txt.length() );
	if (retval != 0)
	{
		fprintf(stderr,
				"uchardet-tests: handle data error.\n");
		exit(1);
	}
	uchardet_data_end(handle);

	charset = strdup(uchardet_get_charset(handle));

	uchardet_delete(handle);
	return charset;


}



int rice_pow(int a, int n) {
	return pow(a, n);
}

	extern "C"
void Init_rbchardet(void)
{
	Module rb_c = define_module("Rbchardet")
		.define_module_function("chardet", &rice_chardet)
		.define_module_function("pow", &rice_pow);
} 

