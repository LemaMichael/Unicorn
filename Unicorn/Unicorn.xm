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

@interface MTLModel : NSObject
@end

@interface AWEBaseApiModel : MTLModel
@end

@interface AWEAwemeStatusModel : AWEBaseApiModel
@end

@interface AWEAwemeStatisticsModel : AWEBaseApiModel
@end


@interface AWEUserModel : AWEBaseApiModel
@property(nonatomic) long long downloadSetting;
@property(retain, nonatomic) NSString *birthday;
@property(retain, nonatomic) NSString *userID;
@property(retain, nonatomic) NSDate *createTime;
@end

@interface AWEAwemeModel : NSObject
@property(retain, nonatomic) AWEVideoModel* video;
@property(retain, nonatomic) AWEAwemeStatusModel *status;
@property(retain, nonatomic) NSNumber *accountScenario;
@property(retain, nonatomic) AWEAwemeStatisticsModel *statistics;
@property(retain, nonatomic) AWEUserModel *author;
@property(copy, nonatomic) NSString *descriptionString;
@property(nonatomic) _Bool isCanPlay;
@property(readonly, nonatomic) NSNumber *createTime;
- (_Bool)canBeReposted;
- (_Bool)videoCommentStauts;
@end

@interface AWEAwemePlayInteractionViewController : UIViewController
- (void)listSubviewsOfView:(UIView *)view;
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



// Download Profile Image
@interface YYAnimatedImageView : UIImageView
@end

@interface AWEProfileImagePreviewView : UIView
@property(retain, nonatomic) YYAnimatedImageView *avatar;
- (void)setupUI;
- (void)downloadImageButtonPressed:(UIButton*)button; //NEW
@end


// LIVE TextView: Display's the user's text
@interface AWETextViewInternal: UITextView
@property(retain, nonatomic) NSString *placeholder;
- (void)setText:(id)arg1;
@end


@interface AWEGrowingTextView : UIView <UITextViewDelegate>
@property(retain, nonatomic) AWETextViewInternal *internalTextView;
@end


@interface AWELiveCommentInputView: UIView
@property(retain, nonatomic) AWEGrowingTextView *textView;
@end

@interface AWELiveRoomModel
@property(nonatomic) long long coins;
@end

//: LIVE Controllers
@interface AWELiveInteractViewController : UIViewController
@property(retain, nonatomic) AWELiveCommentInputView *commentInputView;
@property(retain, nonatomic) AWELiveRoomModel *roomModel; // Room model

- (void)viewDidLoad;
- (void)newChatButtonTapped:(UIButton*)button; //NEW

@end

@interface AWELiveAudienceViewController : AWELiveInteractViewController
- (void)viewDidLoad;
- (void)handleLongPress:(UILongPressGestureRecognizer*)sender;
- (void)listSubviewsOfView:(UIView *)view;
@end


@interface AWELiveGiftListCollectionViewCell : UICollectionViewCell
@end



@interface AWELivePresentModel : AWEBaseApiModel
@property(nonatomic) long long coin; // @synthesize coin=_coin;
- (id)copyWithZone:(struct _NSZone *)arg1;
- (id)fakeIconName;
- (_Bool)isFakePresent;
- (_Bool)isVideoPresent;
- (_Bool)isAwemePresent;
- (_Bool)isResourcePresent;
@end

@protocol AWELiveSendGiftControllerDelegate <NSObject>
- (void)didRefreshFreeGiftAtCell:(AWELiveGiftListCollectionViewCell *)arg1;
- (void)didFinishSendPresentRequestWithTotalCoins:(long long)arg1;
- (void)didSendPresent:(AWELivePresentModel *)arg1;
@end


NSString *bdayText = @"Birthday...";
NSString *createdText = @"Created...";

