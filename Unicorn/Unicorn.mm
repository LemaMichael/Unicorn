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

@interface MTLModel : NSObject
@property(readonly) unsigned long long hash;
@property(readonly, copy) NSString *description;
@property(readonly, copy, nonatomic) NSDictionary *dictionaryValue;
@property(readonly, copy) NSString *debugDescription;
- (_Bool)validate:(id *)arg1;
@end

@interface AWEBaseApiModel : MTLModel
@property(retain, nonatomic) NSDictionary *logPassback;
@property(retain, nonatomic) NSString *statusMsg;
@property(retain, nonatomic) NSNumber *timestamp;
@property(retain, nonatomic) NSNumber *statusCode;
@property(retain, nonatomic) NSString *requestID;

@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;

- (_Bool)awe_validate:(id *)arg1;
- (_Bool)awe_validateValue:(inout id *)arg1 forKey:(id)arg2 error:(out id *)arg3;
- (void)_mergeAllPropertyKeysWithLogPassback:(id)arg1;
- (void)mergeAllPropertyKeysWithLogPassback;
- (void)_mergeAllPropertyKeysWithRequestId:(id)arg1;
- (void)mergeAllPropertyKeysWithRequestId;
@end


@interface AWEAwemeStatusModel : AWEBaseApiModel
@property(nonatomic) _Bool hasFusionGoods;
@property(nonatomic) _Bool hasTaobaoGoods;
@property(nonatomic) unsigned long long downloadType;
@property(nonatomic) _Bool isProhibited;
@property(nonatomic) _Bool isSelfSeeing;
@property(nonatomic) _Bool isReviewed;
@property(readonly, nonatomic) _Bool inReviewing;
@property(nonatomic) unsigned long long privacyType;
@property(readonly, nonatomic) _Bool allowComment;
@property(readonly, nonatomic) _Bool allowShare;
@property(readonly, nonatomic) _Bool deleted;
@property(readonly, nonatomic) NSString *itemID;
@property(readonly, nonatomic) _Bool isNotPublic;
@property(readonly, nonatomic) _Bool isFriendVisible;
@property(readonly, nonatomic) _Bool isPrivate;
@property(nonatomic) _Bool hasGoods;
@end

@interface AWEAwemeStatisticsModel : AWEBaseApiModel
@property(retain, nonatomic) NSNumber *commentCount;
@property(retain, nonatomic) NSNumber *playCount;
@end


@interface AWEUserModel : AWEBaseApiModel
@property(nonatomic) _Bool isGovMediaVip;
@property(nonatomic) _Bool preventDownload;
@property(nonatomic) _Bool isAcceptPrivatePolicy;

@property(retain, nonatomic) NSArray *awemeItems;
@property(retain, nonatomic) NSString *socialName;
@property(nonatomic) long long downloadSetting;
@property(nonatomic) long long commentSetting;
@property(nonatomic) long long duetSetting;

@property(nonatomic) _Bool privateAccount;

@property(retain, nonatomic) NSString *birthday;
@property(retain, nonatomic) NSString *alias;
@property(retain, nonatomic) NSString *nickname;
@property(readonly, nonatomic) NSString *shortID;
@property(retain, nonatomic) NSString *userID;
@property(retain, nonatomic) NSDate *createTime;
@end

@interface AWEAwemeModel : NSObject
@property(retain, nonatomic) AWEVideoModel* video;
@property(retain, nonatomic) AWEAwemeStatusModel *status;
@property(retain, nonatomic) NSNumber *accountScenario;
@property(retain, nonatomic) NSArray *images;
@property(copy, nonatomic) NSArray *topTagLabels;
@property(copy, nonatomic) NSArray *tagLabels;
@property(copy, nonatomic) NSArray *goodList;
@property(retain, nonatomic) NSArray *videoLabels;
@property(retain, nonatomic) NSArray *textExtras;
@property(retain, nonatomic) NSArray *longVideo;
@property(copy, nonatomic) NSArray *challengeList;
@property(retain, nonatomic) AWEAwemeStatisticsModel *statistics;
@property(copy, nonatomic) NSString *shareURL;
@property(retain, nonatomic) AWEUserModel *author;
@property(copy, nonatomic) NSString *descriptionString;
@property(nonatomic) _Bool isCanPlay;
@property(readonly, nonatomic) NSNumber *createTime;
@property(nonatomic) _Bool isForbidComment;
@property(nonatomic) _Bool isLawCriticalCountry;
- (_Bool)disableComment;
- (_Bool)canBeReposted;
- (_Bool)videoCommentStauts;
- (AWEAwemeModel *)init;
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



@interface AWELivePresentModel : AWEBaseApiModel 
@property(nonatomic) long long coin; 
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

