//
//  ViewController.h
//  PointerApp
//
//  Created by Kevin Lou on 6/5/16.
//  Copyright (c) 2016 Kevin Lou & friends. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    NSTimer *myTimer;
    NSInteger index;
    NSRange highLightAt;
    NSString *current;
    NSMutableArray *storylist;
    NSArray *imagelist;
    NSMutableAttributedString *line;
    int page;
    int wordindex;
    bool ispaused;
    int count;
    int timercount;
}
@property(nonatomic) double speed;
@property(nonatomic) int storyindex;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *timelabel;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UIButton *done;

@property (weak, nonatomic) IBOutlet UIButton *play;
-(IBAction)playaction;

@property (weak, nonatomic) IBOutlet UIButton *next;
-(IBAction)nextaction;

@property (weak, nonatomic) IBOutlet UIButton *prev;
-(IBAction)prevaction;

@property (weak, nonatomic) IBOutlet UIButton *next2;
-(IBAction)next2action;

@property (weak, nonatomic) IBOutlet UIButton *prev2;
-(IBAction)prev2action;

@property (strong, nonatomic) IBOutlet UISlider *slider;
-(IBAction)controlspeed:(UISlider *) sender;

@end

