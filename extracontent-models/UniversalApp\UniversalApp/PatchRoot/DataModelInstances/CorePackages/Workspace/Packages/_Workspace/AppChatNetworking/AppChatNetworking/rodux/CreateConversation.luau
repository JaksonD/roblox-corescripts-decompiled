local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local v3 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
local v4 = require(script.Parent.RoduxNetworking);
local _ = require(l_script_FirstAncestor_0.responses.SharedTypes);
return v4.POST(script.Name, function(v6, v7, v8, v9) --[[ Line: 15 ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v11 = v2.Array.map(v8, function(v10) --[[ Line: 21 ]]
        return (tonumber(v10));
    end);
    return v6(v3):path("v1"):path("create-conversations"):body({
        conversations = {
            {
                type = v7, 
                name = v9, 
                participant_user_ids = v11
            }
        }
    }):setStatusIds(v8);
end);