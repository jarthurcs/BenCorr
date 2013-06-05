//
//  ViewController.m
//  Sudoku.v1
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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
