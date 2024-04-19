//
//  BinaryConverter.h
//  MyObjective-CSandbox
//
//  Created by iodevblue on 19-04-2024.
//

#ifndef BinaryConverter_h
#define BinaryConverter_h
#import "Executable.h"
@interface BinaryConverter: NSObject<Executable>
+(NSString*)decToBinary:(NSUInteger) decInt;
@end

#endif /* BinaryConverter_h */
