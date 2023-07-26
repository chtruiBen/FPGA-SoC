
#ifndef SYSTEM_CONFIG_H_
#define SYSTEM_CONFIG_H_




#define __DEBUG__


#ifdef __DEBUG__
//#define DEBUG(format,...) printf("[File:"__FILE__", Line:%05d]   "format"", __LINE__, ##__VA_ARGS__)
#define DEBUG(format,...) printf(""format"",##__VA_ARGS__)
#else
#define DEBUG(format,...)
#endif

#ifdef __DEBUG_ICODE__
//#define DEBUG(format,...) printf("[File:"__FILE__", Line:%05d]   "format"", __LINE__, ##__VA_ARGS__)
#define DEBUG_ICODE(format,...) printf(""format"",##__VA_ARGS__)
#else
#define DEBUG_ICODE(format,...)
#endif


#endif  /* SYSTEM_CONFIG_H_ */
