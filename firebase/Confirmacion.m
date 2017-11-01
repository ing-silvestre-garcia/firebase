//
//  Confirmacion.m
//  firebase
//
//  Created by Silvestre Garcia on 10/30/17.
//  Copyright © 2017 silver. All rights reserved.
//

#import "Confirmacion.h"
@import Firebase;
@interface Confirmacion ()

@end

@implementation Confirmacion

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnBack:(id)sender {
    [FIRAnalytics logEventWithName:@"boton_regresar"
                        parameters:@{
                                     @"name": @"confirmacion",
                                     @"full_text": @"regresan a lista de productos"
                                     }];
    [self performSegueWithIdentifier:@"toTable" sender:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
