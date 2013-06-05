//
//  NumPad.m
//  Sudoku.v2
//
//  Created by Ben Corr on 6/4/13.
//  Copyright (c) 2013 Ben Corr. All rights reserved.
//

#import "NumPad.h"

@implementation NumPad

@synthesize currentNumber;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blackColor];
        NSUInteger capacity = 9;
        theButtons = [[NSMutableArray alloc] initWithCapacity: capacity];
        [self setCurrentNumber:1];
        int dimensionX = self.bounds.size.width * .10;
        int dimensionY = self.bounds.size.height * .10;
        for (int i = 0; i < 9; i++)
        {
            // Create Frame for Button
            int originX = i*(dimensionX + self.bounds.size.width*0.001)+self.bounds.size.width*.05;
            int originY = dimensionY + self.bounds.size.height * .05;
            int widthSize = self.bounds.size.width * .09;
            int heightSize = self.bounds.size.height * .7;
            CGRect buttonFrame = CGRectMake(originX, originY, widthSize, heightSize);
            
            // Create Button
            UIButton* theButton = [[UIButton alloc] initWithFrame: buttonFrame];
            if (i == 0)
                theButton.backgroundColor = [UIColor yellowColor];
            else
                theButton.backgroundColor = [UIColor whiteColor];
            [theButton setTitle: [NSString stringWithFormat:@"%d", i+1] forState: (UIControlStateNormal)];
            [theButton setTitleColor: [UIColor blackColor] forState: (UIControlStateNormal)];
            [theButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview: theButton];
            [theButtons addObject: theButton];
            
        }
        
        
    }
    return self;
}

- (void) buttonPressed:(id) sender
{
    for (UIButton* someButton in theButtons)
    {
        id someTitle = [someButton currentTitle];
        if ([someTitle isEqual: [sender currentTitle]])
        {
            someButton.backgroundColor = [UIColor yellowColor];
            [self setCurrentNumber:[[someButton currentTitle] integerValue]];
        }
        else
             someButton.backgroundColor = [UIColor whiteColor];
    }
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
