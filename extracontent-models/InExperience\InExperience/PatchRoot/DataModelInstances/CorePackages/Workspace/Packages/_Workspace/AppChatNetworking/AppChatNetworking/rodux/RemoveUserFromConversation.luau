local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local v1 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
return require(script.Parent.RoduxNetworking).POST(script.Name, function(v2, v3, v4) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    local v5 = tonumber(v4);
    assert(v5, "Invalid removingUserId provided. Could not be converted to a number.");
    return v2(v1):path("v1"):path("remove-users"):body({
        conversation_id = v3, 
        user_ids = {
            v5
        }
    });
end);