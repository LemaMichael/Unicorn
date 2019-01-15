#line 1 "/Users/michael/Unicorn/Unicorn/Unicorn.xm"
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
@property(nonatomic, retain) AWEFeedVideoButton *downloadButton; 
@property(retain, nonatomic) AWEFeedVideoButton *shareButton;
@property(retain, nonatomic) AWEMusicCoverButton *musicButton;
@property(retain, nonatomic) AWEAwemeModel *model;


- (void)downloadButtonPressed;
- (void)saveMusicalToPhotos;
- (void)viewDidLoad;
- (void)handleLongPress:(UILongPressGestureRecognizer*)sender;
@end




@interface YYAnimatedImageView : UIImageView
@end

@interface AWEProfileImagePreviewView : UIView
@property(retain, nonatomic) YYAnimatedImageView *avatar;
- (void)setupUI;
- (void)downloadImageButtonPressed:(UIButton*)button; 
@end



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



@interface AWELiveRoomModel
@property(nonatomic) _Bool inSandBox; 
@property(nonatomic) long long coins; 
@property(nonatomic) long long totalUserCount; 
@property(nonatomic) long long diggCount; 
@property(nonatomic) _Bool isRequestedCoverImage;
- (id)initWithRoomID:(id)arg1;
@end


@interface AWELiveInteractViewController : UIViewController 
@property(retain, nonatomic) AWELiveCommentInputView *commentInputView;
@property(retain, nonatomic) AWELiveRoomModel *roomModel; 

- (void)viewDidLoad;
- (void)newChatButtonTapped:(UIButton*)button; 

@end

@interface AWELiveAudienceViewController : AWELiveInteractViewController
- (void)viewDidLoad;
- (void)handleLongPress:(UILongPressGestureRecognizer*)sender;
- (void)listSubviewsOfView:(UIView *)view;
@end


@interface AWELiveGiftListCollectionViewCell : UICollectionViewCell
@end

@interface MTLModel : NSObject
- (_Bool)validate:(id *)arg1;
@end

@interface AWEBaseApiModel : MTLModel
@property(retain, nonatomic) NSString *statusMsg; 
@property(retain, nonatomic) NSNumber *timestamp; 
@property(retain, nonatomic) NSNumber *statusCode; 
@property(retain, nonatomic) NSString *requestID; 

- (_Bool)awe_validate:(id *)arg1;
- (_Bool)awe_validateValue:(inout id *)arg1 forKey:(id)arg2 error:(out id *)arg3;
- (void)_mergeAllPropertyKeysWithLogPassback:(id)arg1;
- (void)mergeAllPropertyKeysWithLogPassback;
- (void)_mergeAllPropertyKeysWithRequestId:(id)arg1;
- (void)mergeAllPropertyKeysWithRequestId;
@end

@interface AWELivePresentModel : AWEBaseApiModel 
@property(nonatomic) long long coin; 
- (id)copyWithZone:(struct _NSZone *)arg1;
- (id)fakeIconName;
- (_Bool)isFakePresent;
- (_Bool)isVideoPresent;
- (_Bool)isAwemePresent;
- (_Bool)isResourcePresent;
@end



