//
//  ApiRequest.m
//  JsonParsing
//
//  Created by WeTheDevelopers on 29/07/14.
//  Copyright (c) 2014 WeTheDevelopers. All rights reserved.
//

#import "ApiRequest.h"

@implementation ApiRequest
{
    NSURLConnection *getRequestconnection;
    NSURLConnection *postRequestconnection;
}

@synthesize responseData;
@synthesize apiRequestDelegate;


-(void)sendPostRequestwithurl:(NSString *)url postData :(NSString *)jsonString {

    NSURL *urlString = [NSURL URLWithString:@"http://google.com"];
    // Create the request.
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urlString
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    
    NSData *requestData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
    //[request setHTTPBody: requestData];
    
    // Create url connection and fire request
    postRequestconnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [postRequestconnection start];
}

-(void)sendGetRequestwithurl:(NSString *)url {
    NSURL *urlString = [NSURL URLWithString:url];
    // Create the request.
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urlString
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    // Create url connection and fire request
    getRequestconnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [getRequestconnection start];
}

#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    if ([(NSHTTPURLResponse*)response statusCode] >= 200 &&
        [(NSHTTPURLResponse*)response statusCode] < 400)
    {
    }
    else if ([(NSHTTPURLResponse*)response statusCode] > 400)
    {
    }
    
    responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [responseData appendData:data];

}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    [apiRequestDelegate apiRequestCompletedWithData:responseData];

}

#pragma Failed With Error
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
    [apiRequestDelegate apiRequestCompletedWithError:[error valueForKey:@""]];
}


@end



