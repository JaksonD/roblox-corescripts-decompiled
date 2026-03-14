local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_script_0 = script;
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_Chat_0 = game:GetService("Chat");
local l_ChatService_0 = require(l_script_0:WaitForChild("ChatService"));
local l_ClientChatModules_0 = l_Chat_0:WaitForChild("ClientChatModules");
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local v8 = nil;
pcall(function() --[[ Line: 20 ]]
    -- upvalues: v8 (ref), l_Chat_0 (copy)
    v8 = require(l_Chat_0.ClientChatModules.ChatLocalization);
end);
v8 = v8 or {};
local v9 = l_ChatSettings_0.MaxChannelNameCheckLength or 50;
local l_MaximumMessageLength_0 = l_ChatSettings_0.MaximumMessageLength;
if not v8.FormatMessageToSend or not v8.LocalizeFormattedMessage then
    v8.FormatMessageToSend = function(_, _, v13) --[[ Line: 28 ]] --[[ Name: FormatMessageToSend ]]
        return v13;
    end;
end;
local v14 = {};
local l_DefaultChatSystemChatEvents_0 = l_ReplicatedStorage_0:FindFirstChild("DefaultChatSystemChatEvents");
if not l_DefaultChatSystemChatEvents_0 then
    l_DefaultChatSystemChatEvents_0 = Instance.new("Folder");
    l_DefaultChatSystemChatEvents_0.Name = "DefaultChatSystemChatEvents";
    l_DefaultChatSystemChatEvents_0.Archivable = false;
    l_DefaultChatSystemChatEvents_0.Parent = l_ReplicatedStorage_0;
end;
local function v17(v16) --[[ Line: 43 ]] --[[ Name: validateMessageLength ]]
    -- upvalues: l_MaximumMessageLength_0 (copy)
    if v16:len() > l_MaximumMessageLength_0 * 6 then
        return false;
    elseif utf8.len(v16) == nil then
        return false;
    elseif utf8.len(utf8.nfcnormalize(v16)) > l_MaximumMessageLength_0 then
        return false;
    else
        return true;
    end;
end;
local function v19(v18) --[[ Line: 59 ]] --[[ Name: validateChannelNameLength ]]
    -- upvalues: v9 (copy)
    if v18:len() > v9 * 6 then
        return false;
    elseif utf8.len(v18) == nil then
        return false;
    elseif utf8.len(utf8.nfcnormalize(v18)) > v9 then
        return false;
    else
        return true;
    end;
end;
local function v20() --[[ Line: 77 ]] --[[ Name: emptyFunction ]]

end;
local function v26(v21, v22, v23) --[[ Line: 81 ]] --[[ Name: GetObjectWithNameAndType ]]
    for _, v25 in pairs(v21:GetChildren()) do
        if v25:IsA(v23) and v25.Name == v22 then
            return v25;
        end;
    end;
    return nil;
end;
local function _(v27, v28, v29) --[[ Line: 91 ]] --[[ Name: CreateIfDoesntExist ]]
    -- upvalues: v26 (copy), v14 (copy)
    local v30 = v26(v27, v28, v29);
    if not v30 then
        v30 = Instance.new(v29);
        v30.Name = v28;
        v30.Parent = v27;
    end;
    v14[v28] = v30;
    return v30;
end;
local function _(v32, v33) --[[ Line: 104 ]] --[[ Name: CreateEventIfItDoesntExist ]]
    -- upvalues: v26 (copy), v14 (copy), v20 (copy)
    local v34 = v26(v32, v33, "RemoteEvent");
    if not v34 then
        v34 = Instance.new("RemoteEvent");
        v34.Name = v33;
        v34.Parent = v32;
    end;
    v14[v33] = v34;
    local l_v34_0 = v34;
    l_v34_0.OnServerEvent:Connect(v20);
    return l_v34_0;
end;
local l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
local v38 = v26(l_l_DefaultChatSystemChatEvents_0_0, "OnNewMessage", "RemoteEvent");
if not v38 then
    v38 = Instance.new("RemoteEvent");
    v38.Name = "OnNewMessage";
    v38.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v14.OnNewMessage = v38;