#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class AWELiveSendGiftController; @class AWELiveAudienceViewController; @class AWEGrowingTextView; @class AWELiveInteractViewController; @class AWELiveSetting; @class AWEProfileImagePreviewView; @class AWELiveGiftListDataController; @class AWELiveGiftListViewController; @class AWEAwemePlayInteractionViewController; @class AWELiveCommentInputView; @class AWEFeedVideoButton; @class AWELiveFreePresentPropertyManager; 
static void (*_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL, UILongPressGestureRecognizer*); static AWEAwemePlayInteractionViewController* (*_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$initWithMediaType$)(_LOGOS_SELF_TYPE_INIT AWEAwemePlayInteractionViewController*, SEL, NSInteger) _LOGOS_RETURN_RETAINED; static AWEAwemePlayInteractionViewController* _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$initWithMediaType$(_LOGOS_SELF_TYPE_INIT AWEAwemePlayInteractionViewController*, SEL, NSInteger) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$updateAllSubViews)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$updateAllSubViews(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$downloadButtonPressed(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$saveMusicalToPhotos(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveAudienceViewController$listSubviewsOfView$(_LOGOS_SELF_TYPE_NORMAL AWELiveAudienceViewController* _LOGOS_SELF_CONST, SEL, UIView *); static void _logos_method$_ungrouped$AWELiveAudienceViewController$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL AWELiveAudienceViewController* _LOGOS_SELF_CONST, SEL, UILongPressGestureRecognizer*); static void (*_logos_orig$_ungrouped$AWELiveAudienceViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL AWELiveAudienceViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveAudienceViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWELiveAudienceViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEProfileImagePreviewView$setupUI)(_LOGOS_SELF_TYPE_NORMAL AWEProfileImagePreviewView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEProfileImagePreviewView$setupUI(_LOGOS_SELF_TYPE_NORMAL AWEProfileImagePreviewView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEProfileImagePreviewView$downloadImageButtonPressed$(_LOGOS_SELF_TYPE_NORMAL AWEProfileImagePreviewView* _LOGOS_SELF_CONST, SEL, UIButton*); static void (*_logos_orig$_ungrouped$AWELiveCommentInputView$growingTextViewDidChange$)(_LOGOS_SELF_TYPE_NORMAL AWELiveCommentInputView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWELiveCommentInputView$growingTextViewDidChange$(_LOGOS_SELF_TYPE_NORMAL AWELiveCommentInputView* _LOGOS_SELF_CONST, SEL, id); static _Bool (*_logos_orig$_ungrouped$AWELiveCommentInputView$growingTextViewShouldBeginEditing$)(_LOGOS_SELF_TYPE_NORMAL AWELiveCommentInputView* _LOGOS_SELF_CONST, SEL, id); static _Bool _logos_method$_ungrouped$AWELiveCommentInputView$growingTextViewShouldBeginEditing$(_LOGOS_SELF_TYPE_NORMAL AWELiveCommentInputView* _LOGOS_SELF_CONST, SEL, id); static _Bool (*_logos_orig$_ungrouped$AWELiveCommentInputView$growingTextView$shouldChangeTextInRange$replacementText$)(_LOGOS_SELF_TYPE_NORMAL AWELiveCommentInputView* _LOGOS_SELF_CONST, SEL, id, struct _NSRange, id); static _Bool _logos_method$_ungrouped$AWELiveCommentInputView$growingTextView$shouldChangeTextInRange$replacementText$(_LOGOS_SELF_TYPE_NORMAL AWELiveCommentInputView* _LOGOS_SELF_CONST, SEL, id, struct _NSRange, id); static _Bool (*_logos_orig$_ungrouped$AWEGrowingTextView$textView$shouldChangeTextInRange$replacementText$)(_LOGOS_SELF_TYPE_NORMAL AWEGrowingTextView* _LOGOS_SELF_CONST, SEL, id, struct _NSRange, id); static _Bool _logos_method$_ungrouped$AWEGrowingTextView$textView$shouldChangeTextInRange$replacementText$(_LOGOS_SELF_TYPE_NORMAL AWEGrowingTextView* _LOGOS_SELF_CONST, SEL, id, struct _NSRange, id); static void (*_logos_orig$_ungrouped$AWELiveInteractViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL AWELiveInteractViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveInteractViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWELiveInteractViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveInteractViewController$newChatButtonTapped$(_LOGOS_SELF_TYPE_NORMAL AWELiveInteractViewController* _LOGOS_SELF_CONST, SEL, UIButton*); static void (*_logos_meta_orig$_ungrouped$AWELiveSetting$setUserAllCoins$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, long long); static void _logos_meta_method$_ungrouped$AWELiveSetting$setUserAllCoins$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, long long); static long long (*_logos_meta_orig$_ungrouped$AWELiveSetting$userAllCoins)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static long long _logos_meta_method$_ungrouped$AWELiveSetting$userAllCoins(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELiveGiftListDataController$sendPresent$presentID$count$completion$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL, id, id, long long, id); static void _logos_method$_ungrouped$AWELiveGiftListDataController$sendPresent$presentID$count$completion$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL, id, id, long long, id); static void (*_logos_orig$_ungrouped$AWELiveSendGiftController$willSendGiftInCollectionView$atIndexPath$)(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWELiveSendGiftController$willSendGiftInCollectionView$atIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL, id, id); static long long (*_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$freeCountForPresentId$)(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id); static long long _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$freeCountForPresentId$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWELiveGiftListViewController$collectionView$didSelectItemAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWELiveGiftListViewController$collectionView$didSelectItemAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, id, id); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$AWEFeedVideoButton(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("AWEFeedVideoButton"); } return _klass; }
#line 142 "/Users/michael/Unicorn/Unicorn/Unicorn.xm"

bool isFollowingViewsHidden = false;

static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$viewDidLoad(self, _cmd);
    NSLog(@"Welcome to the for you/following page");
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]
                                               initWithTarget:self
                                               action:@selector(handleLongPress:)];
    longPress.minimumPressDuration = 1.0;
    [self.view addGestureRecognizer:longPress];
}



