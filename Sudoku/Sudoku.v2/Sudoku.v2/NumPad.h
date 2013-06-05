//
//  NumPad.h
//  Sudoku.v2
//
//  Created by Ben Corr on 6/4/13.
//  Copyright (c) 2013 Ben Corr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumPad : UIView
{
    NSMutableArray* theButtons;
}

@property int currentNumber;

-(void) buttonPressed: (id) sender;


@end
