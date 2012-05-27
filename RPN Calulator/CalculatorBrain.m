//
//  CalculatorBrain.m
//  RPN Calulator
//
//  Created by Blake Merryman on 5/25/12.
//  Copyright (c) 2012 Cinaed Designs. All rights reserved.
//

#import "CalculatorBrain.h"

// Private properties...
@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end    

@implementation CalculatorBrain
@synthesize operandStack = _operandStack;

- (NSMutableArray *)operandStack 
{
    if (_operandStack == nil) _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}

- (void)pushOperand:(double)operand 
{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

- (double)popOperand 
{
    NSNumber *operandObject =[self.operandStack lastObject];
    if (operandObject) [self.operandStack removeLastObject];
    // Ensures that empty array isn't popped... which would crash application

    return [operandObject doubleValue];
}

- (double)performOperation:(NSString *)operation 
{
    double result = 0;
    
    if ([operation isEqualToString:@"+"]) {             // perform addition
        result = [self popOperand] + [self popOperand];
    } else if ([operation isEqualToString:@"_"]) {      // perform subtraction
        double subtrahend = [self popOperand];
        result = [self popOperand] - subtrahend;
    } else if ([operation isEqualToString:@"*"]) {      // perform multiplication
        result = [self popOperand] * [self popOperand];
    } else if ([operation isEqualToString:@"/"]) {      // perform division
        double divisor = [self popOperand];
        if (divisor) {  
            // Eventually change (divisor) to (divisor != 0)
            result = [self popOperand] / divisor;
        }
        
        /* 
        else { 
            // Display error message on screen for dividing by zero. 
        }
         */
        
    } else if ([operation isEqualToString:@"sin"]) {    // perform sine operation
        result = sin([self popOperand]);
    } else if ([operation isEqualToString:@"cos"]) {    // perform cosine operation
        result = cos([self popOperand]);
    } else if ([operation isEqualToString:@"sqrt"]) {   // perform squareroot operation
        result = sqrt([self popOperand]);
    }
    
    [self pushOperand:result];
    
    return result;
}
@end
