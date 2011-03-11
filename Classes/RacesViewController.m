//
//  RacesViewController.m
//  ChaiCraft
//
//  Created by Ben Scheirman on 2/24/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import "RacesViewController.h"
#import "CHUnit.h"
#import "CHUnitsViewController.h"

#define TERRAN_INDEX 0
#define PROTOSS_INDEX 1
#define ZERG_INDEX 2

@implementation RacesViewController

@synthesize label, segmentedControl;

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		NSLog(@"initialized with coder");
	}
	return self;
}

- (void)updateRaceDescriptionForIndex:(NSInteger)index {
	switch (index) {
		case TERRAN_INDEX:
			self.label.text = @"The Terran are cheap, drug-induced marines that Scott likes to play.";
			break;
		case PROTOSS_INDEX:
			self.label.text = @"The race of the gods.";
			break;
		case ZERG_INDEX:
			self.label.text = @"Form the Swarm!!!!";
			break;
		default:
			NSLog(@"Unknown state!");
			break;
	}	
}

- (void)onRightButton:(id)sender {
	NSLog(@"asdf");
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] 
												initWithBarButtonSystemItem:UIBarButtonSystemItemReply 
												target:self
												action:@selector(onRightButton:)] autorelease];

	//most initialization happens here
	[self updateRaceDescriptionForIndex:TERRAN_INDEX];
}

- (IBAction)onSegmentChanged:(id)sender {
	NSLog(@"segment changed!  The new index is: %d", segmentedControl.selectedSegmentIndex);
	int newIndex = segmentedControl.selectedSegmentIndex;
	[self updateRaceDescriptionForIndex:newIndex];
}

- (IBAction)onViewUnitsTapped {
	NSMutableArray *units = [NSMutableArray array];
	
	for(NSString *name in [NSArray arrayWithObjects:@"Probe", @"Zealot", @"Stalker", @"Sentry", @"Immortal", @"Dark Templar", @"High Templar", @"Void Ray", @"Carrier", nil]) {
		CHUnit *unit = [[CHUnit alloc] init];
		unit.name = name;
		[units addObject:unit];
		[unit release];
	}
	
	CHUnitsViewController *vc = [[CHUnitsViewController alloc] initWithStyle:UITableViewStylePlain];
	vc.units = units;
	
	[self.navigationController pushViewController:vc animated:YES];
	
	[vc release];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