v38.OnServerEvent:Connect(v20);
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v38 = v26(l_l_DefaultChatSystemChatEvents_0_0, "OnMessageDoneFiltering", "RemoteEvent");
if not v38 then
    v38 = Instance.new("RemoteEvent");
    v38.Name = "OnMessageDoneFiltering";
    v38.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v14.OnMessageDoneFiltering = v38;
v38.OnServerEvent:Connect(v20);
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v38 = v26(l_l_DefaultChatSystemChatEvents_0_0, "OnNewSystemMessage", "RemoteEvent");
if not v38 then
    v38 = Instance.new("RemoteEvent");
    v38.Name = "OnNewSystemMessage";
    v38.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v14.OnNewSystemMessage = v38;
v38.OnServerEvent:Connect(v20);
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v38 = v26(l_l_DefaultChatSystemChatEvents_0_0, "OnChannelJoined", "RemoteEvent");
if not v38 then
    v38 = Instance.new("RemoteEvent");
    v38.Name = "OnChannelJoined";
    v38.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v14.OnChannelJoined = v38;
v38.OnServerEvent:Connect(v20);
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v38 = v26(l_l_DefaultChatSystemChatEvents_0_0, "OnChannelLeft", "RemoteEvent");
if not v38 then
    v38 = Instance.new("RemoteEvent");
    v38.Name = "OnChannelLeft";
    v38.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v14.OnChannelLeft = v38;
v38.OnServerEvent:Connect(v20);
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v38 = v26(l_l_DefaultChatSystemChatEvents_0_0, "OnMuted", "RemoteEvent");
if not v38 then
    v38 = Instance.new("RemoteEvent");
    v38.Name = "OnMuted";
    v38.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v14.OnMuted = v38;
v38.OnServerEvent:Connect(v20);
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v38 = v26(l_l_DefaultChatSystemChatEvents_0_0, "OnUnmuted", "RemoteEvent");
if not v38 then
    v38 = Instance.new("RemoteEvent");
    v38.Name = "OnUnmuted";
    v38.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v14.OnUnmuted = v38;
v38.OnServerEvent:Connect(v20);
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v38 = v26(l_l_DefaultChatSystemChatEvents_0_0, "OnMainChannelSet", "RemoteEvent");
if not v38 then
    v38 = Instance.new("RemoteEvent");
    v38.Name = "OnMainChannelSet";
    v38.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v14.OnMainChannelSet = v38;
v38.OnServerEvent:Connect(v20);
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v38 = v26(l_l_DefaultChatSystemChatEvents_0_0, "ChannelNameColorUpdated", "RemoteEvent");
if not v38 then
    v38 = Instance.new("RemoteEvent");
    v38.Name = "ChannelNameColorUpdated";
    v38.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v14.ChannelNameColorUpdated = v38;
v38.OnServerEvent:Connect(v20);
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v38 = v26(l_l_DefaultChatSystemChatEvents_0_0, "SayMessageRequest", "RemoteEvent");
if not v38 then
    v38 = Instance.new("RemoteEvent");
    v38.Name = "SayMessageRequest";
    v38.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v14.SayMessageRequest = v38;
v38.OnServerEvent:Connect(v20);
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v38 = v26(l_l_DefaultChatSystemChatEvents_0_0, "SetBlockedUserIdsRequest", "RemoteEvent");
if not v38 then
    v38 = Instance.new("RemoteEvent");
    v38.Name = "SetBlockedUserIdsRequest";
    v38.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v14.SetBlockedUserIdsRequest = v38;
v38.OnServerEvent:Connect(v20);
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
local v39 = v26(l_l_DefaultChatSystemChatEvents_0_0, "GetInitDataRequest", "RemoteFunction");
if not v39 then
    v39 = Instance.new("RemoteFunction");
    v39.Name = "GetInitDataRequest";
    v39.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v14.GetInitDataRequest = v39;
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v39 = v26(l_l_DefaultChatSystemChatEvents_0_0, "MutePlayerRequest", "RemoteFunction");
if not v39 then
    v39 = Instance.new("RemoteFunction");
    v39.Name = "MutePlayerRequest";
    v39.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v14.MutePlayerRequest = v39;
