local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Users.populateUserWithState);
local v2 = require(script.Parent.isUserInConversation);
return function(v3, v4) --[[ Line: 6 ]]
    -- upvalues: v2 (copy), v1 (copy)
    local l_Users_0 = v3.Users;
    local v6 = {};
    for _, v8 in pairs(l_Users_0) do
        if v8.id ~= tostring(v3.LocalUserId) and v8.isFriend and not v2(v8.id, v4) then
            local v9 = v1(v3, v8);
            v6[v8.id] = v9;
        end;
    end;
    return v6;
end;