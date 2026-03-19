local v0 = {
    0.05, 
    0.1, 
    0.2
};
local v1 = {};
local l_RunService_0 = game:GetService("RunService");
local l_Chat_0 = game:GetService("Chat");
local _ = l_Chat_0:WaitForChild("ClientChatModules");
local l_Parent_0 = script.Parent;
local l_ClientChatModules_1 = l_Chat_0:WaitForChild("ClientChatModules");
local v7 = {
    ChatColor = require(l_ClientChatModules_1:WaitForChild("ChatSettings")).ErrorMessageTextColor or Color3.fromRGB(245, 50, 50)
};
local l_ChatConstants_0 = require(l_ClientChatModules_1:WaitForChild("ChatConstants"));
local l_ChatChannel_0 = require(l_Parent_0:WaitForChild("ChatChannel"));
local l_Speaker_0 = require(l_Parent_0:WaitForChild("Speaker"));
local l_Util_0 = require(l_Parent_0:WaitForChild("Util"));
local v12 = nil;
pcall(function() --[[ Line: 38 ]]
    -- upvalues: v12 (ref)
    v12 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
v12 = v12 or {};
if not v12.FormatMessageToSend or not v12.LocalizeFormattedMessage then
    v12.FormatMessageToSend = function(_, _, v15) --[[ Line: 42 ]] --[[ Name: FormatMessageToSend ]]
        return v15;
    end;
end;
local function _(v16) --[[ Line: 45 ]] --[[ Name: allSpaces ]]
    return string.len((string.gsub(v16, " ", ""))) == 0;
end;
local v18 = {};
v18.__index = v18;
v18.AddChannel = function(v19, v20, v21) --[[ Line: 55 ]] --[[ Name: AddChannel ]]
    -- upvalues: v12 (ref), l_ChatChannel_0 (copy), l_ChatConstants_0 (copy)
    if v19.ChatChannels[v20:lower()] then
        error(string.format("Channel %q alrady exists.", v20));
    end;
    local function v26(v22, v23) --[[ Line: 60 ]] --[[ Name: DefaultChannelCommands ]]
        -- upvalues: v19 (copy), v20 (copy), v12 (ref)
        if v23:lower() == "/leave" then
            local l_v19_Channel_0 = v19:GetChannel(v20);
            local l_v19_Speaker_0 = v19:GetSpeaker(v22);
            if l_v19_Channel_0 and l_v19_Speaker_0 then
                if l_v19_Channel_0.Leavable then
                    l_v19_Speaker_0:LeaveChannel(v20);
                    l_v19_Speaker_0:SendSystemMessage(v12:FormatMessageToSend("GameChat_ChatService_YouHaveLeftChannel", string.format("You have left channel '%s'", v20), "RBX_NAME", v20), "System");
                else
                    l_v19_Speaker_0:SendSystemMessage(v12:FormatMessageToSend("GameChat_ChatService_CannotLeaveChannel", "You cannot leave this channel."), v20);
                end;
            end;
            return true;
        else
            return false;
        end;
    end;
    local v27 = l_ChatChannel_0.new(v19, v20);
    v19.ChatChannels[v20:lower()] = v27;
    v27:RegisterProcessCommandsFunction("default_commands", v26, l_ChatConstants_0.HighPriority);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 89 ]]
        -- upvalues: v19 (copy), v20 (copy)
        v19.eChannelAdded:Fire(v20);
    end);
    if not l_status_0 and l_result_0 then
        print("Error addding channel: " .. l_result_0);
    end;
    if v21 ~= nil then
        v27.AutoJoin = v21;
        if v21 then
            for _, v31 in pairs(v19.Speakers) do
                v31:JoinChannel(v20);
            end;
        end;
    end;
    return v27;
end;
v18.RemoveChannel = function(v32, v33) --[[ Line: 106 ]] --[[ Name: RemoveChannel ]]
    if v32.ChatChannels[v33:lower()] then
        local l_Name_0 = v32.ChatChannels[v33:lower()].Name;
        v32.ChatChannels[v33:lower()]:InternalDestroy();
        v32.ChatChannels[v33:lower()] = nil;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 113 ]]
            -- upvalues: v32 (copy), l_Name_0 (copy)
            v32.eChannelRemoved:Fire(l_Name_0);
        end);
        if not l_status_1 and l_result_1 then
            print("Error removing channel: " .. l_result_1);
            return;
        end;
    else
        warn(string.format("Channel %q does not exist.", v33));
    end;
