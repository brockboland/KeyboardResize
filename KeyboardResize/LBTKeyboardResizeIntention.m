//
//  LBTKeyboardResizeIntention.m
//  KeyboardResize
//
//  Created by Brock Boland on 4/24/14.
//  Copyright (c) 2014 Lullabot. All rights reserved.
//

#import "LBTKeyboardResizeIntention.h"

@implementation LBTKeyboardResizeIntention

-(id)init {
  self = [super init];
  if (self) {
    // Subscribe to the keyboard will show and hide notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillSwitch:)
                                                 name:UIKeyboardWillShowNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillSwitch:)
                                                 name:UIKeyboardWillHideNotification object:nil];
  }
  return self;
}


- (void)keyboardWillSwitch:(NSNotification *)notification {
  NSDictionary *info = [notification userInfo];
  NSValue *kbFrame = [info objectForKey:UIKeyboardFrameEndUserInfoKey];

  // Get the height of keyboard + inputAccessoryView, if there is one
  CGFloat keyboardHeight = CGRectGetHeight([kbFrame CGRectValue]);

  // Adjust the size of the constraint.
  if ([notification.name isEqualToString:UIKeyboardWillShowNotification]) {
    // Increase the constraint if the keyboard is showing
    self.bottomConstraint.constant += keyboardHeight;
  }
  else {
    // Descrease if it's hiding
    self.bottomConstraint.constant -= keyboardHeight;
  }

  // setNeedsUpdateConstraints and layoutIfNeeded need to be called on the
  // top-level view in the view controller. So: loop up the hierarchy until
  // there's no more views.
  UIView *parentView = self.bottomConstraint.firstItem;
  while (parentView.superview) {
    parentView = parentView.superview;
  }

  [parentView setNeedsUpdateConstraints];

  NSTimeInterval animationDuration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];

  // Animate the change to the constraint
  [UIView animateWithDuration:animationDuration animations:^{
    [parentView layoutIfNeeded];
  }];
}


@end
