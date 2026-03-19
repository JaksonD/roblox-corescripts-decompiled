local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local v1 = require(l_script_FirstAncestor_0.Api.CreateMakeupLook.createMakeupLook);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.AvatarExperienceCommon);
local v4 = require(l_Parent_0.AvatarExperienceFlags);
local v5 = require(l_Parent_0.AvatarExperienceAnalytics);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local v7 = require(l_Parent_0.Promise);
local v8 = require(l_Parent_0.ToastRodux);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_AVATAR_EDITOR_CONSTANTS_0 = v3.Constants.AVATAR_EDITOR_CONSTANTS;
local l_ToastType_0 = v8.Enums.ToastType;
local l_SetCurrentToastMessage_0 = v8.Actions.SetCurrentToastMessage;
local l_isMakeupOrEyebrowEyelashAssetType_0 = v3.Utils.isMakeupOrEyebrowEyelashAssetType;
local l_Constants_0 = v5.Constants;
local l_reportAvatarEventCounterNoAnalyticsArgument_0 = v5.reportAvatarEventCounterNoAnalyticsArgument;
local l_reportAvatarEventCounterV1_0 = v5.reportAvatarEventCounterV1;
local l_FIntAXLookOutfitCreationDelayMs_0 = v4.FIntAXLookOutfitCreationDelayMs;
local v18 = {
    toastMessage = "Feature.Avatar.Message.UnknownErrorCreatingMakeupLook", 
    isLocalized = false, 
    toastType = l_ToastType_0.InformationMessage
};
return function(v19, v20, v21, v22) --[[ Line: 33 ]]
    -- upvalues: l_PerformFetch_0 (copy), l_AVATAR_EDITOR_CONSTANTS_0 (copy), l_isMakeupOrEyebrowEyelashAssetType_0 (copy), l_mutedError_0 (copy), v7 (copy), l_FIntAXLookOutfitCreationDelayMs_0 (copy), v1 (copy), l_reportAvatarEventCounterV1_0 (copy), l_Constants_0 (copy), l_SetCurrentToastMessage_0 (copy), v18 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy)
    return l_PerformFetch_0.Single(l_AVATAR_EDITOR_CONSTANTS_0.CreateMakeupLookKey, function(v23) --[[ Line: 34 ]]
        -- upvalues: v21 (copy), l_isMakeupOrEyebrowEyelashAssetType_0 (ref), l_mutedError_0 (ref), v7 (ref), v20 (copy), l_FIntAXLookOutfitCreationDelayMs_0 (ref), v1 (ref), v19 (copy), v22 (copy), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), l_SetCurrentToastMessage_0 (ref), v18 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref)
        local v24 = v23:getState();
        local l_BodyColor3s_0 = v24.AvatarExperience.AvatarEditor.Character.BodyColor3s;
        local l_AvatarScales_0 = v24.AvatarExperience.AvatarEditor.Character.AvatarScales;
        local l_AvatarType_0 = v24.AvatarExperience.AvatarEditor.Character.AvatarType;
        local v28 = {};
        for v29, v30 in l_BodyColor3s_0 do
            v28[v29] = v30:ToHex();
        end;
        local v31 = {};
        for _, v33 in v21 do
            if v33.itemSubType and l_isMakeupOrEyebrowEyelashAssetType_0(v33.itemSubType) and v33.selectedInTryOnManager then
                table.insert(v31, {
                    id = tonumber(v33.itemId), 
                    meta = {
                        order = v33.order, 
                        version = tonumber(v33.version)
                    }
                });
            end;
        end;
        if #v31 == 0 then
            l_mutedError_0("SaveAsMakeupLookThunk: No valid makeup assets to save");
            return v7.resolve();
        else
            local v34 = {
                name = v20, 
                bodyColor3s = v28, 
                assets = v31, 
                scale = l_AvatarScales_0, 
                playerAvatarType = l_AvatarType_0, 
                outfitType = "Makeup"
            };
            task.spawn(function() --[[ Line: 76 ]]
                -- upvalues: l_FIntAXLookOutfitCreationDelayMs_0 (ref), v1 (ref), v19 (ref), v34 (copy), v22 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v23 (copy), l_SetCurrentToastMessage_0 (ref), v18 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref)
                task.wait(l_FIntAXLookOutfitCreationDelayMs_0 / 1000);
                local v35, _ = v1(v19, v34);
                return v35:andThen(function(_) --[[ Line: 81 ]]
                    -- upvalues: v22 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref)
                    if v22 then
                        v22();
                    end;
                    l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXCreateMakeupLook);
                end):catch(function(v38) --[[ Line: 88 ]]
                    -- upvalues: v23 (ref), l_SetCurrentToastMessage_0 (ref), v18 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), l_Constants_0 (ref)
                    warn("Failed to create makeup look", v38);
                    v23:dispatch(l_SetCurrentToastMessage_0(v18));
                    l_reportAvatarEventCounterNoAnalyticsArgument_0(l_Constants_0.AVATAR_EDITOR_SERVICE_ERRORS.CreateOutfit);
                end);
            end);
            return v7.resolve();
        end;
    end);
end;