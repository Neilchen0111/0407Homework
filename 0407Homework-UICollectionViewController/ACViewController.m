//
//  ACViewController.m
//  0407Homework-UICollectionViewController
//
//  Created by NEIL on 2015/4/8.
//  Copyright (c) 2015年 NEIL. All rights reserved.
//

#import "ACViewController.h"
#import "ACTimedelegate.h"

@interface ACViewController () < ACTimedelegateDelegate >

@property (nonatomic, strong) ACTimedelegate *firstProtocol;

@end

@implementation ACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _firstProtocol = [[ACTimedelegate alloc]init];
    _firstProtocol.delegate = self;

    [_firstProtocol startProcessWithSecond];
    
    self.view1.image = [UIImage imageNamed:@"Dog1"];

    self.view2.image = [UIImage imageNamed:@"Dog2"];

    

   
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) sampProtocolDidCompleted{
    self.view3.image = [UIImage imageNamed:@"Dog3"];
    self.view4.image = [UIImage imageNamed:@"Dog4"];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
