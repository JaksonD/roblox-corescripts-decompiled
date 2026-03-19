local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local v1 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
return (require(script.Parent.RoduxNetworking).POST(script.Name, function(v2, v3) --[[ Line: 8 ]]
    -- upvalues: v1 (copy)
    local v4 = v2(v1):path("v1"):path("get-chat-moderation-statuses"):body({
        ids = v3 or {}
    });
    if v3 and #v3 > 0 then
        v4 = v4:setStatusIds(v3);
    end;
    return v4;
end));