//
//  Stories.m
//  PointerApp
//
//  Created by Kevin Lou on 7/31/16.
//  Copyright © 2016 Kevin Lou & friends. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Stories.h"
@interface Stories ()

@end

@implementation Stories
- (void) init {
    images = [NSArray arrayWithObjects:@"bopeep1.jpg", @"bopeep2.jpg", @"bopeep3.jpg",nil];
}
- (NSArray*) getImages:(int) index{
    return images;
}

@end