l_l_DefaultChatSystemChatEvents_0_0 = l_DefaultChatSystemChatEvents_0;
v39 = v26(l_l_DefaultChatSystemChatEvents_0_0, "UnMutePlayerRequest", "RemoteFunction");
if not v39 then
    v39 = Instance.new("RemoteFunction");
    v39.Name = "UnMutePlayerRequest";
    v39.Parent = l_l_DefaultChatSystemChatEvents_0_0;
end;
v14.UnMutePlayerRequest = v39;
l_DefaultChatSystemChatEvents_0 = v14;
l_l_DefaultChatSystemChatEvents_0_0 = function(v40) --[[ Line: 128 ]] --[[ Name: CreatePlayerSpeakerObject ]]
    -- upvalues: l_ChatService_0 (copy), l_DefaultChatSystemChatEvents_0 (ref)
    if l_ChatService_0:GetSpeaker(v40.Name) then
        l_ChatService_0:RemoveSpeaker(v40.Name);
    end;
    local v41 = l_ChatService_0:InternalAddSpeakerWithPlayerObject(v40.Name, v40, false);
    for _, v43 in pairs(l_ChatService_0:GetAutoJoinChannelList()) do
        v41:JoinChannel(v43.Name);
    end;
    v41:InternalAssignEventFolder(l_DefaultChatSystemChatEvents_0);
    v41.ChannelJoined:connect(function(v44, v45) --[[ Line: 145 ]]
        -- upvalues: l_ChatService_0 (ref), v41 (ref), l_DefaultChatSystemChatEvents_0 (ref), v40 (copy)
        local v46 = nil;
        local v47 = nil;
        local l_l_ChatService_0_Channel_0 = l_ChatService_0:GetChannel(v44);
        if l_l_ChatService_0_Channel_0 then
            v46 = l_l_ChatService_0_Channel_0:GetHistoryLogForSpeaker(v41);
            v47 = l_l_ChatService_0_Channel_0.ChannelNameColor;
        end;
        l_DefaultChatSystemChatEvents_0.OnChannelJoined:FireClient(v40, v44, v45, v46, v47);
    end);
    v41.Muted:connect(function(v49, v50, v51) --[[ Line: 157 ]]
        -- upvalues: l_DefaultChatSystemChatEvents_0 (ref), v40 (copy)
        l_DefaultChatSystemChatEvents_0.OnMuted:FireClient(v40, v49, v50, v51);
    end);
    v41.Unmuted:connect(function(v52) --[[ Line: 161 ]]
        -- upvalues: l_DefaultChatSystemChatEvents_0 (ref), v40 (copy)
        l_DefaultChatSystemChatEvents_0.OnUnmuted:FireClient(v40, v52);
    end);
    l_ChatService_0:InternalFireSpeakerAdded(v41.Name);
end;
l_DefaultChatSystemChatEvents_0.SayMessageRequest.OnServerEvent:connect(function(v53, v54, v55) --[[ Line: 168 ]]
    -- upvalues: v17 (copy), v19 (copy), l_ChatService_0 (copy)
    if type(v54) ~= "string" then
        return;
    elseif not v17(v54) then
        return;
    elseif type(v55) ~= "string" then
        return;
    elseif not v19(v55) then
        return;
    else
        local l_l_ChatService_0_Speaker_0 = l_ChatService_0:GetSpeaker(v53.Name);
        if l_l_ChatService_0_Speaker_0 then
            return l_l_ChatService_0_Speaker_0:SayMessage(v54, v55);
        else
            return nil;
        end;
    end;
end);
l_DefaultChatSystemChatEvents_0.MutePlayerRequest.OnServerInvoke = function(v57, v58) --[[ Line: 189 ]]
    -- upvalues: l_ChatService_0 (copy)
    if type(v58) ~= "string" then
        return;
    else
        local l_l_ChatService_0_Speaker_1 = l_ChatService_0:GetSpeaker(v57.Name);
        if l_l_ChatService_0_Speaker_1 then
            local l_l_ChatService_0_Speaker_2 = l_ChatService_0:GetSpeaker(v58);
            if l_l_ChatService_0_Speaker_2 then
                l_l_ChatService_0_Speaker_1:AddMutedSpeaker(l_l_ChatService_0_Speaker_2.Name);
                return true;
            end;
        end;
        return false;
    end;
