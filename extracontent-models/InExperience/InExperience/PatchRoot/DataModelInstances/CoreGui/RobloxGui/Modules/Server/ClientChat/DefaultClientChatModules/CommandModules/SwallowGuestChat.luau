local l_Util_0 = require(script.Parent:WaitForChild("Util"));
local l_RunService_0 = game:GetService("RunService");
local v2 = nil;
pcall(function() --[[ Line: 12 ]]
    -- upvalues: v2 (ref)
    v2 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
if v2 == nil then
    v2 = {
        Get = function(_, _, v5) --[[ Line: 13 ]] --[[ Name: Get ]]
            return v5;
        end
    };
end;
ProcessMessage = function(_, v7, _) --[[ Line: 15 ]] --[[ Name: ProcessMessage ]]
    -- upvalues: l_RunService_0 (copy), l_Util_0 (copy), v2 (ref)
    local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
    if l_LocalPlayer_0 and l_LocalPlayer_0.UserId < 0 and not l_RunService_0:IsStudio() then
        local l_v7_CurrentChannel_0 = v7:GetCurrentChannel();
        if l_v7_CurrentChannel_0 then
            l_Util_0:SendSystemMessageToSelf(v2:Get("GameChat_SwallowGuestChat_Message", "Create a free account to get access to chat permissions!"), l_v7_CurrentChannel_0, {});
        end;
        return true;
    else
        return false;
    end;
end;
return {
    [l_Util_0.KEY_COMMAND_PROCESSOR_TYPE] = l_Util_0.COMPLETED_MESSAGE_PROCESSOR, 
    [l_Util_0.KEY_PROCESSOR_FUNCTION] = ProcessMessage
};