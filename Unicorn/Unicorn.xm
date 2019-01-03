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
- (_Bool)textView:(id)arg1 shouldChangeTextInRange:(struct _NSRange)arg2 replacementText:(id)arg3;
@end


@interface AWELiveCommentInputView: UIView
@property(retain, nonatomic) AWEGrowingTextView *textView;
- (void)growingTextViewDidChange:(id)arg1;
- (_Bool)growingTextViewShouldBeginEditing:(id)arg1;
- (_Bool)growingTextView:(id)arg1 shouldChangeTextInRange:(struct _NSRange)arg2 replacementText:(id)arg3;
@end


//: LIVE Controllers
@interface AWELiveInteractViewController : UIViewController 
@property(retain, nonatomic) AWELiveCommentInputView *commentInputView;
- (void)viewDidLoad;
- (void)newChatButtonTapped:(UIButton*)button; //NEW
@end

@interface AWELiveAudienceViewController : AWELiveInteractViewController
- (void)viewDidLoad;
- (void)handleLongPress:(UILongPressGestureRecognizer*)sender;
- (void)listSubviewsOfView:(UIView *)view;
@end


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

//  Main
%hook AWELiveCommentInputView
- (void)growingTextViewDidChange:(id)arg1 {
    // Called when user types character
    %orig;
}
- (_Bool)growingTextViewShouldBeginEditing:(id)arg1 {
    // Called when bubble message is tapped
    return %orig;
}

- (_Bool)growingTextView:(id)arg1 shouldChangeTextInRange:(struct _NSRange)arg2 replacementText:(id)arg3 {
    // Don't modify this. It Won't send messages.
    return %orig;
}
%end


%hook AWEGrowingTextView
- (_Bool)textView:(id)arg1 shouldChangeTextInRange:(struct _NSRange)arg2 replacementText:(id)arg3 {
    %log;
    //NSString *string = [[arg1 text] stringByReplacingCharactersInRange:arg2 withString:arg3];
    //NSLog(@"%i", [string length]);
    return %orig;
}
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
