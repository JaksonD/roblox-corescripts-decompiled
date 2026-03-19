local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Set_0 = require(l_Parent_0.llama).Set;
local v3 = require(l_script_FirstAncestor_0.getOtherDisplayNameInWhisperChannel);
local v4 = {};
return function(v5, v6) --[[ Line: 14 ]]
    -- upvalues: l_Set_0 (copy), v4 (ref), v3 (copy)
    if v5.TextChannel and string.find(v5.TextChannel.Name, "^RBXWhisper") and not l_Set_0.has(v4, v5.TextChannel) then
        local v7 = v3(v5.TextChannel, v6);
        if v7 then
            v4 = l_Set_0.add(v4, v5.TextChannel);
            return {
                key = "CoreScripts.TextChat.Notification.WhisperChat.Created", 
                args = {
                    RBX_NAME = v7
                }, 
                metadata = "Roblox.Whisper.Welcome.Sent"
            };
        end;
    end;
    return nil;
end;