@class AWELiveGiftListDataController; @class AWELiveSetting; @class AWEUserDetailViewController; @class AWEPostWorkViewController; @class AWELiveRoomModel; @class AWEFeedVideoButton; @class AWELiveSendGiftController; @class AWELiveGiftListBottomLandscapeView; @class AWEAwemePlayVideoViewController; @class AWEAppLiveSettingManager; @class AWEProfileImagePreviewView; @class AWEAppShareSettingManager; @class AWEPlayVideoViewController; @class AWEAwemeBaseViewController; @class MTLModel; @class AWEUserPostsDataManager; @class AWEAwemeShareViewController; @class AWEAwemeDetailTableViewController; @class AWEUserWorkCollectionViewCell; @class AWELiveSendGiftControllerDelegate; @class AWECommentListViewController; @class AWELivePresentModel; @class AWELikeWorkViewController; @class AWELiveGiftFansEnterView; @class AWEAwemeModel; @class AWELongVideoPlayerInteractionView; @class AWELiveFreePresentPropertyManager; @class AWELiveSendGiftPackage; @class AWELiveMyWalletModel; @class AWELiveInteractViewController; @class AWELiveTrackEventManager; @class AWELiveWalletManager; @class AWEAwemePlayInteractionViewController; @class AWELiveGiftListViewController; @class AWELiveAudienceViewController; @class AWELiveCommentInputView; @class AWEAwemePlayInteractionPresenter; @class AWEGrowingTextView; 
static void (*_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL, UILongPressGestureRecognizer*); static AWEAwemePlayInteractionViewController* (*_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$initWithMediaType$)(_LOGOS_SELF_TYPE_INIT AWEAwemePlayInteractionViewController*, SEL, NSInteger) _LOGOS_RETURN_RETAINED; static AWEAwemePlayInteractionViewController* _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$initWithMediaType$(_LOGOS_SELF_TYPE_INIT AWEAwemePlayInteractionViewController*, SEL, NSInteger) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$updateAllSubViews)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$updateAllSubViews(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$downloadButtonPressed(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$saveMusicalToPhotos(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveAudienceViewController$listSubviewsOfView$(_LOGOS_SELF_TYPE_NORMAL AWELiveAudienceViewController* _LOGOS_SELF_CONST, SEL, UIView *); static void _logos_method$_ungrouped$AWELiveAudienceViewController$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL AWELiveAudienceViewController* _LOGOS_SELF_CONST, SEL, UILongPressGestureRecognizer*); static void (*_logos_orig$_ungrouped$AWELiveAudienceViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL AWELiveAudienceViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveAudienceViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWELiveAudienceViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEProfileImagePreviewView$setupUI)(_LOGOS_SELF_TYPE_NORMAL AWEProfileImagePreviewView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEProfileImagePreviewView$setupUI(_LOGOS_SELF_TYPE_NORMAL AWEProfileImagePreviewView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEProfileImagePreviewView$downloadImageButtonPressed$(_LOGOS_SELF_TYPE_NORMAL AWEProfileImagePreviewView* _LOGOS_SELF_CONST, SEL, UIButton*); static void (*_logos_orig$_ungrouped$AWELiveCommentInputView$growingTextViewDidChange$)(_LOGOS_SELF_TYPE_NORMAL AWELiveCommentInputView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWELiveCommentInputView$growingTextViewDidChange$(_LOGOS_SELF_TYPE_NORMAL AWELiveCommentInputView* _LOGOS_SELF_CONST, SEL, id); static _Bool (*_logos_orig$_ungrouped$AWELiveCommentInputView$growingTextViewShouldBeginEditing$)(_LOGOS_SELF_TYPE_NORMAL AWELiveCommentInputView* _LOGOS_SELF_CONST, SEL, id); static _Bool _logos_method$_ungrouped$AWELiveCommentInputView$growingTextViewShouldBeginEditing$(_LOGOS_SELF_TYPE_NORMAL AWELiveCommentInputView* _LOGOS_SELF_CONST, SEL, id); static _Bool (*_logos_orig$_ungrouped$AWELiveCommentInputView$growingTextView$shouldChangeTextInRange$replacementText$)(_LOGOS_SELF_TYPE_NORMAL AWELiveCommentInputView* _LOGOS_SELF_CONST, SEL, id, struct _NSRange, id); static _Bool _logos_method$_ungrouped$AWELiveCommentInputView$growingTextView$shouldChangeTextInRange$replacementText$(_LOGOS_SELF_TYPE_NORMAL AWELiveCommentInputView* _LOGOS_SELF_CONST, SEL, id, struct _NSRange, id); static _Bool (*_logos_orig$_ungrouped$AWEGrowingTextView$textView$shouldChangeTextInRange$replacementText$)(_LOGOS_SELF_TYPE_NORMAL AWEGrowingTextView* _LOGOS_SELF_CONST, SEL, id, struct _NSRange, id); static _Bool _logos_method$_ungrouped$AWEGrowingTextView$textView$shouldChangeTextInRange$replacementText$(_LOGOS_SELF_TYPE_NORMAL AWEGrowingTextView* _LOGOS_SELF_CONST, SEL, id, struct _NSRange, id); static void (*_logos_orig$_ungrouped$AWELiveInteractViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL AWELiveInteractViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveInteractViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWELiveInteractViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveInteractViewController$newChatButtonTapped$(_LOGOS_SELF_TYPE_NORMAL AWELiveInteractViewController* _LOGOS_SELF_CONST, SEL, UIButton*); static void (*_logos_orig$_ungrouped$AWELiveSendGiftControllerDelegate$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftControllerDelegate* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveSendGiftControllerDelegate$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftControllerDelegate* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELiveSendGiftControllerDelegate$handleLongPress$)(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftControllerDelegate* _LOGOS_SELF_CONST, SEL, UILongPressGestureRecognizer*); static void _logos_method$_ungrouped$AWELiveSendGiftControllerDelegate$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftControllerDelegate* _LOGOS_SELF_CONST, SEL, UILongPressGestureRecognizer*); static void (*_logos_orig$_ungrouped$AWELiveSendGiftControllerDelegate$listSubviewsOfView$)(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftControllerDelegate* _LOGOS_SELF_CONST, SEL, UIView *); static void _logos_method$_ungrouped$AWELiveSendGiftControllerDelegate$listSubviewsOfView$(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftControllerDelegate* _LOGOS_SELF_CONST, SEL, UIView *); static _Bool (*_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$disableNewPayment)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$disableNewPayment(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$newWalletConf)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$newWalletConf(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$showSkylightAnimation)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$showSkylightAnimation(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$disableLiveCDNNodeSelection)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$disableLiveCDNNodeSelection(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$isLivePodcast)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$isLivePodcast(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double (*_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveResH)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveResH(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double (*_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveResW)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveResW(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double (*_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveFps)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveFps(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double (*_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveMinBitrate)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveMinBitrate(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double (*_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveMaxBitrate)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveMaxBitrate(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double (*_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveDefaultBitrate)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveDefaultBitrate(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWELiveSetting$shouldCheckCoins$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, _Bool); static _Bool _logos_meta_method$_ungrouped$AWELiveSetting$shouldCheckCoins$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, _Bool); static void (*_logos_meta_orig$_ungrouped$AWELiveSetting$setBarrageCoins$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, long long); static void _logos_meta_method$_ungrouped$AWELiveSetting$setBarrageCoins$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, long long); static long long (*_logos_meta_orig$_ungrouped$AWELiveSetting$barrageCoins)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static long long _logos_meta_method$_ungrouped$AWELiveSetting$barrageCoins(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_meta_orig$_ungrouped$AWELiveSetting$setUserAllCoins$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, long long); static void _logos_meta_method$_ungrouped$AWELiveSetting$setUserAllCoins$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, long long); static long long (*_logos_meta_orig$_ungrouped$AWELiveSetting$userAllCoins)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static long long _logos_meta_method$_ungrouped$AWELiveSetting$userAllCoins(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_meta_orig$_ungrouped$AWELiveTrackEventManager$trackLiveClickPresent$isAnchor$enterFrom$presentID$presentCoins$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, _Bool, id, id, id); static void _logos_meta_method$_ungrouped$AWELiveTrackEventManager$trackLiveClickPresent$isAnchor$enterFrom$presentID$presentCoins$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, _Bool, id, id, id); static void (*_logos_meta_orig$_ungrouped$AWELiveTrackEventManager$trackLiveSendPresentSuccess$isAnchor$enterFrom$presentID$presentCoins$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, _Bool, id, id, id); static void _logos_meta_method$_ungrouped$AWELiveTrackEventManager$trackLiveSendPresentSuccess$isAnchor$enterFrom$presentID$presentCoins$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, _Bool, id, id, id); static void (*_logos_orig$_ungrouped$AWELiveSendGiftPackage$resetWithPresent$)(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftPackage* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWELiveSendGiftPackage$resetWithPresent$(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftPackage* _LOGOS_SELF_CONST, SEL, id); static AWELiveRoomModel* (*_logos_orig$_ungrouped$AWELiveRoomModel$initWithRoomID$)(_LOGOS_SELF_TYPE_INIT AWELiveRoomModel*, SEL, id) _LOGOS_RETURN_RETAINED; static AWELiveRoomModel* _logos_method$_ungrouped$AWELiveRoomModel$initWithRoomID$(_LOGOS_SELF_TYPE_INIT AWELiveRoomModel*, SEL, id) _LOGOS_RETURN_RETAINED; static AWELivePresentModel* (*_logos_orig$_ungrouped$AWELivePresentModel$copyWithZone$)(_LOGOS_SELF_TYPE_NORMAL AWELivePresentModel* _LOGOS_SELF_CONST, SEL, struct _NSZone *) _LOGOS_RETURN_RETAINED; static AWELivePresentModel* _logos_method$_ungrouped$AWELivePresentModel$copyWithZone$(_LOGOS_SELF_TYPE_NORMAL AWELivePresentModel* _LOGOS_SELF_CONST, SEL, struct _NSZone *) _LOGOS_RETURN_RETAINED; static id (*_logos_orig$_ungrouped$AWELivePresentModel$fakeIconName)(_LOGOS_SELF_TYPE_NORMAL AWELivePresentModel* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$AWELivePresentModel$fakeIconName(_LOGOS_SELF_TYPE_NORMAL AWELivePresentModel* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWELivePresentModel$isFakePresent)(_LOGOS_SELF_TYPE_NORMAL AWELivePresentModel* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWELivePresentModel$isFakePresent(_LOGOS_SELF_TYPE_NORMAL AWELivePresentModel* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWELivePresentModel$isVideoPresent)(_LOGOS_SELF_TYPE_NORMAL AWELivePresentModel* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWELivePresentModel$isVideoPresent(_LOGOS_SELF_TYPE_NORMAL AWELivePresentModel* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWELivePresentModel$isAwemePresent)(_LOGOS_SELF_TYPE_NORMAL AWELivePresentModel* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWELivePresentModel$isAwemePresent(_LOGOS_SELF_TYPE_NORMAL AWELivePresentModel* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWELivePresentModel$isResourcePresent)(_LOGOS_SELF_TYPE_NORMAL AWELivePresentModel* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWELivePresentModel$isResourcePresent(_LOGOS_SELF_TYPE_NORMAL AWELivePresentModel* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELiveGiftListDataController$sendPresent$presentID$count$completion$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL, id, id, long long, id); static void _logos_method$_ungrouped$AWELiveGiftListDataController$sendPresent$presentID$count$completion$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL, id, id, long long, id); static void (*_logos_orig$_ungrouped$AWELiveGiftListDataController$filterDisplayPresentList)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveGiftListDataController$filterDisplayPresentList(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELiveGiftListDataController$_getFreePresentListWithPresentList$completion$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWELiveGiftListDataController$_getFreePresentListWithPresentList$completion$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$AWELiveGiftListDataController$getSandBoxGiftListModel$completion$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWELiveGiftListDataController$getSandBoxGiftListModel$completion$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithCompletion$roomID$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithCompletion$roomID$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithRoom$completion$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithRoom$completion$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL, id, id); static _Bool (*_logos_orig$_ungrouped$AWELiveSendGiftController$isAnchor)(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWELiveSendGiftController$isAnchor(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELiveSendGiftController$_performSendRequest)(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveSendGiftController$_performSendRequest(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELiveSendGiftController$_prepareSendRequestWithPresent$)(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWELiveSendGiftController$_prepareSendRequestWithPresent$(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWELiveSendGiftController$_performClickTrack)(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveSendGiftController$_performClickTrack(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELiveSendGiftController$_prepareClickTrackWithPreseent$)(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWELiveSendGiftController$_prepareClickTrackWithPreseent$(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWELiveSendGiftController$willSendGiftInCollectionView$atIndexPath$)(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWELiveSendGiftController$willSendGiftInCollectionView$atIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$AWELiveGiftListBottomLandscapeView$refreshWalletCoins$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListBottomLandscapeView* _LOGOS_SELF_CONST, SEL, long long); static void _logos_method$_ungrouped$AWELiveGiftListBottomLandscapeView$refreshWalletCoins$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListBottomLandscapeView* _LOGOS_SELF_CONST, SEL, long long); static void (*_logos_orig$_ungrouped$AWELiveGiftFansEnterView$handleProcessWithIntimacy$presentCoins$animationFinishBlock$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftFansEnterView* _LOGOS_SELF_CONST, SEL, id, long long, id); static void _logos_method$_ungrouped$AWELiveGiftFansEnterView$handleProcessWithIntimacy$presentCoins$animationFinishBlock$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftFansEnterView* _LOGOS_SELF_CONST, SEL, id, long long, id); static void (*_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$_consumeFansFreePresentWithPresentId$count$)(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id, long long); static void _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$_consumeFansFreePresentWithPresentId$count$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id, long long); static void (*_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$setFansFreePresent$)(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$setFansFreePresent$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$consumeFreePresentWithPresentId$propertIDs$count$)(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id, id, long long); static void _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$consumeFreePresentWithPresentId$propertIDs$count$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id, id, long long); static id (*_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$useFreePresentWithPresentId$count$)(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id, long long); static id _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$useFreePresentWithPresentId$count$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id, long long); static long long (*_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$freeCountForPresentId$)(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id); static long long _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$freeCountForPresentId$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$fetchFreePresentListWithCompletion$)(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$fetchFreePresentListWithCompletion$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id); static AWELiveFreePresentPropertyManager* (*_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$init)(_LOGOS_SELF_TYPE_INIT AWELiveFreePresentPropertyManager*, SEL) _LOGOS_RETURN_RETAINED; static AWELiveFreePresentPropertyManager* _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$init(_LOGOS_SELF_TYPE_INIT AWELiveFreePresentPropertyManager*, SEL) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$AWELiveGiftListViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveGiftListViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELiveGiftListViewController$refreshWalletCoins)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveGiftListViewController$refreshWalletCoins(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELiveGiftListViewController$didFinishSendPresentRequestWithTotalCoins$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, long long); static void _logos_method$_ungrouped$AWELiveGiftListViewController$didFinishSendPresentRequestWithTotalCoins$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, long long); static void (*_logos_orig$_ungrouped$AWELiveGiftListViewController$didSendPresent$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWELiveGiftListViewController$didSendPresent$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWELiveGiftListViewController$collectionView$didSelectItemAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWELiveGiftListViewController$collectionView$didSelectItemAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$AWELiveGiftListViewController$_handleFansProcess$presentCoins$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, id, long long); static void _logos_method$_ungrouped$AWELiveGiftListViewController$_handleFansProcess$presentCoins$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, id, long long); static void (*_logos_orig$_ungrouped$AWELiveGiftListViewController$_fetchGiftListDataAndReloadUI$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, _Bool); static void _logos_method$_ungrouped$AWELiveGiftListViewController$_fetchGiftListDataAndReloadUI$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, _Bool); static void (*_logos_orig$_ungrouped$AWELiveGiftListViewController$rechargeClicked$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWELiveGiftListViewController$rechargeClicked$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWELiveGiftListViewController$rechargeSuccessNotiAction)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveGiftListViewController$rechargeSuccessNotiAction(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$MTLModel$validate$)(_LOGOS_SELF_TYPE_NORMAL MTLModel* _LOGOS_SELF_CONST, SEL, id *); static _Bool _logos_method$_ungrouped$MTLModel$validate$(_LOGOS_SELF_TYPE_NORMAL MTLModel* _LOGOS_SELF_CONST, SEL, id *); static void (*_logos_meta_orig$_ungrouped$AWELiveWalletManager$alertForNobalance$triggerReason$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, id); static void _logos_meta_method$_ungrouped$AWELiveWalletManager$alertForNobalance$triggerReason$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, id); static id (*_logos_meta_orig$_ungrouped$AWELiveWalletManager$_getWalletWebURL$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, _Bool); static id _logos_meta_method$_ungrouped$AWELiveWalletManager$_getWalletWebURL$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, _Bool); static void (*_logos_meta_orig$_ungrouped$AWELiveWalletManager$transitionToWalletPageFrom$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, _Bool); static void _logos_meta_method$_ungrouped$AWELiveWalletManager$transitionToWalletPageFrom$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, _Bool); static void (*_logos_meta_orig$_ungrouped$AWELiveWalletManager$getMyWalletWithFinishBlock$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static void _logos_meta_method$_ungrouped$AWELiveWalletManager$getMyWalletWithFinishBlock$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static id (*_logos_meta_orig$_ungrouped$AWELiveMyWalletModel$userJSONTransformer)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$AWELiveMyWalletModel$userJSONTransformer(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$AWELiveMyWalletModel$JSONKeyPathsByPropertyKey)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$AWELiveMyWalletModel$JSONKeyPathsByPropertyKey(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$AWEAppShareSettingManager$downloadForbiddenToast)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$AWEAppShareSettingManager$downloadForbiddenToast(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEAppShareSettingManager$selfSeeingShouldForbidWaterMarkWhenDownload)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEAppShareSettingManager$selfSeeingShouldForbidWaterMarkWhenDownload(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEAppShareSettingManager$forbidDownloadLocal)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEAppShareSettingManager$forbidDownloadLocal(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEAppShareSettingManager$downloadCheckStatus)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEAppShareSettingManager$downloadCheckStatus(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEAwemeShareViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeShareViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemeShareViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWEAwemeShareViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEAwemeShareViewController$hideItemIfNeed$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeShareViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWEAwemeShareViewController$hideItemIfNeed$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeShareViewController* _LOGOS_SELF_CONST, SEL, id); static _Bool (*_logos_orig$_ungrouped$AWEAwemeShareViewController$p_unreviewedVideoToLink$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeShareViewController* _LOGOS_SELF_CONST, SEL, long long); static _Bool _logos_method$_ungrouped$AWEAwemeShareViewController$p_unreviewedVideoToLink$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeShareViewController* _LOGOS_SELF_CONST, SEL, long long); static void (*_logos_orig$_ungrouped$AWECommentListViewController$sendCommentContent$inputView$)(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWECommentListViewController$sendCommentContent$inputView$(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST, SEL, id, id); static _Bool (*_logos_orig$_ungrouped$AWECommentListViewController$userTappedSendWithContent$inputView$)(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST, SEL, id, id); static _Bool _logos_method$_ungrouped$AWECommentListViewController$userTappedSendWithContent$inputView$(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST, SEL, id, id); static _Bool (*_logos_orig$_ungrouped$AWECommentListViewController$commentInputViewShouldReturn$)(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST, SEL, id); static _Bool _logos_method$_ungrouped$AWECommentListViewController$commentInputViewShouldReturn$(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWECommentListViewController$didCommentSuccessWithCommentModel$replyID$)(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWECommentListViewController$didCommentSuccessWithCommentModel$replyID$(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$AWECommentListViewController$didCommentSuccessWithCommentModel$)(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWECommentListViewController$didCommentSuccessWithCommentModel$(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST, SEL, id); static AWEUserPostsDataManager* (*_logos_orig$_ungrouped$AWEUserPostsDataManager$initWithUserID$)(_LOGOS_SELF_TYPE_INIT AWEUserPostsDataManager*, SEL, NSString *) _LOGOS_RETURN_RETAINED; static AWEUserPostsDataManager* _logos_method$_ungrouped$AWEUserPostsDataManager$initWithUserID$(_LOGOS_SELF_TYPE_INIT AWEUserPostsDataManager*, SEL, NSString *) _LOGOS_RETURN_RETAINED; static id (*_logos_orig$_ungrouped$AWEPostWorkViewController$aweui_emptyPageConfigForState$)(_LOGOS_SELF_TYPE_NORMAL AWEPostWorkViewController* _LOGOS_SELF_CONST, SEL, unsigned long long); static id _logos_method$_ungrouped$AWEPostWorkViewController$aweui_emptyPageConfigForState$(_LOGOS_SELF_TYPE_NORMAL AWEPostWorkViewController* _LOGOS_SELF_CONST, SEL, unsigned long long); static UICollectionViewCell * (*_logos_orig$_ungrouped$AWEPostWorkViewController$collectionView$cellForItemAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL AWEPostWorkViewController* _LOGOS_SELF_CONST, SEL, UICollectionView *, NSIndexPath *); static UICollectionViewCell * _logos_method$_ungrouped$AWEPostWorkViewController$collectionView$cellForItemAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWEPostWorkViewController* _LOGOS_SELF_CONST, SEL, UICollectionView *, NSIndexPath *); static void (*_logos_orig$_ungrouped$AWEUserDetailViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEUserDetailViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEUserDetailViewController$updateInfoLabel(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWEUserDetailViewController$_shouldHideTabNum)(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEUserDetailViewController$_shouldHideTabNum(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWEUserDetailViewController$_shouldShowLikeTab)(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEUserDetailViewController$_shouldShowLikeTab(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEUserDetailViewController$privateAccountInfoViewController$didScroll$)(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL, id, struct CGPoint); static void _logos_method$_ungrouped$AWEUserDetailViewController$privateAccountInfoViewController$didScroll$(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL, id, struct CGPoint); static void (*_logos_orig$_ungrouped$AWEUserWorkCollectionViewCell$_setupUI)(_LOGOS_SELF_TYPE_NORMAL AWEUserWorkCollectionViewCell* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEUserWorkCollectionViewCell$_setupUI(_LOGOS_SELF_TYPE_NORMAL AWEUserWorkCollectionViewCell* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEUserWorkCollectionViewCell$configWithModel$isMine$)(_LOGOS_SELF_TYPE_NORMAL AWEUserWorkCollectionViewCell* _LOGOS_SELF_CONST, SEL, AWEAwemeModel *, _Bool); static void _logos_method$_ungrouped$AWEUserWorkCollectionViewCell$configWithModel$isMine$(_LOGOS_SELF_TYPE_NORMAL AWEUserWorkCollectionViewCell* _LOGOS_SELF_CONST, SEL, AWEAwemeModel *, _Bool); static void (*_logos_orig$_ungrouped$AWEUserWorkCollectionViewCell$configWithModel$)(_LOGOS_SELF_TYPE_NORMAL AWEUserWorkCollectionViewCell* _LOGOS_SELF_CONST, SEL, AWEAwemeModel *); static void _logos_method$_ungrouped$AWEUserWorkCollectionViewCell$configWithModel$(_LOGOS_SELF_TYPE_NORMAL AWEUserWorkCollectionViewCell* _LOGOS_SELF_CONST, SEL, AWEAwemeModel *); static id (*_logos_meta_orig$_ungrouped$AWEAwemeDetailTableViewController$detailTableViewControllerWithDataController$initialIndex$referString$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, long long, id); static id _logos_meta_method$_ungrouped$AWEAwemeDetailTableViewController$detailTableViewControllerWithDataController$initialIndex$referString$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, long long, id); static void (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$isActive)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEAwemeDetailTableViewController$isActive(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$playIfActive)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$playIfActive(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$videoDownloadFinished)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$videoDownloadFinished(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$deleteAwemeWithIDs$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$deleteAwemeWithIDs$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, id); static _Bool (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$awesst_isVideoPlayViewController)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEAwemeDetailTableViewController$awesst_isVideoPlayViewController(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$awesst_additionalTrackerParams)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$AWEAwemeDetailTableViewController$awesst_additionalTrackerParams(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$reloadDataForDataControllerChange)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$reloadDataForDataControllerChange(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$_onAwemeDeleted$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$_onAwemeDeleted$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$_onAwemeDeleteNotification$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$_onAwemeDeleteNotification$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, id); static unsigned long long (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$_currentVisibleCellIndex)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static unsigned long long _logos_method$_ungrouped$AWEAwemeDetailTableViewController$_currentVisibleCellIndex(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$videoVoteFinished)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$videoVoteFinished(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$setFeedColumntypeIfNeeded)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$setFeedColumntypeIfNeeded(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$loadmore)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$loadmore(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$initialFetch)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$initialFetch(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$initialFetchWithIDs$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$initialFetchWithIDs$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$addLoadMoreIfNeeded)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$addLoadMoreIfNeeded(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$preloadImageForAweme$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$preloadImageForAweme$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$preloadCoverImageWithIndexPath$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, NSIndexPath *); static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$preloadCoverImageWithIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, NSIndexPath *); static id (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$awesst_enterFrom)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$AWEAwemeDetailTableViewController$awesst_enterFrom(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$awemeModelWithIndex$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, long long); static id _logos_method$_ungrouped$AWEAwemeDetailTableViewController$awemeModelWithIndex$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, long long); static AWEAwemeDetailTableViewController* (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$initWithDataController$IDs$initialIndex$referString$)(_LOGOS_SELF_TYPE_INIT AWEAwemeDetailTableViewController*, SEL, id, id, long long, id) _LOGOS_RETURN_RETAINED; static AWEAwemeDetailTableViewController* _logos_method$_ungrouped$AWEAwemeDetailTableViewController$initWithDataController$IDs$initialIndex$referString$(_LOGOS_SELF_TYPE_INIT AWEAwemeDetailTableViewController*, SEL, id, id, long long, id) _LOGOS_RETURN_RETAINED; static AWEAwemeDetailTableViewController* (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$initWithDataController$initialIndex$referString$logExtraDict$)(_LOGOS_SELF_TYPE_INIT AWEAwemeDetailTableViewController*, SEL, id, long long, id, id) _LOGOS_RETURN_RETAINED; static AWEAwemeDetailTableViewController* _logos_method$_ungrouped$AWEAwemeDetailTableViewController$initWithDataController$initialIndex$referString$logExtraDict$(_LOGOS_SELF_TYPE_INIT AWEAwemeDetailTableViewController*, SEL, id, long long, id, id) _LOGOS_RETURN_RETAINED; static AWEAwemeDetailTableViewController* (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$initWithDataController$initialIndex$referString$)(_LOGOS_SELF_TYPE_INIT AWEAwemeDetailTableViewController*, SEL, id, long long, id) _LOGOS_RETURN_RETAINED; static AWEAwemeDetailTableViewController* _logos_method$_ungrouped$AWEAwemeDetailTableViewController$initWithDataController$initialIndex$referString$(_LOGOS_SELF_TYPE_INIT AWEAwemeDetailTableViewController*, SEL, id, long long, id) _LOGOS_RETURN_RETAINED; static UITableViewCell * (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$tableView$cellForRowAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, UITableView *, NSIndexPath *); static UITableViewCell * _logos_method$_ungrouped$AWEAwemeDetailTableViewController$tableView$cellForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, UITableView *, NSIndexPath *); static void (*_logos_orig$_ungrouped$AWELongVideoPlayerInteractionView$doActionIfNotValidWithText$)(_LOGOS_SELF_TYPE_NORMAL AWELongVideoPlayerInteractionView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWELongVideoPlayerInteractionView$doActionIfNotValidWithText$(_LOGOS_SELF_TYPE_NORMAL AWELongVideoPlayerInteractionView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWELongVideoPlayerInteractionView$doActionIfNotValid)(_LOGOS_SELF_TYPE_NORMAL AWELongVideoPlayerInteractionView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELongVideoPlayerInteractionView$doActionIfNotValid(_LOGOS_SELF_TYPE_NORMAL AWELongVideoPlayerInteractionView* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWELongVideoPlayerInteractionView$alertIfNotValid)(_LOGOS_SELF_TYPE_NORMAL AWELongVideoPlayerInteractionView* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWELongVideoPlayerInteractionView$alertIfNotValid(_LOGOS_SELF_TYPE_NORMAL AWELongVideoPlayerInteractionView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEPlayVideoViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEPlayVideoViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEPlayVideoViewController$player$noVideoDataToDownloadForURL$)(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWEPlayVideoViewController$player$noVideoDataToDownloadForURL$(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$AWEPlayVideoViewController$player$didFinishVideoDataDownloadForURL$)(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWEPlayVideoViewController$player$didFinishVideoDataDownloadForURL$(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$AWEPlayVideoViewController$player$didChangeStallState$)(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL, id, long long); static void _logos_method$_ungrouped$AWEPlayVideoViewController$player$didChangeStallState$(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL, id, long long); static void (*_logos_orig$_ungrouped$AWEPlayVideoViewController$player$playbackFailedWithError$)(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWEPlayVideoViewController$player$playbackFailedWithError$(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$AWEPlayVideoViewController$player$playbackFailedForURL$error$)(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL, id, id, id); static void _logos_method$_ungrouped$AWEPlayVideoViewController$player$playbackFailedForURL$error$(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL, id, id, id); static _Bool (*_logos_orig$_ungrouped$AWEPlayVideoViewController$_alertIfNotValid)(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEPlayVideoViewController$_alertIfNotValid(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWEPlayVideoViewController$alertIfNotValid)(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEPlayVideoViewController$alertIfNotValid(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWEPlayVideoViewController$videoShouldPlay)(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEPlayVideoViewController$videoShouldPlay(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEPlayVideoViewController$observeValueForKeyPath$ofObject$change$context$)(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL, id, id, id, void *); static void _logos_method$_ungrouped$AWEPlayVideoViewController$observeValueForKeyPath$ofObject$change$context$(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL, id, id, id, void *); static long long (*_logos_orig$_ungrouped$AWEPlayVideoViewController$contentModeForDefaultVideoCover)(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL); static long long _logos_method$_ungrouped$AWEPlayVideoViewController$contentModeForDefaultVideoCover(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWEPlayVideoViewController$isActive)(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEPlayVideoViewController$isActive(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$AWEPlayVideoViewController$getPlayModeWithAutoPlayMode)(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$AWEPlayVideoViewController$getPlayModeWithAutoPlayMode(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$AWEPlayVideoViewController$_getVideoPlayQualityParams)(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$AWEPlayVideoViewController$_getVideoPlayQualityParams(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWEAwemePlayVideoViewController$videoShouldPlay)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEAwemePlayVideoViewController$videoShouldPlay(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWEAwemePlayVideoViewController$alertIfNotValid)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEAwemePlayVideoViewController$alertIfNotValid(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWEAwemePlayVideoViewController$pause)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEAwemePlayVideoViewController$pause(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWEAwemePlayVideoViewController$stop)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEAwemePlayVideoViewController$stop(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWEAwemePlayVideoViewController$play)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEAwemePlayVideoViewController$play(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEAwemePlayVideoViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemePlayVideoViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEAwemePlayVideoViewController$player$playbackFailedWithError$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWEAwemePlayVideoViewController$player$playbackFailedWithError$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$AWEAwemePlayVideoViewController$playerWillLoopPlaying$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWEAwemePlayVideoViewController$playerWillLoopPlaying$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWEAwemePlayVideoViewController$checkAdVideo)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemePlayVideoViewController$checkAdVideo(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELikeWorkViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL AWELikeWorkViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELikeWorkViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWELikeWorkViewController* _LOGOS_SELF_CONST, SEL); static UICollectionViewCell * (*_logos_orig$_ungrouped$AWELikeWorkViewController$collectionView$cellForItemAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL AWELikeWorkViewController* _LOGOS_SELF_CONST, SEL, UICollectionView *, NSIndexPath *); static UICollectionViewCell * _logos_method$_ungrouped$AWELikeWorkViewController$collectionView$cellForItemAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWELikeWorkViewController* _LOGOS_SELF_CONST, SEL, UICollectionView *, NSIndexPath *); static void (*_logos_orig$_ungrouped$AWELikeWorkViewController$collectionView$didSelectItemAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL AWELikeWorkViewController* _LOGOS_SELF_CONST, SEL, UICollectionView *, NSIndexPath *); static void _logos_method$_ungrouped$AWELikeWorkViewController$collectionView$didSelectItemAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWELikeWorkViewController* _LOGOS_SELF_CONST, SEL, UICollectionView *, NSIndexPath *); static _Bool (*_logos_orig$_ungrouped$AWEAwemeModel$canBeReposted)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEAwemeModel$canBeReposted(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWEAwemeModel$videoCommentStauts)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEAwemeModel$videoCommentStauts(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$alertIfCanNotComment)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$alertIfCanNotComment(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWEAwemeBaseViewController$alertIfNotValid)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeBaseViewController* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEAwemeBaseViewController$alertIfNotValid(_LOGOS_SELF_TYPE_NORMAL AWEAwemeBaseViewController* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$AWEFeedVideoButton(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("AWEFeedVideoButton"); } return _klass; }
#line 231 "/Users/michael/Unicorn/Unicorn/Unicorn.xm"

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








static void _logos_method$_ungrouped$AWELiveSendGiftControllerDelegate$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftControllerDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWELiveSendGiftControllerDelegate$viewDidLoad(self, _cmd);
    NSLog(@"Inside viewDidLoad AWELiveSendGiftControllerDelegate");
}
static void _logos_method$_ungrouped$AWELiveSendGiftControllerDelegate$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftControllerDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UILongPressGestureRecognizer* sender) {
    NSLog(@"Hangle longpress");
    _logos_orig$_ungrouped$AWELiveSendGiftControllerDelegate$handleLongPress$(self, _cmd, sender);
}
static void _logos_method$_ungrouped$AWELiveSendGiftControllerDelegate$listSubviewsOfView$(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftControllerDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIView * view) {
    _logos_orig$_ungrouped$AWELiveSendGiftControllerDelegate$listSubviewsOfView$(self, _cmd, view);
    NSLog(@"listSubviewsOfView..");
}










































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


static _Bool _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$disableNewPayment(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool val = _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$disableNewPayment(self, _cmd);
    NSLog(@"[AWEAppLiveSettingManager disableNewPayment], returnValue: %d", val);
    return _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$disableNewPayment(self, _cmd);
}

static id _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$newWalletConf(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    id val = _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$newWalletConf(self, _cmd);
    NSLog(@"[AWEAppLiveSettingManager newWalletConf], returnValue: %@", val);
    return _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$newWalletConf(self, _cmd);
}
static _Bool _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$showSkylightAnimation(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool val = _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$showSkylightAnimation(self, _cmd);
    NSLog(@"[AWEAppLiveSettingManager showSkylightAnimation], returnValue: %d", val);
    return _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$showSkylightAnimation(self, _cmd);
}
static _Bool _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$disableLiveCDNNodeSelection(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool val = _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$disableLiveCDNNodeSelection(self, _cmd);
    NSLog(@"[AWEAppLiveSettingManager disableLiveCDNNodeSelection], returnValue: %d", val);
    return _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$disableLiveCDNNodeSelection(self, _cmd);
}

static _Bool _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$isLivePodcast(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool val = _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$isLivePodcast(self, _cmd);
    NSLog(@"[AWEAppLiveSettingManager isLivePodcast], returnValue: %d", val);
    return _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$isLivePodcast(self, _cmd);
}
static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveResH(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    double val = _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveResH(self, _cmd);
    NSLog(@"[AWEAppLiveSettingManager liveResH], returnValue: %lf", val);
    return _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveResH(self, _cmd);
}
static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveResW(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    double val = _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveResW(self, _cmd);
    NSLog(@"[AWEAppLiveSettingManager liveResW], returnValue: %lf", val);
    return _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveResW(self, _cmd);
}
static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveFps(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    double val = _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveFps(self, _cmd);
    NSLog(@"[AWEAppLiveSettingManager liveFps], returnValue: %lf", val);
    return _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveFps(self, _cmd);
}
static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveMinBitrate(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    double val = _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveMinBitrate(self, _cmd);
    NSLog(@"[AWEAppLiveSettingManager liveMinBitrate], returnValue: %lf", val);
    return _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveMinBitrate(self, _cmd);
}
static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveMaxBitrate(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    double val = _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveMaxBitrate(self, _cmd);
    NSLog(@"[AWEAppLiveSettingManager liveMaxBitrate], returnValue: %lf", val);
    return _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveMaxBitrate(self, _cmd);
}
static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveDefaultBitrate(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    double val = _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveDefaultBitrate(self, _cmd);
    NSLog(@"[AWEAppLiveSettingManager liveDefaultBitrate], returnValue: %lf", val);
    return _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveDefaultBitrate(self, _cmd);
}




@interface AWELiveSetting : NSObject
+ (_Bool)shouldCheckCoins:(_Bool)arg1;
+ (void)setBarrageCoins:(long long)arg1;
+ (long long)barrageCoins;
+ (void)setUserAllCoins:(long long)arg1;
+ (long long)userAllCoins;
@end




static _Bool _logos_meta_method$_ungrouped$AWELiveSetting$shouldCheckCoins$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
    
    return _logos_meta_orig$_ungrouped$AWELiveSetting$shouldCheckCoins$(self, _cmd, arg1);
}
static void _logos_meta_method$_ungrouped$AWELiveSetting$setBarrageCoins$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long arg1) {
    NSLog(@"setBarrageCoins, %lld", arg1);
    _logos_meta_orig$_ungrouped$AWELiveSetting$setBarrageCoins$(self, _cmd, arg1);
}

static long long _logos_meta_method$_ungrouped$AWELiveSetting$barrageCoins(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"barrageCoins");
    return _logos_meta_orig$_ungrouped$AWELiveSetting$barrageCoins(self, _cmd);
}


static void _logos_meta_method$_ungrouped$AWELiveSetting$setUserAllCoins$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long arg1) {
    arg1 = 10000000;
    
    
    
    _logos_meta_orig$_ungrouped$AWELiveSetting$setUserAllCoins$(self, _cmd, arg1);
}

static long long _logos_meta_method$_ungrouped$AWELiveSetting$userAllCoins(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    long long val = _logos_meta_orig$_ungrouped$AWELiveSetting$userAllCoins(self, _cmd);
    
    
    
    
    
    return _logos_meta_orig$_ungrouped$AWELiveSetting$userAllCoins(self, _cmd);
}




@interface AWELiveTrackEventManager : NSObject
+ (void)trackLiveClickPresent:(id)arg1 isAnchor:(_Bool)arg2 enterFrom:(id)arg3 presentID:(id)arg4 presentCoins:(id)arg5;
+ (void)trackLiveSendPresentSuccess:(id)arg1 isAnchor:(_Bool)arg2 enterFrom:(id)arg3 presentID:(id)arg4 presentCoins:(id)arg5;
@end




static void _logos_meta_method$_ungrouped$AWELiveTrackEventManager$trackLiveClickPresent$isAnchor$enterFrom$presentID$presentCoins$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, _Bool arg2, id arg3, id arg4, id arg5) {
    _logos_meta_orig$_ungrouped$AWELiveTrackEventManager$trackLiveClickPresent$isAnchor$enterFrom$presentID$presentCoins$(self, _cmd, arg1, arg2, arg3, arg4, arg5);
    
    
    NSLog(@"trackLiveClickPresent");
    
}
static void _logos_meta_method$_ungrouped$AWELiveTrackEventManager$trackLiveSendPresentSuccess$isAnchor$enterFrom$presentID$presentCoins$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, _Bool arg2, id arg3, id arg4, id arg5) {
    _logos_meta_orig$_ungrouped$AWELiveTrackEventManager$trackLiveSendPresentSuccess$isAnchor$enterFrom$presentID$presentCoins$(self, _cmd, arg1, arg2, arg3, arg4, arg5);
    NSLog(@"trackLiveSendPresentSuccess!!");
}










































@interface AWELiveSendGiftPackage : NSObject
- (void)resetWithPresent:(id)arg1;
@property(copy, nonatomic) NSString *requestId; 
@property(nonatomic) long long count; 
@property(nonatomic) long long coins; 
@property(nonatomic) long long pid; 
@end



static void _logos_method$_ungrouped$AWELiveSendGiftPackage$resetWithPresent$(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftPackage* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    
    NSLog(@"resetWithPresent, arg1: %@", NSStringFromClass([arg1 class]));
    NSLog(@"count: %lld, coins: %lld, pid: %lld", self.count, self.coins, self.pid);
    NSLog(@"******");
    
    
    _logos_orig$_ungrouped$AWELiveSendGiftPackage$resetWithPresent$(self, _cmd, arg1);
}




























































static AWELiveRoomModel* _logos_method$_ungrouped$AWELiveRoomModel$initWithRoomID$(_LOGOS_SELF_TYPE_INIT AWELiveRoomModel* __unused self, SEL __unused _cmd, id arg1) _LOGOS_RETURN_RETAINED {
    
    long long modifiedVal = 100000;
    
    
    
    NSLog(@"[AWELiveRoomModel] inSandBox: %d, coins: %lld, totalUserCount: %lld, diggCount: %lld, isRequestedCoverImage: %d", self.inSandBox, self.coins, self.totalUserCount,self.diggCount, self.isRequestedCoverImage);
    
    return _logos_orig$_ungrouped$AWELiveRoomModel$initWithRoomID$(self, _cmd, arg1);
}







static AWELivePresentModel* _logos_method$_ungrouped$AWELivePresentModel$copyWithZone$(_LOGOS_SELF_TYPE_NORMAL AWELivePresentModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, struct _NSZone * arg1) _LOGOS_RETURN_RETAINED {
    id val = _logos_orig$_ungrouped$AWELivePresentModel$copyWithZone$(self, _cmd, arg1);
    
    
    
    return _logos_orig$_ungrouped$AWELivePresentModel$copyWithZone$(self, _cmd, arg1);
}
static id _logos_method$_ungrouped$AWELivePresentModel$fakeIconName(_LOGOS_SELF_TYPE_NORMAL AWELivePresentModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    id val = _logos_orig$_ungrouped$AWELivePresentModel$fakeIconName(self, _cmd);
    NSLog(@"fakeIconName...coins: %lld", self.coin);
    NSLog(@"%@", NSStringFromClass([val class]));
    return _logos_orig$_ungrouped$AWELivePresentModel$fakeIconName(self, _cmd);
}
static _Bool _logos_method$_ungrouped$AWELivePresentModel$isFakePresent(_LOGOS_SELF_TYPE_NORMAL AWELivePresentModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool val = _logos_orig$_ungrouped$AWELivePresentModel$isFakePresent(self, _cmd);
    
    
    return _logos_orig$_ungrouped$AWELivePresentModel$isFakePresent(self, _cmd);
}
static _Bool _logos_method$_ungrouped$AWELivePresentModel$isVideoPresent(_LOGOS_SELF_TYPE_NORMAL AWELivePresentModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool val = _logos_orig$_ungrouped$AWELivePresentModel$isVideoPresent(self, _cmd);
    
    return _logos_orig$_ungrouped$AWELivePresentModel$isVideoPresent(self, _cmd);
}

static _Bool _logos_method$_ungrouped$AWELivePresentModel$isAwemePresent(_LOGOS_SELF_TYPE_NORMAL AWELivePresentModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool val = _logos_orig$_ungrouped$AWELivePresentModel$isAwemePresent(self, _cmd);
    
    
    return _logos_orig$_ungrouped$AWELivePresentModel$isAwemePresent(self, _cmd);
}

static _Bool _logos_method$_ungrouped$AWELivePresentModel$isResourcePresent(_LOGOS_SELF_TYPE_NORMAL AWELivePresentModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool val = _logos_orig$_ungrouped$AWELivePresentModel$isResourcePresent(self, _cmd);
    
    
    return _logos_orig$_ungrouped$AWELivePresentModel$isResourcePresent(self, _cmd);
}



@interface AWELiveGiftListDataController : NSObject


- (void)sendPresent:(id)arg1 presentID:(id)arg2 count:(long long)arg3 completion:(id)arg4;
- (void)filterDisplayPresentList;
- (void)_getFreePresentListWithPresentList:(id)arg1 completion:(id)arg2;
- (void)getSandBoxGiftListModel:(id)arg1 completion:(id)arg2;
- (void)getGiftListModelWithCompletion:(id)arg1 roomID:(id)arg2;
- (void)getGiftListModelWithRoom:(id)arg1 completion:(id)arg2;
@end




static void _logos_method$_ungrouped$AWELiveGiftListDataController$sendPresent$presentID$count$completion$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, long long arg3, id arg4) {
    
    
    NSLog(@"sendPresent.. arg1: %@, arg2: %@, arg3: %lld", arg1, arg2, arg3);
    
    _logos_orig$_ungrouped$AWELiveGiftListDataController$sendPresent$presentID$count$completion$(self, _cmd, arg1, arg2, arg3, NULL);
    
}
static void _logos_method$_ungrouped$AWELiveGiftListDataController$filterDisplayPresentList(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"filterDisplayPresentList");
    _logos_orig$_ungrouped$AWELiveGiftListDataController$filterDisplayPresentList(self, _cmd);
}

static void _logos_method$_ungrouped$AWELiveGiftListDataController$_getFreePresentListWithPresentList$completion$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    
    _logos_orig$_ungrouped$AWELiveGiftListDataController$_getFreePresentListWithPresentList$completion$(self, _cmd, arg1, arg2);
}
static void _logos_method$_ungrouped$AWELiveGiftListDataController$getSandBoxGiftListModel$completion$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    NSLog(@"getSandBoxGiftListModel.. arg1: %@, arg2: %@", arg1, arg2);
    _logos_orig$_ungrouped$AWELiveGiftListDataController$getSandBoxGiftListModel$completion$(self, _cmd, arg1, arg2);
}

static void _logos_method$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithCompletion$roomID$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    
    _logos_orig$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithCompletion$roomID$(self, _cmd, arg1, arg2);
}

static void _logos_method$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithRoom$completion$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    
    _logos_orig$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithRoom$completion$(self, _cmd, arg1, arg2);
}





@interface AWELiveSendGiftController : NSObject
@property(nonatomic) _Bool isDuringSendCollecting; 
@property(nonatomic) _Bool isDuringClickCollecting; 

@property(retain, nonatomic) AWELiveGiftListDataController *dataController; 
@property(retain, nonatomic) AWELiveRoomModel *roomModel;
- (_Bool)isAnchor;
- (void)_performSendRequest;
- (void)_prepareSendRequestWithPresent:(id)arg1;
- (void)_performClickTrack;
- (void)_prepareClickTrackWithPreseent:(id)arg1;
- (void)willSendGiftInCollectionView:(id)arg1 atIndexPath:(id)arg2;
@end




static _Bool _logos_method$_ungrouped$AWELiveSendGiftController$isAnchor(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool val = _logos_orig$_ungrouped$AWELiveSendGiftController$isAnchor(self, _cmd);
    NSLog(@"isAnchor: %d", val);
    return _logos_orig$_ungrouped$AWELiveSendGiftController$isAnchor(self, _cmd);
}

static void _logos_method$_ungrouped$AWELiveSendGiftController$_performSendRequest(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"_performSendRequest");
    _logos_orig$_ungrouped$AWELiveSendGiftController$_performSendRequest(self, _cmd);
}

