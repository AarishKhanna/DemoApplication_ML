
#import <MLKitCommon/MLKModelManager.h>

@class MLKTranslateRemoteModel;

NS_ASSUME_NONNULL_BEGIN

/** Extensions to `ModelManager` for Translate-specific functionality. */
@interface MLKModelManager (Translate)

/**
 * A set of already-downloaded translate models (including built-in models, currently only English).
 * These models can be then deleted through `ModelManager`'s `deleteDownloadedModel(_:completion:)`
 * API to manage disk space.
 */
@property(nonatomic, readonly) NSSet<MLKTranslateRemoteModel *> *downloadedTranslateModels;

@end

NS_ASSUME_NONNULL_END
