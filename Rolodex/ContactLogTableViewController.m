//
//  ContactLogTableViewController.m
//  Rolodex
//
//  Created by Jeff Hou on 1/9/15.
//  Copyright (c) 2015 A Moot Point. All rights reserved.
//

#import "ContactLogTableViewController.h"
#import "LogEntry.h"
#import "AddLogEntryViewController.h"
@interface ContactLogTableViewController ()

@property NSMutableArray *logEntries;

@end

@implementation ContactLogTableViewController

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    LogEntry *logEntry = [self.logEntries objectAtIndex:indexPath.row];
    cell.textLabel.text = logEntry.itemName;
    
    if (logEntry.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    //return self.logEntries.count;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.logEntries count];
}
- (void) loadInitialData {
    LogEntry *entry1 = [[LogEntry alloc] init];
    entry1.itemName = @"Monica's Friend. Cute like a princess.";
    [self.logEntries addObject:entry1];
    LogEntry *entry2 = [[LogEntry alloc] init];
    entry2.itemName = @"Her date Skip almost didn't show up.";
    [self.logEntries addObject:entry2];
}
- (IBAction)unwindToList:(UIStoryboardSegue *)segue{
    AddLogEntryViewController *source = [segue sourceViewController];
    LogEntry *item = source.logEntry;
    if (item != nil) {
        [self.logEntries addObject:item];
        [self.tableView reloadData];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.logEntries = [[NSMutableArray alloc] init];
    [self loadInitialData];
}
#pragma mark - Table view delegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    LogEntry *tappedEntry = [self.logEntries objectAtIndex:indexPath.row];
    tappedEntry.completed = !tappedEntry.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}
@end
