local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChatNetworking");
local v1 = require(l_script_FirstAncestor_0.url.CHAT_PLATFORM_BASE_URL);
local v2 = require(script.Parent.RoduxNetworking);
local v3 = {
    ABUSE_TYPE_PROFANITY = 3, 
    ABUSE_TYPE_PRIVACY_ASKING_FOR_PII = 11, 
    ABUSE_TYPE_HARASSMENT = 4, 
    ABUSE_TYPE_DATING_AND_ROMANTIC_CONTENT = 7, 
    ABUSE_TYPE_CHEAT_AND_EXPLOITS = 25, 
    ABUSE_TYPE_SCAMMING = 6, 
    ABUSE_TYPE_SEXUAL_CONTENT = 8, 
    ABUSE_TYPE_REAL_LIFE_THREATS = 23, 
    ABUSE_TYPE_OTHER = 2
};
return v2.POST(script.Name, function(v4, v5) --[[ Line: 18 ]]
    -- upvalues: v1 (copy), v3 (copy)
    return v4(v1):path("v1"):path("create-chat-abuse-report"):body({
        comment = if string.len(v5.comment) > 0 then v5.comment else " ", 
        reported_user_id = tonumber(v5.reportedUserId), 
        report_category = v3[v5.reportCategory] or 1, 
        conversation_id = v5.conversationId, 
        entry_point = v5.entryPoint
    });
end);