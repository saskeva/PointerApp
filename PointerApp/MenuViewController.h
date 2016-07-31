//
//  MenuViewController.h
//  PointerApp
//
//  Created by Kevin Lou on 6/5/16.
//  Copyright (c) 2016 Kevin Lou & friends. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButtonWithValue.h"
#import "ViewController.h"

@interface MenuViewController : UIViewController{
}
@property(nonatomic) double speed;
@property(nonatomic) int storyindex;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIButtonWithValue *story0;
@property (weak, nonatomic) IBOutlet UIButtonWithValue *story1;

-(IBAction)start;
-(IBAction)storyPressed:(UIControl *)sender;

@end
