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
local v21 = game:DefineFastFlag("ExpChatBackfillTeamChannels", false);
local function _() --[[ Line: 37 ]]
    -- upvalues: l_List_0 (copy), l_TextChatService_0 (copy)
    return #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v22) --[[ Line: 38 ]]
        return v22:IsA("TextChannel");
    end);
end;
local function _() --[[ Line: 45 ]]
    -- upvalues: l_List_0 (copy), l_TextChatService_0 (copy)
    return #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v24) --[[ Line: 46 ]]
        return v24:IsA("TextChatCommand");
    end);
end;
return function(v26) --[[ Line: 53 ]]
    -- upvalues: v18 (copy), v9 (copy), v8 (copy), l_Analytics_0 (copy), l_watchForErrors_0 (copy), l_TextChatService_0 (copy), l_FFlagExpChatAddUserAsyncNilCheck_0 (copy), v21 (copy), l_Teams_0 (copy), l_Config_0 (copy), l_Players_0 (copy), l_Commands_0 (copy), l_List_0 (copy), l_getFFlagExpChatAlwaysRunTCS_0 (copy), l_countParticipantsInTextChannel_0 (copy), l_PlayerAdded_0 (copy), l_PlayerRemoved_0 (copy)
    v18:trace("mountServerApp started");
    local v27 = v9();
    v8();
    if v26 and v26.analytics then
        l_Analytics_0.with(v26.analytics);
    end;
    l_watchForErrors_0(game:GetService("ScriptContext"), v26.script, true);
    local v28 = {};
    if l_TextChatService_0.CreateDefaultTextChannels then
        v18:trace("Creating default TextChannels");
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "TextChannels";
        l_Folder_0.Parent = l_TextChatService_0;
        local function v33(v30) --[[ Line: 74 ]] --[[ Name: findChannel ]]
            -- upvalues: l_TextChatService_0 (ref)
            for _, v32 in pairs(l_TextChatService_0:GetDescendants()) do
                if v32:IsA("TextChannel") and v32.Name == v30 then
                    return v32;
                end;
            end;
            return nil;
        end;
        local l_v33_0 = v33 --[[ copy: 4 -> 17 ]];
        local l_l_Folder_0_0 = l_Folder_0 --[[ copy: 3 -> 18 ]];
        local function _(v36) --[[ Line: 84 ]] --[[ Name: addChannel ]]
            -- upvalues: l_v33_0 (copy), l_l_Folder_0_0 (copy)
            local v37 = l_v33_0(v36);
            if not v37 then
                v37 = Instance.new("TextChannel");
                v37.Name = v36;
                v37.Parent = l_l_Folder_0_0;
            end;
            return v37;
        end;
        local function v43(v39, v40) --[[ Line: 96 ]] --[[ Name: findTextSourceFromChannelWithUserId ]]
            for _, v42 in pairs(v39:GetChildren()) do
                if v42:IsA("TextSource") and v42.UserId == v40 then
                    return v42;
                end;
            end;
            return nil;
        end;
        local function v59(v44) --[[ Line: 106 ]] --[[ Name: createTeamChannel ]]
            -- upvalues: l_v33_0 (copy), l_l_Folder_0_0 (copy), v18 (ref), l_FFlagExpChatAddUserAsyncNilCheck_0 (ref), v43 (copy), v21 (ref)
            local v45 = "RBXTeam" .. tostring(v44.TeamColor.Name);
            local v46 = l_v33_0(v45);
            if not v46 then
                v46 = Instance.new("TextChannel");
                v46.Name = v45;
                v46.Parent = l_l_Folder_0_0;
            end;
            v18:debug("Creating team TextChannel: {}", v46.Name);
            v44.PlayerAdded:Connect(function(v47) --[[ Line: 110 ]]
                -- upvalues: v44 (copy), l_v33_0 (ref), l_l_Folder_0_0 (ref), l_FFlagExpChatAddUserAsyncNilCheck_0 (ref)
                local v48 = "RBXTeam" .. tostring(v44.TeamColor.Name);
                local v49 = l_v33_0(v48);
                if not v49 then
                    v49 = Instance.new("TextChannel");
                    v49.Name = v48;
                    v49.Parent = l_l_Folder_0_0;
                end;
                v48 = v49:AddUserAsync(v47.UserId);
                if l_FFlagExpChatAddUserAsyncNilCheck_0 then
                    if v48 ~= nil then
                        v48.CanSend = true;
                        return;
                    end;
                else
                    v48.CanSend = true;
                end;
            end);
            v44.PlayerRemoved:Connect(function(v50) --[[ Line: 123 ]]
                -- upvalues: v44 (copy), l_v33_0 (ref), l_l_Folder_0_0 (ref), v43 (ref)
                local v51 = "RBXTeam" .. tostring(v44.TeamColor.Name);
                local v52 = l_v33_0(v51);
                if not v52 then
                    v52 = Instance.new("TextChannel");
                    v52.Name = v51;
                    v52.Parent = l_l_Folder_0_0;
                end;
                v51 = v43(v52, v50.UserId);
                if v51 then
                    v51:Destroy();
                end;
            end);
            if v21 then
                for _, v54 in pairs(v44:GetPlayers()) do
                    local v55 = "RBXTeam" .. tostring(v44.TeamColor.Name);
                    local v56 = l_v33_0(v55);
                    if not v56 then
                        v56 = Instance.new("TextChannel");
                        v56.Name = v55;
                        v56.Parent = l_l_Folder_0_0;
                    end;
                    v55 = v56:AddUserAsync(v54.UserId);
                    if l_FFlagExpChatAddUserAsyncNilCheck_0 then
                        if v55 ~= nil then
                            v55.CanSend = true;
                        end;
                    else
                        v55.CanSend = true;
                    end;
                end;
            end;
            v44:GetPropertyChangedSignal("TeamColor"):Connect(function() --[[ Line: 148 ]]
                -- upvalues: v44 (copy), l_v33_0 (ref), l_l_Folder_0_0 (ref)
                local v57 = "RBXTeam" .. tostring(v44.TeamColor.Name);
                local v58 = l_v33_0(v57);
                if not v58 then
                    v58 = Instance.new("TextChannel");
                    v58.Name = v57;
                    v58.Parent = l_l_Folder_0_0;
                end;
                v58.Name = "RBXTeam" .. tostring(v44.TeamColor.Name);
            end);
        end;
        for _, v61 in pairs(l_Teams_0:GetTeams()) do
            if v61:IsA("Team") then
                v59(v61);
            end;
        end;
        local l_v59_0 = v59 --[[ copy: 7 -> 19 ]];
        l_Teams_0.ChildAdded:Connect(function(v63) --[[ Line: 160 ]]
            -- upvalues: l_v59_0 (copy)
            if v63:IsA("Team") then
                l_v59_0(v63);
            end;
        end);
        local l_v33_1 = v33 --[[ copy: 4 -> 20 ]];
        l_Teams_0.ChildRemoved:Connect(function(v65) --[[ Line: 166 ]]
            -- upvalues: l_v33_1 (copy), v18 (ref)
            if v65:IsA("Team") then
                local v66 = l_v33_1("RBXTeam" .. tostring(v65.TeamColor.Name));
                if v66 then
                    v18:debug("Destroying team TextChannel: {}", v66.Name);
                    v66:Destroy();
                end;
            end;
        end);
        for v67, _ in pairs(l_Config_0.DefaultChannelNames) do
            v18:trace("Creating default channel: {}", v67);
            local v69 = v33(v67);
            if not v69 then
                v69 = Instance.new("TextChannel");
                v69.Name = v67;
                v69.Parent = l_Folder_0;
            end;
            table.insert(v28, v69);
        end;
        local function v74(v70) --[[ Line: 181 ]] --[[ Name: addPlayerTextSourceToDefaultChannels ]]
            -- upvalues: v28 (copy), v18 (ref), l_FFlagExpChatAddUserAsyncNilCheck_0 (ref)
            for _, v72 in ipairs(v28) do
                v18:trace("Adding user {} to TextChannel: {}", tostring(v70.UserId), v72.Name);
                local v73 = v72:AddUserAsync(v70.UserId);
                if l_FFlagExpChatAddUserAsyncNilCheck_0 then
                    if v73 ~= nil and v72.Name == "RBXGeneral" then
                        v73.CanSend = true;
                    elseif v73 ~= nil and v72.Name == "RBXSystem" then
                        v73.CanSend = false;
                    end;
                elseif v72.Name == "RBXGeneral" then
                    v73.CanSend = true;
                elseif v72.Name == "RBXSystem" then
                    v73.CanSend = false;
                end;
            end;
        end;
        for _, v76 in pairs(l_Players_0:GetPlayers()) do
            if v76:IsA("Player") then
                v74(v76);
            end;
        end;
        l_Players_0.PlayerAdded:Connect(v74);
        l_Analytics_0.FireRccAnalyticsWithEventName("DefaultChannelsCreated");
    end;
    if l_TextChatService_0.CreateDefaultCommands then
        v18:trace("Creating default TextChatCommands");
        local l_Folder_1 = Instance.new("Folder");
        l_Folder_1.Name = "TextChatCommands";
        l_Folder_1.Parent = l_TextChatService_0;
        for _, v79 in ipairs(l_Commands_0.enabledCommands) do
            local l_TextChatCommand_0 = Instance.new("TextChatCommand");
            l_TextChatCommand_0.Name = v79.name;
            l_TextChatCommand_0.PrimaryAlias = v79.alias[1];
            l_TextChatCommand_0.SecondaryAlias = v79.alias[2] or "";
            l_TextChatCommand_0.Parent = l_Folder_1;
        end;
        l_Analytics_0.FireRccAnalyticsWithEventName("DefaultCommandsCreated");
    end;
    local v82 = #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v81) --[[ Line: 38 ]]
        return v81:IsA("TextChannel");
    end);
    local v84 = #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v83) --[[ Line: 46 ]]
        return v83:IsA("TextChatCommand");
    end);
    l_Analytics_0.FireRccAnalyticsWithEventName("ExperienceChatLoaded", {
        loadedChannels = v82, 
        loadedCommands = v84
    });
    if l_getFFlagExpChatAlwaysRunTCS_0() then
        l_Analytics_0.FireRccAnalyticsDeferred("AutomigratedToTCS", {
            universeId = game.GameId
        });
    end;
    v18:debug("Start watching for new channels and commands");
    l_TextChatService_0.DescendantAdded:Connect(function(v85) --[[ Line: 246 ]]
        -- upvalues: l_Analytics_0 (ref), l_List_0 (ref), l_TextChatService_0 (ref), l_countParticipantsInTextChannel_0 (ref)
        if v85:IsA("TextChannel") then
            l_Analytics_0.FireRccAnalyticsWithEventName("ChannelCreated", {
                channelName = v85.Name, 
                totalChannels = #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v86) --[[ Line: 38 ]]
                    return v86:IsA("TextChannel");
                end)
            });
            return;
        elseif v85:IsA("TextChatCommand") then
            l_Analytics_0.FireRccAnalyticsWithEventName("CommandCreated", {
                commandName = v85.Name
            });
            return;
        else
            if v85:IsA("TextSource") then
                local l_Parent_1 = v85.Parent;
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
    l_TextChatService_0.DescendantRemoving:Connect(function(v88) --[[ Line: 267 ]]
        -- upvalues: l_Analytics_0 (ref), l_List_0 (ref), l_TextChatService_0 (ref), l_countParticipantsInTextChannel_0 (ref)
        if v88:IsA("TextChannel") then
            l_Analytics_0.FireRccAnalyticsWithEventName("ChannelRemoved", {
                channelName = v88.Name, 
                totalChannels = #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v89) --[[ Line: 38 ]]
                    return v89:IsA("TextChannel");
                end) - 1
            });
            return;
        elseif v88:IsA("TextChatCommand") then
            l_Analytics_0.FireRccAnalyticsWithEventName("CommandRemoved", {
                commandName = v88.Name
            });
            return;
        else
            if v88:IsA("TextSource") then
                local l_Parent_2 = v88.Parent;
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
    for _, v92 in pairs(l_Players_0:GetPlayers()) do
        v27:dispatch(l_PlayerAdded_0(v92.UserId, v92.Name, v92.DisplayName));
    end;
    l_Players_0.PlayerAdded:Connect(function(v93) --[[ Line: 291 ]]
        -- upvalues: v27 (copy), l_PlayerAdded_0 (ref)
        v27:dispatch(l_PlayerAdded_0(v93.UserId, v93.Name, v93.DisplayName));
    end);
    l_Players_0.PlayerRemoving:Connect(function(v94) --[[ Line: 295 ]]
        -- upvalues: v27 (copy), l_PlayerRemoved_0 (ref)
        v27:dispatch(l_PlayerRemoved_0(v94.UserId));
    end);
end;