//
//  ViewController.m
//  Contacts
//
//  Created by jyotishankar sahoo on 27/07/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

#import "ContactsViewController.h"
#import "Contacts-Swift.h"

@interface ContactsViewController ()

@property (nonatomic,strong) NSMutableArray *contactList;

@end

@implementation ContactsViewController

#pragma mark - Initialiser

-(id)initWithCoder:(NSCoder *)aDecoder{
   self =  [super initWithCoder:aDecoder];
    if (self) {
        Contact *c1 = [[Contact alloc] initWithContactName:@"John"];
        Contact *c2 = [[Contact alloc] initWithContactName:@"Ortan"];
        Contact *c3 = [[Contact alloc] initWithContactName:@"Romen"];
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
    cell.textLabel.text = [self.contactList[indexPath.row] name];
    return cell;
}

#pragma mark - Segue action

-(IBAction)cancelToContactsViewController :(UIStoryboardSegue *) segue{
    // Nothing to do here
}

-(IBAction)addContactToContactsViewController:(UIStoryboardSegue *)segue{
    NewContactViewController *contactViewController = segue.sourceViewController;
    NSString *contactInfo = [NSString stringWithFormat:@"%@ %@",contactViewController.firstNameTextField.text,contactViewController.lastNameTextField.text];
    Contact *newContact = [[Contact alloc] initWithContactName:contactInfo];
    [self.contactList addObject:newContact];
    [self.tableView reloadData];
    
}

@end
