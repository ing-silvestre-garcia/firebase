//
//  ViewController.m
//  firebase
//
//  Created by Silvestre Garcia on 10/28/17.
//  Copyright © 2017 silver. All rights reserved.
//

#import "Home.h"
@import Firebase;
@interface Home ()

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    [FIRAnalytics logEventWithName:@"pantalla_login"
                        parameters:@{
                                     @"name": @"login",
                                     @"full_text": @"accedieron a la pantalla de lgon"
                                     }];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLogin:(UIButton *)sender {
    [FIRAnalytics logEventWithName:@"boton_login"
                        parameters:@{
                                     @"name": @"login",
                                     @"full_text": @"accedieron a la pantalla de login"
                                     }];
    self performSegueWithIdentifier:<#(nonnull NSString *)#> sender:<#(nullable id)#>
}

@end
