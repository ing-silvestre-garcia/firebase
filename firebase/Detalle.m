//
//  Detalle.m
//  firebase
//
//  Created by Silvestre Garcia on 10/30/17.
//  Copyright © 2017 silver. All rights reserved.
//

#import "Detalle.h"
@import Firebase;
@interface Detalle ()
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UIImageView *img;

@end

@implementation Detalle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.productInfo != nil) {
        self.lblPrice.text = self.productInfo[@"price"];
        self.lblName.text = self.productInfo[@"name"];
        self.img.image = self.productInfo[@"image"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnConfirm:(id)sender {
    [FIRAnalytics logEventWithName:@"boton_confirmar"
                        parameters:@{
                                     @"name": @"detalle",
                                     @"full_text": @"confirmaron la compra"
                                     }];
    [self performSegueWithIdentifier:@"toConfirm" sender:nil];
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
