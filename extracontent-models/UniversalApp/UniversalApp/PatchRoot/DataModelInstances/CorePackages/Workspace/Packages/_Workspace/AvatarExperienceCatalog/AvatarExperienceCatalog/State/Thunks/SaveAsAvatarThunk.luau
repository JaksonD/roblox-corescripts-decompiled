local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v1 = require(l_Parent_0.AvatarExperienceCommon);
local v2 = require(l_Parent_0.AvatarExperienceAnalytics);
local v3 = require(l_Parent_0.AvatarExperienceFlags);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local v5 = require(l_Parent_0.Promise);
local v6 = require(l_Parent_0.ToastRodux);
local l_AVATAR_EDITOR_CONSTANTS_0 = v1.Constants.AVATAR_EDITOR_CONSTANTS;
local l_ToastType_0 = v6.Enums.ToastType;
local l_SetCurrentToastMessage_0 = v6.Actions.SetCurrentToastMessage;
local l_Constants_0 = v2.Constants;
local l_getGearAssetIdFromState_0 = v1.Utils.getGearAssetIdFromState;
local l_reportAvatarEventCounterNoAnalyticsArgument_0 = v2.reportAvatarEventCounterNoAnalyticsArgument;
local l_reportAvatarEventCounterV1_0 = v2.reportAvatarEventCounterV1;
local l_FIntAXLookOutfitCreationDelayMs_0 = v3.FIntAXLookOutfitCreationDelayMs;
local v15 = {
    toastMessage = "Feature.Avatar.Message.InvalidName", 
    isLocalized = false, 
    toastType = l_ToastType_0.InformationMessage
};
local v16 = {
    toastMessage = "Feature.Avatar.Message.ReachedMaxOutfits", 
    isLocalized = false, 
    toastType = l_ToastType_0.InformationMessage
};
local v17 = {
    toastMessage = "Feature.Avatar.Message.UnknownErrorCreatingOutfit", 
    isLocalized = false, 
    toastType = l_ToastType_0.InformationMessage
};
return function(v18, v19, v20, v21) --[[ Line: 41 ]]
    -- upvalues: l_PerformFetch_0 (copy), l_AVATAR_EDITOR_CONSTANTS_0 (copy), l_getGearAssetIdFromState_0 (copy), l_FIntAXLookOutfitCreationDelayMs_0 (copy), v5 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), l_Constants_0 (copy), l_reportAvatarEventCounterV1_0 (copy), l_SetCurrentToastMessage_0 (copy), v15 (copy), v16 (copy), v17 (copy)
    return function(v22, v23) --[[ Line: 47 ]]
        -- upvalues: l_PerformFetch_0 (ref), l_AVATAR_EDITOR_CONSTANTS_0 (ref), l_getGearAssetIdFromState_0 (ref), v19 (copy), v20 (copy), l_FIntAXLookOutfitCreationDelayMs_0 (ref), v5 (ref), v18 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), l_Constants_0 (ref), l_reportAvatarEventCounterV1_0 (ref), v21 (copy), l_SetCurrentToastMessage_0 (ref), v15 (ref), v16 (ref), v17 (ref)
        local l_avatarEditorService_0 = v23.avatarEditorService;
        return l_PerformFetch_0.Single(l_AVATAR_EDITOR_CONSTANTS_0.CreateOutfitKey, function(v25) --[[ Line: 49 ]]
            -- upvalues: l_getGearAssetIdFromState_0 (ref), v19 (ref), v20 (ref), l_FIntAXLookOutfitCreationDelayMs_0 (ref), v5 (ref), l_avatarEditorService_0 (copy), v18 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), l_Constants_0 (ref), l_reportAvatarEventCounterV1_0 (ref), v21 (ref), l_SetCurrentToastMessage_0 (ref), v15 (ref), v16 (ref), v17 (ref)
            local v26 = v25:getState();
            local l_AvatarType_0 = v26.AvatarExperience.AvatarEditor.Character.AvatarType;
            local v28 = Enum.HumanoidRigType[l_AvatarType_0];
            local v29 = l_getGearAssetIdFromState_0(v26.AvatarExperience);
            local v30 = v19(v26, v20);
            task.spawn(function() --[[ Line: 59 ]]
                -- upvalues: l_FIntAXLookOutfitCreationDelayMs_0 (ref), v5 (ref), l_avatarEditorService_0 (ref), v30 (copy), v28 (copy), v18 (ref), v29 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), l_Constants_0 (ref), l_reportAvatarEventCounterV1_0 (ref), v21 (ref), v25 (copy), l_SetCurrentToastMessage_0 (ref), v15 (ref), v16 (ref), v17 (ref)
                task.wait(l_FIntAXLookOutfitCreationDelayMs_0 / 1000);
                v5.new(function(v31, v32) --[[ Line: 63 ]]
                    -- upvalues: l_avatarEditorService_0 (ref), v30 (ref), v28 (ref), v18 (ref), v29 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), l_Constants_0 (ref), l_reportAvatarEventCounterV1_0 (ref), v21 (ref), v25 (ref), l_SetCurrentToastMessage_0 (ref), v15 (ref), v16 (ref), v17 (ref)
                    local v33 = l_avatarEditorService_0:NoPromptCreateOutfit(v30, v28, v18, v29);
                    while not v33 do
                        l_avatarEditorService_0.PromptCreateOutfitCompleted:Wait();
                        v33 = l_avatarEditorService_0:NoPromptCreateOutfit(v30, v28, v18, 0);
                        l_reportAvatarEventCounterNoAnalyticsArgument_0(l_Constants_0.AVATAR_EDITOR_SERVICE_ERRORS.NoPromptCreateOutfit);
                    end;
                    local v34, v35 = l_avatarEditorService_0.PromptCreateOutfitCompleted:Wait();
                    if v34 == Enum.AvatarPromptResult.Success then
                        l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXCreateCostume);
                        v21();
                        v31();
                        return;
                    else
                        if v35 == Enum.CreateOutfitFailure.InvalidName then
                            v25:dispatch(l_SetCurrentToastMessage_0(v15));
                        elseif v35 == Enum.CreateOutfitFailure.OutfitLimitReached then
                            v25:dispatch(l_SetCurrentToastMessage_0(v16));
                        elseif v35 == Enum.CreateOutfitFailure.Other then
                            v25:dispatch(l_SetCurrentToastMessage_0(v17));
                        end;
                        l_reportAvatarEventCounterNoAnalyticsArgument_0(l_Constants_0.AVATAR_EDITOR_SERVICE_ERRORS.CreateOutfit);
                        v32();
                        return;
                    end;
                end);
            end);
            return v5.resolve();
        end)(v22):catch(function(_) --[[ Line: 110 ]]

        end);
    end;
end;