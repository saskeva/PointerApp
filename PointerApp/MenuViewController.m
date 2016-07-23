//
//  MenuViewController.m
//  PointerApp
//
//  Created by Kevin Lou on 6/16/16.
//  Copyright (c) 2016 Kevin Lou & friends. All rights reserved.
//

#import "MenuViewController.h"
#import "ViewController.h"
#import "TitleViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void) viewDidLoad{
    [super viewDidLoad];
    [NSThread sleepForTimeInterval:1.0];
}
- (IBAction)start{
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"bookchosen"]){
        TitleViewController *controller = (TitleViewController *)segue.destinationViewController;
        controller.speed = _speed;
    }
}
@end
