local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local v1 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
return require(script.Parent.RoduxNetworking).POST(script.Name, function(v2, v3, v4) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    return v2(v1):path("v1"):path("translate-user-message"):body({
        conversation_id = v3, 
        message_id = v4
    });
end);