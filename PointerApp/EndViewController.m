//
//  MenuViewController.m
//  PointerApp
//
//  Created by Kevin Lou on 6/16/16.
//  Copyright (c) 2016 Kevin Lou & friends. All rights reserved.
//

#import "EndViewController.h"
#import "ViewController.h"
#import "TitleViewController.h"
#import "MenuViewController.h"

@interface EndViewController ()

@end

@implementation EndViewController

- (void) viewDidLoad{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"replay"]){
        TitleViewController *controller = (TitleViewController *)segue.destinationViewController;
        controller.speed = _speed;
    }
    else if([segue.identifier isEqualToString:@"return"]){
        MenuViewController *controller = (MenuViewController *)segue.destinationViewController;
        controller.speed = _speed;
    }
}
@end

