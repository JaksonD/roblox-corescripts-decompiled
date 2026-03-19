local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Actions.CloseOpenPrompt);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: l_AvatarEditorService_0 (copy), v2 (copy)
    return function(v4) --[[ Line: 7 ]]
        -- upvalues: l_AvatarEditorService_0 (ref), v3 (copy), v2 (ref)
        l_AvatarEditorService_0:SetAllowInventoryReadAccess(v3);
        v4:dispatch(v2());
    end;
end;