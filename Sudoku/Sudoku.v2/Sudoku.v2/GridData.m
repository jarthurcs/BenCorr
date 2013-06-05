//
//  GridData.m
//  Sudoku.v2
//
//  Created by Ben Corr on 6/5/13.
//  Copyright (c) 2013 Ben Corr. All rights reserved.
//

#import "GridData.h"

@implementation GridData

-(id) init
{
    self = [super init];
    if (self)
    {
        int tempValues[81] = {7, 0, 0, 6, 0, 0, 0, 3, 8, 0, 0, 2, 5, 8, 1, 0, 4, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 4, 5, 6, 0, 0, 0, 8, 9, 3, 2, 0, 9, 0, 0, 4, 6, 0, 0, 0, 0, 0, 0, 6, 5, 0, 0, 2, 0, 0, 5, 4, 0, 6, 0, 1, 7, 0, 0, 0, 3, 0, 0, 0, 0, 4, 9, 4, 0, 0, 7, 0, 2, 0, 0};
        for (int i = 0; i < 81; i++)
        {
            currentValues[i] = tempValues[i];
            originalValues[i] = tempValues[i];
        }
        
    }
    return self;
}

-(BOOL) isLegal: (int)row column: (int)column toValue: (NSString*)value
{
    int someValue = [value integerValue];
    int index = row*9 + column;
    
    if (originalValues[index] != 0)
        return false;
    
    // check column
    for (int i=0; i < 9; i++)
    {
        if ((currentValues[i*9 + column] == someValue) && ((i*9 + column) != index))
            return false;
    }
    
    // check row
    for (int j=0; j < 9; j++)
    {
        if((currentValues[row*9+j] == someValue) && ((row*9 + j) != index))
            return false;
    }
    
    // check square
    if (row < 3 && column < 3) //section 1
    {
        for(int i = 0; i < 3; i++)
        {
            for(int j = 0; j < 3; j++)
            {
                if ((currentValues[i+j*9]) == someValue && ((i+j*9) != index))
                    return false;
            }
        }
    }
    else if (row < 3 && column < 6) //section 2
    {
        for(int i = 3; i < 6; i++)
        {
            for(int j = 0; j < 3; j++)
            {
                if ((currentValues[i+j*9]) == someValue && ((i+j*9) != index))
                    return false;
            }
        }
        
    }
    else if (row < 3) //section 3
    {
        for(int i = 6; i < 9; i++)
        {
            for(int j = 0; j < 3; j++)
            {
                if ((currentValues[i+j*9]) == someValue && ((i+j*9) != index))
                    return false;
            }
        }
        
    }
    else if (row < 6 && column < 3) //section 4
    {
        for(int i = 0; i < 3; i++)
        {
            for(int j = 3; j < 6; j++)
            {
                if ((currentValues[i+j*9]) == someValue && ((i+j*9) != index))
                    return false;
            }
        }
        
    }
    else if (row < 6 && column < 6) //section 5
    {
        for(int i = 3; i < 6; i++)
        {
            for(int j = 3; j < 6; j++)
            {
                if ((currentValues[i+j*9]) == someValue && ((i+j*9) != index))
                    return false;
            }
        }
        
    }
    else if (row < 6) //section 6
    {
        for(int i = 6; i < 9; i++)
        {
            for(int j = 3; j < 6; j++)
            {
                if ((currentValues[i+j*9]) == someValue && ((i+j*9) != index))
                    return false;
            }
        }
        
    }
    else if (column < 3) //section 7
    {
        for(int i = 0; i < 3; i++)
        {
            for(int j = 6; j < 9; j++)
            {
                if ((currentValues[i+j*9]) == someValue && ((i+j*9) != index))
                    return false;
            }
        }
        
    }
    else if (column < 6) //section 8
    {
        for(int i = 3; i < 6; i++)
        {
            for(int j = 6; j < 9; j++)
            {
                if ((currentValues[i+j*9]) == someValue && ((i+j*9) != index))
                    return false;
            }
        }
        
    }
    else //section 9
    {
        for(int i = 6; i < 9; i++)
        {
            for(int j = 6; j < 9; j++)
            {
                if ((currentValues[i+j*9]) == someValue && ((i+j*9) != index))
                    return false;
            }
        }
        
    }
    
    currentValues[index] = someValue;
    return true;
    
}


@end
