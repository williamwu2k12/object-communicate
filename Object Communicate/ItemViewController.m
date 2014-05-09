//
//  ItemViewController.m
//  Object Communicate
//
//  Created by William Wu on 4/25/14.
//  Copyright (c) 2014 William Wu. All rights reserved.
//

#import "ItemViewController.h"
#import "AppDelegate.h"


@interface ItemViewController ()

@end

@implementation ItemViewController
{
    UILabel * name;
    UILabel * description;
    UIScrollView * statistics;
    UIImageView * location;
    AppDelegate * appDelegate;
    UILabel * xcoord;
    UILabel * ycoord;
    UIButton * trollbutton;
    
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

    [self initDescription];
    [self initStatistics];
    [self initLocation];
    [self cakemaker];
    [self startup];
    
    
}

-(void)startup{
    name = [[UILabel alloc] initWithFrame: CGRectMake([[UIScreen mainScreen] bounds].size.width / 20.0,
            [[UIScreen mainScreen] bounds].size.height / 50.0, [[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height / 10.0)];
    xcoord=[[UILabel alloc] initWithFrame: CGRectMake([[UIScreen mainScreen] bounds].size.width / 20.0,
                [[UIScreen mainScreen] bounds].size.height / 10.0, [[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height / 10.0)];
    ycoord=[[UILabel alloc] initWithFrame: CGRectMake([[UIScreen mainScreen] bounds].size.width / 20.0, 1.5*[[UIScreen mainScreen] bounds].size.height / 10.0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height / 10.0)];
    
    description=[[UILabel alloc] initWithFrame: CGRectMake([[UIScreen mainScreen] bounds].size.width / 20.0, 2.7*[[UIScreen mainScreen] bounds].size.height / 10.0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height / 10.0)];
    
    
    [self initXCoord];
    [self initYCoord];

    
    
}

- (void) cakemaker
{
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    trollbutton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [trollbutton setFrame: CGRectMake(0.1 * width, 0.5 * height, 0.85 * width, 0.1 * height)];
    [trollbutton setBackgroundColor:[UIColor greenColor]];
    [trollbutton setTitle: @"Push Button for Cake" forState: UIControlStateNormal];
    [trollbutton addTarget: self action: @selector(theCakeisALie) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: trollbutton];
}



- (void) initItemNode: (Item *) item
{


    [name setFont: [UIFont fontWithName: @"Verdana" size: 18.0f]];
    [name setText: [item getName] ];
    [name setTextAlignment: NSTextAlignmentLeft];
    [name setContentMode: UIViewContentModeLeft];
    
    [xcoord setFont: [UIFont fontWithName: @"Verdana" size: 18.0f]];
    [xcoord setText : [NSString stringWithFormat:  @"%f" , [item getX] ]];
    [xcoord setTextAlignment: NSTextAlignmentCenter];
    [xcoord setContentMode: UIViewContentModeCenter];
    
    [ycoord setFont: [UIFont fontWithName: @"Verdana" size: 18.0f]];
    [ycoord setText : [NSString stringWithFormat:  @"%f" , [item getY] ]];
    [ycoord setTextAlignment: NSTextAlignmentCenter];
    [ycoord setContentMode: UIViewContentModeCenter];
    
    [description setFont: [UIFont fontWithName: @"Verdana" size: 11.0f]];
    [description setText: [item getDescription] ];
    [description setTextAlignment: NSTextAlignmentLeft];
    [description setContentMode: UIViewContentModeLeft];
    
    
    [self.view addSubview: name];
    [self.view addSubview: xcoord];
    [self.view addSubview: ycoord];
    [self.view addSubview: description];
    


}


- (void) gotTheCake
{
    [trollbutton setTitle: @"Push Button for Cake" forState: UIControlStateNormal];
    [trollbutton addTarget: self action: @selector(theCakeisALie) forControlEvents: UIControlEventTouchUpInside];
}

- (void) theCakeisALie
{
    [trollbutton setTitle: @"The cake is a lie. Ain't no Free Lunch." forState: UIControlStateNormal];
    [trollbutton addTarget: self action: @selector(gotTheCake) forControlEvents: UIControlEventTouchUpInside];
}



- (void) initXCoord
{
    
    UILabel * xcoordlabel = [[UILabel alloc] initWithFrame: CGRectMake([[UIScreen mainScreen] bounds].size.width / 20.0, [[UIScreen mainScreen] bounds].size.height / 10.0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height / 10.0)];
    [xcoordlabel setFont: [UIFont fontWithName: @"Verdana" size: 18.0f]];
    [xcoordlabel setText: @"Longitude"];
    [xcoordlabel setTextAlignment: NSTextAlignmentLeft];
    [xcoordlabel setContentMode: UIViewContentModeLeft];
    [self.view addSubview: xcoordlabel];
    
}

- (void) initYCoord
{
    
    UILabel * ycoordlabel = [[UILabel alloc] initWithFrame: CGRectMake([[UIScreen mainScreen] bounds].size.width / 20.0, 1.5*[[UIScreen mainScreen] bounds].size.height / 10.0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height / 10.0)];
    [ycoordlabel setFont: [UIFont fontWithName: @"Verdana" size: 18.0f]];
    [ycoordlabel setText: @"Latitude"];
    [ycoordlabel setTextAlignment: NSTextAlignmentLeft];
    [ycoordlabel setContentMode: UIViewContentModeLeft];
    [self.view addSubview: ycoordlabel];
    
}


- (void) initDescription
{
    description= [[UILabel alloc] initWithFrame: CGRectMake([[UIScreen mainScreen] bounds].size.width / 18.0, 2.3*[[UIScreen mainScreen] bounds].size.height / 10.0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height / 10.0)];
    [description setFont: [UIFont fontWithName: @"Verdana" size: 18.0f]];
    [description setText: @"Description:"];
    [description setTextAlignment: NSTextAlignmentLeft];
    [description setContentMode: UIViewContentModeLeft];
    [self.view addSubview: description];
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
