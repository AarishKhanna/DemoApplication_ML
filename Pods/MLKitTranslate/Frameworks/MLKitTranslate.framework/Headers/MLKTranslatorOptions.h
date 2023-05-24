#import <Foundation/Foundation.h>


#import <MLKitTranslate/MLKTranslateLanguage.h>

NS_ASSUME_NONNULL_BEGIN

/** Options for `Translator`. */
NS_SWIFT_NAME(TranslatorOptions)
@interface MLKTranslatorOptions : NSObject

/** The source language of the input. */
@property(nonatomic, readonly) MLKTranslateLanguage sourceLanguage;

/** The target language to translate the input into. */
@property(nonatomic, readonly) MLKTranslateLanguage targetLanguage;

/**
 * Creates a new instance of translator options with the given source and target languages.
 *
 * @param sourceLanguage The source language for the translator.
 * @param targetLanguage The target language for the translator.
 * @return A new instance of `TranslatorOptions` with the given source and target language.
 */
- (instancetype)initWithSourceLanguage:(MLKTranslateLanguage)sourceLanguage
                        targetLanguage:(MLKTranslateLanguage)targetLanguage
    NS_DESIGNATED_INITIALIZER;

/** Unavailable. Use `init(sourceLanguage:targetLanguage:)` instead. */
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
