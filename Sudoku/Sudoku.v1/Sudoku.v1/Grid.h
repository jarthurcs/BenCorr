//
//  Grid.h
//  Sudoku.v1
//
//  Created by Ben Corr on 6/4/13.
//  Copyright (c) 2013 Ben Corr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Grid : UIView
{
    NSMutableArray* theButtons;
}

-(void) buttonPressed: (id)sender;
-(void) getCurrentRow;

@end
