local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.getEditableInstanceFromContext);
return function(v3, v4, v5) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local v6, v7 = v2(v3, v4, v5.editableMeshes, v5);
    if not v6 then
        return false;
    else
        return true, v7;
    end;
end;