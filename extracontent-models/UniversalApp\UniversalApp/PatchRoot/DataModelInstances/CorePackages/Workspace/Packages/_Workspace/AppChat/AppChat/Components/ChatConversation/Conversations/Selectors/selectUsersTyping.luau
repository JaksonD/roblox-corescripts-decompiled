local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
return function(v2, v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    local v4 = v1(v2, string.format("ChatAppReducer.Conversations.%s", v3 or ""));
    if not v4 or not v4.usersTyping or not v2.Users then
        return {};
    else
        local l_usersTyping_0 = v4.usersTyping;
        local l_Users_0 = v2.Users;
        local v7 = {};
        for v8, v9 in pairs(l_usersTyping_0) do
            if v8 ~= v2.LocalUserId and v9 then
                table.insert(v7, l_Users_0[v8]);
            end;
        end;
        return v7;
    end;
end;