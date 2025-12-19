//
// NotNeeded.m
// MyObjective-CSandbox
//
    

#import <Foundation/Foundation.h>
#import "NotNeeded.h"
#import "Playground.h"
#import <objc/message.h>

@implementation NotNeeded: NSObject

- (void) forwardingMechanism: (Playground*) pg {
    // 3. Define a selector for a method that *DOES NOT EXIST* on Playground
    SEL missingSel = NSSelectorFromString(@"doSomethingThatIsMissing:withValue:");

    // 4. Use NSInvocation directly, as performSelector is limited (max 2 objects).
    NSMethodSignature *sig = [pg methodSignatureForSelector:missingSel];

//        if (sig) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
        [invocation setSelector:missingSel];
        [invocation setTarget:pg];
        
        // Attempt to invoke the missing method: this triggers the forwarding chain!
        [invocation invoke];
//        } else {
        // If the signature is not found, the crash will happen unless you
        // override methodSignatureForSelector:
//            NSLog(@"Method signature not found for missing selector. Proceeding to crash/forward.");
        // Force the message send (usually done through a direct message call)
        // [pg doSomethingThatIsMissing:nil withValue:0]; // This requires casting or special handling
        
        // For a simpler test, just ensure you've overridden the methods below!
//        }
}

- (void) notNeeded {
    Playground* pg = [[Playground alloc] initPlayground];
    ((void (*)(id, SEL))objc_msgSend)(pg, @selector(toString));
      
    SEL select = NSSelectorFromString(@"add:second:");
      
    int sim = ((int (*)(id, SEL, int, int)) objc_msgSend)(pg, select, 30, 20);
                 
    printf("Sum = %d\n", sim);
      
    if([pg respondsToSelector: select]) {
        NSLog(@"Responds fr");
    } else {
        printf("False\n");
    }
              
}

@end
