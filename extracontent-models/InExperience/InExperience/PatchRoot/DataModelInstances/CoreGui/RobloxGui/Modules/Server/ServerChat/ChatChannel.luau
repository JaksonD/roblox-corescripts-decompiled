local v0 = false;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 8 ]]
    return UserSettings():IsUserFeatureEnabled("UserShouldMuteUnfilteredMessage");
end);
v0 = l_status_0 and l_result_0;
l_status_0 = nil;
local v3;
l_result_0, v3 = pcall(function() --[[ Line: 13 ]]
    return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures");
end);
l_status_0 = l_result_0 and v3;
l_result_0 = false;
local v4;
v3, v4 = pcall(function() --[[ Line: 21 ]]
    return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2");
end);
l_result_0 = v3 and v4;
v3 = {};
v4 = script.Parent;
local l_Chat_0 = game:GetService("Chat");
local l_RunService_0 = game:GetService("RunService");
local l_ClientChatModules_0 = l_Chat_0:WaitForChild("ClientChatModules");
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local l_ChatConstants_0 = require(l_ClientChatModules_0:WaitForChild("ChatConstants"));
local l_Util_0 = require(v4:WaitForChild("Util"));
local v11 = nil;
pcall(function() --[[ Line: 42 ]]
    -- upvalues: v11 (ref)
    v11 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
v11 = v11 or {};
if not v11.FormatMessageToSend or not v11.LocalizeFormattedMessage then
    v11.FormatMessageToSend = function(_, _, v14) --[[ Line: 46 ]] --[[ Name: FormatMessageToSend ]]
        return v14;
    end;
end;
local v15 = {};
v15.__index = v15;
v15.SendSystemMessage = function(v16, v17, v18) --[[ Line: 55 ]] --[[ Name: SendSystemMessage ]]
    local v19 = v16:InternalCreateMessageObject(v17, nil, true, v18);
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 58 ]]
        -- upvalues: v16 (copy), v19 (copy)
        v16.eMessagePosted:Fire(v19);
    end);
    if not l_status_1 and l_result_1 then
        print("Error posting message: " .. l_result_1);
    end;
    v16:InternalAddMessageToHistoryLog(v19);
    for _, v23 in pairs(v16.Speakers) do
        v23:InternalSendSystemMessage(v19, v16.Name);
    end;
    return v19;
end;
v15.SendSystemMessageToSpeaker = function(v24, v25, v26, v27) --[[ Line: 72 ]] --[[ Name: SendSystemMessageToSpeaker ]]
    -- upvalues: l_RunService_0 (copy)
    local v28 = v24.Speakers[v26];
    if v28 then
        v28:InternalSendSystemMessage(v24:InternalCreateMessageObject(v25, nil, true, v27), v24.Name);
        return;
    else
        if l_RunService_0:IsStudio() then
            warn(string.format("Speaker '%s' is not in channel '%s' and cannot be sent a system message", v26, v24.Name));
        end;
        return;
    end;
end;
v15.SendMessageObjToFilters = function(v29, v30, v31, v32) --[[ Line: 82 ]] --[[ Name: SendMessageObjToFilters ]]
    local l_Message_0 = v31.Message;
    v31.Message = v30;
    v29:InternalDoMessageFilter(v32.Name, v31, v29.Name);
    v29.ChatService:InternalDoMessageFilter(v32.Name, v31, v29.Name);
    local l_Message_1 = v31.Message;
    v31.Message = l_Message_0;
    return l_Message_1;
end;
v15.CanCommunicateByUserId = function(_, v36, v37) --[[ Line: 92 ]] --[[ Name: CanCommunicateByUserId ]]
    -- upvalues: l_RunService_0 (copy), l_Chat_0 (copy)
    if l_RunService_0:IsStudio() then
        return true;
    elseif v36 == 0 or v37 == 0 then
        return true;
    else
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 100 ]]
            -- upvalues: l_Chat_0 (ref), v36 (copy), v37 (copy)
            return l_Chat_0:CanUsersChatAsync(v36, v37);
        end);
        return l_status_2 and l_result_2;
    end;
