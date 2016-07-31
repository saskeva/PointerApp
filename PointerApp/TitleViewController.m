//
//  TitleViewController.m
//  PointerApp
//
//  Created by Kevin Lou on 7/10/16.
//  Copyright (c) 2016 Kevin Lou & friends. All rights reserved.
//

#import "TitleViewController.h"
#import "ViewController.h"

@interface TitleViewController ()

@end

@implementation TitleViewController

- (void) viewDidLoad{
   
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"startstory"]){
        ViewController *controller = (ViewController *)segue.destinationViewController;
        controller.speed = _speed;
        controller.storyindex = _storyindex;
    }
}
@end
