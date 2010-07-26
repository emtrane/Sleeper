//
//  SleeperClass.m
//  Sleeper
//
//  Created by Martin Davidsson on 9/19/05.
//  Copyright 2005 __MyCompanyName__. All rights reserved.
//

#import "SleeperClass.h"


@implementation SleeperClass

- (id) initWithWebView:(WebView*) w {
	self = [super init];
	return self;
}

+ (NSString*) webScriptNameForSelector:(SEL)aSel {
	NSString *retval = nil;
	
	if (aSel == @selector(sleepIn)) {
		retval = @"sleepIn";
	} else {
		NSLog(@"\tunknown selector");
	}
	
	return retval;
}

+ (BOOL) isSelectorExcludedFromWebScript:(SEL)aSel {	
	if (aSel == @selector(sleepIn)) {
		return NO;
	}
	return YES;
}



- (void) windowScriptObjectAvailable:(WebScriptObject *) windowScriptObject 
{
    [windowScriptObject setValue:self forKey:@"Sleeper"];
}





- (void) sendAppleEventToSystemProcess:(AEEventID) eventToSend
{
   AEAddressDesc targetDesc;
    static const ProcessSerialNumber
         kPSNOfSystemProcess = { 0, kSystemProcess };
    AppleEvent eventReply = {typeNull, NULL};
    AppleEvent appleEventToSend = {typeNull, NULL};

    OSStatus error = noErr;

    error = AECreateDesc(typeProcessSerialNumber,
        &kPSNOfSystemProcess, sizeof(kPSNOfSystemProcess),
        &targetDesc);

    if (error != noErr)
    {
        return;
    }

    error = AECreateAppleEvent(kCoreEventClass, eventToSend,
                     &targetDesc, kAutoGenerateReturnID,
                     kAnyTransactionID, &appleEventToSend);

    AEDisposeDesc(&targetDesc);

    if (error != noErr)
    {
        return;
    }

    error = AESendMessage(&appleEventToSend, &eventReply, kAENoReply | kAENeverInteract, kAEDefaultTimeout);

    AEDisposeDesc(&appleEventToSend);

    if (error != noErr)
    {
        return;
    }

    AEDisposeDesc(&eventReply);

    return;
}

- (BOOL) sleepIn {
	[self sendAppleEventToSystemProcess:kAESleep];
	return YES;
}

@end