end;
v18.GetChannel = function(v37, v38) --[[ Line: 122 ]] --[[ Name: GetChannel ]]
    return v37.ChatChannels[v38:lower()];
end;
v18.AddSpeaker = function(v39, v40) --[[ Line: 127 ]] --[[ Name: AddSpeaker ]]
    -- upvalues: l_Speaker_0 (copy)
    if v39.Speakers[v40:lower()] then
        error("Speaker \"" .. v40 .. "\" already exists!");
    end;
    local v41 = l_Speaker_0.new(v39, v40);
    v39.Speakers[v40:lower()] = v41;
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 135 ]]
        -- upvalues: v39 (copy), v40 (copy)
        v39.eSpeakerAdded:Fire(v40);
    end);
    if not l_status_2 and l_result_2 then
        print("Error adding speaker: " .. l_result_2);
    end;
    return v41;
end;
v18.InternalUnmuteSpeaker = function(v44, v45) --[[ Line: 143 ]] --[[ Name: InternalUnmuteSpeaker ]]
    for _, v47 in pairs(v44.ChatChannels) do
        if v47:IsSpeakerMuted(v45) then
            v47:UnmuteSpeaker(v45);
        end;
    end;
end;
v18.RemoveSpeaker = function(v48, v49) --[[ Line: 151 ]] --[[ Name: RemoveSpeaker ]]
    if v48.Speakers[v49:lower()] then
        local l_Name_1 = v48.Speakers[v49:lower()].Name;
        v48:InternalUnmuteSpeaker(l_Name_1);
        v48.Speakers[v49:lower()]:InternalDestroy();
        v48.Speakers[v49:lower()] = nil;
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 160 ]]
            -- upvalues: v48 (copy), l_Name_1 (copy)
            v48.eSpeakerRemoved:Fire(l_Name_1);
        end);
        if not l_status_3 and l_result_3 then
            print("Error removing speaker: " .. l_result_3);
            return;
        end;
    else
        warn("Speaker \"" .. v49 .. "\" does not exist!");
    end;
end;
v18.GetSpeaker = function(v53, v54) --[[ Line: 170 ]] --[[ Name: GetSpeaker ]]
    return v53.Speakers[v54:lower()];
end;
v18.GetSpeakerByUserOrDisplayName = function(v55, v56) --[[ Line: 174 ]] --[[ Name: GetSpeakerByUserOrDisplayName ]]
    local v57 = v55.Speakers[v56:lower()];
    if v57 then
        return v57;
    else
        for _, v59 in pairs(v55.Speakers) do
            local l_v59_Player_0 = v59:GetPlayer();
            if l_v59_Player_0 and l_v59_Player_0.DisplayName:lower() == v56:lower() then
                return v59;
            end;
        end;
        return;
    end;
end;
v18.GetChannelList = function(v61) --[[ Line: 190 ]] --[[ Name: GetChannelList ]]
    local v62 = {};
    for _, v64 in pairs(v61.ChatChannels) do
        if not v64.Private then
            table.insert(v62, v64.Name);
        end;
    end;
    return v62;
end;
v18.GetAutoJoinChannelList = function(v65) --[[ Line: 200 ]] --[[ Name: GetAutoJoinChannelList ]]
    local v66 = {};
    for _, v68 in pairs(v65.ChatChannels) do
        if v68.AutoJoin then
            table.insert(v66, v68);
        end;
    end;
    return v66;
end;
v18.GetSpeakerList = function(v69) --[[ Line: 210 ]] --[[ Name: GetSpeakerList ]]
    local v70 = {};
    for _, v72 in pairs(v69.Speakers) do
        table.insert(v70, v72.Name);
    end;
    return v70;
end;
v18.SendGlobalSystemMessage = function(v73, v74) --[[ Line: 218 ]] --[[ Name: SendGlobalSystemMessage ]]
    for _, v76 in pairs(v73.Speakers) do
        v76:SendSystemMessage(v74, nil);
    end;
