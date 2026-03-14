local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.ExperienceTags);
local v7 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForExperienceGuidelines);
local v8 = require(script.Parent.ExperienceDetailsExperimentation);
local v9 = game:DefineFastFlag("LuaAppExperienceTagsStrongLanguageContent", false);
local l_FFlagHideCloseButtonEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagHideCloseButtonEdp;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp;
local v15 = nil;
if v9 then
    v15 = function(v16) --[[ Line: 37 ]]
        if v16 == nil then
            return false;
        else
            for _, v18 in pairs(v16) do
                if v18.name == "strong-language" and v18.contains then
                    return true;
                end;
            end;
            return false;
        end;
    end;
end;
return function(v19) --[[ Line: 50 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useDispatch_0 (copy), v2 (copy), v7 (copy), l_FFlagHideCloseButtonEdp_0 (copy), l_useSelector_0 (copy), v9 (copy), v15 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v8 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v6 (copy)
    local v20 = l_useLocalization_0({
        strongLanguageWarning = "Feature.GameDetails.Label.ContainsStrongLanguagePillWarning"
    });
    local v21 = {};
    local function _(v22, v23) --[[ Line: 56 ]]
        -- upvalues: v21 (copy), v19 (copy)
        table.insert(v21, {
            text = v22, 
            onActivated = if v19.areTagsInteractable then v23 else nil
        });
    end;
    local v25 = l_useDispatch_0();
    local v26 = v2.useCallback(function() --[[ Line: 61 ]]
        -- upvalues: v25 (copy), v7 (ref), v19 (copy), l_FFlagHideCloseButtonEdp_0 (ref)
        v25(v7(v19.universeId, if l_FFlagHideCloseButtonEdp_0 then v19.hideCloseButton else false));
    end, {
        v19.universeId
    });
    local v28 = l_useSelector_0(function(v27) --[[ Line: 69 ]]
        -- upvalues: v19 (copy)
        return v27.AgeRecommendations[v19.universeId];
    end);
    if v19.includeAgeRecommendations and v28 then
        local l_summary_0 = v28.summary;
        local v30 = if l_summary_0 and l_summary_0.ageRecommendation then if l_summary_0.ageRecommendation.displayNameWithHeaderShort then l_summary_0.ageRecommendation.displayNameWithHeaderShort else l_summary_0.ageRecommendation.displayName else nil;
        if v30 then
            table.insert(v21, {
                text = v30, 
                onActivated = if v19.areTagsInteractable then v26 else nil
            });
        end;
    end;
    local v31 = if v9 then v15(v28 and v28.descriptorUsages) else nil;
    if (l_useSelector_0(function(v32) --[[ Line: 87 ]]
        -- upvalues: v19 (copy)
        return v32.AssetTextFilterSettings[v19.universeId];
    end) or v9 and v31) and (not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 and (not l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 or not v8.getShouldInterleaveSdui()) or v19.hideContentDescriptors ~= true) then
        table.insert(v21, {
            text = v20.strongLanguageWarning, 
            onActivated = if v19.areTagsInteractable then v26 else nil
        });
    end;
    local v34 = l_useSelector_0(function(v33) --[[ Line: 108 ]]
        -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v19 (copy)
        if l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v19.shouldHydrateLegacyIxp then
            return v33.GameDetailsV2[v19.universeId];
        else
            return v33.GameDetails[v19.universeId];
        end;
    end);
    local v35 = v34 and v34.licenseDescription or nil;
    if v35 then
        table.insert(v21, {
            text = v35, 
            onActivated = if v19.areTagsInteractable then nil else nil
        });
    end;
    if #v21 > 0 then
        return v2.createElement(v6, {
            LayoutOrder = v19.LayoutOrder, 
            contents = v21
        });
    else
        return nil;
    end;
end;