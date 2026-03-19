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
local function v25(v21) --[[ Line: 52 ]]
    -- upvalues: l_useMemo_0 (copy), l_formatEconomicRestrictionText_0 (copy), l_dependencyArray_0 (copy), l_useDispatch_0 (copy), l_useCallback_0 (copy), v13 (copy), v6 (copy), v20 (copy)
    local v22 = l_useMemo_0(function() --[[ Line: 53 ]]
        -- upvalues: l_formatEconomicRestrictionText_0 (ref), v21 (copy)
        return l_formatEconomicRestrictionText_0(v21.locMap, {
            violationType = v21.failureReason, 
            timeoutMinutes = v21.expirationTimeInMinutes
        }, true);
    end, l_dependencyArray_0(v21.failureReason, v21.expirationTimeInMinutes));
    local v23 = l_useDispatch_0();
    local v24 = l_useCallback_0(function() --[[ Line: 61 ]]
        -- upvalues: v23 (copy), v13 (ref)
        v23(v13());
    end, {});
    return v6.createElement(v20, {
        containerWidth = v21.containerWidth, 
        titleText = v21.locMap.titleText, 
        titleFont = v21.style.Font.Header1.Font, 
        messageText = v22, 
        messageFont = v21.style.Font.Body.Font, 
        buttonFont = v21.style.Font.Header2.Font, 
        confirmButtonText = v21.locMap.okButtonText, 
        onConfirm = v24, 
        hasCancelButton = false
    });
end;
return v6.memo(function(v26) --[[ Line: 79 ]]
    -- upvalues: l_useMemo_0 (copy), l_addEconomicRestrictionKeysToLocalization_0 (copy), l_dependencyArray_0 (copy), l_useEffect_0 (copy), l_default_0 (copy), l_EconomicRestrictionsCounter_0 (copy), v6 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_withLocalization_0 (copy), l_withStyle_0 (copy), v25 (copy)
    local v28 = l_useMemo_0(function() --[[ Line: 80 ]]
        -- upvalues: l_addEconomicRestrictionKeysToLocalization_0 (ref)
        local v27 = {
            titleText = "IAPExperience.PurchaseError.Text.EconomicRestrictionPromptTitle"
        };
        l_addEconomicRestrictionKeysToLocalization_0(v27);
        return v27;
    end, l_dependencyArray_0(v26.failureReason, v26.expirationTimeInMinutes));
    l_useEffect_0(function() --[[ Line: 88 ]]
        -- upvalues: l_default_0 (ref), l_EconomicRestrictionsCounter_0 (ref), v26 (copy)
        l_default_0:logRobloxTelemetryCounter(l_EconomicRestrictionsCounter_0.EconomicRestrictionsPromptCounter, 1, {
            failureReason = v26.failureReason
        });
    end, l_dependencyArray_0(v26.failureReason, v26.expirationTimeInMinutes));
    return v6.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        Alert = l_withLocalization_0(v28)(function(v29) --[[ Line: 97 ]]
            -- upvalues: l_withStyle_0 (ref), v6 (ref), v25 (ref), v26 (copy)
            return l_withStyle_0(function(v30) --[[ Line: 98 ]]
                -- upvalues: v6 (ref), v25 (ref), v29 (copy), v26 (ref)
                return v6.createElement(v25, {
                    style = v30, 
                    locMap = v29, 
                    failureReason = v26.failureReason, 
                    expirationTimeInMinutes = v26.expirationTimeInMinutes, 
                    containerWidth = v26.containerWidth, 
                    defaultChildRef = v26.defaultChildRef, 
                    focusController = v26.focusController
                });
            end);
        end)
    });
end);