%hook AWEAwemePlayInteractionViewController
bool isFollowingViewsHidden = false;

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
        isFollowingViewsHidden = !isFollowingViewsHidden;
        if (isFollowingViewsHidden) {
            self.view.alpha = 0.011;
        } else {
            self.view.alpha = 1.0;
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
                                                 UIApplication *application = [UIApplication sharedApplication];
                                                 [application openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]] options:@{} completionHandler:nil];

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
        //NSLog(@"Counter: %d, %@", viewCounter, subview);
        
        // 9 or 10.
        if (viewCounter == 10) {
            //NSLog(@"CHANGING: %@", subview);
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


%hook AWEProfileImagePreviewView
UIButton *downloadImageButton;
- (void)setupUI {
    %orig;
    downloadImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *downloadImage = [[[UIImage alloc] initWithCGImage:[UIImage imageNamed:@"icoLoginArrowNor@3x.png"].CGImage scale:1 orientation:UIImageOrientationRight] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [downloadImageButton setBackgroundImage:downloadImage forState:UIControlStateNormal];
    downloadImageButton.tintColor = [UIColor whiteColor];
    [downloadImageButton addTarget:self action:@selector(downloadImageButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    downloadImageButton.frame = CGRectMake(0, 114, 44, 44);
    [self addSubview: downloadImageButton];
}

%new
- (void)downloadImageButtonPressed:(UIButton*)button {
    
    UIImage *savedImage = self.avatar.image;
    
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        PHAssetChangeRequest *changeRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:savedImage];
        changeRequest.creationDate = [NSDate date];
    } completionHandler:^(BOOL success, NSError *error) {
        if (success) {
            NSLog(@"successfully saved");
        }
        else {
            NSLog(@"error saving to photos: %@", error);
        }
    }];
}
%end

//  Main text input view.
%hook AWELiveCommentInputView
%end


%hook AWEGrowingTextView
%end


%hook AWELiveInteractViewController
- (void)viewDidLoad {
    %orig;
    NSLog(@"AWELiveInteractViewController CALLED");
    
    /*
     AWELiveInteractViewController: AWELiveCommentInputView *_commentInputView
     AWELiveCommentInputView: AWEGrowingTextView *textView
     AWEGrowingTextView: AWETextViewInternal *internalTextView
     AWETextViewInternal: NSString *placeholder,
     
     // This is for testing. You can see the text can be set to over 50 characters.
     self.commentInputView.textView.internalTextView.placeholder = @"TEST 123";
     self.commentInputView.textView.internalTextView.text = @"123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100🐶";
     */
    
    // Adding New button
    UIButton *newChatButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *chatImage = [[UIImage imageNamed:@"ic_home_like_after.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [newChatButton setBackgroundImage:chatImage forState:UIControlStateNormal];
    [newChatButton addTarget:self action:@selector(newChatButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    newChatButton.frame = CGRectMake(0, 0, 25, 25);
    [self.commentInputView addSubview: newChatButton];
}

%new
- (void)newChatButtonTapped:(UIButton*)button {
    // When the heart button is tapped, bring up an alertController with a textfield.
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Type more than 50 Characters here" message:@"Tap Send after tapping Done" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.autocorrectionType = UITextAutocorrectionTypeYes;
        textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
        textField.placeholder = @"Say something epic...";
        
        // Check if the user has typed something in the internalTextView.
        if ( [self.commentInputView.textView.internalTextView.text length] != 0) {
            textField.text = self.commentInputView.textView.internalTextView.text;
        }
    }];
    
    UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //NSLog(@"Chat message is %@", [[alertController textFields][0] text]);
        self.commentInputView.textView.internalTextView.text = [[alertController textFields][0] text];
        
        // After the user taps Done, bring up the previous textView to send the message.
        [self.commentInputView.textView.internalTextView becomeFirstResponder];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //NSLog(@"Canelled");
    }];
    
    [alertController addAction: doneAction];
    [alertController addAction: cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

%end



@interface AWEAppLiveSettingManager : NSObject
+ (_Bool)disableNewPayment;
+ (id)newWalletConf;
+ (_Bool)showSkylightAnimation;
+ (_Bool)disableLiveCDNNodeSelection;
+ (_Bool)isLivePodcast;
+ (double)liveResH;
+ (double)liveResW;
+ (double)liveFps;
+ (double)liveMinBitrate;
+ (double)liveMaxBitrate;
+ (double)liveDefaultBitrate;
@end

%hook AWEAppLiveSettingManager
+ (_Bool)disableNewPayment {
    bool val = %orig;
    NSLog(@"[AWEAppLiveSettingManager disableNewPayment], returnValue: %d", val);
    return %orig;
}
// called when wallet cell is tapped from settings
+ (id)newWalletConf {
    id val = %orig;
    NSLog(@"[AWEAppLiveSettingManager newWalletConf], returnValue: %@", val);
    return %orig;
}
+ (_Bool)showSkylightAnimation {
    bool val = %orig;
    NSLog(@"[AWEAppLiveSettingManager showSkylightAnimation], returnValue: %d", val);
    return %orig;
}
+ (_Bool)disableLiveCDNNodeSelection {
    bool val = %orig;
    NSLog(@"[AWEAppLiveSettingManager disableLiveCDNNodeSelection], returnValue: %d", val);
    return %orig;
}

+ (_Bool)isLivePodcast {
    bool val = %orig;
    NSLog(@"[AWEAppLiveSettingManager isLivePodcast], returnValue: %d", val);
    return %orig;
}
+ (double)liveResH {
    double val = %orig;
    NSLog(@"[AWEAppLiveSettingManager liveResH], returnValue: %lf", val);
    return %orig;
}
+ (double)liveResW {
    double val = %orig;
    NSLog(@"[AWEAppLiveSettingManager liveResW], returnValue: %lf", val);
    return %orig;
}
+ (double)liveFps {
    double val = %orig;
    NSLog(@"[AWEAppLiveSettingManager liveFps], returnValue: %lf", val);
    return %orig;
}
+ (double)liveMinBitrate {
    double val = %orig;
    NSLog(@"[AWEAppLiveSettingManager liveMinBitrate], returnValue: %lf", val);
    return %orig;
}
+ (double)liveMaxBitrate {
    double val = %orig;
    NSLog(@"[AWEAppLiveSettingManager liveMaxBitrate], returnValue: %lf", val);
    return %orig;
}
+ (double)liveDefaultBitrate {
    double val = %orig;
    NSLog(@"[AWEAppLiveSettingManager liveDefaultBitrate], returnValue: %lf", val);
    return %orig;
}
%end



@interface AWELiveSetting : NSObject
+ (_Bool)shouldCheckCoins:(_Bool)arg1;
+ (void)setBarrageCoins:(long long)arg1;
+ (long long)barrageCoins;
+ (void)setUserAllCoins:(long long)arg1;
+ (long long)userAllCoins;
@end

%hook AWELiveSetting

// Called when any gift is tapped. Returns 0, or false.
+ (_Bool)shouldCheckCoins:(_Bool)arg1 {
    //NSLog(@"shouldCheckCoins, %d", arg1);
    return %orig;
}
+ (void)setBarrageCoins:(long long)arg1 {
    NSLog(@"setBarrageCoins, %lld", arg1);
    %orig;
}

+ (long long)barrageCoins {
    NSLog(@"barrageCoins");
    return %orig;
}
////// important Changing arg1 will show change your coint ammount in the bottom
// Called when app opens. Gets called when you enter a live room too, gets called when AWELiveGiftListViewController appears
+ (void)setUserAllCoins:(long long)arg1 {
    arg1 = 10000000;
    //[self setBarrageCoins: arg1];
    // NSLog(@"setUserAllCoins: %lld", arg1);
    //%orig (arg1);
    %orig;
}
// This actually does something and lets you tap an icon. The original returned val is 0.
+ (long long)userAllCoins {
    //long long val = %orig;
    // NSLog(@"userAllCoins: %lld", val);
    // long long modifiedVal = 10000000;
    // [self setBarrageCoins: modifiedVal];
    
    // return modifiedVal;
    return %orig;
}
%end



@interface AWELiveTrackEventManager : NSObject
+ (void)trackLiveClickPresent:(id)arg1 isAnchor:(_Bool)arg2 enterFrom:(id)arg3 presentID:(id)arg4 presentCoins:(id)arg5;
+ (void)trackLiveSendPresentSuccess:(id)arg1 isAnchor:(_Bool)arg2 enterFrom:(id)arg3 presentID:(id)arg4 presentCoins:(id)arg5;
@end

%hook AWELiveTrackEventManager

// This is called when a gift is tapped
+ (void)trackLiveClickPresent:(id)arg1 isAnchor:(_Bool)arg2 enterFrom:(id)arg3 presentID:(id)arg4 presentCoins:(id)arg5 {
    %orig;
    //NSLog(@"!!!!!!!!!!!!!!!!");
    //NSLog(@"arg1: %@, arg2: %d, arg3: %@, arg4: %@, arg5: %@", NSStringFromClass([arg1 class]), arg2, NSStringFromClass([arg3 class]), NSStringFromClass([arg4 class]), NSStringFromClass([arg5 class]));
    NSLog(@"trackLiveClickPresent");
    
}
+ (void)trackLiveSendPresentSuccess:(id)arg1 isAnchor:(_Bool)arg2 enterFrom:(id)arg3 presentID:(id)arg4 presentCoins:(id)arg5 {
    %orig;
    NSLog(@"trackLiveSendPresentSuccess!!");
}
%end

@interface AWELiveSendGiftPackage : NSObject
- (void)resetWithPresent:(id)arg1;
@property(copy, nonatomic) NSString *requestId;
@property(nonatomic) long long count;
@property(nonatomic) long long coins;
@property(nonatomic) long long pid;
@end

%hook AWELiveSendGiftPackage
// This is called after (void)_prepareClickTrackWithPreseent:(id)arg1
- (void)resetWithPresent:(id)arg1 {
    // arg1 is of type AWELivePresentModel
    // count: 0, coins: 0, pid: 0 this depends on the gift you're sending. so for a DQ, count: 1, coins: 5000, pid: 5232
    NSLog(@"resetWithPresent, arg1: %@", NSStringFromClass([arg1 class]));
    NSLog(@"count: %lld, coins: %lld, pid: %lld", self.count, self.coins, self.pid);
    NSLog(@"******");
    
    // Commenting this out ignnores the black notification
    %orig;
}
%end


@interface AWELiveGiftListDataController : NSObject
//@property(retain, nonatomic) AWELiveSendPresentResponseModel *sendPresentResponseModel; // @synthesize sendPresentResponseModel=_sendPresentResponseModel;
//@property(retain, nonatomic) AWELivePresentListResponseModel *giftListModel; // @synthesize giftListModel=_giftListModel;
- (void)sendPresent:(id)arg1 presentID:(id)arg2 count:(long long)arg3 completion:(id)arg4;
- (void)filterDisplayPresentList;
- (void)_getFreePresentListWithPresentList:(id)arg1 completion:(id)arg2;
- (void)getSandBoxGiftListModel:(id)arg1 completion:(id)arg2;
- (void)getGiftListModelWithCompletion:(id)arg1 roomID:(id)arg2;
- (void)getGiftListModelWithRoom:(id)arg1 completion:(id)arg2;
@end

%hook AWELiveGiftListDataController

// This gets called when any gift is tapped or after _performSendRequest()
- (void)sendPresent:(id)arg1 presentID:(id)arg2 count:(long long)arg3 completion:(id)arg4 {
    // arg1: __NSCFNumber, arg2: __NSCFNumber,
    // This is in control of the black notification that says "not enough coins" ignoring %orig will take care of that.
    NSLog(@"sendPresent.. arg1: %@, arg2: %@, arg3: %lld", arg1, arg2, arg3);
    //%orig;
    %orig(arg1, arg2, arg3, NULL);
    
}
- (void)filterDisplayPresentList {
    NSLog(@"filterDisplayPresentList");
    %orig;
}
//arg1 is of type AWELivePresentModel, arg2 is ?? Called when gift box is tapped
- (void)_getFreePresentListWithPresentList:(id)arg1 completion:(id)arg2 {
    //NSLog(@"_getFreePresentListWithPresentList.. arg1: %@, arg2: %@", arg1, arg2);
    %orig;
}
- (void)getSandBoxGiftListModel:(id)arg1 completion:(id)arg2 {
    NSLog(@"getSandBoxGiftListModel.. arg1: %@, arg2: %@", arg1, arg2);
    %orig;
}
// ? not sure. Called when gift box is tapped
- (void)getGiftListModelWithCompletion:(id)arg1 roomID:(id)arg2 {
    // NSLog(@"getGiftListModelWithCompletion.. arg1: %@, arg2: %@", arg1, arg2);
    %orig;
}
//arg1 is AWELiveRoomModel, where coins =0. arg2 is? Called when gift box is tapped
- (void)getGiftListModelWithRoom:(id)arg1 completion:(id)arg2 {
    //NSLog(@"getGiftListModelWithRoom.. arg1: %@, arg2: %@", arg1, arg2);
    %orig;
}
%end


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////?
// AWELiveSendGiftController
@interface AWELiveSendGiftController : NSObject
@property(nonatomic) _Bool isDuringSendCollecting;
@property(nonatomic) _Bool isDuringClickCollecting;
//@property(nonatomic) __weak id <AWELiveSendGiftControllerDelegate> delegate; // @synthesize delegate=_delegate;
@property(retain, nonatomic) AWELiveGiftListDataController *dataController;
@property(retain, nonatomic) AWELiveRoomModel *roomModel;
- (_Bool)isAnchor;
- (void)_performSendRequest;
- (void)_prepareSendRequestWithPresent:(id)arg1;
- (void)_performClickTrack;
- (void)_prepareClickTrackWithPreseent:(id)arg1;
- (void)willSendGiftInCollectionView:(id)arg1 atIndexPath:(id)arg2;
@end

%hook AWELiveSendGiftController

// This returns 0
- (_Bool)isAnchor {
    bool val = %orig;
    NSLog(@"isAnchor: %d", val);
    return %orig;
}
// Called after didSendPresent()
- (void)_performSendRequest {
    NSLog(@"_performSendRequest");
    %orig;
}
// CALLED after _performSendRequest()
- (void)_prepareSendRequestWithPresent:(id)arg1 {
    // arg1 is of type AWELivePresentModel
    
    NSLog(@"_prepareSendRequestWithPresent: arg1: %@", arg1);
    // NSLog(@"_prepareSendRequestWithPresent: dataType arg1: %@", NSStringFromClass([arg1 class]));
    %orig;
}
// Called after willSendGiftInCollectionView:(id)arg1 atIndexPath:(id)arg2
- (void)_performClickTrack {
    NSLog(@"_performClickTrack");
    %orig;
}

// CAlled after _performClickTrack
- (void)_prepareClickTrackWithPreseent:(id)arg1 {
    //arg1 is of type AWELivePresentModel.
    NSLog(@"_prepareClickTrackWithPreseent: arg1: %@", arg1);
    // NSLog(@"_prepareClickTrackWithPreseent: dataType arg1: %@", NSStringFromClass([arg1 class]));
    %orig;
}

// IMPORTANT
- (void)willSendGiftInCollectionView:(id)arg1 atIndexPath:(id)arg2 {
    //arg1 is of type UICollectionView, arg2 is of type NSIndexPath
    NSLog(@"willSendGiftInCollectionView: arg1: %@, arg2: %@", arg1, arg2);
    //NSLog(@"willSendGiftInCollectionView: dataType arg1: %@, dataType: arg2: %@", NSStringFromClass([arg1 class]), NSStringFromClass([arg2 class]));
    %orig;
}
%end

@interface AWELiveGiftListBottomLandscapeView : UIView
- (void)refreshWalletCoins:(long long)arg1;
@end

%hook AWELiveGiftListBottomLandscapeView
- (void)refreshWalletCoins:(long long)arg1 {
    long long val = arg1;
    NSLog(@"refreshWalletCoins, arg1: %lld", val);
    %orig;
}

%end

@interface AWELiveGiftFansEnterView : UIView
- (void)handleProcessWithIntimacy:(id)arg1 presentCoins:(long long)arg2 animationFinishBlock:(id)arg3;
@end

%hook AWELiveGiftFansEnterView
- (void)handleProcessWithIntimacy:(id)arg1 presentCoins:(long long)arg2 animationFinishBlock:(id)arg3 {
    NSLog(@"handleProcessWithIntimacy, arg1: %@, coins: %lld", arg1, arg2);
    NSLog(@"handleProcessWithIntimacy, arg1 Type: %@", NSStringFromClass([arg1 class]));
    
    %orig;
    
}

%end


@interface AWELiveFreePresentPropertyManager : NSObject
@property(nonatomic) long long coins; // @synthesize coins=_coins;
+ (id)sharedInstace;

- (void)_consumeFansFreePresentWithPresentId:(id)arg1 count:(long long)arg2;
- (void)setFansFreePresent:(id)arg1;
- (void)consumeFreePresentWithPresentId:(id)arg1 propertIDs:(id)arg2 count:(long long)arg3;
- (id)useFreePresentWithPresentId:(id)arg1 count:(long long)arg2;
- (long long)freeCountForPresentId:(id)arg1;
- (void)fetchFreePresentListWithCompletion:(id)arg1;
- (id)init;
@end

%hook AWELiveFreePresentPropertyManager
- (void)_consumeFansFreePresentWithPresentId:(id)arg1 count:(long long)arg2 {
    NSLog(@"_consumeFansFreePresentWithPresentId... coins: %lld", self.coins);
    %orig;
}
// Called when gift option shows up.
- (void)setFansFreePresent:(id)arg1 {
    //arg1 ??
    //NSLog(@"setFansFreePresent... arg1: %@, arg1Type: %@ coins: %lld", arg1, NSStringFromClass([arg1 class]), self.coins);
    %orig;
}
- (void)consumeFreePresentWithPresentId:(id)arg1 propertIDs:(id)arg2 count:(long long)arg3 {
    NSLog(@"consumeFreePresentWithPresentId... coins: %lld", self.coins);
    %orig;
}
// Called when gift tapped, count is 0.
- (id)useFreePresentWithPresentId:(id)arg1 count:(long long)arg2 {
    //id val = %orig;
    // NSLog(@"useFreePresentWithPresentId... coins: %lld", self.coins);
    // NSLog(@"useFreePresentWithPresentId, arg1: %@", val);
    return %orig;
}
// Gets called often, return val is 0. RETURNING 1 MAKES ALL GIFTS LABELED FREE.
- (long long)freeCountForPresentId:(id)arg1 {
    //long long val = %orig;
    //NSLog(@"freeCountForPresentId... coins: %lld, arg1: %@, returnval: %lld", self.coins, NSStringFromClass([arg1 class]), val) ;
    //return 1;
    return %orig;
}
- (void)fetchFreePresentListWithCompletion:(id)arg1 {
    NSLog(@"fetchFreePresentListWithCompletion... coins: %lld", self.coins);
    %orig;
}
// Called when button present tapped
- (id)init {
    NSLog(@"init... coins: %lld", self.coins);
    //self.coins = 100000;
    return %orig;
}
%end


// CONTROLLER GIFT
@interface AWELiveGiftListViewController : UIViewController
- (void)viewDidLoad;
- (void)refreshWalletCoins;
- (void)didFinishSendPresentRequestWithTotalCoins:(long long)arg1;
- (void)didSendPresent:(id)arg1;
- (void)collectionView:(id)arg1 didSelectItemAtIndexPath:(id)arg2;
- (id)collectionView:(id)arg1 cellForItemAtIndexPath:(id)arg2;
- (void)rechargeClicked:(id)arg1;
- (void)rechargeSuccessNotiAction;
- (void)_handleFansProcess:(id)arg1 presentCoins:(long long)arg2;

- (void)_fetchGiftListDataAndReloadUI:(_Bool)arg1;
@property(retain, nonatomic) AWELiveSendGiftController *sendGiftController; // hmm..!!
@property(retain, nonatomic) AWELiveGiftListDataController *dataController; 
@property(nonatomic, assign) id <AWELiveSendGiftControllerDelegate> delegate;
@end

// Controllers for sending gifts

%hook AWELiveGiftListViewController
- (void)viewDidLoad {
    %orig;
}
- (void)refreshWalletCoins {
    %orig;
    NSLog(@"refreshWalletCoins");
}
- (void)didFinishSendPresentRequestWithTotalCoins:(long long)arg1 {
    %orig;
    NSLog(@"didFinishSendPresentRequestWithTotalCoins: totalCoins%lld", arg1);
}
// Called after resetWithPresent()
- (void)didSendPresent:(id)arg1 {
    // arg1 is of type AWELivePresentModel
    %orig;
    NSLog(@"didSendPresent, %@",NSStringFromClass([arg1 class]));
}
// Called when cell for gifts are tapped
- (void)collectionView:(id)arg1 didSelectItemAtIndexPath:(id)arg2 {
    //%orig;
    NSLog(@"didSelectItem");
    
    //[self rechargeSuccessNotiAction];
    //long long totalCoins = 100000;
    // [self didSendPresent: NULL];
    //[self didFinishSendPresentRequestWithTotalCoins: totalCoins];
    //[self.sendGiftController _performSendRequest];
    //[self.sendGiftController _performClickTrack];
    // 1 [self.sendGiftController _prepareSendRequestWithPresent:arg1];
    //2 [self.sendGiftController _prepareClickTrackWithPreseent:arg1];
    
    /// THIS IS IMPORTANT:  This shows the animation.
    //%orig;
    [self.sendGiftController willSendGiftInCollectionView:arg1 atIndexPath:arg2]; //AWELiveSendGiftController
    
    // [self didFinishSendPresentRequestWithTotalCoins:100000];
}
- (void)_handleFansProcess:(id)arg1 presentCoins:(long long)arg2 {
    NSLog(@"_handleFansProcess...arg1: %@, presentCOins: %lld", arg1, arg2);
    %orig;
}

- (void)_fetchGiftListDataAndReloadUI:(_Bool)arg1 {
    // arg1 is false when entering live room, arg1 is true when the present button is tapped to display all gifts
    //NSLog(@"_fetchGiftListDataAndReloadUI...arg1: %d", arg1);
    %orig;
}


/*
 - (id)collectionView:(id)arg1 cellForItemAtIndexPath:(id)arg2 {
 
 NSLog(@"%@", NSStringFromClass([arg1 class]));
 NSLog(@"%@", NSStringFromClass([arg2 class]));
 return %orig;
 }*/

// Called when "Buy Coins" button is tapped.
- (void)rechargeClicked:(id)arg1 {
    %orig;
    NSLog(@"rechargeClicked");
}
- (void)rechargeSuccessNotiAction {
    %orig;
    NSLog(@"rechargeSuccessNotiAction");
}

%end


@interface AWELiveWalletManager : NSObject
+ (void)alertForNobalance:(id)arg1 triggerReason:(id)arg2;
+ (id)_getWalletWebURL:(_Bool)arg1;
+ (void)transitionToWalletPageFrom:(_Bool)arg1;
+ (void)getMyWalletWithFinishBlock:(id)arg1;

@end

// CAlled when wallet cell is tapped in settings
%hook AWELiveWalletManager
// Called when user has no coin balance!
+ (void)alertForNobalance:(id)arg1 triggerReason:(id)arg2 {
    NSLog(@"[AWELiveWalletManager alertForNobalance], arg1: %@, reason: %@", arg1, arg2);
    %orig;
}
+ (id)_getWalletWebURL:(_Bool)arg1 {
    //arg1 is true
    //id val = %orig;
    //NSLog(@"[AWELiveWalletManager _getWalletWebURL], arg1: %d, return val: %@", arg1, val);
    return %orig;
}
+ (void)transitionToWalletPageFrom:(_Bool)arg1 {
    // arg1 is true
    //NSLog(@"[AWELiveWalletManager transitionToWalletPageFrom], arg1: %d", arg1);
    %orig;
}

// This is called when entering live room and when tapping presents button
+ (void)getMyWalletWithFinishBlock:(id)arg1 {
    //NSLog(@"[AWELiveWalletManager getMyWalletWithFinishBlock], arg1: %@", arg1);
    %orig;
}
%end

@interface AWELiveFansClubMeResponseModel : AWEBaseApiModel
@end


@interface AWELiveMyWalletModel : AWEBaseApiModel {
    _Bool _canWithdraw;
    AWEUserModel *_user;
    long long _diamondCount;
    long long _totalIncome;
    long long _todayIncome;
    long long _withdrawLimit;
    long long _withdrawalDiamond;
}
+ (id)userJSONTransformer;
+ (id)JSONKeyPathsByPropertyKey;
@property(nonatomic) _Bool canWithdraw;
@property(nonatomic) long long withdrawalDiamond;
@property(nonatomic) long long withdrawLimit; // @synthesize withdrawLimit=_withdrawLimit;
@property(nonatomic) long long todayIncome; // @synthesize todayIncome=_todayIncome;
@property(nonatomic) long long totalIncome; // @synthesize totalIncome=_totalIncome;
@property(nonatomic) long long diamondCount; // @synthesize diamondCount=_diamondCount;
@property(retain, nonatomic) AWEUserModel *user; // @synthesize user=_user;
@end

%hook AWELiveMyWalletModel
// Both called when entering live room

+ (id)userJSONTransformer {
    
    //NSLog(@"userJSONTransformer.....userJSONTransformer");
    return %orig;
}
+ (id)JSONKeyPathsByPropertyKey {
    //NSLog(@"userJSONTransformer.....JSONKeyPathsByPropertyKey");
    return %orig;
}
%end

@interface AWEAppShareSettingManager : NSObject
+ (id)downloadForbiddenToast;
+ (_Bool)selfSeeingShouldForbidWaterMarkWhenDownload;
+ (_Bool)forbidDownloadLocal;
+ (_Bool)downloadCheckStatus;
@end

%hook AWEAppShareSettingManager
+ (id)downloadForbiddenToast {
    id val = %orig;
    NSLog(@"[AWEAppShareSettingManager] downloadForbiddenToast, returnval: %@", val);
    return %orig;
}
+ (_Bool)selfSeeingShouldForbidWaterMarkWhenDownload {
    bool val = %orig;
    NSLog(@"[AWEAppShareSettingManager] selfSeeingShouldForbidWaterMarkWhenDownload, returnval: %d", val);
    return %orig;
}
+ (_Bool)forbidDownloadLocal {
    bool val = %orig;
    NSLog(@"[AWEAppShareSettingManager] forbidDownloadLocal, returnval: %d", val);
    return %orig;
}
+ (_Bool)downloadCheckStatus {
    bool val = %orig;
    NSLog(@"[AWEAppShareSettingManager] downloadCheckStatus, returnval: %d", val);
    return %orig;
}
%end



/*
 _______  _______  _______  ______  __________________
 (  ____ \(  ____ )(  ____ \(  __  \ \__   __/\__   __/
 | (    \/| (    )|| (    \/| (  \  )   ) (      ) (
 | |      | (____)|| (__    | |   ) |   | |      | |
 | |      |     __)|  __)   | |   | |   | |      | |
 | |      | (\ (   | (      | |   ) |   | |      | |
 | (____/\| ) \ \__| (____/\| (__/  )___) (___   | |
 (_______/|/   \__/(_______/(______/ \_______/   )_(
 
  This allows you to download videos through the SHARE button, but the TIKTOK mark will be included
 */
@interface BTDShareBaseViewController : UIViewController
@end

@interface AWEAwemeShareViewController : BTDShareBaseViewController
- (void)viewDidLoad;
- (_Bool)p_unreviewedVideoToLink:(long long)arg1;
- (void)hideItemIfNeed:(id)arg1;
@property(nonatomic) long long hideOptions; // @synthesize hideOptions=_hideOptions;
@end

%hook AWEAwemeShareViewController
// Called when share button is tapped
- (void)viewDidLoad {
    // seems hideOptions = 524544 when download is enabled but is 525570 when disabled.
    //NSLog(@"[AWEAwemeShareViewController] viewDidLoad and options are :%lld", self.hideOptions);
    //self.hideOptions = 524544;
    %orig;
}

- (void)hideItemIfNeed:(id)arg1 {
    // This seems to be hiding all the options including the download button! arg1 is an Array
    //NSLog(@"[AWEAwemeShareViewController] hideItemIfNeed arg1: %@", arg1);
    //%orig;
}

// Called when download video button is tapped! returnValue is false
- (_Bool)p_unreviewedVideoToLink:(long long)arg1 {
    //bool val = %orig;
    //NSLog(@"[AWEAwemeShareViewController] p_unreviewedVideoToLink, arg1: %lld, returnval: %d", arg1, val);
    return %orig;
}
%end


/*
 Epic font.
 _______  _______  _______  _______  _______  _       _________ _______
 (  ____ \(  ___  )(       )(       )(  ____ \( (    /|\__   __/(  ____ \
 | (    \/| (   ) || () () || () () || (    \/|  \  ( |   ) (   | (    \/
 | |      | |   | || || || || || || || (__    |   \ | |   | |   | (_____
 | |      | |   | || |(_)| || |(_)| ||  __)   | (\ \) |   | |   (_____  )
 | |      | |   | || |   | || |   | || (      | | \   |   | |         ) |
 | (____/\| (___) || )   ( || )   ( || (____/\| )  \  |   | |   /\____) |
 (_______/(_______)|/     \||/     \|(_______/|/    )_)   )_(   \_______)
 
 
 */

@interface AWECommentModel : AWEBaseApiModel
@end

@interface AWECommentListViewController : UIViewController
- (void)sendCommentContent:(id)arg1 inputView:(id)arg2;
- (_Bool)userTappedSendWithContent:(id)arg1 inputView:(id)arg2;
- (_Bool)commentInputViewShouldReturn:(id)arg1;
- (void)didCommentSuccessWithCommentModel:(id)arg1 replyID:(id)arg2;
- (void)didCommentSuccessWithCommentModel:(id)arg1;
- (id)initWithAwemeModel:(id)arg1;
@end

%hook AWECommentListViewController

- (void)sendCommentContent:(id)arg1 inputView:(id)arg2 {
   // NSLog(@"sendCommentContent, arg1: %@, inputView: %@", arg1, arg2);
    %orig;
}

- (_Bool)userTappedSendWithContent:(id)arg1 inputView:(id)arg2 {
    //NSLog(@"userTappedSendWithContent, arg1: %@, view: %@, returnVal: %d", arg1, arg2, %orig);
    return %orig;
}
- (_Bool)commentInputViewShouldReturn:(id)arg1 {
    //NSLog(@"commentInputViewShouldReturn, arg1: %@, returnval: %d", arg1, %orig);
    return %orig;
}
- (void)didCommentSuccessWithCommentModel:(id)arg1 replyID:(id)arg2 {
//    NSLog(@"didCommentSuccessWithCommentModel,arg1: %@, replyID: %@", arg1, arg2);
    %orig;
}
- (void)didCommentSuccessWithCommentModel:(id)arg1 {
   // NSLog(@"didCommentSuccessWithCommentModel");
    %orig;
}

%end


/*
 
 
 _______  _______  _______  _______ _________ _        _______
 (  ____ )(  ____ )(  ___  )(  ____ \\__   __/( \      (  ____ \
 | (    )|| (    )|| (   ) || (    \/   ) (   | (      | (    \/
 | (____)|| (____)|| |   | || (__       | |   | |      | (__
 |  _____)|     __)| |   | ||  __)      | |   | |      |  __)
 | (      | (\ (   | |   | || (         | |   | |      | (
 | )      | ) \ \__| (___) || )      ___) (___| (____/\| (____/\
 |/       |/   \__/(_______)|/       \_______/(_______/(_______/
 
 Other User's Profile.
 */

@interface AWEListDataController : NSObject
@property(nonatomic) _Bool isCleanRefresh;
@property(nonatomic) unsigned long long feedColumnType;
@property(nonatomic) _Bool isRequestOnAir;
@property(nonatomic) _Bool loadmoreHasMore;
@property(nonatomic) _Bool refreshHasMore;
@property(retain, nonatomic) NSMutableArray *filteredDataSource;
@property(retain, nonatomic) NSMutableArray *dataSource;
@property(nonatomic) _Bool disableLoadMore;
@end




@interface AWEUserPostsDataManager : AWEListDataController
@property(copy, nonatomic) NSNumber *count;
@property(retain, nonatomic) NSMutableArray *localPosts;
@property(nonatomic) _Bool showDraft;
@property(nonatomic) long long pageSize;

@property(copy, nonatomic) NSNumber *maxCursor;
@property(copy, nonatomic) NSNumber *minCursor;
@property(copy, nonatomic) NSString *userID;
- (id)initWithUserID:(NSString *)arg1;


@end

%hook AWEUserPostsDataManager
- (id)initWithUserID:(NSString *)arg1 {
    // my userID 6596941496141316102
    // TEST userID 6647050259587039237
    // return %orig(@"6596941496141316102"); //This displays my videos in the list view for when tapping ANY user.
    return %orig;
}

%end


@interface AWEUserWorkCollectionViewCell : UICollectionViewCell
@property(nonatomic) _Bool isMine;
@property(retain, nonatomic) AWEAwemeModel *model;
@property(nonatomic) long long type;
@property(retain, nonatomic) UIImageView *privacyIconImageView;
@property(retain, nonatomic) UILabel *prohibitedContentLabel;

@property(retain, nonatomic) CAGradientLayer *maskLayer;
@property(retain, nonatomic) CALayer *prohibitedContentLayer;
@property(retain, nonatomic) UIImageView *mediaTypeView;
@property(retain, nonatomic) UIImageView *stateImageView;
@property(retain, nonatomic) UIImageView *imageView;
@property(retain, nonatomic) UIButton *numberBtn;


- (void)_setupUI;
- (void)configWithModel:(AWEAwemeModel *)arg1 isMine:(_Bool)arg2;
- (void)configWithModel:(AWEAwemeModel *)arg1;
- (void)configWithType:(long long)arg1;
- (id)initWithFrame:(struct CGRect)arg1;
@end

@interface AWEPostWorkViewController : UIViewController
@property(nonatomic) _Bool fromHome;
@property(nonatomic) _Bool isCurrentUser;

@property(retain, nonatomic) AWEUserPostsDataManager *dataManager;
@property(retain, nonatomic) AWEUserWorkCollectionViewCell *collectionView;
- (UICollectionViewCell *)collectionView:(UICollectionView *)arg1 cellForItemAtIndexPath:(NSIndexPath *)arg2;


- (id)aweui_emptyPageConfigForState:(unsigned long long)arg1;
- (struct CGSize)collectionView:(id)arg1 layout:(id)arg2 sizeForItemAtIndexPath:(id)arg3;
@end


%hook AWEPostWorkViewController
- (id)aweui_emptyPageConfigForState:(unsigned long long)arg1 {
    //NSLog(@"aweui_emptyPageConfigForState  arg1: %lld, returnVal: %@", arg1, %orig);
    //return NULL; this will return "No Content" screen but with an image
    return %orig;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)arg1 cellForItemAtIndexPath:(NSIndexPath *)arg2 {
    //NSLog(@"Section: %d, Row: %d, cellType: %@", arg2.section, arg2.row, %orig);
    // Lets get the cell!
    AWEUserWorkCollectionViewCell *myCell = (AWEUserWorkCollectionViewCell *)%orig;
    myCell.isMine = YES;
    myCell.model.author.downloadSetting = 0;
    bdayText = myCell.model.author.birthday;
    
    //date formatter.
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEEE, MMM d, yyyy"];
    createdText = [formatter stringFromDate: myCell.model.author.createTime];
    return myCell;
    
}

%end

@interface AWEUserDetailHeaderView : UIView
@end

//MAIN
@interface AWEUserDetailViewController : UIViewController


- (void)viewDidLoad;
- (id)init;
- (void)updateInfoLabel;
- (_Bool)_shouldHideTabNum;
- (_Bool)_shouldShowLikeTab;
- (void)privateAccountInfoViewController:(id)arg1 didScroll:(struct CGPoint)arg2;


@property(retain, nonatomic) AWEAwemeModel *model;
@property(retain, nonatomic) AWEUserModel *user;
@property(retain, nonatomic) AWEUserDetailHeaderView *headerView;
@property(retain, nonatomic) AWEPostWorkViewController *postVC;
@property(retain, nonatomic) AWELikeWorkViewController *likeVC;
// New
@property(nonatomic, retain) UILabel *bdayLabel;
@property(nonatomic, retain) UILabel *createdLabel;
@end


%hook AWEUserDetailViewController

%property(nonatomic, retain) UILabel *bdayLabel;
%property(nonatomic, retain) UILabel *createdLabel;

- (void)viewDidLoad {
    %orig;
    NSLog(@"AWEUserDetailViewController.. fromHome: %d, isCurrentUser: %d", self.postVC.fromHome, self.postVC.isCurrentUser);
    //self.postVC.collectionView.backgroundColor = [UIColor redColor];
    
    // This will display the bday of the user!
    self.bdayLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 70, 100, 50)];
    self.bdayLabel.numberOfLines = 0;
    self.bdayLabel.textColor = [UIColor blackColor];
    self.bdayLabel.text = @"Birthday...";
    [self.bdayLabel setFont:[UIFont fontWithName:@"Proxima Nova" size:14]];
    [self.headerView addSubview: self.bdayLabel];
    
    // This will display the date the user created their account
    self.createdLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 120, 100, 65)];
    self.createdLabel.numberOfLines = 0;
    self.createdLabel.textColor = [UIColor blackColor];
    self.createdLabel.text = @"Created...";
    [self.createdLabel setFont:[UIFont fontWithName:@"Proxima Nova" size:14]];
    [self.headerView addSubview: self.createdLabel];
    
    [self performSelector:@selector(updateInfoLabel) withObject:nil afterDelay:1.5];
}

