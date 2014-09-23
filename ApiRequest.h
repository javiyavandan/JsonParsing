//
//  ApiRequest.h
//  JsonParsing
//
//  Created by WeTheDevelopers on 29/07/14.
//  Copyright (c) 2014 WeTheDevelopers. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ApiRequestDelegate <NSObject>

@optional
-(void) apiRequestCompletedWithData:(NSMutableData *)responseData;
-(void) apiRequestCompletedWithError:(NSString *)errorString;

@end

@interface ApiRequest : NSObject<NSURLConnectionDelegate>

@property (nonatomic,retain) NSMutableData *responseData;
@property (nonatomic,strong) id<ApiRequestDelegate> apiRequestDelegate;

-(void)sendPostRequestwithurl:(NSString *)url postData :(NSString *)jsonString;

-(void)sendGetRequestwithurl:(NSString *)urlstring;

@end
