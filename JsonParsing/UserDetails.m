//
//  UserDetails.m
//  JsonParsing
//
//  Created by WeTheDevelopers on 30/07/14.
//  Copyright (c) 2014 WeTheDevelopers. All rights reserved.
//

#import "UserDetails.h"

@implementation UserDetails


+(UserDetails *) ParseUserInfoFromFbJsonData:(NSDictionary *)userDictionary {
    UserDetails *userInfo = [[UserDetails alloc] init];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM/dd/yyyy"];
    @try {
        
        if([userDictionary objectForKey:@"first_name"] != [NSNull null])
            userInfo.FirstName = (NSString *) [userDictionary objectForKey:@"first_name"];
        
        if([userDictionary objectForKey:@"last_name"] != [NSNull null])
            userInfo.LastName = (NSString *) [userDictionary objectForKey:@"last_name"];
        
        if([userDictionary objectForKey:@"last_name"] != [NSNull null])
            userInfo.userId = [(NSString *) [userDictionary objectForKey:@"last_name"] intValue];
        
    }
    @catch (NSException *exception) {
    }
    @finally {
        return userInfo;
    }
}

@end
