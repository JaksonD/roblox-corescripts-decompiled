local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.Constants);
local l_FFlagEnableGlobalChatAbuseReporting_0 = require(l_Parent_0.SharedFlags).FFlagEnableGlobalChatAbuseReporting;
isSystemMessage = function(v4) --[[ Line: 11 ]] --[[ Name: isSystemMessage ]]
    -- upvalues: l_FFlagEnableGlobalChatAbuseReporting_0 (copy), v2 (copy)
    if (not l_FFlagEnableGlobalChatAbuseReporting_0 or v4.textChannel) and v4.textChannel.Name == v2.ChannelTypes.System then
        return true;
    elseif not v4.userId or v4.userId == "0" then
        return true;
    else
        return false;
    end;
end;
return isSystemMessage;