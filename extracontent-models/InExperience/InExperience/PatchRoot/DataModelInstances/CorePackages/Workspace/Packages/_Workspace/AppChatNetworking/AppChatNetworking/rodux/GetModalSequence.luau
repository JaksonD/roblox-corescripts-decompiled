local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local v1 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
return require(script.Parent.RoduxNetworking).POST(script.Name, function(v2, v3) --[[ Line: 32 ]]
    -- upvalues: v1 (copy)
    return v2(v1):path("v2"):path("get-modal-sequence"):body({
        is_in_experience = v3.isInExperience, 
        modal_sequence = v3.modalSequence, 
        conversation_id = v3.conversationId, 
        friend_id = v3.friendId
    });
end);