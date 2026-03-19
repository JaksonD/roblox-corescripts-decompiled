local v0 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 7 ]]
    return UserSettings():IsUserFeatureEnabled("UserFlagRemoveMessageFromMessageLog");
end);
v0 = l_status_0 and l_result_0;
l_status_0 = false;
local v3;
l_result_0, v3 = pcall(function() --[[ Line: 15 ]]
    return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2");
end);
l_status_0 = l_result_0 and v3;
l_result_0 = {};
local l_ClientChatModules_0 = game:GetService("Chat"):WaitForChild("ClientChatModules");
local l_Parent_0 = script.Parent;
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local v7 = nil;
if l_status_0 then
    v7 = l_Parent_0:FindFirstChild("ChatTranslationEnabled");
    if v7 == nil then
        local v8 = nil;
        do
            local l_v8_0 = v8;
            l_v8_0 = l_Parent_0.ChildAdded:Connect(function(v10) --[[ Line: 35 ]]
                -- upvalues: v7 (ref), l_v8_0 (ref)
                if v10.Name == "ChatTranslationEnabled" then
                    v7 = v10;
                    l_v8_0:Disconnect();
                end;
            end);
        end;
    end;
end;
local v11 = {};
v11.__index = v11;
v11.Destroy = function(v12) --[[ Line: 50 ]] --[[ Name: Destroy ]]
    v12.Destroyed = true;
end;
v11.SetActive = function(v13, v14) --[[ Line: 54 ]] --[[ Name: SetActive ]]
    if v14 == v13.Active then
        return;
    else
        if v14 == false then
            v13.MessageLogDisplay:Clear();
        else
            v13.MessageLogDisplay:SetCurrentChannelName(v13.Name);
            for v15 = 1, #v13.MessageLog do
                v13.MessageLogDisplay:AddMessage(v13.MessageLog[v15]);
            end;
        end;
        v13.Active = v14;
        return;
    end;
end;
v11.UpdateMessageFiltered = function(v16, v17) --[[ Line: 69 ]] --[[ Name: UpdateMessageFiltered ]]
    -- upvalues: l_status_0 (ref), v7 (ref), v0 (ref)
    local v18 = 1;
    local l_MessageLog_0 = v16.MessageLog;
    local v20 = nil;
    while v18 <= #l_MessageLog_0 do
        local v21 = l_MessageLog_0[v18];
        if v21.ID == v17.ID then
            v20 = v21;
            break;
        else
            v18 = v18 + 1;
        end;
    end;
    if v20 then
        v20.Message = v17.Message;
        v20.IsFiltered = true;
        if l_status_0 and v7 ~= nil and v7.Value then
            v20.TranslatedMessage = v17.TranslatedMessage;
            v20.ShowTranslated = true;
        end;
        if v16.Active then
            if v0 and v20.Message == "" then
                table.remove(v16.MessageLog, v18);
            end;
            v16.MessageLogDisplay:UpdateMessageFiltered(v20);
            return;
        end;
    else
        v16:AddMessageToChannelByTimeStamp(v17);
    end;
end;
v11.AddMessageToChannel = function(v22, v23) --[[ Line: 105 ]] --[[ Name: AddMessageToChannel ]]
    -- upvalues: l_ChatSettings_0 (copy)
    table.insert(v22.MessageLog, v23);
    if v22.Active then
        v22.MessageLogDisplay:AddMessage(v23);
    end;
    if #v22.MessageLog > l_ChatSettings_0.MessageHistoryLengthPerChannel then
        v22:RemoveLastMessageFromChannel();
    end;
end;
v11.InternalAddMessageAtTimeStamp = function(v24, v25) --[[ Line: 115 ]] --[[ Name: InternalAddMessageAtTimeStamp ]]
    for v26 = 1, #v24.MessageLog do
        if v25.Time < v24.MessageLog[v26].Time then
            table.insert(v24.MessageLog, v26, v25);
            return;
        end;
    end;
    table.insert(v24.MessageLog, v25);
end;
v11.AddMessagesToChannelByTimeStamp = function(v27, v28, v29) --[[ Line: 125 ]] --[[ Name: AddMessagesToChannelByTimeStamp ]]
    -- upvalues: l_ChatSettings_0 (copy)
    for v30 = v29, #v28 do
        v27:InternalAddMessageAtTimeStamp(v28[v30]);
    end;
    while #v27.MessageLog > l_ChatSettings_0.MessageHistoryLengthPerChannel do
        table.remove(v27.MessageLog, 1);
    end;
    if v27.Active then
        v27.MessageLogDisplay:Clear();
        for v31 = 1, #v27.MessageLog do
            v27.MessageLogDisplay:AddMessage(v27.MessageLog[v31]);
        end;
    end;
end;
v11.AddMessageToChannelByTimeStamp = function(v32, v33) --[[ Line: 140 ]] --[[ Name: AddMessageToChannelByTimeStamp ]]
    -- upvalues: l_ChatSettings_0 (copy)
    if #v32.MessageLog >= 1 then
        if v32.MessageLog[1].Time > v33.Time then
            return;
        elseif v33.Time >= v32.MessageLog[#v32.MessageLog].Time then
            v32:AddMessageToChannel(v33);
            return;
        else
            for v34 = 1, #v32.MessageLog do
                if v33.Time < v32.MessageLog[v34].Time then
                    table.insert(v32.MessageLog, v34, v33);
                    if #v32.MessageLog > l_ChatSettings_0.MessageHistoryLengthPerChannel then
                        v32:RemoveLastMessageFromChannel();
                    end;
                    if v32.Active then
                        v32.MessageLogDisplay:AddMessageAtIndex(v33, v34);
                    end;
                    return;
                end;
            end;
            return;
        end;
    else
        v32:AddMessageToChannel(v33);
        return;
    end;
end;
v11.RemoveLastMessageFromChannel = function(v35) --[[ Line: 170 ]] --[[ Name: RemoveLastMessageFromChannel ]]
    table.remove(v35.MessageLog, 1);
    if v35.Active then
        v35.MessageLogDisplay:RemoveLastMessage();
    end;
end;
v11.ClearMessageLog = function(v36) --[[ Line: 178 ]] --[[ Name: ClearMessageLog ]]
    v36.MessageLog = {};
    if v36.Active then
        v36.MessageLogDisplay:Clear();
    end;
end;
v11.RegisterChannelTab = function(v37, v38) --[[ Line: 186 ]] --[[ Name: RegisterChannelTab ]]
    v37.ChannelTab = v38;
end;
l_result_0.new = function(v39, v40) --[[ Line: 193 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy)
    local v41 = setmetatable({}, v11);
    v41.Destroyed = false;
    v41.Active = false;
    v41.MessageLog = {};
    v41.MessageLogDisplay = v40;
    v41.ChannelTab = nil;
    v41.Name = v39;
    return v41;
end;
return l_result_0;