#import <Foundation/Foundation.h>

#if defined __cplusplus
extern "C" {
#endif  // __cplusplus

NS_ASSUME_NONNULL_BEGIN

/**
 * This enum specifies the languages that are supported by `Translator`.
 */
typedef NSString* MLKTranslateLanguage NS_TYPED_ENUM NS_SWIFT_NAME(TranslateLanguage);
/** Afrikaans. */ extern MLKTranslateLanguage const MLKTranslateLanguageAfrikaans
    NS_SWIFT_NAME(afrikaans);
/** Albanian. */ extern MLKTranslateLanguage const MLKTranslateLanguageAlbanian
    NS_SWIFT_NAME(albanian);
/** Arabic. */ extern MLKTranslateLanguage const MLKTranslateLanguageArabic NS_SWIFT_NAME(arabic);
/** Belarusian. */ extern MLKTranslateLanguage const MLKTranslateLanguageBelarusian
    NS_SWIFT_NAME(belarusian);
/** Bengali. */ extern MLKTranslateLanguage const MLKTranslateLanguageBengali
    NS_SWIFT_NAME(bengali);
/** Bulgarian. */ extern MLKTranslateLanguage const MLKTranslateLanguageBulgarian
    NS_SWIFT_NAME(bulgarian);
/** Catalan. */ extern MLKTranslateLanguage const MLKTranslateLanguageCatalan
    NS_SWIFT_NAME(catalan);
/** Chinese. */ extern MLKTranslateLanguage const MLKTranslateLanguageChinese
    NS_SWIFT_NAME(chinese);
/** Croatian. */ extern MLKTranslateLanguage const MLKTranslateLanguageCroatian
    NS_SWIFT_NAME(croatian);
/** Czech. */ extern MLKTranslateLanguage const MLKTranslateLanguageCzech NS_SWIFT_NAME(czech);
/** Danish. */ extern MLKTranslateLanguage const MLKTranslateLanguageDanish NS_SWIFT_NAME(danish);
/** Dutch. */ extern MLKTranslateLanguage const MLKTranslateLanguageDutch NS_SWIFT_NAME(dutch);
/** English. */ extern MLKTranslateLanguage const MLKTranslateLanguageEnglish
    NS_SWIFT_NAME(english);
/** Esperanto. */ extern MLKTranslateLanguage const MLKTranslateLanguageEsperanto
    NS_SWIFT_NAME(eperanto);
/** Estonian. */ extern MLKTranslateLanguage const MLKTranslateLanguageEstonian
    NS_SWIFT_NAME(estonian);
/** Finnish. */ extern MLKTranslateLanguage const MLKTranslateLanguageFinnish
    NS_SWIFT_NAME(finnish);
/** French. */ extern MLKTranslateLanguage const MLKTranslateLanguageFrench NS_SWIFT_NAME(french);
/** Galician. */ extern MLKTranslateLanguage const MLKTranslateLanguageGalician
    NS_SWIFT_NAME(galician);
/** Georgian. */ extern MLKTranslateLanguage const MLKTranslateLanguageGeorgian
    NS_SWIFT_NAME(georgian);
/** German. */ extern MLKTranslateLanguage const MLKTranslateLanguageGerman NS_SWIFT_NAME(german);
/** Greek. */ extern MLKTranslateLanguage const MLKTranslateLanguageGreek NS_SWIFT_NAME(greek);
/** Gujarati. */ extern MLKTranslateLanguage const MLKTranslateLanguageGujarati
    NS_SWIFT_NAME(gujarati);
/** Haitian Creole. */ extern MLKTranslateLanguage const MLKTranslateLanguageHaitianCreole
    NS_SWIFT_NAME(haitianCreole);
/** Hebrew. */ extern MLKTranslateLanguage const MLKTranslateLanguageHebrew NS_SWIFT_NAME(hebrew);
/** Hindi. */ extern MLKTranslateLanguage const MLKTranslateLanguageHindi NS_SWIFT_NAME(hindi);
/** Hungarian. */ extern MLKTranslateLanguage const MLKTranslateLanguageHungarian
    NS_SWIFT_NAME(hungarian);
/** Icelandic. */ extern MLKTranslateLanguage const MLKTranslateLanguageIcelandic
    NS_SWIFT_NAME(icelandic);
/** Indonesian. */ extern MLKTranslateLanguage const MLKTranslateLanguageIndonesian
    NS_SWIFT_NAME(indonesian);
/** Irish. */ extern MLKTranslateLanguage const MLKTranslateLanguageIrish NS_SWIFT_NAME(irish);
/** Italian. */ extern MLKTranslateLanguage const MLKTranslateLanguageItalian
    NS_SWIFT_NAME(italian);
/** Japanese. */ extern MLKTranslateLanguage const MLKTranslateLanguageJapanese
    NS_SWIFT_NAME(japanese);
/** Kannada. */ extern MLKTranslateLanguage const MLKTranslateLanguageKannada
    NS_SWIFT_NAME(kannada);
/** Korean. */ extern MLKTranslateLanguage const MLKTranslateLanguageKorean NS_SWIFT_NAME(korean);
/** Latvian. */ extern MLKTranslateLanguage const MLKTranslateLanguageLatvian
    NS_SWIFT_NAME(latvian);
/** Lithuanian. */ extern MLKTranslateLanguage const MLKTranslateLanguageLithuanian
    NS_SWIFT_NAME(lithuanian);
/** Macedonian. */ extern MLKTranslateLanguage const MLKTranslateLanguageMacedonian
    NS_SWIFT_NAME(macedonian);
/** Malay. */ extern MLKTranslateLanguage const MLKTranslateLanguageMalay NS_SWIFT_NAME(malay);
/** Maltese. */ extern MLKTranslateLanguage const MLKTranslateLanguageMaltese
    NS_SWIFT_NAME(maltese);
/** Marathi. */ extern MLKTranslateLanguage const MLKTranslateLanguageMarathi
    NS_SWIFT_NAME(marathi);
/** Norwegian. */ extern MLKTranslateLanguage const MLKTranslateLanguageNorwegian
    NS_SWIFT_NAME(norwegian);
/** Persian. */ extern MLKTranslateLanguage const MLKTranslateLanguagePersian
    NS_SWIFT_NAME(persian);
/** Polish. */ extern MLKTranslateLanguage const MLKTranslateLanguagePolish NS_SWIFT_NAME(polish);
/** Portuguese. */ extern MLKTranslateLanguage const MLKTranslateLanguagePortuguese
    NS_SWIFT_NAME(portuguese);
/** Romanian. */ extern MLKTranslateLanguage const MLKTranslateLanguageRomanian
    NS_SWIFT_NAME(romanian);
/** Russian. */ extern MLKTranslateLanguage const MLKTranslateLanguageRussian
    NS_SWIFT_NAME(russian);
/** Slovak. */ extern MLKTranslateLanguage const MLKTranslateLanguageSlovak NS_SWIFT_NAME(slovak);
/** Slovenian. */ extern MLKTranslateLanguage const MLKTranslateLanguageSlovenian
    NS_SWIFT_NAME(slovenian);
/** Spanish. */ extern MLKTranslateLanguage const MLKTranslateLanguageSpanish
    NS_SWIFT_NAME(spanish);
/** Swahili. */ extern MLKTranslateLanguage const MLKTranslateLanguageSwahili
    NS_SWIFT_NAME(swahili);
/** Swedish. */ extern MLKTranslateLanguage const MLKTranslateLanguageSwedish
    NS_SWIFT_NAME(swedish);
/** Tagalog. */ extern MLKTranslateLanguage const MLKTranslateLanguageTagalog
    NS_SWIFT_NAME(tagalog);
/** Tamil. */ extern MLKTranslateLanguage const MLKTranslateLanguageTamil NS_SWIFT_NAME(tamil);
/** Telugu. */ extern MLKTranslateLanguage const MLKTranslateLanguageTelugu NS_SWIFT_NAME(telugu);
/** Thai. */ extern MLKTranslateLanguage const MLKTranslateLanguageThai NS_SWIFT_NAME(thai);
/** Turkish. */ extern MLKTranslateLanguage const MLKTranslateLanguageTurkish
    NS_SWIFT_NAME(turkish);
/** Ukrainian. */ extern MLKTranslateLanguage const MLKTranslateLanguageUkrainian
    NS_SWIFT_NAME(ukrainian);
/** Urdu. */ extern MLKTranslateLanguage const MLKTranslateLanguageUrdu NS_SWIFT_NAME(urdu);
/** Vietnamese. */ extern MLKTranslateLanguage const MLKTranslateLanguageVietnamese
    NS_SWIFT_NAME(vietnamese);
/** Welsh. */ extern MLKTranslateLanguage const MLKTranslateLanguageWelsh NS_SWIFT_NAME(welsh);

/**
 * Returns a set that contains `TranslateLanguage` codes of all languages supported by the
 * translate API.
 */
NSSet<MLKTranslateLanguage>* MLKTranslateAllLanguages(void)
    NS_SWIFT_NAME(TranslateLanguage.allLanguages());

NS_ASSUME_NONNULL_END

#if defined __cplusplus
}
#endif  // __cplusplus
