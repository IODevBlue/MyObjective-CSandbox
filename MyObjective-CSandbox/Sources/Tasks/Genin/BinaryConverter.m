//
//  BinaryConverter.m
//  MyObjective-CSandbox
//
//  Created by iodevblue on 19-04-2024.
//

#import <Foundation/Foundation.h>
#import "BinaryConverter.h"

@implementation BinaryConverter

+ (NSString *)decToBinary:(NSUInteger)decInt {
	NSString *stringObj = @"";
	NSUInteger x = decInt;
	
	while (x>0) {
		stringObj = [[NSString stringWithFormat:@"%lu", x&1] stringByAppendingString:stringObj];
		x = x>>1;
	}
	return stringObj;
}

- (void)exec {
	while(true) {
		printf("input Number to Convert: ");
		NSNumber *b = [self readUserInput];
		
		if (b!=nil) {
			NSString *bin = [[self class] decToBinary:b.unsignedIntValue];
			NSLog(@"The Binary form of %u is %@\n", b.unsignedIntValue, bin);
			NSLog(@"Do you want to continue? yes or no.");
			
			NSString *response = [self readUserStringInput];
			
			if(response != NULL) {
				if([[response lowercaseString] isEqualToString:@"yes"]) {
					NSLog(@"\n"); continue;
				} else if([[response lowercaseString] isEqualToString:@"no"]) {
					exit(0);
				} else {
					continue;
				}
			} else {
				exit(0);
			}
		} else {
			NSLog(@"That is not a Number! Please Input a Number");
		}
	}
}

-(NSNumber*)readUserInput {
	NSFileHandle *inputHandle = [NSFileHandle fileHandleWithStandardInput];
	NSData *inputData = [inputHandle availableData];
	NSString *inputString = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];
	inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
	NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
	return [formatter numberFromString:inputString];
}

-(NSString*)readUserStringInput {
	NSFileHandle *inputHandle = [NSFileHandle fileHandleWithStandardInput];
	NSData *inputData = [inputHandle availableData];
	NSString *inputString = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];
	inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
	return inputString;
}



@end
