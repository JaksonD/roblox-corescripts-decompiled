local l_Parent_0 = script.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ExperienceStateCaptureService_0 = game:GetService("ExperienceStateCaptureService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Roact);
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local l_LayerCollectorProvider_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider;
local l_FoundationProvider_0 = require(l_Parent_0.Foundation).FoundationProvider;
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_FFlagHighlightModePreciseSelectionEnabled_0 = require(l_Parent_0.SharedFlags).FFlagHighlightModePreciseSelectionEnabled;
local v12 = require(script.Analysis.SceneAnalysis);
local v13 = require(script.InGameAssetReportUI.Components.InGameAssetReportMode);
local v14 = require(script.InGameAssetReportUI.Components.PreciseSelection.InGameAssetReportModePreciseSelection);
local v15 = require(script.Utility.getHighlightModeVariant);
local l_HighlightModeVariants_0 = require(script.InGameAssetReportUI.Resources.Constants).HighlightModeVariants;
local v17 = {
    [l_HighlightModeVariants_0.Default] = v13, 
    [l_HighlightModeVariants_0.NoPreview] = v14
};
return {
    interpretAnnotation = v12.interpretAnnotation, 
    extractItemsFromInterpretations = v12.extractItemsFromInterpretations, 
    __setRandomGenerator = v12.__setRandomGenerator, 
    initialize = function() --[[ Line: 38 ]]
        -- upvalues: v13 (copy), l_FFlagHighlightModePreciseSelectionEnabled_0 (copy), v15 (copy), l_HighlightModeVariants_0 (copy), v17 (copy), v4 (copy), l_LayerCollectorProvider_0 (copy), l_FoundationProvider_0 (copy), v5 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_StyleProviderWithDefaultTheme_0 (copy), l_ExperienceStateCaptureService_0 (copy), l_CoreGui_0 (copy)
        local v18 = nil;
        local l_v13_0 = v13;
        if l_FFlagHighlightModePreciseSelectionEnabled_0 then
            v18 = v15();
            if v18 ~= l_HighlightModeVariants_0.Default and v17[v18] ~= nil then
                game:GetService("ExperienceStateCaptureService").SelectionMode = Enum.ExperienceStateCaptureSelectionMode.SafetyHighlightMode;
                l_v13_0 = v17[v18];
            end;
        end;
        local v22 = v4.createElement("ScreenGui", {
            IgnoreGuiInset = true, 
            OnTopOfCoreBlur = false, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            LayerCollectorProvider = v4.createElement(l_LayerCollectorProvider_0, {}, {
                FoundationProvider = v4.createElement(l_FoundationProvider_0, {
                    theme = "Dark"
                }, {
                    LocalizationProvider = v5.createElement(l_LocalizationProvider_0, {
                        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
                    }, {
                        StyleProvider = v4.createElement(l_StyleProviderWithDefaultTheme_0, {
                            withDarkTheme = true
                        }, {
                            InGameAssetReportUI = v5.createElement(l_v13_0, {
                                backAction = function() --[[ Line: 69 ]] --[[ Name: backAction ]]
                                    -- upvalues: l_ExperienceStateCaptureService_0 (ref)
                                    l_ExperienceStateCaptureService_0:ToggleCaptureMode();
                                end, 
                                onReportComplete = function() --[[ Line: 72 ]] --[[ Name: onReportComplete ]]
                                    -- upvalues: l_ExperienceStateCaptureService_0 (ref)
                                    l_ExperienceStateCaptureService_0:ToggleCaptureMode();
                                end, 
                                getIsSmallPortraitMode = function(v20) --[[ Line: 75 ]] --[[ Name: getIsSmallPortraitMode ]]
                                    local v21 = false;
                                    if v20.X < v20.Y then
                                        v21 = v20.X < 800;
                                    end;
                                    return v21;
                                end
                            })
                        })
                    })
                })
            })
        });
        if game:GetEngineFeature("ExperienceStateCaptureHiddenSelection") then
            l_ExperienceStateCaptureService_0.HiddenSelectionEnabled = true;
        end;
        v5.mount(v22, l_CoreGui_0, "InGameAssetReportMode");
    end, 
    getHighlightModeVariant = v15, 
    HighlightModeVariants = l_HighlightModeVariants_0, 
    ["jest.config"] = script["jest.config"]
};