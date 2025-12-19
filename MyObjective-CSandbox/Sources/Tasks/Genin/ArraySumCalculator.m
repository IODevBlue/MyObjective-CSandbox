//
//  ArraySumCalculator.m
//  MyObjective-CSandbox
//
//  Created by iodevblue on 18-04-2024.
//

#import <Foundation/Foundation.h>
#import "ArraySumCalculator.h"

@implementation ArraySumCalculator

- (void)exec {
	NSLog(@"---------------------------------------");
	NSLog(@"\tArray Sum Calculator");
	NSLog(@"---------------------------------------");
	
	do {
		printf("\nInput the size of the array: ");
		NSFileHandle *inputHandle = [NSFileHandle fileHandleWithStandardInput];
		NSNumber *a = [self readUserInput:inputHandle];
		
		if(a != NULL) {
			unsigned int aa = a.unsignedIntValue;
			NSMutableArray* b = [NSMutableArray arrayWithCapacity:aa];
			int i = 0, j = 0;
			BOOL notDone = true;
			do {
				if(i < aa) {
					printf("%i: ", j);
					NSNumber *num = [self readUserInput:inputHandle];
					b[i] = num? num:0;
					i+=1; j+=1;
				} else {
					notDone = false;
				}
			} while (notDone);
			[self arrayAdd:b _:a.intValue];
			exit(0);
		} else {
			NSLog(@"\nThat is not an Integer! Try again.");
		}

	} while (true);
}

-(NSNumber*)readUserInput:(NSFileHandle*) inputHandle {
	NSData *inputData = [inputHandle availableData];
	NSString *inputString = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];
	inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
	NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
	return [formatter numberFromString:inputString];
}

-(void) arrayAdd: (inout NSArray*)a _:(const int)size {
	int c = 0;
	NSMutableString *f = [[NSMutableString alloc] initWithString:@""];
	for(NSNumber* i in a) {
		int iv = i.intValue;
		c+=iv;
		if(i.intValue != size) {
			[f appendFormat:@"%d, ", iv];
		} else {
			[f appendFormat:@"%d", iv];
		}
	}
	NSLog(@"\n__________________________________");
	NSLog(@"\nThe sum of the values in the array: %@ is = %d", f, c);
	NSLog(@"__________________________________\n\n");
}

@end
