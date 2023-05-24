#import <Foundation/Foundation.h>

@class MLKModelDownloadConditions;
@class MLKTranslatorOptions;

NS_ASSUME_NONNULL_BEGIN

/**
 * A block that is invoked when the downloading of translate models is complete.
 *
 * @param error The error or `nil`.
 */
typedef void (^MLKTranslatorDownloadModelIfNeededCallback)(NSError *_Nullable error)
    NS_SWIFT_NAME(TranslatorDownloadModelIfNeededCallback);

/**
 * A block containing the translation result or `nil` if there's an error.
 *
 * @param result A translation result for the text or `nil` if there's an error.
 * @param error The error or `nil`.
 */
typedef void (^MLKTranslatorCallback)(NSString *_Nullable result, NSError *_Nullable error)
    NS_SWIFT_NAME(TranslatorCallback);

/** A class that translates the given input text. */
NS_SWIFT_NAME(Translator)
@interface MLKTranslator : NSObject

/**
 * Gets a `Translator` instance for the specified options. This method is thread safe.
 *
 * @param options The options for the translator.
 * @return A `Translator` instance that provides translation with the given options.
 */
+ (MLKTranslator *)translatorWithOptions:(MLKTranslatorOptions *)options
    NS_SWIFT_NAME(translator(options:));

/**
 * Translates the given text from the source language into the target language.
 *
 * @discussion This method will return an error if the model files have not been downloaded.
 *
 * @param text A string in the source language.
 * @param completion Handler to call back on the main queue with the translation result or error.
 */
- (void)translateText:(NSString *)text
           completion:(MLKTranslatorCallback)completion NS_SWIFT_NAME(translate(_:completion:));

/**
 * Downloads the model files required for translation, if they are not already downloaded.
 *
 * @param completion Handler to call back on the main queue with an error, if any.
 */
- (void)downloadModelIfNeededWithCompletion:(MLKTranslatorDownloadModelIfNeededCallback)completion;

/**
 * Downloads the model files required for translation when the given conditions are met. If model
 * has already been downloaded, completes without additional work.
 *
 * @param conditions The downloading conditions for the translate model.
 * @param completion Handler to call back on the main queue with an error, if any.
 */
- (void)downloadModelIfNeededWithConditions:(MLKModelDownloadConditions *)conditions
                                 completion:(MLKTranslatorDownloadModelIfNeededCallback)completion;

/** Unavailable. */
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
