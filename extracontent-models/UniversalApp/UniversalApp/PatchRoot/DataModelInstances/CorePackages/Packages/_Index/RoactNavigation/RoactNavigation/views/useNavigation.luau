local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.NavigationContext);
return function() --[[ Line: 8 ]] --[[ Name: useNavigation ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.useContext(v2);
end;