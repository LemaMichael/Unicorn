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



@interface AWELiveInteractViewController : UIViewController
@end

@interface AWELiveAudienceViewController : AWELiveInteractViewController
- (void)viewDidLoad;
- (void)handleLongPress:(UILongPressGestureRecognizer*)sender;
- (void)listSubviewsOfView:(UIView *)view;
@end




@interface YYAnimatedImageView : UIImageView
@end

@interface AWEProfileImagePreviewView : UIView
@property(retain, nonatomic) YYAnimatedImageView *avatar; 
- (void)setupUI;
- (void)downloadImageButtonPressed:(UIButton*)button; 
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

@class AWEAwemePlayInteractionViewController; @class AWEProfileImagePreviewView; @class AWELiveAudienceViewController; @class AWEFeedVideoButton; 
static void (*_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL, UILongPressGestureRecognizer*); static AWEAwemePlayInteractionViewController* (*_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$initWithMediaType$)(_LOGOS_SELF_TYPE_INIT AWEAwemePlayInteractionViewController*, SEL, NSInteger) _LOGOS_RETURN_RETAINED; static AWEAwemePlayInteractionViewController* _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$initWithMediaType$(_LOGOS_SELF_TYPE_INIT AWEAwemePlayInteractionViewController*, SEL, NSInteger) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$updateAllSubViews)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$updateAllSubViews(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$downloadButtonPressed(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$saveMusicalToPhotos(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveAudienceViewController$listSubviewsOfView$(_LOGOS_SELF_TYPE_NORMAL AWELiveAudienceViewController* _LOGOS_SELF_CONST, SEL, UIView *); static void _logos_method$_ungrouped$AWELiveAudienceViewController$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL AWELiveAudienceViewController* _LOGOS_SELF_CONST, SEL, UILongPressGestureRecognizer*); static void (*_logos_orig$_ungrouped$AWELiveAudienceViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL AWELiveAudienceViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveAudienceViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWELiveAudienceViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEProfileImagePreviewView$setupUI)(_LOGOS_SELF_TYPE_NORMAL AWEProfileImagePreviewView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEProfileImagePreviewView$setupUI(_LOGOS_SELF_TYPE_NORMAL AWEProfileImagePreviewView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEProfileImagePreviewView$downloadImageButtonPressed$(_LOGOS_SELF_TYPE_NORMAL AWEProfileImagePreviewView* _LOGOS_SELF_CONST, SEL, UIButton*); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$AWEFeedVideoButton(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("AWEFeedVideoButton"); } return _klass; }
#line 73 "/Users/michael/Unicorn/Unicorn/Unicorn.xm"

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
    NSLog(@"SetupUI");
    downloadImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [downloadImageButton addTarget:self action:@selector(downloadImageButtonPressed:) forControlEvents:UIControlEventTouchUpInside];

    UIImage *downloadImage = [[[UIImage alloc] initWithCGImage:[UIImage imageNamed:@"icoLoginArrowNor@3x.png"].CGImage scale:1 orientation:UIImageOrientationRight] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    [downloadImageButton setBackgroundImage:downloadImage forState:UIControlStateNormal];
    downloadImageButton.tintColor = [UIColor blackColor];

    downloadImageButton.frame = CGRectMake(80.0, 210.0, 42.0, 42.0);
    [self addSubview:downloadImageButton];
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


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$AWEAwemePlayInteractionViewController = objc_getClass("AWEAwemePlayInteractionViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$viewDidLoad);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UILongPressGestureRecognizer*), strlen(@encode(UILongPressGestureRecognizer*))); i += strlen(@encode(UILongPressGestureRecognizer*)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(handleLongPress:), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$handleLongPress$, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(initWithMediaType:), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$initWithMediaType$, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$initWithMediaType$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(updateAllSubViews), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$updateAllSubViews, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$updateAllSubViews);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(downloadButtonPressed), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$downloadButtonPressed, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(saveMusicalToPhotos), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$saveMusicalToPhotos, _typeEncoding); }{ class_addMethod(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(downloadButton), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$downloadButton$, [[NSString stringWithFormat:@"%s@:", @encode(AWEFeedVideoButton *)] UTF8String]);class_addMethod(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(setDownloadButton:), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$setDownloadButton$, [[NSString stringWithFormat:@"v@:%s", @encode(AWEFeedVideoButton *)] UTF8String]);} Class _logos_class$_ungrouped$AWELiveAudienceViewController = objc_getClass("AWELiveAudienceViewController"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIView *), strlen(@encode(UIView *))); i += strlen(@encode(UIView *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWELiveAudienceViewController, @selector(listSubviewsOfView:), (IMP)&_logos_method$_ungrouped$AWELiveAudienceViewController$listSubviewsOfView$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UILongPressGestureRecognizer*), strlen(@encode(UILongPressGestureRecognizer*))); i += strlen(@encode(UILongPressGestureRecognizer*)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWELiveAudienceViewController, @selector(handleLongPress:), (IMP)&_logos_method$_ungrouped$AWELiveAudienceViewController$handleLongPress$, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$AWELiveAudienceViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$AWELiveAudienceViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$AWELiveAudienceViewController$viewDidLoad);Class _logos_class$_ungrouped$AWEProfileImagePreviewView = objc_getClass("AWEProfileImagePreviewView"); MSHookMessageEx(_logos_class$_ungrouped$AWEProfileImagePreviewView, @selector(setupUI), (IMP)&_logos_method$_ungrouped$AWEProfileImagePreviewView$setupUI, (IMP*)&_logos_orig$_ungrouped$AWEProfileImagePreviewView$setupUI);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIButton*), strlen(@encode(UIButton*))); i += strlen(@encode(UIButton*)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEProfileImagePreviewView, @selector(downloadImageButtonPressed:), (IMP)&_logos_method$_ungrouped$AWEProfileImagePreviewView$downloadImageButtonPressed$, _typeEncoding); }} }
#line 384 "/Users/michael/Unicorn/Unicorn/Unicorn.xm"
