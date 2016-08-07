//
//  StoryLib.m
//  PointerApp
//
//  Created by Kevin Lou on 8/7/16.
//  Copyright © 2016 Kevin Lou & friends. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StoryLib.h"

@implementation StoryLib

@synthesize storylist;
@synthesize imagelist;
@synthesize titleimagelist;
@synthesize titlelist;

#pragma mark Singleton Methods

+ (id)sharedList {
    static StoryLib *sharedStoryList = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStoryList = [[self alloc] init];
    });
    return sharedStoryList;
}
-(void)initTitleImages{
    titleimagelist = [NSMutableArray arrayWithObjects:@"bopeep",@"kingarthur",@"littleman", nil];
}
-(void)initTitleList{
    titlelist = [NSMutableArray arrayWithObjects:@"bopeep",@"kingarthur",@"littleman", nil];
}
-(void) initStories{
    NSMutableArray *bopeep = [NSMutableArray arrayWithObjects:
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
    NSMutableArray *kingarthur = [NSMutableArray arrayWithObjects:
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
    NSMutableArray *littleman = [NSMutableArray arrayWithObjects:
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
    
    storylist = [NSMutableArray arrayWithObjects: bopeep,kingarthur,littleman, nil];
}
-(void) initImages{
    NSArray *bopeep = [NSArray arrayWithObjects:@"bopeep1.jpg", @"bopeep2.jpg", @"bopeep3.jpg", nil];
    NSArray *kingarthur = [NSArray arrayWithObjects:@"kingarthur1.png", @"kingarthur1.png", @"kingarthur2.png", @"kingarthur2.png", nil];
    NSArray *littleman = [NSArray arrayWithObjects:@"littleman1.png", @"littleman2.png", nil];
    imagelist = [NSMutableArray arrayWithObjects:bopeep,kingarthur,littleman, nil];
}

- (id)init {
    if (self = [super init]) {
        [self initStories];
        [self initImages];
    }
    return self;
}
-(NSMutableArray*)getStoryList{
    return storylist;
}
-(NSMutableArray*)getImageList{
    return imagelist;
}
-(NSMutableArray*)getTitleImageList{
    return titleimagelist;
}
-(NSMutableArray*)getTitleList{
    return titlelist;
}
- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end
