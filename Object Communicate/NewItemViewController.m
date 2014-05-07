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
    [self initTap];
    [self initSubmit];
    [self initCancel];
    // Do any additional setup after loading the view.
}

- (void) initTextFields
{
    name = [[UITextField alloc] initWithFrame: CGRectMake([[UIScreen mainScreen] bounds].size.width / 20.0, [[UIScreen mainScreen] bounds].size.height / 20.0, 9.0 * [[UIScreen mainScreen] bounds].size.width / 10.0, 30.0)];
    description = [[UITextField alloc] initWithFrame: CGRectMake([[UIScreen mainScreen] bounds].size.width / 20.0, 2.5 * [[UIScreen mainScreen] bounds].size.height / 20.0, 9.0 * [[UIScreen mainScreen] bounds].size.width / 10.0, 30.0)];
    locationX = [[UITextField alloc] initWithFrame: CGRectMake([[UIScreen mainScreen] bounds].size.width / 20.0, 4.0 * [[UIScreen mainScreen] bounds].size.height / 20.0, 9.0 * [[UIScreen mainScreen] bounds].size.width / 10.0, 30.0)];
    locationY = [[UITextField alloc] initWithFrame: CGRectMake([[UIScreen mainScreen] bounds].size.width / 20.0, 5.5 * [[UIScreen mainScreen] bounds].size.height / 20.0, 9.0 * [[UIScreen mainScreen] bounds].size.width / 10.0, 30.0)];
    
    [name setDelegate: (id) self];
    [description setDelegate: (id) self];
    [locationX setDelegate: (id) self];
    [locationY setDelegate: (id) self];
    
    [self setText];
    [self setAppearance: name];
    [self setAppearance: description];
    [self setAppearance: locationX];
    [self setAppearance: locationY];
    
    [self.view addSubview: name];
    [self.view addSubview: description];
    [self.view addSubview: locationX];
    [self.view addSubview: locationY];
}

- (void) setText
{
    [name setText: @"name"];
    [description setText: @"description"];
    [locationX setText: @"x position"];
    [locationY setText: @"y position"];
}

- (void) setAppearance: (UITextField *) textField
{
//    UIView * padding = [[UIView alloc] initWithFrame: CGRectMake(0.0, 0.0, 7.0, 7.0)];
//    [textField setLeftView: padding];
//    [textField setLeftViewMode: UITextFieldViewModeAlways];
//    [[textField layer] setBorderWidth: 1.0];
//    [textField setRightView: padding];
//    [textField setRightViewMode: UITextFieldViewModeAlways];
    [textField setBorderStyle: UITextBorderStyleRoundedRect];
    [textField setFont: [UIFont fontWithName: @"Verdana" size: 12.0]];
}

- (void) initSubmit
{
    submit = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [submit setFrame: CGRectMake(7.5 * [[UIScreen mainScreen] bounds].size.width / 10.0, 7.0 * [[UIScreen mainScreen] bounds].size.height / 20.0, 60.0, 30.0)];
    [submit setTitle: @"Submit" forState: UIControlStateNormal];
    [submit addTarget: self action: @selector(submitAction) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: submit];
}

- (void) initCancel
{
    cancel = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [cancel setFrame: CGRectMake(0.5 * [[UIScreen mainScreen] bounds].size.width / 10.0, 7.0 * [[UIScreen mainScreen] bounds].size.height / 20.0, 60.0, 30.0)];
    [cancel setTitle: @"Cancel" forState: UIControlStateNormal];
    [cancel addTarget: self action: @selector(cancelAction) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: cancel];
}

- (void) initTap
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(dismissKeyboard)];
    [tap setCancelsTouchesInView: NO];
    [self.view addGestureRecognizer: tap];
}

- (void) textFieldDidBeginEditing: (UITextField *) textField
{
    if ([[textField text] isEqualToString: @"name"] || [[textField text] isEqualToString: @"description"] || [[textField text] isEqualToString: @"x position"] || [[textField text] isEqualToString: @"y position"])
    {
        [textField setText: @""];
    }
}

- (void) textFieldDidEndEditing: (UITextField *) textField
{
    if ([[name text] isEqualToString: @""])
    {
        [name setText: @"name"];
    }
    if ([[description text] isEqualToString: @""])
    {
        [description setText: @"description"];
    }
    if ([[locationX text] isEqualToString: @""])
    {
        [locationX setText: @"x position"];
    }
    if ([[locationY text] isEqualToString: @""])
    {
        [locationY setText: @"y position"];
    }
}

- (void) dismissKeyboard
{
    [name resignFirstResponder];
    [description resignFirstResponder];
    [locationX resignFirstResponder];
    [locationY resignFirstResponder];
}

- (void) submitAction
{
    if ([name text] == [description text] && [name text] == [locationX text] && [name text] == [locationY text] && [[name text] isEqual: @""])
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle: @"Missing Element" message: @"Please fill out all fields to add a new item, or cancel the operation." delegate: self cancelButtonTitle: @"Continue" otherButtonTitles: nil, nil];
        [alert show];
        return;
    }
    
    // check if locationX and locationY are doubles or whether there are letters (no letters allowed)
    
    
    Item * item = [[Item alloc] initName: [name text] andDescription: [description text] andX: [[locationX text] doubleValue] andY: [[locationY text] doubleValue]];
    [[appDelegate LVC] initCell: item];
    [[appDelegate MVC] initPin: item];
    
    [[appDelegate window] setRootViewController: [appDelegate RVC]];
    [self setText];
}

- (void) cancelAction
{
    [[appDelegate window] setRootViewController: [appDelegate RVC]];
    [self setText];
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
