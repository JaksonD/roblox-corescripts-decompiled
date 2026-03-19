local v0 = {};
local l_RunService_0 = game:GetService("RunService");
local l_ClientChatModules_0 = game:GetService("Chat"):WaitForChild("ClientChatModules");
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local _ = script.Parent;
local v5 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 16 ]]
    return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures");
end);
v5 = l_status_0 and l_result_0;
l_status_0 = false;
local v8;
l_result_0, v8 = pcall(function() --[[ Line: 24 ]]
    return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2");
end);
l_status_0 = l_result_0 and v8;
l_result_0 = function(v9) --[[ Line: 32 ]] --[[ Name: ShallowCopy ]]
    local v10 = {};
    for v11, v12 in pairs(v9) do
        v10[v11] = v12;
    end;
    return v10;
end;
v8 = {};
local v13 = {
    eDestroyed = true, 
    eSaidMessage = true, 
    eReceivedMessage = true, 
    eReceivedUnfilteredMessage = true, 
    eMessageDoneFiltering = true, 
    eReceivedSystemMessage = true, 
    eChannelJoined = true, 
    eChannelLeft = true, 
    eMuted = true, 
    eUnmuted = true, 
    eExtraDataUpdated = true, 
    eMainChannelSet = true, 
    eChannelNameColorUpdated = true
};
local v14 = {
    Destroyed = "eDestroyed", 
    SaidMessage = "eSaidMessage", 
    ReceivedMessage = "eReceivedMessage", 
    ReceivedUnfilteredMessage = "eReceivedUnfilteredMessage", 
    RecievedUnfilteredMessage = "eReceivedUnfilteredMessage", 
    MessageDoneFiltering = "eMessageDoneFiltering", 
    ReceivedSystemMessage = "eReceivedSystemMessage", 
    ChannelJoined = "eChannelJoined", 
    ChannelLeft = "eChannelLeft", 
    Muted = "eMuted", 
    Unmuted = "eUnmuted", 
    ExtraDataUpdated = "eExtraDataUpdated", 
    MainChannelSet = "eMainChannelSet", 
    ChannelNameColorUpdated = "eChannelNameColorUpdated"
};
v8.__index = function(v15, v16) --[[ Line: 76 ]]
    -- upvalues: v8 (copy), v13 (copy), v14 (copy)
    local v17 = rawget(v8, v16);
    if v17 then
        return v17;
    else
        if v13[v16] and not rawget(v15, v16) then
            rawset(v15, v16, Instance.new("BindableEvent"));
        end;
        local v18 = v14[v16];
        if v18 and not rawget(v15, v16) then
            local v19 = rawget(v15, v18);
            if not v19 then
                v19 = Instance.new("BindableEvent");
                rawset(v15, v18, v19);
            end;
            rawset(v15, v16, v19.Event);
        end;
        return (rawget(v15, v16));
    end;
end;
v8.LazyFire = function(v20, v21, ...) --[[ Line: 95 ]] --[[ Name: LazyFire ]]
    local v22 = rawget(v20, v21);
    if v22 then
        v22:Fire(...);
    end;
end;
v8.SayMessage = function(v23, v24, v25, v26) --[[ Line: 102 ]] --[[ Name: SayMessage ]]
    if v23.ChatService:InternalDoProcessCommands(v23.Name, v24, v25) then
        return;
    elseif not v25 then
        return;
    else
        local v27 = v23.Channels[v25:lower()];
        if not v27 then
            return;
        else
            local v28 = v27:InternalPostMessage(v23, v24, v26);
            if v28 then
                pcall(function() --[[ Line: 117 ]]
                    -- upvalues: v23 (copy), v28 (copy), v25 (copy)
                    v23:LazyFire("eSaidMessage", v28, v25);
                end);
            end;
            return v28;
        end;
    end;
