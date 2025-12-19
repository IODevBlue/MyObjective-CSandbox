//
// Playground.m
// MyObjective-CSandbox
//
#import <Foundation/Foundation.h>

#import "Playground.h"

@implementation Playground : NSObject  {
    
}
@synthesize solution;

- (instancetype)initPlayground {
    count = 999;
    return self;
}

-(void)toString {
    NSLog(@"Count is %d. Invoking from class\n", count);
}

- (int) add:(int)first second:(int)scd {

    return first + scd;
}

// **CRUCIAL STEP 1: Provide a valid method signature for the missing method**
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    // Check if the selector is not found normally
    if (![super methodSignatureForSelector:aSelector]) {
        // Provide a default signature, e.g., one that returns void and takes no arguments.
        // The signature must match the message you *expect* to forward.
        // Here, we provide a signature for a simple method that returns void.
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

// **CRUCIAL STEP 2: Implement the forwarding logic**
-(void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"\n*** Forward invocation for Playground invoked successfully! ***");
    NSLog(@"Selector attempted: %@", NSStringFromSelector([anInvocation selector]));

    // If you want to handle the message, do it here.
    // Example: redirect to a helper object or log the message and terminate.
    
    // To mimic the original crash behavior if not handled:
}


- (void)printName:(BOOL)withC {
    if(withC) {
        char inputBuffer[256];
        printf("Enter your name (using C):\n");
        fgets(inputBuffer, sizeof(inputBuffer), stdin); //Read user input.
        char* newLineChar = strchr(inputBuffer, '\n');
        if(newLineChar != NULL) {
            *newLineChar = '\0';
            printf("Hello, %s\n", inputBuffer);
        }
    } else {
        NSFileHandle* inputHandle = [NSFileHandle fileHandleWithStandardInput];
        printf("Enter your name (using Objective-C):\n");
        NSData* inputData = [inputHandle availableData]; //Reads user input
        if(inputData.length > 0) {
            NSString* inputString = [[NSString alloc] initWithData:inputData encoding: NSUTF8StringEncoding];
            inputString = [inputString stringByTrimmingCharactersInSet: [NSCharacterSet newlineCharacterSet]];
            NSLog(@"Hello, %@\n", inputString);
        }
    }
}

- (void)vararg: (char*) first,... {
    va_list args;
    va_start(args, first);
    for(char* argm = first; argm != nil; argm = va_arg(args, char*)) {
        printf("%s\n", argm);
    }
    va_end(args);
   
}

@end
