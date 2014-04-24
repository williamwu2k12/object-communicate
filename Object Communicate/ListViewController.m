//
//  ListViewController.m
//  Object Communicate
//
//  Created by William Wu on 4/16/14.
//  Copyright (c) 2014 William Wu. All rights reserved.
//

#import "ListViewController.h"
#import "Item.h"

@interface ListViewController ()

@end

@implementation ListViewController

//UIScrollView * itemArea;
UITableView * itemArea;
NSMutableArray * items;

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
    [self initTitle];
    [self initArea];
    Item * item1 = [[Item alloc] initName: @"phone" andDescription: @"apple iphone" andX: 100.0 andY: 100.0];
    Item * item2 = [[Item alloc] initName: @"laptop" andDescription: @"macbook pro, 13inch" andX: 600.0 andY: 900.0];
    Item * item3 = [[Item alloc] initName: @"backpack" andDescription: @"black kenneth cole reaction tag with one side for water bottle" andX: 10.0 andY: 20.0];
    [self initItem: item1];
    [self initItem: item2];
    [self initItem: item3];
    [self initOptions];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 initialize the title view, probably a label, with its own section and background
 */
- (void) initTitle
{
    UILabel * label = [[UILabel alloc] initWithFrame: CGRectMake(0.0f, 0.0f, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height / 10.0)];
    [label setBackgroundColor: [UIColor greenColor]];
    [label setFont: [UIFont fontWithName: @"Verdana" size: 20.0f]];
    [label setText: @"Your Tracked Items"];
    [label setTextAlignment: NSTextAlignmentCenter];
    [label setContentMode: UIViewContentModeCenter];
    [self.view addSubview: label];
}

- (void) initArea
{
//    items = [[NSMutableArray alloc] init];
//    
//    // head is only placement for first time adding, dummy object for later referencing
//    UILabel * head = [[UILabel alloc] initWithFrame: CGRectMake(0.0f, -[[UIScreen mainScreen] bounds].size.height / 10, [[UIScreen mainScreen] bounds].size.width, 0.0f)];
//    [items addObject: head];
//    
//    // setup the scroll view
//    itemArea = [[UIScrollView alloc] initWithFrame: CGRectMake(0.0f, [[UIScreen mainScreen] bounds].size.height / 10.0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height / 1.25)];
//    [itemArea setBackgroundColor: [UIColor cyanColor]];
//    [itemArea setScrollEnabled: true];
//    [self.view addSubview: itemArea];
    itemArea = [[UITableView alloc] initWithFrame: CGRectMake(0.0f, [[UIScreen mainScreen] bounds].size.height / 10.0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height / 1.25) style: UITableViewStylePlain];
    [self.view addSubview: itemArea];
}

/*
 initialize a view that displays an item's information, such as it's name, description, and a link to the location on a map
 */
- (void) initItem: (Item *) item
{
    UITableViewCell * cell = [[UITableViewCell alloc] init];
//    UIView * label = [[UIView alloc] initWithFrame: CGRectMake(0.0, ((UILabel *) [items lastObject]).frame.origin.y + [[UIScreen mainScreen] bounds].size.height / 10.0 + 1.0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height / 10.0)];
//    [[label layer] setBorderWidth: 1.0];
//    UILabel * name = [[UILabel alloc] initWithFrame: CGRectMake(0.0, 0.0, [[UIScreen mainScreen] bounds].size.width / 1.25, [[UIScreen mainScreen] bounds].size.height / 20.0)];
//    [name setText: [@"    " stringByAppendingString: [item getName]]];
//    [name setFont: [UIFont fontWithName: @"Verdana" size: 12.0]];
//    UILabel * description = [[UILabel alloc] initWithFrame: CGRectMake(0.0, [[UIScreen mainScreen] bounds].size.height / 20.0, [[UIScreen mainScreen] bounds].size.width / 1.25, [[UIScreen mainScreen] bounds].size.height / 20.0)];
//    [description setText: [@"    " stringByAppendingString: [item getDescription]]];
//    [description setFont: [UIFont fontWithName: @"Verdana" size: 9.0]];
//    
//    [label addSubview: name];
//    [label addSubview: description];
//    [items addObject: label];
//    [itemArea addSubview: label];
}

/*
 initialize the options view, this section will allow users to add an item, remove an item, change to other view controllers, etc.
 */
- (void) initOptions
{
    
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
