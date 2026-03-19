local l_Players_0 = game:GetService("Players");
local l_Teams_0 = game:GetService("Teams");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChatServer");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_List_0 = require(l_Parent_0.llama).List;
local v6 = require(l_Parent_0.ExpChatShared);
local v7 = require(l_Parent_0.SharedFlags);
local v8 = require(l_script_FirstAncestor_0.createDispatchRemoteFunction);
local v9 = require(script.createStore);
local l_watchForErrors_0 = v6.watchForErrors;
local l_countParticipantsInTextChannel_0 = v6.countParticipantsInTextChannel;
local l_Actions_0 = v6.Actions;
local l_PlayerAdded_0 = l_Actions_0.PlayerAdded;
local l_PlayerRemoved_0 = l_Actions_0.PlayerRemoved;
local l_Commands_0 = v6.Commands;
local l_Config_0 = v6.Config;
local l_Analytics_0 = v6.Analytics;
local v18 = v6.Logger:new("ExpChat/" .. script.Name);
local l_getFFlagExpChatAlwaysRunTCS_0 = v7.getFFlagExpChatAlwaysRunTCS;
local l_FFlagExpChatAddUserAsyncNilCheck_0 = v6.Flags.FFlagExpChatAddUserAsyncNilCheck;
local function _() --[[ Line: 36 ]]
    -- upvalues: l_List_0 (copy), l_TextChatService_0 (copy)
    return #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v21) --[[ Line: 37 ]]
        return v21:IsA("TextChannel");
    end);
end;
local function _() --[[ Line: 44 ]]
    -- upvalues: l_List_0 (copy), l_TextChatService_0 (copy)
    return #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v23) --[[ Line: 45 ]]
        return v23:IsA("TextChatCommand");
    end);
