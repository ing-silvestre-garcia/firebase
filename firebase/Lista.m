//
//  Lista.m
//  firebase
//
//  Created by Silvestre Garcia on 10/28/17.
//  Copyright © 2017 silver. All rights reserved.
//

#import "Lista.h"
#import "Detalle.h"
@import Firebase;
@interface Lista ()

@property NSMutableArray *characters;
@property NSDictionary *charactersInfo;
@end

@implementation Lista

- (void)viewDidLoad {
    [super viewDidLoad];
    [FIRAnalytics logEventWithName:@"pantalla_lista"
                        parameters:@{
                                     @"name": @"lista",
                                     @"full_text": @"accedieron a la pantalla de lista"
                                     }];
    [self initController];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-------------------------------------------------------------------------------
- (void)initController {
    self.characters = [[NSMutableArray alloc] init];
    [self.characters addObject:@{
                                 @"name":@"Laptop Dell Inspiron 15 Serie 7000 Gaming 15 Pulgada",
                                 @"price": @"$24,749",
                                 @"image": [UIImage imageNamed:@"liverpool1"]
                                 }];
    [self.characters addObject:@{
                                 @"name":@"Smartwatch para caballero Fossil Q ",
                                 @"price": @"$4,649",
                                 @"image": [UIImage imageNamed:@"liverpool2"]
                                 }];
    [self.characters addObject:@{
                                 @"name":@"Jumpsuit liso BCBGeneration",
                                 @"price": @"$1,691",
                                 @"image": [UIImage imageNamed:@"liverpool3"]
                                 }];
    [self.characters addObject:@{
                                 @"name":@"Smartphone Huawei P10 Lite 3 GB RAM negro AT&T",
                                 @"price": @"$5,499",
                                 @"image": [UIImage imageNamed:@"liverpool4"]
                                 }];
    [self.characters addObject:@{
                                 @"name":@"Cafetera prima latte Oster roja",
                                 @"price": @"$4,249",
                                 @"image": [UIImage imageNamed:@"liverpool5"]
                                 }];
}

/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------

//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 108;
}
//-------------------------------------------------------------------------------

//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *seleccionDictionary = self.characters[indexPath.row];
    
    
    [self performSegueWithIdentifier:@"toDetail" sender:seleccionDictionary];
}
/**********************************************************************************************/
#pragma mark - Action methods
/**********************************************************************************************/

#pragma mark - unwindSegue

- (IBAction)unwindToConfirmPurchase:(UIStoryboardSegue *)segue {
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toDetail"]) {
        Detalle *detail = [segue destinationViewController];
        detail.productInfo = sender;
    }}


@end
