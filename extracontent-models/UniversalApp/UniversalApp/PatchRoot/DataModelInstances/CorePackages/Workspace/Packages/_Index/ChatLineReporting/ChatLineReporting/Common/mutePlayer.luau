local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ExpChatShared);
local l_RBXMuteCommand_0 = require(l_Parent_0.ExpChatShared).Commands.RBXMuteCommand;
local l_UserMuted_0 = require(l_Parent_0.ExpChatShared).Actions.UserMuted;
local v5 = require(l_script_FirstAncestor_0.Common.Constants);
local l_FFlagExpChatUseMessagesStore_0 = require(l_Parent_0.SharedFlags).FFlagExpChatUseMessagesStore;
mutePlayer = function(v7, v8) --[[ Line: 14 ]] --[[ Name: mutePlayer ]]
    -- upvalues: v2 (copy), v5 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), l_UserMuted_0 (copy), l_RBXMuteCommand_0 (copy)
    local l_context_0 = v2.context;
    local v10 = nil;
    if v7.username == "" then
        return {
            key = v5.ErrorDoesNotExistKey, 
            args = {
                RBX_NAME = v7.displayName
            }, 
            metadata = "Roblox.Mute.Error.PlayerNotFound"
        };
    elseif tonumber(v7.userId) == v8.UserId then
        return {
            key = v5.ErrorSelfMuteKey, 
            args = {
                RBX_NAME = v7.displayName
            }, 
            metadata = "Roblox.Mute.Error.CannotMuteSelf"
        };
    elseif tonumber(v7.userId) then
        if l_context_0.store then
            if l_FFlagExpChatUseMessagesStore_0 then
                if l_context_0 and l_context_0.messagesStore then
                    l_context_0.messagesStore.muteUser(v7.userId);
                    return v10;
                else
                    return {
                        key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown", 
                        args = {
                            RBX_NAME = v7.displayName
                        }, 
                        metadata = "Roblox.Mute.Error.ContextNotAvailable"
                    };
                end;
            else
                l_context_0.store:dispatch(l_UserMuted_0(v7.userId));
                return {
                    key = v5.SuccessfulMuteKey, 
                    args = {
                        RBX_NAME = v7.displayName
                    }, 
                    metadata = "Roblox.Mute.Info.Success"
                };
            end;
        else
            return v10;
        end;
    else
        return l_RBXMuteCommand_0.clientRun(l_context_0.store, v8.UserId, "/mute " .. v7.displayName, l_context_0);
    end;
end;
return mutePlayer;