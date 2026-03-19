local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.CloseResultModal);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    v2:dispatch(v1());
end;