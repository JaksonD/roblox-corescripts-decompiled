local l_Parent_0 = script:FindFirstAncestor("Navigation").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RoactNavigation);
return function() --[[ Line: 11 ]] --[[ Name: useNavigation ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.useContext(v2.Context);
end;