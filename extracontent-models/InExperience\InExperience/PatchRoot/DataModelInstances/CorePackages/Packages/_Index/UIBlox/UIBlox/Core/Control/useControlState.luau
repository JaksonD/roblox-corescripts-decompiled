local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.Control.Enum.ControlState);
return function() --[[ Line: 20 ]] --[[ Name: useControlState ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v4, v5 = v2.useState(v3.Initialize);
    return v4, (v2.useCallback(function(_, v7) --[[ Line: 23 ]]
        -- upvalues: v5 (copy)
        v5(v7);
    end, {}));
end;