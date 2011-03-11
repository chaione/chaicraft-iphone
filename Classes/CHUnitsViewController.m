//
//  UnitsViewController.m
//  ChaiCraft
//
//  Created by Ben Scheirman on 2/24/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import "CHUnitsViewController.h"
#import "CHUnit.h"

@implementation CHUnitsViewController

@synthesize units, raceSpriteSheet;

#pragma mark -
#pragma mark Initialization

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    imageCache = [[NSMutableDictionary alloc] init];
    
    self.raceSpriteSheet = [UIImage imageNamed:@"units.gif"];
    self.tableView.separatorColor = [UIColor colorWithRed:0 green:0.09f blue:0.24f alpha:1.0f];
    self.tableView.backgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]] autorelease];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	self.tableView.dataSource = self;
}

- (void)clipSpriteForIndexPath:(NSIndexPath *)indexPath {
    if (![[self.tableView indexPathsForVisibleRows] containsObject:indexPath]) {
        return;
    }
    
    int rowIndex = indexPath.row % self.units.count;
    
    const int width = 54;
    const int height = 54;
       
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGImageRef spriteRef = CGImageCreateWithImageInRect([self.raceSpriteSheet CGImage], CGRectMake(rowIndex * width, 16, width, height));
    
    CGContextTranslateCTM(context, 0, height);
    CGContextScaleCTM(context, 1, -1);
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), spriteRef);
    CFRelease(spriteRef);
    
    UIImage *sprite = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CHUnit *unit = [self.units objectAtIndex:rowIndex];
    [imageCache setObject:sprite forKey:unit.name];
    
    if ([NSThread currentThread] != [NSThread mainThread]) {
        NSLog(@"DONT UPDATE THE UI DUMMY");
    }
     
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    
    [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
}
                                    

- (UIImage *)spriteForRowAtIndex:(NSIndexPath *)indexPath {
    CHUnit *unit = [[self units] objectAtIndex:indexPath.row % self.units.count];
    UIImage *sprite = [imageCache objectForKey:unit.name];
    if (sprite) {
        return sprite;
    }
    
    NSInvocationOperation *loadSpriteOperation = [[NSInvocationOperation alloc] initWithTarget:self
                                                                                      selector:@selector(clipSpriteForIndexPath:)
                                                                                        object:indexPath];
    [[NSOperationQueue mainQueue] setMaxConcurrentOperationCount:1];
    [[NSOperationQueue mainQueue] addOperation:loadSpriteOperation];
    
    return nil;
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.units.count * 4;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.contentView.backgroundColor = [UIColor colorWithRed:0 green:0.051f blue:0.125 alpha:0.5f];
//        cell.textLabel.backgroundColor = cell.contentView.backgroundColor;
//        cell.detailTextLabel.backgroundColor = cell.contentView.backgroundColor;
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.backgroundColor = [UIColor clearColor];
        cell.textLabel.opaque = NO;
        cell.opaque = NO;
    
    }
	
    int rowIndex = indexPath.row % self.units.count;
    CHUnit *selectedUnit = [self.units objectAtIndex:rowIndex];
    
    
    cell.imageView.image = [self spriteForRowAtIndex:indexPath];
    cell.textLabel.text = selectedUnit.name;
	
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    [imageCache release];
    imageCache = nil;
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    self.units = nil;
    self.raceSpriteSheet = nil;
    
    [imageCache release];
    [super dealloc];
}


@end

