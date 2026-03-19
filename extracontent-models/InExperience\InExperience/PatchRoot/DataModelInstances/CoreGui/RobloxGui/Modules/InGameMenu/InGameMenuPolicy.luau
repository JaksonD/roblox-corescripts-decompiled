local l_CorePackages_0 = game:GetService("CorePackages");
local l_PolicyProvider_0 = require(l_CorePackages_0.Packages.InGameMenuDependencies).PolicyProvider;
local l_SharedFlags_0 = l_CorePackages_0.Workspace.Packages.SharedFlags;
local l_GetFFlagUseVoiceExitBetaLanguage_0 = require(l_SharedFlags_0).GetFFlagUseVoiceExitBetaLanguage;
local l_GetFFlagGateEducationalPopupVisibilityViaGUAC_0 = require(l_SharedFlags_0).GetFFlagGateEducationalPopupVisibilityViaGUAC;
local v5 = l_PolicyProvider_0.GetPolicyImplementations.MemStorageService("app-policy");
local v6 = l_PolicyProvider_0.withGetPolicyImplementation(v5);
local v7 = require(script.Parent.Parent.Flags.GetFIntEducationalPopupDisplayMaxCount);
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
v6.Mapper = function(v9) --[[ Line: 16 ]]
    -- upvalues: l_isSubjectToDesktopPolicies_0 (copy), l_GetFFlagGateEducationalPopupVisibilityViaGUAC_0 (copy), v7 (copy), l_GetFFlagUseVoiceExitBetaLanguage_0 (copy)
    return {
        enableInGameHomeIcon = function() --[[ Line: 18 ]] --[[ Name: enableInGameHomeIcon ]]
            -- upvalues: l_isSubjectToDesktopPolicies_0 (ref)
            return l_isSubjectToDesktopPolicies_0();
        end, 
        enableEducationalPopup = function() --[[ Line: 22 ]] --[[ Name: enableEducationalPopup ]]
            -- upvalues: l_isSubjectToDesktopPolicies_0 (ref), l_GetFFlagGateEducationalPopupVisibilityViaGUAC_0 (ref), v9 (copy)
            local l_game_EngineFeature_0 = game:GetEngineFeature("NativeCloseIntercept");
            if l_isSubjectToDesktopPolicies_0() and l_game_EngineFeature_0 then
                if l_GetFFlagGateEducationalPopupVisibilityViaGUAC_0() then
                    if v9.InExperienceCanViewEducationalPopup == nil then
                        return true;
                    else
                        return v9.InExperienceCanViewEducationalPopup;
                    end;
                else
                    return true;
                end;
            else
                return false;
            end;
        end, 
        educationalPopupMaxDisplayCount = function() --[[ Line: 35 ]] --[[ Name: educationalPopupMaxDisplayCount ]]
            -- upvalues: l_isSubjectToDesktopPolicies_0 (ref), v7 (ref)
            return l_isSubjectToDesktopPolicies_0() and v7() or 0;
        end, 
        getGameInfoShowChatFeatures = function() --[[ Line: 39 ]] --[[ Name: getGameInfoShowChatFeatures ]]
            -- upvalues: l_GetFFlagUseVoiceExitBetaLanguage_0 (ref), v9 (copy)
            if l_GetFFlagUseVoiceExitBetaLanguage_0() then
                return v9.GameInfoShowChatFeatures or false;
            else
                return false;
            end;
        end, 
        enableFullscreenTitleBar = function() --[[ Line: 46 ]] --[[ Name: enableFullscreenTitleBar ]]
            -- upvalues: v9 (copy)
            return v9.FullscreenTitleBarEnabled or false;
        end, 
        getDisplayCheckboxInVoiceConsent = function() --[[ Line: 50 ]] --[[ Name: getDisplayCheckboxInVoiceConsent ]]
            -- upvalues: v9 (copy)
            if v9.DisplayCheckboxInVoiceConsent == nil then
                return true;
            else
                return v9.DisplayCheckboxInVoiceConsent;
            end;
        end
    };
end;
return v6;