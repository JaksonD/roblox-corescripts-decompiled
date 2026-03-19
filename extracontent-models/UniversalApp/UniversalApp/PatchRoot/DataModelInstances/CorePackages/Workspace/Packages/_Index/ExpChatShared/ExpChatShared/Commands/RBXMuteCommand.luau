local v0 = require(script.Parent.getPlayersFromString);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChatShared");
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v3 = require(l_Actions_0.UserMuted);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagExpChatUseMessagesStore_0 = require(l_Parent_0.SharedFlags).FFlagExpChatUseMessagesStore;
local _ = require(script.Parent.types);
return {
    name = script.Name, 
    alias = {
        "/mute", 
        "/m"
    }, 
    clientRun = function(v7, v8, v9, v10) --[[ Line: 15 ]] --[[ Name: clientRun ]]
        -- upvalues: v0 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), v3 (copy)
        local v11 = string.split(v9, " ")[2];
        if not v11 then
            return {
                key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist", 
                args = {
                    RBX_NAME = ""
                }, 
                metadata = "Roblox.Mute.Error.PlayerNotFound"
            };
        else
            local v12 = v0(v7:getState().Players, v11);
            if #v12 == 0 then
                return {
                    key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist", 
                    args = {
                        RBX_NAME = v11
                    }, 
                    metadata = "Roblox.Mute.Error.PlayerNotFound"
                };
            elseif #v12 > 1 then
                return {
                    key = "CoreScripts.TextChat.Mute.Error.MultipleMatches", 
                    args = {}, 
                    metadata = "Roblox.Mute.Error.MultipleMatches"
                };
            else
                local v13 = v12[1];
                if v13.userId == tostring(v8) then
                    return {
                        key = "CoreScripts.TextChat.Mute.Error.CannotMuteSelf", 
                        args = {}, 
                        metadata = "Roblox.Mute.Error.CannotMuteSelf"
                    };
                else
                    if l_FFlagExpChatUseMessagesStore_0 then
                        if v10 and v10.messagesStore then
                            v10.messagesStore.muteUser(v13.userId);
                        else
                            return {
                                key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown", 
                                args = {}, 
                                metadata = "Roblox.Mute.Error.ContextNotAvailable"
                            };
                        end;
                    else
                        v7:dispatch(v3(v13.userId));
                    end;
                    return {
                        key = "CoreScripts.TextChat.Mute.Success", 
                        args = {
                            RBX_NAME = v13.nameToDisplay
                        }, 
                        metadata = "Roblox.Mute.Info.Success"
                    };
                end;
            end;
        end;
    end
};