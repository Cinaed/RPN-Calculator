//
//  CalculatorBrain.h
//  RPN Calulator
//
//  Created by Blake Merryman on 5/25/12.
//  Copyright (c) 2012 Cinaed Designs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;

@end
