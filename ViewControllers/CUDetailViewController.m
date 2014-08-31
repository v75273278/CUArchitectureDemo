//
//  CUDetailViewController.m
//  CUArchitectureDemo
//
//  Created by yuguang on 29/8/14.
//  Copyright (c) 2014 lion. All rights reserved.
//

#import "CUDetailViewController.h"
#import "CUDataDAO.h"
#import "CUDataModel.h"

@interface CUDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@end

@implementation CUDetailViewController

- (void)awakeFromNib {
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  
  [self updateLabel];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)updateLabel {
  int dataB = [[CUDataDAO selectData].data intValue];
  int dataC = [[CUDataDAO selectOtherData].data intValue];
  
  self.displayLabel.text = [@(dataB + dataC) stringValue];
}

#pragma mark - action

- (IBAction)changeButtonClicked:(id)sender {
  int value = arc4random() % 100;
  [CUDataDAO setData:value];
  
  [self updateLabel];
  
  [[NSNotificationCenter defaultCenter] postNotificationName:kCUDataChangedNotification
                                                      object:nil
                                                    userInfo:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
