//
//  ACTimedelegate.m
//  0407Homework-UICollectionViewController
//
//  Created by NEIL on 2015/4/8.
//  Copyright (c) 2015年 NEIL. All rights reserved.
//

#import "ACTimedelegate.h"

@implementation ACTimedelegate

- (void)startProcessWithSecond{
    
    if (self.delegate) {
        
        int64_t delayInSeconds =2;
        
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self.delegate sampProtocolDidCompleted];
            
   

        }
                       );
    }
}



@end
