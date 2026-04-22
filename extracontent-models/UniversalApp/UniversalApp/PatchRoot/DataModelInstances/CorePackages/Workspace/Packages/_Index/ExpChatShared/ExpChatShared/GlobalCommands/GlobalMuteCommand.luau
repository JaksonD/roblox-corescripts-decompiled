local l_Players_0 = game:GetService("Players");
local _ = require(script.Parent.types);
return {
    name = script.Name, 
    alias = {
        "/mute", 
        "/m"
    }, 
    clientRun = function(_, _, v4, v5) --[[ Line: 8 ]] --[[ Name: clientRun ]]
        -- upvalues: l_Players_0 (copy)
        local v6 = string.split(v4, " ")[2];
        local v7 = false;
        if v6 ~= nil then
            v7 = string.sub(v6, 1, 1) == "@";
        end;
        local v8 = if v7 then string.sub(v6, 2) else v6;
        if not v8 or #v8 < 3 then
            return {
                key = "CoreScripts.TextChat.Mute.Error.TargetDoesNotExist", 
                args = {
                    RBX_NAME = v8 or ""
                }, 
                metadata = "Roblox.GlobalMute.Error.PlayerNotFound"
            };
        elseif not v5 or not v5.globalMutedUsersStore then
            return {
                key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown", 
                args = {}, 
                metadata = "Roblox.GlobalMute.Error.ContextNotAvailable"
            };
        elseif v7 then
            local v9 = string.lower(v8);
            if l_Players_0.LocalPlayer and string.lower(l_Players_0.LocalPlayer.Name) == v9 then
                return {
                    key = "CoreScripts.TextChat.Mute.Error.CannotMuteSelf", 
                    args = {}, 
                    metadata = "Roblox.GlobalMute.Error.CannotMuteSelf"
                };
            else
                v5.globalMutedUsersStore.muteGlobalUsername(v9);
                return {
                    key = "CoreScripts.TextChat.Mute.Success", 
                    args = {
                        RBX_NAME = "@" .. v9
                    }, 
                    metadata = "Roblox.GlobalMute.Info.Success"
                };
            end;
        else
            v5.globalMutedUsersStore.muteGlobalDisplayName(v8);
            return {
                key = "CoreScripts.TextChat.Mute.Success", 
                args = {
                    RBX_NAME = v8
                }, 
                metadata = "Roblox.GlobalMute.Info.Success"
            };
        end;
    end
};