end;
v15.CanCommunicate = function(v40, v41, v42) --[[ Line: 106 ]] --[[ Name: CanCommunicate ]]
    local l_v41_Player_0 = v41:GetPlayer();
    local l_v42_Player_0 = v42:GetPlayer();
    if l_v41_Player_0 and l_v42_Player_0 then
        return v40:CanCommunicateByUserId(l_v41_Player_0.UserId, l_v42_Player_0.UserId);
    else
        return true;
    end;
end;
v15.SendMessageToSpeaker = function(v45, v46, v47, v48, v49) --[[ Line: 115 ]] --[[ Name: SendMessageToSpeaker ]]
    -- upvalues: l_RunService_0 (copy)
    local v50 = v45.Speakers[v47];
    local l_Speaker_0 = v45.ChatService:GetSpeaker(v48);
    if v50 and l_Speaker_0 then
        if v50:IsSpeakerMuted(v48) then
            return;
        elseif not v45:CanCommunicate(v50, l_Speaker_0) then
            return;
        else
            local v52 = v45:InternalCreateMessageObject(v46, v48, v47 == v48, v49);
            v46 = v45:SendMessageObjToFilters(v46, v52, v48);
            v50:InternalSendMessage(v52, v45.Name);
            local v53 = v45.Private and Enum.TextFilterContext.PrivateChat or Enum.TextFilterContext.PublicChat;
            local v54, v55, v56 = v45.ChatService:InternalApplyRobloxFilterNewAPI(v52.FromSpeaker, v46, v53);
            if v54 then
                v52.FilterResult = v56;
                v52.IsFilterResult = v55;
                v52.IsFiltered = true;
                v50:InternalSendFilteredMessageWithFilterResult(v52, v45.Name);
                return;
            end;
        end;
    elseif l_RunService_0:IsStudio() then
        warn(string.format("Speaker '%s' is not in channel '%s' and cannot be sent a message", v47, v45.Name));
    end;
end;
v15.KickSpeaker = function(v57, v58, v59) --[[ Line: 151 ]] --[[ Name: KickSpeaker ]]
    local l_Speaker_1 = v57.ChatService:GetSpeaker(v58);
    if not l_Speaker_1 then
        error("Speaker \"" .. v58 .. "\" does not exist!");
    end;
    local v61 = "";
    local v62 = "";
    local l_l_Speaker_1_NameForDisplay_0 = l_Speaker_1:GetNameForDisplay();
    if v59 then
        v61 = string.format("You were kicked from '%s' for the following reason(s): %s", v57.Name, v59);
        v62 = string.format("%s was kicked for the following reason(s): %s", l_l_Speaker_1_NameForDisplay_0, v59);
    else
        v61 = string.format("You were kicked from '%s'", v57.Name);
        v62 = string.format("%s was kicked", l_l_Speaker_1_NameForDisplay_0);
    end;
    v57:SendSystemMessageToSpeaker(v61, v58);
    l_Speaker_1:LeaveChannel(v57.Name);
    v57:SendSystemMessage(v62);
end;
v15.MuteSpeaker = function(v64, v65, v66, v67) --[[ Line: 174 ]] --[[ Name: MuteSpeaker ]]
    local l_Speaker_2 = v64.ChatService:GetSpeaker(v65);
    if not l_Speaker_2 then
        error("Speaker \"" .. v65 .. "\" does not exist!");
    end;
    v64.Mutes[v65:lower()] = (not (v67 ~= 0) or v67 == nil) and 0 or os.time() + v67;
    if v66 then
        local l_l_Speaker_2_NameForDisplay_0 = l_Speaker_2:GetNameForDisplay();
        v64:SendSystemMessage(string.format("%s was muted for the following reason(s): %s", l_l_Speaker_2_NameForDisplay_0, v66));
    end;
    local l_status_3, l_result_3 = pcall(function() --[[ Line: 188 ]]
        -- upvalues: v64 (copy), v65 (copy), v66 (copy), v67 (copy)
        v64.eSpeakerMuted:Fire(v65, v66, v67);
    end);
    if not l_status_3 and l_result_3 then
        print("Error mutting speaker: " .. l_result_3);
    end;
    local l_Speaker_3 = v64.ChatService:GetSpeaker(v65);
    if l_Speaker_3 then
        local l_status_4, l_result_4 = pcall(function() --[[ Line: 195 ]]
            -- upvalues: l_Speaker_3 (copy), v64 (copy), v66 (copy), v67 (copy)
            l_Speaker_3.eMuted:Fire(v64.Name, v66, v67);
        end);
        if not l_status_4 and l_result_4 then
            print("Error mutting speaker: " .. l_result_4);
        end;
    end;
