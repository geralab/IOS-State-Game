//
//  StateTable.m
//  State Game
//
//  Created by Gerald Blake on 10/11/13.
//  Copyright (c) 2013 Gerald Blake. All rights reserved.
//

#import "StateTable.h"
#import "State.h"


@interface StateTable ()
@property(strong,nonatomic) NSMutableArray* dataSource;
@property (strong,nonatomic) NSIndexPath *getPath;
@property (strong,nonatomic) NSArray *mySectionHeaders;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *theScore;

@property (nonatomic) int score;
@property(strong, nonatomic) NSMutableData *myData;
@property(strong, nonatomic) NSURLConnection *myConnection;
@property (nonatomic, strong) AVAudioPlayer *player;
@property(nonatomic,strong) NSURL *theSound;
@property (nonatomic,strong) NSError *err;
@property (nonatomic,strong) State* arbitraryStateReference;
@end

@implementation StateTable
int alphaState[26];
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)setupPlayer:(NSString *)str1 with:(NSString*) str2
{
    NSError *err;
    // Set up the URL of the sound file.
    self.theSound= [[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:str1 ofType:str2]];
    // Create the player, and initialize it with the sound file.
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:(self.theSound) error:&err];
    // Set the view contoller as the delegate.
    self.player.delegate = self;
}
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    // Make available for release the memory occupied
    // by the player and song.
    self.player = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   // NSIndexPath *thePath = [self.tableView indexPathForSelectedRow];
    //self.sg.webView.delegate = self;
   // State *theState = self.dataSource[thePath.section][thePath.row];
    
    self.arbitraryStateReference = nil;
    [self setupPlayer: @"Conga Groove 01" with:@"caf"];
    
    // Preload the audio file to reduce lag when the user
    // first presses 'play'.
    [self.player prepareToPlay];
    [self.player play];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
 
    alphaState[0] = 4;//A
    alphaState[1] = 3;//C
    alphaState[2] = 1;//D
    alphaState[3] = 1;//F
    alphaState[4] = 1;//G
    alphaState[5] = 1;//H
    alphaState[6] = 4;//I
    alphaState[7] = 2;//K
    alphaState[8] = 1;//L
    alphaState[9] = 8;//M
    alphaState[10] = 8;//N
    alphaState[11] = 3;//O
    alphaState[12] = 1;//P
    alphaState[13] = 1;//R
    alphaState[14] = 2;//S
    alphaState[15] = 2;//T
    alphaState[16] = 1;//U
    alphaState[17] = 2;//V
    alphaState[18] = 4;//W
    
  
    
    self.dataSource =[NSMutableArray arrayWithCapacity:26];
    for (int i = 0; i < 19; i++) {
        self.dataSource[i] = [NSMutableArray arrayWithCapacity:alphaState[i]];
        
    }
    
    int stateNumber = 0;
    for (int row = 0; row < 19; row++) {
        for (int col = 0; col < alphaState[row]; col++) {
        State *state = [[State alloc]init];
        [state initializeData];
            
        [state activateProperties:stateNumber];
        self.dataSource[row][col] = state;
            stateNumber++;
        }
    }
    self.mySectionHeaders = [NSArray arrayWithObjects:
                             @"A",
                             @"C",
                             @"D",
                             @"F",
                             @"G",
                             @"H",
                             @"I",
                             @"K",
                             @"L",
                             @"M",
                             @"N",
                             @"O",
                             @"P",
                             @"R",
                             @"S",
                             @"T",
                             @"U",
                             @"V",
                             @"W"
                            
                             
                             ,nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.dataSource[section] count];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"RESET"])
    {
        self.score = 0;
        int stateNumber = 0;
        for (int row = 0; row < 19; row++) {
            for (int col = 0; col < alphaState[row]; col++) {
                State *state = [[State alloc]init];
                [state initializeData];
                
                [state activateProperties:stateNumber];
                self.dataSource[row][col] = state;
                stateNumber++;
            }
        }
        self.theScore.title = @"Score: 0 / 50";

         [self.tableView reloadData];
        [self setupPlayer:@"PAPERCUT" with:@"WAV"];
        [self.player play];
    }else if([title isEqualToString:@"Change Back"])
    {
        [self setupPlayer:@"TIMBALE2" with:@"WAV"];
        [self.player play];
        self.score-=1;
        self.theScore.title = [NSString stringWithFormat:@"Score: %i / 50", self.score];
       [self.arbitraryStateReference changeColorState];
        [self.tableView reloadData];
    }
    else if([title isEqualToString:@"CANCEL"])
    {
        
    }
    
}

- (IBAction)resetGame:(UIBarButtonItem *)sender {
    
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Please Verify"
                                                      message:@"Would you like to RESET the game?"
                                                     delegate:self
                                            cancelButtonTitle:@"RESET"
                                            otherButtonTitles:@"CANCEL",nil];
    
    [message show];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    State *state = (State*)self.dataSource[indexPath.section][indexPath.row];
    
    

   
    
   
   

    
    if(state.colorState ==NO){
        [self setupPlayer:@"STATIC" with:@"WAV"];
        [self.player play];
        self.score+=1;
        [state changeColorState];
        
    }else if(state.colorState ==YES)
    {
        self.arbitraryStateReference = state;
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Please Verify"
       message:[NSString stringWithFormat:@"Would you like to RESET %@",state.stateName[state.stateNumber]]
            delegate:self
            cancelButtonTitle:@"Change Back"
                                             otherButtonTitles:@"Cancel",nil];
        
        [message show];
        
   
    }
    self.theScore.title = [NSString stringWithFormat:@"Score: %i / 50", self.score];

    if(self.score >=50){self.score = 50;}
   [tableView reloadData];
    
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:
(NSInteger)section{
  

    return self.mySectionHeaders[section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CellIdentifier = @"StateCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    State *state = ((State*)(self.dataSource[indexPath.section][indexPath.row]));
    
 
    cell.textLabel.text = (NSString*)state.activeStates[(indexPath.row < state.activeStates.count)?indexPath.row:state.activeStates.count-1];
    cell.detailTextLabel.text = (NSString*)state.activeNickNames[(indexPath.row < state.activeNickNames.count)?indexPath.row: state.activeNickNames.count-1];
    [cell setBackgroundColor:state.cellColor];
   

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *thePath = [self.tableView indexPathForCell:sender];
    
    
    ((SGViewController*)segue.destinationViewController).state = self.dataSource[thePath.section][thePath.row];
    State *state = ((State*)(self.dataSource[thePath.section][thePath.row]));
    [ ((SGViewController*)segue.destinationViewController) setTitle:(NSString*)state.activeStates[(thePath.row < state.activeStates.count)?thePath.row:state.activeStates.count-1]];
    
    
    
    self.hidesBottomBarWhenPushed =YES;
    
    
    
    
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/






// In a story board-based application, you will often want to do a little preparation before navigation


- (void)viewWillAppear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = NO;
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = NO;
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = NO;
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = NO;
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
