//
//  ChaiCraftAppDelegate.h
//  ChaiCraft
//
//  Created by Ben Scheirman on 2/24/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChaiCraftAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UIViewController *rootViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIViewController *rootViewController;

@end

