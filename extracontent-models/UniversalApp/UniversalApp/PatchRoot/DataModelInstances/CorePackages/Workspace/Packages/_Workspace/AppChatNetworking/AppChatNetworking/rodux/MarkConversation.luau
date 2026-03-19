local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local v1 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
return require(script.Parent.RoduxNetworking).POST(script.Name, function(v2, v3) --[[ Line: 9 ]]
    -- upvalues: v1 (copy)
    return v2(v1):path("v1"):path("mark-conversations"):body({
        conversation_ids = {
            v3
        }
    }):setStatusIds({
        v3
    });
end);