end;
v8.JoinChannel = function(v29, v30) --[[ Line: 125 ]] --[[ Name: JoinChannel ]]
    if v29.Channels[v30:lower()] then
        warn("Speaker is already in channel \"" .. v30 .. "\"");
        return;
    else
        local l_Channel_0 = v29.ChatService:GetChannel(v30);
        if not l_Channel_0 then
            error("Channel \"" .. v30 .. "\" does not exist!");
        end;
        v29.Channels[v30:lower()] = l_Channel_0;
        l_Channel_0:InternalAddSpeaker(v29);
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 138 ]]
            -- upvalues: v29 (copy), l_Channel_0 (copy)
            v29.eChannelJoined:Fire(l_Channel_0.Name, l_Channel_0:GetWelcomeMessageForSpeaker(v29));
        end);
        if not l_status_1 and l_result_1 then
            print("Error joining channel: " .. l_result_1);
        end;
        return;
    end;
end;
v8.LeaveChannel = function(v34, v35) --[[ Line: 146 ]] --[[ Name: LeaveChannel ]]
    if not v34.Channels[v35:lower()] then
        warn("Speaker is not in channel \"" .. v35 .. "\"");
        return;
    else
        local v36 = v34.Channels[v35:lower()];
        v34.Channels[v35:lower()] = nil;
        v36:InternalRemoveSpeaker(v34);
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 156 ]]
            -- upvalues: v34 (copy), v36 (copy)
            v34:LazyFire("eChannelLeft", v36.Name);
            if v34.PlayerObj then
                v34.EventFolder.OnChannelLeft:FireClient(v34.PlayerObj, v36.Name);
            end;
        end);
        if not l_status_2 and l_result_2 then
            print("Error leaving channel: " .. l_result_2);
        end;
        return;
    end;
end;
v8.IsInChannel = function(v39, v40) --[[ Line: 167 ]] --[[ Name: IsInChannel ]]
    return v39.Channels[v40:lower()] ~= nil;
end;
v8.GetChannelList = function(v41) --[[ Line: 171 ]] --[[ Name: GetChannelList ]]
    local v42 = {};
    for _, v44 in pairs(v41.Channels) do
        table.insert(v42, v44.Name);
    end;
    return v42;
end;
v8.SendMessage = function(v45, v46, v47, v48, v49) --[[ Line: 179 ]] --[[ Name: SendMessage ]]
    -- upvalues: l_RunService_0 (copy)
    local v50 = v45.Channels[v47:lower()];
    if v50 then
        v50:SendMessageToSpeaker(v46, v45.Name, v48, v49);
        return;
    else
        if l_RunService_0:IsStudio() then
            warn(string.format("Speaker '%s' is not in channel '%s' and cannot receive a message in it.", v45.Name, v47));
        end;
        return;
    end;
end;
v8.SendSystemMessage = function(v51, v52, v53, v54) --[[ Line: 190 ]] --[[ Name: SendSystemMessage ]]
    -- upvalues: l_RunService_0 (copy)
    local v55 = v51.Channels[v53:lower()];
    if v55 then
        v55:SendSystemMessageToSpeaker(v52, v51.Name, v54);
        return;
    else
        if l_RunService_0:IsStudio() then
            warn(string.format("Speaker '%s' is not in channel '%s' and cannot receive a system message in it.", v51.Name, v53));
        end;
        return;
    end;
end;
v8.GetPlayer = function(v56) --[[ Line: 201 ]] --[[ Name: GetPlayer ]]
    return v56.PlayerObj;
end;
v8.GetNameForDisplay = function(v57) --[[ Line: 205 ]] --[[ Name: GetNameForDisplay ]]
    -- upvalues: l_ChatSettings_0 (copy)
    if l_ChatSettings_0.PlayerDisplayNamesEnabled then
        local l_v57_Player_0 = v57:GetPlayer();
        if l_v57_Player_0 then
            return l_v57_Player_0.DisplayName;
        else
            return v57.Name;
        end;
    else
        return v57.Name;
    end;
end;
v8.SetExtraData = function(v59, v60, v61) --[[ Line: 219 ]] --[[ Name: SetExtraData ]]
    v59.ExtraData[v60] = v61;
    v59:LazyFire("eExtraDataUpdated", v60, v61);
end;
v8.GetExtraData = function(v62, v63) --[[ Line: 224 ]] --[[ Name: GetExtraData ]]
    return v62.ExtraData[v63];
