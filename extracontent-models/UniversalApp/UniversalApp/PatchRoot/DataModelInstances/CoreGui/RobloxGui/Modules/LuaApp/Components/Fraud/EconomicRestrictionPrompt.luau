local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales).Localization;
local v6 = require(l_CorePackages_0.Packages.React);
local v7 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useEffect_0 = v6.useEffect;
local l_useMemo_0 = v6.useMemo;
local l_dependencyArray_0 = v7.Hooks.dependencyArray;
local l_useDispatch_0 = v7.Hooks.RoactRodux.useDispatch;
local l_useCallback_0 = v6.useCallback;
local v13 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v15 = require(l_CorePackages_0.Workspace.Packages.IAPExperience);
local l_addEconomicRestrictionKeysToLocalization_0 = v15.Utility.addEconomicRestrictionKeysToLocalization;
local l_formatEconomicRestrictionText_0 = v15.Utility.formatEconomicRestrictionText;
local l_EconomicRestrictionsCounter_0 = v15.Counters.EconomicRestrictionsCounter;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v20 = require(l_Modules_0.LuaApp.Components.AlertWindow);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local function v26(v22) --[[ Line: 55 ]]
    -- upvalues: l_useMemo_0 (copy), l_formatEconomicRestrictionText_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useDispatch_0 (copy), l_useCallback_0 (copy), v13 (copy), v6 (copy), v20 (copy)
    local v23 = l_useMemo_0(function() --[[ Line: 57 ]]
        -- upvalues: l_formatEconomicRestrictionText_0 (ref), v22 (copy)
        return l_formatEconomicRestrictionText_0(v22.locMap, {
            violationType = v22.failureReason, 
            timeoutMinutes = v22.expirationTimeInMinutes
        }, true);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v22.failureReason, 
        v22.expirationTimeInMinutes
    } else l_dependencyArray_0(v22.failureReason, v22.expirationTimeInMinutes));
    local v24 = l_useDispatch_0();
    local v25 = l_useCallback_0(function() --[[ Line: 69 ]]
        -- upvalues: v24 (copy), v13 (ref)
        v24(v13());
    end, {});
    return v6.createElement(v20, {
        containerWidth = v22.containerWidth, 
        titleText = v22.locMap.titleText, 
        titleFont = v22.style.Font.Header1.Font, 
        messageText = v23, 
        messageFont = v22.style.Font.Body.Font, 
        buttonFont = v22.style.Font.Header2.Font, 
        confirmButtonText = v22.locMap.okButtonText, 
        onConfirm = v25, 
        hasCancelButton = false
    });
end;
return v6.memo(function(v27) --[[ Line: 87 ]]
    -- upvalues: l_useMemo_0 (copy), l_addEconomicRestrictionKeysToLocalization_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useEffect_0 (copy), l_default_0 (copy), l_EconomicRestrictionsCounter_0 (copy), v6 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_withLocalization_0 (copy), l_withStyle_0 (copy), v26 (copy)
    local v29 = l_useMemo_0(function() --[[ Line: 89 ]]
        -- upvalues: l_addEconomicRestrictionKeysToLocalization_0 (ref)
        local v28 = {
            titleText = "IAPExperience.PurchaseError.Text.EconomicRestrictionPromptTitle"
        };
        l_addEconomicRestrictionKeysToLocalization_0(v28);
        return v28;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v27.failureReason, 
        v27.expirationTimeInMinutes
    } else l_dependencyArray_0(v27.failureReason, v27.expirationTimeInMinutes));
    l_useEffect_0(function() --[[ Line: 102 ]]
        -- upvalues: l_default_0 (ref), l_EconomicRestrictionsCounter_0 (ref), v27 (copy)
        l_default_0:logRobloxTelemetryCounter(l_EconomicRestrictionsCounter_0.EconomicRestrictionsPromptCounter, 1, {
            failureReason = v27.failureReason
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v27.failureReason, 
        v27.expirationTimeInMinutes
    } else l_dependencyArray_0(v27.failureReason, v27.expirationTimeInMinutes));
    return v6.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        Alert = l_withLocalization_0(v29)(function(v30) --[[ Line: 119 ]]
            -- upvalues: l_withStyle_0 (ref), v6 (ref), v26 (ref), v27 (copy)
            return l_withStyle_0(function(v31) --[[ Line: 120 ]]
                -- upvalues: v6 (ref), v26 (ref), v30 (copy), v27 (ref)
                return v6.createElement(v26, {
                    style = v31, 
                    locMap = v30, 
                    failureReason = v27.failureReason, 
                    expirationTimeInMinutes = v27.expirationTimeInMinutes, 
                    containerWidth = v27.containerWidth, 
                    defaultChildRef = v27.defaultChildRef, 
                    focusController = v27.focusController
                });
            end);
        end)
    });
end);