//
//  SGViewController.h
//  State Game
//
//  Created by Gerald Blake on 10/10/13.
//  Copyright (c) 2013 Gerald Blake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "State.h"
@interface SGViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic,strong) NSString *theUrl;
@property (nonatomic,strong) NSString *theName;
@property (nonatomic, strong) SGViewController *sg;
@property (nonatomic) State *state;
@end
