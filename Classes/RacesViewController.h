//
//  RacesViewController.h
//  ChaiCraft
//
//  Created by Ben Scheirman on 2/24/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RacesViewController : UIViewController {
	UILabel *label;
	UISegmentedControl *segmentedControl;
}

@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentedControl;
@property (nonatomic, retain) IBOutlet UILabel *label;

- (IBAction)onSegmentChanged:(id)sender;
- (IBAction)onViewUnitsTapped;

@end
