local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v4 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v5 = require(l_script_FirstAncestor_0.Analytics.Enums.CreateConversationError);
return function(v6, v7, v8) --[[ Line: 18 ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (copy), v4 (copy)
    if not v6 then
        return v2.reject("No conversation returned.");
    elseif v6.status == "failed" then
        return v2.reject("Failed to create conversation.");
    else
        local v9 = v3.fromChannelsApi(v6);
        if v7 then
            local v10 = if not v9 then v5.InvalidResponse else v6.status;
            v7.fireAnalyticsEvent(v4.NewConversationCreated, {
                conversationId = v9.id, 
                createConversationResult = v10, 
                participantsCount = #v9.participants, 
                createdReason = v8 or "unknown"
            });
        end;
        return v9;
    end;
end;