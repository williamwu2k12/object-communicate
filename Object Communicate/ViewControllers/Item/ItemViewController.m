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
//{
//    UILabel * name;
//    UILabel * description;
//    UIScrollView * statistics;
//    UIImageView * location;
//    AppDelegate * appDelegate;
//    UILabel * xcoord;
//    UILabel * ycoord;
//    UIButton * trollbutton;
//    
//}
{
    UILabel * name;
    UILabel * description;
    UILabel * x;
    UILabel * y;
    UILabel * note;
    UIScrollView * statistics;
    UIScrollView * scroll;
    AppDelegate * appDelegate;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initHeader];
    [self initName];
    [self initDescription];
    [self initNote];
    [self initLocation];
    [self initStatistics];
    [self initImage];
}

- (void) initHeader
{
    UIView * header = [[UIView alloc] initWithFrame: CGRectMake(0.0, 0.0, [[UIScreen mainScreen] bounds].size.width, 0.04 * [[UIScreen mainScreen] bounds].size.height)];
    [header setBackgroundColor: [UIColor darkGrayColor]];
    [self.view addSubview: header];
}

- (UIStatusBarStyle) preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void) initName
{
    name = [[UILabel alloc] initWithFrame: CGRectMake(0.05 * [[UIScreen mainScreen] bounds].size.width, 0.05 * [[UIScreen mainScreen] bounds].size.height, 0.9 * [[UIScreen mainScreen] bounds].size.width, 0.05 * [[UIScreen mainScreen] bounds].size.height)];
    [name setFont: [UIFont fontWithName: @"Verdana" size: 20.0]];
    [self.view addSubview: name];
}

- (void) initDescription
{
    description = [[UILabel alloc] initWithFrame: CGRectMake(0.05 * [[UIScreen mainScreen] bounds].size.width, 0.1 * [[UIScreen mainScreen] bounds].size.height, 0.9 * [[UIScreen mainScreen] bounds].size.width, 0.05 * [[UIScreen mainScreen] bounds].size.height)];
    [description setFont: [UIFont fontWithName: @"Verdana-Italic" size: 12.0]];
    [self.view addSubview: description];
}

- (void) initNote
{
    note = [[UILabel alloc] initWithFrame: CGRectMake(0.05 * [[UIScreen mainScreen] bounds].size.width, 0.15 * [[UIScreen mainScreen] bounds].size.height, 0.9 * [[UIScreen mainScreen] bounds].size.width, 0.1 * [[UIScreen mainScreen] bounds].size.height)];
    [note setFont: [UIFont fontWithName: @"Verdana" size: 12.0]];
    [note setNumberOfLines: 0];
    [self.view addSubview: note];
}

- (void) initLocation
{
    x = [[UILabel alloc] initWithFrame: CGRectMake(0.05 * [[UIScreen mainScreen] bounds].size.width, 0.25 * [[UIScreen mainScreen] bounds].size.height, 0.9 * [[UIScreen mainScreen] bounds].size.width, 0.05 * [[UIScreen mainScreen] bounds].size.height)];
    [x setText: @"Latitude: "];
    [x setFont: [UIFont fontWithName: @"Verdana" size: 12.0]];
    [self.view addSubview: x];
    
    y = [[UILabel alloc] initWithFrame: CGRectMake(0.05 * [[UIScreen mainScreen] bounds].size.width, 0.275 * [[UIScreen mainScreen] bounds].size.height, 0.9 * [[UIScreen mainScreen] bounds].size.width, 0.05 * [[UIScreen mainScreen] bounds].size.height)];
    [y setText: @"Longitude: "];
    [y setFont: [UIFont fontWithName: @"Verdana" size: 12.0]];
    [self.view addSubview: y];
}

- (void) initStatistics
{
    // TEMPORARY
    UIImageView * stats = [[UIImageView alloc] initWithFrame: CGRectMake(0.05 * [[UIScreen mainScreen] bounds].size.width, 0.35 * [[UIScreen mainScreen] bounds].size.height, 0.9 * [[UIScreen mainScreen] bounds].size.width, 0.3 * [[UIScreen mainScreen] bounds].size.height)];
    [[stats layer] setBorderWidth: 3.0];
    [[stats layer] setBorderColor: [[UIColor redColor] CGColor]];
    [self.view addSubview: stats];
}

