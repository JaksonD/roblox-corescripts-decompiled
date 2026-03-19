local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Analytics_0 = require(l_script_FirstAncestor_0.Parent.ExpChatShared).Analytics;
local function v5(v2) --[[ Line: 5 ]] --[[ Name: getCounterName ]]
    if v2.Status == Enum.TextChatMessageStatus.Success then
        local l_TextChannel_0 = v2.TextChannel;
        if l_TextChannel_0 then
            local l_Name_0 = l_TextChannel_0.Name;
            if string.find(l_Name_0, "^RBX") == nil then
                return "expChatMessageReceivedSuccessCustom";
            elseif l_Name_0 == "RBXGeneral" then
                return "expChatMessageReceivedSuccessGeneral";
            elseif l_Name_0 == "RBXSystem" then
                return "expChatMessageReceivedSuccessSystem";
            elseif string.find(l_Name_0, "^RBXWhisper") then
                return "expChatMessageReceivedSuccessWhisper";
            elseif string.find(l_Name_0, "^RBXTeam") then
                return "expChatMessageReceivedSuccessTeam";
            else
                return "expChatMessageReceivedSuccessCustom";
            end;
        end;
    end;
    if v2.Status == Enum.TextChatMessageStatus.Unknown then
        return "expChatMessageReceivedUnknown";
    elseif v2.Status == Enum.TextChatMessageStatus.InvalidTextChannelPermissions then
        return "expChatMessageReceivedInvalidTextChannelPermissions";
    elseif v2.Status == Enum.TextChatMessageStatus.InvalidPrivacySettings then
        return "expChatMessageReceivedInvalidPrivacySettings";
    elseif v2.Status == Enum.TextChatMessageStatus.TextFilterFailed then
        return "expChatMessageReceivedTextFilterFailed";
    elseif v2.Status == Enum.TextChatMessageStatus.Floodchecked then
        return "expChatMessageReceivedFloodchecked";
    elseif v2.Status == Enum.TextChatMessageStatus.MessageTooLong then
        return "expChatMessageReceivedMessageTooLong";
    elseif v2.Status == Enum.TextChatMessageStatus.ModerationTimeout then
        return "expChatMessageReceivedModerationTimeout";
    else
        return nil;
    end;
end;
return function(v6, v7) --[[ Line: 47 ]]
    -- upvalues: v5 (copy), l_Analytics_0 (copy)
    local l_TextSource_0 = v7.TextSource;
    if l_TextSource_0 and v6 == l_TextSource_0.UserId then
        local v9 = v5(v7);
        if v9 then
            l_Analytics_0.reportCounter(v9);
        end;
    end;
end;