end;
l_DefaultChatSystemChatEvents_0.UnMutePlayerRequest.OnServerInvoke = function(v61, v62) --[[ Line: 205 ]]
    -- upvalues: l_ChatService_0 (copy)
    if type(v62) ~= "string" then
        return;
    else
        local l_l_ChatService_0_Speaker_3 = l_ChatService_0:GetSpeaker(v61.Name);
        if l_l_ChatService_0_Speaker_3 then
            local l_l_ChatService_0_Speaker_4 = l_ChatService_0:GetSpeaker(v62);
            if l_l_ChatService_0_Speaker_4 then
                l_l_ChatService_0_Speaker_3:RemoveMutedSpeaker(l_l_ChatService_0_Speaker_4.Name);
                return true;
            end;
        end;
        return false;
    end;
end;
v39 = {};
l_Players_0.PlayerAdded:connect(function(v65) --[[ Line: 224 ]]
    -- upvalues: v39 (copy), l_ChatService_0 (copy)
    for v66, v67 in pairs(v39) do
        local l_l_ChatService_0_Speaker_5 = l_ChatService_0:GetSpeaker(v66.Name);
        if l_l_ChatService_0_Speaker_5 then
            for v69 = 1, #v67 do
                if v67[v69] == v65.UserId then
                    l_l_ChatService_0_Speaker_5:AddMutedSpeaker(v65.Name);
                end;
            end;
        end;
    end;
end);
l_Players_0.PlayerRemoving:connect(function(v70) --[[ Line: 238 ]]
    -- upvalues: v39 (copy)
    v39[v70] = nil;
end);
l_DefaultChatSystemChatEvents_0.SetBlockedUserIdsRequest.OnServerEvent:Connect(function(v71, v72) --[[ Line: 242 ]]
    -- upvalues: l_ChatService_0 (copy), l_Players_0 (copy), v39 (copy)
    if type(v72) ~= "table" then
        return;
    else
        local v73 = {};
        local l_l_ChatService_0_Speaker_6 = l_ChatService_0:GetSpeaker(v71.Name);
        if l_l_ChatService_0_Speaker_6 then
            for v75 = 1, math.min(#v72, 50) do
                if type(v72[v75]) == "number" then
                    table.insert(v73, v72[v75]);
                    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v72[v75]);
                    if l_l_Players_0_PlayerByUserId_0 then
                        l_l_ChatService_0_Speaker_6:AddMutedSpeaker(l_l_Players_0_PlayerByUserId_0.Name);
                    end;
                end;
            end;
            v39[v71] = v73;
        end;
        return;
    end;
end);
l_DefaultChatSystemChatEvents_0.GetInitDataRequest.OnServerInvoke = function(v77) --[[ Line: 268 ]]
    -- upvalues: l_ChatService_0 (copy), l_l_DefaultChatSystemChatEvents_0_0 (copy)
    local l_l_ChatService_0_Speaker_7 = l_ChatService_0:GetSpeaker(v77.Name);
    if not l_l_ChatService_0_Speaker_7 or not l_l_ChatService_0_Speaker_7:GetPlayer() then
        l_l_DefaultChatSystemChatEvents_0_0(v77);
        l_l_ChatService_0_Speaker_7 = l_ChatService_0:GetSpeaker(v77.Name);
    end;
    local v79 = {
        Channels = {}, 
        SpeakerExtraData = {}
    };
    for _, v81 in pairs(l_l_ChatService_0_Speaker_7:GetChannelList()) do
        local l_l_ChatService_0_Channel_1 = l_ChatService_0:GetChannel(v81);
        if l_l_ChatService_0_Channel_1 then
            local v83 = {
                v81, 
                l_l_ChatService_0_Channel_1:GetWelcomeMessageForSpeaker(l_l_ChatService_0_Speaker_7), 
                l_l_ChatService_0_Channel_1:GetHistoryLogForSpeaker(l_l_ChatService_0_Speaker_7), 
                l_l_ChatService_0_Channel_1.ChannelNameColor
            };
            table.insert(v79.Channels, v83);
        end;
    end;
    for _, v85 in pairs(l_ChatService_0:GetSpeakerList()) do
        local l_l_ChatService_0_Speaker_8 = l_ChatService_0:GetSpeaker(v85);
        v79.SpeakerExtraData[v85] = l_l_ChatService_0_Speaker_8.ExtraData;
    end;
    return v79;
