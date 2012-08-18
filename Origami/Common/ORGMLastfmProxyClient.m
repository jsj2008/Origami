//
//  ORGMLastfmProxyClient.m
//  Origami
//
//  Created by ap4y on 8/18/12.
//
//

#import "ORGMLastfmProxyClient.h"

#import "AFJSONRequestOperation.h"
#import "AFNetworkActivityIndicatorManager.h"

@implementation ORGMLastfmProxyClient

+ (ORGMLastfmProxyClient*)sharedClient {
    static ORGMLastfmProxyClient* _sharedClient;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString:kTTLastfmProxyBaseURLString];
        _sharedClient = [[ORGMLastfmProxyClient alloc] initWithBaseURL:baseURL];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [self setStringEncoding:NSUTF8StringEncoding];
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

- (NSURL*)albumImageUrlForArtist:(NSString *)artist albumTitle:(NSString *)title {
    NSString *urlString = [NSString stringWithFormat:@"album_image/%@/%@/extralarge",
                           [artist stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],
                           [title stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    return [NSURL URLWithString:urlString relativeToURL:self.baseURL];
}

@end