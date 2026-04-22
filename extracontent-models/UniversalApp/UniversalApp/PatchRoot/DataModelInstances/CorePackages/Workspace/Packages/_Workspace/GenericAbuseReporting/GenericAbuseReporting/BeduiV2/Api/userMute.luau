local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.ExpChatShared);
local l_UserMuted_0 = require(l_Parent_0.ExpChatShared).Actions.UserMuted;
local l_FFlagExpChatUseMessagesStore_0 = require(l_Parent_0.SharedFlags).FFlagExpChatUseMessagesStore;
muteUser = function(v4, v5) --[[ Line: 11 ]] --[[ Name: muteUser ]]
    -- upvalues: v1 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), l_UserMuted_0 (copy)
    local l_context_0 = v1.context;
    if not v4 or not v5 then
        return false;
    elseif v4 == v5.UserId then
        return false;
    elseif v4 and l_context_0.store then
        if l_FFlagExpChatUseMessagesStore_0 then
            if l_context_0.messagesStore then
                l_context_0.messagesStore.muteUser(v4);
                return true;
            else
                return false;
            end;
        else
            l_context_0.store:dispatch(l_UserMuted_0(v4));
            return true;
        end;
    else
        return false;
    end;
end;
isUserMuted = function(v7) --[[ Line: 36 ]] --[[ Name: isUserMuted ]]
    -- upvalues: v1 (copy), l_FFlagExpChatUseMessagesStore_0 (copy)
    local l_context_1 = v1.context;
    if not v7 then
        return false;
    elseif l_context_1.store then
        if l_FFlagExpChatUseMessagesStore_0 then
            if l_context_1.messagesStore then
                return l_context_1.messagesStore.isUserMuted(v7);
            else
                return false;
            end;
        else
            return l_context_1.store:getState().MutedUsers[tostring(v7)] == true;
        end;
    else
        return false;
    end;
end;
return {
    isUserMuted = isUserMuted, 
    muteUser = muteUser
};