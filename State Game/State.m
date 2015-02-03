//
//  State.m
//  State Game
//
//  Created by Gerald Blake on 10/10/13.
//  Copyright (c) 2013 Gerald Blake. All rights reserved.
//

#import "State.h"

@implementation State
{
    enum STATES
    {
        Alabama,
        Alaska,
        Arizona,
        Arkansas,
        California,
        Colorado,
        Connecticut,
        Delaware,
        Florida,
        Georgia,
        Hawaii,
        Idaho,
        Illinois,
        Indiana,
        Iowa,
        Kansas,
        Kentucky,
        Louisiana,
        Maine,
        Maryland,
        Massachusetts,
        Michigan,
        Minnesota,
        Mississippi,
        Missouri,
        Montana,
        Nebraska,
        Nevada,
        NewHampshire,
        NewJersey,
        NewMexico,
        NewYork,
        NorthCarolina,
        NorthDakota,
        Ohio,
        Oklahoma,
        Oregon,
        Pennsylvania,
        RhodeIsland,
        SouthCarolina,
        SouthDakota,
        Tennessee,
        Texas,
        Utah,
        Vermont,
        Virginia,
        Washington,
        WestVirginia,
        Wisconsin,
        Wyoming
    }TheState;
    
}
-(void) changeColorState
{
    self.colorState = !self.colorState;
    if(self.colorState)
    {
        self.cellColor = [UIColor greenColor];
    }
    else
    {
        self.cellColor = [UIColor whiteColor];
    }
}
-(void) activateProperties :(int) number
{
    [self.activeStates addObject: self.stateName[number]];
    [self.activeLicenses addObject: self.licensePlate[number]];
    [self.activeNickNames addObject: self.nickName[number]];
    self.stateNumber = number;
}

