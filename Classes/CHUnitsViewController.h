//
//  UnitsViewController.h
//  ChaiCraft
//
//  Created by Ben Scheirman on 2/24/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CHUnitsViewController : UITableViewController {
    NSMutableDictionary *imageCache;
}

@property (nonatomic, retain) NSArray *units;
@property (nonatomic, retain) UIImage *raceSpriteSheet;

@end
