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
{
    UITableView * itemTable;
    NSMutableArray * itemSource;
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
    [self initTitle];
    [self initArea];

    Item * item1 = [[Item alloc] initName: @"iPhone" andDescription: @"black iPhone with blue and green protective case" andX: 100.0 andY: 100.0];
    Item * item2 = [[Item alloc] initName: @"MacBook Pro" andDescription: @"13 inch apple computer with serial 123456789" andX: 600.0 andY: 900.0];
    Item * item3 = [[Item alloc] initName: @"Backpack" andDescription: @"black schoolbag with 4 layers and 1 mesh water bottle holder" andX: 10.0 andY: 20.0];
    Item * item4 = [[Item alloc] initName: @"Textbook" andDescription: @"linear algebra and differential equations lays/nagles" andX: 1000.0 andY: 1000.0];
    Item * item5 = [[Item alloc] initName: @"Batteries" andDescription: @"aaa batteries, remember to bring for event" andX: 50.0 andY: 50.0];
    
    [self initItem: item1];
    [self initItem: item2];
    [self initItem: item3];
    [self initItem: item4];
    [self initItem: item5];

    [self initOptions];
}


/*
 initialize the title view, probably a label, with its own section and background
 */
- (void) initTitle
{
    UILabel * label = [[UILabel alloc] initWithFrame: CGRectMake(0.0, [[UIScreen mainScreen] bounds].size.height / 50.0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height / 10.0)];
    [label setFont: [UIFont fontWithName: @"Verdana" size: 20.0f]];
    [label setText: @"William's Tracked Items"];
    [label setTextAlignment: NSTextAlignmentCenter];
    [label setContentMode: UIViewContentModeCenter];
    [self.view addSubview: label];
}

/*
 initialize the table view and its data source
 */
- (void) initArea
{
    itemSource = [[NSMutableArray alloc] init];
    itemTable = [[UITableView alloc] initWithFrame: CGRectMake(0.0f, [[UIScreen mainScreen] bounds].size.height / 10.0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height / 1.25) style: UITableViewStylePlain];
    [itemTable setDataSource: self];
    [itemTable setDelegate: self];
    [self.view addSubview: itemTable];
}

/*
 override default number of sections
 */
- (NSInteger) numberOfSectionsInTableView: (UITableView *) tableView
{
    return 1;
}

/*
 override default number of rows in section
 */
- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger) section
{
    return 20;
}

/*
 called by reloadData, sets up the cells in the table view
 */
- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: @"cell"];
    if ([indexPath row] < [itemSource count])
    {
        Item * item = [itemSource objectAtIndex: [indexPath row]];
        [[cell textLabel] setText: [item getName]];
        [[cell textLabel] setFont: [UIFont fontWithName: @"Verdana" size: 12.0]];
        [[cell detailTextLabel] setText: [item getDescription]];
        [[cell detailTextLabel] setFont: [UIFont fontWithName: @"Verdana" size: 9.0]];
    }
    return cell;
}

/*
 override what happens when a row is selected
 */
- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath
{
//    if ([indexPath row] < [itemSource count])
//    {
//        Item * item = [itemSource objectAtIndex: [indexPath row]];
//        UIAlertView * alert = [[UIAlertView alloc] initWithTitle: @"Item Clicked" message: [@"Go to MapViewController with coordinates: " stringByAppendingString: [NSString stringWithFormat: @"%f",[item getX]]] delegate: self cancelButtonTitle: @"Cancel" otherButtonTitles: nil];
//        [alert show];
//        self.tabBarController.selectedIndex = 1;
//    }
    [tableView deselectRowAtIndexPath: indexPath animated: YES];
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
- (void) initItem: (Item *) item
{
    [itemSource addObject: item];
}



/*
 initialize the options view, this section will allow users to add an item, remove an item, change to other view controllers, etc.
 */
- (void) initOptions
{
    UIButton * addButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [addButton setTitle: @"+" forState: UIControlStateNormal];
    [[addButton titleLabel] setFont: [UIFont fontWithName: @"Verdana" size: 25.0]];
    [addButton setFrame: CGRectMake([[UIScreen mainScreen] bounds].size.width / 10.0, 8.0 * [[UIScreen mainScreen] bounds].size.height / 10.0, 25.0, 25.0)];
    [addButton addTarget: self action: @selector(doSomething) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: addButton];
}

- (void) doSomething
{
    Item * item = [[Item alloc] init];
    [item setName: @"Test Item"];
    [item setDescription: @"example generic string description"];
    [item setLocationWithX: 600.0 andY: 900.0];
    [self initItem: item];
    [itemTable reloadData];
//    self.tabBarController.selectedIndex = 2;
}

- (void) doNothing
{
    return;
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
