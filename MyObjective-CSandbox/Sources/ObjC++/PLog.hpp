//
// PLog.h
// MyObjective-CSandbox
//
    

#ifndef PLog_h
#define PLog_h

#import <memory.h>

//NS_ASSUME_NONNULL_BEGIN

using namespace std;

class HelloWorld;

@interface PLog : NSObject {
    unique_ptr<HelloWorld> ptr;
};
-(void)sayHello;
-(void)sayHi: (HelloWorld*) p;
-(void)printCppVersion;
-(void) dealloc;

-(instancetype) init;

@end

//NS_ASSUME_NONNULL_END

#endif /* PLog_h */