end;
v18.RegisterFilterMessageFunction = function(v77, v78, v79, v80) --[[ Line: 224 ]] --[[ Name: RegisterFilterMessageFunction ]]
    if v77.FilterMessageFunctions:HasFunction(v78) then
        error(string.format("FilterMessageFunction '%s' already exists", v78));
    end;
    v77.FilterMessageFunctions:AddFunction(v78, v79, v80);
end;
v18.FilterMessageFunctionExists = function(v81, v82) --[[ Line: 231 ]] --[[ Name: FilterMessageFunctionExists ]]
    return v81.FilterMessageFunctions:HasFunction(v82);
end;
v18.UnregisterFilterMessageFunction = function(v83, v84) --[[ Line: 235 ]] --[[ Name: UnregisterFilterMessageFunction ]]
    if not v83.FilterMessageFunctions:HasFunction(v84) then
        error(string.format("FilterMessageFunction '%s' does not exists", v84));
    end;
    v83.FilterMessageFunctions:RemoveFunction(v84);
end;
v18.RegisterProcessCommandsFunction = function(v85, v86, v87, v88) --[[ Line: 242 ]] --[[ Name: RegisterProcessCommandsFunction ]]
    if v85.ProcessCommandsFunctions:HasFunction(v86) then
        error(string.format("ProcessCommandsFunction '%s' already exists", v86));
    end;
    v85.ProcessCommandsFunctions:AddFunction(v86, v87, v88);
end;
v18.ProcessCommandsFunctionExists = function(v89, v90) --[[ Line: 249 ]] --[[ Name: ProcessCommandsFunctionExists ]]
    return v89.ProcessCommandsFunctions:HasFunction(v90);
end;
v18.UnregisterProcessCommandsFunction = function(v91, v92) --[[ Line: 253 ]] --[[ Name: UnregisterProcessCommandsFunction ]]
    if not v91.ProcessCommandsFunctions:HasFunction(v92) then
        error(string.format("ProcessCommandsFunction '%s' does not exist", v92));
    end;
    v91.ProcessCommandsFunctions:RemoveFunction(v92);
end;
local v93 = 0;
local v94 = 0;
local v95 = 0;
v18.InternalNotifyFilterIssue = function(v96) --[[ Line: 263 ]] --[[ Name: InternalNotifyFilterIssue ]]
    -- upvalues: v94 (ref), v95 (ref), v93 (ref), v12 (ref), v7 (copy)
    if tick() - v94 > 60 then
        v95 = 0;
    end;
    v95 = v95 + 1;
    v94 = tick();
    if v95 >= 3 and tick() - v93 > 60 then
        v93 = tick();
        local l_v96_Channel_0 = v96:GetChannel("System");
        if l_v96_Channel_0 then
            l_v96_Channel_0:SendSystemMessage(v12:FormatMessageToSend("GameChat_ChatService_ChatFilterIssues", "The chat filter is currently experiencing issues and messages may be slow to appear."), v7);
        end;
    end;
