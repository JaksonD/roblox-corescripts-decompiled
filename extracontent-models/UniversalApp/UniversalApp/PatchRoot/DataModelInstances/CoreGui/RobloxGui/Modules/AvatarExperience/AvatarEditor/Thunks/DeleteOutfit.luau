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
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.RevokeOutfit);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v13 = {
    toastMessage = "Feature.Avatar.Message.FailedDeleteCostume", 
    isLocalized = false, 
    toastType = v8.InformationMessage
};
local function _(v14) --[[ Line: 28 ]] --[[ Name: keyMapper ]]
    -- upvalues: v6 (copy)
    return v6.DeleteOutfitsKey .. v14;
end;
return function(v16) --[[ Line: 32 ]]
    -- upvalues: v3 (copy), l_PerformFetch_0 (copy), v6 (copy), v4 (copy), v9 (copy), v10 (copy), v7 (copy), v13 (copy)
    v3.isType(v16, "string", "DeleteOutfit thunk expects id to be a string");
    return function(v17, v18) --[[ Line: 35 ]]
        -- upvalues: l_PerformFetch_0 (ref), v16 (copy), v6 (ref), v4 (ref), v9 (ref), v10 (ref), v7 (ref), v13 (ref)
        local l_avatarEditorService_0 = v18.avatarEditorService;
        local l_Single_0 = l_PerformFetch_0.Single;
        local l_v16_0 = v16;
        return l_Single_0(v6.DeleteOutfitsKey .. l_v16_0, function(v22) --[[ Line: 37 ]]
            -- upvalues: v4 (ref), v9 (ref), l_avatarEditorService_0 (copy), v16 (ref), v10 (ref), v7 (ref), v13 (ref)
            return v4.new(function(v23, v24) --[[ Line: 38 ]]
                -- upvalues: v9 (ref), l_avatarEditorService_0 (ref), v16 (ref), v22 (copy), v10 (ref), v7 (ref), v13 (ref)
                if v9.doAESCallAndAwaitResult(l_avatarEditorService_0, l_avatarEditorService_0.NoPromptDeleteOutfit, l_avatarEditorService_0.PromptDeleteOutfitCompleted, v16) == Enum.AvatarPromptResult.Success then
                    v22:dispatch(v10(v16));
                    v23();
                    return;
                else
                    v22:dispatch(v7(v13));
                    v24();
                    return;
                end;
            end);
        end)(v17);
    end;
end;