end;
v15.UnmuteSpeaker = function(v75, v76) --[[ Line: 203 ]] --[[ Name: UnmuteSpeaker ]]
    if not v75.ChatService:GetSpeaker(v76) then
        error("Speaker \"" .. v76 .. "\" does not exist!");
    end;
    v75.Mutes[v76:lower()] = nil;
    local l_status_5, l_result_5 = pcall(function() --[[ Line: 211 ]]
        -- upvalues: v75 (copy), v76 (copy)
        v75.eSpeakerUnmuted:Fire(v76);
    end);
    if not l_status_5 and l_result_5 then
        print("Error unmuting speaker: " .. l_result_5);
    end;
    local l_Speaker_4 = v75.ChatService:GetSpeaker(v76);
    if l_Speaker_4 then
        local l_status_6, l_result_6 = pcall(function() --[[ Line: 218 ]]
            -- upvalues: l_Speaker_4 (copy), v75 (copy)
            l_Speaker_4.eUnmuted:Fire(v75.Name);
        end);
        if not l_status_6 and l_result_6 then
            print("Error unmuting speaker: " .. l_result_6);
        end;
    end;
end;
v15.IsSpeakerMuted = function(v82, v83) --[[ Line: 225 ]] --[[ Name: IsSpeakerMuted ]]
    return v82.Mutes[v83:lower()] ~= nil;
end;
v15.GetSpeakerList = function(v84) --[[ Line: 229 ]] --[[ Name: GetSpeakerList ]]
    local v85 = {};
    for _, v87 in pairs(v84.Speakers) do
        table.insert(v85, v87.Name);
    end;
    return v85;
end;
v15.RegisterFilterMessageFunction = function(v88, v89, v90, v91) --[[ Line: 237 ]] --[[ Name: RegisterFilterMessageFunction ]]
    if v88.FilterMessageFunctions:HasFunction(v89) then
        error(string.format("FilterMessageFunction '%s' already exists", v89));
    end;
    v88.FilterMessageFunctions:AddFunction(v89, v90, v91);
end;
v15.FilterMessageFunctionExists = function(v92, v93) --[[ Line: 244 ]] --[[ Name: FilterMessageFunctionExists ]]
    return v92.FilterMessageFunctions:HasFunction(v93);
end;
v15.UnregisterFilterMessageFunction = function(v94, v95) --[[ Line: 248 ]] --[[ Name: UnregisterFilterMessageFunction ]]
    if not v94.FilterMessageFunctions:HasFunction(v95) then
        error(string.format("FilterMessageFunction '%s' does not exists", v95));
    end;
    v94.FilterMessageFunctions:RemoveFunction(v95);
end;
v15.RegisterProcessCommandsFunction = function(v96, v97, v98, v99) --[[ Line: 255 ]] --[[ Name: RegisterProcessCommandsFunction ]]
    if v96.ProcessCommandsFunctions:HasFunction(v97) then
        error(string.format("ProcessCommandsFunction '%s' already exists", v97));
    end;
    v96.ProcessCommandsFunctions:AddFunction(v97, v98, v99);
end;
v15.ProcessCommandsFunctionExists = function(v100, v101) --[[ Line: 262 ]] --[[ Name: ProcessCommandsFunctionExists ]]
    return v100.ProcessCommandsFunctions:HasFunction(v101);
end;
v15.UnregisterProcessCommandsFunction = function(v102, v103) --[[ Line: 266 ]] --[[ Name: UnregisterProcessCommandsFunction ]]
    if not v102.ProcessCommandsFunctions:HasFunction(v103) then
        error(string.format("ProcessCommandsFunction '%s' does not exist", v103));
    end;
    v102.ProcessCommandsFunctions:RemoveFunction(v103);
end;
local function _(v104) --[[ Line: 273 ]] --[[ Name: ShallowCopy ]]
    local v105 = {};
    for v106, v107 in pairs(v104) do
        v105[v106] = v107;
    end;
    return v105;
