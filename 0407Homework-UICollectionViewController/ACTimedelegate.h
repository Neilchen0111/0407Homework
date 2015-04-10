//
//  ACTimedelegate.h
//  0407Homework-UICollectionViewController
//
//  Created by NEIL on 2015/4/8.
//  Copyright (c) 2015年 NEIL. All rights reserved.
//
#import <Foundation/Foundation.h>

@class ACTimedelegate;

@protocol ACTimedelegateDelegate <NSObject>

@required

-(void)sampProtocolDidCompleted;

@end


@interface ACTimedelegate : NSObject

@property (nonatomic,strong) id delegate;

- (void)startProcessWithSecond;


@end
