local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Users.populateUserWithState);
local v2 = require(script.Parent.Parent.Logger);
return function(v3, v4, v5) --[[ Line: 5 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_Users_0 = v3.Users;
    local v7 = {};
    for v8, v9 in pairs(v4) do
        local v10 = l_Users_0[v9];
        local v11 = if v5 then v5[v8] else nil;
        if v10 then
            local v12 = v1(v3, v10, v11);
            v7[v10.id] = v12;
        else
            v2:warning("user is required in selectChatUserEntryModelList");
        end;
    end;
    return v7;
end;