- (void) initImage
{
    UILabel * label = [[UILabel alloc] initWithFrame: CGRectMake(0.05 * [[UIScreen mainScreen] bounds].size.width, 0.65 * [[UIScreen mainScreen] bounds].size.height, 0.9 * [[UIScreen mainScreen] bounds].size.width, 0.05 * [[UIScreen mainScreen] bounds].size.height)];
    [label setText: @"Images"];
    [label setFont: [UIFont fontWithName: @"Verdana" size: 12.0]];
    [self.view addSubview: label];
    
    scroll = [[UIScrollView alloc] initWithFrame: CGRectMake(0.0, 0.7 * [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width, 0.2 * [[UIScreen mainScreen] bounds].size.height)];
    [scroll setContentSize: CGSizeMake(10000, 0.2 * [[UIScreen mainScreen] bounds].size.height)];
    [scroll setScrollEnabled: YES];
    [scroll setShowsHorizontalScrollIndicator: YES];
    [scroll setShowsVerticalScrollIndicator: NO];
    [[scroll layer] setBorderWidth: 1.0];
    [self.view addSubview: scroll];
}

- (void) setItem: (Item *) item
{
    UIImage * image;
    UIImageView * imageView;
    [name setText: [item getName]];
    [description setText: [item getDescription]];
    [note setText: [@"Notes: " stringByAppendingString: [item getNote]]];
    [note sizeToFit];
    [x setText: [@"Latitude: " stringByAppendingString: [NSString stringWithFormat: @"%f", [item getX]]]];
    [y setText: [@"Longitude: " stringByAppendingString: [NSString stringWithFormat: @"%f", [item getY]]]];
    [[scroll subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
    [scroll setContentSize: CGSizeMake(0.0, 0.2 * [[UIScreen mainScreen] bounds].size.height)];
    for (int i = 0; i < [[item getImages] count]; i++)
    {
        image = [[item getImages] objectAtIndex: i];
        imageView = [[UIImageView alloc] initWithImage: image];
        [imageView setFrame: CGRectMake(i * 0.2 * [[UIScreen mainScreen] bounds].size.height + 0.01 * [[UIScreen mainScreen] bounds].size.height, 0.01 * [[UIScreen mainScreen] bounds].size.height, 0.18 * [[UIScreen mainScreen] bounds].size.height, 0.18 * [[UIScreen mainScreen] bounds].size.height)];
        [[imageView layer] setBorderWidth: 1.0];
        [scroll setContentSize: CGSizeMake([scroll contentSize].width + 0.2 * [[UIScreen mainScreen] bounds].size.height, 0.2 * [[UIScreen mainScreen] bounds].size.height)];
        [scroll addSubview: imageView];
    }
}

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//
//    [self initDescription];
//    [self initStatistics];
//    [self initLocation];
//    [self cakemaker];
//    [self startup];
//    
//    [self initImageView];
//}
//
//
//- (void) initImageView
//{
//    location = [[UIImageView alloc] initWithFrame: CGRectMake(0.1 * [[UIScreen mainScreen] bounds].size.width, 0.5 * [[UIScreen mainScreen] bounds].size.height, 0.8 * [[UIScreen mainScreen] bounds].size.width, 0.4 * [[UIScreen mainScreen] bounds].size.height)];
//    [[location layer] setBorderWidth: 1.0];
//    [self.view addSubview: location];
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//-(void)startup{
//    name = [[UILabel alloc] initWithFrame: CGRectMake([[UIScreen mainScreen] bounds].size.width / 20.0,
//            [[UIScreen mainScreen] bounds].size.height / 50.0, [[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height / 10.0)];
//    xcoord=[[UILabel alloc] initWithFrame: CGRectMake([[UIScreen mainScreen] bounds].size.width / 20.0,
//                [[UIScreen mainScreen] bounds].size.height / 10.0, [[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height / 10.0)];
//    ycoord=[[UILabel alloc] initWithFrame: CGRectMake([[UIScreen mainScreen] bounds].size.width / 20.0, 1.5*[[UIScreen mainScreen] bounds].size.height / 10.0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height / 10.0)];
//    
//    description=[[UILabel alloc] initWithFrame: CGRectMake([[UIScreen mainScreen] bounds].size.width / 20.0, 2.7*[[UIScreen mainScreen] bounds].size.height / 10.0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height / 10.0)];
//    
//    
//    [self initXCoord];
//    [self initYCoord];
//
//    
//    
//}
//
//- (void) cakemaker
//{
//    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
//    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
//    trollbutton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
//    [[trollbutton titleLabel] setFont: [UIFont fontWithName: @"Verdana" size: 12.0]];
//    [trollbutton setFrame: CGRectMake(0.1 * width, 0.4 * height, 0.8 * width, 0.1 * height)];
//    [trollbutton setBackgroundColor:[UIColor greenColor]];
//    [trollbutton setTitle: @"Push Button for Cake" forState: UIControlStateNormal];
//    [trollbutton addTarget: self action: @selector(theCakeisALie) forControlEvents: UIControlEventTouchUpInside];
//    [self.view addSubview: trollbutton];
//}
//
//
//
//- (void) setItem: (Item *) item
//{
//
//
//    [name setFont: [UIFont fontWithName: @"Verdana" size: 18.0f]];
//    [name setText: [item getName] ];
//    [name setTextAlignment: NSTextAlignmentLeft];
//    [name setContentMode: UIViewContentModeLeft];
//    
//    [xcoord setFont: [UIFont fontWithName: @"Verdana" size: 18.0f]];
//    [xcoord setText : [NSString stringWithFormat:  @"%f" , [item getX] ]];
//    [xcoord setTextAlignment: NSTextAlignmentCenter];
//    [xcoord setContentMode: UIViewContentModeCenter];
//    
//    [ycoord setFont: [UIFont fontWithName: @"Verdana" size: 18.0f]];
//    [ycoord setText : [NSString stringWithFormat:  @"%f" , [item getY] ]];
//    [ycoord setTextAlignment: NSTextAlignmentCenter];
//    [ycoord setContentMode: UIViewContentModeCenter];
//    
//    [description setFont: [UIFont fontWithName: @"Verdana" size: 11.0f]];
//    [description setText: [item getDescription] ];
//    [description setTextAlignment: NSTextAlignmentLeft];
//    [description setContentMode: UIViewContentModeLeft];
//    
//    
//    [self.view addSubview: name];
//    [self.view addSubview: xcoord];
//    [self.view addSubview: ycoord];
//    [self.view addSubview: description];
//    
//
//
//}
//
//
//- (void) gotTheCake
//{
//    [trollbutton setTitle: @"Push Button for Cake" forState: UIControlStateNormal];
//    [trollbutton addTarget: self action: @selector(theCakeisALie) forControlEvents: UIControlEventTouchUpInside];
////        [location setImage: [UIImage imageNamed: @"cake.jpg"]];
//}
//
//- (void) theCakeisALie
//{
//    [trollbutton setTitle: @"The cake is a lie. Ain't no Free Lunch." forState: UIControlStateNormal];
//    if ([location image] != nil)
//    {
////        [location setImage: [UIImage imageNamed: @"miltonfriedman.jpg"]];
//    }
//    [trollbutton addTarget: self action: @selector(gotTheCake) forControlEvents: UIControlEventTouchUpInside];
//}
//
//
//
//- (void) initXCoord
//{
//    
//    UILabel * xcoordlabel = [[UILabel alloc] initWithFrame: CGRectMake([[UIScreen mainScreen] bounds].size.width / 20.0, [[UIScreen mainScreen] bounds].size.height / 10.0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height / 10.0)];
//    [xcoordlabel setFont: [UIFont fontWithName: @"Verdana" size: 18.0f]];
//    [xcoordlabel setText: @"Longitude"];
//    [xcoordlabel setTextAlignment: NSTextAlignmentLeft];
//    [xcoordlabel setContentMode: UIViewContentModeLeft];
//    [self.view addSubview: xcoordlabel];
//    
//}
//
//- (void) initYCoord
//{
//    
//    UILabel * ycoordlabel = [[UILabel alloc] initWithFrame: CGRectMake([[UIScreen mainScreen] bounds].size.width / 20.0, 1.5 * [[UIScreen mainScreen] bounds].size.height / 10.0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height / 10.0)];
//    [ycoordlabel setFont: [UIFont fontWithName: @"Verdana" size: 18.0]];
//    [ycoordlabel setText: @"Latitude"];
//    [ycoordlabel setTextAlignment: NSTextAlignmentLeft];
//    [ycoordlabel setContentMode: UIViewContentModeLeft];
//    [self.view addSubview: ycoordlabel];
//    
//}
//
//
//- (void) initDescription
//{
//    description = [[UILabel alloc] initWithFrame: CGRectMake([[UIScreen mainScreen] bounds].size.width / 18.0, 2.3 * [[UIScreen mainScreen] bounds].size.height / 10.0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height / 10.0)];
//    [description setFont: [UIFont fontWithName: @"Verdana" size: 18.0]];
//    [description setText: @"Description:"];
//    [description setTextAlignment: NSTextAlignmentLeft];
//    [description setContentMode: UIViewContentModeLeft];
//    [self.view addSubview: description];
//}
//
//// previous locations, etc.
//- (void) initStatistics
//{
////    NSLog(@"Last seen at this time");
////    NSLog(@"Battery low or high");
////    NSLog(@"Total time of use");
////    NSLog(@"Currently tracking");
//}
//
//- (void) initLocation
//{
//    
//}





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
