//
//  main.m
//  MyObjective-CSandbox
//
//  Created by iodevblue on 18-04-2024.
//

#import <Foundation/Foundation.h>
#import "Executable.h"
#import "AlphabetGuessingGame.h"
#import "ArraySumCalculator.h"
#import "AverageNumberCalculator.h"
#import "BinaryConverter.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		
		id<Executable> ex = [[BinaryConverter alloc] init];
		[ex exec];
	}
	return 0;
}