end;
v8.SetMainChannel = function(v64, v65) --[[ Line: 228 ]] --[[ Name: SetMainChannel ]]
    local l_status_3, l_result_3 = pcall(function() --[[ Line: 229 ]]
        -- upvalues: v64 (copy), v65 (copy)
        v64:LazyFire("eMainChannelSet", v65);
        if v64.PlayerObj then
            v64.EventFolder.OnMainChannelSet:FireClient(v64.PlayerObj, v65);
        end;
    end);
    if not l_status_3 and l_result_3 then
        print("Error setting main channel: " .. l_result_3);
    end;
end;
v8.AddMutedSpeaker = function(v68, v69) --[[ Line: 241 ]] --[[ Name: AddMutedSpeaker ]]
    v68.MutedSpeakers[v69:lower()] = true;
end;
v8.RemoveMutedSpeaker = function(v70, v71) --[[ Line: 245 ]] --[[ Name: RemoveMutedSpeaker ]]
    v70.MutedSpeakers[v71:lower()] = false;
end;
v8.IsSpeakerMuted = function(v72, v73) --[[ Line: 249 ]] --[[ Name: IsSpeakerMuted ]]
    return v72.MutedSpeakers[v73:lower()];
end;
v8.InternalDestroy = function(v74) --[[ Line: 255 ]] --[[ Name: InternalDestroy ]]
    for _, v76 in pairs(v74.Channels) do
        v76:InternalRemoveSpeaker(v74);
    end;
    v74.eDestroyed:Fire();
    v74.EventFolder = nil;
    v74.eDestroyed:Destroy();
    v74.eSaidMessage:Destroy();
    v74.eReceivedMessage:Destroy();
    v74.eReceivedUnfilteredMessage:Destroy();
    v74.eMessageDoneFiltering:Destroy();
    v74.eReceivedSystemMessage:Destroy();
    v74.eChannelJoined:Destroy();
    v74.eChannelLeft:Destroy();
    v74.eMuted:Destroy();
    v74.eUnmuted:Destroy();
    v74.eExtraDataUpdated:Destroy();
    v74.eMainChannelSet:Destroy();
    v74.eChannelNameColorUpdated:Destroy();
end;
v8.InternalAssignPlayerObject = function(v77, v78) --[[ Line: 278 ]] --[[ Name: InternalAssignPlayerObject ]]
    v77.PlayerObj = v78;
end;
v8.InternalAssignEventFolder = function(v79, v80) --[[ Line: 282 ]] --[[ Name: InternalAssignEventFolder ]]
    v79.EventFolder = v80;
end;
v8.InternalSendMessage = function(v81, v82, v83) --[[ Line: 286 ]] --[[ Name: InternalSendMessage ]]
    local l_status_4, l_result_4 = pcall(function() --[[ Line: 287 ]]
        -- upvalues: v81 (copy), v82 (copy), v83 (copy)
        v81:LazyFire("eReceivedUnfilteredMessage", v82, v83);
        if v81.PlayerObj then
            v81.EventFolder.OnNewMessage:FireClient(v81.PlayerObj, v82, v83);
        end;
    end);
    if not l_status_4 and l_result_4 then
        print("Error sending internal message: " .. l_result_4);
    end;
end;
v8.InternalSendFilteredMessage = function(v86, v87, v88) --[[ Line: 298 ]] --[[ Name: InternalSendFilteredMessage ]]
    local l_status_5, l_result_5 = pcall(function() --[[ Line: 299 ]]
        -- upvalues: v86 (copy), v87 (copy), v88 (copy)
        v86:LazyFire("eReceivedMessage", v87, v88);
        v86:LazyFire("eMessageDoneFiltering", v87, v88);
        if v86.PlayerObj then
            v86.EventFolder.OnMessageDoneFiltering:FireClient(v86.PlayerObj, v87, v88);
        end;
    end);
    if not l_status_5 and l_result_5 then
        print("Error sending internal filtered message: " .. l_result_5);
    end;