%new
- (void)updateInfoLabel {
    self.bdayLabel.text = [@"Bday:\n" stringByAppendingString:bdayText];
    self.createdLabel.text = [@"Account Made:\n" stringByAppendingString: createdText];;
}


- (_Bool)_shouldHideTabNum{
    NSLog(@"_shouldHideTabNum..%d", %orig);
    return %orig;
}
- (_Bool)_shouldShowLikeTab {
    NSLog(@"_shouldShowLikeTab..%d", %orig);
    return %orig;
}

- (void)privateAccountInfoViewController:(id)arg1 didScroll:(struct CGPoint)arg2 {
    NSLog(@"privateAccountInfoViewController..%@", arg1);
    %orig;
}
%end



/*
 
 _______  _______  _        _        _______
 (  ____ \(  ____ \( \      ( \      (  ____ \
 | (    \/| (    \/| (      | (      | (    \/
 | |      | (__    | |      | |      | (_____
 | |      |  __)   | |      | |      (_____  )
 | |      | (      | |      | |            ) |
 | (____/\| (____/\| (____/\| (____/\/\____) |
 (_______/(_______/(_______/(_______/\_______)
 
 */

%hook AWEUserWorkCollectionViewCell
- (void)_setupUI {
   // NSLog(@"_setupUI.... ismine: %d, type: %lld", self.isMine, self.type);
    %orig;
}
- (void)configWithModel:(AWEAwemeModel *)arg1 isMine:(_Bool)arg2 {
   // NSLog(@"configWithModel, arg1: %@, isMine: %d", arg1, arg2);
  //  %orig(arg1, YES);
    %orig;
}
- (void)configWithModel:(AWEAwemeModel *)arg1 {
    //NSLog(@"configWithModel...arg1: %@", arg1);
    %orig;
    
    // Lets add the date and time the video was created on the description of each cell.
    NSDate *dateCreated = [NSDate dateWithTimeIntervalSince1970: [arg1.createTime doubleValue]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]  init];
    [formatter setDateFormat:@"MMM d, yyyy"];
    NSString *stringDate = [formatter stringFromDate:dateCreated];
    stringDate = [@"  " stringByAppendingString: stringDate];
    
    NSString *fullTitle = [self.numberBtn.titleLabel.text stringByAppendingString: stringDate];
    [self.numberBtn setTitle: fullTitle forState:UIControlStateNormal];
    
    [self.numberBtn.titleLabel setAdjustsFontSizeToFitWidth:YES];
}

