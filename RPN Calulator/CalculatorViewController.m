//
//  CalculatorViewController.m
//  RPN Calulator
//
//  Created by Blake Merryman on 5/24/12.
//  Copyright (c) 2012 Cinaed Designs. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

// Private properties...
@interface CalculatorViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@end


@implementation CalculatorViewController

@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;

- (CalculatorBrain *) brain 
{
    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}


- (IBAction)digitPressed:(UIButton *)sender 
{
    NSString *digit = sender.currentTitle;
    if (self.userIsInTheMiddleOfEnteringANumber) {
        if ([digit isEqualToString:@"."]) {
            NSRange decimal = [self.display.text rangeOfString:@"."];
            if ( decimal.location == NSNotFound ) {
                self.display.text = [self.display.text stringByAppendingFormat:digit];
            }
            else {
                // Do nothing. Can not have more than one decimal in a number.
            }
        } else {
            self.display.text = [self.display.text stringByAppendingFormat:digit];
        }
    } 
    else {
        if ([digit isEqualToString:@"."]) {
            self.display.text = @"0";   
            self.display.text = [self.display.text stringByAppendingFormat:digit];            
        } else {
            self.display.text = digit;
        }
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
}


- (IBAction)enterPressed 
{
    [self.brain pushOperand:[self.display.text doubleValue]];
     self.userIsInTheMiddleOfEnteringANumber = NO;
}
- (IBAction)operationPressed:(UIButton *)sender 
{
    if (self.userIsInTheMiddleOfEnteringANumber) {
        [self enterPressed];
    }
    NSString *operation = [sender currentTitle];
    double result = [self.brain performOperation:operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];
}
@end
