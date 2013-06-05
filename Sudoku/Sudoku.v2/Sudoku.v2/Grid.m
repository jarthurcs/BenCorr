//
//  Grid.m
//  Sudoku.v1
//
//  Created by Ben Corr on 6/4/13.
//  Copyright (c) 2013 Ben Corr. All rights reserved.
//

#import "Grid.h"

@implementation Grid

@synthesize currentRow;
@synthesize currentCol;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundColor = [UIColor blackColor];
        
        // Initialization code
        NSUInteger capacity = 81;
        theButtons = [[NSMutableArray alloc] initWithCapacity: capacity];
        int theValues[] = {7, 0, 0, 6, 0, 0, 0, 3, 8, 0, 0, 2, 5, 8, 1, 0, 4, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 4, 5, 6, 0, 0, 0, 8, 9, 3, 2, 0, 9, 0, 0, 4, 6, 0, 0, 0, 0, 0, 0, 6, 5, 0, 0, 2, 0, 0, 5, 4, 0, 6, 0, 1, 7, 0, 0, 0, 3, 0, 0, 0, 0, 4, 9, 4, 0, 0, 7, 0, 2, 0, 0};
        [self setCurrentRow: 0];
        [self setCurrentCol: 0];

        
        int dimensionX = self.bounds.size.width * .1;
        int dimensionY = self.bounds.size.height * .1;
        
        // Create Buttons
        for (int i=0; i < 9; i++)
        {
            for (int j=0; j < 9; j++)
            {
                // Create frame for button
                int originX = (i*dimensionX);
                int originY = (j*dimensionY);
                int index = j*9+i;
                int value = theValues[index];
                NSString* valueString = [NSString stringWithFormat:@"%d", value];
                
                if (i < 3)
                    originX = originX + self.bounds.size.width * .03;
                else if (i < 6)
                    originX = originX + self.bounds.size.width * .06;
                else
                    originX = originX + self.bounds.size.width * .09;
                
                if (j < 3)
                    originY = originY + self.bounds.size.height * .03;
                else if (j < 6)
                    originY = originY + self.bounds.size.height * .06;
                else
                    originY = originY + self.bounds.size.height * .09;
                
                int size = self.bounds.size.width * .09;
                CGRect buttonFrame = CGRectMake(originX, originY, size, size);
        
                // Create button
                UIButton* theButton = [[UIButton alloc] initWithFrame: buttonFrame];
                theButton.backgroundColor = [UIColor whiteColor];
                [theButton setTag:index];
                if (value != 0)
                {
                    [theButton setTitle:(valueString) forState:(UIControlStateNormal)];
                    [theButton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
                }
                [theButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview: theButton];
                [theButtons addObject: theButton];
            }
        }
        
    }
    return self;
}

-(void) buttonPressed: (id) sender
{
    int index = [sender tag];
    [self setCurrentCol: (index % 9)];
    [self setCurrentRow: (index / 9)];
    [target performSelector: selector];
    
}

-(void) setTarget: (id)theTarget action:(SEL)action
{
    target = theTarget;
    selector = action;
}


-(void) setRow: (int)row column: (int)column toValue: (NSString*)value withColor: (UIColor*)color
{
    int index = column*9 + row;
    UIButton* someButton = theButtons[index];
    [someButton setTitle:(value) forState:(UIControlStateNormal)];
    [someButton setTitleColor:color forState:(UIControlStateNormal)];
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
