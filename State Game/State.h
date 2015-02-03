//
//  State.h
//  State Game
//
//  Created by Gerald Blake on 10/10/13.
//  Copyright (c) 2013 Gerald Blake. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface State : NSObject
@property(nonatomic,strong) NSMutableArray *stateName;
@property(nonatomic,strong) NSMutableArray *nickName;
@property (nonatomic,strong) NSMutableArray *licensePlate;

@property (nonatomic,strong) NSMutableArray *activeStates;
@property (nonatomic,strong) NSMutableArray *activeLicenses;
@property (nonatomic,strong) NSMutableArray *activeNickNames;
@property (nonatomic) UIColor *cellColor;
@property (nonatomic) BOOL colorState;
@property (nonatomic) int stateNumber;
-(void) initializeData;
-(void) changeColorState;

-(void) activateProperties :(int) number;
@end