static void _logos_method$_ungrouped$AWELiveSendGiftController$_prepareSendRequestWithPresent$(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    
    NSLog(@"_prepareSendRequestWithPresent: arg1: %@", arg1);
    
    _logos_orig$_ungrouped$AWELiveSendGiftController$_prepareSendRequestWithPresent$(self, _cmd, arg1);
}

static void _logos_method$_ungrouped$AWELiveSendGiftController$_performClickTrack(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"_performClickTrack");
    _logos_orig$_ungrouped$AWELiveSendGiftController$_performClickTrack(self, _cmd);
}


static void _logos_method$_ungrouped$AWELiveSendGiftController$_prepareClickTrackWithPreseent$(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    NSLog(@"_prepareClickTrackWithPreseent: arg1: %@", arg1);
    
    _logos_orig$_ungrouped$AWELiveSendGiftController$_prepareClickTrackWithPreseent$(self, _cmd, arg1);
}


static void _logos_method$_ungrouped$AWELiveSendGiftController$willSendGiftInCollectionView$atIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    
    NSLog(@"willSendGiftInCollectionView: arg1: %@, arg2: %@", arg1, arg2);
    
    _logos_orig$_ungrouped$AWELiveSendGiftController$willSendGiftInCollectionView$atIndexPath$(self, _cmd, arg1, arg2);
}


