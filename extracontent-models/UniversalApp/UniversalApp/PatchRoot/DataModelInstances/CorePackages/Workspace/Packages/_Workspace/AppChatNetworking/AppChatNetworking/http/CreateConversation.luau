local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.LuauPolyfill);
local l_default_0 = require(l_script_FirstAncestor_0.url.HttpRequest).default;
local v5 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
return function(v6, v7, v8, v9) --[[ Line: 11 ]]
    -- upvalues: l_default_0 (copy), v3 (copy), l_HttpService_0 (copy), v5 (copy)
    v6 = v6 or l_default_0;
    local v11 = v3.Array.map(v8, function(v10) --[[ Line: 18 ]]
        return (tonumber(v10));
    end);
    local v12 = l_HttpService_0:JSONEncode({
        conversations = {
            {
                type = v7, 
                name = v9, 
                participant_user_ids = v11
            }
        }
    });
    return v6(("%*/v1/create-conversations"):format(v5), "POST", {
        postBody = v12
    });
end;