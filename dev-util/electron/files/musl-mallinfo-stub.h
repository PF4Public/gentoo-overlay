#ifndef _MUSL_MALLINFO_STUB
#define _MUSL_MALLINFO_STUB

#include <malloc.h>

struct mallinfo {
    int arena;
    int hblkhd;
    int uordblks;
};

#endif