end;
v38 = function(v87, v88, v89) --[[ Line: 302 ]] --[[ Name: DoJoinCommand ]]
    -- upvalues: l_ChatService_0 (copy), v8 (ref)
    local l_l_ChatService_0_Speaker_9 = l_ChatService_0:GetSpeaker(v87);
    local l_l_ChatService_0_Channel_2 = l_ChatService_0:GetChannel(v88);
    if l_l_ChatService_0_Speaker_9 then
        if l_l_ChatService_0_Channel_2 then
            if l_l_ChatService_0_Channel_2.Joinable then
                if not l_l_ChatService_0_Speaker_9:IsInChannel(l_l_ChatService_0_Channel_2.Name) then
                    l_l_ChatService_0_Speaker_9:JoinChannel(l_l_ChatService_0_Channel_2.Name);
                    return;
                else
                    l_l_ChatService_0_Speaker_9:SetMainChannel(l_l_ChatService_0_Channel_2.Name);
                    l_l_ChatService_0_Speaker_9:SendSystemMessage(v8:FormatMessageToSend("GameChat_SwitchChannel_NowInChannel", string.format("You are now chatting in channel: '%s'", l_l_ChatService_0_Channel_2.Name), "RBX_NAME", l_l_ChatService_0_Channel_2.Name), l_l_ChatService_0_Channel_2.Name);
                    return;
                end;
            else
                l_l_ChatService_0_Speaker_9:SendSystemMessage(v8:FormatMessageToSend("GameChat_ChatServiceRunner_YouCannotJoinChannel", "You cannot join channel '" .. v88 .. "'.", "RBX_NAME", v88), v89);
                return;
            end;
        else
            l_l_ChatService_0_Speaker_9:SendSystemMessage(v8:FormatMessageToSend("GameChat_ChatServiceRunner_ChannelDoesNotExist", "Channel '" .. v88 .. "' does not exist.", "RBX_NAME", v88), v89);
        end;
    end;
end;
local function v97(v92, v93, v94) --[[ Line: 339 ]] --[[ Name: DoLeaveCommand ]]
    -- upvalues: l_ChatService_0 (copy), v8 (ref)
    local l_l_ChatService_0_Speaker_10 = l_ChatService_0:GetSpeaker(v92);
    local l_l_ChatService_0_Channel_3 = l_ChatService_0:GetChannel(v93);
    if l_l_ChatService_0_Speaker_10 then
        if l_l_ChatService_0_Speaker_10:IsInChannel(v93) then
            if l_l_ChatService_0_Channel_3.Leavable then
                l_l_ChatService_0_Speaker_10:LeaveChannel(l_l_ChatService_0_Channel_3.Name);
                l_l_ChatService_0_Speaker_10:SendSystemMessage(v8:FormatMessageToSend("GameChat_ChatService_YouHaveLeftChannel", string.format("You have left channel '%s'", v93), "RBX_NAME", l_l_ChatService_0_Channel_3.Name), "System");
                return;
            else
                l_l_ChatService_0_Speaker_10:SendSystemMessage(v8:FormatMessageToSend("GameChat_ChatServiceRunner_YouCannotLeaveChannel", "You cannot leave channel '" .. v93 .. "'.", "RBX_NAME", v93), v94);
                return;
            end;
        else
            l_l_ChatService_0_Speaker_10:SendSystemMessage(v8:FormatMessageToSend("GameChat_ChatServiceRunner_YouAreNotInChannel", "You are not in channel '" .. v93 .. "'.", "RBX_NAME", v93), v94);
        end;
    end;
