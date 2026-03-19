local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.OpenPublishAvatarAssetPrompt);
local v2 = require(l_Parent_0.PromptType);
return function(v3, v4, v5) --[[ Line: 12 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v6) --[[ Line: 13 ]]
        -- upvalues: v1 (ref), v2 (ref), v3 (copy), v4 (copy), v5 (copy)
        v6:dispatch(v1(v2.PublishAvatarAsset, v3, v4, v5));
    end;
end;