%end



/*
 _________ ______   ______   _______  _                      _________ ______   _______  _______  _______
 |\     /|\__   __/(  __  \ (  __  \ (  ____ \( (    /|      |\     /|\__   __/(  __  \ (  ____ \(  ___  )(  ____ \
 | )   ( |   ) (   | (  \  )| (  \  )| (    \/|  \  ( |      | )   ( |   ) (   | (  \  )| (    \/| (   ) || (    \/
 | (___) |   | |   | |   ) || |   ) || (__    |   \ | |      | |   | |   | |   | |   ) || (__    | |   | || (_____
 |  ___  |   | |   | |   | || |   | ||  __)   | (\ \) |      ( (   ) )   | |   | |   | ||  __)   | |   | |(_____  )
 | (   ) |   | |   | |   ) || |   ) || (      | | \   |       \ \_/ /    | |   | |   ) || (      | |   | |      ) |
 | )   ( |___) (___| (__/  )| (__/  )| (____/\| )  \  |        \   /  ___) (___| (__/  )| (____/\| (___) |/\____) |
 |/     \|\_______/(______/ (______/ (_______/|/    )_)         \_/   \_______/(______/ (_______/(_______)\_______)
 
 // Display hidden videos shown in the list feed.
 NOTE: It appears TIKTOK deletes the hidden videos.
 */

