//
//  ViewController.m
//  PointerApp
//
//  Created by Kevin Lou on 6/5/16.
//  Copyright (c) 2016 Kevin Lou & friends. All rights reserved.
//

#import "ViewController.h"
#import "EndViewController.h"
#import "MenuViewController.h"
#import "StoryLib.h"


@interface ViewController ()

@end

@implementation ViewController

- (void) viewDidLoad{
    [super viewDidLoad];
    index = 0;
    StoryLib *sharedList = [StoryLib sharedList];
     NSLog(@"the value of storyindex is ... %d", _storyindex);
    ispaused = true;
    timercount = 0;
    //_stepper = [[UIStepper alloc] init];
    if(_speed < 1.0 || _speed > 20.0)
        _speed = 10;
    [_timelabel setText:[NSString stringWithFormat:@"%0.2f secs", _speed/10]];
    myTimer = [NSTimer scheduledTimerWithTimeInterval:(0.10) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    highLightAt = NSMakeRange(0,0);
    current = @"";
    
    storylist = [sharedList getStoryList];
    self.label.text = @"";
    
    imagelist = [sharedList getImageList];
    
}
- (void)viewWillAppear:(BOOL)animated {
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void) viewDidAppear:(BOOL)animated{
    page = 0;
    wordindex = 0;
    [self performSelector:@selector(nextPage)];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) onTimer{
    
    //sentence += 1;
    if(ispaused){
        //do nothing
    }
    else{
        if(timercount < _speed) {
            timercount = timercount + 1;
        }
        else{
            [self performSelector:@selector(nextWord)];
        }
    }
}
-(void) nextWord{
    if(wordindex >= [storylist[_storyindex][page] count]){
        wordindex = 0;
        page += 1;
        if(page >= [storylist[_storyindex] count]){
            ispaused = true;
            //page = (int)[story count]-1;
            //[self.done setHidden:false];
            [self performSegueWithIdentifier:@"endstory" sender:self];
            return;
        }
        UIImage *myImage = [UIImage imageNamed: imagelist[_storyindex][page]];
        [self.image setImage: myImage];
        highLightAt = NSMakeRange(0,0);
        line = [[NSMutableAttributedString alloc] initWithString:@""];
        for(int j = 0; j < [storylist[_storyindex][page] count]; j++){
            [line.mutableString appendString:storylist[_storyindex][page][j]];
            if ([storylist[_storyindex][page][j] rangeOfString:@"\n"].location == NSNotFound) {
                [line.mutableString appendString:@" "];
            }
        }
        index = 0;
    }
    [self performSelector:@selector(highlight)];
    wordindex+= 1;
    timercount = 0;
}
-(void) nextPage{
    UIImage *myImage = [UIImage imageNamed: imagelist[_storyindex][page]];
    [self.image setImage: myImage];
    line = [[NSMutableAttributedString alloc] initWithString:@""];
    for(int j = 0; j < [storylist[_storyindex][page] count]; j++){
        [line.mutableString appendString:storylist[_storyindex][page][j]];
        if ([storylist[_storyindex][page][j] rangeOfString:@"\n"].location == NSNotFound) {
            [line.mutableString appendString:@" "];
        }
    }
    [self.label setTextColor:[UIColor grayColor]];
    self.label.attributedText = line;
    index = 0;
}
-(void) highlight{
    //UIFont *boldText = [UIFont boldSystemFontOfSize:30];
    NSNumber* underlineNumber = [NSNumber numberWithInteger:NSUnderlineStyleThick];
    current = storylist[_storyindex][page][wordindex];
    [line removeAttribute:NSForegroundColorAttributeName range:highLightAt];
    //[line removeAttribute:NSFontAttributeName range:highLightAt];
    [line removeAttribute:NSUnderlineStyleAttributeName range:highLightAt];
    [line removeAttribute:NSUnderlineColorAttributeName range:highLightAt];
    highLightAt = NSMakeRange(index,current.length);
    if([current rangeOfString:@"\n"].location == NSNotFound) {
        index += current.length+1;
    }
    else {
        index += current.length;
    }
    [line addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:highLightAt];
    //[line addAttribute:NSFontAttributeName value:boldText range:highLightAt];
    [line addAttribute:NSUnderlineStyleAttributeName value:underlineNumber range:highLightAt];
    [line addAttribute:NSUnderlineColorAttributeName value:[UIColor colorWithRed:141.0f/255.0f
                                                                                    green:202.0f/255.0f
                                                                                    blue:59.0f/255.0f
                                                                                    alpha:1] range:highLightAt];
    [self.label performSelector:@selector(setAttributedText:) withObject:line];
    //count+=1;
    
}

- (IBAction)playaction{
    // Do any additional setup after loading the view, typically from a nib.
    if(ispaused){
        ispaused = false;
        UIImage * pauseImg = [UIImage imageNamed:@"pause.png"];
        UIImage * pauseHighlighted = [UIImage imageNamed:@"pausehighlighted.png"];
        [self.play setImage:pauseImg forState:UIControlStateNormal];
        [self.play setImage:pauseHighlighted forState:UIControlStateHighlighted];
        
    }
    else{
        ispaused = true;
        UIImage * playImg = [UIImage imageNamed:@"play.png"];
        UIImage * playHighlighted = [UIImage imageNamed:@"playhighlighted.png"];
        [self.play setImage:playImg forState:UIControlStateNormal];
        [self.play setImage:playHighlighted forState:UIControlStateHighlighted];
    }
}
- (IBAction)nextaction{
    // Do any additional setup after loading the view, typically from a nib.
    [self performSelector:@selector(nextWord)];
}
- (IBAction)next2action{
    // Do any additional setup after loading the view, typically from a nib.
    if(page >= [storylist[_storyindex] count]-1){
        //page = (int)[story count]-1;
        return;
    }
    else{
        page = page + 1;
        wordindex = 0;
        [self performSelector:@selector(nextPage)];
        [self performSelector:@selector(nextWord)];
    }
}
- (IBAction)prevaction{
    // Do any additional setup after loading the view, typically from a nib.
    wordindex = wordindex - 2;
    if(wordindex < 0){
        page = page - 1;
        if(page < 0){
            page = 0;
            //fix this behavior
        }
        wordindex = 0;
        UIImage *myImage = [UIImage imageNamed: images[page]];
        [self.image setImage: myImage];
        highLightAt = NSMakeRange(0,0);
        line = [[NSMutableAttributedString alloc] initWithString:@""];
        for(int j = 0; j < [storylist[_storyindex][page] count]; j++){
            [line.mutableString appendString:storylist[_storyindex][page][j]];
            if ([storylist[_storyindex][page][j] rangeOfString:@"\n"].location == NSNotFound) {
                [line.mutableString appendString:@" "];
            }
        }
        index = 0;
    }
    else{
        current = storylist[_storyindex][page][wordindex+1];
        if([current rangeOfString:@"\n"].location == NSNotFound) {
            index -= current.length +1;
        }
        else {
            index -= current.length;
        }
        current = storylist[_storyindex][page][wordindex];
        if([current rangeOfString:@"\n"].location == NSNotFound) {
            index -= current.length+1;
        }
        else {
            index -= current.length;
        }
    }
    [self performSelector:@selector(nextWord)];
}
- (IBAction)prev2action{
    // Do any additional setup after loading the view, typically from a nib.
    page = page - 1;
    wordindex = 0;
    if(page < 0){
        page = 0;
        //fix this behavior
    }
    [self performSelector:@selector(nextPage)];
    [self performSelector:@selector(nextWord)];
}

-(IBAction)endstory{
    //[self performSegueWithIdentifier:@"EndStory" sender:self];
}

-(IBAction)speedup{
    if(_speed < 20){
        _speed = _speed + 1;
        [_timelabel setText:[NSString stringWithFormat:@"%0.2f secs", _speed/10]];
    }
}

-(IBAction)speeddown{
    if(_speed > 1){
        _speed = _speed - 1;
        [_timelabel setText:[NSString stringWithFormat:@"%0.2f secs", _speed/10]];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"endstory"]){
        EndViewController *controller = (EndViewController *)segue.destinationViewController;
        controller.speed = _speed;
        controller.storyindex = _storyindex;
    }
    else if([segue.identifier isEqualToString:@"quit"]){
        MenuViewController *controller = (MenuViewController *)segue.destinationViewController;
        controller.speed = _speed;
    }
}
@end
