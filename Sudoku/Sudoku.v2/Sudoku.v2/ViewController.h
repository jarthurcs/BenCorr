//
//  ViewController.h
//  Sudoku.v2
//
//  Created by Ben Corr on 6/4/13.
//  Copyright (c) 2013 Ben Corr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Grid.h"
#import "NumPad.h"
#import "GridData.h"


@interface ViewController : UIViewController
{
    Grid* theGrid;
    NumPad* theNumPad;
    GridData* theData;
}

-(void) gridCellSelected;

@end
