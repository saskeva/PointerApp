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

@interface MenuViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
}
@property(nonatomic) double speed;
@property(nonatomic) int storyindex;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet UITableView *storyTable;

-(IBAction)start;
-(IBAction)storyPressed:(UIControl *)sender;

@end
