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
    id target;
    SEL selector;

}
@property (nonatomic) int currentRow;
@property (nonatomic) int currentCol;

-(void) buttonPressed: (id)sender;
-(void) setTarget: (id)target action: (SEL)action;

-(void) setRow: (int)row column: (int)column toValue: (NSString*)value withColor: (UIColor*)color;

@end