end;
v15.GetHistoryLog = function(v109) --[[ Line: 281 ]] --[[ Name: GetHistoryLog ]]
    local l_ChatHistory_0 = v109.ChatHistory;
    local v111 = {};
    for v112, v113 in pairs(l_ChatHistory_0) do
        v111[v112] = v113;
    end;
    return v111;
end;
v15.GetHistoryLogForSpeaker = function(v114, v115) --[[ Line: 285 ]] --[[ Name: GetHistoryLogForSpeaker ]]
    -- upvalues: l_ChatConstants_0 (copy)
    local v116 = -1;
    local l_v115_Player_0 = v115:GetPlayer();
    if l_v115_Player_0 then
        v116 = l_v115_Player_0.UserId;
    end;
    local v118 = {};
    for v119 = 1, #v114.ChatHistory do
        if v114:CanCommunicateByUserId(v116, v114.ChatHistory[v119].SpeakerUserId) then
            local v120 = v114.ChatHistory[v119];
            local v121 = {};
            for v122, v123 in pairs(v120) do
                v121[v122] = v123;
            end;
            local l_v121_0 = v121;
            if l_v121_0.MessageType == l_ChatConstants_0.MessageTypeDefault or l_v121_0.MessageType == l_ChatConstants_0.MessageTypeMeCommand then
                v120 = l_v121_0.FilterResult;
                if l_v121_0.IsFilterResult then
                    if l_v115_Player_0 then
                        l_v121_0.Message = v120:GetChatForUserAsync(l_v115_Player_0.UserId);
                    else
                        l_v121_0.Message = v120:GetNonChatStringForBroadcastAsync();
                    end;
                else
                    l_v121_0.Message = v120;
                end;
            end;
            table.insert(v118, l_v121_0);
        end;
    end;
    return v118;
end;
v15.InternalDestroy = function(v125) --[[ Line: 323 ]] --[[ Name: InternalDestroy ]]
    for _, v127 in pairs(v125.Speakers) do
        v127:LeaveChannel(v125.Name);
    end;
    v125.eDestroyed:Fire();
    v125.eDestroyed:Destroy();
    v125.eMessagePosted:Destroy();
    v125.eSpeakerJoined:Destroy();
    v125.eSpeakerLeft:Destroy();
    v125.eSpeakerMuted:Destroy();
    v125.eSpeakerUnmuted:Destroy();
end;
v15.InternalDoMessageFilter = function(v128, v129, v130, v131) --[[ Line: 338 ]] --[[ Name: InternalDoMessageFilter ]]
    for v132, v133, _ in (v128.FilterMessageFunctions:GetIterator()) do
        local l_status_7, l_result_7 = pcall(function() --[[ Line: 341 ]]
            -- upvalues: v133 (copy), v129 (copy), v130 (copy), v131 (copy)
            v133(v129, v130, v131);
        end);
        if not l_status_7 then
            warn(string.format("DoMessageFilter Function '%s' failed for reason: %s", v132, l_result_7));
        end;
    end;
end;
v15.InternalDoProcessCommands = function(v137, v138, v139, v140) --[[ Line: 351 ]] --[[ Name: InternalDoProcessCommands ]]
    for v141, v142, _ in (v137.ProcessCommandsFunctions:GetIterator()) do
        local l_status_8, l_result_8 = pcall(function() --[[ Line: 354 ]]
            -- upvalues: v142 (copy), v138 (copy), v139 (copy), v140 (copy)
            local v144 = v142(v138, v139, v140);
            if type(v144) ~= "boolean" then
                error("Process command functions must return a bool");
            end;
            return v144;
        end);
        if not l_status_8 then
            warn(string.format("DoProcessCommands Function '%s' failed for reason: %s", v141, l_result_8));
        elseif l_result_8 then
            return true;
        end;
    end;
    return false;
end;
getLanguageCodeFromLocale = function(v147) --[[ Line: 372 ]] --[[ Name: getLanguageCodeFromLocale ]]
    local v148 = string.gmatch(v147, "[^-]+")();
    if v148 then
        return v148;
    else
        return "en";
    end;
