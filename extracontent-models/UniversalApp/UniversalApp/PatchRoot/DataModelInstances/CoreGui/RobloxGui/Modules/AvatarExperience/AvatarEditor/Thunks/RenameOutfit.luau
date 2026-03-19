local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_CorePackages_0.Packages.Promise);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v7 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v8 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.OutfitRenamed);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXUpdateSlotBasedEditorToastAndPrompts;
local v14 = {
    toastMessage = l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 and "Feature.Avatar.Message.AvatarRenamed" or "Feature.Avatar.Message.RenameCostumeSuccess", 
    isLocalized = false, 
    toastType = v8.InformationMessage
};
local v15 = {
    toastMessage = l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 and "Feature.Avatar.Message.FailedAvatarRename" or "Feature.Avatar.Message.FailedRenameCostume", 
    isLocalized = false, 
    toastType = v8.InformationMessage
};
local function _(v16) --[[ Line: 41 ]] --[[ Name: keyMapper ]]
    -- upvalues: v6 (copy)
    return v6.RenameOutfitKey .. v16;
end;
return function(v18, v19, v20) --[[ Line: 45 ]]
    -- upvalues: v3 (copy), l_PerformFetch_0 (copy), v6 (copy), v4 (copy), v9 (copy), v10 (copy), v7 (copy), v14 (copy), v15 (copy)
    v3.isType(v18, "table", "RenameOutfit thunk expects avatarEditorAnalytics to be a table");
    v3.isType(v19, "string", "RenameOutfit thunk expects id to be a string");
    v3.isType(v20, "string", "RenameOutfit thunk expects name to be a string");
    return function(v21, v22) --[[ Line: 50 ]]
        -- upvalues: l_PerformFetch_0 (ref), v19 (copy), v6 (ref), v4 (ref), v9 (ref), v20 (copy), v10 (ref), v7 (ref), v14 (ref), v15 (ref)
        local l_avatarEditorService_0 = v22.avatarEditorService;
        local l_Single_0 = l_PerformFetch_0.Single;
        local l_v19_0 = v19;
        return l_Single_0(v6.RenameOutfitKey .. l_v19_0, function(v26) --[[ Line: 52 ]]
            -- upvalues: v4 (ref), v9 (ref), l_avatarEditorService_0 (copy), v19 (ref), v20 (ref), v10 (ref), v7 (ref), v14 (ref), v15 (ref)
            return v4.new(function(v27, v28) --[[ Line: 53 ]]
                -- upvalues: v9 (ref), l_avatarEditorService_0 (ref), v19 (ref), v20 (ref), v26 (copy), v10 (ref), v7 (ref), v14 (ref), v15 (ref)
                if v9.doAESCallAndAwaitResult(l_avatarEditorService_0, l_avatarEditorService_0.NoPromptRenameOutfit, l_avatarEditorService_0.PromptRenameOutfitCompleted, v19, v20) == Enum.AvatarPromptResult.Success then
                    v26:dispatch(v10(v19, v20));
                    v26:dispatch(v7(v14));
                    v27();
                    return;
                else
                    v26:dispatch(v7(v15));
                    v28();
                    return;
                end;
            end);
        end)(v21);
    end;
end;