//
//  NewItemViewController.m
//  Object Communicate
//
//  Created by William Wu on 5/4/14.
//  Copyright (c) 2014 William Wu. All rights reserved.
//

#import "NewItemViewController.h"
#import "Item.h"
#import "AppDelegate.h"

@interface NewItemViewController ()

@end

@implementation NewItemViewController
{
    UITextField * name;
    UITextField * description;
    UITextField * locationX;
    UITextField * locationY;
    UIButton * submit;
    UIButton * cancel;
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
    
    appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    [self initTextFields];
    [self initSubmit];
    [self initCancel];
    // Do any additional setup after loading the view.
}

- (void) initTextFields
{
    name = [[UITextField alloc] initWithFrame: CGRectMake(0.0, 30.0, [[UIScreen mainScreen] bounds].size.width, 30.0)];
    [[name layer] setBorderWidth: 1.0];
    description = [[UITextField alloc] initWithFrame: CGRectMake(0.0, 70.0, [[UIScreen mainScreen] bounds].size.width, 30.0)];
    [[description layer] setBorderWidth: 1.0];
    locationX = [[UITextField alloc] initWithFrame: CGRectMake(0.0, 110.0, [[UIScreen mainScreen] bounds].size.width, 30.0)];
    [[locationX layer] setBorderWidth: 1.0];
    locationY = [[UITextField alloc] initWithFrame: CGRectMake(0.0, 150.0, [[UIScreen mainScreen] bounds].size.width, 30.0)];
    [[locationY layer] setBorderWidth: 1.0];
    
    [self.view addSubview: name];
    [self.view addSubview: description];
    [self.view addSubview: locationX];
    [self.view addSubview: locationY];
}

- (void) initSubmit
{
    submit = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [submit setFrame: CGRectMake(0.0, 190.0, 60.0, 30.0)];
    [submit setTitle: @"Submit" forState: UIControlStateNormal];
    [submit addTarget: self action: @selector(submitAction) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: submit];
}

- (void) initCancel
{
    cancel = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [cancel setFrame: CGRectMake(0.0, 220.0, 60.0, 30.0)];
    [cancel setTitle: @"Cancel" forState: UIControlStateNormal];
    [cancel addTarget: self action: @selector(cancelAction) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: cancel];
}

- (void) cancelAction
{
    [[appDelegate window] setRootViewController: [appDelegate RVC]];
}

- (void) submitAction
{
    if ([name text] == [description text] && [name text] == [locationX text] && [name text] == [locationY text] && [[name text] isEqual: @""])
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle: @"Missing Element" message: @"Please fill out all fields to add a new item, or cancel the operation." delegate: self cancelButtonTitle: @"Continue" otherButtonTitles: nil, nil];
        [alert show];
        return;
    }
    Item * item = [[Item alloc] initName: [name text] andDescription: [description text] andX: (CGFloat) [[locationX text] integerValue] andY: (CGFloat) [[locationY text] integerValue]];
    [(ListViewController *) [[[appDelegate RVC] viewControllers] objectAtIndex: 0] initItem: item];
    [[appDelegate window] setRootViewController: [appDelegate RVC]];
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
