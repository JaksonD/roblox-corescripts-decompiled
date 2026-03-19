local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local v3 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
return require(script.Parent.RoduxNetworking).POST(script.Name, function(v4, v5, v6) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v8 = v2.Array.map(v6, function(v7) --[[ Line: 11 ]]
        return (tonumber(v7));
    end);
    return v4(v3):path("v1"):path("expand-to-group-conversation"):body({
        source_conversation_id = v5, 
        participant_user_ids = v8
    }):setStatusIds({
        v5
    });
end);