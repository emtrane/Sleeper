//
//  SleeperClass.h
//  Sleeper
//
//  Created by Martin Davidsson on 9/19/05.
//  Copyright 2005 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
#import <ApplicationServices/ApplicationServices.h> 

@interface SleeperClass : NSObject {

}

- (void) sendAppleEventToSystemProcess:(AEEventID)eventToSend;

@end
