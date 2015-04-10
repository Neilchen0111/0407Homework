//
//  ACCollectionViewController.m
//  0407Homework-UICollectionViewController
//
//  Created by NEIL on 2015/4/7.
//  Copyright (c) 2015年 NEIL. All rights reserved.
//

#import "ACCollectionViewController.h"
#import "ACCollectionViewCell.h"
#import "ACFeed.h"
@interface ACCollectionViewController ()

@property (nonatomic, strong) NSMutableArray *feeddata;
@property (nonatomic, strong) NSDictionary   *dataInfoCopy;


@end

@implementation ACCollectionViewController

static NSString * const reuseIdentifier = @"Cell";


-(void)awakeFromNib{
    
    self.feeddata = [[NSMutableArray alloc]initWithArray:@[
  @{@"uiimage" :[UIImage imageNamed:@"Dog1"]},
  @{@"uiimage" :[UIImage imageNamed:@"Dog2"]},
  @{@"uiimage" :[UIImage imageNamed:@"Dog3"]},
  @{@"uiimage" :[UIImage imageNamed:@"Dog4"]},
  @{@"uiimage" :[UIImage imageNamed:@"Dog5"]}
  ]];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.clearsSelectionOnViewWillAppear = NO;
//      UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
//     collectionViewLayout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _feeddata.count;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   
//    NSDictionary *currentInfo;
//    
//    currentInfo = [self.feeddata objectAtIndex:indexPath.row];

    NSString * const reuseIdentifier = @"ImageTitleCell";
    
    ACCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    
    cell.dogdataimage.image= [[self.feeddata objectAtIndex:indexPath.row] objectForKey:@"uiimage"];
    
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>


// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}



// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}



// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    if ([NSStringFromSelector(action) isEqualToString:@"copy:"]
        || [NSStringFromSelector(action) isEqualToString:@"paste:"])
        return YES;
    
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    NSDictionary *currentInfo;
    NSMutableArray *currentSectionArray;
    currentInfo = [self.feeddata objectAtIndex:indexPath.row];
     currentSectionArray = self.feeddata;
    
 
    if ([NSStringFromSelector(action) isEqualToString:@"copy:"]) {
        self.dataInfoCopy = [currentInfo copy];
    } else if ([NSStringFromSelector(action) isEqualToString:@"paste:"]) {
        [currentSectionArray insertObject:self.dataInfoCopy atIndex:indexPath.row];
        [self.collectionView insertItemsAtIndexPaths:@[indexPath]];
    } else if ([NSStringFromSelector(action) isEqualToString:@"cut:"]) {
        self.dataInfoCopy = [currentInfo copy];
        [currentSectionArray removeObjectAtIndex:indexPath.row];
        [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
    }
	
}


@end