end;
l_ChatService_0:RegisterProcessCommandsFunction("default_commands", function(v98, v99, v100) --[[ Line: 372 ]]
    -- upvalues: v38 (copy), v97 (copy)
    if string.sub(v99, 1, 6):lower() == "/join " then
        v38(v98, string.sub(v99, 7), v100);
        return true;
    elseif string.sub(v99, 1, 3):lower() == "/j " then
        v38(v98, string.sub(v99, 4), v100);
        return true;
    elseif string.sub(v99, 1, 7):lower() == "/leave " then
        v97(v98, string.sub(v99, 8), v100);
        return true;
    elseif string.sub(v99, 1, 3):lower() == "/l " then
        v97(v98, string.sub(v99, 4), v100);
        return true;
    else
        return false;
    end;
end);
if l_ChatSettings_0.GeneralChannelName and l_ChatSettings_0.GeneralChannelName ~= "" then
    local v101 = l_ChatService_0:AddChannel(l_ChatSettings_0.GeneralChannelName);
    v101.Leavable = false;
    v101.AutoJoin = true;
    v101:RegisterGetWelcomeMessageFunction(function(v102) --[[ Line: 396 ]]
        -- upvalues: l_RunService_0 (copy), l_Chat_0 (copy)
        if l_RunService_0:IsStudio() then
            return nil;
        else
            local l_v102_Player_0 = v102:GetPlayer();
            if l_v102_Player_0 then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 402 ]]
                    -- upvalues: l_Chat_0 (ref), l_v102_Player_0 (copy)
                    return l_Chat_0:CanUserChatAsync(l_v102_Player_0.UserId);
                end);
                if l_status_0 and not l_result_0 then
                    return "";
                end;
            end;
            return;
        end;
    end);
end;
local v106 = l_ChatService_0:AddChannel("System");
v106.Leavable = false;
v106.AutoJoin = true;
v106.WelcomeMessage = v8:FormatMessageToSend("GameChat_ChatServiceRunner_SystemChannelWelcomeMessage", "This channel is for system and game notifications.");
v106.SpeakerJoined:connect(function(v107) --[[ Line: 419 ]]
    -- upvalues: v106 (copy)
    v106:MuteSpeaker(v107);
end);
local function v110(v108) --[[ Line: 424 ]] --[[ Name: TryRunModule ]]
    -- upvalues: l_ChatService_0 (copy)
    if v108:IsA("ModuleScript") then
        local v109 = require(v108);
        if type(v109) == "function" then
            v109(l_ChatService_0);
        end;
    end;
end;
local l_ChatModules_0 = l_Chat_0:WaitForChild("ChatModules");
l_ChatModules_0.ChildAdded:connect(function(v112) --[[ Line: 434 ]]
    -- upvalues: v110 (copy)
    local l_status_1, l_result_1 = pcall(v110, v112);
    if not l_status_1 and l_result_1 then
        print("Error running module " .. v112.Name .. ": " .. l_result_1);
    end;
end);
for _, v116 in pairs(l_ChatModules_0:GetChildren()) do
    local l_status_2, l_result_2 = pcall(v110, v116);
    if not l_status_2 and l_result_2 then
        print("Error running module " .. v116.Name .. ": " .. l_result_2);
    end;
end;
l_Players_0.PlayerRemoving:connect(function(v119) --[[ Line: 448 ]]
    -- upvalues: l_ChatService_0 (copy)
    if l_ChatService_0:GetSpeaker(v119.Name) then
        l_ChatService_0:RemoveSpeaker(v119.Name);
    end;
end);