@interface AWEAwemeDetailTableViewController : UIViewController
+ (id)detailTableViewControllerWithDataController:(id)arg1 initialIndex:(long long)arg2 referString:(id)arg3;
@property(retain, nonatomic) AWEListDataController *dataController;
@property(nonatomic) _Bool processingLogin;
@property(nonatomic) _Bool shouldEnablePushSourceTracker;
@property(nonatomic) _Bool needPreFetch;
@property(nonatomic) _Bool isAppearingOnAir;
@property(copy, nonatomic) NSDictionary *logExtraDict;
@property(readonly, copy) NSString *description;

- (void)viewDidLoad;

- (_Bool)isActive;
- (void)videoDownloadFinished;
- (void)deleteAwemeWithIDs:(id)arg1;


@property(copy, nonatomic) NSString *referString;
@property(nonatomic) long long initialIndex;
@property(copy, nonatomic) NSString *pushPassThrouthParam;
@property(copy, nonatomic) NSString *initialIDs;

@property(copy, nonatomic) NSString *cityInfoString;
@property(copy, nonatomic) NSString *originEntryEnterMethod;
@property(copy, nonatomic) id dataControllerChangedBlock;

- (void)playIfActive;

- (_Bool)awesst_isVideoPlayViewController;
- (id)awesst_additionalTrackerParams;
- (void)reloadDataForDataControllerChange;


