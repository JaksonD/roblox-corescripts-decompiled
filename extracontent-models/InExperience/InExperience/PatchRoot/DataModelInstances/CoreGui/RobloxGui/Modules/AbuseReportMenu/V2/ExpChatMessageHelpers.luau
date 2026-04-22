local l_Players_0 = game:GetService("Players");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagEnableGlobalChatAbuseReporting_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableGlobalChatAbuseReporting;
local v19 = {
    CHANNEL_GENERAL = "RBXGeneral", 
    areChannelTabsEnabled = function() --[[ Line: 29 ]] --[[ Name: areChannelTabsEnabled ]]
        -- upvalues: l_TextChatService_0 (copy)
        if not game:GetEngineFeature("EnableChannelTabsConfiguration") then
            return false;
        else
            local l_ChannelTabsConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChannelTabsConfiguration");
            local v5 = false;
            if l_ChannelTabsConfiguration_0 ~= nil then
                v5 = l_ChannelTabsConfiguration_0.Enabled;
            end;
            return v5;
        end;
    end, 
    localizeString = function(v6, v7) --[[ Line: 41 ]] --[[ Name: localizeString ]]
        if not v6 then
            return v7;
        else
            local l_status_0, l_result_0 = pcall(v6.TranslateGameText, v6, game, v7);
            if l_status_0 and type(l_result_0) == "string" then
                return l_result_0;
            else
                return v7;
            end;
        end;
    end, 
    isSystemMessage = function(v10) --[[ Line: 52 ]] --[[ Name: isSystemMessage ]]
        if v10.textChannel and v10.textChannel.Name == "RBXSystem" then
            return true;
        elseif not v10.userId or v10.userId == "0" then
            return true;
        else
            return false;
        end;
    end, 
    formatChannelLabel = function(v11, v12) --[[ Line: 64 ]] --[[ Name: formatChannelLabel ]]
        -- upvalues: l_Players_0 (copy), l_FFlagEnableGlobalChatAbuseReporting_0 (copy)
        if string.find(v11, "RBXGeneral") then
            return "General";
        elseif string.find(v11, "^RBXTeam") then
            return "Team";
        elseif string.find(v11, "^RBXWhisper") then
            if v12 and l_Players_0.LocalPlayer then
                for _, v14 in ipairs(v12:GetChildren()) do
                    if v14:IsA("TextSource") then
                        local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v14.UserId);
                        if l_l_Players_0_PlayerByUserId_0 and l_l_Players_0_PlayerByUserId_0 ~= l_Players_0.LocalPlayer then
                            return l_l_Players_0_PlayerByUserId_0.DisplayName;
                        end;
                    end;
                end;
            end;
            return "Whisper";
        elseif l_FFlagEnableGlobalChatAbuseReporting_0 and v11 == "RBXGlobal" then
            return "Global";
        else
            return v11;
        end;
    end, 
    formatMessageLabel = function(v16) --[[ Line: 88 ]] --[[ Name: formatMessageLabel ]]
        local v17 = v16.prefixText or "";
        local v18 = v16.text or "";
        if #v17 > 0 then
            return v17 .. " " .. v18;
        else
            return v18;
        end;
    end
};
v19.collectItems = function(v20, v21) --[[ Line: 96 ]] --[[ Name: collectItems ]]
    -- upvalues: v19 (copy)
    local v22 = {};
    for _, v24 in ipairs(v21) do
        local v25 = v20[v24];
        if v25 and not v19.isSystemMessage(v25) then
            table.insert(v22, {
                id = v25.messageId, 
                label = v19.formatMessageLabel(v25)
            });
        end;
    end;
    return v22;
end;
v19.annotateWhisperItems = function(v26, v27) --[[ Line: 113 ]] --[[ Name: annotateWhisperItems ]]
    for _, v29 in ipairs(v26) do
        local v30 = v27[v29.id];
        if v30 and v30.textChannel and typeof(v30.textChannel.Name) == "string" and string.sub(v30.textChannel.Name, 1, 10) == "RBXWhisper" then
            v29.label = "[Sent privately] " .. v29.label;
        end;
    end;
end;
return v19;