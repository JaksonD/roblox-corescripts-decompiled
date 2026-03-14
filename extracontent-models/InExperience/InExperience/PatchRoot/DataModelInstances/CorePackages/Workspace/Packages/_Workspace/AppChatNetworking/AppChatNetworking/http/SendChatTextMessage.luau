local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local v2 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
local l_default_0 = require(l_script_FirstAncestor_0.url.HttpRequest).default;
return function(v4, v5, v6, v7) --[[ Line: 10 ]]
    -- upvalues: l_default_0 (copy), l_HttpService_0 (copy), v2 (copy)
    v4 = v4 or l_default_0;
    local v8 = l_HttpService_0:JSONEncode({
        conversation_id = v5, 
        messages = {
            {
                content = v6, 
                replies_to = v7
            }
        }
    });
    return v4(("%*/v1/send-messages"):format(v2), "POST", {
        postBody = v8
    });
end;