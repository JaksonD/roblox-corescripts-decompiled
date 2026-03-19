local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.EditProfileToast);
return function(v3) --[[ Line: 10 ]] --[[ Name: EditProfileToastScreen ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = v3.navigation.getParam("text", "");
    return v1.createElement(v2, {
        text = v4
    });
end;