- (void)_onAwemeDeleted:(id)arg1;
- (void)_onAwemeDeleteNotification:(id)arg1;

- (unsigned long long)_currentVisibleCellIndex;


- (void)videoVoteFinished;
- (void)setFeedColumntypeIfNeeded;
- (void)loadmore;
- (void)initialFetch;
- (void)initialFetchWithIDs:(id)arg1;
- (void)addLoadMoreIfNeeded;

- (void)preloadImageForAweme:(id)arg1;
- (void)preloadCoverImageWithIndexPath:(NSIndexPath *)arg1;

- (id)awesst_enterFrom;
- (id)awemeModelWithIndex:(long long)arg1;

- (id)initWithDataController:(id)arg1 IDs:(id)arg2 initialIndex:(long long)arg3 referString:(id)arg4;
- (id)initWithDataController:(id)arg1 initialIndex:(long long)arg2 referString:(id)arg3 logExtraDict:(id)arg4;
- (id)initWithDataController:(id)arg1 initialIndex:(long long)arg2 referString:(id)arg3;
@end


@interface AWEAwemeBaseViewController : UIViewController
@property(nonatomic) _Bool isValid;

- (_Bool)alertIfNotValid;
@end

@interface AWEAwemeDetailBaseViewController : AWEAwemeBaseViewController
@end

