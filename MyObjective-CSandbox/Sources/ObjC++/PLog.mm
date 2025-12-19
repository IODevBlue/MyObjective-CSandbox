//
// HelloWorld.m
// MyObjective-CSandbox
//
    
#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import <memory>
#import "PLog.hpp"

using namespace std;

class HelloWorld {
    PLog* printLog;
public:
    HelloWorld(bool b) {
        if(b) {
            printLog = [[PLog alloc] init];
        }
    }
    
    ~HelloWorld() {
//        [printLog release];
    }
    
    void sayHello() {
        printf("Hi");
    }
    
    void sayHi() {
        [printLog sayHi: this];
    }
    
    void print_cpp_version() {
        printf("%ld\n", __cplusplus);
    }
};

@implementation PLog : NSObject

- (instancetype)init {
    self = [super init];
    ptr = make_unique<HelloWorld>(false);
    return self;
}

- (void)sayHello {
    NSLog(@"Hello World");
}

- (void)sayHi:(HelloWorld *)p {
    p->sayHi();
}

- (void)dealloc {
    ptr.release();
}

- (void)printCppVersion {
    ((HelloWorld*)ptr.get())->print_cpp_version();
}

@end
