//
//  LoginViewController.m
//  Object Communicate
//
//  Created by William Wu on 5/4/14.
//  Copyright (c) 2014 William Wu. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
{
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
    
    UILabel * welcome = [[UILabel alloc] initWithFrame: CGRectMake(0.0, 0.3 * [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width, 0.1 * [[UIScreen mainScreen] bounds].size.height)];
    [welcome setText: @"Welcome"];
    [welcome setFont: [UIFont fontWithName: @"Verdana" size: 50.0]];
    [welcome setTextAlignment: NSTextAlignmentCenter];
    [self.view addSubview: welcome];
    
    appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(goToRVC)];
    [self.view addGestureRecognizer: tap];
    // Do any additional setup after loading the view.
}

- (void) goToRVC
{
    [[appDelegate window] setRootViewController: [appDelegate RVC]];
}




- (BOOL) correctLogin: (NSString *) login andPassword: (NSString *) password
{
    return YES;
}



- (void) initTextFields
{
    // setup login field
    // setup password field
}

- (void) initSubmit
{
    // setup submit button
}

- (void) initCreate
{
    // setup create an account button
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
