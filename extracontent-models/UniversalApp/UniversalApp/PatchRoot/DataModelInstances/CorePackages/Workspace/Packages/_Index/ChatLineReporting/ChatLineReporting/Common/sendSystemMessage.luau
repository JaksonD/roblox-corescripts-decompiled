local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local l_TextChatService_0 = game:GetService("TextChatService");
local v2 = require(l_script_FirstAncestor_0.Common.Constants);
local function v5(v3) --[[ Line: 8 ]] --[[ Name: findTextChannel ]]
    -- upvalues: l_TextChatService_0 (copy)
    local l_l_TextChatService_0_FirstChild_0 = l_TextChatService_0:FindFirstChild(v3, true);
    while not l_l_TextChatService_0_FirstChild_0 do
        wait();
        l_l_TextChatService_0_FirstChild_0 = l_TextChatService_0:FindFirstChild(v3, true);
    end;
    return l_l_TextChatService_0_FirstChild_0;
end;
sendSystemMessage = function(v6) --[[ Line: 17 ]] --[[ Name: sendSystemMessage ]]
    -- upvalues: v5 (copy), v2 (copy)
    if v6 then
        v5(v2.ChannelTypes.System):DisplaySystemMessage(v6);
    end;
end;
return sendSystemMessage;