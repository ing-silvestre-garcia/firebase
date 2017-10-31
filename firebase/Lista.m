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
                                 @"name":@"Zapato 1"
                                 }];
    [self.characters addObject:@{
                                 @"name":@"Zapato 2"
                                 }];
    [self.characters addObject:@{
                                 @"name":@"Zapato 3"
                                 }];
    [self.characters addObject:@{
                                 @"name":@"Zapato 4"
                                 }];
}

/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.characters.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellMainTable *cell = (cellMainTable *)[tableView dequeueReusableCellWithIdentifier:@"cellMainTable"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellMainTable" bundle:nil] forCellReuseIdentifier:@"cellMainTable"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellMainTable"];
    }
    //Fill cell with info from arrays
    NSDictionary *posicionDictionary = self.characters[indexPath.row];
    cell.userName.text       = posicionDictionary[@"name"];
    cell.userAge.text        = posicionDictionary[@"age"];
    cell.userImage.image      = posicionDictionary[@"image"];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *seleccionDictionary = self.characters[indexPath.row];
    
    [self performSegueWithIdentifier:@"toDetailPerson" sender:seleccionDictionary];
}
/**********************************************************************************************/
#pragma mark - Action methods
/**********************************************************************************************/
- (IBAction)btnAddPressed:(id)sender {
    /**
     [self.userNames addObject:@"Walter"];
     [self.userAges addObject:@"37 años"];
     [self.userImages addObject:@"jon.jpg"];
     [self.tblMain reloadData];
     */
    [self performSegueWithIdentifier:@"toNewPerson" sender:nil];
}

#pragma mark - NewPersonDelegate
- (void)didAddPersonName:(NSString *)name andImageSelected:(UIImage *)image addPersonAge:(NSString *)age {
    [self.characters addObject:@{
                                 @"name":name,
                                 }];
    [self.tablePrincipal reloadData];
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toDetailPerson"]) {
        DetailPersonViewController *navigationController = [segue destinationViewController];
        navigationController.personInfo = sender;
    }}


@end
