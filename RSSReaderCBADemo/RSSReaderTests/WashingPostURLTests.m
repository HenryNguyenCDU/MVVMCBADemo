//
//  WPURL.m
//  RSSReaderTests
//
//  Created by Thai Nguyen Quang on 11/23/21.
//  Copyright © 2021 mazaev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Helper.h"

@interface WashingPostURLTests : XCTestCase

@end

@implementation WashingPostURLTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}


- (void)testDataTaskWP
{
    Helper *helper = [Helper sharedInstance];
    NSURL *initialUrl_WP = [helper getWashPostUrl]; //url of Washington Post
    NSURL *initialUrl_DM = [helper getDailyMirrorUrl]; //url of Daily Mail
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:initialUrl_WP completionHandler:^(NSData *responseData, NSURLResponse *response, NSError *error) {
        XCTAssertNil(error, @"dataTaskWithURL error %@", error);

        if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
            NSInteger statusCode = [(NSHTTPURLResponse *) response statusCode];
            XCTAssertEqual(statusCode, 200, @"status code was not 200; was %ld", (long)statusCode);
        }

        XCTAssert(responseData, @"data nil");

        // do additional tests on the contents of the `data` object here, if you want
        
        NSError *json_error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&json_error];
        
        NSArray *data = [json valueForKey:@"items"];
        XCTAssert(data, @"items");
                         
        NSArray *dataArray = [json valueForKey:@"items"];
        XCTAssert(dataArray, @"data");
        for (int i =0; i<dataArray.count; i++) {
            NSDictionary *feed = dataArray[i];
            
            XCTAssert([feed valueForKey:@"description"], @"description"); // catch when description is nil
            XCTAssert([feed valueForKey:@"thumbnail"], @"image");
            
            // 3 value are used in application

        }

        // when all done, signal the semaphore

        dispatch_semaphore_signal(semaphore);
    }];
    
    [task resume];

    long rc = dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 60.0 * NSEC_PER_SEC));
    XCTAssertEqual(rc, 0, @"network request timed out");
}

- (void)testJSONModel{
    
    
    
}

@end