end;
v15.InternalPostMessage = function(v149, v150, v151, v152) --[[ Line: 382 ]] --[[ Name: InternalPostMessage ]]
    -- upvalues: v11 (ref), l_Chat_0 (copy), v0 (ref), l_result_0 (ref), l_status_0 (ref)
    if v149:InternalDoProcessCommands(v150.Name, v151, v149.Name) then
        return false;
    else
        if v149.Mutes[v150.Name:lower()] ~= nil then
            local v153 = v149.Mutes[v150.Name:lower()];
            if v153 > 0 and v153 < os.time() then
                v149:UnmuteSpeaker(v150.Name);
            else
                v149:SendSystemMessageToSpeaker(v11:FormatMessageToSend("GameChat_ChatChannel_MutedInChannel", "You are muted and cannot talk in this channel"), v150.Name);
                return false;
            end;
        end;
        local v154 = v149:InternalCreateMessageObject(v151, v150.Name, false, v152);
        v154.Message = v151;
        local v155 = nil;
        pcall(function() --[[ Line: 400 ]]
            -- upvalues: v155 (ref), l_Chat_0 (ref), v154 (ref)
            v155 = l_Chat_0:InvokeChatCallback(Enum.ChatCallbackType.OnServerReceivingMessage, v154);
        end);
        v154.Message = nil;
        if v155 then
            if v155.ShouldDeliver == false then
                return false;
            else
                v154 = v155;
            end;
        end;
        v151 = v149:SendMessageObjToFilters(v151, v154, v150);
        local v156 = {};
        for _, v158 in pairs(v149.Speakers) do
            if not v158:IsSpeakerMuted(v150.Name) and v149:CanCommunicate(v150, v158) then
                table.insert(v156, v158.Name);
                if v158.Name == v150.Name then
                    local l_v154_0 = v154;
                    local v160 = {};
                    for v161, v162 in pairs(l_v154_0) do
                        v160[v161] = v162;
                    end;
                    local l_v160_0 = v160;
                    if v0 then
                        l_v154_0 = v154.MessageLengthUtf8 or v154.MessageLength;
                        l_v160_0.Message = string.rep("_", l_v154_0);
                    else
                        l_v160_0.Message = v151;
                    end;
                    l_v160_0.IsFiltered = true;
                    v158:InternalSendMessage(l_v160_0, v149.Name);
                else
                    v158:InternalSendMessage(v154, v149.Name);
                end;
            end;
        end;
        local l_status_9, l_result_9 = pcall(function() --[[ Line: 439 ]]
            -- upvalues: v149 (copy), v154 (ref)
            v149.eMessagePosted:Fire(v154);
        end);
        if not l_status_9 and l_result_9 then
            print("Error posting message: " .. l_result_9);
        end;
        local v166 = v149.Private and Enum.TextFilterContext.PrivateChat or Enum.TextFilterContext.PublicChat;
        local v167 = nil;
        if l_result_0 then
            local v168 = {};
            local v169 = {};
            for _, v171 in pairs(v149.Speakers) do
                local l_v171_Player_0 = v171:GetPlayer();
                if l_v171_Player_0 ~= nil and l_v171_Player_0.LocaleId ~= nil then
                    v169[getLanguageCodeFromLocale(l_v171_Player_0.LocaleId)] = true;
                end;
            end;
            for v173, _ in v169 do
                table.insert(v168, v173);
            end;
            local v175, v176, v177 = v149.ChatService:InternalApplyRobloxFilterAndTranslate(v154.FromSpeaker, v168, v151, v166);
            if v175 then
                if v176 then
                    local l_SourceText_0 = v177.SourceText;
                    v154.FilterResult = l_SourceText_0;
                else
                    v154.FilterResult = v177;
                end;
                v154.IsFilterResult = v176;
                if v176 then
                    v167 = v177;
                end;
            elseif l_status_0 then
                v154.IsFilterResult = false;
                v154.FilterResult = "";
                v154.MessageLength = 0;
            else
                return false;
            end;
        else
            local v179, v180, v181 = v149.ChatService:InternalApplyRobloxFilterNewAPI(v154.FromSpeaker, v151, v166);
            if v179 then
                v154.FilterResult = v181;
                v154.IsFilterResult = v180;
            elseif l_status_0 then
                v154.IsFilterResult = false;
                v154.FilterResult = "";
                v154.MessageLength = 0;
            else
                return false;
            end;
        end;
        v154.IsFiltered = true;
        v149:InternalAddMessageToHistoryLog(v154);
        for _, v183 in pairs(v156) do
            local v184 = v149.Speakers[v183];
            if v184 then
                if l_result_0 and v167 and v150:GetPlayer() ~= nil and v184:GetPlayer() ~= nil and v150:GetPlayer().LocaleId ~= v184:GetPlayer().LocaleId then
                    v184:InternalSendFilteredMessageWithTranslatedFilterResult(v154, v149.Name, v167);
                else
                    v184:InternalSendFilteredMessageWithFilterResult(v154, v149.Name);
                end;
            end;
        end;
        local v185 = {};
        for _, v187 in pairs(v149.Speakers) do
            if not v187:IsSpeakerMuted(v150.Name) and v149:CanCommunicate(v150, v187) then
                local v188 = false;
                for _, v190 in pairs(v156) do
                    if v187.Name == v190 then
                        v188 = true;
                        break;
                    end;
                end;
                if not v188 then
                    table.insert(v185, v187.Name);
                end;
            end;
        end;
        for _, v192 in pairs(v185) do
            local v193 = v149.Speakers[v192];
            if v193 then
                v193:InternalSendFilteredMessageWithFilterResult(v154, v149.Name);
            end;
        end;
        return v154;
    end;
