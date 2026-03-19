local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent;
local v3 = require(l_Parent_0.Actions.OpenPrompt);
local v4 = require(l_Parent_0.PromptType);
local v5 = require(l_Parent_0.Thunks.OpenSetFavoritePrompt);
local v6 = require(l_Parent_0.Thunks.OpenSaveAvatarPrompt);
local v7 = require(l_Parent_0.Thunks.OpenDeleteOutfitPrompt);
local v8 = require(l_Parent_0.Thunks.OpenRenameOutfitPrompt);
local v9 = require(l_Parent_0.Thunks.OpenUpdateOutfitPrompt);
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_FFlagAXAvatarTimeoutFlowIE_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlowIE;
return function(v12) --[[ Line: 18 ]] --[[ Name: ConnectAvatarEditorServiceEvents ]]
    -- upvalues: l_AvatarEditorService_0 (copy), l_FFlagAXAvatarTimeoutFlowIE_0 (copy), v10 (copy), v3 (copy), v4 (copy), v6 (copy), v5 (copy), v7 (copy), v8 (copy), v9 (copy)
    local v13 = {};
    table.insert(v13, l_AvatarEditorService_0.OpenPromptSaveAvatar:Connect(function(v14, v15) --[[ Line: 21 ]]
        -- upvalues: l_FFlagAXAvatarTimeoutFlowIE_0 (ref), v10 (ref), v12 (copy), v3 (ref), v4 (ref), v6 (ref)
        if l_FFlagAXAvatarTimeoutFlowIE_0 then
            local v16 = v10.Stores.getTimeoutStatusStore();
            v16.fetchStatusAsync():andThen(function() --[[ Line: 24 ]]
                -- upvalues: v16 (copy), v12 (ref), v3 (ref), v4 (ref), v6 (ref), v14 (copy), v15 (copy)
                if v16.getIsTimedOut(false) then
                    local v17 = v16.getTimeoutDetails(false);
                    v12:dispatch(v3(v4.SaveAvatarTimeout, {
                        timeoutDetails = v17
                    }));
                    return;
                else
                    v12:dispatch(v6(v14, v15));
                    return;
                end;
            end);
            return;
        else
            v12:dispatch(v6(v14, v15));
            return;
        end;
    end));
    table.insert(v13, l_AvatarEditorService_0.OpenAllowInventoryReadAccess:Connect(function() --[[ Line: 39 ]]
        -- upvalues: v12 (copy), v3 (ref), v4 (ref)
        v12:dispatch(v3(v4.AllowInventoryReadAccess, {}));
    end));
    table.insert(v13, l_AvatarEditorService_0.OpenPromptCreateOufit:Connect(function(v18, v19) --[[ Line: 43 ]]
        -- upvalues: v12 (copy), v3 (ref), v4 (ref)
        v12:dispatch(v3(v4.CreateOutfit, {
            humanoidDescription = v18, 
            rigType = v19
        }));
    end));
    table.insert(v13, l_AvatarEditorService_0.OpenPromptSetFavorite:Connect(function(v20, v21, v22) --[[ Line: 50 ]]
        -- upvalues: v12 (copy), v5 (ref)
        v12:dispatch(v5(v20, v21, v22));
    end));
    table.insert(v13, l_AvatarEditorService_0.OpenPromptDeleteOutfit:Connect(function(v23) --[[ Line: 54 ]]
        -- upvalues: v12 (copy), v7 (ref)
        v12:dispatch(v7(v23));
    end));
    table.insert(v13, l_AvatarEditorService_0.OpenPromptRenameOutfit:Connect(function(v24) --[[ Line: 58 ]]
        -- upvalues: v12 (copy), v8 (ref)
        v12:dispatch(v8(v24));
    end));
    table.insert(v13, l_AvatarEditorService_0.OpenPromptUpdateOutfit:Connect(function(v25, v26, v27) --[[ Line: 62 ]]
        -- upvalues: v12 (copy), v9 (ref)
        v12:dispatch(v9(v25, v26, v27));
    end));
    return v13;
end;