@interface AWEAwemeDetailCellViewController : AWEAwemeDetailBaseViewController
//nothing.
@end

@interface AWEAwemeDetailTableViewCell : UITableViewCell
@property(retain, nonatomic) AWEAwemeDetailCellViewController *viewController;
@end


%hook AWEAwemeDetailTableViewController
+ (id)detailTableViewControllerWithDataController:(id)arg1 initialIndex:(long long)arg2 referString:(id)arg3 {
    NSLog(@"AWEAwemeDetailTableViewController detailTableViewControllerWithDataController");
    return %orig;
}

- (void)viewDidLoad {
    %orig;
    //NSLog(@"processingLogin: %d, shouldEnablePushSourceTracker: %d, needPreFetch: %d, isAppearingOnAir: %d, NSDictionary: %@, description: %@", self.processingLogin, self.shouldEnablePushSourceTracker, self.needPreFetch, self.isAppearingOnAir, [self.logExtraDict description], self.description);
    
    /*
    for (NSString *string in self.dataController.filteredDataSource) {
        NSLog(@"%@", string);
    } */
    // foR ME, THE initial array count is 84. It can go up 600+ depending on how many videos you've liked
    //NSLog(@"");
    //NSLog(@"");
    

}

- (_Bool)isActive {
    NSLog(@"AWEAwemeDetailTableViewController isActive: %d", %orig);
    //NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
   // NSLog(@"cityInfoString: %@, originEntryEnterMethod: %@, dataControllerChangedBlock: %@", self.cityInfoString, self.originEntryEnterMethod, NSStringFromClass([self.dataControllerChangedBlock class]));
    
    
    //NSLog(@"isCleanFresh: %d, feedColumnType: %lld, isRequestOnAir: %d, loadmoreHasMore: %d, refreshHasMore: %d, filteredArrayCount: %d, dataArrayCount: %d, disableLoadmore: %d", self.dataController.isCleanRefresh, self.dataController.feedColumnType, self.dataController.isRequestOnAir, self.dataController.loadmoreHasMore, self.dataController.refreshHasMore, [self.dataController.filteredDataSource count], [self.dataController.dataSource count], self.dataController.disableLoadMore);
    NSLog(@"");
    NSLog(@"");
   // NSLog(@"%@", self.dataController.filteredDataSource);
    //NSLog(@"%@", self.dataController.dataSource);
    return %orig;
}

- (void)playIfActive {
    %orig;
}


- (void)videoDownloadFinished {
    %orig;
    NSLog(@"videoDownloadFinished");
}
- (void)deleteAwemeWithIDs:(id)arg1 {
    %orig;
    NSLog(@"deleteAwemeWithIDs, arg1: %@, arg1Type: %@", arg1, NSStringFromClass([arg1 class]));
}

- (_Bool)awesst_isVideoPlayViewController {
    NSLog(@"awesst_isVideoPlayViewController returnVal: %d", %orig);
    NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
    return %orig;
}

- (id)awesst_additionalTrackerParams {
    NSLog(@"awesst_additionalTrackerParams returnVal: %@", %orig);
    NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
    return %orig;

}

- (void)reloadDataForDataControllerChange {
    NSLog(@"reloadDataForDataControllerChange" );
    NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
    %orig;
}

- (void)_onAwemeDeleted:(id)arg1 {
    NSLog(@"_onAwemeDeleted" );
    NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
    %orig;
}
- (void)_onAwemeDeleteNotification:(id)arg1 {
    NSLog(@"_onAwemeDeleteNotification, arg1: %@", arg1 );
    NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
    %orig;
}

- (unsigned long long)_currentVisibleCellIndex {
    NSLog(@"_currentVisibleCellIndex, returnVal: %lld", %orig);
    NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
    return %orig;
}


- (void)videoVoteFinished {
    NSLog(@"videoVoteFinished");
    NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
    %orig;
}

