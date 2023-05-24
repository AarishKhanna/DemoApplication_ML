#import <Foundation/Foundation.h>


#import <MLKitCommon/MLKRemoteModel.h>
#import <MLKitTranslate/MLKTranslateLanguage.h>

NS_ASSUME_NONNULL_BEGIN

/** A translate model that is stored remotely on the server and downloaded on the device. */
NS_SWIFT_NAME(TranslateRemoteModel)
@interface MLKTranslateRemoteModel : MLKRemoteModel

/** The language associated with this model. */
@property(nonatomic, readonly) MLKTranslateLanguage language;

/**
 * Gets an instance of `TranslateRemoteModel` configured with the given language.
 * This model can be used to trigger a download by calling `download(_:)` API
 * from `ModelManager`.
 *
 * @discussion `TranslateRemoteModel` uses `ModelManager` internally. When downloading
 *     a `TranslateRemoteModel`, there will be a notification posted for a `RemoteModel`.
 *     To verify if such notifications belong to a `TranslateRemoteModel`, check
 *     that the `ModelDownloadUserInfoKeyRemoteModel` field in the user info dictionary
 *     contains an object of type `TranslateRemoteModel`. Please do not instantiate
 *     with `TranslateLanguage.english` given it is built-in. Otherwise such instance
 *     cannot be downloaded or deleted.
 *
 * @param language The given language.
 * @return A `TranslateRemoteModel` instance.
 */
+ (MLKTranslateRemoteModel *)translateRemoteModelWithLanguage:(MLKTranslateLanguage)language
    NS_SWIFT_NAME(translateRemoteModel(language:));

/** Unavailable. Use `translateRemoteModel(language:)` instead. */
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
