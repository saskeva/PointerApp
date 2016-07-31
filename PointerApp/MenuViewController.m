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
    _storyindex = -1;
    [super viewDidLoad];
    //[NSThread sleepForTimeInterval:1.0];
}
- (IBAction)start{
    if(_storyindex != -1)
        [self performSegueWithIdentifier:@"bookchosen" sender:self];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)storyPressed:(UIControl *)sender{
    //if(_storyindex != -1)
    NSString *test = @"???";
    
    if ( [sender respondsToSelector:@selector(keyValue)] )
        test = [sender valueForKey:@"keyValue"];
    int temp = (int)[test integerValue];
    if(_storyindex == temp)
        _storyindex = -1;
    else
        _storyindex = temp;
    //NSLog(@"the value of keyValue is ... %@", test);
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
        controller.storyindex = _storyindex;
    }
}
@end

