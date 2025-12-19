//
//  AverageNumberCalculator.m
//  MyObjective-CSandbox
//
//  Created by iodevblue on 19-04-2024.
//

#import <Foundation/Foundation.h>
#import "AverageNumberCalculator.h"

@implementation AverageNumberCalculator


- (void)exec { 
	NSLog(@"--------------------------------");
	NSLog(@"***Average Number Calculator***");
	NSLog(@"--------------------------------");
	NSLog(@"Type in the numbers you want to calculate an average of: \n");
	NSLog(@"Type in 'Yes' when done.");
	int i = 0; double sum = 0.0;
	NSString* falseInput;
	
	while (true) {
		NSNumber *input = [NSNumber alloc];
		printf("Number %d: ", i+1);
		NSFileHandle *handle = [NSFileHandle fileHandleWithStandardInput];
		NSData *data = [handle availableData];
		falseInput = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
		falseInput = [falseInput stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
		input = [[[NSNumberFormatter alloc] init] numberFromString:falseInput];
		if(input != NULL) {
			i+=1; sum+=input.doubleValue;
			continue;
		} else {
			if([falseInput.lowercaseString  isEqual: @"yes"]) {
				break;
			}
			NSLog(@"That is not a number! Please try again.");
		}
	}
	printf("The Average of these %i numbers is = %f\n", i, sum/2);
}

@end
