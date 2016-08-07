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


@interface ViewController ()

@end

@implementation ViewController

- (void) viewDidLoad{
    [super viewDidLoad];
    index = 0;
     NSLog(@"the value of storyindex is ... %d", _storyindex);
    ispaused = true;
    timercount = 0;
    _slider.minimumValue = 1.0;
    _slider.maximumValue = 20.0;
    _slider.value = 10.0;
    CGAffineTransform trans = CGAffineTransformMakeRotation(-M_PI_2);
    _slider.transform = trans;
    
    if(_speed < 1.0 || _speed > 20.0)
        _speed = 10;
    [_timelabel setText:[NSString stringWithFormat:@"%0.2f secs", _speed/10]];
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
    NSMutableArray *story1 = [NSMutableArray arrayWithObjects:
             [NSArray arrayWithObjects:@"When", @"good", @"king", @"Arthur", @"ruled", @"this", @"land,\n",
              @"He", @"was", @"a", @"goodly", @"king;\n",
              @"He", @"stole", @"three,", @"pecks", @"of", @"barley-meal,\n",
              @"To", @"make", @"a", @"bag-pudding.\n", nil],
             [NSArray arrayWithObjects:@"A", @"bag", @"pudding", @"the", @"king", @"did, "@"make,\n",
              @"And", @"stuffed", @"it", @"well", @"with", @"plums:\n",
              @"And", @"in", @"it", @"put,", @"great", @"lumps", @"of", @"fat,\n"
              @"As", @"big", @"as", @"my", @"two", @"thumbs.\n", nil],
             [NSArray arrayWithObjects:@"The,", @"king", @"and", @"queen", @"did", @"eat", @"thereof,\n",
              @"And", @"noblemen", @"beside;\n",
              @"And", @"what", @"they", @"could", @"not", @"eat", @"that", @"night,\n",
              @"The", @"queen", @"next", @"morning", @"fried.\n", nil],
             nil];
    NSMutableArray *story2 = [NSMutableArray arrayWithObjects:
             [NSArray arrayWithObjects:@"There", @"was", @"a", @"little", @"man,\n",
              @"And", @"he", @"had", @"a", @"little", @"gun,\n",
              @"And", @"his", @"bullets", @"were", @"made", @"of", @"lead,", @"lead,", @"lead;\n",
              @"He", @"went", @"to", @"the", @"brook\n",
              @"And", @"saw", @"a", @"little", @"duck\n",
              @"And", @"he", @"shot", @"it", @"right", @"through", @"the", @"head,", @"head,", @"head.\n", nil],
             [NSArray arrayWithObjects:@"He", @"carried", @"it", @"home,\n",
              @"To", @"his", @"old", @"wife", @"Joan,\n",
              @"And", @"bid", @"her", @"a", @"fire", @"to", @"make,", @"make,", @"make;\n",
              @"To", @"roast", @"the", @"little", @"duck\n",
              @"He", @"had", @"shot", @"in", @"the", @"brook\n",
              @"And", @"he'd", @"go", @"and", @"fetch", @"her", @"the", @"drake,", @"drake,", @"drake.\n", nil],
             nil];
    storylist = [NSMutableArray arrayWithObjects: story,story1,story2, nil];
    self.label.text = @"";
    
    images = [NSArray arrayWithObjects:@"bopeep1.jpg", @"bopeep2.jpg", @"bopeep3.jpg", nil];
    NSArray *images1 = [NSArray arrayWithObjects:@"kingarthur1.png", @"kingarthur1.png", @"kingarthur2.png", @"kingarthur2.png", nil];
    NSArray *images2 = [NSArray arrayWithObjects:@"littleman1.png", @"littleman2.png", nil];
    imagelist = [NSMutableArray arrayWithObjects: images, images1, images2, nil];
    
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

-(IBAction)controlspeed:(UISlider *) sender{
    _speed = _slider.value;
    [_timelabel setText:[NSString stringWithFormat:@"%0.2f secs", _slider.value/10]];
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
