#define MADV_NORMAL  0
#define MADV_WILLNEED 1
#define MADV_DONTNEED 2

void uvmlazytouch(uint64 va);
int uvmshouldtouch(uint64 va);