//
//  ORGMTrack.m
//  Origami
//
//  Created by ap4y on 8/18/12.
//
//

#import "ORGMTrack.h"

@implementation ORGMTrack
@dynamic track_num;
@dynamic title;
@dynamic track_album;
@dynamic track_artist;
@dynamic track_genre;

+ (void)fetchTracksWithOffset:(NSInteger)offset
                      success:(void (^)(NSArray *))success
                      failure:(void (^)(NSError *))failure {
    [self fetchEntitiesWithPath:@"tracks"
                         offset:offset
                        success:success
                        failure:failure];
}

@end