end;
v15.InternalAddSpeaker = function(v194, v195) --[[ Line: 551 ]] --[[ Name: InternalAddSpeaker ]]
    if v194.Speakers[v195.Name] then
        warn("Speaker \"" .. v195.name .. "\" is already in the channel!");
        return;
    else
        v194.Speakers[v195.Name] = v195;
        local l_status_10, l_result_10 = pcall(function() --[[ Line: 558 ]]
            -- upvalues: v194 (copy), v195 (copy)
            v194.eSpeakerJoined:Fire(v195.Name);
        end);
        if not l_status_10 and l_result_10 then
            print("Error removing channel: " .. l_result_10);
        end;
        return;
    end;
end;
v15.InternalRemoveSpeaker = function(v198, v199) --[[ Line: 564 ]] --[[ Name: InternalRemoveSpeaker ]]
    if not v198.Speakers[v199.Name] then
        warn("Speaker \"" .. v199.name .. "\" is not in the channel!");
        return;
    else
        v198.Speakers[v199.Name] = nil;
        local l_status_11, l_result_11 = pcall(function() --[[ Line: 571 ]]
            -- upvalues: v198 (copy), v199 (copy)
            v198.eSpeakerLeft:Fire(v199.Name);
        end);
        if not l_status_11 and l_result_11 then
            print("Error removing speaker: " .. l_result_11);
        end;
        return;
    end;
end;
v15.InternalRemoveExcessMessagesFromLog = function(v202) --[[ Line: 577 ]] --[[ Name: InternalRemoveExcessMessagesFromLog ]]
    local l_remove_0 = table.remove;
    while #v202.ChatHistory > v202.MaxHistory do
        l_remove_0(v202.ChatHistory, 1);
    end;
end;
v15.InternalAddMessageToHistoryLog = function(v204, v205) --[[ Line: 584 ]] --[[ Name: InternalAddMessageToHistoryLog ]]
    table.insert(v204.ChatHistory, v205);
    v204:InternalRemoveExcessMessagesFromLog();
end;
v15.GetMessageType = function(_, _, v208) --[[ Line: 590 ]] --[[ Name: GetMessageType ]]
    -- upvalues: l_ChatConstants_0 (copy)
    if v208 == nil then
        return l_ChatConstants_0.MessageTypeSystem;
    else
        return l_ChatConstants_0.MessageTypeDefault;
    end;
