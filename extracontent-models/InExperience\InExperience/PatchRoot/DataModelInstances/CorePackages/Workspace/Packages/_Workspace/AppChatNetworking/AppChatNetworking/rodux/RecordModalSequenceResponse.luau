local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local l_script_FirstAncestor_1 = script:FindFirstAncestor("Packages");
local v2 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
local _ = require(l_script_FirstAncestor_0.responses.SharedTypes);
local v4 = require(l_script_FirstAncestor_1.Loggers).Logger:new(script.Name);
return require(script.Parent.RoduxNetworking).POST(script.Name, function(v5, v6, v7, v8, v9, v10, v11) --[[ Line: 11 ]]
    -- upvalues: v4 (copy), v2 (copy)
    if v10 and v11 then
        v4:warn("Both conversation ID and friend ID provided to RecordModalSequenceResponse.");
    end;
    local v12 = {
        action_type = v6, 
        modal_sequence = v7, 
        modal_id = v8, 
        modal_variant = v9, 
        conversation_id = v10, 
        friend_id = v11
    };
    return v5(v2):path("v1"):path("record-modal-sequence-response"):body(v12);
end);