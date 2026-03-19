local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.FocusContext);
return function() --[[ Line: 10 ]] --[[ Name: useFocusController ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3 = v1.useContext(v2);
    if v3 then
        return v3.focusNode.focusController;
    else
        return nil;
    end;
end;