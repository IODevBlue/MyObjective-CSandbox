//
//  AlphabetGuessingGame.m
//  MyObjective-CSandbox
//
//  Created by iodevblue on 18-04-2024.
//
#import "AlphabetGuessingGame.h"

#import <Foundation/Foundation.h>

@implementation AlphabetGuessingGame

- (void)exec { 
	int rand = abs((int)arc4random_uniform(26));
	char d = 'A';
	for(int i=0; i<=rand; i++) {
		d+=1;
	}
	
	NSLog(@"The Answer is: %c", d);
	NSLog(@"-----------------------------");
	NSLog(@"Random Alphabet Guessing Game");
	NSLog(@"-----------------------------");
	NSLog(@"I have picked a random Alphabet between 'A-Z, Can you guess that Alphabet?\n\n");
	NSLog(@"***Your Answer should be in Uppercase***\n\n");
	NSLog(@"\t\tGo!!!\n");
	do {
		char s[256];
		printf("It is: ");
		fgets(s, sizeof(s), stdin);
		NSString *str = [NSString stringWithCString:s encoding:NSUTF8StringEncoding];
		
		if(!str) {
			NSLog(@"Invalid character. Try again!");
		} else {
			str = [str stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
			if(str.length > 1) {
				NSLog(@"That is too long!, Guess just an Alphabet! Try again.");
			} else {
				if(str == [str lowercaseString]) {
					NSLog(@"Answer must be an Upper case Alphabet! Try again.");
				} else {
					unichar sc = [str characterAtIndex:0];
					if(sc!=d) {
						NSLog(@"Wrong Answer! Try again.");
						noOfTrials += 1;
					} else {
						NSLog(@"-----------------------------");
						NSLog(@"Yay, Correct!");
						NSLog(@"-----------------------------");
						NSLog(@"Your Number of trials: %d", noOfTrials);
						exit(0);
					}
				}
			}
		}
		
	} while (true);
}

@end
