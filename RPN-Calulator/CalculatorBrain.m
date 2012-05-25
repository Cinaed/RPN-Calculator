//
//  CalculatorBrain.m
//  RPN Calulator
//
//  Created by Blake Merryman on 5/25/12.
//  Copyright (c) 2012 Cinaed Designs. All rights reserved.
//

#import "CalculatorBrain.h"

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
    if (operandObject) [self.operandStack removeLastObject]; // ensures that empty array isn't popped... which would crash application
    return [operandObject doubleValue];
}

- (double)performOperation:(NSString *)operation 
{
    double result = 0;
    
    if ([operation isEqualToString:@"+"]) {             // perform addition
        result = [self popOperand] + [self popOperand];
    } else if ([operation isEqualToString:@"_"]) {      // perform subtraction
        result = [self popOperand] - [self popOperand];
    } else if ([operation isEqualToString:@"*"]) {      // perform multiplication
        result = [self popOperand] * [self popOperand];
    } else if ([operation isEqualToString:@"/"]) {      // perform division
        result = [self popOperand] / [self popOperand];
    }
    
    [self pushOperand:result];
    
    return result;
}

@end
