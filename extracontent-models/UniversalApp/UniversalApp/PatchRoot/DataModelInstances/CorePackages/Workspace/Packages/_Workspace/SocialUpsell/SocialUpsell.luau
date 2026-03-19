local v0 = require(script.Components);
local _ = require(script.Types);
local v2 = require(script.Thunks);
local v3 = require(script.Enum);
return {
    InAppSocialUpsellOverlayWrapper = require(script.Components).InAppSocialUpsellOverlayWrapper, 
    UpsellBanner = v0.UpsellBanner, 
    SocialUpsellEventReceiver = v0.SocialUpsellEventReceiver, 
    Analytics = {
        SocialUpsellAnalytics = require(script.Analytics.SocialUpsellAnalytics), 
        Enum = require(script.Analytics.Enum)
    }, 
    Flags = {
        FFlagEnableAEGIS1HomePageBanner = require(script.Flag.FFlagEnableAEGIS1HomePageBanner), 
        FFlagEnableAEGIS1AppChatBanner = require(script.Flag.FFlagEnableAEGIS1AppChatBanner), 
        FFlagAddMinorFixesToUpsellAnalytics = require(script.Flag.FFlagAddMinorFixesToUpsellAnalytics), 
        FFlagAddAEGIS2Analytics = require(script.Flag.FFlagAddAEGIS2Analytics)
    }, 
    Enum = require(script.Enum), 
    Utils = {
        createCommonSocialUpsellBannerConfig = require(script.Utils.createCommonSocialUpsellBannerConfig), 
        createBannerConfigFromUpsellCardVariation = require(script.Utils.createBannerConfigFromUpsellCardVariation), 
        manuallyInvokeAmpUpsell = require(script.Utils.manuallyInvokeAmpUpsell)
    }, 
    Signals = {
        GetAgeVerifiedChangedSignal = require(script.Signals.GetAgeVerifiedChangedSignal)
    }, 
    Thunks = v2, 
    Enums = v3, 
    Hooks = require(script.Hooks), 
    Constants = require(script.Constants), 
    Overlay = {
        initializeInExpOverlay = require(script.Utils.initializeInExpOverlay), 
        getOverlayStore = require(script.Store.getOverlayStore), 
        OverlayTypes = require(script.Constants).OVERLAY_TYPES
    }, 
    ["jest.config"] = script["jest.config"]
};