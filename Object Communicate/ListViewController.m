//
//  ListViewController.m
//  Object Communicate
//
//  Created by William Wu on 4/16/14.
//  Copyright (c) 2014 William Wu. All rights reserved.
//

#import "ListViewController.h"
#import "AppDelegate.h"

@interface ListViewController ()

@end

@implementation ListViewController
{
    UITableView * itemTable;
    NSMutableArray * itemSource;
    
    UILabel * title;
    UIButton * addButton;
    UISearchBar * search;
    
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    [self initTitle];
    [self initAddButton];
    [self initTable];
    [self initSearch];
    [self initTap];
    [self initOptions];
    
    // initialize preexisting cell data, same as in map view controller
    for (int i = 0; i < [itemSource count]; i++)
    {
        [self initItem: (Item *) [itemSource objectAtIndex: i]];
    }
    
    Item * item0 = [[Item alloc] initName: @"Clark Kerr Campus" andDescription: @"berkeley dormitories, home of two years" andX:37.8633232 andY: -122.24989010000002 andActive: YES];
    Item * item1 = [[Item alloc] initName: @"2520 Hillegass Ave" andDescription: @"apartment complex next to people's park" andX: 37.864470 andY: -122.256706 andActive: YES];
    Item * item2 = [[Item alloc] initName: @"iPhone" andDescription: @"black iPhone with blue and green protective case" andX: 37.875743 andY: -122.258732 andActive: YES];
    Item * item3 = [[Item alloc] initName: @"MacBook Pro" andDescription: @"13 inch apple computer with serial 123456789" andX: 37.866913 andY: -122.254971 andActive: NO];
    Item * item4 = [[Item alloc] initName: @"Backpack" andDescription: @"black schoolbag with 4 layers" andX: 37.712569 andY: -122.219743 andActive: NO];
    Item * item5 = [[Item alloc] initName: @"Textbook" andDescription: @"linear algebra and differential equations lays/nagles" andX: 37.872173 andY: -122.267801 andActive: NO];
    Item * item6 = [[Item alloc] initName: @"Batteries" andDescription: @"aaa batteries, remember to bring for event" andX: 37.872062 andY: -122.257812 andActive: NO];
    [self initItem: item0];
    [self initItem: item1];
    [self initItem: item2];
    [self initItem: item3];
    [self initItem: item4];
    [self initItem: item5];
    [self initItem: item6];
}

- (void) initItem: (Item *) item
{
    [[appDelegate LVC] initCell: item];
    [[appDelegate MVC] initPin: item];
}


- (void) initSearch
{
    search = [[UISearchBar alloc] initWithFrame: CGRectMake(0.0, 0.0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height / 12.0)];
    [search setSearchBarStyle: UISearchBarStyleMinimal];
    [search setDelegate: self];
    [itemTable setTableHeaderView: search];
}

- (void) initTap
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(dismissKeyboard)];
    [tap setCancelsTouchesInView: NO];
    [self.view addGestureRecognizer: tap];
}

- (void) searchBarSearchButtonClicked: (UISearchBar *) searchBar
{
    [search resignFirstResponder];
}

- (void) dismissKeyboard
{
    [search resignFirstResponder];
}

/*
 initialize the title view, probably a label, with its own section and background
 */
- (void) initTitle
{
    title = [[UILabel alloc] initWithFrame: CGRectMake([[UIScreen mainScreen] bounds].size.width / 20.0, [[UIScreen mainScreen] bounds].size.height / 50.0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height / 10.0)];
    [title setFont: [UIFont fontWithName: @"Verdana" size: 18.0f]];
    [title setText: @"Tracked Items"];
    [title setTextAlignment: NSTextAlignmentLeft];
    [title setContentMode: UIViewContentModeLeft];
    [self.view addSubview: title];
}

- (void) initAddButton
{
    addButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [addButton setTitle: @"New" forState: UIControlStateNormal];
    [[addButton titleLabel] setFont: [UIFont fontWithName: @"Verdana" size: 15.0]];
    
    [addButton setFrame: CGRectMake(8.5 * [[UIScreen mainScreen] bounds].size.width / 10.0, [[UIScreen mainScreen] bounds].size.height / 50.0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height / 10.0)];
    [addButton setContentHorizontalAlignment: UIControlContentHorizontalAlignmentLeft];
    [addButton setContentVerticalAlignment: UIControlContentVerticalAlignmentCenter];
    [[addButton titleLabel] setTextAlignment: NSTextAlignmentLeft];
    [[addButton titleLabel] setContentMode: UIViewContentModeLeft];
    [addButton addTarget: self action: @selector(goToNIVC) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: addButton];
}

/*
 initialize the table view and its data source
 */
