local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Actions.CloseOpenPrompt);
return function(v3) --[[ Line: 10 ]]
    -- upvalues: l_AvatarEditorService_0 (copy), v2 (copy)
    l_AvatarEditorService_0:PerformDeleteOutfit();
    v3:dispatch(v2());
end;