static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UILongPressGestureRecognizer* sender) {
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


static char _logos_property_key$_ungrouped$AWEAwemePlayInteractionViewController$downloadButton;__attribute__((used)) static AWEFeedVideoButton * _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$downloadButton$(AWEAwemePlayInteractionViewController* __unused self, SEL __unused _cmd){ return objc_getAssociatedObject(self, &_logos_property_key$_ungrouped$AWEAwemePlayInteractionViewController$downloadButton); }__attribute__((used)) static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$setDownloadButton$(AWEAwemePlayInteractionViewController* __unused self, SEL __unused _cmd, AWEFeedVideoButton * arg){ objc_setAssociatedObject(self, &_logos_property_key$_ungrouped$AWEAwemePlayInteractionViewController$downloadButton, arg, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }


static AWEAwemePlayInteractionViewController* _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$initWithMediaType$(_LOGOS_SELF_TYPE_INIT AWEAwemePlayInteractionViewController* __unused self, SEL __unused _cmd, NSInteger type) _LOGOS_RETURN_RETAINED {
    self = _logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$initWithMediaType$(self, _cmd, type);
    
    self.downloadButton = [_logos_static_class_lookup$AWEFeedVideoButton() noTextButtonWithImageName:nil shouldFit:YES];
    self.downloadButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    __weak typeof(self) weakSelf = self;
    self.downloadButton.touchUpInsideBlock = ^()
    {
        [weakSelf downloadButtonPressed];
    };
    
    
    UIImage *downloadImage = [[[UIImage alloc] initWithCGImage:[UIImage imageNamed:@"icoLoginArrowNor@3x.png"].CGImage scale:1 orientation:UIImageOrientationRight] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    [self.downloadButton setImage: downloadImage];
    self.downloadButton.tintColor = [UIColor whiteColor];
    
    
    NSDictionary* views = @{@"imageView" : self.downloadButton.aweImageView, @"containerView" : self.downloadButton.containerView};
    [self.downloadButton.containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[imageView]-0-|" options:0 metrics:nil views:views]];
    [self.downloadButton.containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[imageView]-0-|" options:0 metrics:nil views:views]];
    [self.downloadButton addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[containerView]-0-|" options:0 metrics:nil views:views]];
    [self.downloadButton addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[containerView]-0-|" options:0 metrics:nil views:views]];
    
    return self;
}


static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$updateAllSubViews(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$updateAllSubViews(self, _cmd);
    
    
    self.downloadButton.tintColor = [UIColor whiteColor];
    
    NSLayoutConstraint* neededConstraint;
    
    
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
    
    
    
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken,
                  ^{
                      initialConstant = neededConstraint.constant;
                  });
    
    if(neededConstraint.constant == initialConstant)
    {
        
        neededConstraint.constant -= 53.333333;
        
        
        [self.view addSubview:self.downloadButton];
        
        
        NSDictionary* views = @{@"downloadButton" : self.downloadButton, @"shareButton" : self.shareButton};
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[shareButton]-10-[downloadButton(44)]" options:0 metrics:nil views:views]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[downloadButton(44)]-10.6666-|" options:0 metrics:nil views:views]];
    }
}



static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$downloadButtonPressed(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    switch(status)
    {
        case PHAuthorizationStatusNotDetermined:
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus authorizationStatus)
             {
                 
                 if(authorizationStatus == PHAuthorizationStatusAuthorized)
                 {
                     [self saveMusicalToPhotos];
                 }
             }];
            break;
            
        case PHAuthorizationStatusAuthorized:
            
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



static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$saveMusicalToPhotos(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
    NSURL* videoURL = [NSURL URLWithString:self.model.video.playURL.originURLList.firstObject];
    
    
    NSURLSession* session = [NSURLSession sharedSession];
    
    
    NSURLSessionDownloadTask* musicalDownloadTask =
    [session downloadTaskWithURL:videoURL
               completionHandler:^(NSURL* location, NSURLResponse* response, NSError* error)
     {
         
         NSString* filename = [[videoURL lastPathComponent] stringByAppendingPathExtension:@"mp4"];
         
         
         [location setResourceValue:filename forKey:NSURLNameKey error:nil];
         
         
         location = [[location URLByDeletingLastPathComponent]
                     URLByAppendingPathComponent:filename];
         
         if(!error)
         {
             [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^
              {
                  
                  [PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:location];
              }
                                               completionHandler:^(BOOL success, NSError* error)
              {
                  
                  [[NSFileManager defaultManager] removeItemAtURL:location error:nil];
                  
                  if(success)
                  {
                      dispatch_async(dispatch_get_main_queue(),
                                     ^{
                                         
                                         self.downloadButton.tintColor = successColor;
                                         NSLog(@"DOWNLOAD WAS A SUCCESS!");
                                     });
                  }
              }];
         }
     }];
    
    
    [musicalDownloadTask resume];
}





bool isLiveViewsHidden = false;
UIView *liveViews;
int viewCounter = 0;


static void _logos_method$_ungrouped$AWELiveAudienceViewController$listSubviewsOfView$(_LOGOS_SELF_TYPE_NORMAL AWELiveAudienceViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIView * view) {
    
    
    NSArray *subviews = [view subviews];
    
    
    if ([subviews count] == 0) return;
    
    viewCounter += 1;
    for (UIView *subview in subviews) {
        
        
        
        if (viewCounter == 10) {
            
            liveViews = subview;
        }
        
        [self listSubviewsOfView:subview];
    }
}


static void _logos_method$_ungrouped$AWELiveAudienceViewController$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL AWELiveAudienceViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UILongPressGestureRecognizer* sender) {
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

static void _logos_method$_ungrouped$AWELiveAudienceViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWELiveAudienceViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWELiveAudienceViewController$viewDidLoad(self, _cmd);
    NSLog(@"You’ve entered the live chat.");
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]
                                               initWithTarget:self
                                               action:@selector(handleLongPress:)];
    longPress.minimumPressDuration = 1.0;
    [self.view addGestureRecognizer:longPress];
    
    [self listSubviewsOfView: self.view];
    viewCounter = 0;
}




UIButton *downloadImageButton;
static void _logos_method$_ungrouped$AWEProfileImagePreviewView$setupUI(_LOGOS_SELF_TYPE_NORMAL AWEProfileImagePreviewView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWEProfileImagePreviewView$setupUI(self, _cmd);
    downloadImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *downloadImage = [[[UIImage alloc] initWithCGImage:[UIImage imageNamed:@"icoLoginArrowNor@3x.png"].CGImage scale:1 orientation:UIImageOrientationRight] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [downloadImageButton setBackgroundImage:downloadImage forState:UIControlStateNormal];
    downloadImageButton.tintColor = [UIColor whiteColor];
    [downloadImageButton addTarget:self action:@selector(downloadImageButtonPressed:) forControlEvents:UIControlEventTouchUpInside];

    downloadImageButton.frame = CGRectMake(0, 114, 44, 44);
    [self addSubview: downloadImageButton];
}


static void _logos_method$_ungrouped$AWEProfileImagePreviewView$downloadImageButtonPressed$(_LOGOS_SELF_TYPE_NORMAL AWEProfileImagePreviewView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIButton* button) {
    
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




static void _logos_method$_ungrouped$AWELiveCommentInputView$growingTextViewDidChange$(_LOGOS_SELF_TYPE_NORMAL AWELiveCommentInputView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    _logos_orig$_ungrouped$AWELiveCommentInputView$growingTextViewDidChange$(self, _cmd, arg1);
}
static _Bool _logos_method$_ungrouped$AWELiveCommentInputView$growingTextViewShouldBeginEditing$(_LOGOS_SELF_TYPE_NORMAL AWELiveCommentInputView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    return _logos_orig$_ungrouped$AWELiveCommentInputView$growingTextViewShouldBeginEditing$(self, _cmd, arg1);
}

static _Bool _logos_method$_ungrouped$AWELiveCommentInputView$growingTextView$shouldChangeTextInRange$replacementText$(_LOGOS_SELF_TYPE_NORMAL AWELiveCommentInputView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, struct _NSRange arg2, id arg3) {
    
    return _logos_orig$_ungrouped$AWELiveCommentInputView$growingTextView$shouldChangeTextInRange$replacementText$(self, _cmd, arg1, arg2, arg3);
}




static _Bool _logos_method$_ungrouped$AWEGrowingTextView$textView$shouldChangeTextInRange$replacementText$(_LOGOS_SELF_TYPE_NORMAL AWEGrowingTextView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, struct _NSRange arg2, id arg3) {
    HBLogDebug(@"-[<AWEGrowingTextView: %p> textView:%@ shouldChangeTextInRange:-- replacementText:%@]", self, arg1, arg3);
    
    
    return _logos_orig$_ungrouped$AWEGrowingTextView$textView$shouldChangeTextInRange$replacementText$(self, _cmd, arg1, arg2, arg3);
}




static void _logos_method$_ungrouped$AWELiveInteractViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWELiveInteractViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWELiveInteractViewController$viewDidLoad(self, _cmd);
    NSLog(@"AWELiveInteractViewController CALLED");
    
   
   
    
   
    
    









    
    
    UIButton *newChatButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *chatImage = [[UIImage imageNamed:@"ic_home_like_after.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [newChatButton setBackgroundImage:chatImage forState:UIControlStateNormal];
    [newChatButton addTarget:self action:@selector(newChatButtonTapped:) forControlEvents:UIControlEventTouchUpInside];

    newChatButton.frame = CGRectMake(0, 0, 25, 25);
    [self.commentInputView addSubview: newChatButton];
}


static void _logos_method$_ungrouped$AWELiveInteractViewController$newChatButtonTapped$(_LOGOS_SELF_TYPE_NORMAL AWELiveInteractViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIButton* button) {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Type more than 50 Characters here" message:@"Tap Send after tapping Done" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.autocorrectionType = UITextAutocorrectionTypeYes;
        textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
        textField.placeholder = @"Say something epic...";
        
        
        if ( [self.commentInputView.textView.internalTextView.text length] != 0) {
            textField.text = self.commentInputView.textView.internalTextView.text;
        }
    }];
    
    UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        self.commentInputView.textView.internalTextView.text = [[alertController textFields][0] text];
        
        
        [self.commentInputView.textView.internalTextView becomeFirstResponder];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertController addAction: doneAction];
    [alertController addAction: cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}




@interface AWELiveSetting : NSObject
+ (void)setUserAllCoins:(long long)arg1;
+ (long long)userAllCoins;
@end



static void _logos_meta_method$_ungrouped$AWELiveSetting$setUserAllCoins$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long arg1) {
    
    arg1 = 10000000;
    
    _logos_meta_orig$_ungrouped$AWELiveSetting$setUserAllCoins$(self, _cmd, arg1);
}

static long long _logos_meta_method$_ungrouped$AWELiveSetting$userAllCoins(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    long long val = _logos_meta_orig$_ungrouped$AWELiveSetting$userAllCoins(self, _cmd);
    return _logos_meta_orig$_ungrouped$AWELiveSetting$userAllCoins(self, _cmd);
}



@interface AWELiveGiftListDataController : NSObject
- (void)sendPresent:(id)arg1 presentID:(id)arg2 count:(long long)arg3 completion:(id)arg4;
@end




static void _logos_method$_ungrouped$AWELiveGiftListDataController$sendPresent$presentID$count$completion$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, long long arg3, id arg4) {
    
    
    NSLog(@"sendPresent.. arg1: %@, arg2: %@, arg3: %lld", arg1, arg2, arg3);
    
    _logos_orig$_ungrouped$AWELiveGiftListDataController$sendPresent$presentID$count$completion$(self, _cmd, arg1, arg2, arg3, NULL);
    
}





