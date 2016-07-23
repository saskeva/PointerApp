//
//  ViewController.m
//  PointerApp
//
//  Created by Kevin Lou on 6/5/16.
//  Copyright (c) 2016 Kevin Lou & friends. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) viewDidLoad{
    [super viewDidLoad];
    index = 0;
    ispaused = true;
    timercount = 0;
    //_stepper = [[UIStepper alloc] init];
    _stepper.maximumValue = 20;
    _stepper.minimumValue = 1;
    _stepper.value = 10.0;
    [_timelabel setText:[NSString stringWithFormat:@"%0.2f secs", _stepper.value/10]];
    myTimer = [NSTimer scheduledTimerWithTimeInterval:(0.10) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    highLightAt = NSMakeRange(0,0);
    current = @"";
    story = [NSMutableArray arrayWithObjects:
             [NSArray arrayWithObjects:@"Little", @"Bo", @"Peep", @"has", @"lost", @"her", @"sheep,\n",
              @"And", @"can't", @"tell", @"where", @"to", @"find", @"them;\n",
              @"Leave", @"them", @"alone,", @"and", @"they'll", @"come", @"home,\n",
              @"And", @"bring", @"their", @"tails", @"behind", @"them.\n", nil],
             [NSArray arrayWithObjects:@"Little", @"Bo", @"Peep", @"fell", @"fast", @"asleep,\n",
              @"And", @"dreamt", @"she", @"heard", @"them", @"bleating;\n",
              @"But", @"when", @"she", @"awoke,", @"she", @"found", @"it", @"a", @"joke,\n",
              @"For", @"they", @"were", @"still", @"a-fleeting.\n", nil],
             [NSArray arrayWithObjects:@"Then,", @"up", @"she", @"took", @"her", @"little", @"crook,\n",
              @"Determined", @"for", @"to", @"find", @"them;\n",
              @"She", @"found", @"them", @"indeed,", @"but", @"it", @"made", @"her", @"heart", @"bleed,\n",
              @"For", @"they'd", @"left", @"all", @"their", @"tails", @"behind", @"them.\n", nil],
             nil];
    self.label.text = @"";
    images = [NSArray arrayWithObjects:@"bopeep1.jpg", @"bopeep2.jpg", @"bopeep3.jpg",nil];
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
        if(timercount < _stepper.value) {
            timercount = timercount + 1;
        }
        else{
            [self performSelector:@selector(nextWord)];
        }
    }
}
-(void) nextWord{
    if(wordindex >= [story[page] count]){
        wordindex = 0;
        page += 1;
        if(page >= [story count]){
            ispaused = true;
            //page = (int)[story count]-1;
            //[self.done setHidden:false];
            [self performSegueWithIdentifier:@"endstory" sender:self];
            return;
        }
        UIImage *myImage = [UIImage imageNamed: images[page]];
        [self.image setImage: myImage];
        highLightAt = NSMakeRange(0,0);
        line = [[NSMutableAttributedString alloc] initWithString:@""];
        for(int j = 0; j < [story[page] count]; j++){
            [line.mutableString appendString:story[page][j]];
            if ([story[page][j] rangeOfString:@"\n"].location == NSNotFound) {
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
    UIImage *myImage = [UIImage imageNamed: images[page]];
    [self.image setImage: myImage];
    line = [[NSMutableAttributedString alloc] initWithString:@""];
    for(int j = 0; j < [story[page] count]; j++){
        [line.mutableString appendString:story[page][j]];
        if ([story[page][j] rangeOfString:@"\n"].location == NSNotFound) {
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
    current = story[page][wordindex];
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
        [self.play setImage:pauseImg forState:UIControlStateNormal];
        
    }
    else{
        ispaused = true;
        UIImage * playImg = [UIImage imageNamed:@"play.png"];
        [self.play setImage:playImg forState:UIControlStateNormal];
        
    }
}
- (IBAction)nextaction{
    // Do any additional setup after loading the view, typically from a nib.
    [self performSelector:@selector(nextWord)];
}
- (IBAction)next2action{
    // Do any additional setup after loading the view, typically from a nib.
    if(page >= [story count]-1){
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
        for(int j = 0; j < [story[page] count]; j++){
            [line.mutableString appendString:story[page][j]];
            if ([story[page][j] rangeOfString:@"\n"].location == NSNotFound) {
                [line.mutableString appendString:@" "];
            }
        }
        index = 0;
    }
    else{
        current = story[page][wordindex+1];
        if([current rangeOfString:@"\n"].location == NSNotFound) {
            index -= current.length +1;
        }
        else {
            index -= current.length;
        }
        current = story[page][wordindex];
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
- (IBAction)controlspeed/*:(UIStepper *) sender*/{
    // Do any additional setup after loading the view, typically from a nib.
    [_timelabel setText:[NSString stringWithFormat:@"%0.2f secs", _stepper.value/10]];
}

-(IBAction)endstory{
    //[self performSegueWithIdentifier:@"EndStory" sender:self];
}

@end
