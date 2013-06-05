//
//  GridData.h
//  Sudoku.v2
//
//  Created by Ben Corr on 6/5/13.
//  Copyright (c) 2013 Ben Corr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GridData : NSObject
{
    int originalValues[81];
    int currentValues[81];
}

-(BOOL) isLegal: (int)row column: (int)column toValue: (NSString*)value;

-(id) init;


@end
