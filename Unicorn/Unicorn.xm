#import <Photos/Photos.h>

static UIColor* successColor = [UIColor colorWithRed:0.13 green:0.55 blue:0.13 alpha:1.0];
static CGFloat initialConstant = 0;

@interface AWEButton : UIButton
@end

@interface AWEFeedVideoButton : AWEButton
@property(retain, nonatomic) UIImageView* aweImageView;
@property(retain, nonatomic) UIView* containerView;
@property(copy, nonatomic) void (^touchUpInsideBlock)(void);
+ (id)noTextButtonWithImageName:(NSString*)name shouldFit:(BOOL)shouldFit;
- (void)setImage:(UIImage*)image;
@end

@interface AWEMusicCoverButton : AWEButton
@end

@interface AWEURLModel : NSObject
@property(retain, nonatomic) NSArray* originURLList;
@end

@interface AWEVideoModel : NSObject
@property(readonly, nonatomic) AWEURLModel* playURL;
@property(readonly, nonatomic) AWEURLModel* downloadURL;
@end

@interface AWEAwemeModel : NSObject
@property(retain, nonatomic) AWEVideoModel* video;
@end

@interface AWEAdAvatarView : UIView
@end

@interface LOTAnimationView : UIView
@end

@interface AWEAwemePlayInteractionViewController : UIViewController
@property(retain, nonatomic) UIView *liveMarkView; // The pink circle indicating user is live
@property(retain, nonatomic) LOTAnimationView *followAnimationView; // The follow button on userAvatarView
@property(retain, nonatomic) AWEAdAvatarView *userAvatarView;
@property(retain, nonatomic) AWEFeedVideoButton *likeButton;
@property(retain, nonatomic) AWEFeedVideoButton *commentButton;
@property(nonatomic, retain) AWEFeedVideoButton *downloadButton; //NEW BUTTON
@property(retain, nonatomic) AWEFeedVideoButton *shareButton;
@property(retain, nonatomic) AWEMusicCoverButton *musicButton;
@property(retain, nonatomic) AWEAwemeModel *model;

//new
- (void)downloadButtonPressed;
- (void)saveMusicalToPhotos;
- (void)viewDidLoad;
- (void)handleLongPress:(UILongPressGestureRecognizer*)sender;
@end


//: LIVE Controllers
@interface AWELiveInteractViewController : UIViewController
@end

@interface AWELiveAudienceViewController : AWELiveInteractViewController
- (void)viewDidLoad;
- (void)handleLongPress:(UILongPressGestureRecognizer*)sender;
- (void)listSubviewsOfView:(UIView *)view;
@end


%hook AWEAwemePlayInteractionViewController
bool rightButtonsHidden = false;

- (void)viewDidLoad {
    %orig;
    NSLog(@"Welcome to the for you/following page");
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]
                                               initWithTarget:self
                                               action:@selector(handleLongPress:)];
    longPress.minimumPressDuration = 1.0;
    [self.view addGestureRecognizer:longPress];
}

%new
- (void)handleLongPress:(UILongPressGestureRecognizer*)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"Long press detected.");
        rightButtonsHidden = !rightButtonsHidden;
        if (rightButtonsHidden) {
            self.liveMarkView.hidden = YES;
            self.followAnimationView.hidden = YES;
            self.userAvatarView.hidden = YES;
            self.likeButton.hidden = YES;
            self.commentButton.hidden = YES;
            self.shareButton.hidden = YES;
            self.downloadButton.hidden = YES;
        } else {
            self.liveMarkView.hidden = NO;
            self.followAnimationView.hidden = NO;
            self.userAvatarView.hidden = NO;
            self.likeButton.hidden = NO;
            self.commentButton.hidden = NO;
            self.shareButton.hidden = NO;
            self.downloadButton.hidden = NO;
        }
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"Long press Ended");
    }
}


%property(nonatomic, retain) AWEFeedVideoButton *downloadButton;