-(void) initializeData{
    self.stateNumber=-1;
    self.activeStates = [[NSMutableArray alloc] init];
    self.activeLicenses = [[NSMutableArray alloc] init];
    self.activeNickNames = [[NSMutableArray alloc] init];
    self.colorState = NO;
    self.stateName = [NSMutableArray arrayWithObjects:
                      @"Alabama",
                      @"Alaska",
                      @"Arizona",
                      @"Arkansas",
                      @"California",
                      @"Colorado",
                      @"Connecticut",
                      @"Delaware",
                      @"Florida",
                      @"Georgia",
                      @"Hawaii",
                      @"Idaho",
                      @"Illinois",
                      @"Indiana",
                      @"Iowa",
                      @"Kansas",
                      @"Kentucky",
                      @"Louisiana",
                      @"Maine",
                      @"Maryland",
                      @"Massachusetts",
                      @"Michigan",
                      @"Minnesota",
                      @"Mississippi",
                      @"Missouri",
                      @"Montana",
                      @"Nebraska",
                      @"Nevada",
                      @"New Hampshire",
                      @"New Jersey",
                      @"New Mexico",
                      @"NewYork",
                      @"North Carolina",
                      @"North Dakota",
                      @"Ohio",
                      @"Oklahoma",
                      @"Oregon",
                      @"Pennsylvania",
                      @"Rhode Island",
                      @"South Carolina",
                      @"South Dakota",
                      @"Tennessee",
                      @"Texas",
                      @"Utah",
                      @"Vermont",
                      @"Virginia",
                      @"Washington",
                      @"West Virginia",
                      @"Wisconsin",
                      @"Wyoming"
                      ,nil];
    self.nickName = [NSMutableArray arrayWithObjects:
   
                @"The Yellowhammer State",
                @"The Last Frontier",
                @"The Grand Canyon State",
                @"The Natural State",
                @"The Golden State",
                @"The Centennial State",
                @"The Constitution State",
                @"The First State",
                @"The Sunshine State",
                @"The Peach State",
                @"The Aloha State",
                @"The Gem State",
                @"The Prairie State",
                @"The Hoosier State",
                @"The Hawkeye State",
                @"The Sunflower State",
                @"The Bluegrass State",
                @"The Pelican State",
                @"The Pine Tree State",
                @"The Old Line State",
                @"The Bay State",
                @"The Great Lakes State",
                @"The North Star State",
                @"The Magnolia State",
                @"The Show Me State",
                @"The Treasure State",
                @"The Cornhusker State",
                @"The Silver State",
                @"The Granite State",
                @"The Garden State",
                @"The Land of Enchantment",
                @"The Empire State",
                @"The Tar Heel State",
                @"The Peace Garden State",
                @"The Buckeye State",
                @"The Sooner State",
                @"The Beaver State",
                @"The Keystone State",
                @"The Ocean State",
                @"The Palmetto State",
                @"Mount Rushmore State",
                @"The Volunteer State",
                @"The Lone Star State",
                @"The Beehive State",
                @"The Green Mountain State",
                @"Old Dominion",
                @"The Evergreen State",
                @"The Mountain State",
                @"The Badger State",
                @"The Equality or Cowboy State",
                     nil];
    
    self.licensePlate = [NSMutableArray arrayWithObjects:
                         
        @"http://www.15q.net/us1/al09a.jpg",
        @"http://www.15q.net/us1/ak12.jpg",
        @"http://www.15q.net/us1/az09b.jpg",
        @"http://www.15q.net/us1/ar07.jpg",
        @"http://www.15q.net/us1/ca12.jpg",
        @"http://www.15q.net/us1/co01.jpg",
        @"http://www.15q.net/us1/ct02.jpg",
        @"http://www.15q.net/us1/de08.jpg",
        @"http://www.15q.net/us1/fl10.jpg",
        @"http://www.15q.net/us1/ga13.jpg",
        @"http://www.15q.net/us2/hi94.jpg",
        @"http://www.15q.net/us2/id09.jpg",
        @"http://www.15q.net/us2/il02a.jpg",
        @"http://www.15q.net/us2/in14.jpg",
        @"http://www.15q.net/us2/ia12.jpg",
        @"http://www.15q.net/us2/ks08.jpg",
        @"http://www.15q.net/us2/ky08.jpg",
        @"http://www.15q.net/us2/la13a.jpg",
        @"http://www.15q.net/us2/me00a.jpg",
        @"http://www.15q.net/us2/md12.jpg",
        @"http://www.15q.net/us3/ma03a.jpg",
        @"http://www.15q.net/us3/mi07a.jpg",
        @"http://www.15q.net/us3/mn10b.jpg",
        @"http://www.15q.net/us3/ms13.jpg",
        @"http://www.15q.net/us3/mo10.jpg",
        @"http://www.15q.net/us3/mt11.jpg",
        @"http://www.15q.net/us3/ne12.jpg",
        @"http://www.15q.net/us3/nv07.jpg",
        @"http://www.15q.net/us3/nh01.jpg",
        @"http://www.15q.net/us3/nj08.jpg",
        @"http://www.15q.net/us4/nm00a.jpg",
        @"http://www.15q.net/us4/ny10.jpg",
        @"http://www.15q.net/us4/nc10.jpg",
        @"http://www.15q.net/us4/nd93.jpg",
        @"http://www.15q.net/us4/oh13.jpg",
        @"http://www.15q.net/us4/ok10.jpg",
        @"http://www.15q.net/us4/or08.jpg",
        @"http://www.15q.net/us4/pa06.jpg",
        @"http://www.15q.net/us4/ri97.jpg",
        @"http://www.15q.net/us4/sc09.jpg",
        @"http://www.15q.net/us5/sd07.jpg",
        @"http://www.15q.net/us5/tn12.jpg",
        @"http://www.15q.net/us5/tx13.jpg",
        @"http://www.15q.net/us5/ut08.jpg",
        @"http://www.15q.net/us5/vt91.jpg",
        @"http://www.15q.net/us5/va09.jpg",
        @"http://www.15q.net/us5/wa11.jpg",
        @"http://www.15q.net/us5/wv07.jpg",
        @"http://www.15q.net/us5/wi01.jpg",
        @"http://www.15q.net/us5/wy10.jpg"
                         ,nil];
    self.cellColor = [UIColor whiteColor];
    


}

@end