@interface AWELiveGiftListBottomLandscapeView : UIView
- (void)refreshWalletCoins:(long long)arg1;
@end


static void _logos_method$_ungrouped$AWELiveGiftListBottomLandscapeView$refreshWalletCoins$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListBottomLandscapeView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long arg1) {
    long long val = arg1;
    NSLog(@"refreshWalletCoins, arg1: %lld", val);
    _logos_orig$_ungrouped$AWELiveGiftListBottomLandscapeView$refreshWalletCoins$(self, _cmd, arg1);
}



@interface AWELiveGiftFansEnterView : UIView
- (void)handleProcessWithIntimacy:(id)arg1 presentCoins:(long long)arg2 animationFinishBlock:(id)arg3;
@end


static void _logos_method$_ungrouped$AWELiveGiftFansEnterView$handleProcessWithIntimacy$presentCoins$animationFinishBlock$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftFansEnterView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, long long arg2, id arg3) {
    NSLog(@"handleProcessWithIntimacy, arg1: %@, coins: %lld", arg1, arg2);
    NSLog(@"handleProcessWithIntimacy, arg1 Type: %@", NSStringFromClass([arg1 class]));
    
    _logos_orig$_ungrouped$AWELiveGiftFansEnterView$handleProcessWithIntimacy$presentCoins$animationFinishBlock$(self, _cmd, arg1, arg2, arg3);
    
}




@interface AWELiveFreePresentPropertyManager : NSObject
@property(nonatomic) long long coins; 
+ (id)sharedInstace;

- (void)_consumeFansFreePresentWithPresentId:(id)arg1 count:(long long)arg2;
- (void)setFansFreePresent:(id)arg1;
- (void)consumeFreePresentWithPresentId:(id)arg1 propertIDs:(id)arg2 count:(long long)arg3;
- (id)useFreePresentWithPresentId:(id)arg1 count:(long long)arg2;
- (long long)freeCountForPresentId:(id)arg1;
- (void)fetchFreePresentListWithCompletion:(id)arg1;
- (id)init;
@end


static void _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$_consumeFansFreePresentWithPresentId$count$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, long long arg2) {
    NSLog(@"_consumeFansFreePresentWithPresentId... coins: %lld", self.coins);
    _logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$_consumeFansFreePresentWithPresentId$count$(self, _cmd, arg1, arg2);
}

static void _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$setFansFreePresent$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    
    _logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$setFansFreePresent$(self, _cmd, arg1);
}
static void _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$consumeFreePresentWithPresentId$propertIDs$count$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, long long arg3) {
    NSLog(@"consumeFreePresentWithPresentId... coins: %lld", self.coins);
    _logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$consumeFreePresentWithPresentId$propertIDs$count$(self, _cmd, arg1, arg2, arg3);
}

static id _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$useFreePresentWithPresentId$count$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, long long arg2) {
    
    
    
    return _logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$useFreePresentWithPresentId$count$(self, _cmd, arg1, arg2);
}

static long long _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$freeCountForPresentId$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    
    
    return _logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$freeCountForPresentId$(self, _cmd, arg1);
}
static void _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$fetchFreePresentListWithCompletion$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    NSLog(@"fetchFreePresentListWithCompletion... coins: %lld", self.coins);
    _logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$fetchFreePresentListWithCompletion$(self, _cmd, arg1);
}

static AWELiveFreePresentPropertyManager* _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$init(_LOGOS_SELF_TYPE_INIT AWELiveFreePresentPropertyManager* __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {
    NSLog(@"init... coins: %lld", self.coins);
    
    return _logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$init(self, _cmd);
}




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
@property(retain, nonatomic) AWELiveSendGiftController *sendGiftController; 
@property(retain, nonatomic) AWELiveGiftListDataController *dataController; 
@property(nonatomic, assign) id <AWELiveSendGiftControllerDelegate> delegate; 


@end




static void _logos_method$_ungrouped$AWELiveGiftListViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWELiveGiftListViewController$viewDidLoad(self, _cmd);
    
    NSLog(@"**********************");
    NSLog(@"LiveGiftController viewDidLoad");
    NSLog(@"coins: %lld, isSandBox: %d, totalUserCount: %lld, diggCount: %lld, isRequestedCoverImage: %d", self.sendGiftController.roomModel.coins, self.sendGiftController.roomModel.inSandBox, self.sendGiftController.roomModel.totalUserCount, self.sendGiftController.roomModel.diggCount,self.sendGiftController.roomModel.isRequestedCoverImage);
    
    
    
    
    NSLog(@"LiveGiftController Finished **********************");
}
static void _logos_method$_ungrouped$AWELiveGiftListViewController$refreshWalletCoins(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWELiveGiftListViewController$refreshWalletCoins(self, _cmd);
    NSLog(@"refreshWalletCoins");
}
static void _logos_method$_ungrouped$AWELiveGiftListViewController$didFinishSendPresentRequestWithTotalCoins$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long arg1) {
    _logos_orig$_ungrouped$AWELiveGiftListViewController$didFinishSendPresentRequestWithTotalCoins$(self, _cmd, arg1);
    NSLog(@"didFinishSendPresentRequestWithTotalCoins: totalCoins%lld", arg1);
}

static void _logos_method$_ungrouped$AWELiveGiftListViewController$didSendPresent$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    _logos_orig$_ungrouped$AWELiveGiftListViewController$didSendPresent$(self, _cmd, arg1);
    NSLog(@"didSendPresent, %@",NSStringFromClass([arg1 class]));
}

static void _logos_method$_ungrouped$AWELiveGiftListViewController$collectionView$didSelectItemAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    
    NSLog(@"didSelectItem");
    
    
    
    
    
    
    
    
    
    
    
    
    [self.sendGiftController willSendGiftInCollectionView:arg1 atIndexPath:arg2]; 
    
    
}
static void _logos_method$_ungrouped$AWELiveGiftListViewController$_handleFansProcess$presentCoins$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, long long arg2) {
    NSLog(@"_handleFansProcess...arg1: %@, presentCOins: %lld", arg1, arg2);
    _logos_orig$_ungrouped$AWELiveGiftListViewController$_handleFansProcess$presentCoins$(self, _cmd, arg1, arg2);
}

static void _logos_method$_ungrouped$AWELiveGiftListViewController$_fetchGiftListDataAndReloadUI$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
    
    
    _logos_orig$_ungrouped$AWELiveGiftListViewController$_fetchGiftListDataAndReloadUI$(self, _cmd, arg1);
}











static void _logos_method$_ungrouped$AWELiveGiftListViewController$rechargeClicked$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    _logos_orig$_ungrouped$AWELiveGiftListViewController$rechargeClicked$(self, _cmd, arg1);
    NSLog(@"rechargeClicked");
}
static void _logos_method$_ungrouped$AWELiveGiftListViewController$rechargeSuccessNotiAction(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWELiveGiftListViewController$rechargeSuccessNotiAction(self, _cmd);
    NSLog(@"rechargeSuccessNotiAction");
}




































static _Bool _logos_method$_ungrouped$MTLModel$validate$(_LOGOS_SELF_TYPE_NORMAL MTLModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id * arg1) {
    bool val = _logos_orig$_ungrouped$MTLModel$validate$(self, _cmd, arg1);
    NSLog(@"[MTLModel validate], arg1: %@, return val: %d", *arg1, val);
    return _logos_orig$_ungrouped$MTLModel$validate$(self, _cmd, arg1);
}



@interface AWELiveWalletManager : NSObject
+ (void)alertForNobalance:(id)arg1 triggerReason:(id)arg2;
+ (id)_getWalletWebURL:(_Bool)arg1;
+ (void)transitionToWalletPageFrom:(_Bool)arg1;
+ (void)getMyWalletWithFinishBlock:(id)arg1;

@end




static void _logos_meta_method$_ungrouped$AWELiveWalletManager$alertForNobalance$triggerReason$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    NSLog(@"[AWELiveWalletManager alertForNobalance], arg1: %@, reason: %@", arg1, arg2);
    _logos_meta_orig$_ungrouped$AWELiveWalletManager$alertForNobalance$triggerReason$(self, _cmd, arg1, arg2);
}
static id _logos_meta_method$_ungrouped$AWELiveWalletManager$_getWalletWebURL$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
    
    id val = _logos_meta_orig$_ungrouped$AWELiveWalletManager$_getWalletWebURL$(self, _cmd, arg1);
    
    return _logos_meta_orig$_ungrouped$AWELiveWalletManager$_getWalletWebURL$(self, _cmd, arg1);
}
static void _logos_meta_method$_ungrouped$AWELiveWalletManager$transitionToWalletPageFrom$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
    
    
    _logos_meta_orig$_ungrouped$AWELiveWalletManager$transitionToWalletPageFrom$(self, _cmd, arg1);
}


static void _logos_meta_method$_ungrouped$AWELiveWalletManager$getMyWalletWithFinishBlock$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    _logos_meta_orig$_ungrouped$AWELiveWalletManager$getMyWalletWithFinishBlock$(self, _cmd, arg1);
}


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
@property(nonatomic) long long withdrawLimit; 
@property(nonatomic) long long todayIncome; 
@property(nonatomic) long long totalIncome; 
@property(nonatomic) long long diamondCount; 
@property(retain, nonatomic) AWEUserModel *user; 
@end




static id _logos_meta_method$_ungrouped$AWELiveMyWalletModel$userJSONTransformer(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
    
    return _logos_meta_orig$_ungrouped$AWELiveMyWalletModel$userJSONTransformer(self, _cmd);
}
static id _logos_meta_method$_ungrouped$AWELiveMyWalletModel$JSONKeyPathsByPropertyKey(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
    return _logos_meta_orig$_ungrouped$AWELiveMyWalletModel$JSONKeyPathsByPropertyKey(self, _cmd);
}


@interface AWEAppShareSettingManager : NSObject
+ (id)downloadForbiddenToast;
+ (_Bool)selfSeeingShouldForbidWaterMarkWhenDownload;
+ (_Bool)forbidDownloadLocal;
+ (_Bool)downloadCheckStatus;
@end


static id _logos_meta_method$_ungrouped$AWEAppShareSettingManager$downloadForbiddenToast(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    id val = _logos_meta_orig$_ungrouped$AWEAppShareSettingManager$downloadForbiddenToast(self, _cmd);
    NSLog(@"[AWEAppShareSettingManager] downloadForbiddenToast, returnval: %@", val);
    return _logos_meta_orig$_ungrouped$AWEAppShareSettingManager$downloadForbiddenToast(self, _cmd);
}
static _Bool _logos_meta_method$_ungrouped$AWEAppShareSettingManager$selfSeeingShouldForbidWaterMarkWhenDownload(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool val = _logos_meta_orig$_ungrouped$AWEAppShareSettingManager$selfSeeingShouldForbidWaterMarkWhenDownload(self, _cmd);
    NSLog(@"[AWEAppShareSettingManager] selfSeeingShouldForbidWaterMarkWhenDownload, returnval: %d", val);
    return _logos_meta_orig$_ungrouped$AWEAppShareSettingManager$selfSeeingShouldForbidWaterMarkWhenDownload(self, _cmd);
}
static _Bool _logos_meta_method$_ungrouped$AWEAppShareSettingManager$forbidDownloadLocal(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool val = _logos_meta_orig$_ungrouped$AWEAppShareSettingManager$forbidDownloadLocal(self, _cmd);
    NSLog(@"[AWEAppShareSettingManager] forbidDownloadLocal, returnval: %d", val);
    return _logos_meta_orig$_ungrouped$AWEAppShareSettingManager$forbidDownloadLocal(self, _cmd);
}
static _Bool _logos_meta_method$_ungrouped$AWEAppShareSettingManager$downloadCheckStatus(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool val = _logos_meta_orig$_ungrouped$AWEAppShareSettingManager$downloadCheckStatus(self, _cmd);
    NSLog(@"[AWEAppShareSettingManager] downloadCheckStatus, returnval: %d", val);
    return _logos_meta_orig$_ungrouped$AWEAppShareSettingManager$downloadCheckStatus(self, _cmd);
}
















@interface BTDShareBaseViewController : UIViewController
@end

@interface AWEAwemeShareViewController : BTDShareBaseViewController
- (void)viewDidLoad;
- (_Bool)p_unreviewedVideoToLink:(long long)arg1;
- (void)hideItemIfNeed:(id)arg1;
@property(nonatomic) long long hideOptions; 
@end



static void _logos_method$_ungrouped$AWEAwemeShareViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWEAwemeShareViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
    
    
    _logos_orig$_ungrouped$AWEAwemeShareViewController$viewDidLoad(self, _cmd);
}

static void _logos_method$_ungrouped$AWEAwemeShareViewController$hideItemIfNeed$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeShareViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    
    
}


static _Bool _logos_method$_ungrouped$AWEAwemeShareViewController$p_unreviewedVideoToLink$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeShareViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long arg1) {
    bool val = _logos_orig$_ungrouped$AWEAwemeShareViewController$p_unreviewedVideoToLink$(self, _cmd, arg1);
    
    return _logos_orig$_ungrouped$AWEAwemeShareViewController$p_unreviewedVideoToLink$(self, _cmd, arg1);
}

















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



static void _logos_method$_ungrouped$AWECommentListViewController$sendCommentContent$inputView$(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
   
    _logos_orig$_ungrouped$AWECommentListViewController$sendCommentContent$inputView$(self, _cmd, arg1, arg2);
}

static _Bool _logos_method$_ungrouped$AWECommentListViewController$userTappedSendWithContent$inputView$(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    
    return _logos_orig$_ungrouped$AWECommentListViewController$userTappedSendWithContent$inputView$(self, _cmd, arg1, arg2);
}
static _Bool _logos_method$_ungrouped$AWECommentListViewController$commentInputViewShouldReturn$(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    return _logos_orig$_ungrouped$AWECommentListViewController$commentInputViewShouldReturn$(self, _cmd, arg1);
}
static void _logos_method$_ungrouped$AWECommentListViewController$didCommentSuccessWithCommentModel$replyID$(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

    _logos_orig$_ungrouped$AWECommentListViewController$didCommentSuccessWithCommentModel$replyID$(self, _cmd, arg1, arg2);
}
static void _logos_method$_ungrouped$AWECommentListViewController$didCommentSuccessWithCommentModel$(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
   
    _logos_orig$_ungrouped$AWECommentListViewController$didCommentSuccessWithCommentModel$(self, _cmd, arg1);
}



















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


static AWEUserPostsDataManager* _logos_method$_ungrouped$AWEUserPostsDataManager$initWithUserID$(_LOGOS_SELF_TYPE_INIT AWEUserPostsDataManager* __unused self, SEL __unused _cmd, NSString * arg1) _LOGOS_RETURN_RETAINED {
    
    
    
    return _logos_orig$_ungrouped$AWEUserPostsDataManager$initWithUserID$(self, _cmd, arg1);
}




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



static id _logos_method$_ungrouped$AWEPostWorkViewController$aweui_emptyPageConfigForState$(_LOGOS_SELF_TYPE_NORMAL AWEPostWorkViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, unsigned long long arg1) {
    
    
    return _logos_orig$_ungrouped$AWEPostWorkViewController$aweui_emptyPageConfigForState$(self, _cmd, arg1);
}

