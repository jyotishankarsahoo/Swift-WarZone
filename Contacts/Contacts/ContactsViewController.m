//
//  ViewController.m
//  Contacts
//
//  Created by jyotishankar sahoo on 27/07/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

#import "ContactsViewController.h"

@interface ContactsViewController ()

@property (nonatomic,strong) NSMutableArray *contactList;

@end

@implementation ContactsViewController

#pragma mark - Initialiser

-(id)initWithCoder:(NSCoder *)aDecoder{
   self =  [super initWithCoder:aDecoder];
    if (self) {
        Contact *c1 = [[Contact alloc] initWithFirstName:@"John" lastName:@"Cena"];
        Contact *c2 = [[Contact alloc] initWithFirstName:@"Randy" lastName:@"Orten"];
        Contact *c3 = [[Contact alloc] initWithFirstName:@"Seth" lastName:@"Rolens"];
        self.contactList = [[NSMutableArray alloc] initWithArray:@[c1 ,c2,c3]] ;
    }
    return self;
}

#pragma mark  - View Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Tableview datasource delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.contactList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [self.contactList[indexPath.row] fullName];
    return cell;
}

#pragma mark - Tableview  delegate
// Silver Challenge
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ExistingContactViewController *existingController = [self.storyboard instantiateViewControllerWithIdentifier:@"existingContactViewControllerIdentifier"];
    existingController.firstName = [self.contactList[indexPath.row] firstName];
    existingController.lastName = [self.contactList[indexPath.row] lastName];
    existingController.delegate = self;
    [self.navigationController pushViewController:existingController animated:YES];
}

#pragma mark - Segue action

-(IBAction)cancelToContactsViewController :(UIStoryboardSegue *) segue{
    // Nothing to do here
}

-(IBAction)addContactToContactsViewController:(UIStoryboardSegue *)segue{
    NewContactViewController *contactViewController = segue.sourceViewController;
    Contact *newContact = [[Contact alloc] initWithFirstName:contactViewController.firstNameTextField.text lastName:contactViewController.lastNameTextField.text];
    [self.contactList addObject:newContact];
    [self.tableView reloadData];
    
}

#pragma mark - Edit Contact  delegate
-(void)populateContactInfo:(NSString *)firstName lastName:(NSString *)lastName{
    NSInteger index = [self.tableView indexPathForSelectedRow].row;
    [self.contactList[index] setFirstName:firstName];
    [self.contactList[index] setLastName:lastName];
    [self.tableView reloadData];

}

@end
