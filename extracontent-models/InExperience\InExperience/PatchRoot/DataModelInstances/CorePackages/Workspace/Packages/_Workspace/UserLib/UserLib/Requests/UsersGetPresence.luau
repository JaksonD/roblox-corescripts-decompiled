local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("UserLib").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v3, v4) --[[ Line: 9 ]]
    -- upvalues: l_HttpService_0 (copy), l_Url_0 (copy)
    local v5 = {};
    for _, v7 in pairs(v4) do
        local v8 = tonumber(v7);
        if v8 then
            table.insert(v5, v8);
        end;
    end;
    local v9 = l_HttpService_0:JSONEncode({
        userIds = v5
    });
    return v3(string.format("%s/presence/users", l_Url_0.PRESENCE_URL), "POST", {
        postBody = v9
    });
end;