static UICollectionViewCell * _logos_method$_ungrouped$AWEPostWorkViewController$collectionView$cellForItemAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWEPostWorkViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UICollectionView * arg1, NSIndexPath * arg2) {
    
    
    AWEUserWorkCollectionViewCell *myCell = _logos_orig$_ungrouped$AWEPostWorkViewController$collectionView$cellForItemAtIndexPath$(self, _cmd, arg1, arg2);
    myCell.isMine = YES;
    myCell.model.author.downloadSetting = 0;
    
    bdayText = myCell.model.author.birthday;
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEEE, MMM d, yyyy"];
    createdText = [formatter stringFromDate: myCell.model.author.createTime];
    return myCell;
    
}



@interface AWEUserDetailHeaderView : UIView
@end


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

@property(nonatomic, retain) UILabel *bdayLabel;
@property(nonatomic, retain) UILabel *createdLabel;
@end




static char _logos_property_key$_ungrouped$AWEUserDetailViewController$bdayLabel;__attribute__((used)) static UILabel * _logos_method$_ungrouped$AWEUserDetailViewController$bdayLabel$(AWEUserDetailViewController* __unused self, SEL __unused _cmd){ return objc_getAssociatedObject(self, &_logos_property_key$_ungrouped$AWEUserDetailViewController$bdayLabel); }__attribute__((used)) static void _logos_method$_ungrouped$AWEUserDetailViewController$setBdayLabel$(AWEUserDetailViewController* __unused self, SEL __unused _cmd, UILabel * arg){ objc_setAssociatedObject(self, &_logos_property_key$_ungrouped$AWEUserDetailViewController$bdayLabel, arg, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
static char _logos_property_key$_ungrouped$AWEUserDetailViewController$createdLabel;__attribute__((used)) static UILabel * _logos_method$_ungrouped$AWEUserDetailViewController$createdLabel$(AWEUserDetailViewController* __unused self, SEL __unused _cmd){ return objc_getAssociatedObject(self, &_logos_property_key$_ungrouped$AWEUserDetailViewController$createdLabel); }__attribute__((used)) static void _logos_method$_ungrouped$AWEUserDetailViewController$setCreatedLabel$(AWEUserDetailViewController* __unused self, SEL __unused _cmd, UILabel * arg){ objc_setAssociatedObject(self, &_logos_property_key$_ungrouped$AWEUserDetailViewController$createdLabel, arg, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

static void _logos_method$_ungrouped$AWEUserDetailViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWEUserDetailViewController$viewDidLoad(self, _cmd);
    
    NSLog(@"AWEUserDetailViewController.. fromHome: %d, isCurrentUser: %d", self.postVC.fromHome, self.postVC.isCurrentUser);
    
    
    NSLog(@"dataManager: count: %f, array: %d, showDraft: %d, pageSize: %lld, MAXcuseror: %f, mincursor: %f , userID: %@", self.postVC.dataManager.count, [self.postVC.dataManager.localPosts count], self.postVC.dataManager.showDraft, self.postVC.dataManager.pageSize, self.postVC.dataManager.maxCursor, self.postVC.dataManager.minCursor, self.postVC.dataManager.userID);
   
    
    
    
    
    
    
    
    self.bdayLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 70, 100, 50)];
    self.bdayLabel.numberOfLines = 0;
    self.bdayLabel.textColor = [UIColor blackColor];
    self.bdayLabel.text = @"Birthday...";
    [self.bdayLabel setFont:[UIFont fontWithName:@"Proxima Nova" size:14]];
    [self.headerView addSubview: self.bdayLabel];
    
    
    self.createdLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 120, 100, 65)];
    self.createdLabel.numberOfLines = 0;
    self.createdLabel.textColor = [UIColor blackColor];
    self.createdLabel.text = @"Created...";
    [self.createdLabel setFont:[UIFont fontWithName:@"Proxima Nova" size:14]];
    [self.headerView addSubview: self.createdLabel];
    
    [self performSelector:@selector(updateInfoLabel) withObject:nil afterDelay:1.5];
}


static void _logos_method$_ungrouped$AWEUserDetailViewController$updateInfoLabel(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    self.bdayLabel.text = [@"Bday:\n" stringByAppendingString:bdayText];
    self.createdLabel.text = [@"Account Made:\n" stringByAppendingString: createdText];;
}


static _Bool _logos_method$_ungrouped$AWEUserDetailViewController$_shouldHideTabNum(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    NSLog(@"_shouldHideTabNum..%d", _logos_orig$_ungrouped$AWEUserDetailViewController$_shouldHideTabNum(self, _cmd));
    return _logos_orig$_ungrouped$AWEUserDetailViewController$_shouldHideTabNum(self, _cmd);
}
static _Bool _logos_method$_ungrouped$AWEUserDetailViewController$_shouldShowLikeTab(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"_shouldShowLikeTab..%d", _logos_orig$_ungrouped$AWEUserDetailViewController$_shouldShowLikeTab(self, _cmd));
    return _logos_orig$_ungrouped$AWEUserDetailViewController$_shouldShowLikeTab(self, _cmd);
}

static void _logos_method$_ungrouped$AWEUserDetailViewController$privateAccountInfoViewController$didScroll$(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, struct CGPoint arg2) {
    NSLog(@"privateAccountInfoViewController..%@", arg1);
    _logos_orig$_ungrouped$AWEUserDetailViewController$privateAccountInfoViewController$didScroll$(self, _cmd, arg1, arg2);
}


















static void _logos_method$_ungrouped$AWEUserWorkCollectionViewCell$_setupUI(_LOGOS_SELF_TYPE_NORMAL AWEUserWorkCollectionViewCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
   
    _logos_orig$_ungrouped$AWEUserWorkCollectionViewCell$_setupUI(self, _cmd);
}
static void _logos_method$_ungrouped$AWEUserWorkCollectionViewCell$configWithModel$isMine$(_LOGOS_SELF_TYPE_NORMAL AWEUserWorkCollectionViewCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, AWEAwemeModel * arg1, _Bool arg2) {
   
  
    _logos_orig$_ungrouped$AWEUserWorkCollectionViewCell$configWithModel$isMine$(self, _cmd, arg1, arg2);
}
static void _logos_method$_ungrouped$AWEUserWorkCollectionViewCell$configWithModel$(_LOGOS_SELF_TYPE_NORMAL AWEUserWorkCollectionViewCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, AWEAwemeModel * arg1) {
    
    _logos_orig$_ungrouped$AWEUserWorkCollectionViewCell$configWithModel$(self, _cmd, arg1);
    
    
    NSDate *dateCreated = [NSDate dateWithTimeIntervalSince1970: [arg1.createTime doubleValue]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]  init];
    [formatter setDateFormat:@"MMM d, yyyy"];
    NSString *stringDate = [formatter stringFromDate:dateCreated];
    stringDate = [@"  " stringByAppendingString: stringDate];
    
    NSString *fullTitle = [self.numberBtn.titleLabel.text stringByAppendingString: stringDate];
    [self.numberBtn setTitle: fullTitle forState:UIControlStateNormal];
    
    [self.numberBtn.titleLabel setAdjustsFontSizeToFitWidth:YES];
}



















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

@end

@interface AWEAwemeDetailTableViewCell : UITableViewCell
@property(retain, nonatomic) AWEAwemeDetailCellViewController *viewController;
@end



static id _logos_meta_method$_ungrouped$AWEAwemeDetailTableViewController$detailTableViewControllerWithDataController$initialIndex$referString$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, long long arg2, id arg3) {
    NSLog(@"AWEAwemeDetailTableViewController detailTableViewControllerWithDataController");
    return _logos_meta_orig$_ungrouped$AWEAwemeDetailTableViewController$detailTableViewControllerWithDataController$initialIndex$referString$(self, _cmd, arg1, arg2, arg3);
}

static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$viewDidLoad(self, _cmd);
    
    
    



    
    
    
    

}

static _Bool _logos_method$_ungrouped$AWEAwemeDetailTableViewController$isActive(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"AWEAwemeDetailTableViewController isActive: %d", _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$isActive(self, _cmd));
    
   
    
    
    
    NSLog(@"");
    NSLog(@"");
   
    
    return _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$isActive(self, _cmd);
}

static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$playIfActive(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$playIfActive(self, _cmd);
}


static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$videoDownloadFinished(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$videoDownloadFinished(self, _cmd);
    NSLog(@"videoDownloadFinished");
}
static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$deleteAwemeWithIDs$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$deleteAwemeWithIDs$(self, _cmd, arg1);
    NSLog(@"deleteAwemeWithIDs, arg1: %@, arg1Type: %@", arg1, NSStringFromClass([arg1 class]));
}

static _Bool _logos_method$_ungrouped$AWEAwemeDetailTableViewController$awesst_isVideoPlayViewController(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"awesst_isVideoPlayViewController returnVal: %d", _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$awesst_isVideoPlayViewController(self, _cmd));
    NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
    return _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$awesst_isVideoPlayViewController(self, _cmd);
}

static id _logos_method$_ungrouped$AWEAwemeDetailTableViewController$awesst_additionalTrackerParams(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"awesst_additionalTrackerParams returnVal: %@", _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$awesst_additionalTrackerParams(self, _cmd));
    NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
    return _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$awesst_additionalTrackerParams(self, _cmd);

}

static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$reloadDataForDataControllerChange(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"reloadDataForDataControllerChange" );
    NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
    _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$reloadDataForDataControllerChange(self, _cmd);
}

static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$_onAwemeDeleted$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    NSLog(@"_onAwemeDeleted" );
    NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
    _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$_onAwemeDeleted$(self, _cmd, arg1);
}
static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$_onAwemeDeleteNotification$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    NSLog(@"_onAwemeDeleteNotification, arg1: %@", arg1 );
    NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
    _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$_onAwemeDeleteNotification$(self, _cmd, arg1);
}

static unsigned long long _logos_method$_ungrouped$AWEAwemeDetailTableViewController$_currentVisibleCellIndex(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"_currentVisibleCellIndex, returnVal: %lld", _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$_currentVisibleCellIndex(self, _cmd));
    NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
    return _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$_currentVisibleCellIndex(self, _cmd);
}


static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$videoVoteFinished(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"videoVoteFinished");
    NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
    _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$videoVoteFinished(self, _cmd);
}

static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$setFeedColumntypeIfNeeded(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"setFeedColumntypeIfNeeded");
    NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
    _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$setFeedColumntypeIfNeeded(self, _cmd);
}
static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$loadmore(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"loadmore");
    NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
    _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$loadmore(self, _cmd);
}
static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$initialFetch(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"initialFetch");
    NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
    _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$initialFetch(self, _cmd);
}
static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$initialFetchWithIDs$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    NSLog(@"initialFetchWithIDs: arg1 %@", arg1);
    NSLog(@"referString: %@, initialIndex: %lld, pushPassThrouthParam: %@, initialIDs: %@", self.referString, self.initialIndex, self.pushPassThrouthParam, self.initialIDs);
    _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$initialFetchWithIDs$(self, _cmd, arg1);
}
static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$addLoadMoreIfNeeded(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
   
   
    _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$addLoadMoreIfNeeded(self, _cmd);
}

static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$preloadImageForAweme$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    
    _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$preloadImageForAweme$(self, _cmd, arg1);
}
static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$preloadCoverImageWithIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSIndexPath * arg1) {
   NSLog(@"preloadCoverImageWithIndexPath, Section: %d, Row: %d", arg1.section, arg1.row);
    _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$preloadCoverImageWithIndexPath$(self, _cmd, arg1);
}

static id _logos_method$_ungrouped$AWEAwemeDetailTableViewController$awesst_enterFrom(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"awesst_enterFrom returnVal %@", _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$awesst_enterFrom(self, _cmd));
    return _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$awesst_enterFrom(self, _cmd);
}
static id _logos_method$_ungrouped$AWEAwemeDetailTableViewController$awemeModelWithIndex$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long arg1) {
    
    
    
    
    
    

    return _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$awemeModelWithIndex$(self, _cmd, arg1);
}


static AWEAwemeDetailTableViewController* _logos_method$_ungrouped$AWEAwemeDetailTableViewController$initWithDataController$IDs$initialIndex$referString$(_LOGOS_SELF_TYPE_INIT AWEAwemeDetailTableViewController* __unused self, SEL __unused _cmd, id arg1, id arg2, long long arg3, id arg4) _LOGOS_RETURN_RETAINED {
    
    
    
    return _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$initWithDataController$IDs$initialIndex$referString$(self, _cmd, arg1, arg2, arg3, arg4);
}
static AWEAwemeDetailTableViewController* _logos_method$_ungrouped$AWEAwemeDetailTableViewController$initWithDataController$initialIndex$referString$logExtraDict$(_LOGOS_SELF_TYPE_INIT AWEAwemeDetailTableViewController* __unused self, SEL __unused _cmd, id arg1, long long arg2, id arg3, id arg4) _LOGOS_RETURN_RETAINED {
    
    
    
    return _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$initWithDataController$initialIndex$referString$logExtraDict$(self, _cmd, arg1, arg2, arg3, arg4);
}
static AWEAwemeDetailTableViewController* _logos_method$_ungrouped$AWEAwemeDetailTableViewController$initWithDataController$initialIndex$referString$(_LOGOS_SELF_TYPE_INIT AWEAwemeDetailTableViewController* __unused self, SEL __unused _cmd, id arg1, long long arg2, id arg3) _LOGOS_RETURN_RETAINED {
    
    

    return _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$initWithDataController$initialIndex$referString$(self, _cmd, arg1, arg2, arg3);
}
static UITableViewCell * _logos_method$_ungrouped$AWEAwemeDetailTableViewController$tableView$cellForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView, NSIndexPath * indexPath){
    AWEAwemeDetailTableViewCell *myCell = _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$tableView$cellForRowAtIndexPath$(self, _cmd, tableView, indexPath);
    myCell.viewController.isValid = YES;
    
    return myCell;
}




@interface AWELongVideoPlayerInteractionView : UIView
- (void)doActionIfNotValidWithText:(id)arg1;
- (void)doActionIfNotValid;
- (_Bool)alertIfNotValid;
@end


static void _logos_method$_ungrouped$AWELongVideoPlayerInteractionView$doActionIfNotValidWithText$(_LOGOS_SELF_TYPE_NORMAL AWELongVideoPlayerInteractionView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    NSLog(@"[doActionIfNotValidWithText]");
    _logos_orig$_ungrouped$AWELongVideoPlayerInteractionView$doActionIfNotValidWithText$(self, _cmd, arg1);
}
static void _logos_method$_ungrouped$AWELongVideoPlayerInteractionView$doActionIfNotValid(_LOGOS_SELF_TYPE_NORMAL AWELongVideoPlayerInteractionView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"[doActionIfNotValid]");
    _logos_orig$_ungrouped$AWELongVideoPlayerInteractionView$doActionIfNotValid(self, _cmd);
}
static _Bool _logos_method$_ungrouped$AWELongVideoPlayerInteractionView$alertIfNotValid(_LOGOS_SELF_TYPE_NORMAL AWELongVideoPlayerInteractionView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"[alertIfNotValid], %d", _logos_orig$_ungrouped$AWELongVideoPlayerInteractionView$alertIfNotValid(self, _cmd));
    return _logos_orig$_ungrouped$AWELongVideoPlayerInteractionView$alertIfNotValid(self, _cmd);
}



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


static void _logos_method$_ungrouped$AWEPlayVideoViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    _logos_orig$_ungrouped$AWEPlayVideoViewController$viewDidLoad(self, _cmd);
    NSLog(@"MAin player called");
}

static void _logos_method$_ungrouped$AWEPlayVideoViewController$player$noVideoDataToDownloadForURL$(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    NSLog(@"noVideoDataToDownloadForURL, arg1: %@, arg2: %@", arg1, arg2);
    _logos_orig$_ungrouped$AWEPlayVideoViewController$player$noVideoDataToDownloadForURL$(self, _cmd, arg1, arg2);
}
static void _logos_method$_ungrouped$AWEPlayVideoViewController$player$didFinishVideoDataDownloadForURL$(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    NSLog(@"didFinishVideoDataDownloadForURL, arg1: %@, arg2: %@", arg1, arg2);
    _logos_orig$_ungrouped$AWEPlayVideoViewController$player$didFinishVideoDataDownloadForURL$(self, _cmd, arg1, arg2);
}
static void _logos_method$_ungrouped$AWEPlayVideoViewController$player$didChangeStallState$(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, long long arg2) {
    NSLog(@"didChangeStallState, arg1: %@, arg2: %lld", arg1, arg2);
    _logos_orig$_ungrouped$AWEPlayVideoViewController$player$didChangeStallState$(self, _cmd, arg1, arg2);
}

static void _logos_method$_ungrouped$AWEPlayVideoViewController$player$playbackFailedWithError$(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    NSLog(@"playbackFailedWithError, arg1: %@, arg2: %@", arg1, arg2);
    _logos_orig$_ungrouped$AWEPlayVideoViewController$player$playbackFailedWithError$(self, _cmd, arg1, arg2);
}
static void _logos_method$_ungrouped$AWEPlayVideoViewController$player$playbackFailedForURL$error$(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, id arg3) {
    NSLog(@"playbackFailedForURL, arg1: %@, arg2: %@, error: %@", arg1, arg2, arg3);
    _logos_orig$_ungrouped$AWEPlayVideoViewController$player$playbackFailedForURL$error$(self, _cmd, arg1, arg2, arg3);
}
static _Bool _logos_method$_ungrouped$AWEPlayVideoViewController$_alertIfNotValid(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"_alertIfNotValid: %d", _logos_orig$_ungrouped$AWEPlayVideoViewController$_alertIfNotValid(self, _cmd));
    return _logos_orig$_ungrouped$AWEPlayVideoViewController$_alertIfNotValid(self, _cmd);
}

