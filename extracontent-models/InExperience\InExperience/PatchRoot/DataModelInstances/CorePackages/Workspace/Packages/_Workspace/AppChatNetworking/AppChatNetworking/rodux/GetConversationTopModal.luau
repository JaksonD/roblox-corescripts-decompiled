local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local v1 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("Packages");
local v3 = require(script.Parent.RoduxNetworking);
local v4 = require(l_script_FirstAncestor_1.Loggers).Logger:new(script.Name);
return v3.POST(script.Name, function(v5, v6, v7, v8) --[[ Line: 9 ]]
    -- upvalues: v4 (copy), v1 (copy)
    if v6 and v8 then
        v4:warning("Both conversation ID and friend ID provided to GetConversationTopModal.");
    end;
    local v9 = {
        is_in_experience = v7, 
        modal_sequence = "conversation_top_modal", 
        conversation_id = v6, 
        friend_id = v8
    };
    return v5(v1):path("v2"):path("get-modal-sequence"):body(v9);
end);