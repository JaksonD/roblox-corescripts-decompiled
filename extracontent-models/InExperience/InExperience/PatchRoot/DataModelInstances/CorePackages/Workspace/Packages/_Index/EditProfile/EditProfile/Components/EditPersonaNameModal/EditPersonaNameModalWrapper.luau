local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.EditPersonaNameModalContainer);
return function(v3) --[[ Line: 10 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2, {
        navigation = v3.navigation
    });
end;