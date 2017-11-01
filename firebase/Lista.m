//
//  Lista.m
//  firebase
//
//  Created by Silvestre Garcia on 10/28/17.
//  Copyright © 2017 silver. All rights reserved.
//

#import "Lista.h"
#import "cellMainTable.h"
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
                                 @"name":@"1"
                                 }];
    [self.characters addObject:@{
                                 @"name":@"2"
                                 }];
    [self.characters addObject:@{
                                 @"name":@"3"
                                 }];
    [self.characters addObject:@{
                                 @"name":@"4"
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
    return 64;
}
//-------------------------------------------------------------------------------

//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *seleccionDictionary = self.characters[indexPath.row];
    
    
    [self performSegueWithIdentifier:@"toDetail" sender:seleccionDictionary	];
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
        //DetailPersonViewController *navigationController = [segue destinationViewController];
        //navigationController.personInfo = sender;
    }}


@end
