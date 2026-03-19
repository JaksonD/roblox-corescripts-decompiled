local l_TextChatService_0 = game:GetService("TextChatService");
return function() --[[ Line: 3 ]]
    -- upvalues: l_TextChatService_0 (copy)
    if l_TextChatService_0.ChatVersion == Enum.ChatVersion.LegacyChatService then
        return false;
    else
        return true;
    end;
end;