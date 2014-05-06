//
//  ItemViewController.m
//  Object Communicate
//
//  Created by William Wu on 4/25/14.
//  Copyright (c) 2014 William Wu. All rights reserved.
//

#import "ItemViewController.h"

@interface ItemViewController ()

@end

@implementation ItemViewController
{
    UILabel * name;
    UILabel * description;
    UIScrollView * statistics;
    UIImageView * location;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initName];
    [self initDescription];
    [self initStatistics];
    [self initLocation];
}


- (void) initName
{
    
}

- (void) initDescription
{
    
}

// previous locations, etc.
- (void) initStatistics
{
//    NSLog(@"Last seen at this time");
//    NSLog(@"Battery low or high");
//    NSLog(@"Total time of use");
//    NSLog(@"Currently tracking");
}

- (void) initLocation
{
    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
