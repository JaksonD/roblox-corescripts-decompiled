local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSave").Parent;
local v2 = require(l_Parent_0.Promise);
local _ = require(l_Parent_0.LuauPolyfill);
return function(v4, v5, v6, v7) --[[ Line: 28 ]] --[[ Name: saveAvatar ]]
    -- upvalues: v2 (copy), l_AvatarEditorService_0 (copy)
    return v2.new(function(v8, v9) --[[ Line: 34 ]]
        -- upvalues: l_AvatarEditorService_0 (ref), v4 (copy), v5 (copy), v6 (copy), v7 (copy)
        local v10 = l_AvatarEditorService_0:NoPromptSaveAvatar(v4, v5, v6, v7);
        while not v10 do
            l_AvatarEditorService_0.PromptSaveAvatarCompleted:Wait();
            v10 = l_AvatarEditorService_0:NoPromptSaveAvatar(v4, v5, v6, v7);
        end;
        local v11, v12 = l_AvatarEditorService_0.PromptSaveAvatarCompleted:Wait();
        if v11 == Enum.AvatarPromptResult.Success then
            v8({
                avatarPromptResult = v11, 
                humanoidDescriptionWithValidAssets = v12
            });
            return;
        else
            v9({
                avatarPromptResult = v11
            });
            return;
        end;
    end);
end;