- (void) initTable
{
    itemSource = [[NSMutableArray alloc] init];
    itemTable = [[UITableView alloc] initWithFrame: CGRectMake(0.0, 0.1 * [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width, 0.9 * [[UIScreen mainScreen] bounds].size.height) style: UITableViewStyleGrouped];
    [itemTable setDataSource: self];
    [itemTable setDelegate: self];
    [self.view addSubview: itemTable];
}

- (NSMutableArray *) getItemSource
{
    return itemSource;
}


- (CGFloat) tableView: (UITableView *) tableView heightForHeaderInSection: (NSInteger) section
{
    if (section == 0)
    {
        return 25.0;
    }
    return 0.0;
}

- (NSString *) tableView: (UITableView *) tableView titleForHeaderInSection: (NSInteger) section
{
    if (section == 0)
    {
        return @"Online";
    }
    return @"Offline";
}

/*
 override default number of sections
 */
- (NSInteger) numberOfSectionsInTableView: (UITableView *) tableView
{
    return 2;
}

/*
 override default number of rows in section
 */
- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger) section
{
    // active section
    int count = 0;
    for (int i = 0; i < [itemSource count]; i++)
    {
        if ([(Item *) [itemSource objectAtIndex: i] getActive] == YES)
        {
            count++;
        }
    }
    if (section == 0)
    {
        return count;
    }
    return [itemSource count] - count;
}

/*
 called by reloadData, sets up the cells in the table view
 */
- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: @"cell"];
    Item * item;
    BOOL state;
    if ([indexPath section] == 0)
    {
        state = YES;
    }
    else
    {
        state = NO;
    }
    NSMutableArray * array = [self getItems: state];
    if ([indexPath row] < [array count])
    {
        item = [array objectAtIndex: [indexPath row]];
        [[cell textLabel] setText: [item getName]];
        [[cell textLabel] setFont: [UIFont fontWithName: @"Verdana" size: 12.0]];
        [[cell detailTextLabel] setText: [item getDescription]];
        [[cell detailTextLabel] setFont: [UIFont fontWithName: @"Verdana-Italic" size: 9.0]];

        
        UIButton * button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        [button setFrame: CGRectMake(0.85 * [[UIScreen mainScreen] bounds].size.width, 0.015 * [[UIScreen mainScreen] bounds].size.height, 0.15 * [[UIScreen mainScreen] bounds].size.width, 0.05 * [[UIScreen mainScreen] bounds].size.height)];
//        [button setBackgroundColor: [UIColor greenColor]];
        
        [button addTarget: self action: @selector(goToItem:) forControlEvents: UIControlEventTouchUpInside];
        [button setTitle: @"Map" forState: UIControlStateNormal];
        [[cell contentView] addSubview: button];
    }
    return cell;
}

- (void) goToItem: (id) sender
{
    Item * item;
    BOOL state;
    UIView * cell = sender;
    while (cell != nil && ![cell isKindOfClass: [UITableViewCell class]])
    {
        cell = [cell superview];
    }
    NSIndexPath * indexPath = [itemTable indexPathForCell: (UITableViewCell *) cell];
    if ([indexPath section] == 0)
    {
        state = YES;
    }
    else
    {
        state = NO;
    }
    NSMutableArray * array = [self getItems: state];
    item = (Item *) [array objectAtIndex: [indexPath row]];
    [[appDelegate MVC] goToX: [item getX] andY: [item getY] andZoom: 0.05 withItem: item andHighlight: YES];
    self.tabBarController.selectedIndex = 1;
}

/*
 override what happens when a row is selected
 */
- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath
{
    [tableView deselectRowAtIndexPath: indexPath animated: YES];
    
    
    Item * item;
    BOOL state;
    if ([indexPath section] == 0)
    {
        state = YES;
    }
    else
    {
        state = NO;
    }
    NSMutableArray * array = [self getItems: state];
    item = (Item *) [array objectAtIndex: [indexPath row]];
    [[appDelegate IVC] initItemNode: item];
    [self.tabBarController setSelectedIndex: 2];
    
    
//    Item * item;
//    BOOL state;
//    if ([indexPath section] == 0)
//    {
//        state = YES;
//    }
//    else
//    {
//        state = NO;
//    }
//    NSMutableArray * array = [self getItems: state];
//    item = (Item *) [array objectAtIndex: [indexPath row]];
//    [[appDelegate MVC] goToX: [item getX] andY: [item getY] andZoom: 0.05 withItem: item andHighlight: YES];
//    self.tabBarController.selectedIndex = 1;
}

- (NSMutableArray *) getItems: (BOOL) state
{
    NSMutableArray * array = [[NSMutableArray alloc] init];
    for (int i = 0; i < [itemSource count]; i++)
    {
        if ([(Item *) [itemSource objectAtIndex: i] getActive] == state)
        {
            [array addObject: [itemSource objectAtIndex: i]];
        }
    }
    return array;
}


- (void) addItem: (Item *) item
{
    
}

- (void) removeItem: (Item *) item
{
    
}

- (void) updateItem: (Item *) item
{
    
}

- (void) showItem: (Item *) item
{
    
}



/*
 initialize a view that displays an item's information, such as it's name, description, and a link to the location on a map
 */
- (void) initCell: (Item *) item
{
    [itemSource addObject: item];
    [itemTable reloadData];
}

/*
 initialize the options view, this section will allow users to add an item, remove an item, change to other view controllers, etc.
 */
- (void) initOptions
{
    
}

/*
 switch view controller to a temporary view controller, the new item view controller, to allow the user to specify what item characteristics to add
 */
- (void) goToNIVC
{
    [[appDelegate window] setRootViewController: [appDelegate NIVC]];
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