- (void)setFeedColumntypeIfNeeded {
    NSLog(@"setFeedColumntypeIfNeeded");
    NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
    %orig;
}
- (void)loadmore {
    NSLog(@"loadmore");
    NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
    %orig;
}
- (void)initialFetch {
    NSLog(@"initialFetch");
    NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
    %orig;
}
- (void)initialFetchWithIDs:(id)arg1 {
    NSLog(@"initialFetchWithIDs: arg1 %@", arg1);
    NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
    %orig;
}
- (void)addLoadMoreIfNeeded {
   // NSLog(@"addLoadMoreIfNeeded");
   // NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
    %orig;
}

- (void)preloadImageForAweme:(id)arg1 {
    //arg1 is AWEAwemeModel
    //NSLog(@"preloadImageForAweme arg1: %@", arg1);
    %orig;
}
- (void)preloadCoverImageWithIndexPath:(NSIndexPath *)arg1 {
   NSLog(@"preloadCoverImageWithIndexPath, Section: %ld, Row: %ld", arg1.section, arg1.row);
    %orig;
}

- (id)awesst_enterFrom {
    NSLog(@"awesst_enterFrom returnVal %@", %orig);
    return %orig;
}
- (id)awemeModelWithIndex:(long long)arg1 {
    
    //NSLog(@"awemeModelWithIndexl %lld, returnVal : %@", arg1, %orig);
    
    //aWEAwemeModel *customModel = %orig;
    //customModel.accountScenario = 0; // This value is 2 for hidden video userss. Can't change this though.
    //NSLog(@"myCustomModel: %@", customModel);

    return %orig;
}


- (id)initWithDataController:(id)arg1 IDs:(id)arg2 initialIndex:(long long)arg3 referString:(id)arg4 {
    //NSLog(@"initWithDataController...IDs");
    //NSLog(@"arg1: %@, IDS: %@, initialIndex: %lld, referString: %@", arg1, arg2, arg3, arg4);
    //NSLog(@"");
    return %orig;
}
- (id)initWithDataController:(id)arg1 initialIndex:(long long)arg2 referString:(id)arg3 logExtraDict:(id)arg4 {
    //NSLog(@"initWithDataController...logExtraDict");
    //NSLog(@"arg1: %@, initialIndex: %lld, referString: %@, extraDict: %@", arg1, arg2, arg3, arg4);
    //NSLog(@"");
    return %orig;
}
- (id)initWithDataController:(id)arg1 initialIndex:(long long)arg2 referString:(id)arg3 {
    //NSLog(@"initWithDataController...referString");
    //NSLog(@"arg1: %@, initialIndex: %lld, referString: %@", arg1, arg2, arg3);
    return %orig;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AWEAwemeDetailTableViewCell *myCell = (AWEAwemeDetailTableViewCell *)%orig;
    myCell.viewController.isValid = YES;
    //NSLog(@"isValid: %d, isInteracting: %d", myCell.viewController.isValid, [myCell.viewController.interactionController isInteracting] );
    return myCell;
}

%end


@interface AWELongVideoPlayerInteractionView : UIView
- (void)doActionIfNotValidWithText:(id)arg1;
- (void)doActionIfNotValid;
- (_Bool)alertIfNotValid;
@end

%hook AWELongVideoPlayerInteractionView
- (void)doActionIfNotValidWithText:(id)arg1 {
    NSLog(@"[doActionIfNotValidWithText]");
    %orig;
}
- (void)doActionIfNotValid {
    NSLog(@"[doActionIfNotValid]");
    %orig;
}
- (_Bool)alertIfNotValid {
    NSLog(@"[alertIfNotValid], %d", %orig);
    return %orig;
}
%end


@interface AWEPlayVideoViewController : UIViewController
@property(retain, nonatomic) UIImageView *coverImageView;
@property(retain, nonatomic) UIView *loadingView;


- (void)viewDidLoad;
- (void)player:(id)arg1 noVideoDataToDownloadForURL:(id)arg2;
- (void)player:(id)arg1 didFinishVideoDataDownloadForURL:(id)arg2;
- (void)player:(id)arg1 didChangeStallState:(long long)arg2;

- (void)player:(id)arg1 playbackFailedWithError:(id)arg2;
- (void)player:(id)arg1 playbackFailedForURL:(id)arg2 error:(id)arg3;

- (_Bool)_alertIfNotValid;
- (_Bool)alertIfNotValid;
- (_Bool)videoShouldPlay;

- (void)_cancelTimingForFirstFrame;
- (void)observeValueForKeyPath:(id)arg1 ofObject:(id)arg2 change:(id)arg3 context:(void *)arg4;

- (long long)contentModeForDefaultVideoCover;
- (_Bool)isActive;
- (id)getPlayModeWithAutoPlayMode;
- (id)_getVideoPlayQualityParams;

@end



@interface AWEAwemePlayVideoViewController : AWEPlayVideoViewController
@end

%hook AWEAwemePlayVideoViewController
%end


/*
 _______  _______  _______  _______           _       _________ _______
 (  ___  )(  ____ \(  ____ \(  ___  )|\     /|( (    /|\__   __/(  ____ \
 | (   ) || (    \/| (    \/| (   ) || )   ( ||  \  ( |   ) (   | (    \/
 | (___) || |      | |      | |   | || |   | ||   \ | |   | |   | (_____
 |  ___  || |      | |      | |   | || |   | || (\ \) |   | |   (_____  )
 | (   ) || |      | |      | |   | || |   | || | \   |   | |         ) |
 | )   ( || (____/\| (____/\| (___) || (___) || )  \  |   | |   /\____) |
 |/     \|(_______/(_______/(_______)(_______)|/    )_)   )_(   \_______)
 
 - Added date to the liked videos feed.
 - Display other user's birthday and the DATE the account was made.
 - VIEW "private" or "under review" videos.
 */

@interface AWELikeWorkViewController : UIViewController
@property(retain, nonatomic) UICollectionView *collectionView;
- (UICollectionViewCell *)collectionView:(UICollectionView *)arg1 cellForItemAtIndexPath:(NSIndexPath *)arg2;
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
@end

%hook AWELikeWorkViewController
- (void)viewDidLoad {
    %orig;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)arg1 cellForItemAtIndexPath:(NSIndexPath *)arg2 {
    AWEUserWorkCollectionViewCell *myCell = (AWEUserWorkCollectionViewCell *)%orig;
    // This seems to be the date of the video made: myCell.model.createTime.
    myCell.model.isCanPlay = YES;
    return myCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"index: %ld", indexPath.row);
    %orig;
}
%end



%hook AWEAwemeModel
- (_Bool)canBeReposted {
    self.isCanPlay = YES;
    return YES;
}
- (_Bool)videoCommentStauts {
    return YES;
}
%end

@interface AWEAwemePlayInteractionPresenter : NSObject
@end

%hook AWEAwemePlayInteractionPresenter
- (_Bool)alertIfCanNotComment {
    return NO;
}
%end


%hook AWEAwemeBaseViewController
- (_Bool)alertIfNotValid {
    return NO;
}
%end

/*
 _       _________          _______
 ( \      \__   __/|\     /|(  ____ \
 | (         ) (   | )   ( || (    \/
 | |         | |   | |   | || (__
 | |         | |   ( (   ) )|  __)
 | |         | |    \ \_/ / | (
 | (____/\___) (___  \   /  | (____/\
 (_______/\_______/   \_/   (_______/
 - Display the "live" option when the + button is tapped at the Tab Bar. 
 */

%hook AWEVideoRecorderController
- (_Bool)shouldEnableLive {
    return YES;
}
%end
