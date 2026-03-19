local l_ClientChatModules_0 = game:GetService("Chat"):WaitForChild("ClientChatModules");
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local l_ChatConstants_0 = require(l_ClientChatModules_0:WaitForChild("ChatConstants"));
local v3 = nil;
pcall(function() --[[ Line: 13 ]]
    -- upvalues: v3 (ref)
    v3 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
if v3 == nil then
    v3 = {};
end;
if not v3.FormatMessageToSend or not v3.LocalizeFormattedMessage then
    v3.FormatMessageToSend = function(_, _, v6) --[[ Line: 16 ]] --[[ Name: FormatMessageToSend ]]
        return v6;
    end;
end;
local v7 = {
    ChatColor = l_ChatSettings_0.ErrorMessageTextColor or Color3.fromRGB(245, 50, 50)
};
return function(v8) --[[ Line: 22 ]] --[[ Name: Run ]]
    -- upvalues: v3 (ref), l_ChatConstants_0 (copy), v7 (copy), l_ChatSettings_0 (copy)
    local l_Players_0 = game:GetService("Players");
    local v10 = v8:AddChannel("Team");
    v10.WelcomeMessage = v3:FormatMessageToSend("GameChat_TeamChat_WelcomeMessage", "This is a private channel between you and your team members.");
    v10.Joinable = false;
    v10.Leavable = false;
    v10.AutoJoin = false;
    v10.Private = true;
    v10:RegisterProcessCommandsFunction("replication_function", function(v11, v12, v13) --[[ Line: 33 ]] --[[ Name: TeamChatReplicationFunction ]]
        -- upvalues: v8 (copy)
        local l_v8_Speaker_0 = v8:GetSpeaker(v11);
        local l_v8_Channel_0 = v8:GetChannel(v13);
        if l_v8_Speaker_0 and l_v8_Channel_0 then
            local l_l_v8_Speaker_0_Player_0 = l_v8_Speaker_0:GetPlayer();
            if l_l_v8_Speaker_0_Player_0 then
                for _, v18 in pairs(l_v8_Channel_0:GetSpeakerList()) do
                    local l_v8_Speaker_1 = v8:GetSpeaker(v18);
                    if l_v8_Speaker_1 then
                        local l_l_v8_Speaker_1_Player_0 = l_v8_Speaker_1:GetPlayer();
                        if l_l_v8_Speaker_1_Player_0 and l_l_v8_Speaker_0_Player_0.Team == l_l_v8_Speaker_1_Player_0.Team then
                            l_v8_Speaker_1:SendMessage(v12, v13, v11, {
                                NameColor = l_l_v8_Speaker_0_Player_0.TeamColor.Color, 
                                ChatColor = l_l_v8_Speaker_0_Player_0.TeamColor.Color, 
                                ChannelColor = l_l_v8_Speaker_0_Player_0.TeamColor.Color
                            });
                        end;
                    end;
                end;
            end;
        end;
        return true;
    end, l_ChatConstants_0.LowPriority);
    local function v27(v21, v22, v23) --[[ Line: 70 ]] --[[ Name: DoTeamCommand ]]
        -- upvalues: v8 (copy), v3 (ref), v7 (ref)
        if v22 == nil then
            v22 = "";
        end;
        local l_v8_Speaker_2 = v8:GetSpeaker(v21);
        if l_v8_Speaker_2 then
            local l_l_v8_Speaker_2_Player_0 = l_v8_Speaker_2:GetPlayer();
            if l_l_v8_Speaker_2_Player_0 then
                if l_l_v8_Speaker_2_Player_0.Team == nil then
                    l_v8_Speaker_2:SendSystemMessage(v3:FormatMessageToSend("GameChat_TeamChat_CannotTeamChatIfNotInTeam", "You cannot team chat if you are not on a team!"), v23, v7);
                    return;
                else
                    local l_v8_Channel_1 = v8:GetChannel("Team");
                    if l_v8_Channel_1 then
                        if not l_v8_Speaker_2:IsInChannel(l_v8_Channel_1.Name) then
                            l_v8_Speaker_2:JoinChannel(l_v8_Channel_1.Name);
                        end;
                        if v22 and string.len(v22) > 0 then
                            l_v8_Speaker_2:SayMessage(v22, l_v8_Channel_1.Name);
                        end;
                        l_v8_Speaker_2:SetMainChannel(l_v8_Channel_1.Name);
                    end;
                end;
            end;
        end;
    end;
    v8:RegisterProcessCommandsFunction("team_commands", function(v28, v29, v30) --[[ Line: 99 ]] --[[ Name: TeamCommandsFunction ]]
        -- upvalues: v27 (copy)
        local v31 = false;
        if v29 == nil then
            error("Message is nil");
        end;
        if v30 == "Team" then
            return false;
        elseif string.sub(v29, 1, 6):lower() == "/team " or v29:lower() == "/team" then
            v27(v28, string.sub(v29, 7), v30);
            return true;
        elseif string.sub(v29, 1, 3):lower() == "/t " or v29:lower() == "/t" then
            v27(v28, string.sub(v29, 4), v30);
            return true;
        else
            if string.sub(v29, 1, 2):lower() == "% " or v29:lower() == "%" then
                v27(v28, string.sub(v29, 3), v30);
                v31 = true;
            end;
            return v31;
        end;
    end, l_ChatConstants_0.StandardPriority);
    local function v32() --[[ Line: 126 ]] --[[ Name: GetDefaultChannelNameColor ]]
        -- upvalues: l_ChatSettings_0 (ref)
        if l_ChatSettings_0.DefaultChannelNameColor then
            return l_ChatSettings_0.DefaultChannelNameColor;
        else
            return Color3.fromRGB(35, 76, 142);
        end;
    end;
    local function v35(v33, v34) --[[ Line: 133 ]] --[[ Name: PutSpeakerInCorrectTeamChatState ]]
        -- upvalues: v10 (copy), v32 (copy)
        if v34.Neutral or v34.Team == nil then
            v33:UpdateChannelNameColor(v10.Name, v32());
            if v33:IsInChannel(v10.Name) then
                v33:LeaveChannel(v10.Name);
                return;
            end;
        elseif not v34.Neutral and v34.Team then
            v33:UpdateChannelNameColor(v10.Name, v34.Team.TeamColor.Color);
            if not v33:IsInChannel(v10.Name) then
                v33:JoinChannel(v10.Name);
            end;
        end;
    end;
    v8.SpeakerAdded:connect(function(v36) --[[ Line: 149 ]]
        -- upvalues: v8 (copy), v35 (copy)
        local l_v8_Speaker_3 = v8:GetSpeaker(v36);
        if l_v8_Speaker_3 then
            local l_l_v8_Speaker_3_Player_0 = l_v8_Speaker_3:GetPlayer();
            if l_l_v8_Speaker_3_Player_0 then
                v35(l_v8_Speaker_3, l_l_v8_Speaker_3_Player_0);
            end;
        end;
    end);
    local v39 = {};
    l_Players_0.PlayerAdded:connect(function(v40) --[[ Line: 160 ]]
        -- upvalues: v8 (copy), v35 (copy), v10 (copy), v3 (ref), v39 (copy)
        v39[v40] = v40.Changed:connect(function(v41) --[[ Line: 161 ]]
            -- upvalues: v8 (ref), v40 (copy), v35 (ref), v10 (ref), v3 (ref)
            local l_v8_Speaker_4 = v8:GetSpeaker(v40.Name);
            if l_v8_Speaker_4 then
                if v41 == "Neutral" then
                    v35(l_v8_Speaker_4, v40);
                    return;
                elseif v41 == "Team" then
                    v35(l_v8_Speaker_4, v40);
                    if l_v8_Speaker_4:IsInChannel(v10.Name) then
                        l_v8_Speaker_4:SendSystemMessage(v3:FormatMessageToSend("GameChat_TeamChat_NowInTeam", string.format("You are now on the '%s' team.", v40.Team.Name), "RBX_NAME", v40.Team.Name), v10.Name);
                    end;
                end;
            end;
        end);
    end);
    l_Players_0.PlayerRemoving:connect(function(v43) --[[ Line: 182 ]]
        -- upvalues: v39 (copy)
        local v44 = v39[v43];
        if v44 then
            v44:Disconnect();
        end;
        v39[v43] = nil;
    end);
end;