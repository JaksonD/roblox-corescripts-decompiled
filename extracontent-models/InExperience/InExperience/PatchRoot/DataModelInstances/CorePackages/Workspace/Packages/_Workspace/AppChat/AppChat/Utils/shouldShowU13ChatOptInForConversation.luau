local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Models.Conversation);
local l_FFlagAppChatEnableU13ChatOptIn_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableU13ChatOptIn;
return function(v4) --[[ Line: 6 ]]
    -- upvalues: l_FFlagAppChatEnableU13ChatOptIn_0 (copy), v2 (copy)
    if not l_FFlagAppChatEnableU13ChatOptIn_0 then
        return false;
    elseif not v4 then
        return false;
    else
        return v4.userOptedIntoChatMessages == v2.UserOptedIntoChatMessagesStatus.NotOptedIn;
    end;
end;