end;
local v98 = {};
v18.InternalApplyRobloxFilter = function(v99, v100, v101, v102) --[[ Line: 292 ]] --[[ Name: InternalApplyRobloxFilter ]]
    -- upvalues: l_RunService_0 (copy), l_Chat_0 (copy), v0 (copy), v98 (copy)
    if l_RunService_0:IsServer() and not l_RunService_0:IsStudio() then
        local l_v99_Speaker_0 = v99:GetSpeaker(v100);
        local v104 = v102 and v99:GetSpeaker(v102);
        if l_v99_Speaker_0 == nil then
            return nil;
        else
            local l_l_v99_Speaker_0_Player_0 = l_v99_Speaker_0:GetPlayer();
            local v106 = v104 and v104:GetPlayer();
            if l_l_v99_Speaker_0_Player_0 == nil then
                return v101;
            elseif string.len((string.gsub(v101, " ", ""))) == 0 then
                return v101;
            else
                local v107 = tick();
                local v108 = 0;
                while true do
                    local l_status_4, l_result_4 = pcall(function() --[[ Line: 315 ]]
                        -- upvalues: v106 (copy), l_Chat_0 (ref), v101 (copy), l_l_v99_Speaker_0_Player_0 (copy)
                        if v106 then
                            return l_Chat_0:FilterStringAsync(v101, l_l_v99_Speaker_0_Player_0, v106);
                        else
                            return l_Chat_0:FilterStringForBroadcast(v101, l_l_v99_Speaker_0_Player_0);
                        end;
                    end);
                    if l_status_4 then
                        return l_result_4;
                    else
                        warn("Error filtering message:", l_result_4);
                        v108 = v108 + 1;
                        if v108 > 3 or tick() - v107 > 60 then
                            v99:InternalNotifyFilterIssue();
                            return nil;
                        else
                            local v111 = v0[math.min(#v0, v108)];
                            local v112 = v111 + (math.random() * 2 - 1) * v111;
                            wait(v112);
                        end;
                    end;
                end;
            end;
        end;
    else
        if not v98[v101] then
            v98[v101] = true;
            wait();
        end;
        return v101;
    end;
end;
v18.InternalApplyRobloxFilterAndTranslate = function(v113, v114, v115, v116, v117) --[[ Line: 351 ]] --[[ Name: InternalApplyRobloxFilterAndTranslate ]]
    -- upvalues: l_RunService_0 (copy)
    if l_RunService_0:IsServer() and not l_RunService_0:IsStudio() then
        local l_v113_Speaker_0 = v113:GetSpeaker(v114);
        if l_v113_Speaker_0 == nil then
            return false, nil, nil;
        else
            local l_l_v113_Speaker_0_Player_0 = l_v113_Speaker_0:GetPlayer();
            if l_l_v113_Speaker_0_Player_0 == nil then
                return true, false, v116;
            elseif string.len((string.gsub(v116, " ", ""))) == 0 then
                return true, false, v116;
            else
                local l_status_5, l_result_5 = pcall(function() --[[ Line: 369 ]]
                    -- upvalues: v116 (copy), l_l_v113_Speaker_0_Player_0 (copy), v115 (copy), v117 (copy)
                    return (game:GetService("TextService"):FilterAndTranslateStringAsync(v116, l_l_v113_Speaker_0_Player_0.UserId, v115, v117));
                end);
                if l_status_5 then
                    return true, true, l_result_5;
                else
                    warn("Error filtering and translating message", v116, l_result_5);
                    v113:InternalNotifyFilterIssue();
                    return false, nil, nil;
                end;
            end;
        end;
    else
        wait();
        return true, false, v116;
    end;
end;
v18.InternalApplyRobloxFilterNewAPI = function(v122, v123, v124, v125) --[[ Line: 388 ]] --[[ Name: InternalApplyRobloxFilterNewAPI ]]
    -- upvalues: l_RunService_0 (copy)
    if l_RunService_0:IsServer() and not l_RunService_0:IsStudio() then
        local l_v122_Speaker_0 = v122:GetSpeaker(v123);
        if l_v122_Speaker_0 == nil then
            return false, nil, nil;
        else
            local l_l_v122_Speaker_0_Player_0 = l_v122_Speaker_0:GetPlayer();
            if l_l_v122_Speaker_0_Player_0 == nil then
                return true, false, v124;
            elseif string.len((string.gsub(v124, " ", ""))) == 0 then
                return true, false, v124;
            else
                local l_status_6, l_result_6 = pcall(function() --[[ Line: 407 ]]
                    -- upvalues: v124 (copy), l_l_v122_Speaker_0_Player_0 (copy), v125 (copy)
                    return (game:GetService("TextService"):FilterStringAsync(v124, l_l_v122_Speaker_0_Player_0.UserId, v125));
                end);
                if l_status_6 then
                    return true, true, l_result_6;
                else
                    warn("Error filtering message:", v124, l_result_6);
                    v122:InternalNotifyFilterIssue();
                    return false, nil, nil;
                end;
            end;
        end;
    else
        wait();
        return true, false, v124;
    end;
end;
v18.InternalDoMessageFilter = function(v130, v131, v132, v133) --[[ Line: 426 ]] --[[ Name: InternalDoMessageFilter ]]
    for v134, v135, _ in (v130.FilterMessageFunctions:GetIterator()) do
        local l_status_7, l_result_7 = pcall(function() --[[ Line: 430 ]]
            -- upvalues: v135 (copy), v131 (copy), v132 (copy), v133 (copy)
            v135(v131, v132, v133);
        end);
        if not l_status_7 then
            warn(string.format("DoMessageFilter Function '%s' failed for reason: %s", v134, l_result_7));
        end;
    end;
end;
v18.InternalDoProcessCommands = function(v139, v140, v141, v142) --[[ Line: 440 ]] --[[ Name: InternalDoProcessCommands ]]
    for v143, v144, _ in (v139.ProcessCommandsFunctions:GetIterator()) do
        local l_status_8, l_result_8 = pcall(function() --[[ Line: 444 ]]
            -- upvalues: v144 (copy), v140 (copy), v141 (copy), v142 (copy)
            local v146 = v144(v140, v141, v142);
            if type(v146) ~= "boolean" then
                error("Process command functions must return a bool");
            end;
            return v146;
        end);
        if not l_status_8 then
            warn(string.format("DoProcessCommands Function '%s' failed for reason: %s", v143, l_result_8));
        elseif l_result_8 then
            return true;
        end;
    end;
    return false;
end;
v18.InternalGetUniqueMessageId = function(v149) --[[ Line: 462 ]] --[[ Name: InternalGetUniqueMessageId ]]
    local l_MessageIdCounter_0 = v149.MessageIdCounter;
    v149.MessageIdCounter = l_MessageIdCounter_0 + 1;
    return l_MessageIdCounter_0;
end;
v18.InternalAddSpeakerWithPlayerObject = function(v151, v152, v153, v154) --[[ Line: 468 ]] --[[ Name: InternalAddSpeakerWithPlayerObject ]]
    -- upvalues: l_Speaker_0 (copy)
    if v151.Speakers[v152:lower()] then
        error("Speaker \"" .. v152 .. "\" already exists!");
    end;
    local v155 = l_Speaker_0.new(v151, v152);
    v155:InternalAssignPlayerObject(v153);
    v151.Speakers[v152:lower()] = v155;
    if v154 then
        local l_status_9, l_result_9 = pcall(function() --[[ Line: 478 ]]
            -- upvalues: v151 (copy), v152 (copy)
            v151.eSpeakerAdded:Fire(v152);
        end);
        if not l_status_9 and l_result_9 then
            print("Error adding speaker: " .. l_result_9);
        end;
    end;
    return v155;
end;
v18.InternalFireSpeakerAdded = function(v158, v159) --[[ Line: 487 ]] --[[ Name: InternalFireSpeakerAdded ]]
    local l_status_10, l_result_10 = pcall(function() --[[ Line: 488 ]]
        -- upvalues: v158 (copy), v159 (copy)
        v158.eSpeakerAdded:Fire(v159);
    end);
    if not l_status_10 and l_result_10 then
        print("Error firing speaker added: " .. l_result_10);
    end;
end;
v1.new = function() --[[ Line: 497 ]] --[[ Name: new ]]
    -- upvalues: v18 (copy), l_Util_0 (copy)
    local v162 = setmetatable({}, v18);
    v162.MessageIdCounter = 0;
    v162.ChatChannels = {};
    v162.Speakers = {};
    v162.FilterMessageFunctions = l_Util_0:NewSortedFunctionContainer();
    v162.ProcessCommandsFunctions = l_Util_0:NewSortedFunctionContainer();
    v162.eChannelAdded = Instance.new("BindableEvent");
    v162.eChannelRemoved = Instance.new("BindableEvent");
    v162.eSpeakerAdded = Instance.new("BindableEvent");
    v162.eSpeakerRemoved = Instance.new("BindableEvent");
    v162.ChannelAdded = v162.eChannelAdded.Event;
    v162.ChannelRemoved = v162.eChannelRemoved.Event;
    v162.SpeakerAdded = v162.eSpeakerAdded.Event;
    v162.SpeakerRemoved = v162.eSpeakerRemoved.Event;
    v162.ChatServiceMajorVersion = 0;
    v162.ChatServiceMinorVersion = 5;
    return v162;
end;
return v1.new();