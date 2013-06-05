//
//  ViewController.m
//  Sudoku.v2
//
//  Created by Ben Corr on 6/4/13.
//  Copyright (c) 2013 Ben Corr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Create Frame for Grid
    int originX = self.view.bounds.size.width * .10;
    int originY = self.view.bounds.size.height * .10;
    int size = MIN(self.view.bounds.size.height, self.view.bounds.size.width) * .80;
    CGRect gridFrame = CGRectMake(originX, originY, size, size);
    
    // Create Grid
    theGrid = [[Grid alloc] initWithFrame: gridFrame];
    [self.view addSubview: theGrid];
    
    // Create Frame for NumPad
    originY = self.view.bounds.size.height * .75;
    int heightSize = self.view.bounds.size.height * .10;
    int widthSize = self.view.bounds.size.width * .80;
    CGRect numPadFrame = CGRectMake(originX, originY, widthSize, heightSize);
    
    // Create NumPad
    theNumPad = [[NumPad alloc] initWithFrame: numPadFrame];
    [self.view addSubview: theNumPad];
    
    // Create GridData
    theData = [[GridData alloc] init];
    
    [theGrid setTarget:self action:@selector(gridCellSelected)];
}

- (void)gridCellSelected
{
    int row = theGrid.currentRow;
    int column = theGrid.currentCol;
    int value = theNumPad.currentNumber;
    
    if ([theData isLegal:(int)row column:(int)column toValue:[NSString stringWithFormat:@"%d",value]])
    {
        [theGrid setRow: (int)row column: (int) column toValue: [NSString stringWithFormat:@"%d", value]
          withColor: [UIColor blueColor]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
