local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_CorePackages_0.Packages.Promise);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v7 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v8 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v9 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAvatarEditorServiceCreateOutfitSupportsGears);
local l_reportAvatarEventCounterNoAnalyticsArgument_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument;
local v13 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v14 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXUpdateSlotBasedEditorToastAndPrompts;
local v18 = {
    toastMessage = "Feature.Avatar.Message.InvalidName", 
    isLocalized = false, 
    toastType = v9.InformationMessage
};
local v19 = {
    toastMessage = "Feature.Avatar.Message.ReachedMaxOutfits", 
    isLocalized = false, 
    toastType = v9.InformationMessage
};
local v20 = {
    toastMessage = "Feature.Avatar.Message.UnknownErrorCreatingOutfit", 
    isLocalized = false, 
    toastType = v9.InformationMessage
};
return function(v21, v22, v23, v24, v25) --[[ Line: 48 ]]
    -- upvalues: v4 (copy), l_PerformFetch_0 (copy), v6 (copy), v10 (copy), v11 (copy), v5 (copy), v14 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v13 (copy), l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 (copy), v7 (copy), v8 (copy), v9 (copy), v18 (copy), v19 (copy), v20 (copy)
    v4.isTypeOrNil(v21, "string", "CreateOutfit thunk expects name to be a string or nil");
    v4.isType(v22, "table", "CreateOutfit thunk expects avatarEditorAnalytics to be a table");
    v4.isTypeOrNil(v23, "function", "CreateOutfit thunk expects checkIsMounted to be a function or nil");
    v4.isTypeOrNil(v24, "function", "CreateOutfit thunk expects onComplete to be a callback or nil");
    v4.isTypeOrNil(v25, "Instance", "CreateOutfit thunk expects altHumanoidDescription to be an Instance or nil");
    return function(v26, v27) --[[ Line: 69 ]]
        -- upvalues: l_PerformFetch_0 (ref), v6 (ref), v25 (copy), v10 (ref), v11 (ref), v5 (ref), v21 (copy), v14 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v13 (ref), v22 (copy), l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 (ref), v7 (ref), v8 (ref), v9 (ref), v24 (copy), v18 (ref), v19 (ref), v20 (ref)
        local l_avatarEditorService_0 = v27.avatarEditorService;
        return l_PerformFetch_0.Single(v6.CreateOutfitKey, function(v29) --[[ Line: 71 ]]
            -- upvalues: v25 (ref), v10 (ref), v11 (ref), v5 (ref), l_avatarEditorService_0 (copy), v21 (ref), v14 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v13 (ref), v22 (ref), l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 (ref), v7 (ref), v8 (ref), v9 (ref), v24 (ref), v18 (ref), v19 (ref), v20 (ref)
            local v30 = v29:getState();
            local l_AvatarType_0 = v30.AvatarExperience.AvatarEditor.Character.AvatarType;
            local v32 = Enum.HumanoidRigType[l_AvatarType_0];
            local v33 = 0;
            local v34 = nil;
            v34 = if v25 ~= nil then v25 else v10.getHumanoidDescriptionFromState(v30.AvatarExperience);
            if v11() then
                v33 = v10.getGearAssetIdFromState(v30.AvatarExperience);
            end;
            return v5.new(function(v35, v36) --[[ Line: 87 ]]
                -- upvalues: v11 (ref), l_avatarEditorService_0 (ref), v34 (ref), v32 (copy), v21 (ref), v33 (ref), v14 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v13 (ref), v22 (ref), l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 (ref), v7 (ref), v29 (copy), v8 (ref), v9 (ref), v24 (ref), v18 (ref), v19 (ref), v20 (ref)
                local v37 = if v11() then l_avatarEditorService_0:NoPromptCreateOutfit(v34, v32, v21, v33) else l_avatarEditorService_0:NoPromptCreateOutfit(v34, v32, v21, 0);
                while not v37 do
                    l_avatarEditorService_0.PromptCreateOutfitCompleted:Wait();
                    v37 = l_avatarEditorService_0:NoPromptCreateOutfit(v34, v32, v21, 0);
                    if v14() then
                        l_reportAvatarEventCounterNoAnalyticsArgument_0(v13.Counter.AvatarEditorServiceErrors.NoPromptCreateOutfit);
                    end;
                end;
                local v38, v39 = l_avatarEditorService_0.PromptCreateOutfitCompleted:Wait();
                if v38 == Enum.AvatarPromptResult.Success then
                    v22.outfitCreated(v21);
                    if l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 then
                        local v40 = v7.translateString("Feature.Avatar.Message.AvatarAdded", {
                            avatarName = v21
                        });
                        v29:dispatch(v8({
                            toastMessage = v40, 
                            isLocalized = true, 
                            toastType = v9.SuccessConfirmation
                        }));
                    end;
                    v35();
                    if v24 ~= nil then
                        v24(true);
                        return;
                    end;
                else
                    if v39 == Enum.CreateOutfitFailure.InvalidName then
                        v29:dispatch(v8(v18));
                    elseif v39 == Enum.CreateOutfitFailure.OutfitLimitReached then
                        v29:dispatch(v8(v19));
                    elseif v39 == Enum.CreateOutfitFailure.Other then
                        v29:dispatch(v8(v20));
                    end;
                    if v14() then
                        l_reportAvatarEventCounterNoAnalyticsArgument_0(v13.Counter.AvatarEditorServiceErrors.CreateOutfit);
                    end;
                    v36();
                    if v24 ~= nil then
                        v24(false);
                    end;
                end;
            end);
        end)(v26):catch(function(_) --[[ Line: 152 ]]

        end);
    end;
end;