//
//  main_sandbox.m
//  MyObjective-CSandbox
//
//  Created by iodevblue on 15-09-2024.
//

#include <functional>
#import <Foundation/Foundation.h>

#import "MyObjective_CSandbox-Swift.h"

void cppFunction(std::function<void(int)> lambda) {
	lambda(42);  // Invoke the lambda in C++ context
}


int main() {
	// Objective-C file
	MySwiftClass *swiftObj = [[MySwiftClass alloc] initWithName:@"John"];
	[swiftObj greet]; // Calls the Swift method

	return 0;
}