end;
v15.InternalCreateMessageObject = function(v209, v210, v211, v212, v213) --[[ Line: 597 ]] --[[ Name: InternalCreateMessageObject ]]
    -- upvalues: l_ChatSettings_0 (copy)
    local l_v209_MessageType_0 = v209:GetMessageType(v210, v211);
    local v215 = -1;
    local v216 = nil;
    local v217 = nil;
    if v211 then
        v217 = v209.ChatService:GetSpeaker(v211);
        if v217 then
            local l_v217_Player_0 = v217:GetPlayer();
            if l_v217_Player_0 then
                v215 = l_v217_Player_0.UserId;
                if l_ChatSettings_0.PlayerDisplayNamesEnabled then
                    v216 = v217:GetNameForDisplay();
                end;
            else
                v215 = 0;
            end;
        end;
    end;
    local v219 = {
        ID = v209.ChatService:InternalGetUniqueMessageId(), 
        FromSpeaker = v211, 
        SpeakerDisplayName = v216, 
        SpeakerUserId = v215, 
        OriginalChannel = v209.Name, 
        MessageLength = string.len(v210), 
        MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(v210)), 
        MessageType = l_v209_MessageType_0, 
        IsFiltered = v212, 
        Message = v212 and v210 or nil, 
        Time = os.time(), 
        ExtraData = {}
    };
    if v217 then
        for v220, v221 in pairs(v217.ExtraData) do
            v219.ExtraData[v220] = v221;
        end;
    end;
    if v213 then
        for v222, v223 in pairs(v213) do
            v219.ExtraData[v222] = v223;
        end;
    end;
    return v219;
end;
v15.SetChannelNameColor = function(v224, v225) --[[ Line: 657 ]] --[[ Name: SetChannelNameColor ]]
    v224.ChannelNameColor = v225;
    for _, v227 in pairs(v224.Speakers) do
        v227:UpdateChannelNameColor(v224.Name, v225);
    end;
end;
v15.GetWelcomeMessageForSpeaker = function(v228, v229) --[[ Line: 664 ]] --[[ Name: GetWelcomeMessageForSpeaker ]]
    if v228.GetWelcomeMessageFunction then
        local v230 = v228.GetWelcomeMessageFunction(v229);
        if v230 then
            return v230;
        end;
    end;
    return v228.WelcomeMessage;
end;
v15.RegisterGetWelcomeMessageFunction = function(v231, v232) --[[ Line: 674 ]] --[[ Name: RegisterGetWelcomeMessageFunction ]]
    if type(v232) ~= "function" then
        error("RegisterGetWelcomeMessageFunction must be called with a function.");
    end;
    v231.GetWelcomeMessageFunction = v232;
end;
v15.UnRegisterGetWelcomeMessageFunction = function(v233) --[[ Line: 681 ]] --[[ Name: UnRegisterGetWelcomeMessageFunction ]]
    v233.GetWelcomeMessageFunction = nil;
end;
v3.new = function(v234, v235, v236, v237) --[[ Line: 688 ]] --[[ Name: new ]]
    -- upvalues: v15 (copy), l_Util_0 (copy)
    local v238 = setmetatable({}, v15);
    v238.ChatService = v234;
    v238.Name = v235;
    v238.WelcomeMessage = v236 or "";
    v238.GetWelcomeMessageFunction = nil;
    v238.ChannelNameColor = v237;
    v238.Joinable = true;
    v238.Leavable = true;
    v238.AutoJoin = false;
    v238.Private = false;
    v238.Speakers = {};
    v238.Mutes = {};
    v238.MaxHistory = 200;
    v238.HistoryIndex = 0;
    v238.ChatHistory = {};
    v238.FilterMessageFunctions = l_Util_0:NewSortedFunctionContainer();
    v238.ProcessCommandsFunctions = l_Util_0:NewSortedFunctionContainer();
    v238.eDestroyed = Instance.new("BindableEvent");
    v238.eMessagePosted = Instance.new("BindableEvent");
    v238.eSpeakerJoined = Instance.new("BindableEvent");
    v238.eSpeakerLeft = Instance.new("BindableEvent");
    v238.eSpeakerMuted = Instance.new("BindableEvent");
    v238.eSpeakerUnmuted = Instance.new("BindableEvent");
    v238.MessagePosted = v238.eMessagePosted.Event;
    v238.SpeakerJoined = v238.eSpeakerJoined.Event;
    v238.SpeakerLeft = v238.eSpeakerLeft.Event;
    v238.SpeakerMuted = v238.eSpeakerMuted.Event;
    v238.SpeakerUnmuted = v238.eSpeakerUnmuted.Event;
    v238.Destroyed = v238.eDestroyed.Event;
    return v238;
end;
return v3;