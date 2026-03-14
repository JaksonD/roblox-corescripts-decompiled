game:DefineFastString("AdsVolumeOffImageLua", "rbxassetid://14986179621");
game:DefineFastString("AdsVolumeOnImageLua", "rbxassetid://14986178697");
game:DefineFastString("AdsEnterFullscreenImageLua", "rbxassetid://14986182327");
game:DefineFastString("AdsExitFullscreenImageLua", "rbxassetid://14986181606");
game:DefineFastString("AdsEudsaPromptActiveImageLua", "rbxassetid://16017622465");
game:DefineFastString("AdsEudsaPromptInactiveImageLua", "rbxassetid://16040129720");
game:DefineFastString("AdGuiPlayButtonImageLua", "rbxassetid://16639542545");
game:DefineFastString("AdGuiPauseButtonImageLua", "rbxassetid://16639540538");
game:DefineFastString("AdGuiCloseButtonImageLua", "rbxassetid://16639540023");
game:DefineFastString("AdGuiLivePreviewWatermark", "rbxassetid://18539441909");
game:DefineFastString("AdGuiLivePreviewWatermarkV2", "rbxassetid://18641531344");
game:DefineFastString("LivePreviewPlaceId", "-1");
game:DefineFastFlag("UseV2LivePreviewWatermark", false);
game:DefineFastFlag("EnableReportAdDropdown5", false);
game:DefineFastInt("UniversalAppPolicyFailureTelemetryThrottleHundredthsPercent", 10000);
game:DefineFastFlag("EnableHideReportAdModalDuringScreenshot2", false);
game:DefineFastInt("AdGuiInteractivityPixelsPerStud", 50);
return {
    GetFStringAdsVolumeOffImageLua = function() --[[ Line: 20 ]] --[[ Name: GetFStringAdsVolumeOffImageLua ]]
        return game:GetFastString("AdsVolumeOffImageLua");
    end, 
    GetFStringAdsVolumeOnImageLua = function() --[[ Line: 23 ]] --[[ Name: GetFStringAdsVolumeOnImageLua ]]
        return game:GetFastString("AdsVolumeOnImageLua");
    end, 
    GetFStringAdsEnterFullscreenImageLua = function() --[[ Line: 26 ]] --[[ Name: GetFStringAdsEnterFullscreenImageLua ]]
        return game:GetFastString("AdsEnterFullscreenImageLua");
    end, 
    GetFStringAdsExitFullscreenImageLua = function() --[[ Line: 29 ]] --[[ Name: GetFStringAdsExitFullscreenImageLua ]]
        return game:GetFastString("AdsExitFullscreenImageLua");
    end, 
    GetFStringAdsEudsaPromptActiveImageLua = function() --[[ Line: 32 ]] --[[ Name: GetFStringAdsEudsaPromptActiveImageLua ]]
        return game:GetFastString("AdsEudsaPromptActiveImageLua");
    end, 
    GetFStringAdsEudsaPromptInactiveImageLua = function() --[[ Line: 35 ]] --[[ Name: GetFStringAdsEudsaPromptInactiveImageLua ]]
        return game:GetFastString("AdsEudsaPromptInactiveImageLua");
    end, 
    GetFStringAdGuiPlayButtonImageLua = function() --[[ Line: 38 ]] --[[ Name: GetFStringAdGuiPlayButtonImageLua ]]
        return game:GetFastString("AdGuiPlayButtonImageLua");
    end, 
    GetFStringAdGuiPauseButtonImageLua = function() --[[ Line: 41 ]] --[[ Name: GetFStringAdGuiPauseButtonImageLua ]]
        return game:GetFastString("AdGuiPauseButtonImageLua");
    end, 
    GetFStringAdGuiCloseButtonImageLua = function() --[[ Line: 44 ]] --[[ Name: GetFStringAdGuiCloseButtonImageLua ]]
        return game:GetFastString("AdGuiCloseButtonImageLua");
    end, 
    GetFStringAdGuiLivePreviewWatermark = function() --[[ Line: 47 ]] --[[ Name: GetFStringAdGuiLivePreviewWatermark ]]
        return game:GetFastString("AdGuiLivePreviewWatermark");
    end, 
    GetFStringLivePreviewPlaceId = function() --[[ Line: 50 ]] --[[ Name: GetFStringLivePreviewPlaceId ]]
        return game:GetFastString("LivePreviewPlaceId");
    end, 
    GetFFlagUseV2LivePreviewWatermark = function() --[[ Line: 53 ]] --[[ Name: GetFFlagUseV2LivePreviewWatermark ]]
        return game:GetFastFlag("UseV2LivePreviewWatermark");
    end, 
    GetFStringAdGuiLivePreviewWatermarkV2 = function() --[[ Line: 56 ]] --[[ Name: GetFStringAdGuiLivePreviewWatermarkV2 ]]
        return game:GetFastString("AdGuiLivePreviewWatermarkV2");
    end, 
    GetFFlagEnableReportAdDropdown = function() --[[ Line: 59 ]] --[[ Name: GetFFlagEnableReportAdDropdown ]]
        return game:GetFastFlag("EnableReportAdDropdown5");
    end, 
    GetFIntUniversalAppPolicyFailureTelemetryThrottleHundredthsPercent = function() --[[ Line: 62 ]] --[[ Name: GetFIntUniversalAppPolicyFailureTelemetryThrottleHundredthsPercent ]]
        return game:GetFastInt("UniversalAppPolicyFailureTelemetryThrottleHundredthsPercent");
    end, 
    GetEnableHideReportAdModalDuringScreenshot = function() --[[ Line: 65 ]] --[[ Name: GetEnableHideReportAdModalDuringScreenshot ]]
        return game:GetFastFlag("EnableHideReportAdModalDuringScreenshot2");
    end, 
    GetAdGuiInteractivityPixelsPerStud = function() --[[ Line: 68 ]] --[[ Name: GetAdGuiInteractivityPixelsPerStud ]]
        return game:GetFastInt("AdGuiInteractivityPixelsPerStud");
    end
};