end;
return function(v25) --[[ Line: 52 ]]
    -- upvalues: v18 (copy), v9 (copy), v8 (copy), l_Analytics_0 (copy), l_watchForErrors_0 (copy), l_TextChatService_0 (copy), l_FFlagExpChatAddUserAsyncNilCheck_0 (copy), l_Teams_0 (copy), l_Config_0 (copy), l_Players_0 (copy), l_Commands_0 (copy), l_List_0 (copy), l_getFFlagExpChatAlwaysRunTCS_0 (copy), l_countParticipantsInTextChannel_0 (copy), l_PlayerAdded_0 (copy), l_PlayerRemoved_0 (copy)
    v18:trace("mountServerApp started");
    local v26 = v9();
    v8();
    if v25 and v25.analytics then
        l_Analytics_0.with(v25.analytics);
    end;
    l_watchForErrors_0(game:GetService("ScriptContext"), v25.script, true);
    local v27 = {};
    if l_TextChatService_0.CreateDefaultTextChannels then
        v18:trace("Creating default TextChannels");
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "TextChannels";
        l_Folder_0.Parent = l_TextChatService_0;
        local function v32(v29) --[[ Line: 73 ]] --[[ Name: findChannel ]]
            -- upvalues: l_TextChatService_0 (ref)
            for _, v31 in pairs(l_TextChatService_0:GetDescendants()) do
                if v31:IsA("TextChannel") and v31.Name == v29 then
                    return v31;
                end;
            end;
            return nil;
        end;
        local l_v32_0 = v32 --[[ copy: 4 -> 17 ]];
        local l_l_Folder_0_0 = l_Folder_0 --[[ copy: 3 -> 18 ]];
        local function _(v35) --[[ Line: 83 ]] --[[ Name: addChannel ]]
            -- upvalues: l_v32_0 (copy), l_l_Folder_0_0 (copy)
            local v36 = l_v32_0(v35);
            if not v36 then
                v36 = Instance.new("TextChannel");
                v36.Name = v35;
                v36.Parent = l_l_Folder_0_0;
            end;
            return v36;
        end;
        local function v42(v38, v39) --[[ Line: 95 ]] --[[ Name: findTextSourceFromChannelWithUserId ]]
            for _, v41 in pairs(v38:GetChildren()) do
                if v41:IsA("TextSource") and v41.UserId == v39 then
                    return v41;
                end;
            end;
            return nil;
        end;
        local function v54(v43) --[[ Line: 105 ]] --[[ Name: createTeamChannel ]]
            -- upvalues: l_v32_0 (copy), l_l_Folder_0_0 (copy), v18 (ref), l_FFlagExpChatAddUserAsyncNilCheck_0 (ref), v42 (copy)
            local v44 = "RBXTeam" .. tostring(v43.TeamColor.Name);
            local v45 = l_v32_0(v44);
            if not v45 then
                v45 = Instance.new("TextChannel");
                v45.Name = v44;
                v45.Parent = l_l_Folder_0_0;
            end;
            v18:debug("Creating team TextChannel: {}", v45.Name);
            v43.PlayerAdded:Connect(function(v46) --[[ Line: 109 ]]
                -- upvalues: v43 (copy), l_v32_0 (ref), l_l_Folder_0_0 (ref), l_FFlagExpChatAddUserAsyncNilCheck_0 (ref)
                local v47 = "RBXTeam" .. tostring(v43.TeamColor.Name);
                local v48 = l_v32_0(v47);
                if not v48 then
                    v48 = Instance.new("TextChannel");
                    v48.Name = v47;
                    v48.Parent = l_l_Folder_0_0;
                end;
                v47 = v48:AddUserAsync(v46.UserId);
                if l_FFlagExpChatAddUserAsyncNilCheck_0 then
                    if v47 ~= nil then
                        v47.CanSend = true;
                        return;
                    end;
                else
                    v47.CanSend = true;
                end;
            end);
            v43.PlayerRemoved:Connect(function(v49) --[[ Line: 122 ]]
                -- upvalues: v43 (copy), l_v32_0 (ref), l_l_Folder_0_0 (ref), v42 (ref)
                local v50 = "RBXTeam" .. tostring(v43.TeamColor.Name);
                local v51 = l_v32_0(v50);
                if not v51 then
                    v51 = Instance.new("TextChannel");
                    v51.Name = v50;
                    v51.Parent = l_l_Folder_0_0;
                end;
                v50 = v42(v51, v49.UserId);
                if v50 then
                    v50:Destroy();
                end;
            end);
            v43:GetPropertyChangedSignal("TeamColor"):Connect(function() --[[ Line: 133 ]]
                -- upvalues: v43 (copy), l_v32_0 (ref), l_l_Folder_0_0 (ref)
                local v52 = "RBXTeam" .. tostring(v43.TeamColor.Name);
                local v53 = l_v32_0(v52);
                if not v53 then
                    v53 = Instance.new("TextChannel");
                    v53.Name = v52;
                    v53.Parent = l_l_Folder_0_0;
                end;
                v53.Name = "RBXTeam" .. tostring(v43.TeamColor.Name);
            end);
        end;
        for _, v56 in pairs(l_Teams_0:GetTeams()) do
            if v56:IsA("Team") then
                v54(v56);
            end;
        end;
        local l_v54_0 = v54 --[[ copy: 7 -> 19 ]];
        l_Teams_0.ChildAdded:Connect(function(v58) --[[ Line: 145 ]]
            -- upvalues: l_v54_0 (copy)
            if v58:IsA("Team") then
                l_v54_0(v58);
            end;
        end);
        local l_v32_1 = v32 --[[ copy: 4 -> 20 ]];
        l_Teams_0.ChildRemoved:Connect(function(v60) --[[ Line: 151 ]]
            -- upvalues: l_v32_1 (copy), v18 (ref)
            if v60:IsA("Team") then
                local v61 = l_v32_1("RBXTeam" .. tostring(v60.TeamColor.Name));
                if v61 then
                    v18:debug("Destroying team TextChannel: {}", v61.Name);
                    v61:Destroy();
                end;
            end;
        end);
        for v62, _ in pairs(l_Config_0.DefaultChannelNames) do
            v18:trace("Creating default channel: {}", v62);
            local v64 = v32(v62);
            if not v64 then
                v64 = Instance.new("TextChannel");
                v64.Name = v62;
                v64.Parent = l_Folder_0;
            end;
            table.insert(v27, v64);
        end;
        local function v69(v65) --[[ Line: 166 ]] --[[ Name: addPlayerTextSourceToDefaultChannels ]]
            -- upvalues: v27 (copy), v18 (ref), l_FFlagExpChatAddUserAsyncNilCheck_0 (ref)
            for _, v67 in ipairs(v27) do
                v18:trace("Adding user {} to TextChannel: {}", tostring(v65.UserId), v67.Name);
                local v68 = v67:AddUserAsync(v65.UserId);
                if l_FFlagExpChatAddUserAsyncNilCheck_0 then
                    if v68 ~= nil and v67.Name == "RBXGeneral" then
                        v68.CanSend = true;
                    elseif v68 ~= nil and v67.Name == "RBXSystem" then
                        v68.CanSend = false;
                    end;
                elseif v67.Name == "RBXGeneral" then
                    v68.CanSend = true;
                elseif v67.Name == "RBXSystem" then
                    v68.CanSend = false;
                end;
            end;
        end;
        for _, v71 in pairs(l_Players_0:GetPlayers()) do
            if v71:IsA("Player") then
                v69(v71);
            end;
        end;
        l_Players_0.PlayerAdded:Connect(v69);
        l_Analytics_0.FireRccAnalyticsWithEventName("DefaultChannelsCreated");
    end;
    if l_TextChatService_0.CreateDefaultCommands then
        v18:trace("Creating default TextChatCommands");
        local l_Folder_1 = Instance.new("Folder");
        l_Folder_1.Name = "TextChatCommands";
        l_Folder_1.Parent = l_TextChatService_0;
        for _, v74 in ipairs(l_Commands_0.enabledCommands) do
            local l_TextChatCommand_0 = Instance.new("TextChatCommand");
            l_TextChatCommand_0.Name = v74.name;
            l_TextChatCommand_0.PrimaryAlias = v74.alias[1];
            l_TextChatCommand_0.SecondaryAlias = v74.alias[2] or "";
            l_TextChatCommand_0.Parent = l_Folder_1;
        end;
        l_Analytics_0.FireRccAnalyticsWithEventName("DefaultCommandsCreated");
    end;
    local v77 = #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v76) --[[ Line: 37 ]]
        return v76:IsA("TextChannel");
    end);
    local v79 = #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v78) --[[ Line: 45 ]]
        return v78:IsA("TextChatCommand");
    end);
    l_Analytics_0.FireRccAnalyticsWithEventName("ExperienceChatLoaded", {
        loadedChannels = v77, 
        loadedCommands = v79
    });
    if l_getFFlagExpChatAlwaysRunTCS_0() then
        l_Analytics_0.FireRccAnalyticsDeferred("AutomigratedToTCS", {
            universeId = game.GameId
        });
    end;
    v18:debug("Start watching for new channels and commands");
    l_TextChatService_0.DescendantAdded:Connect(function(v80) --[[ Line: 231 ]]
        -- upvalues: l_Analytics_0 (ref), l_List_0 (ref), l_TextChatService_0 (ref), l_countParticipantsInTextChannel_0 (ref)
        if v80:IsA("TextChannel") then
            l_Analytics_0.FireRccAnalyticsWithEventName("ChannelCreated", {
                channelName = v80.Name, 
                totalChannels = #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v81) --[[ Line: 37 ]]
                    return v81:IsA("TextChannel");
                end)
            });
            return;
        elseif v80:IsA("TextChatCommand") then
            l_Analytics_0.FireRccAnalyticsWithEventName("CommandCreated", {
                commandName = v80.Name
            });
            return;
        else
            if v80:IsA("TextSource") then
                local l_Parent_1 = v80.Parent;
                if l_Parent_1 and l_Parent_1:IsA("TextChannel") then
                    l_Analytics_0.FireRccAnalyticsWithEventName("ChannelJoined", {
                        channelName = l_Parent_1.Name, 
                        totalParticipants = l_countParticipantsInTextChannel_0(l_Parent_1)
                    });
                end;
            end;
            return;
        end;
    end);
    l_TextChatService_0.DescendantRemoving:Connect(function(v83) --[[ Line: 252 ]]
        -- upvalues: l_Analytics_0 (ref), l_List_0 (ref), l_TextChatService_0 (ref), l_countParticipantsInTextChannel_0 (ref)
        if v83:IsA("TextChannel") then
            l_Analytics_0.FireRccAnalyticsWithEventName("ChannelRemoved", {
                channelName = v83.Name, 
                totalChannels = #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v84) --[[ Line: 37 ]]
                    return v84:IsA("TextChannel");
                end) - 1
            });
            return;
        elseif v83:IsA("TextChatCommand") then
            l_Analytics_0.FireRccAnalyticsWithEventName("CommandRemoved", {
                commandName = v83.Name
            });
            return;
        else
            if v83:IsA("TextSource") then
                local l_Parent_2 = v83.Parent;
                if l_Parent_2 and l_Parent_2:IsA("TextChannel") then
                    l_Analytics_0.FireRccAnalyticsWithEventName("ChannelLeft", {
                        channelName = l_Parent_2.Name, 
                        totalParticipants = l_countParticipantsInTextChannel_0(l_Parent_2)
                    });
                end;
            end;
            return;
        end;
    end);
    for _, v87 in pairs(l_Players_0:GetPlayers()) do
        v26:dispatch(l_PlayerAdded_0(v87.UserId, v87.Name, v87.DisplayName));
    end;
    l_Players_0.PlayerAdded:Connect(function(v88) --[[ Line: 276 ]]
        -- upvalues: v26 (copy), l_PlayerAdded_0 (ref)
        v26:dispatch(l_PlayerAdded_0(v88.UserId, v88.Name, v88.DisplayName));
    end);
    l_Players_0.PlayerRemoving:Connect(function(v89) --[[ Line: 280 ]]
        -- upvalues: v26 (copy), l_PlayerRemoved_0 (ref)
        v26:dispatch(l_PlayerRemoved_0(v89.UserId));
    end);
end;