static _Bool _logos_method$_ungrouped$AWEPlayVideoViewController$alertIfNotValid(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"alertIfNotValid: %d", _logos_orig$_ungrouped$AWEPlayVideoViewController$alertIfNotValid(self, _cmd));
    return _logos_orig$_ungrouped$AWEPlayVideoViewController$alertIfNotValid(self, _cmd);
}
static _Bool _logos_method$_ungrouped$AWEPlayVideoViewController$videoShouldPlay(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"videoShouldPlay: %d", _logos_orig$_ungrouped$AWEPlayVideoViewController$videoShouldPlay(self, _cmd));
    return _logos_orig$_ungrouped$AWEPlayVideoViewController$videoShouldPlay(self, _cmd);
}

static void _logos_method$_ungrouped$AWEPlayVideoViewController$observeValueForKeyPath$ofObject$change$context$(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, id arg3, void * arg4) {
    NSLog(@"observeValueForKeyPath, arg1: %@, object:%@, change: %@, context: %@", arg1, arg2, arg3, arg4);
    _logos_orig$_ungrouped$AWEPlayVideoViewController$observeValueForKeyPath$ofObject$change$context$(self, _cmd, arg1, arg2, arg3, arg4);
}
static long long _logos_method$_ungrouped$AWEPlayVideoViewController$contentModeForDefaultVideoCover(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"contentModeForDefaultVideoCover, return val: %lld", _logos_orig$_ungrouped$AWEPlayVideoViewController$contentModeForDefaultVideoCover(self, _cmd));
    return _logos_orig$_ungrouped$AWEPlayVideoViewController$contentModeForDefaultVideoCover(self, _cmd);
}
static _Bool _logos_method$_ungrouped$AWEPlayVideoViewController$isActive(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"isActive, return val: %d", _logos_orig$_ungrouped$AWEPlayVideoViewController$isActive(self, _cmd));
    return _logos_orig$_ungrouped$AWEPlayVideoViewController$isActive(self, _cmd);
}

static id _logos_method$_ungrouped$AWEPlayVideoViewController$getPlayModeWithAutoPlayMode(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"getPlayModeWithAutoPlayMode, return val: %@", _logos_orig$_ungrouped$AWEPlayVideoViewController$getPlayModeWithAutoPlayMode(self, _cmd));
    return _logos_orig$_ungrouped$AWEPlayVideoViewController$getPlayModeWithAutoPlayMode(self, _cmd);
}
static id _logos_method$_ungrouped$AWEPlayVideoViewController$_getVideoPlayQualityParams(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"_getVideoPlayQualityParams, return val: %@", _logos_orig$_ungrouped$AWEPlayVideoViewController$_getVideoPlayQualityParams(self, _cmd));
    return _logos_orig$_ungrouped$AWEPlayVideoViewController$_getVideoPlayQualityParams(self, _cmd);
}




@interface AWEAwemePlayVideoViewController : AWEPlayVideoViewController
- (_Bool)videoShouldPlay;
- (_Bool)alertIfNotValid;
- (void)updatePlayerIfNeeded;

- (_Bool)isAutoPlaying;
- (long long)type;
- (_Bool)pause;
- (_Bool)stop;
- (_Bool)play;
- (void)viewDidLoad;


- (void)player:(id)arg1 playbackFailedWithError:(id)arg2;
- (void)playerWillLoopPlaying:(id)arg1;
- (void)checkAdVideo;


@end


static _Bool _logos_method$_ungrouped$AWEAwemePlayVideoViewController$videoShouldPlay(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
    return _logos_orig$_ungrouped$AWEAwemePlayVideoViewController$videoShouldPlay(self, _cmd);
}
static _Bool _logos_method$_ungrouped$AWEAwemePlayVideoViewController$alertIfNotValid(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
    return _logos_orig$_ungrouped$AWEAwemePlayVideoViewController$alertIfNotValid(self, _cmd);
}
static _Bool _logos_method$_ungrouped$AWEAwemePlayVideoViewController$pause(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
    return _logos_orig$_ungrouped$AWEAwemePlayVideoViewController$pause(self, _cmd);
}
static _Bool _logos_method$_ungrouped$AWEAwemePlayVideoViewController$stop(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
    return _logos_orig$_ungrouped$AWEAwemePlayVideoViewController$stop(self, _cmd);
}
static _Bool _logos_method$_ungrouped$AWEAwemePlayVideoViewController$play(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
    return _logos_orig$_ungrouped$AWEAwemePlayVideoViewController$play(self, _cmd);
}
static void _logos_method$_ungrouped$AWEAwemePlayVideoViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWEAwemePlayVideoViewController$viewDidLoad(self, _cmd);
}


static void _logos_method$_ungrouped$AWEAwemePlayVideoViewController$player$playbackFailedWithError$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    NSLog(@"playbackFailedWithError, player: %@, error: %@", arg1, arg2);
    
    _logos_orig$_ungrouped$AWEAwemePlayVideoViewController$player$playbackFailedWithError$(self, _cmd, arg1, arg2);
}
static void _logos_method$_ungrouped$AWEAwemePlayVideoViewController$playerWillLoopPlaying$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
   
    _logos_orig$_ungrouped$AWEAwemePlayVideoViewController$playerWillLoopPlaying$(self, _cmd, arg1);
    
}
static void _logos_method$_ungrouped$AWEAwemePlayVideoViewController$checkAdVideo(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayVideoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
    _logos_orig$_ungrouped$AWEAwemePlayVideoViewController$checkAdVideo(self, _cmd);
}


















@interface AWELikeWorkViewController : UIViewController
@property(retain, nonatomic) UICollectionView *collectionView;
- (UICollectionViewCell *)collectionView:(UICollectionView *)arg1 cellForItemAtIndexPath:(NSIndexPath *)arg2;
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
@end



static void _logos_method$_ungrouped$AWELikeWorkViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWELikeWorkViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWELikeWorkViewController$viewDidLoad(self, _cmd);
}

static UICollectionViewCell * _logos_method$_ungrouped$AWELikeWorkViewController$collectionView$cellForItemAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWELikeWorkViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UICollectionView * arg1, NSIndexPath * arg2) {
    AWEUserWorkCollectionViewCell *myCell = _logos_orig$_ungrouped$AWELikeWorkViewController$collectionView$cellForItemAtIndexPath$(self, _cmd, arg1, arg2);
    
    myCell.model.isCanPlay = YES;
    
    return myCell;
}

static void _logos_method$_ungrouped$AWELikeWorkViewController$collectionView$didSelectItemAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWELikeWorkViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UICollectionView * collectionView, NSIndexPath * indexPath) {
    NSLog(@"index: %d", indexPath.row);
    _logos_orig$_ungrouped$AWELikeWorkViewController$collectionView$didSelectItemAtIndexPath$(self, _cmd, collectionView, indexPath);
    
}





static _Bool _logos_method$_ungrouped$AWEAwemeModel$canBeReposted(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    self.isCanPlay = YES;
    return YES;
}
static _Bool _logos_method$_ungrouped$AWEAwemeModel$videoCommentStauts(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return YES;
}


@interface AWEAwemePlayInteractionPresenter : NSObject
@end


static _Bool _logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$alertIfCanNotComment(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return NO;
}




static _Bool _logos_method$_ungrouped$AWEAwemeBaseViewController$alertIfNotValid(_LOGOS_SELF_TYPE_NORMAL AWEAwemeBaseViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return NO;
}




