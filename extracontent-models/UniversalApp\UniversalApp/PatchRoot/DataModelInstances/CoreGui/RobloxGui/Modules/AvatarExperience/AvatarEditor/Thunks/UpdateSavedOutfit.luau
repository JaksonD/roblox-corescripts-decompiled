local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_CorePackages_0.Packages.Promise);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.UpdateOutfit);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v8 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v9 = require(l_Modules_0.LuaApp.Enum.ToastType);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v13 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v15 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v16 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAvatarEditorServiceCreateOutfitSupportsGears);
local l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXUpdateSlotBasedEditorToastAndPrompts;
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_FFlagAXEnableModeratedItemsFlowForDurables_0 = v13.FFlagAXEnableModeratedItemsFlowForDurables;
local l_FFlagAXInventoryDurablesSupport_0 = v13.FFlagAXInventoryDurablesSupport;
local v21 = {
    toastMessage = "Feature.Avatar.Message.UpdateOutfitSuccess", 
    isLocalized = false, 
    toastType = v9.SuccessConfirmation
};
local v22 = {
    toastMessage = "Feature.Avatar.Message.FailedUpdateOutfit", 
    isLocalized = false, 
    toastType = v9.InformationMessage
};
local function _(v23) --[[ Line: 50 ]]
    -- upvalues: v7 (copy)
    return v7.UpdateOutfitKey .. v23;
end;
return function(v25, v26, v27, v28, v29) --[[ Line: 54 ]]
    -- upvalues: v3 (copy), l_PerformFetch_0 (copy), v7 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), v14 (copy), v16 (copy), v4 (copy), v6 (copy), l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 (copy), v15 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), v8 (copy), v9 (copy), v21 (copy), v22 (copy)
    v3.isType(v26, "string", "UpdateSavedOutfit thunk expects outfitId to be a string");
    v3.isType(v25, "table", "UpdateSavedOutfit thunk expects avatarEditorAnalytics to be a table");
    v3.isType(v26, "string", "UpdateSavedOutfit thunk expects outfitId to be a string");
    return function(v30, v31) --[[ Line: 69 ]]
        -- upvalues: l_PerformFetch_0 (ref), v26 (copy), v7 (ref), l_FFlagAXModeratedItemsFlow_0 (ref), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (ref), v27 (copy), v14 (ref), v16 (ref), v4 (ref), v6 (ref), v29 (copy), l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 (ref), v15 (ref), l_FFlagAXInventoryDurablesSupport_0 (ref), v28 (copy), v8 (ref), v9 (ref), v21 (ref), v22 (ref)
        local l_avatarEditorService_0 = v31.avatarEditorService;
        local l_Single_0 = l_PerformFetch_0.Single;
        local l_v26_0 = v26;
        return l_Single_0(v7.UpdateOutfitKey .. l_v26_0, function(v35) --[[ Line: 71 ]]
            -- upvalues: l_FFlagAXModeratedItemsFlow_0 (ref), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (ref), v27 (ref), v14 (ref), v16 (ref), v4 (ref), l_avatarEditorService_0 (copy), v26 (ref), v6 (ref), v29 (ref), l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 (ref), v15 (ref), l_FFlagAXInventoryDurablesSupport_0 (ref), v28 (ref), v8 (ref), v9 (ref), v21 (ref), v22 (ref)
            local v36 = v35:getState();
            local v37 = if (l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0) and v27 then v14.getHumanoidDescriptionFromOutfitInfo(v27) else v14.getHumanoidDescriptionFromState(v36.AvatarExperience);
            local l_AvatarType_0 = v36.AvatarExperience.AvatarEditor.Character.AvatarType;
            local v39 = Enum.HumanoidRigType[l_AvatarType_0];
            local v40 = 0;
            if v16() then
                v40 = v14.getGearAssetIdFromState(v36.AvatarExperience);
            end;
            return v4.new(function(v41, v42) --[[ Line: 86 ]]
                -- upvalues: v14 (ref), l_avatarEditorService_0 (ref), v26 (ref), v37 (copy), v39 (copy), v40 (ref), v35 (copy), v6 (ref), v29 (ref), l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 (ref), v36 (copy), v15 (ref), l_FFlagAXInventoryDurablesSupport_0 (ref), v28 (ref), v8 (ref), v9 (ref), v21 (ref), v22 (ref)
                if v14.doAESCallAndAwaitResult(l_avatarEditorService_0, l_avatarEditorService_0.NoPromptUpdateOutfit, l_avatarEditorService_0.PromptUpdateOutfitCompleted, v26, v37, v39, v40) == Enum.AvatarPromptResult.Success then
                    v35:dispatch(v6(v26, v29));
                    local v43 = l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 and v36.AvatarExperience.AvatarEditor.OutfitInfos[v26] and v36.AvatarExperience.AvatarEditor.OutfitInfos[v26].name;
                    if l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 and v43 then
                        local v44 = v15.translateString("Feature.Avatar.Message.AvatarUpdated", {
                            avatarName = v43
                        });
                        if l_FFlagAXInventoryDurablesSupport_0 and not v28 then
                            v35:dispatch(v8({
                                toastMessage = v44, 
                                isLocalized = true, 
                                toastType = v9.SuccessConfirmation
                            }));
                        end;
                    else
                        v35:dispatch(v8(v21));
                    end;
                    v41();
                    return;
                else
                    v35:dispatch(v8(v22));
                    v42();
                    return;
                end;
            end);
        end)(v30);
    end;
end;