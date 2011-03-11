//
//  CHUnit.h
//  ChaiCraft
//
//  Created by Ben Scheirman on 2/24/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CHUnit : NSObject {
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *description;
@property (nonatomic) BOOL canAttackGround;
@property (nonatomic) BOOL canAttackAir;
@property (nonatomic) BOOL stealthed;
@property (nonatomic) BOOL detector;

@end
