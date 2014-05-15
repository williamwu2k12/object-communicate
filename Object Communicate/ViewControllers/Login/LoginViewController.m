//
//  LoginViewController.m
//  Object Communicate
//
//  Created by William Wu on 5/4/14.
//  Copyright (c) 2014 William Wu. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@interface LoginViewController ()

@end

@implementation LoginViewController
{
    UITextField * username;
    UITextField * password;
    UIButton * login;
    AppDelegate * appDelegate;
    float width, height;
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
    
    width = [[UIScreen mainScreen] bounds].size.width;
    height = [[UIScreen mainScreen] bounds].size.height;
    appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    [self initBackground];
    [self initButton];
    [self initFields];
    
    [self temp];
    // Do any additional setup after loading the view.
}

- (void) temp
{
    UILabel * welcome = [[UILabel alloc] initWithFrame: CGRectMake(0.0, 0.25 * height, width, 0.1 * height)];
    [welcome setText: @"Welcome"];
    [welcome setFont: [UIFont fontWithName: @"Verdana" size: 50.0]];
    [welcome setTextAlignment: NSTextAlignmentCenter];
    [self.view addSubview: welcome];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(goToRVC)];
    [self.view addGestureRecognizer: tap];
}

- (void) initBackground
{
    UIColor * blue = [UIColor colorWithRed: 0.1 green: 0.1 blue: 1.0 alpha: 0.5];
    UIColor * green = [UIColor colorWithRed: 0.1 green: 1.0 blue: 0.1 alpha: 0.5];
    CAGradientLayer * gradient = [CAGradientLayer layer];
    
    [gradient setColors: [NSArray arrayWithObjects: (id) blue.CGColor, (id) green.CGColor, nil]];
    [gradient setBounds: CGRectMake(0, 0, width * 2, height * 2)];
    
    [self.view.layer insertSublayer: gradient atIndex: 0];
}

- (void) initFields
{
    username = [[UITextField alloc] initWithFrame: CGRectMake(0.0, 0.0, 0.85 * width, 0.065 * height)];
    [username setText: @"username"];
    [username setCenter: CGPointMake(0.5 * width, 0.45 * height)];
    [username setBackgroundColor: [UIColor whiteColor]];
    [username setBorderStyle: UITextBorderStyleRoundedRect];
    [self.view addSubview: username];
    
    
    password = [[UITextField alloc] initWithFrame: CGRectMake(0.0, 0.0, 0.85 * width, 0.065 * height)];
    [password setText: @"password"];
    [password setCenter: CGPointMake(0.5 * width, 0.525 * height)];
    [password setBackgroundColor: [UIColor whiteColor]];
    [password setBorderStyle: UITextBorderStyleRoundedRect];
//    [password setSecureTextEntry: YES];
    [self.view addSubview: password];
}

- (void) initButton
{
    login = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [[login layer] setCornerRadius: 5.0];
    [login setBackgroundColor: [UIColor whiteColor]];
    [login setFrame: CGRectMake(0.0, 0.0, 0.3 * width, 0.05 * height)];
    [login setCenter: CGPointMake(0.5 * width, 0.6 * height)];
    [[login titleLabel] setTextAlignment: NSTextAlignmentCenter];
    [[login titleLabel] setFont: [UIFont fontWithName: @"Verdana" size: 15.0]];
    [login setTitle: @"Login" forState: UIControlStateNormal];
    [self.view addSubview: login];
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
