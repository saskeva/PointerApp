//
//  StoryLib.h
//  PointerApp
//
//  Created by Kevin Lou on 8/7/16.
//  Copyright © 2016 Kevin Lou & friends. All rights reserved.
//

#import <foundation/Foundation.h>

@interface StoryLib : NSObject {
    NSMutableArray *storylist;
    NSMutableArray *imagelist;
    NSMutableArray *titleimagelist;
    NSMutableArray *titlelist;
}

@property (nonatomic, retain) NSMutableArray *storylist;
@property (nonatomic, retain) NSMutableArray *imagelist;
@property (nonatomic, retain) NSMutableArray *titleimagelist;
@property (nonatomic, retain) NSMutableArray *titlelist;


+ (id)sharedList;
-(NSMutableArray*)getStoryList;
-(NSMutableArray*)getImageList;
-(NSMutableArray*)getTitleImageList;
-(NSMutableArray*)getTitleList;

@end
