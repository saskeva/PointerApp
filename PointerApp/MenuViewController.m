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
#import "StoryLib.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

NSArray *stories;

- (void) viewDidLoad{
    _storyindex = -1;
    [super viewDidLoad];
    //[NSThread sleepForTimeInterval:1.0];
    [super viewDidLoad];
    StoryLib *sharedList = [StoryLib sharedList];
    stories = [sharedList getTitleList];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapOnTableView:)];
    [_storyTable addGestureRecognizer:tap];
    
}

-(void) didTapOnTableView:(UIGestureRecognizer *) recognizer {
    CGPoint tapLocation = [recognizer locationInView:_storyTable];
    NSIndexPath *indexPath = [_storyTable indexPathForRowAtPoint:tapLocation];
    if (indexPath) {
        _storyindex = (int)indexPath.row;
        
    }
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [stories count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [stories objectAtIndex:indexPath.row];
    return cell;
}


@end






























