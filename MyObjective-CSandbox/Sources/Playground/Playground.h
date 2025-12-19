//
// Playground.h
// MyObjective-CSandbox
//
#import <Foundation/Foundation.h>


#ifndef Playground_h
#define Playground_h


NS_ASSUME_NONNULL_BEGIN


@interface Playground: NSObject {
@private

    int count;
        
}

@property(atomic) int solution;

- (instancetype) initPlayground;

- (int) add: (int) first second:(int) scd;
- (void) toString;
- (void) printName: (BOOL) withC;
- (void) vararg: (char*) first,... NS_REQUIRES_NIL_TERMINATION;


@end

NS_ASSUME_NONNULL_END


#endif /* Playground_h */