- (instancetype)initWithMediaType:(NSInteger)type
{
    self = %orig;
    
    self.downloadButton = [%c(AWEFeedVideoButton) noTextButtonWithImageName:nil shouldFit:YES];
    self.downloadButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    __weak typeof(self) weakSelf = self;
    self.downloadButton.touchUpInsideBlock = ^()
    {
        [weakSelf downloadButtonPressed];
    };
    
    //The icoLoginArrowNor image is an arrow facing to the right, so we can just rotate it downwards and reuse it
    UIImage *downloadImage = [[[UIImage alloc] initWithCGImage:[UIImage imageNamed:@"icoLoginArrowNor@3x.png"].CGImage scale:1 orientation:UIImageOrientationRight] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    [self.downloadButton setImage: downloadImage];
    self.downloadButton.tintColor = [UIColor whiteColor];
    
    //Ensure that the image view always has the same size as the button
    NSDictionary* views = @{@"imageView" : self.downloadButton.aweImageView, @"containerView" : self.downloadButton.containerView};
    [self.downloadButton.containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[imageView]-0-|" options:0 metrics:nil views:views]];
    [self.downloadButton.containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[imageView]-0-|" options:0 metrics:nil views:views]];
    [self.downloadButton addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[containerView]-0-|" options:0 metrics:nil views:views]];
    [self.downloadButton addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[containerView]-0-|" options:0 metrics:nil views:views]];
    
    return self;
}

- (void)updateAllSubViews
{
    %orig;
    
    //Reset tint color
    self.downloadButton.tintColor = [UIColor whiteColor];
    
    NSLayoutConstraint* neededConstraint;
    
    //Find constraint to modify (space between muisc button and share button)
    for(NSLayoutConstraint* c in self.view.constraints)
    {
        if([c.firstItem isEqual:self.shareButton] && [c.secondItem isEqual:self.musicButton])
        {
            if(c.firstAttribute == NSLayoutAttributeBottom && c.secondAttribute == NSLayoutAttributeTop)
            {
                if(c.relation == NSLayoutRelationEqual)
                {
                    neededConstraint = c;
                    break;
                }
            }
        }
    }
    
    //The first time this method is ran we set the initial constant to compare against it later
    //I could also just check for -40 but I want to be future proof if that value changes
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken,
                  ^{
                      initialConstant = neededConstraint.constant;
                  });
    
    if(neededConstraint.constant == initialConstant)
    {
        //Modify constraint to make space for the new button
        neededConstraint.constant -= 53.333333;
        
        //Add download button to view
        [self.view addSubview:self.downloadButton];
        
        //Add constraints for download button
        NSDictionary* views = @{@"downloadButton" : self.downloadButton, @"shareButton" : self.shareButton};
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[shareButton]-10-[downloadButton(44)]" options:0 metrics:nil views:views]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[downloadButton(44)]-10.6666-|" options:0 metrics:nil views:views]];
    }
}

%new
- (void)downloadButtonPressed
{
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    switch(status)
    {
        case PHAuthorizationStatusNotDetermined:
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus authorizationStatus)
             {
                 //Save video if user grants permission
                 if(authorizationStatus == PHAuthorizationStatusAuthorized)
                 {
                     [self saveMusicalToPhotos];
                 }
             }];
            break;
            
        case PHAuthorizationStatusAuthorized:
            //Save musical
            [self saveMusicalToPhotos];
            break;
            
        case PHAuthorizationStatusDenied:
            UIAlertController* permissionAlert = [UIAlertController
                                                  alertControllerWithTitle:@"Error"
                                                  message:@"In order to save a video through Downloadally, TikTok needs permissions to photos!"
                                                  preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Close"
                                                                   style:UIAlertActionStyleCancel
                                                                 handler:nil];
            
            UIAlertAction* settingsAction = [UIAlertAction actionWithTitle:@"Settings"
                                                                     style:UIAlertActionStyleDefault
                                                                   handler:^(UIAlertAction* action)
                                             {
                                                 [[UIApplication sharedApplication]
                                                  openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                                             }];
            
            [permissionAlert addAction:cancelAction];
            [permissionAlert addAction:settingsAction];
            
            [self presentViewController:permissionAlert animated:YES completion:nil];
            
            break;
    }
}

%new
- (void)saveMusicalToPhotos
{
    //Get videoURL
    NSURL* videoURL = [NSURL URLWithString:self.model.video.playURL.originURLList.firstObject];
    
    //Get sharedSession
    NSURLSession* session = [NSURLSession sharedSession];
    
    //Create download task
    NSURLSessionDownloadTask* musicalDownloadTask =
    [session downloadTaskWithURL:videoURL
               completionHandler:^(NSURL* location, NSURLResponse* response, NSError* error)
     {
         //Get expected filename
         NSString* filename = [[videoURL lastPathComponent] stringByAppendingPathExtension:@"mp4"];
         
         //Rename file to filename
         [location setResourceValue:filename forKey:NSURLNameKey error:nil];
         
         //Update location with new filename
         location = [[location URLByDeletingLastPathComponent]
                     URLByAppendingPathComponent:filename];
         
         if(!error)
         {
             [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^
              {
                  //Save downloaded file to photos
                  [PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:location];
              }
                                               completionHandler:^(BOOL success, NSError* error)
              {
                  //Remove file
                  [[NSFileManager defaultManager] removeItemAtURL:location error:nil];
                  
                  if(success)
                  {
                      dispatch_async(dispatch_get_main_queue(),
                                     ^{
                                         //Update tint color to reflect that saving was successful
                                         self.downloadButton.tintColor = successColor;
                                         NSLog(@"DOWNLOAD WAS A SUCCESS!");
                                     });
                  }
              }];
         }
     }];
    
    //Start download
    [musicalDownloadTask resume];
}
%end



%hook AWELiveAudienceViewController
bool isLiveViewsHidden = false;
UIView *liveViews;
int viewCounter = 0;

%new
- (void)listSubviewsOfView:(UIView *)view {
    
    // Get the subviews of the view
    NSArray *subviews = [view subviews];
    
    // Return if there are no subviews
    if ([subviews count] == 0) return;
    
    viewCounter += 1;
    for (UIView *subview in subviews) {
        NSLog(@"Counter: %d, %@", viewCounter, subview);
        
        // 9 or 10.
        if (viewCounter == 10) {
            NSLog(@"CHANGING: %@", subview);
            liveViews = subview;
        }
        // List the subviews of subview
        [self listSubviewsOfView:subview];
    }
}

%new
- (void)handleLongPress:(UILongPressGestureRecognizer*)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"Long press detected.");
        isLiveViewsHidden = !isLiveViewsHidden;
        if (isLiveViewsHidden) {
            liveViews.hidden = YES;
        } else {
            liveViews.hidden = NO;
        }
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"Long press Ended");
    }
}

- (void)viewDidLoad {
    %orig;
    NSLog(@"You’ve entered the live chat.");
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]
                                               initWithTarget:self
                                               action:@selector(handleLongPress:)];
    longPress.minimumPressDuration = 1.0;
    [self.view addGestureRecognizer:longPress];
    
    [self listSubviewsOfView: self.view];
    viewCounter = 0;
}
%end
