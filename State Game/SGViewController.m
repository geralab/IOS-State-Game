//
//  SGViewController.m
//  State Game
//
//  Created by Gerald Blake on 10/10/13.
//  Copyright (c) 2013 Gerald Blake. All rights reserved.
//

#import "SGViewController.h"
#import "State.h"
@interface SGViewController ()

@end

@implementation SGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   
    
    NSString *fullURL = (NSString*)self.state.licensePlate[self.state.stateNumber];
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:requestObj];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