@interface AWELiveSendGiftController : NSObject
- (void)willSendGiftInCollectionView:(id)arg1 atIndexPath:(id)arg2;
@end




static void _logos_method$_ungrouped$AWELiveSendGiftController$willSendGiftInCollectionView$atIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    
    NSLog(@"willSendGiftInCollectionView: arg1: %@, arg2: %@", arg1, arg2);
    
    _logos_orig$_ungrouped$AWELiveSendGiftController$willSendGiftInCollectionView$atIndexPath$(self, _cmd, arg1, arg2);
}



@interface AWELiveFreePresentPropertyManager : NSObject
+ (id)sharedInstace;
- (long long)freeCountForPresentId:(id)arg1;
@end




static long long _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$freeCountForPresentId$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    return _logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$freeCountForPresentId$(self, _cmd, arg1);
}



@interface AWELiveGiftListViewController : UIViewController
- (void)collectionView:(id)arg1 didSelectItemAtIndexPath:(id)arg2;
@property(retain, nonatomic) AWELiveSendGiftController *sendGiftController;
@property(retain, nonatomic) AWELiveGiftListDataController *dataController;
@end




static void _logos_method$_ungrouped$AWELiveGiftListViewController$collectionView$didSelectItemAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    
    NSLog(@"didSelectItem");
    
    
    [self.sendGiftController willSendGiftInCollectionView:arg1 atIndexPath:arg2]; 

}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$AWEAwemePlayInteractionViewController = objc_getClass("AWEAwemePlayInteractionViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$viewDidLoad);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UILongPressGestureRecognizer*), strlen(@encode(UILongPressGestureRecognizer*))); i += strlen(@encode(UILongPressGestureRecognizer*)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(handleLongPress:), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$handleLongPress$, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(initWithMediaType:), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$initWithMediaType$, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$initWithMediaType$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(updateAllSubViews), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$updateAllSubViews, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$updateAllSubViews);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(downloadButtonPressed), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$downloadButtonPressed, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(saveMusicalToPhotos), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$saveMusicalToPhotos, _typeEncoding); }{ class_addMethod(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(downloadButton), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$downloadButton$, [[NSString stringWithFormat:@"%s@:", @encode(AWEFeedVideoButton *)] UTF8String]);class_addMethod(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(setDownloadButton:), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$setDownloadButton$, [[NSString stringWithFormat:@"v@:%s", @encode(AWEFeedVideoButton *)] UTF8String]);} Class _logos_class$_ungrouped$AWELiveAudienceViewController = objc_getClass("AWELiveAudienceViewController"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIView *), strlen(@encode(UIView *))); i += strlen(@encode(UIView *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWELiveAudienceViewController, @selector(listSubviewsOfView:), (IMP)&_logos_method$_ungrouped$AWELiveAudienceViewController$listSubviewsOfView$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UILongPressGestureRecognizer*), strlen(@encode(UILongPressGestureRecognizer*))); i += strlen(@encode(UILongPressGestureRecognizer*)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWELiveAudienceViewController, @selector(handleLongPress:), (IMP)&_logos_method$_ungrouped$AWELiveAudienceViewController$handleLongPress$, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$AWELiveAudienceViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$AWELiveAudienceViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$AWELiveAudienceViewController$viewDidLoad);Class _logos_class$_ungrouped$AWEProfileImagePreviewView = objc_getClass("AWEProfileImagePreviewView"); MSHookMessageEx(_logos_class$_ungrouped$AWEProfileImagePreviewView, @selector(setupUI), (IMP)&_logos_method$_ungrouped$AWEProfileImagePreviewView$setupUI, (IMP*)&_logos_orig$_ungrouped$AWEProfileImagePreviewView$setupUI);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIButton*), strlen(@encode(UIButton*))); i += strlen(@encode(UIButton*)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEProfileImagePreviewView, @selector(downloadImageButtonPressed:), (IMP)&_logos_method$_ungrouped$AWEProfileImagePreviewView$downloadImageButtonPressed$, _typeEncoding); }Class _logos_class$_ungrouped$AWELiveCommentInputView = objc_getClass("AWELiveCommentInputView"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveCommentInputView, @selector(growingTextViewDidChange:), (IMP)&_logos_method$_ungrouped$AWELiveCommentInputView$growingTextViewDidChange$, (IMP*)&_logos_orig$_ungrouped$AWELiveCommentInputView$growingTextViewDidChange$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveCommentInputView, @selector(growingTextViewShouldBeginEditing:), (IMP)&_logos_method$_ungrouped$AWELiveCommentInputView$growingTextViewShouldBeginEditing$, (IMP*)&_logos_orig$_ungrouped$AWELiveCommentInputView$growingTextViewShouldBeginEditing$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveCommentInputView, @selector(growingTextView:shouldChangeTextInRange:replacementText:), (IMP)&_logos_method$_ungrouped$AWELiveCommentInputView$growingTextView$shouldChangeTextInRange$replacementText$, (IMP*)&_logos_orig$_ungrouped$AWELiveCommentInputView$growingTextView$shouldChangeTextInRange$replacementText$);Class _logos_class$_ungrouped$AWEGrowingTextView = objc_getClass("AWEGrowingTextView"); MSHookMessageEx(_logos_class$_ungrouped$AWEGrowingTextView, @selector(textView:shouldChangeTextInRange:replacementText:), (IMP)&_logos_method$_ungrouped$AWEGrowingTextView$textView$shouldChangeTextInRange$replacementText$, (IMP*)&_logos_orig$_ungrouped$AWEGrowingTextView$textView$shouldChangeTextInRange$replacementText$);Class _logos_class$_ungrouped$AWELiveInteractViewController = objc_getClass("AWELiveInteractViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveInteractViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$AWELiveInteractViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$AWELiveInteractViewController$viewDidLoad);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIButton*), strlen(@encode(UIButton*))); i += strlen(@encode(UIButton*)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWELiveInteractViewController, @selector(newChatButtonTapped:), (IMP)&_logos_method$_ungrouped$AWELiveInteractViewController$newChatButtonTapped$, _typeEncoding); }Class _logos_class$_ungrouped$AWELiveSetting = objc_getClass("AWELiveSetting"); Class _logos_metaclass$_ungrouped$AWELiveSetting = object_getClass(_logos_class$_ungrouped$AWELiveSetting); MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveSetting, @selector(setUserAllCoins:), (IMP)&_logos_meta_method$_ungrouped$AWELiveSetting$setUserAllCoins$, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveSetting$setUserAllCoins$);MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveSetting, @selector(userAllCoins), (IMP)&_logos_meta_method$_ungrouped$AWELiveSetting$userAllCoins, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveSetting$userAllCoins);Class _logos_class$_ungrouped$AWELiveGiftListDataController = objc_getClass("AWELiveGiftListDataController"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListDataController, @selector(sendPresent:presentID:count:completion:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListDataController$sendPresent$presentID$count$completion$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListDataController$sendPresent$presentID$count$completion$);Class _logos_class$_ungrouped$AWELiveSendGiftController = objc_getClass("AWELiveSendGiftController"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveSendGiftController, @selector(willSendGiftInCollectionView:atIndexPath:), (IMP)&_logos_method$_ungrouped$AWELiveSendGiftController$willSendGiftInCollectionView$atIndexPath$, (IMP*)&_logos_orig$_ungrouped$AWELiveSendGiftController$willSendGiftInCollectionView$atIndexPath$);Class _logos_class$_ungrouped$AWELiveFreePresentPropertyManager = objc_getClass("AWELiveFreePresentPropertyManager"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveFreePresentPropertyManager, @selector(freeCountForPresentId:), (IMP)&_logos_method$_ungrouped$AWELiveFreePresentPropertyManager$freeCountForPresentId$, (IMP*)&_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$freeCountForPresentId$);Class _logos_class$_ungrouped$AWELiveGiftListViewController = objc_getClass("AWELiveGiftListViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListViewController, @selector(collectionView:didSelectItemAtIndexPath:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListViewController$collectionView$didSelectItemAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListViewController$collectionView$didSelectItemAtIndexPath$);} }
#line 634 "/Users/michael/Unicorn/Unicorn/Unicorn.xm"