static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$AWEAwemePlayInteractionViewController = objc_getClass("AWEAwemePlayInteractionViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$viewDidLoad);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UILongPressGestureRecognizer*), strlen(@encode(UILongPressGestureRecognizer*))); i += strlen(@encode(UILongPressGestureRecognizer*)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(handleLongPress:), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$handleLongPress$, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(initWithMediaType:), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$initWithMediaType$, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$initWithMediaType$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(updateAllSubViews), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$updateAllSubViews, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$updateAllSubViews);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(downloadButtonPressed), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$downloadButtonPressed, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(saveMusicalToPhotos), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$saveMusicalToPhotos, _typeEncoding); }{ class_addMethod(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(downloadButton), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$downloadButton$, [[NSString stringWithFormat:@"%s@:", @encode(AWEFeedVideoButton *)] UTF8String]);class_addMethod(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(setDownloadButton:), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$setDownloadButton$, [[NSString stringWithFormat:@"v@:%s", @encode(AWEFeedVideoButton *)] UTF8String]);} Class _logos_class$_ungrouped$AWELiveAudienceViewController = objc_getClass("AWELiveAudienceViewController"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIView *), strlen(@encode(UIView *))); i += strlen(@encode(UIView *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWELiveAudienceViewController, @selector(listSubviewsOfView:), (IMP)&_logos_method$_ungrouped$AWELiveAudienceViewController$listSubviewsOfView$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UILongPressGestureRecognizer*), strlen(@encode(UILongPressGestureRecognizer*))); i += strlen(@encode(UILongPressGestureRecognizer*)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWELiveAudienceViewController, @selector(handleLongPress:), (IMP)&_logos_method$_ungrouped$AWELiveAudienceViewController$handleLongPress$, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$AWELiveAudienceViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$AWELiveAudienceViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$AWELiveAudienceViewController$viewDidLoad);Class _logos_class$_ungrouped$AWEProfileImagePreviewView = objc_getClass("AWEProfileImagePreviewView"); MSHookMessageEx(_logos_class$_ungrouped$AWEProfileImagePreviewView, @selector(setupUI), (IMP)&_logos_method$_ungrouped$AWEProfileImagePreviewView$setupUI, (IMP*)&_logos_orig$_ungrouped$AWEProfileImagePreviewView$setupUI);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIButton*), strlen(@encode(UIButton*))); i += strlen(@encode(UIButton*)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEProfileImagePreviewView, @selector(downloadImageButtonPressed:), (IMP)&_logos_method$_ungrouped$AWEProfileImagePreviewView$downloadImageButtonPressed$, _typeEncoding); }Class _logos_class$_ungrouped$AWELiveCommentInputView = objc_getClass("AWELiveCommentInputView"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveCommentInputView, @selector(growingTextViewDidChange:), (IMP)&_logos_method$_ungrouped$AWELiveCommentInputView$growingTextViewDidChange$, (IMP*)&_logos_orig$_ungrouped$AWELiveCommentInputView$growingTextViewDidChange$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveCommentInputView, @selector(growingTextViewShouldBeginEditing:), (IMP)&_logos_method$_ungrouped$AWELiveCommentInputView$growingTextViewShouldBeginEditing$, (IMP*)&_logos_orig$_ungrouped$AWELiveCommentInputView$growingTextViewShouldBeginEditing$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveCommentInputView, @selector(growingTextView:shouldChangeTextInRange:replacementText:), (IMP)&_logos_method$_ungrouped$AWELiveCommentInputView$growingTextView$shouldChangeTextInRange$replacementText$, (IMP*)&_logos_orig$_ungrouped$AWELiveCommentInputView$growingTextView$shouldChangeTextInRange$replacementText$);Class _logos_class$_ungrouped$AWEGrowingTextView = objc_getClass("AWEGrowingTextView"); MSHookMessageEx(_logos_class$_ungrouped$AWEGrowingTextView, @selector(textView:shouldChangeTextInRange:replacementText:), (IMP)&_logos_method$_ungrouped$AWEGrowingTextView$textView$shouldChangeTextInRange$replacementText$, (IMP*)&_logos_orig$_ungrouped$AWEGrowingTextView$textView$shouldChangeTextInRange$replacementText$);Class _logos_class$_ungrouped$AWELiveInteractViewController = objc_getClass("AWELiveInteractViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveInteractViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$AWELiveInteractViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$AWELiveInteractViewController$viewDidLoad);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIButton*), strlen(@encode(UIButton*))); i += strlen(@encode(UIButton*)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWELiveInteractViewController, @selector(newChatButtonTapped:), (IMP)&_logos_method$_ungrouped$AWELiveInteractViewController$newChatButtonTapped$, _typeEncoding); }Class _logos_class$_ungrouped$AWELiveSendGiftControllerDelegate = objc_getClass("AWELiveSendGiftControllerDelegate"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveSendGiftControllerDelegate, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$AWELiveSendGiftControllerDelegate$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$AWELiveSendGiftControllerDelegate$viewDidLoad);MSHookMessageEx(_logos_class$_ungrouped$AWELiveSendGiftControllerDelegate, @selector(handleLongPress:), (IMP)&_logos_method$_ungrouped$AWELiveSendGiftControllerDelegate$handleLongPress$, (IMP*)&_logos_orig$_ungrouped$AWELiveSendGiftControllerDelegate$handleLongPress$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveSendGiftControllerDelegate, @selector(listSubviewsOfView:), (IMP)&_logos_method$_ungrouped$AWELiveSendGiftControllerDelegate$listSubviewsOfView$, (IMP*)&_logos_orig$_ungrouped$AWELiveSendGiftControllerDelegate$listSubviewsOfView$);Class _logos_class$_ungrouped$AWEAppLiveSettingManager = objc_getClass("AWEAppLiveSettingManager"); Class _logos_metaclass$_ungrouped$AWEAppLiveSettingManager = object_getClass(_logos_class$_ungrouped$AWEAppLiveSettingManager); MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppLiveSettingManager, @selector(disableNewPayment), (IMP)&_logos_meta_method$_ungrouped$AWEAppLiveSettingManager$disableNewPayment, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$disableNewPayment);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppLiveSettingManager, @selector(newWalletConf), (IMP)&_logos_meta_method$_ungrouped$AWEAppLiveSettingManager$newWalletConf, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$newWalletConf);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppLiveSettingManager, @selector(showSkylightAnimation), (IMP)&_logos_meta_method$_ungrouped$AWEAppLiveSettingManager$showSkylightAnimation, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$showSkylightAnimation);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppLiveSettingManager, @selector(disableLiveCDNNodeSelection), (IMP)&_logos_meta_method$_ungrouped$AWEAppLiveSettingManager$disableLiveCDNNodeSelection, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$disableLiveCDNNodeSelection);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppLiveSettingManager, @selector(isLivePodcast), (IMP)&_logos_meta_method$_ungrouped$AWEAppLiveSettingManager$isLivePodcast, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$isLivePodcast);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppLiveSettingManager, @selector(liveResH), (IMP)&_logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveResH, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveResH);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppLiveSettingManager, @selector(liveResW), (IMP)&_logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveResW, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveResW);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppLiveSettingManager, @selector(liveFps), (IMP)&_logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveFps, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveFps);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppLiveSettingManager, @selector(liveMinBitrate), (IMP)&_logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveMinBitrate, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveMinBitrate);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppLiveSettingManager, @selector(liveMaxBitrate), (IMP)&_logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveMaxBitrate, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveMaxBitrate);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppLiveSettingManager, @selector(liveDefaultBitrate), (IMP)&_logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveDefaultBitrate, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveDefaultBitrate);Class _logos_class$_ungrouped$AWELiveSetting = objc_getClass("AWELiveSetting"); Class _logos_metaclass$_ungrouped$AWELiveSetting = object_getClass(_logos_class$_ungrouped$AWELiveSetting); MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveSetting, @selector(shouldCheckCoins:), (IMP)&_logos_meta_method$_ungrouped$AWELiveSetting$shouldCheckCoins$, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveSetting$shouldCheckCoins$);MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveSetting, @selector(setBarrageCoins:), (IMP)&_logos_meta_method$_ungrouped$AWELiveSetting$setBarrageCoins$, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveSetting$setBarrageCoins$);MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveSetting, @selector(barrageCoins), (IMP)&_logos_meta_method$_ungrouped$AWELiveSetting$barrageCoins, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveSetting$barrageCoins);MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveSetting, @selector(setUserAllCoins:), (IMP)&_logos_meta_method$_ungrouped$AWELiveSetting$setUserAllCoins$, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveSetting$setUserAllCoins$);MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveSetting, @selector(userAllCoins), (IMP)&_logos_meta_method$_ungrouped$AWELiveSetting$userAllCoins, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveSetting$userAllCoins);Class _logos_class$_ungrouped$AWELiveTrackEventManager = objc_getClass("AWELiveTrackEventManager"); Class _logos_metaclass$_ungrouped$AWELiveTrackEventManager = object_getClass(_logos_class$_ungrouped$AWELiveTrackEventManager); MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveTrackEventManager, @selector(trackLiveClickPresent:isAnchor:enterFrom:presentID:presentCoins:), (IMP)&_logos_meta_method$_ungrouped$AWELiveTrackEventManager$trackLiveClickPresent$isAnchor$enterFrom$presentID$presentCoins$, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveTrackEventManager$trackLiveClickPresent$isAnchor$enterFrom$presentID$presentCoins$);MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveTrackEventManager, @selector(trackLiveSendPresentSuccess:isAnchor:enterFrom:presentID:presentCoins:), (IMP)&_logos_meta_method$_ungrouped$AWELiveTrackEventManager$trackLiveSendPresentSuccess$isAnchor$enterFrom$presentID$presentCoins$, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveTrackEventManager$trackLiveSendPresentSuccess$isAnchor$enterFrom$presentID$presentCoins$);Class _logos_class$_ungrouped$AWELiveSendGiftPackage = objc_getClass("AWELiveSendGiftPackage"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveSendGiftPackage, @selector(resetWithPresent:), (IMP)&_logos_method$_ungrouped$AWELiveSendGiftPackage$resetWithPresent$, (IMP*)&_logos_orig$_ungrouped$AWELiveSendGiftPackage$resetWithPresent$);Class _logos_class$_ungrouped$AWELiveRoomModel = objc_getClass("AWELiveRoomModel"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveRoomModel, @selector(initWithRoomID:), (IMP)&_logos_method$_ungrouped$AWELiveRoomModel$initWithRoomID$, (IMP*)&_logos_orig$_ungrouped$AWELiveRoomModel$initWithRoomID$);Class _logos_class$_ungrouped$AWELivePresentModel = objc_getClass("AWELivePresentModel"); MSHookMessageEx(_logos_class$_ungrouped$AWELivePresentModel, @selector(copyWithZone:), (IMP)&_logos_method$_ungrouped$AWELivePresentModel$copyWithZone$, (IMP*)&_logos_orig$_ungrouped$AWELivePresentModel$copyWithZone$);MSHookMessageEx(_logos_class$_ungrouped$AWELivePresentModel, @selector(fakeIconName), (IMP)&_logos_method$_ungrouped$AWELivePresentModel$fakeIconName, (IMP*)&_logos_orig$_ungrouped$AWELivePresentModel$fakeIconName);MSHookMessageEx(_logos_class$_ungrouped$AWELivePresentModel, @selector(isFakePresent), (IMP)&_logos_method$_ungrouped$AWELivePresentModel$isFakePresent, (IMP*)&_logos_orig$_ungrouped$AWELivePresentModel$isFakePresent);MSHookMessageEx(_logos_class$_ungrouped$AWELivePresentModel, @selector(isVideoPresent), (IMP)&_logos_method$_ungrouped$AWELivePresentModel$isVideoPresent, (IMP*)&_logos_orig$_ungrouped$AWELivePresentModel$isVideoPresent);MSHookMessageEx(_logos_class$_ungrouped$AWELivePresentModel, @selector(isAwemePresent), (IMP)&_logos_method$_ungrouped$AWELivePresentModel$isAwemePresent, (IMP*)&_logos_orig$_ungrouped$AWELivePresentModel$isAwemePresent);MSHookMessageEx(_logos_class$_ungrouped$AWELivePresentModel, @selector(isResourcePresent), (IMP)&_logos_method$_ungrouped$AWELivePresentModel$isResourcePresent, (IMP*)&_logos_orig$_ungrouped$AWELivePresentModel$isResourcePresent);Class _logos_class$_ungrouped$AWELiveGiftListDataController = objc_getClass("AWELiveGiftListDataController"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListDataController, @selector(sendPresent:presentID:count:completion:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListDataController$sendPresent$presentID$count$completion$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListDataController$sendPresent$presentID$count$completion$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListDataController, @selector(filterDisplayPresentList), (IMP)&_logos_method$_ungrouped$AWELiveGiftListDataController$filterDisplayPresentList, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListDataController$filterDisplayPresentList);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListDataController, @selector(_getFreePresentListWithPresentList:completion:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListDataController$_getFreePresentListWithPresentList$completion$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListDataController$_getFreePresentListWithPresentList$completion$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListDataController, @selector(getSandBoxGiftListModel:completion:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListDataController$getSandBoxGiftListModel$completion$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListDataController$getSandBoxGiftListModel$completion$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListDataController, @selector(getGiftListModelWithCompletion:roomID:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithCompletion$roomID$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithCompletion$roomID$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListDataController, @selector(getGiftListModelWithRoom:completion:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithRoom$completion$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithRoom$completion$);Class _logos_class$_ungrouped$AWELiveSendGiftController = objc_getClass("AWELiveSendGiftController"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveSendGiftController, @selector(isAnchor), (IMP)&_logos_method$_ungrouped$AWELiveSendGiftController$isAnchor, (IMP*)&_logos_orig$_ungrouped$AWELiveSendGiftController$isAnchor);MSHookMessageEx(_logos_class$_ungrouped$AWELiveSendGiftController, @selector(_performSendRequest), (IMP)&_logos_method$_ungrouped$AWELiveSendGiftController$_performSendRequest, (IMP*)&_logos_orig$_ungrouped$AWELiveSendGiftController$_performSendRequest);MSHookMessageEx(_logos_class$_ungrouped$AWELiveSendGiftController, @selector(_prepareSendRequestWithPresent:), (IMP)&_logos_method$_ungrouped$AWELiveSendGiftController$_prepareSendRequestWithPresent$, (IMP*)&_logos_orig$_ungrouped$AWELiveSendGiftController$_prepareSendRequestWithPresent$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveSendGiftController, @selector(_performClickTrack), (IMP)&_logos_method$_ungrouped$AWELiveSendGiftController$_performClickTrack, (IMP*)&_logos_orig$_ungrouped$AWELiveSendGiftController$_performClickTrack);MSHookMessageEx(_logos_class$_ungrouped$AWELiveSendGiftController, @selector(_prepareClickTrackWithPreseent:), (IMP)&_logos_method$_ungrouped$AWELiveSendGiftController$_prepareClickTrackWithPreseent$, (IMP*)&_logos_orig$_ungrouped$AWELiveSendGiftController$_prepareClickTrackWithPreseent$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveSendGiftController, @selector(willSendGiftInCollectionView:atIndexPath:), (IMP)&_logos_method$_ungrouped$AWELiveSendGiftController$willSendGiftInCollectionView$atIndexPath$, (IMP*)&_logos_orig$_ungrouped$AWELiveSendGiftController$willSendGiftInCollectionView$atIndexPath$);Class _logos_class$_ungrouped$AWELiveGiftListBottomLandscapeView = objc_getClass("AWELiveGiftListBottomLandscapeView"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListBottomLandscapeView, @selector(refreshWalletCoins:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListBottomLandscapeView$refreshWalletCoins$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListBottomLandscapeView$refreshWalletCoins$);Class _logos_class$_ungrouped$AWELiveGiftFansEnterView = objc_getClass("AWELiveGiftFansEnterView"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftFansEnterView, @selector(handleProcessWithIntimacy:presentCoins:animationFinishBlock:), (IMP)&_logos_method$_ungrouped$AWELiveGiftFansEnterView$handleProcessWithIntimacy$presentCoins$animationFinishBlock$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftFansEnterView$handleProcessWithIntimacy$presentCoins$animationFinishBlock$);Class _logos_class$_ungrouped$AWELiveFreePresentPropertyManager = objc_getClass("AWELiveFreePresentPropertyManager"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveFreePresentPropertyManager, @selector(_consumeFansFreePresentWithPresentId:count:), (IMP)&_logos_method$_ungrouped$AWELiveFreePresentPropertyManager$_consumeFansFreePresentWithPresentId$count$, (IMP*)&_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$_consumeFansFreePresentWithPresentId$count$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveFreePresentPropertyManager, @selector(setFansFreePresent:), (IMP)&_logos_method$_ungrouped$AWELiveFreePresentPropertyManager$setFansFreePresent$, (IMP*)&_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$setFansFreePresent$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveFreePresentPropertyManager, @selector(consumeFreePresentWithPresentId:propertIDs:count:), (IMP)&_logos_method$_ungrouped$AWELiveFreePresentPropertyManager$consumeFreePresentWithPresentId$propertIDs$count$, (IMP*)&_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$consumeFreePresentWithPresentId$propertIDs$count$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveFreePresentPropertyManager, @selector(useFreePresentWithPresentId:count:), (IMP)&_logos_method$_ungrouped$AWELiveFreePresentPropertyManager$useFreePresentWithPresentId$count$, (IMP*)&_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$useFreePresentWithPresentId$count$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveFreePresentPropertyManager, @selector(freeCountForPresentId:), (IMP)&_logos_method$_ungrouped$AWELiveFreePresentPropertyManager$freeCountForPresentId$, (IMP*)&_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$freeCountForPresentId$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveFreePresentPropertyManager, @selector(fetchFreePresentListWithCompletion:), (IMP)&_logos_method$_ungrouped$AWELiveFreePresentPropertyManager$fetchFreePresentListWithCompletion$, (IMP*)&_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$fetchFreePresentListWithCompletion$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveFreePresentPropertyManager, @selector(init), (IMP)&_logos_method$_ungrouped$AWELiveFreePresentPropertyManager$init, (IMP*)&_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$init);Class _logos_class$_ungrouped$AWELiveGiftListViewController = objc_getClass("AWELiveGiftListViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$AWELiveGiftListViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListViewController$viewDidLoad);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListViewController, @selector(refreshWalletCoins), (IMP)&_logos_method$_ungrouped$AWELiveGiftListViewController$refreshWalletCoins, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListViewController$refreshWalletCoins);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListViewController, @selector(didFinishSendPresentRequestWithTotalCoins:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListViewController$didFinishSendPresentRequestWithTotalCoins$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListViewController$didFinishSendPresentRequestWithTotalCoins$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListViewController, @selector(didSendPresent:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListViewController$didSendPresent$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListViewController$didSendPresent$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListViewController, @selector(collectionView:didSelectItemAtIndexPath:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListViewController$collectionView$didSelectItemAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListViewController$collectionView$didSelectItemAtIndexPath$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListViewController, @selector(_handleFansProcess:presentCoins:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListViewController$_handleFansProcess$presentCoins$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListViewController$_handleFansProcess$presentCoins$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListViewController, @selector(_fetchGiftListDataAndReloadUI:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListViewController$_fetchGiftListDataAndReloadUI$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListViewController$_fetchGiftListDataAndReloadUI$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListViewController, @selector(rechargeClicked:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListViewController$rechargeClicked$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListViewController$rechargeClicked$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListViewController, @selector(rechargeSuccessNotiAction), (IMP)&_logos_method$_ungrouped$AWELiveGiftListViewController$rechargeSuccessNotiAction, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListViewController$rechargeSuccessNotiAction);Class _logos_class$_ungrouped$MTLModel = objc_getClass("MTLModel"); MSHookMessageEx(_logos_class$_ungrouped$MTLModel, @selector(validate:), (IMP)&_logos_method$_ungrouped$MTLModel$validate$, (IMP*)&_logos_orig$_ungrouped$MTLModel$validate$);Class _logos_class$_ungrouped$AWELiveWalletManager = objc_getClass("AWELiveWalletManager"); Class _logos_metaclass$_ungrouped$AWELiveWalletManager = object_getClass(_logos_class$_ungrouped$AWELiveWalletManager); MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveWalletManager, @selector(alertForNobalance:triggerReason:), (IMP)&_logos_meta_method$_ungrouped$AWELiveWalletManager$alertForNobalance$triggerReason$, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveWalletManager$alertForNobalance$triggerReason$);MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveWalletManager, @selector(_getWalletWebURL:), (IMP)&_logos_meta_method$_ungrouped$AWELiveWalletManager$_getWalletWebURL$, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveWalletManager$_getWalletWebURL$);MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveWalletManager, @selector(transitionToWalletPageFrom:), (IMP)&_logos_meta_method$_ungrouped$AWELiveWalletManager$transitionToWalletPageFrom$, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveWalletManager$transitionToWalletPageFrom$);MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveWalletManager, @selector(getMyWalletWithFinishBlock:), (IMP)&_logos_meta_method$_ungrouped$AWELiveWalletManager$getMyWalletWithFinishBlock$, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveWalletManager$getMyWalletWithFinishBlock$);Class _logos_class$_ungrouped$AWELiveMyWalletModel = objc_getClass("AWELiveMyWalletModel"); Class _logos_metaclass$_ungrouped$AWELiveMyWalletModel = object_getClass(_logos_class$_ungrouped$AWELiveMyWalletModel); MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveMyWalletModel, @selector(userJSONTransformer), (IMP)&_logos_meta_method$_ungrouped$AWELiveMyWalletModel$userJSONTransformer, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveMyWalletModel$userJSONTransformer);MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveMyWalletModel, @selector(JSONKeyPathsByPropertyKey), (IMP)&_logos_meta_method$_ungrouped$AWELiveMyWalletModel$JSONKeyPathsByPropertyKey, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveMyWalletModel$JSONKeyPathsByPropertyKey);Class _logos_class$_ungrouped$AWEAppShareSettingManager = objc_getClass("AWEAppShareSettingManager"); Class _logos_metaclass$_ungrouped$AWEAppShareSettingManager = object_getClass(_logos_class$_ungrouped$AWEAppShareSettingManager); MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppShareSettingManager, @selector(downloadForbiddenToast), (IMP)&_logos_meta_method$_ungrouped$AWEAppShareSettingManager$downloadForbiddenToast, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppShareSettingManager$downloadForbiddenToast);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppShareSettingManager, @selector(selfSeeingShouldForbidWaterMarkWhenDownload), (IMP)&_logos_meta_method$_ungrouped$AWEAppShareSettingManager$selfSeeingShouldForbidWaterMarkWhenDownload, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppShareSettingManager$selfSeeingShouldForbidWaterMarkWhenDownload);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppShareSettingManager, @selector(forbidDownloadLocal), (IMP)&_logos_meta_method$_ungrouped$AWEAppShareSettingManager$forbidDownloadLocal, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppShareSettingManager$forbidDownloadLocal);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppShareSettingManager, @selector(downloadCheckStatus), (IMP)&_logos_meta_method$_ungrouped$AWEAppShareSettingManager$downloadCheckStatus, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppShareSettingManager$downloadCheckStatus);Class _logos_class$_ungrouped$AWEAwemeShareViewController = objc_getClass("AWEAwemeShareViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeShareViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$AWEAwemeShareViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$AWEAwemeShareViewController$viewDidLoad);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeShareViewController, @selector(hideItemIfNeed:), (IMP)&_logos_method$_ungrouped$AWEAwemeShareViewController$hideItemIfNeed$, (IMP*)&_logos_orig$_ungrouped$AWEAwemeShareViewController$hideItemIfNeed$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeShareViewController, @selector(p_unreviewedVideoToLink:), (IMP)&_logos_method$_ungrouped$AWEAwemeShareViewController$p_unreviewedVideoToLink$, (IMP*)&_logos_orig$_ungrouped$AWEAwemeShareViewController$p_unreviewedVideoToLink$);Class _logos_class$_ungrouped$AWECommentListViewController = objc_getClass("AWECommentListViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWECommentListViewController, @selector(sendCommentContent:inputView:), (IMP)&_logos_method$_ungrouped$AWECommentListViewController$sendCommentContent$inputView$, (IMP*)&_logos_orig$_ungrouped$AWECommentListViewController$sendCommentContent$inputView$);MSHookMessageEx(_logos_class$_ungrouped$AWECommentListViewController, @selector(userTappedSendWithContent:inputView:), (IMP)&_logos_method$_ungrouped$AWECommentListViewController$userTappedSendWithContent$inputView$, (IMP*)&_logos_orig$_ungrouped$AWECommentListViewController$userTappedSendWithContent$inputView$);MSHookMessageEx(_logos_class$_ungrouped$AWECommentListViewController, @selector(commentInputViewShouldReturn:), (IMP)&_logos_method$_ungrouped$AWECommentListViewController$commentInputViewShouldReturn$, (IMP*)&_logos_orig$_ungrouped$AWECommentListViewController$commentInputViewShouldReturn$);MSHookMessageEx(_logos_class$_ungrouped$AWECommentListViewController, @selector(didCommentSuccessWithCommentModel:replyID:), (IMP)&_logos_method$_ungrouped$AWECommentListViewController$didCommentSuccessWithCommentModel$replyID$, (IMP*)&_logos_orig$_ungrouped$AWECommentListViewController$didCommentSuccessWithCommentModel$replyID$);MSHookMessageEx(_logos_class$_ungrouped$AWECommentListViewController, @selector(didCommentSuccessWithCommentModel:), (IMP)&_logos_method$_ungrouped$AWECommentListViewController$didCommentSuccessWithCommentModel$, (IMP*)&_logos_orig$_ungrouped$AWECommentListViewController$didCommentSuccessWithCommentModel$);Class _logos_class$_ungrouped$AWEUserPostsDataManager = objc_getClass("AWEUserPostsDataManager"); MSHookMessageEx(_logos_class$_ungrouped$AWEUserPostsDataManager, @selector(initWithUserID:), (IMP)&_logos_method$_ungrouped$AWEUserPostsDataManager$initWithUserID$, (IMP*)&_logos_orig$_ungrouped$AWEUserPostsDataManager$initWithUserID$);Class _logos_class$_ungrouped$AWEPostWorkViewController = objc_getClass("AWEPostWorkViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEPostWorkViewController, @selector(aweui_emptyPageConfigForState:), (IMP)&_logos_method$_ungrouped$AWEPostWorkViewController$aweui_emptyPageConfigForState$, (IMP*)&_logos_orig$_ungrouped$AWEPostWorkViewController$aweui_emptyPageConfigForState$);MSHookMessageEx(_logos_class$_ungrouped$AWEPostWorkViewController, @selector(collectionView:cellForItemAtIndexPath:), (IMP)&_logos_method$_ungrouped$AWEPostWorkViewController$collectionView$cellForItemAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$AWEPostWorkViewController$collectionView$cellForItemAtIndexPath$);Class _logos_class$_ungrouped$AWEUserDetailViewController = objc_getClass("AWEUserDetailViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEUserDetailViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$AWEUserDetailViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$AWEUserDetailViewController$viewDidLoad);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEUserDetailViewController, @selector(updateInfoLabel), (IMP)&_logos_method$_ungrouped$AWEUserDetailViewController$updateInfoLabel, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$AWEUserDetailViewController, @selector(_shouldHideTabNum), (IMP)&_logos_method$_ungrouped$AWEUserDetailViewController$_shouldHideTabNum, (IMP*)&_logos_orig$_ungrouped$AWEUserDetailViewController$_shouldHideTabNum);MSHookMessageEx(_logos_class$_ungrouped$AWEUserDetailViewController, @selector(_shouldShowLikeTab), (IMP)&_logos_method$_ungrouped$AWEUserDetailViewController$_shouldShowLikeTab, (IMP*)&_logos_orig$_ungrouped$AWEUserDetailViewController$_shouldShowLikeTab);MSHookMessageEx(_logos_class$_ungrouped$AWEUserDetailViewController, @selector(privateAccountInfoViewController:didScroll:), (IMP)&_logos_method$_ungrouped$AWEUserDetailViewController$privateAccountInfoViewController$didScroll$, (IMP*)&_logos_orig$_ungrouped$AWEUserDetailViewController$privateAccountInfoViewController$didScroll$);{ class_addMethod(_logos_class$_ungrouped$AWEUserDetailViewController, @selector(bdayLabel), (IMP)&_logos_method$_ungrouped$AWEUserDetailViewController$bdayLabel$, [[NSString stringWithFormat:@"%s@:", @encode(UILabel *)] UTF8String]);class_addMethod(_logos_class$_ungrouped$AWEUserDetailViewController, @selector(setBdayLabel:), (IMP)&_logos_method$_ungrouped$AWEUserDetailViewController$setBdayLabel$, [[NSString stringWithFormat:@"v@:%s", @encode(UILabel *)] UTF8String]);} { class_addMethod(_logos_class$_ungrouped$AWEUserDetailViewController, @selector(createdLabel), (IMP)&_logos_method$_ungrouped$AWEUserDetailViewController$createdLabel$, [[NSString stringWithFormat:@"%s@:", @encode(UILabel *)] UTF8String]);class_addMethod(_logos_class$_ungrouped$AWEUserDetailViewController, @selector(setCreatedLabel:), (IMP)&_logos_method$_ungrouped$AWEUserDetailViewController$setCreatedLabel$, [[NSString stringWithFormat:@"v@:%s", @encode(UILabel *)] UTF8String]);} Class _logos_class$_ungrouped$AWEUserWorkCollectionViewCell = objc_getClass("AWEUserWorkCollectionViewCell"); MSHookMessageEx(_logos_class$_ungrouped$AWEUserWorkCollectionViewCell, @selector(_setupUI), (IMP)&_logos_method$_ungrouped$AWEUserWorkCollectionViewCell$_setupUI, (IMP*)&_logos_orig$_ungrouped$AWEUserWorkCollectionViewCell$_setupUI);MSHookMessageEx(_logos_class$_ungrouped$AWEUserWorkCollectionViewCell, @selector(configWithModel:isMine:), (IMP)&_logos_method$_ungrouped$AWEUserWorkCollectionViewCell$configWithModel$isMine$, (IMP*)&_logos_orig$_ungrouped$AWEUserWorkCollectionViewCell$configWithModel$isMine$);MSHookMessageEx(_logos_class$_ungrouped$AWEUserWorkCollectionViewCell, @selector(configWithModel:), (IMP)&_logos_method$_ungrouped$AWEUserWorkCollectionViewCell$configWithModel$, (IMP*)&_logos_orig$_ungrouped$AWEUserWorkCollectionViewCell$configWithModel$);Class _logos_class$_ungrouped$AWEAwemeDetailTableViewController = objc_getClass("AWEAwemeDetailTableViewController"); Class _logos_metaclass$_ungrouped$AWEAwemeDetailTableViewController = object_getClass(_logos_class$_ungrouped$AWEAwemeDetailTableViewController); MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAwemeDetailTableViewController, @selector(detailTableViewControllerWithDataController:initialIndex:referString:), (IMP)&_logos_meta_method$_ungrouped$AWEAwemeDetailTableViewController$detailTableViewControllerWithDataController$initialIndex$referString$, (IMP*)&_logos_meta_orig$_ungrouped$AWEAwemeDetailTableViewController$detailTableViewControllerWithDataController$initialIndex$referString$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$viewDidLoad);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(isActive), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$isActive, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$isActive);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(playIfActive), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$playIfActive, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$playIfActive);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(videoDownloadFinished), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$videoDownloadFinished, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$videoDownloadFinished);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(deleteAwemeWithIDs:), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$deleteAwemeWithIDs$, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$deleteAwemeWithIDs$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(awesst_isVideoPlayViewController), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$awesst_isVideoPlayViewController, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$awesst_isVideoPlayViewController);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(awesst_additionalTrackerParams), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$awesst_additionalTrackerParams, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$awesst_additionalTrackerParams);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(reloadDataForDataControllerChange), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$reloadDataForDataControllerChange, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$reloadDataForDataControllerChange);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(_onAwemeDeleted:), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$_onAwemeDeleted$, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$_onAwemeDeleted$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(_onAwemeDeleteNotification:), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$_onAwemeDeleteNotification$, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$_onAwemeDeleteNotification$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(_currentVisibleCellIndex), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$_currentVisibleCellIndex, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$_currentVisibleCellIndex);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(videoVoteFinished), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$videoVoteFinished, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$videoVoteFinished);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(setFeedColumntypeIfNeeded), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$setFeedColumntypeIfNeeded, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$setFeedColumntypeIfNeeded);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(loadmore), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$loadmore, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$loadmore);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(initialFetch), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$initialFetch, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$initialFetch);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(initialFetchWithIDs:), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$initialFetchWithIDs$, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$initialFetchWithIDs$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(addLoadMoreIfNeeded), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$addLoadMoreIfNeeded, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$addLoadMoreIfNeeded);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(preloadImageForAweme:), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$preloadImageForAweme$, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$preloadImageForAweme$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(preloadCoverImageWithIndexPath:), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$preloadCoverImageWithIndexPath$, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$preloadCoverImageWithIndexPath$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(awesst_enterFrom), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$awesst_enterFrom, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$awesst_enterFrom);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(awemeModelWithIndex:), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$awemeModelWithIndex$, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$awemeModelWithIndex$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(initWithDataController:IDs:initialIndex:referString:), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$initWithDataController$IDs$initialIndex$referString$, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$initWithDataController$IDs$initialIndex$referString$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(initWithDataController:initialIndex:referString:logExtraDict:), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$initWithDataController$initialIndex$referString$logExtraDict$, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$initWithDataController$initialIndex$referString$logExtraDict$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(initWithDataController:initialIndex:referString:), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$initWithDataController$initialIndex$referString$, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$initWithDataController$initialIndex$referString$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(tableView:cellForRowAtIndexPath:), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$tableView$cellForRowAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$tableView$cellForRowAtIndexPath$);Class _logos_class$_ungrouped$AWELongVideoPlayerInteractionView = objc_getClass("AWELongVideoPlayerInteractionView"); MSHookMessageEx(_logos_class$_ungrouped$AWELongVideoPlayerInteractionView, @selector(doActionIfNotValidWithText:), (IMP)&_logos_method$_ungrouped$AWELongVideoPlayerInteractionView$doActionIfNotValidWithText$, (IMP*)&_logos_orig$_ungrouped$AWELongVideoPlayerInteractionView$doActionIfNotValidWithText$);MSHookMessageEx(_logos_class$_ungrouped$AWELongVideoPlayerInteractionView, @selector(doActionIfNotValid), (IMP)&_logos_method$_ungrouped$AWELongVideoPlayerInteractionView$doActionIfNotValid, (IMP*)&_logos_orig$_ungrouped$AWELongVideoPlayerInteractionView$doActionIfNotValid);MSHookMessageEx(_logos_class$_ungrouped$AWELongVideoPlayerInteractionView, @selector(alertIfNotValid), (IMP)&_logos_method$_ungrouped$AWELongVideoPlayerInteractionView$alertIfNotValid, (IMP*)&_logos_orig$_ungrouped$AWELongVideoPlayerInteractionView$alertIfNotValid);Class _logos_class$_ungrouped$AWEPlayVideoViewController = objc_getClass("AWEPlayVideoViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEPlayVideoViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$AWEPlayVideoViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$AWEPlayVideoViewController$viewDidLoad);MSHookMessageEx(_logos_class$_ungrouped$AWEPlayVideoViewController, @selector(player:noVideoDataToDownloadForURL:), (IMP)&_logos_method$_ungrouped$AWEPlayVideoViewController$player$noVideoDataToDownloadForURL$, (IMP*)&_logos_orig$_ungrouped$AWEPlayVideoViewController$player$noVideoDataToDownloadForURL$);MSHookMessageEx(_logos_class$_ungrouped$AWEPlayVideoViewController, @selector(player:didFinishVideoDataDownloadForURL:), (IMP)&_logos_method$_ungrouped$AWEPlayVideoViewController$player$didFinishVideoDataDownloadForURL$, (IMP*)&_logos_orig$_ungrouped$AWEPlayVideoViewController$player$didFinishVideoDataDownloadForURL$);MSHookMessageEx(_logos_class$_ungrouped$AWEPlayVideoViewController, @selector(player:didChangeStallState:), (IMP)&_logos_method$_ungrouped$AWEPlayVideoViewController$player$didChangeStallState$, (IMP*)&_logos_orig$_ungrouped$AWEPlayVideoViewController$player$didChangeStallState$);MSHookMessageEx(_logos_class$_ungrouped$AWEPlayVideoViewController, @selector(player:playbackFailedWithError:), (IMP)&_logos_method$_ungrouped$AWEPlayVideoViewController$player$playbackFailedWithError$, (IMP*)&_logos_orig$_ungrouped$AWEPlayVideoViewController$player$playbackFailedWithError$);MSHookMessageEx(_logos_class$_ungrouped$AWEPlayVideoViewController, @selector(player:playbackFailedForURL:error:), (IMP)&_logos_method$_ungrouped$AWEPlayVideoViewController$player$playbackFailedForURL$error$, (IMP*)&_logos_orig$_ungrouped$AWEPlayVideoViewController$player$playbackFailedForURL$error$);MSHookMessageEx(_logos_class$_ungrouped$AWEPlayVideoViewController, @selector(_alertIfNotValid), (IMP)&_logos_method$_ungrouped$AWEPlayVideoViewController$_alertIfNotValid, (IMP*)&_logos_orig$_ungrouped$AWEPlayVideoViewController$_alertIfNotValid);MSHookMessageEx(_logos_class$_ungrouped$AWEPlayVideoViewController, @selector(alertIfNotValid), (IMP)&_logos_method$_ungrouped$AWEPlayVideoViewController$alertIfNotValid, (IMP*)&_logos_orig$_ungrouped$AWEPlayVideoViewController$alertIfNotValid);MSHookMessageEx(_logos_class$_ungrouped$AWEPlayVideoViewController, @selector(videoShouldPlay), (IMP)&_logos_method$_ungrouped$AWEPlayVideoViewController$videoShouldPlay, (IMP*)&_logos_orig$_ungrouped$AWEPlayVideoViewController$videoShouldPlay);MSHookMessageEx(_logos_class$_ungrouped$AWEPlayVideoViewController, @selector(observeValueForKeyPath:ofObject:change:context:), (IMP)&_logos_method$_ungrouped$AWEPlayVideoViewController$observeValueForKeyPath$ofObject$change$context$, (IMP*)&_logos_orig$_ungrouped$AWEPlayVideoViewController$observeValueForKeyPath$ofObject$change$context$);MSHookMessageEx(_logos_class$_ungrouped$AWEPlayVideoViewController, @selector(contentModeForDefaultVideoCover), (IMP)&_logos_method$_ungrouped$AWEPlayVideoViewController$contentModeForDefaultVideoCover, (IMP*)&_logos_orig$_ungrouped$AWEPlayVideoViewController$contentModeForDefaultVideoCover);MSHookMessageEx(_logos_class$_ungrouped$AWEPlayVideoViewController, @selector(isActive), (IMP)&_logos_method$_ungrouped$AWEPlayVideoViewController$isActive, (IMP*)&_logos_orig$_ungrouped$AWEPlayVideoViewController$isActive);MSHookMessageEx(_logos_class$_ungrouped$AWEPlayVideoViewController, @selector(getPlayModeWithAutoPlayMode), (IMP)&_logos_method$_ungrouped$AWEPlayVideoViewController$getPlayModeWithAutoPlayMode, (IMP*)&_logos_orig$_ungrouped$AWEPlayVideoViewController$getPlayModeWithAutoPlayMode);MSHookMessageEx(_logos_class$_ungrouped$AWEPlayVideoViewController, @selector(_getVideoPlayQualityParams), (IMP)&_logos_method$_ungrouped$AWEPlayVideoViewController$_getVideoPlayQualityParams, (IMP*)&_logos_orig$_ungrouped$AWEPlayVideoViewController$_getVideoPlayQualityParams);Class _logos_class$_ungrouped$AWEAwemePlayVideoViewController = objc_getClass("AWEAwemePlayVideoViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayVideoViewController, @selector(videoShouldPlay), (IMP)&_logos_method$_ungrouped$AWEAwemePlayVideoViewController$videoShouldPlay, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayVideoViewController$videoShouldPlay);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayVideoViewController, @selector(alertIfNotValid), (IMP)&_logos_method$_ungrouped$AWEAwemePlayVideoViewController$alertIfNotValid, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayVideoViewController$alertIfNotValid);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayVideoViewController, @selector(pause), (IMP)&_logos_method$_ungrouped$AWEAwemePlayVideoViewController$pause, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayVideoViewController$pause);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayVideoViewController, @selector(stop), (IMP)&_logos_method$_ungrouped$AWEAwemePlayVideoViewController$stop, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayVideoViewController$stop);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayVideoViewController, @selector(play), (IMP)&_logos_method$_ungrouped$AWEAwemePlayVideoViewController$play, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayVideoViewController$play);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayVideoViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$AWEAwemePlayVideoViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayVideoViewController$viewDidLoad);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayVideoViewController, @selector(player:playbackFailedWithError:), (IMP)&_logos_method$_ungrouped$AWEAwemePlayVideoViewController$player$playbackFailedWithError$, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayVideoViewController$player$playbackFailedWithError$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayVideoViewController, @selector(playerWillLoopPlaying:), (IMP)&_logos_method$_ungrouped$AWEAwemePlayVideoViewController$playerWillLoopPlaying$, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayVideoViewController$playerWillLoopPlaying$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayVideoViewController, @selector(checkAdVideo), (IMP)&_logos_method$_ungrouped$AWEAwemePlayVideoViewController$checkAdVideo, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayVideoViewController$checkAdVideo);Class _logos_class$_ungrouped$AWELikeWorkViewController = objc_getClass("AWELikeWorkViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWELikeWorkViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$AWELikeWorkViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$AWELikeWorkViewController$viewDidLoad);MSHookMessageEx(_logos_class$_ungrouped$AWELikeWorkViewController, @selector(collectionView:cellForItemAtIndexPath:), (IMP)&_logos_method$_ungrouped$AWELikeWorkViewController$collectionView$cellForItemAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$AWELikeWorkViewController$collectionView$cellForItemAtIndexPath$);MSHookMessageEx(_logos_class$_ungrouped$AWELikeWorkViewController, @selector(collectionView:didSelectItemAtIndexPath:), (IMP)&_logos_method$_ungrouped$AWELikeWorkViewController$collectionView$didSelectItemAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$AWELikeWorkViewController$collectionView$didSelectItemAtIndexPath$);Class _logos_class$_ungrouped$AWEAwemeModel = objc_getClass("AWEAwemeModel"); MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeModel, @selector(canBeReposted), (IMP)&_logos_method$_ungrouped$AWEAwemeModel$canBeReposted, (IMP*)&_logos_orig$_ungrouped$AWEAwemeModel$canBeReposted);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeModel, @selector(videoCommentStauts), (IMP)&_logos_method$_ungrouped$AWEAwemeModel$videoCommentStauts, (IMP*)&_logos_orig$_ungrouped$AWEAwemeModel$videoCommentStauts);Class _logos_class$_ungrouped$AWEAwemePlayInteractionPresenter = objc_getClass("AWEAwemePlayInteractionPresenter"); MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionPresenter, @selector(alertIfCanNotComment), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$alertIfCanNotComment, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$alertIfCanNotComment);Class _logos_class$_ungrouped$AWEAwemeBaseViewController = objc_getClass("AWEAwemeBaseViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeBaseViewController, @selector(alertIfNotValid), (IMP)&_logos_method$_ungrouped$AWEAwemeBaseViewController$alertIfNotValid, (IMP*)&_logos_orig$_ungrouped$AWEAwemeBaseViewController$alertIfNotValid);} }
#line 2310 "/Users/michael/Unicorn/Unicorn/Unicorn.xm"