end;
v8.InternalSendFilteredMessageWithTranslatedFilterResult = function(v91, v92, v93, v94) --[[ Line: 314 ]] --[[ Name: InternalSendFilteredMessageWithTranslatedFilterResult ]]
    -- upvalues: v5 (ref)
    local v95 = {};
    for v96, v97 in pairs(v92) do
        v95[v96] = v97;
    end;
    local l_v95_0 = v95;
    v95 = l_v95_0.FilterResult;
    local l_v91_Player_0 = v91:GetPlayer();
    local v100 = if l_v91_Player_0 ~= nil then v94:GetTranslationForLocale(l_v91_Player_0.LocaleId) else nil;
    local v101 = "";
    local v102 = nil;
    pcall(function() --[[ Line: 324 ]]
        -- upvalues: l_v95_0 (copy), l_v91_Player_0 (copy), v101 (ref), v95 (copy), v100 (copy), v102 (ref)
        if l_v95_0.IsFilterResult then
            if l_v91_Player_0 then
                v101 = v95:GetChatForUserAsync(l_v91_Player_0.UserId);
                if v100 then
                    v102 = v100:GetChatForUserAsync(l_v91_Player_0.UserId);
                    return;
                end;
            else
                v101 = v95:GetNonChatStringForBroadcastAsync();
                if v100 then
                    v102 = v100:GetNonChatStringForBroadcastAsync();
                    return;
                end;
            end;
        else
            v101 = v95;
        end;
    end);
    if v5 then
        l_v95_0.Message = v101;
        if v102 then
            l_v95_0.TranslatedMessage = v102;
        end;
        l_v95_0.FilterResult = nil;
        v91:InternalSendFilteredMessage(l_v95_0, v93);
    elseif #v101 > 0 then
        l_v95_0.Message = v101;
        if v102 then
            l_v95_0.TranslatedMessage = v102;
        end;
        l_v95_0.FilterResult = nil;
        v91:InternalSendFilteredMessage(l_v95_0, v93);
    end;
end;
v8.InternalSendFilteredMessageWithFilterResult = function(v103, v104, v105) --[[ Line: 360 ]] --[[ Name: InternalSendFilteredMessageWithFilterResult ]]
    -- upvalues: v5 (ref)
    local v106 = {};
    for v107, v108 in pairs(v104) do
        v106[v107] = v108;
    end;
    local l_v106_0 = v106;
    v106 = l_v106_0.FilterResult;
    local l_v103_Player_0 = v103:GetPlayer();
    local v111 = "";
    pcall(function() --[[ Line: 367 ]]
        -- upvalues: l_v106_0 (copy), l_v103_Player_0 (copy), v111 (ref), v106 (copy)
        if l_v106_0.IsFilterResult then
            if l_v103_Player_0 then
                v111 = v106:GetChatForUserAsync(l_v103_Player_0.UserId);
                return;
            else
                v111 = v106:GetNonChatStringForBroadcastAsync();
                return;
            end;
        else
            v111 = v106;
            return;
        end;
    end);
    if v5 then
        l_v106_0.Message = v111;
        l_v106_0.FilterResult = nil;
        v103:InternalSendFilteredMessage(l_v106_0, v105);
    elseif #v111 > 0 then
        l_v106_0.Message = v111;
        l_v106_0.FilterResult = nil;
        v103:InternalSendFilteredMessage(l_v106_0, v105);
    end;
end;
v8.InternalSendSystemMessage = function(v112, v113, v114) --[[ Line: 396 ]] --[[ Name: InternalSendSystemMessage ]]
    local l_status_6, l_result_6 = pcall(function() --[[ Line: 397 ]]
        -- upvalues: v112 (copy), v113 (copy), v114 (copy)
        v112:LazyFire("eReceivedSystemMessage", v113, v114);
        if v112.PlayerObj then
            v112.EventFolder.OnNewSystemMessage:FireClient(v112.PlayerObj, v113, v114);
        end;
    end);
    if not l_status_6 and l_result_6 then
        print("Error sending internal system message: " .. l_result_6);
    end;
end;
v8.UpdateChannelNameColor = function(v117, v118, v119) --[[ Line: 408 ]] --[[ Name: UpdateChannelNameColor ]]
    v117:LazyFire("eChannelNameColorUpdated", v118, v119);
    if v117.PlayerObj then
        v117.EventFolder.ChannelNameColorUpdated:FireClient(v117.PlayerObj, v118, v119);
    end;
end;
v0.new = function(v120, v121) --[[ Line: 418 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy)
    local v122 = setmetatable({}, v8);
    v122.ChatService = v120;
    v122.PlayerObj = nil;
    v122.Name = v121;
    v122.ExtraData = {};
    v122.Channels = {};
    v122.MutedSpeakers = {};
    v122.EventFolder = nil;
    return v122;
end;
return v0;