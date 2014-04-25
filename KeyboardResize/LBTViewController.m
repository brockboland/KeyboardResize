//
//  LBTViewController.m
//  KeyboardResize
//
//  Created by Brock Boland on 4/24/14.
//  Copyright (c) 2014 Lullabot. All rights reserved.
//

#import "LBTViewController.h"

@implementation LBTViewController

// On tapping the Done button on the keyboard, hide it
- (IBAction)doneEditing:(id)sender {
  UITextField *field = sender;
  [field resignFirstResponder];
}

@end
