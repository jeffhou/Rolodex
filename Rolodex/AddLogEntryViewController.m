//
//  AddLogEntryViewController.m
//  Rolodex
//
//  Created by Jeff Hou on 1/9/15.
//  Copyright (c) 2015 A Moot Point. All rights reserved.
//

#import "AddLogEntryViewController.h"

@interface AddLogEntryViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation AddLogEntryViewController
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if (sender != self.saveButton) return;
    if (self.textField.text.length > 0) {
        self.logEntry = [[LogEntry alloc] init];
        self.logEntry.itemName = self.textField.text;
        self.logEntry.completed = NO;
    }
}
@end
