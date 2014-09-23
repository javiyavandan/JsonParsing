//
//  HomeViewController.m
//  JsonParsing
//
//  Created by WeTheDevelopers on 29/07/14.
//  Copyright (c) 2014 WeTheDevelopers. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self SendPostrequesttofetchdata];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) SendPostrequesttofetchdata {
    ApiRequest *apirequest = [[ApiRequest alloc]init];
    apirequest.apiRequestDelegate = self;
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                                        @"Test", @"Email",
                                         nil];
    NSMutableDictionary *dataTopost = [dict mutableCopy];

    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dataTopost options:0 error:nil];
    NSString* jsonString = [[NSString alloc] initWithBytes:[jsonData bytes] length:[jsonData length] encoding:NSUTF8StringEncoding];

    [apirequest sendPostRequestwithurl:@"" postData:jsonString];
    
}

- (void) SendGetrequesttofetchdata {
    ApiRequest *apirequest = [[ApiRequest alloc]init];
    apirequest.apiRequestDelegate = self;
    NSString *urlString = @"www.google.com";
    [apirequest sendGetRequestwithurl:urlString];
}


-(void)apiRequestCompletedWithError:(NSString *)errorString {
    
}

-(void)apiRequestCompletedWithData:(NSMutableData *)responseData {
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
