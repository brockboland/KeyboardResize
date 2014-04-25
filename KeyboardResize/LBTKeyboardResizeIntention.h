//
//  LBTKeyboardResizeIntention.h
//  KeyboardResize
//
//  Created by Brock Boland on 4/24/14.
//  Copyright (c) 2014 Lullabot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBTKeyboardResizeIntention : NSObject

/// Constraint to adjust
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@end
