local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Chat_0 = game:GetService("Chat");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v10 = require(l_Parent_0.Promise);
local v11 = require(l_Parent_0.Roact);
local v12 = require(l_Parent_0.UIBlox);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v14 = require(l_Parent_0.ExpChatShared);
local l_LocalStorageKey_0 = require(l_Parent_0.LocalStorage).Enums.LocalStorageKey;
local v16 = require(l_Parent_0.NotificationModalsManager);
local v17 = require(l_Parent_0.SharedFlags);
local v18 = require(l_Parent_0.Signals);
local v19 = require(l_script_FirstAncestor_0.Stores.GetAdorneeStore);
local v20 = require(l_script_FirstAncestor_0.Stores.GetMessagesStore);
local v21 = require(l_script_FirstAncestor_0.Stores.GetChannelTabsStore);
local v22 = require(l_script_FirstAncestor_0.Stores.GetTransparencyStore);
local v23 = require(l_script_FirstAncestor_0.Stores.GetCharacterStore);
local v24 = require(l_script_FirstAncestor_0.Stores.GetChatConfigurationStore);
local v25 = require(l_script_FirstAncestor_0.Stores.GetChatStatusStore);
local v26 = require(l_script_FirstAncestor_0.Stores.GetChatModerationStore);
local v27 = require(l_script_FirstAncestor_0.Stores.GetGlobalMutedUsersStore);
local l_FFlagConnectionsToFriendsRename_0 = v17.FFlagConnectionsToFriendsRename;
local l_FFlagExpChatUseProximityStore_0 = v17.FFlagExpChatUseProximityStore;
local v30 = if l_FFlagExpChatUseProximityStore_0 then require(l_script_FirstAncestor_0.Stores.GetProximityStore) else nil;
local l_Analytics_0 = v14.Analytics;
local l_countParticipantsInTextChannel_0 = v14.countParticipantsInTextChannel;
local v33 = require(script.Parent.App);
local v34 = v14.Logger:new("ExpChat/" .. script.Name);
local v35 = require(script.Parent.createDispatchBindableEvent);
local v36 = require(l_script_FirstAncestor_0.Events.bindableEventQueue);
local v37 = require(script.Parent.createStore);
local v38 = require(script.Parent.GetNameColor);
local v39 = require(script.Parent.reportMessageReceived);
local v40 = require(script.Parent.canPlatformEnableChat);
local l_watchForErrors_0 = v14.watchForErrors;
local l_Commands_0 = v14.Commands;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v44 = require(l_Actions_0.IncomingMessageReceived);
local v45 = require(l_Actions_0.UniverseChatSystemMessageAdded);
local v46 = require(l_Actions_0.IncomingBubbleChatMessageReceived);
local v47 = require(l_Actions_0.OutgoingMessageSent);
local l_TextChannelCreated_0 = v14.Actions.TextChannelCreated;
local l_TextChannelRemoved_0 = v14.Actions.TextChannelRemoved;
local l_PlayerAdded_0 = v14.Actions.PlayerAdded;
local l_PlayerRemoved_0 = v14.Actions.PlayerRemoved;
local l_CharacterAdded_0 = v14.Actions.CharacterAdded;
local l_LocalCharacterLoaded_0 = v14.Actions.LocalCharacterLoaded;
local l_LocalTeamChanged_0 = v14.Actions.LocalTeamChanged;
local l_ClientAppLoaded_0 = v14.Actions.ClientAppLoaded;
local v56 = require(l_Actions_0.LastInputTypeChanged);
local v57 = require(l_Actions_0.ChatPrivacySettingsReceived);
local v58 = require(l_Actions_0.ChatPrivacySettingsFetchFailed);
local l_CommandAliasChanged_0 = v14.Actions.CommandAliasChanged;
local v60 = require(l_Actions_0.HumanoidDied);
local v61 = require(l_Actions_0.AdorneeAdded);
local v62 = require(l_Actions_0.LegacyBubbleChatEnabledChanged);
local v63 = require(l_Actions_0.LegacyBubbleChatSettingsChanged);
local v64 = require(l_Actions_0.LocalTextChannelParticipantAdded);
local l_LocalTextChannelParticipantRemoved_0 = v14.Actions.LocalTextChannelParticipantRemoved;
local v66 = require(l_Actions_0.HiddenMessageReceived);
local v67 = require(l_Actions_0.HiddenMessagesCleared);
local v68 = require(l_Actions_0.UniverseChatChannelAdded);
local v69 = require(l_script_FirstAncestor_0.displaySystemMessage);
local v70 = require(l_script_FirstAncestor_0.generateRichSystemMessageTextFormat);
local v71 = require(l_script_FirstAncestor_0.summaryMessageRichText);
local v72 = require(l_script_FirstAncestor_0.TextChatMessageChatActionType);
local v73 = require(l_script_FirstAncestor_0.getExperienceChatVisualConfig);
local v74 = require(l_script_FirstAncestor_0.getOtherDisplayNameInWhisperChannel);
local v75 = require(l_script_FirstAncestor_0.handleChannelWelcomeMessage);
local v76 = require(l_script_FirstAncestor_0.isPlayerVerified);
local v77 = require(l_script_FirstAncestor_0.isChatRegionLocked);
local v78 = require(l_script_FirstAncestor_0.isUserChatEnabled);
local v79 = require(l_script_FirstAncestor_0.canOnlyChatInRegion);
local v80 = require(l_script_FirstAncestor_0.shouldSendHighFrequencyTelemetry);
local v81 = require(l_script_FirstAncestor_0.shouldShowFOMOUpsell);
local v82 = require(l_script_FirstAncestor_0.shouldShowCrossAgeChatActivity);
local v83 = require(l_script_FirstAncestor_0.Telemetry.ExpChatPerfTracker);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v85 = require(l_Flags_0.getEngineFeatureFlagEnableDisplayBubble);
local v86 = require(l_Flags_0.getFFlagUnreduxLastInputTypeChanged);
local v87 = require(l_Flags_0.getFFlagExpChatEnableChannelTabsUI);
local v88 = require(l_Flags_0.getFFlagExpChatOverridePrefixNameColor);
local l_getFFlagUseCharacterStore_0 = v14.Flags.getFFlagUseCharacterStore;
local v90 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatTelemetryEventTrigger);
local v91 = require(l_Flags_0.FFlagAEGIS2EnableGatesForExpChat);
local v92 = game:DefineFastFlag("ExpChatShowBubblesOnMeshParts", false);
local v93 = game:DefineFastInt("ExpChatMessageResponseThrottlePermyriad", 0);
local v94 = game:DefineFastInt("ExpChatMessageResponseUserSamplePermyriad", 0);
local v95 = game:DefineFastFlag("ExpChatEnableNewFOMOSystemMessages", false);
local v96 = game:DefineFastInt("ExpChatHiddenMessagesPromptThresholdLowerBound", 10);
local v97 = game:DefineFastInt("ExpChatHiddenMessagesPromptThresholdUpperBound", 45);
local v98 = require(l_Flags_0.FFlagExpChatEnableFOMOUpsell);
local v99 = require(l_Flags_0.FFlagExpChatClearHiddenMessagesPostAgeCheck);
local v100 = require(l_Flags_0.FFlagEnableInExpChatSummaryOnLua);
local v101 = require(l_Flags_0.FFlagExpChatEnableCrossAgeChatActivity);
local v102 = game:DefineFastInt("MaxExpChatUserMessageIntentImpressionCount", 9999999);
local l_GetFFlagExpChatUserMessageIntentSentCooldown_0 = v17.GetFFlagExpChatUserMessageIntentSentCooldown;
local l_GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled_0 = v17.GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled;
local l_FIntMaxExpChatUnlockChatButtonImpressionsCount_0 = v17.FIntMaxExpChatUnlockChatButtonImpressionsCount;
local l_FStringExpChatFOMOUpsellImpressionsCountKey_0 = v17.FStringExpChatFOMOUpsellImpressionsCountKey;
local l_GetFFlagExpChatFOMOUpsellImpressionsCountEnabled_0 = v17.GetFFlagExpChatFOMOUpsellImpressionsCountEnabled;
local l_FFlagExpChatUseAdorneeStore_0 = v17.FFlagExpChatUseAdorneeStore;
local l_FFlagExpChatUseMessagesStore_0 = v17.FFlagExpChatUseMessagesStore;
local l_FFlagExpChatUseChannelTabsStore_0 = v17.FFlagExpChatUseChannelTabsStore;
local l_FFlagExpChatUseChatConfigStore_0 = v17.FFlagExpChatUseChatConfigStore;
local l_FFlagEnableModerateChatRemoteEvent_0 = v17.FFlagEnableModerateChatRemoteEvent;
local l_FFlagEnableSummarySystemMessageOnLua_0 = v17.FFlagEnableSummarySystemMessageOnLua;
local l_FFlagExpChatPerfTracking_0 = v17.FFlagExpChatPerfTracking;
local l_GetFFlagTextChatEnableUniverseChatTabs_0 = v14.Flags.GetFFlagTextChatEnableUniverseChatTabs;
local l_GetFFlagEnableExpChatUniverseChatTabNames_0 = v14.Flags.GetFFlagEnableExpChatUniverseChatTabNames;
local l_FFlagExpChatDisableUniverseBubbleChat_0 = v14.Flags.FFlagExpChatDisableUniverseBubbleChat;
local l_GetFFlagExpChatGlobalMuteCommandEnabled_0 = v14.Flags.GetFFlagExpChatGlobalMuteCommandEnabled;
local v119 = game:DefineFastFlag("ExpChatRemoveSpaceFromTeamPrefix", false);
local l_ExpChatNewHiddenMessagesExperimentation_0 = require(l_Parent_0.SocialExperiments).ExpChatNewHiddenMessagesExperimentation;
getChatTranslationEnabled = function() --[[ Line: 147 ]] --[[ Name: getChatTranslationEnabled ]]
    -- upvalues: l_TextChatService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 148 ]]
        -- upvalues: l_TextChatService_0 (ref)
        return l_TextChatService_0.ChatTranslationEnabled;
    end);
    return l_status_0 and l_result_0;
end;
local v123 = {
    eventName = "MessageResponse", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = v93, 
    lastUpdated = {
        25, 
        10, 
        8
    }, 
    description = "When a client receives a text chat message through TextChatService.", 
    links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/message_response.proto"
};
local l_helpers_0 = script.helpers;
local v125 = require(l_helpers_0.setUpConfigurationObjects);
local v126 = require(l_helpers_0.setUpClientSettings);
local v127 = require(l_helpers_0.waitForFirst);
local v128 = require(l_helpers_0.shouldFilterGlobalMessage);
local l_context_0 = v14.context;
local v130 = require(script.reportVersionLoaded);
local l_Version_0 = v14.Version;
local v132 = require(l_script_FirstAncestor_0.AtomicBinding);
local function v171(v133, v134, v135) --[[ Line: 177 ]] --[[ Name: watchPlayersService ]]
    -- upvalues: v34 (copy), v76 (copy), l_PlayerAdded_0 (copy), l_Players_0 (copy), l_LocalTeamChanged_0 (copy), v92 (copy), l_FFlagExpChatUseAdorneeStore_0 (copy), l_context_0 (copy), v61 (copy), v60 (copy), v132 (copy), v127 (copy), l_LocalCharacterLoaded_0 (copy), l_getFFlagUseCharacterStore_0 (copy), l_CharacterAdded_0 (copy), v10 (copy), v69 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_PlayerRemoved_0 (copy), l_FFlagExpChatUseMessagesStore_0 (copy)
    v34:trace("Watching Players service");
    local v136 = {};
    local function v160(v137) --[[ Line: 181 ]] --[[ Name: onPlayerAdded ]]
        -- upvalues: v34 (ref), v76 (ref), v134 (copy), l_PlayerAdded_0 (ref), l_Players_0 (ref), l_LocalTeamChanged_0 (ref), v92 (ref), l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v61 (ref), v60 (ref), v132 (ref), v127 (ref), l_LocalCharacterLoaded_0 (ref), l_getFFlagUseCharacterStore_0 (ref), l_CharacterAdded_0 (ref), v136 (copy)
        v34:trace("Player added: {} {}", v137.Name, (tostring(v137.UserId)));
        local v138 = v76(v137) and true or nil;
        v134:dispatch(l_PlayerAdded_0(v137.UserId, v137.Name, v137.DisplayName, v138));
        if v137 == l_Players_0.LocalPlayer then
            v34:trace("Found local player");
            v137:GetPropertyChangedSignal("Team"):Connect(function() --[[ Line: 190 ]]
                -- upvalues: v134 (ref), l_LocalTeamChanged_0 (ref), v137 (copy)
                v134:dispatch(l_LocalTeamChanged_0(v137.Team));
            end);
        end;
        local function _() --[[ Line: 195 ]] --[[ Name: getHumanoidBinding ]]
            -- upvalues: v92 (ref), v137 (copy), l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v134 (ref), v61 (ref), v60 (ref), v132 (ref)
            local function v145(v139) --[[ Line: 198 ]] --[[ Name: dispatchBubbleChatAdornee ]]
                -- upvalues: v92 (ref), v137 (ref), l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v134 (ref), v61 (ref), v60 (ref)
                local l_root_0 = v139.root;
                local l_humanoid_0 = v139.humanoid;
                local l_humanoidRootPart_0 = v139.humanoidRootPart;
                local v143 = v92 and "BasePart" or "Part";
                if l_humanoid_0:IsA("Humanoid") and l_humanoidRootPart_0:IsA(v143) then
                    if l_root_0 and l_humanoidRootPart_0 and v137.Character == l_root_0 then
                        if l_FFlagExpChatUseAdorneeStore_0 then
                            l_context_0.adorneeStore.handleAdorneeAdded(v137.UserId, l_root_0, l_humanoid_0);
                        else
                            v134:dispatch(v61(v137.UserId, l_root_0, l_humanoid_0));
                        end;
                    end;
                    local v144 = l_humanoid_0.Died:Connect(function() --[[ Line: 213 ]]
                        -- upvalues: l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v137 (ref), v134 (ref), v60 (ref)
                        if l_FFlagExpChatUseAdorneeStore_0 then
                            l_context_0.adorneeStore.handleHumanoidDied(v137.UserId);
                            return;
                        else
                            v134:dispatch(v60(v137.UserId));
                            return;
                        end;
                    end);
                    return function() --[[ Line: 221 ]] --[[ Name: disconnectHumanoidDied ]]
                        -- upvalues: v144 (copy)
                        if v144 then
                            v144:Disconnect();
                        end;
                    end;
                else
                    return function() --[[ Line: 232 ]]

                    end;
                end;
            end;
            return (v132.new({
                humanoid = "Humanoid", 
                humanoidRootPart = "HumanoidRootPart"
            }, v145));
        end;
        local function v153(v147) --[[ Line: 198 ]] --[[ Name: dispatchBubbleChatAdornee ]]
            -- upvalues: v92 (ref), v137 (copy), l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v134 (ref), v61 (ref), v60 (ref)
            local l_root_1 = v147.root;
            local l_humanoid_1 = v147.humanoid;
            local l_humanoidRootPart_1 = v147.humanoidRootPart;
            local v151 = v92 and "BasePart" or "Part";
            if l_humanoid_1:IsA("Humanoid") and l_humanoidRootPart_1:IsA(v151) then
                if l_root_1 and l_humanoidRootPart_1 and v137.Character == l_root_1 then
                    if l_FFlagExpChatUseAdorneeStore_0 then
                        l_context_0.adorneeStore.handleAdorneeAdded(v137.UserId, l_root_1, l_humanoid_1);
                    else
                        v134:dispatch(v61(v137.UserId, l_root_1, l_humanoid_1));
                    end;
                end;
                local v152 = l_humanoid_1.Died:Connect(function() --[[ Line: 213 ]]
                    -- upvalues: l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v137 (ref), v134 (ref), v60 (ref)
                    if l_FFlagExpChatUseAdorneeStore_0 then
                        l_context_0.adorneeStore.handleHumanoidDied(v137.UserId);
                        return;
                    else
                        v134:dispatch(v60(v137.UserId));
                        return;
                    end;
                end);
                return function() --[[ Line: 221 ]] --[[ Name: disconnectHumanoidDied ]]
                    -- upvalues: v152 (copy)
                    if v152 then
                        v152:Disconnect();
                    end;
                end;
            else
                return function() --[[ Line: 232 ]]

                end;
            end;
        end;
        local v154 = v132.new({
            humanoid = "Humanoid", 
            humanoidRootPart = "HumanoidRootPart"
        }, v153);
        v153 = function(v155) --[[ Line: 243 ]] --[[ Name: onCharacterAdded ]]
            -- upvalues: v127 (ref), v137 (copy), v34 (ref), l_Players_0 (ref), v134 (ref), l_LocalCharacterLoaded_0 (ref), l_getFFlagUseCharacterStore_0 (ref), l_context_0 (ref), l_CharacterAdded_0 (ref), v154 (copy)
            if not v155.Parent then
                v127(v155.AncestryChanged, v137.CharacterAdded);
            end;
            if v137.Character ~= v155 or not v155.Parent then
                v34:debug("Mismatched or unparented character in onCharacterAdded for {}", (tostring(v137.UserId)));
                return;
            else
                if v137 == l_Players_0.LocalPlayer then
                    v34:debug("Local character loaded: {}", v155.Name);
                    v134:dispatch(l_LocalCharacterLoaded_0(v155));
                end;
                if l_getFFlagUseCharacterStore_0() then
                    l_context_0.characterStore.handleCharacterAdded(v137.UserId, v155);
                else
                    v134:dispatch(l_CharacterAdded_0(v137.UserId, v155));
                end;
                v154:bindRoot(v155);
                return;
            end;
        end;
        local function v157(v156) --[[ Line: 267 ]] --[[ Name: onCharacterRemoving ]]
            -- upvalues: v154 (copy)
            v154:unbindRoot(v156);
        end;
        if v137.Character then
            v153(v137.Character);
        end;
        local v158 = v137.CharacterAdded:Connect(v153);
        local v159 = v137.CharacterRemoving:Connect(v157);
        if not v136[v137.UserId] then
            v136[v137.UserId] = {
                v158, 
                v159
            };
        end;
    end;
    local function v164(v161) --[[ Line: 285 ]] --[[ Name: onNewPlayerAdded ]]
        -- upvalues: v160 (copy), l_Players_0 (ref), v10 (ref), v69 (ref), l_FFlagConnectionsToFriendsRename_0 (ref), v133 (copy), v34 (ref)
        v160(v161);
        if l_Players_0.LocalPlayer then
            v10.try(function() --[[ Line: 289 ]]
                -- upvalues: v161 (copy), l_Players_0 (ref)
                if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                    return v161:IsFriendsWithAsync(l_Players_0.LocalPlayer.UserId);
                else
                    return v161:IsFriendsWith(l_Players_0.LocalPlayer.UserId);
                end;
            end):andThen(function(v162) --[[ Line: 296 ]]
                -- upvalues: v69 (ref), l_FFlagConnectionsToFriendsRename_0 (ref), v161 (copy), v133 (ref)
                if v162 then
                    v69(l_FFlagConnectionsToFriendsRename_0 and "InGame.UnknownNamespace.GameChat.FriendChatNotifier.JoinMessage" or "InGame.UnknownNamespace.GameChat_FriendChatNotifier_JoinMessage", {
                        RBX_NAME = v161.DisplayName
                    }, "Roblox.Notification.Friend.Joined", v133.translator, v133.defaultSystemTextChannel);
                end;
            end):catch(function(v163) --[[ Line: 309 ]]
                -- upvalues: v34 (ref)
                v34:error("Could not fetch friendship status. Error: {}", (tostring(v163)));
            end);
        end;
    end;
    for _, v166 in pairs(l_Players_0:GetPlayers()) do
        if v166:IsA("Player") then
            v160(v166);
        end;
    end;
    l_Players_0.PlayerAdded:Connect(v164);
    l_Players_0.PlayerRemoving:Connect(function(v167) --[[ Line: 324 ]]
        -- upvalues: v34 (ref), v134 (copy), l_PlayerRemoved_0 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v135 (copy), l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), l_getFFlagUseCharacterStore_0 (ref), v136 (copy)
        v34:trace("Player removed: {} {}", v167.Name, (tostring(v167.UserId)));
        v134:dispatch(l_PlayerRemoved_0(v167.UserId));
        if l_FFlagExpChatUseMessagesStore_0 then
            v135.handlePlayerRemoved(v167.UserId);
        end;
        if l_FFlagExpChatUseAdorneeStore_0 then
            l_context_0.adorneeStore.handlePlayerRemoved(v167.UserId);
        end;
        if l_getFFlagUseCharacterStore_0() then
            l_context_0.characterStore.handlePlayerRemoved(v167.UserId);
        end;
        local v168 = v136[v167.UserId];
        if v168 then
            for _, v170 in ipairs(v168) do
                v170:Disconnect();
            end;
            v136[v167.UserId] = nil;
        end;
    end);
end;
local v173 = {
    canUserChatAsync = function(v172) --[[ Line: 377 ]] --[[ Name: canUserChatAsync ]]
        -- upvalues: l_Chat_0 (copy)
        return l_Chat_0:CanUserChatAsync(v172);
    end
};
local function v176(v174) --[[ Line: 382 ]]
    -- upvalues: v34 (copy), v100 (copy), v70 (copy), v12 (copy)
    v34:trace("System OnIncomingMessage started: {} {}", v174.PrefixText, v174.Text);
    local l_TextChatMessageProperties_0 = Instance.new("TextChatMessageProperties");
    l_TextChatMessageProperties_0.Text = if v100 then v70(v174.Text, not not string.find(v174.Metadata, "Error")) else string.format("<font color=\"#%s\">%s</font>", if string.find(v174.Metadata, "Error") then v12.App.Style.Colors.Red:ToHex() else v12.App.Style.Colors.LightGrey:ToHex(), v174.Text);
    v34:trace("System OnIncomingMessage finished: {} {}", l_TextChatMessageProperties_0.PrefixText, l_TextChatMessageProperties_0.Text);
    return l_TextChatMessageProperties_0;
end;
return function(v177) --[[ Line: 400 ]]
    -- upvalues: v34 (copy), l_Dictionary_0 (copy), v173 (copy), v37 (copy), v35 (copy), v36 (copy), l_watchForErrors_0 (copy), l_context_0 (copy), l_FFlagExpChatUseAdorneeStore_0 (copy), v19 (copy), l_FFlagExpChatUseProximityStore_0 (copy), v30 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), v20 (copy), l_FFlagExpChatUseChannelTabsStore_0 (copy), v21 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy), v24 (copy), v91 (copy), v25 (copy), l_GetFFlagExpChatGlobalMuteCommandEnabled_0 (copy), v27 (copy), l_getFFlagUseCharacterStore_0 (copy), v23 (copy), l_Analytics_0 (copy), v86 (copy), l_UserInputService_0 (copy), v56 (copy), v176 (copy), l_Chat_0 (copy), l_TextChatService_0 (copy), v125 (copy), v126 (copy), l_GetFFlagExpChatFOMOUpsellImpressionsCountEnabled_0 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), l_HttpService_0 (copy), l_FStringExpChatFOMOUpsellImpressionsCountKey_0 (copy), l_Players_0 (copy), v69 (copy), l_FFlagExpChatPerfTracking_0 (copy), v83 (copy), v39 (copy), v75 (copy), v22 (copy), v44 (copy), v45 (copy), v80 (copy), v94 (copy), v123 (copy), l_TextChannelCreated_0 (copy), v87 (copy), v38 (copy), v88 (copy), v119 (copy), v74 (copy), l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy), v71 (copy), v100 (copy), l_FFlagEnableSummarySystemMessageOnLua_0 (copy), l_TextChannelRemoved_0 (copy), v72 (copy), l_RobloxReplicatedStorage_0 (copy), v47 (copy), l_countParticipantsInTextChannel_0 (copy), v64 (copy), l_LocalTextChannelParticipantRemoved_0 (copy), v68 (copy), l_GetFFlagEnableExpChatUniverseChatTabNames_0 (copy), v128 (copy), v46 (copy), v62 (copy), v63 (copy), v85 (copy), l_FFlagExpChatDisableUniverseBubbleChat_0 (copy), l_Commands_0 (copy), l_CommandAliasChanged_0 (copy), v10 (copy), v57 (copy), v58 (copy), v171 (copy), v12 (copy), v11 (copy), v33 (copy), v90 (copy), l_ClientAppLoaded_0 (copy), l_StarterGui_0 (copy), v130 (copy), l_Version_0 (copy), v77 (copy), v95 (copy), v40 (copy), l_GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled_0 (copy), l_FIntMaxExpChatUnlockChatButtonImpressionsCount_0 (copy), v79 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_ExpChatNewHiddenMessagesExperimentation_0 (copy), v96 (copy), v97 (copy), v66 (copy), v78 (copy), v98 (copy), v81 (copy), v101 (copy), v82 (copy), l_GetFFlagExpChatUserMessageIntentSentCooldown_0 (copy), v102 (copy), l_FFlagEnableModerateChatRemoteEvent_0 (copy), v73 (copy), v26 (copy), v18 (copy), v16 (copy), v99 (copy), v67 (copy)
    v34:trace("mountClientApp started");
    v177 = l_Dictionary_0.join(v173, v177);
    local v178 = v37();
    v35(v178);
    v36:flush();
    l_watchForErrors_0(game:GetService("ScriptContext"), v177.script, false);
    l_context_0.translator = v177.translator;
    l_context_0.store = v178;
    if l_FFlagExpChatUseAdorneeStore_0 then
        l_context_0.adorneeStore = v19(false);
    end;
    if l_FFlagExpChatUseProximityStore_0 then
        l_context_0.proximityStore = v30(false);
    end;
    local v179 = if l_FFlagExpChatUseMessagesStore_0 then v20(false) else nil;
    local v180 = if l_FFlagExpChatUseChannelTabsStore_0 then v21(false) else nil;
    local v181 = if l_FFlagExpChatUseChatConfigStore_0 then v24(false) else nil;
    local v182 = if v91 then v25(false) else nil;
    if l_FFlagExpChatUseMessagesStore_0 then
        l_context_0.messagesStore = v179;
    end;
    if l_GetFFlagExpChatGlobalMuteCommandEnabled_0() then
        l_context_0.globalMutedUsersStore = v27(false);
    end;
    if l_getFFlagUseCharacterStore_0() then
        l_context_0.characterStore = v23(false);
    end;
    if v177.analytics then
        l_Analytics_0.with(v177.analytics);
    end;
    if not v86() then
        l_UserInputService_0.LastInputTypeChanged:Connect(function(v183) --[[ Line: 447 ]]
            -- upvalues: v178 (copy), v56 (ref)
            v178:dispatch(v56(v183));
        end);
    end;
    if v177.defaultSystemTextChannel then
        v177.defaultSystemTextChannel.OnIncomingMessage = v176;
    else
        l_Chat_0:GetPropertyChangedSignal("IsAutoMigrated"):Once(function() --[[ Line: 455 ]]
            -- upvalues: l_TextChatService_0 (ref), v177 (ref), v176 (ref)
            local l_l_TextChatService_0_FirstChild_0 = l_TextChatService_0:FindFirstChild("RBXSystem", true);
            if l_l_TextChatService_0_FirstChild_0 and l_l_TextChatService_0_FirstChild_0:IsA("TextChannel") then
                v177.defaultSystemTextChannel = l_l_TextChatService_0_FirstChild_0;
                l_l_TextChatService_0_FirstChild_0.OnIncomingMessage = v176;
            end;
        end);
    end;
    v125(v178, v177);
    v126(v178);
    local v185 = 1;
    if l_GetFFlagExpChatFOMOUpsellImpressionsCountEnabled_0() then
        local v186 = {};
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 475 ]]
            -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref)
            return l_AppStorageService_0:GetItem(l_LocalStorageKey_0.ExpChatFOMOUpsellImpressionsCount);
        end);
        if l_status_1 and l_result_1 ~= "" then
            local l_l_result_1_0 = l_result_1 --[[ copy: 9 -> 44 ]];
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 480 ]]
                -- upvalues: l_HttpService_0 (ref), l_l_result_1_0 (copy)
                return l_HttpService_0:JSONDecode(l_l_result_1_0);
            end);
            if l_status_2 then
                v186 = l_result_2;
            end;
        end;
        if v186[l_FStringExpChatFOMOUpsellImpressionsCountKey_0] then
            v185 = v186[l_FStringExpChatFOMOUpsellImpressionsCountKey_0] + 1;
        end;
        v186[l_FStringExpChatFOMOUpsellImpressionsCountKey_0] = v185;
        l_AppStorageService_0:SetItem(l_LocalStorageKey_0.ExpChatFOMOUpsellImpressionsCount, l_HttpService_0:JSONEncode(v186));
        l_AppStorageService_0:Flush();
    end;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if l_LocalPlayer_0 then
        l_LocalPlayer_0:GetPropertyChangedSignal("Team"):Connect(function() --[[ Line: 502 ]]
            -- upvalues: l_LocalPlayer_0 (copy), v69 (ref), v177 (ref)
            local l_Team_0 = l_LocalPlayer_0.Team;
            if l_Team_0 then
                v69("InGame.UnknownNamespace.GameChat_TeamChat_NowInTeam", {
                    RBX_NAME = l_Team_0.Name
                }, "Roblox.Team.Success.NowInTeam", v177.translator, v177.defaultSystemTextChannel);
            end;
        end);
    end;
    local v194 = {
        [Enum.TextChatMessageStatus.Floodchecked] = {
            key = "CoreScripts.TextChat.MessageStatus.Warning.Floodchecked", 
            metadata = "Roblox.MessageStatus.Warning.Floodchecked"
        }, 
        [Enum.TextChatMessageStatus.TextFilterFailed] = {
            key = "CoreScripts.TextChat.MessageStatus.Warning.TextFilterFailed", 
            metadata = "Roblox.MessageStatus.Warning.TextFilterFailed"
        }, 
        [Enum.TextChatMessageStatus.InvalidPrivacySettings] = {
            key = "CoreScripts.TextChat.MessageStatus.Warning.InvalidPrivacySettings", 
            metadata = "Roblox.MessageStatus.Warning.InvalidPrivacySettings"
        }, 
        [Enum.TextChatMessageStatus.MessageTooLong] = {
            key = "CoreScripts.TextChat.MessageStatus.Warning.MessageTooLong", 
            metadata = "Roblox.MessageStatus.Warning.MessageTooLong"
        }, 
        [Enum.TextChatMessageStatus.ModerationTimeout] = {
            key = "CoreScripts.TextChat.MessageStatus.Warning.ModerationTimeout", 
            metadata = "Roblox.MessageStatus.Warning.ModerationTimeout"
        }, 
        [Enum.TextChatMessageStatus.Unknown] = {
            key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown", 
            metadata = "Roblox.MessageStatus.Warning.Unknown"
        }
    };
    local function v205(v195, v196) --[[ Line: 543 ]] --[[ Name: processIncomingMessage ]]
        -- upvalues: v34 (ref), l_FFlagExpChatPerfTracking_0 (ref), l_LocalPlayer_0 (copy), v83 (ref), v39 (ref), v75 (ref), v69 (ref), v177 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v179 (copy), v22 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v180 (copy), v178 (copy), v44 (ref), v194 (copy), v45 (ref), l_TextChatService_0 (ref), v80 (ref), v94 (ref), l_Analytics_0 (ref), v123 (ref)
        v34:debug("Incoming MessageReceived Status: {} Text: {}", v195.Status.Name, v195.Text);
        if l_FFlagExpChatPerfTracking_0 and (v195.TextSource and v195.TextSource.UserId or "UNKNOWN_TEXT_SOURCE_USER_ID") ~= (l_LocalPlayer_0 and l_LocalPlayer_0.UserId or "UNKNOWN_LOCAL_USER_ID") then
            v83.start(v83.Events.MessageReceiveToWindowRenderInterval, {
                messageId = v195.MessageId
            });
        end;
        if l_LocalPlayer_0 then
            v39(l_LocalPlayer_0.UserId, v195);
        end;
        if l_LocalPlayer_0 and v195.TextSource and v195.TextSource.UserId ~= l_LocalPlayer_0.UserId then
            local v197 = v75(v195, l_LocalPlayer_0);
            if v197 then
                v69(v197.key, v197.args, v197.metadata, v177.translator, v195.TextChannel);
            end;
        end;
        local v198 = l_LocalPlayer_0 and v195.TextSource and v195.TextSource.UserId == l_LocalPlayer_0.UserId;
        if l_FFlagExpChatUseMessagesStore_0 then
            v179.handleIncomingOrOutgoingMessage(v195, v198, v196);
            v22(false).resetTextTransparency();
            if l_FFlagExpChatUseChannelTabsStore_0 and v180 then
                v180.handleIncomingOrOutgoingMessage(v195, v198, v196);
            end;
        else
            v178:dispatch(v44(v195, v198, v196));
            v22(false).resetTextTransparency();
        end;
        local v199 = v194[v195.Status];
        if v199 then
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 595 ]]
                -- upvalues: v177 (ref), v199 (copy)
                return v177.translator:FormatByKey(v199.key);
            end);
            local v202 = l_status_3 and l_result_3 and l_result_3 ~= "";
            if v196 and v202 then
                if l_FFlagExpChatUseMessagesStore_0 and v179 then
                    v179.addSystemMessage(l_result_3, v196);
                    if l_FFlagExpChatUseChannelTabsStore_0 and v180 then
                        v180.markChannelUnread(v196);
                    end;
                else
                    v178:dispatch(v45(l_result_3, v196));
                end;
            else
                local l_defaultSystemTextChannel_0 = v177.defaultSystemTextChannel;
                if v196 then
                    local l_l_TextChatService_0_FirstChild_1 = l_TextChatService_0:FindFirstChild(v196);
                    if l_l_TextChatService_0_FirstChild_1 and l_l_TextChatService_0_FirstChild_1:IsA("TextChannel") then
                        l_defaultSystemTextChannel_0 = l_l_TextChatService_0_FirstChild_1;
                    end;
                end;
                v69(v199.key, nil, v199.metadata, v177.translator, l_defaultSystemTextChannel_0);
            end;
        end;
        if v80(v94) then
            l_Analytics_0:TelemetryLogEvent(v123, {
                messageStatus = v195.Status.Name
            }, {
                "addOsInfo", 
                "addSessionId", 
                "addUniverseId", 
                "addPlaceId"
            });
        end;
    end;
    local function v225(v206) --[[ Line: 630 ]] --[[ Name: handleMessageReceived ]]
        -- upvalues: v178 (copy), l_TextChannelCreated_0 (ref), v87 (ref), l_TextChatService_0 (ref), v38 (ref), v88 (ref), v34 (ref), l_Players_0 (ref), v119 (ref), l_LocalPlayer_0 (copy), v74 (ref), v177 (ref), l_GetFFlagTextChatEnableUniverseChatTabs_0 (ref), v205 (copy), l_FFlagExpChatPerfTracking_0 (ref), v83 (ref), v39 (ref), v75 (ref), v69 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v179 (copy), v22 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v180 (copy), v44 (ref), v80 (ref), v94 (ref), l_Analytics_0 (ref), v123 (ref)
        v178:dispatch(l_TextChannelCreated_0(v206));
        local v207 = false;
        if v87() then
            local l_ChannelTabsConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChannelTabsConfiguration");
            if l_ChannelTabsConfiguration_0 then
                v207 = l_ChannelTabsConfiguration_0.Enabled;
            end;
        end;
        if string.find(v206.Name, "RBXGeneral") then
            v206.OnIncomingMessage = function(v209) --[[ Line: 642 ]]
                -- upvalues: v38 (ref), v88 (ref)
                local l_TextChatMessageProperties_1 = Instance.new("TextChatMessageProperties");
                if v209.TextSource then
                    local v211 = v38(v209.TextSource.UserId);
                    if not v88() or not v209.ChatWindowMessageProperties then
                        l_TextChatMessageProperties_1.PrefixText = string.format("<font color=\"#%s\">%s</font>", v211:ToHex(), v209.PrefixText);
                    end;
                end;
                return l_TextChatMessageProperties_1;
            end;
        elseif string.find(v206.Name, "^RBXTeam") then
            v206.OnIncomingMessage = function(v212) --[[ Line: 656 ]]
                -- upvalues: v34 (ref), l_Players_0 (ref), v119 (ref), v207 (ref)
                v34:trace("Team OnIncomingMessage started: {} {}", v212.PrefixText, v212.Text);
                local l_TextChatMessageProperties_2 = Instance.new("TextChatMessageProperties");
                if l_Players_0.LocalPlayer then
                    local l_Color_0 = l_Players_0.LocalPlayer.TeamColor.Color;
                    local v215 = "";
                    v215 = if v119 then v207 and "" or #(v212.PrefixText or "") > 0 and "[Team] " or "[Team]" else v207 and "" or "[Team] ";
                    l_TextChatMessageProperties_2.PrefixText = string.format("<font color=\"#%s\">%s%s</font>", l_Color_0:ToHex(), v215, v212.PrefixText);
                end;
                v34:trace("Team OnIncomingMessage finished: {} {}", l_TextChatMessageProperties_2.PrefixText, l_TextChatMessageProperties_2.Text);
                return l_TextChatMessageProperties_2;
            end;
        elseif string.find(v206.Name, "^RBXWhisper") and l_LocalPlayer_0 then
            v206.OnIncomingMessage = function(v216) --[[ Line: 686 ]]
                -- upvalues: v74 (ref), v206 (copy), l_LocalPlayer_0 (ref), v207 (ref), v177 (ref), v38 (ref)
                local l_TextSource_0 = v216.TextSource;
                if l_TextSource_0 then
                    local v218 = v74(v206, l_LocalPlayer_0);
                    if v218 then
                        local v219 = nil;
                        if not v207 then
                            v219 = if l_TextSource_0.UserId == l_LocalPlayer_0.UserId then v177.translator:FormatByKey("CoreScripts.TextChat.WhisperChat.PrefixText.Outgoing", {
                                RBX_NAME = v218
                            }) else v177.translator:FormatByKey("CoreScripts.TextChat.WhisperChat.PrefixText.Incoming", {
                                RBX_NAME = v218
                            });
                        end;
                        local l_TextChatMessageProperties_3 = Instance.new("TextChatMessageProperties");
                        local v221 = v38(l_TextSource_0.UserId);
                        l_TextChatMessageProperties_3.PrefixText = string.format("%s<font color=\"#%s\">%s</font>", if v219 then v219 .. " " else "", v221:ToHex(), v216.PrefixText);
                        return l_TextChatMessageProperties_3;
                    end;
                end;
                return nil;
            end;
        end;
        v206.MessageReceived:Connect(function(v222) --[[ Line: 723 ]]
            -- upvalues: l_GetFFlagTextChatEnableUniverseChatTabs_0 (ref), v205 (ref), v34 (ref), l_FFlagExpChatPerfTracking_0 (ref), l_LocalPlayer_0 (ref), v83 (ref), v39 (ref), v75 (ref), v69 (ref), v177 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v179 (ref), v22 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v180 (ref), v178 (ref), v44 (ref), v80 (ref), v94 (ref), l_Analytics_0 (ref), v123 (ref)
            if l_GetFFlagTextChatEnableUniverseChatTabs_0() then
                v205(v222);
                return;
            else
                v34:debug("Incoming MessageReceived Status: {} Text: {}", v222.Status.Name, v222.Text);
                if l_FFlagExpChatPerfTracking_0 and (v222.TextSource and v222.TextSource.UserId or "UNKNOWN_TEXT_SOURCE_USER_ID") ~= (l_LocalPlayer_0 and l_LocalPlayer_0.UserId or "UNKNOWN_LOCAL_USER_ID") then
                    v83.start(v83.Events.MessageReceiveToWindowRenderInterval, {
                        messageId = v222.MessageId
                    });
                end;
                if l_LocalPlayer_0 then
                    v39(l_LocalPlayer_0.UserId, v222);
                end;
                if l_LocalPlayer_0 and v222.TextSource and v222.TextSource.UserId ~= l_LocalPlayer_0.UserId then
                    local v223 = v75(v222, l_LocalPlayer_0);
                    if v223 then
                        v69(v223.key, v223.args, v223.metadata, v177.translator, v222.TextChannel);
                    end;
                end;
                local v224 = l_LocalPlayer_0 and v222.TextSource and v222.TextSource.UserId == l_LocalPlayer_0.UserId;
                if l_FFlagExpChatUseMessagesStore_0 then
                    v179.handleIncomingOrOutgoingMessage(v222, v224);
                    v22(false).resetTextTransparency();
                    if l_FFlagExpChatUseChannelTabsStore_0 and v180 then
                        v180.handleIncomingOrOutgoingMessage(v222, v224);
                    end;
                else
                    v178:dispatch(v44(v222, v224));
                    v22(false).resetTextTransparency();
                end;
                if v222.Status == Enum.TextChatMessageStatus.Floodchecked then
                    v69("CoreScripts.TextChat.MessageStatus.Warning.Floodchecked", nil, "Roblox.MessageStatus.Warning.Floodchecked", v177.translator, v177.defaultSystemTextChannel);
                elseif v222.Status == Enum.TextChatMessageStatus.TextFilterFailed then
                    v69("CoreScripts.TextChat.MessageStatus.Warning.TextFilterFailed", nil, "Roblox.MessageStatus.Warning.TextFilterFailed", v177.translator, v177.defaultSystemTextChannel);
                elseif v222.Status == Enum.TextChatMessageStatus.InvalidPrivacySettings then
                    v69("CoreScripts.TextChat.MessageStatus.Warning.InvalidPrivacySettings", nil, "Roblox.MessageStatus.Warning.InvalidPrivacySettings", v177.translator, v177.defaultSystemTextChannel);
                elseif v222.Status == Enum.TextChatMessageStatus.MessageTooLong then
                    v69("CoreScripts.TextChat.MessageStatus.Warning.MessageTooLong", nil, "Roblox.MessageStatus.Warning.MessageTooLong", v177.translator, v177.defaultSystemTextChannel);
                elseif v222.Status == Enum.TextChatMessageStatus.ModerationTimeout then
                    v69("CoreScripts.TextChat.MessageStatus.Warning.ModerationTimeout", nil, "Roblox.MessageStatus.Warning.ModerationTimeout", v177.translator, v177.defaultSystemTextChannel);
                elseif v222.Status == Enum.TextChatMessageStatus.Unknown then
                    v69("CoreScripts.TextChat.MessageStatus.Warning.Unknown", nil, "Roblox.MessageStatus.Warning.Unknown", v177.translator, v177.defaultSystemTextChannel);
                end;
                if v80(v94) then
                    l_Analytics_0:TelemetryLogEvent(v123, {
                        messageStatus = v222.Status.Name
                    }, {
                        "addOsInfo", 
                        "addSessionId", 
                        "addUniverseId", 
                        "addPlaceId"
                    });
                end;
                return;
            end;
        end);
    end;
    local function _(v226) --[[ Line: 843 ]] --[[ Name: watchTextChatCommand ]]
        -- upvalues: l_Analytics_0 (ref)
        v226.Triggered:Connect(function() --[[ Line: 844 ]]
            -- upvalues: l_Analytics_0 (ref), v226 (copy)
            l_Analytics_0.FireClientAnalyticsWithEventName("CommandSent", {
                commandName = v226.Name
            });
        end);
    end;
    for _, v229 in pairs(l_TextChatService_0:GetDescendants()) do
        if v229:IsA("TextChannel") then
            v225(v229);
        elseif v229:IsA("TextChatCommand") then
            v229.Triggered:Connect(function() --[[ Line: 844 ]]
                -- upvalues: l_Analytics_0 (ref), v229 (copy)
                l_Analytics_0.FireClientAnalyticsWithEventName("CommandSent", {
                    commandName = v229.Name
                });
            end);
        end;
    end;
    local v230 = false;
    local v231 = {};
    local function v234(v232) --[[ Line: 862 ]] --[[ Name: tryShowSummarySystemMessageOnChannel ]]
        -- upvalues: v230 (ref), v231 (copy), v69 (ref), v177 (ref), v71 (ref)
        if not v232 then
            return;
        elseif not v230 then
            return;
        elseif v231[v232.Name] then
            return;
        elseif v232.Name ~= "RBXGeneral" then
            return;
        else
            v231[v232.Name] = true;
            v69("CoreScripts.TextChat.ChatWindow.SummarySystemMessage", nil, "Roblox.Summary.Info", v177.translator, v232, "Roblox auto-generates summaries of players' messages.", function(v233) --[[ Line: 887 ]]
                -- upvalues: v71 (ref)
                return v71.wrapInSummaryMutedStyle((("%* %*"):format(v71.getSummaryIconPrefix(), v233)));
            end);
            return;
        end;
    end;
    l_TextChatService_0.DescendantAdded:Connect(function(v235) --[[ Line: 896 ]]
        -- upvalues: v225 (copy), v100 (ref), l_FFlagEnableSummarySystemMessageOnLua_0 (ref), v234 (copy), l_Analytics_0 (ref)
        if v235:IsA("TextChannel") then
            v225(v235);
            if v100 and l_FFlagEnableSummarySystemMessageOnLua_0 then
                v234(v235);
                return;
            end;
        elseif v235:IsA("TextChatCommand") then
            v235.Triggered:Connect(function() --[[ Line: 844 ]]
                -- upvalues: l_Analytics_0 (ref), v235 (copy)
                l_Analytics_0.FireClientAnalyticsWithEventName("CommandSent", {
                    commandName = v235.Name
                });
            end);
        end;
    end);
    l_TextChatService_0.DescendantRemoving:Connect(function(v236) --[[ Line: 907 ]]
        -- upvalues: v178 (copy), l_TextChannelRemoved_0 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v180 (copy)
        if v236:IsA("TextChannel") then
            v178:dispatch(l_TextChannelRemoved_0(v236));
            if l_FFlagExpChatUseChannelTabsStore_0 and v180 then
                v180.handleChannelRemoved(v236);
            end;
        end;
    end);
    if v100 then
        l_TextChatService_0.ChatActionReceived:Connect(function(v237) --[[ Line: 918 ]]
            -- upvalues: v34 (ref), v72 (ref), v205 (copy)
            v34:debug("Incoming ChatActionReceived ChatActionType: {}, Text: {}", v237.ChatActionType, v237.Text);
            if v237.ChatActionType == v72.Summary then
                v205(v237);
                return;
            else
                v34:error("Unknown ChatActionType: {}", v237.ChatActionType);
                return;
            end;
        end);
    end;
    if v100 then
        coroutine.wrap(function() --[[ Line: 934 ]]
            -- upvalues: l_RobloxReplicatedStorage_0 (ref), v34 (ref), l_LocalPlayer_0 (copy), l_FFlagEnableSummarySystemMessageOnLua_0 (ref), v230 (ref), l_TextChatService_0 (ref), v234 (copy)
            local v238 = l_RobloxReplicatedStorage_0:WaitForChild("ExpChatFeatureValueChanged", 10);
            if v238 then
                v238.OnClientEvent:Connect(function(v239, v240, v241) --[[ Line: 937 ]]
                    -- upvalues: v34 (ref), l_LocalPlayer_0 (ref), l_FFlagEnableSummarySystemMessageOnLua_0 (ref), v230 (ref), l_TextChatService_0 (ref), v234 (ref)
                    v34:debug("Incoming ExpChatFeatureValueChanged userId: {}, featureName: {}, featureValue: {}", v239, v240, v241);
                    if l_LocalPlayer_0 and v239 == l_LocalPlayer_0.UserId and l_FFlagEnableSummarySystemMessageOnLua_0 and v240 == "EligibleForThirdPartySummary" then
                        v230 = v241 == "true";
                        if v230 then
                            for _, v243 in l_TextChatService_0:GetDescendants() do
                                if v243:IsA("TextChannel") then
                                    v234(v243);
                                end;
                            end;
                        end;
                    end;
                end);
            end;
        end)();
    end;
    l_TextChatService_0.SendingMessage:Connect(function(v244) --[[ Line: 963 ]]
        -- upvalues: l_FFlagExpChatPerfTracking_0 (ref), v83 (ref), v34 (ref), l_LocalPlayer_0 (copy), v75 (ref), v69 (ref), v177 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v179 (copy), v178 (copy), v47 (ref), l_Analytics_0 (ref), l_countParticipantsInTextChannel_0 (ref)
        if l_FFlagExpChatPerfTracking_0 then
            v83.start(v83.Events.MessageSendToWindowRenderInterval, {
                messageId = v244.MessageId
            });
        end;
        v34:debug("Outgoing SendingMessage Status: {} Text: {}", v244.Status.Name, v244.Text);
        if l_LocalPlayer_0 then
            local v245 = v75(v244, l_LocalPlayer_0);
            if v245 and v245.key then
                v69(v245.key, v245.args, v245.metadata, v177.translator, v244.TextChannel);
            end;
        end;
        if l_FFlagExpChatUseMessagesStore_0 then
            v179.handleIncomingOrOutgoingMessage(v244, true);
        else
            v178:dispatch(v47(v244));
        end;
        local l_TextChannel_0 = v244.TextChannel;
        if l_TextChannel_0 then
            l_Analytics_0.FireClientAnalyticsWithEventName("MessageSent", {
                channelName = l_TextChannel_0.Name, 
                totalParticipants = l_countParticipantsInTextChannel_0(l_TextChannel_0)
            });
        end;
    end);
    local function _() --[[ Line: 999 ]] --[[ Name: connectSendingUniverseChatMessage ]]
        -- upvalues: l_GetFFlagTextChatEnableUniverseChatTabs_0 (ref), l_TextChatService_0 (ref), l_FFlagExpChatPerfTracking_0 (ref), v83 (ref), v34 (ref), l_LocalPlayer_0 (copy), v75 (ref), v69 (ref), v177 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v179 (copy), v178 (copy), v47 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v180 (copy), l_Analytics_0 (ref), l_countParticipantsInTextChannel_0 (ref)
        if not l_GetFFlagTextChatEnableUniverseChatTabs_0() then
            return;
        else
            l_TextChatService_0.SendingUniverseChatMessage:Connect(function(v247) --[[ Line: 1003 ]]
                -- upvalues: l_FFlagExpChatPerfTracking_0 (ref), v83 (ref), v34 (ref), l_LocalPlayer_0 (ref), v75 (ref), v69 (ref), v177 (ref), l_TextChatService_0 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v179 (ref), v178 (ref), v47 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v180 (ref), l_Analytics_0 (ref), l_countParticipantsInTextChannel_0 (ref)
                if l_FFlagExpChatPerfTracking_0 then
                    v83.start(v83.Events.MessageSendToWindowRenderInterval, {
                        messageId = v247.MessageId
                    });
                end;
                v34:debug("Outgoing SendingMessage Status: {} Text: {}", v247.Status.Name, v247.Text);
                if l_LocalPlayer_0 then
                    local v248 = v75(v247, l_LocalPlayer_0);
                    if v248 and v248.key then
                        v69(v248.key, v248.args, v248.metadata, v177.translator, v247.TextChannel);
                    end;
                end;
                local l_ChatInputBarConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
                local v250 = not (l_ChatInputBarConfiguration_0 and l_ChatInputBarConfiguration_0.TargetTextChannel) and "RBXGlobal" or nil;
                if l_FFlagExpChatUseMessagesStore_0 then
                    v179.handleIncomingOrOutgoingMessage(v247, true, v250);
                else
                    v178:dispatch(v47(v247, v250));
                end;
                if l_FFlagExpChatUseChannelTabsStore_0 and v180 then
                    v180.handleIncomingOrOutgoingMessage(v247, true, v250);
                end;
                local l_TextChannel_1 = v247.TextChannel;
                if l_TextChannel_1 then
                    l_Analytics_0.FireClientAnalyticsWithEventName("MessageSent", {
                        channelName = l_TextChannel_1.Name, 
                        totalParticipants = l_countParticipantsInTextChannel_0(l_TextChannel_1)
                    });
                end;
            end);
            return;
        end;
    end;
    if l_GetFFlagTextChatEnableUniverseChatTabs_0() then
        l_TextChatService_0.SendingUniverseChatMessage:Connect(function(v253) --[[ Line: 1003 ]]
            -- upvalues: l_FFlagExpChatPerfTracking_0 (ref), v83 (ref), v34 (ref), l_LocalPlayer_0 (copy), v75 (ref), v69 (ref), v177 (ref), l_TextChatService_0 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v179 (copy), v178 (copy), v47 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v180 (copy), l_Analytics_0 (ref), l_countParticipantsInTextChannel_0 (ref)
            if l_FFlagExpChatPerfTracking_0 then
                v83.start(v83.Events.MessageSendToWindowRenderInterval, {
                    messageId = v253.MessageId
                });
            end;
            v34:debug("Outgoing SendingMessage Status: {} Text: {}", v253.Status.Name, v253.Text);
            if l_LocalPlayer_0 then
                local v254 = v75(v253, l_LocalPlayer_0);
                if v254 and v254.key then
                    v69(v254.key, v254.args, v254.metadata, v177.translator, v253.TextChannel);
                end;
            end;
            local l_ChatInputBarConfiguration_1 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
            local v256 = not (l_ChatInputBarConfiguration_1 and l_ChatInputBarConfiguration_1.TargetTextChannel) and "RBXGlobal" or nil;
            if l_FFlagExpChatUseMessagesStore_0 then
                v179.handleIncomingOrOutgoingMessage(v253, true, v256);
            else
                v178:dispatch(v47(v253, v256));
            end;
            if l_FFlagExpChatUseChannelTabsStore_0 and v180 then
                v180.handleIncomingOrOutgoingMessage(v253, true, v256);
            end;
            local l_TextChannel_2 = v253.TextChannel;
            if l_TextChannel_2 then
                l_Analytics_0.FireClientAnalyticsWithEventName("MessageSent", {
                    channelName = l_TextChannel_2.Name, 
                    totalParticipants = l_countParticipantsInTextChannel_0(l_TextChannel_2)
                });
            end;
        end);
    end;
    local function _(v258) --[[ Line: 1053 ]] --[[ Name: isInstanceALocalTextChannelParticipant ]]
        -- upvalues: l_Players_0 (ref)
        return v258 and v258:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v258.UserId;
    end;
    local function _(v260) --[[ Line: 1060 ]] --[[ Name: getChannelTabIndex ]]
        if v260 == "RBXGeneral" then
            return 1;
        elseif v260 == "RBXGlobal" then
            return 2;
        else
            return 3;
        end;
    end;
    if v87() then
        local l_ChannelTabsConfiguration_1 = l_TextChatService_0:FindFirstChildOfClass("ChannelTabsConfiguration");
        local v263 = if l_ChannelTabsConfiguration_1 then l_ChannelTabsConfiguration_1.Enabled else false;
        local v264 = l_GetFFlagTextChatEnableUniverseChatTabs_0() and not v263;
        for _, v266 in pairs(l_TextChatService_0:GetDescendants()) do
            if v266.Parent and v266.Parent:IsA("TextChannel") and v266 and v266:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v266.UserId then
                v178:dispatch(v64(v266.Parent));
                if l_FFlagExpChatUseChannelTabsStore_0 and v180 then
                    local l_Name_0 = v266.Parent.Name;
                    if l_Name_0 ~= "RBXSystem" and (not v264 or l_Name_0 == "RBXGeneral") then
                        local v268 = l_Name_0 == "RBXGeneral" and 1 or 2;
                        if l_GetFFlagTextChatEnableUniverseChatTabs_0() then
                            v268 = l_Name_0 == "RBXGeneral" and 1 or l_Name_0 == "RBXGlobal" and 2 or 3;
                        end;
                        v180.addChannelTab(l_Name_0, v268);
                    end;
                end;
            end;
            if v266:IsA("TextChannel") then
                v266.DescendantRemoving:Connect(function(v269) --[[ Line: 1100 ]]
                    -- upvalues: l_Players_0 (ref), v178 (copy), l_LocalTextChannelParticipantRemoved_0 (ref), v266 (copy), l_FFlagExpChatUseChannelTabsStore_0 (ref), v180 (copy)
                    if v269 and v269:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v269.UserId then
                        v178:dispatch(l_LocalTextChannelParticipantRemoved_0(v266));
                        if l_FFlagExpChatUseChannelTabsStore_0 and v180 then
                            local l_Name_1 = v266.Name;
                            v180.removeChannelTab(l_Name_1);
                        end;
                    end;
                end);
            end;
        end;
        local l_v264_0 = v264 --[[ copy: 20 -> 43 ]];
        l_TextChatService_0.DescendantAdded:Connect(function(v272) --[[ Line: 1114 ]]
            -- upvalues: l_Players_0 (ref), v178 (copy), v64 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v180 (copy), l_v264_0 (copy), l_GetFFlagTextChatEnableUniverseChatTabs_0 (ref), l_LocalTextChannelParticipantRemoved_0 (ref)
            if v272.Parent and v272.Parent:IsA("TextChannel") and v272 and v272:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v272.UserId then
                v178:dispatch(v64(v272.Parent));
                if l_FFlagExpChatUseChannelTabsStore_0 and v180 then
                    local l_Name_2 = v272.Parent.Name;
                    if l_Name_2 ~= "RBXSystem" and (not l_v264_0 or l_Name_2 == "RBXGeneral") then
                        local v274 = l_Name_2 == "RBXGeneral" and 1 or 2;
                        if l_GetFFlagTextChatEnableUniverseChatTabs_0() then
                            v274 = l_Name_2 == "RBXGeneral" and 1 or l_Name_2 == "RBXGlobal" and 2 or 3;
                        end;
                        v180.addChannelTab(l_Name_2, v274);
                    end;
                end;
            end;
            if v272:IsA("TextChannel") then
                v272.DescendantRemoving:Connect(function(v275) --[[ Line: 1139 ]]
                    -- upvalues: l_Players_0 (ref), v178 (ref), l_LocalTextChannelParticipantRemoved_0 (ref), v272 (copy), l_FFlagExpChatUseChannelTabsStore_0 (ref), v180 (ref)
                    if v275 and v275:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v275.UserId then
                        v178:dispatch(l_LocalTextChannelParticipantRemoved_0(v272));
                        if l_FFlagExpChatUseChannelTabsStore_0 and v180 then
                            local l_Name_3 = v272.Name;
                            v180.removeChannelTab(l_Name_3);
                        end;
                    end;
                end);
            end;
        end);
    end;
    if l_GetFFlagTextChatEnableUniverseChatTabs_0() then
        local v277 = {};
        local l_v277_0 = v277 --[[ copy: 18 -> 42 ]];
        local function v291(v279) --[[ Line: 1158 ]] --[[ Name: handleUniverseChatChannelAllocated ]]
            -- upvalues: l_v277_0 (copy), l_TextChatService_0 (ref), v178 (copy), v68 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v180 (copy), l_GetFFlagEnableExpChatUniverseChatTabNames_0 (ref), v177 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v179 (copy), v45 (ref)
            if l_v277_0[v279] then
                return;
            else
                l_v277_0[v279] = true;
                local l_ChatWindowConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
                local l_ChatInputBarConfiguration_2 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
                local v282 = not l_ChatWindowConfiguration_0 or l_ChatWindowConfiguration_0.Enabled ~= false;
                local v283 = not l_ChatInputBarConfiguration_2 or l_ChatInputBarConfiguration_2.Enabled ~= false;
                if not v282 or not v283 then
                    return;
                else
                    local v284 = "";
                    if v279 == "global" then
                        v284 = "RBXGlobal";
                    end;
                    local l_v178_0 = v178;
                    local l_v68_0 = v68;
                    local l_v284_0 = v284;
                    local l_v284_1 = v284;
                    l_v178_0:dispatch(l_v68_0(l_v284_0, l_v284_1 == "RBXGeneral" and 1 or l_v284_1 == "RBXGlobal" and 2 or 3));
                    if l_FFlagExpChatUseChannelTabsStore_0 and v180 then
                        l_v178_0 = v180.addChannelTab;
                        local l_v284_2 = v284;
                        l_v284_0 = v284;
                        l_v178_0(l_v284_2, l_v284_0 == "RBXGeneral" and 1 or l_v284_0 == "RBXGlobal" and 2 or 3);
                    end;
                    if l_GetFFlagEnableExpChatUniverseChatTabNames_0() and v284 ~= "" then
                        local v290;
                        l_v178_0, v290 = pcall(function() --[[ Line: 1185 ]]
                            -- upvalues: v177 (ref)
                            return v177.translator:FormatByKey("CoreScripts.TextChat.ChatWindow.ChatEnabled.Global2");
                        end);
                        if l_v178_0 and v290 and v290 ~= "" then
                            if l_FFlagExpChatUseMessagesStore_0 and v179 then
                                v179.addSystemMessage(v290, v284);
                                if l_FFlagExpChatUseChannelTabsStore_0 and v180 then
                                    v180.markChannelUnread(v284);
                                    return;
                                end;
                            else
                                v178:dispatch(v45(v290, v284));
                            end;
                        end;
                    end;
                    return;
                end;
            end;
        end;
        if l_TextChatService_0:HasAllocatedUniverseChatContext("global") then
            v291("global");
        end;
        l_TextChatService_0.UniverseChatChannelAllocated:Connect(v291);
        l_TextChatService_0.UniverseChatMessageReceived:Connect(function(v292) --[[ Line: 1215 ]]
            -- upvalues: l_GetFFlagExpChatGlobalMuteCommandEnabled_0 (ref), v128 (ref), v27 (ref), l_LocalPlayer_0 (copy), v205 (copy)
            if l_GetFFlagExpChatGlobalMuteCommandEnabled_0() and v128(v292, v27(false), l_LocalPlayer_0 and l_LocalPlayer_0.UserId) then
                return;
            else
                v205(v292, "RBXGlobal");
                return;
            end;
        end);
    end;
    local function v302(v293, v294, v295) --[[ Line: 1231 ]] --[[ Name: runOnBubbleDisplayed ]]
        -- upvalues: l_Players_0 (ref), l_HttpService_0 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v179 (copy), v178 (copy), v46 (ref)
        local v296 = nil;
        if v293:IsA("Model") then
            v296 = l_Players_0:GetPlayerFromCharacter(v293);
        end;
        local v297 = l_HttpService_0:GenerateGUID(false);
        local v298 = nil;
        local v299 = nil;
        if v295 then
            v297 = v295.MessageId;
            v298 = v295.BubbleChatMessageProperties;
            v299 = v295.Translation;
        end;
        local v300 = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000);
        local v301 = {
            message = v294, 
            translation = v299, 
            bubbleChatMessageId = v297, 
            bubbleChatMessageUserId = v296 and tostring(v296.UserId) or nil, 
            partOrModel = v293, 
            timestamp = v300, 
            bubbleChatMessageProperties = v298
        };
        if l_FFlagExpChatUseMessagesStore_0 then
            v179.handleIncomingBubbleChatMessage(v301);
            return;
        else
            v178:dispatch(v46(v301));
            return;
        end;
    end;
    l_Chat_0.Chatted:Connect(function(v303, v304) --[[ Line: 1264 ]]
        -- upvalues: l_TextChatService_0 (ref), l_Chat_0 (ref), v302 (copy)
        if l_TextChatService_0.ChatVersion ~= Enum.ChatVersion.LegacyChatService or l_Chat_0.BubbleChatEnabled then
            v302(v303, v304);
        end;
    end);
    local function v306() --[[ Line: 1271 ]]
        -- upvalues: l_Chat_0 (ref), v178 (copy), v62 (ref)
        local l_BubbleChatEnabled_0 = l_Chat_0.BubbleChatEnabled;
        v178:dispatch(v62("Enabled", l_BubbleChatEnabled_0));
    end;
    l_Chat_0:GetPropertyChangedSignal("BubbleChatEnabled"):Connect(v306);
    local l_BubbleChatEnabled_1 = l_Chat_0.BubbleChatEnabled;
    v178:dispatch(v62("Enabled", l_BubbleChatEnabled_1));
    l_Chat_0.BubbleChatSettingsChanged:Connect(function(v308) --[[ Line: 1280 ]]
        -- upvalues: v177 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v181 (copy), v178 (copy), v63 (ref)
        if v177.validateLegacyBubbleChatSettings then
            local v309, v310 = v177.validateLegacyBubbleChatSettings(v308);
            assert(v309, "Bad settings object passed to Chat:SetBubbleChatSettings:\n inside consolidated BubbleChat " .. (v310 or ""));
            if l_FFlagExpChatUseMessagesStore_0 and v181 then
                v181.setBubbleChatSettings(v308);
                return;
            else
                v178:dispatch(v63(v308));
            end;
        end;
    end);
    if v85() then
        l_TextChatService_0.BubbleDisplayed:Connect(function(v311, v312) --[[ Line: 1298 ]]
            -- upvalues: l_FFlagExpChatDisableUniverseBubbleChat_0 (ref), l_GetFFlagTextChatEnableUniverseChatTabs_0 (ref), v302 (copy)
            if l_FFlagExpChatDisableUniverseBubbleChat_0 and l_GetFFlagTextChatEnableUniverseChatTabs_0() and v312 and v312.TextChannel == nil then
                return;
            else
                v302(v311, v312 and v312.Text, v312);
                return;
            end;
        end);
    end;
    l_BubbleChatEnabled_1 = function(v313) --[[ Line: 1311 ]] --[[ Name: findCommandInstance ]]
        -- upvalues: l_TextChatService_0 (ref)
        for _, v315 in ipairs(l_TextChatService_0:GetDescendants()) do
            if v315.Name == v313 and v315:IsA("TextChatCommand") then
                return v315;
            end;
        end;
        return nil;
    end;
    local v316 = {};
    local function v324() --[[ Line: 1322 ]] --[[ Name: setupTextChatCommands ]]
        -- upvalues: l_Commands_0 (ref), l_BubbleChatEnabled_1 (copy), v316 (copy), l_FFlagExpChatUseMessagesStore_0 (ref), v178 (copy), l_context_0 (ref), v69 (ref), v177 (ref), l_CommandAliasChanged_0 (ref)
        for _, v318 in ipairs(l_Commands_0.enabledCommands) do
            if v318.clientRun then
                local v319 = l_BubbleChatEnabled_1(v318.name);
                if v319 and not v316[v319] then
                    v316[v319] = true;
                    v319.Triggered:Connect(function(v320, ...) --[[ Line: 1333 ]]
                        -- upvalues: l_FFlagExpChatUseMessagesStore_0 (ref), v318 (copy), v178 (ref), l_context_0 (ref), v69 (ref), v177 (ref)
                        local v321 = nil;
                        v321 = if l_FFlagExpChatUseMessagesStore_0 then v318.clientRun(v178, v320.UserId, ..., l_context_0) else v318.clientRun(v178, v320.UserId, ...);
                        if v321 then
                            v69(v321.key, v321.args, v321.metadata, v177.translator, v177.defaultSystemTextChannel);
                        end;
                    end);
                    if string.find(v319.Name, "RBXTeamCommand") or string.find(v319.Name, "RBXWhisperCommand") then
                        for _, v323 in {
                            "PrimaryAlias", 
                            "SecondaryAlias"
                        } do
                            v319:GetPropertyChangedSignal(v323):Connect(function() --[[ Line: 1356 ]]
                                -- upvalues: v178 (ref), l_CommandAliasChanged_0 (ref), v319 (copy)
                                v178:dispatch(l_CommandAliasChanged_0(v319.Name, v319.PrimaryAlias, v319.SecondaryAlias));
                            end);
                        end;
                    end;
                end;
            end;
        end;
    end;
    v324();
    l_Chat_0:GetPropertyChangedSignal("IsAutoMigrated"):Once(v324);
    if v177.canUserChatAsync and l_Players_0.LocalPlayer then
        v10.try(function() --[[ Line: 1376 ]]
            -- upvalues: v177 (ref), l_Players_0 (ref)
            return v177.canUserChatAsync(l_Players_0.LocalPlayer.UserId);
        end):andThen(function(v325) --[[ Line: 1379 ]]
            -- upvalues: l_FFlagExpChatUseMessagesStore_0 (ref), v179 (copy), v178 (copy), v57 (ref)
            if l_FFlagExpChatUseMessagesStore_0 then
                v179.setCanLocalUserChat(v325);
                return;
            else
                v178:dispatch(v57(v325));
                return;
            end;
        end):catch(function() --[[ Line: 1386 ]]
            -- upvalues: l_FFlagExpChatUseMessagesStore_0 (ref), v179 (copy), v178 (copy), v58 (ref)
            if l_FFlagExpChatUseMessagesStore_0 then
                v179.setCanLocalUserChat(false);
                return;
            else
                v178:dispatch(v58());
                return;
            end;
        end);
    end;
    v171(v177, v178, v179);
    local l_AppStyleProvider_0 = v12.App.Style.AppStyleProvider;
    local l_Constants_0 = v12.App.Style.Constants;
    local l_Dark_0 = l_Constants_0.ThemeName.Dark;
    local l_Gotham_0 = l_Constants_0.FontName.Gotham;
    local v330 = {
        Dark = {
            themeName = l_Dark_0, 
            fontName = l_Gotham_0
        }
    };
    local v331 = v11.createElement(l_AppStyleProvider_0, {
        style = v330.Dark
    }, {
        app = v11.createElement(v33, {
            store = v178, 
            translator = v177.translator, 
            gameTranslator = if v87() then v177.gameTranslator else nil, 
            isChatWindowVisible = true, 
            isChatInputBarVisible = true, 
            isChannelBarVisible = false, 
            isDefaultChatEnabled = true, 
            getIconVoiceIndicator = v177.getIconVoiceIndicator, 
            onClickedVoiceIndicator = v177.onClickedVoiceIndicator, 
            onClickedCameraIndicator = v177.onClickedCameraIndicator, 
            selfViewListenerChanged = v177.selfViewListenerChanged, 
            getPermissions = v177.getPermissions, 
            displayCameraDeniedToast = v177.displayCameraDeniedToast, 
            isCamEnabledForUserAndPlace = v177.isCamEnabledForUserAndPlace, 
            isCameraOnlyUser = v177.isCameraOnlyUser, 
            isVoiceServiceInitialized = v177.isVoiceServiceInitialized, 
            onClickedLikelySpeakingBubble = v177.onClickedLikelySpeakingBubble, 
            isSpatialUIEnabled = v177.isSpatialUIEnabled, 
            expChatLoadStartTime = if v90() then os.clock() else nil
        })
    });
    v178:dispatch(l_ClientAppLoaded_0({
        team = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.Team, 
        isChatCoreGuiEnabled = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Chat), 
        isTouchEnabled = l_UserInputService_0.TouchEnabled, 
        isGamepadEnabled = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Gamepad
    }));
    v130(l_Analytics_0, l_Version_0[1]);
    v34:trace("Roact.mount to {}", (tostring(v177.parent)));
    local v332 = v11.mount(v331, v177.parent, "ExperienceChat");
    local function v334(v333) --[[ Line: 1446 ]] --[[ Name: updateChatStatus ]]
        -- upvalues: v182 (copy), v77 (ref), v69 (ref), v95 (ref), v177 (ref), v40 (ref), l_GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled_0 (ref), v185 (ref), l_FIntMaxExpChatUnlockChatButtonImpressionsCount_0 (ref), v79 (ref), l_FFlagConnectionsToFriendsRename_0 (ref)
        v182.setChatStatus(v333);
        if v333 == "GeoBlocked" or v333 ~= "Unknown" and v77() then
            v69(v95 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionIsntAvailable" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionUnavailable", nil, "Roblox.ChatDisabled.Info", v177.translator, v177.defaultSystemTextChannel, v95 and "You can only view system messages here. Chat isn\226\128\153t available in your region." or "You can only view system messages here. Chat is not available in your region.");
            return;
        elseif v333 == "AgeCheckGateExperiment" then
            v69("CoreScripts.TextChat.ChatWindow.ChatDisabled.CheckAgeInAccountInfo", nil, "Roblox.ChatDisabled.Info", v177.translator, v177.defaultSystemTextChannel, "You can only view system messages here. Unlock chat with an age check at Settings > Account info.");
            return;
        elseif v333 == "SettingsDisabled" then
            v69(v95 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.DontMissMessagesUpdateCommsSettings" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.SettingOff", nil, "Roblox.ChatDisabled.Info", v177.translator, v177.defaultSystemTextChannel, v95 and "You can only view system messages here. Update your communication settings to turn on chat." or "You can only view system messages here. Update your Communication settings to turn on chat.");
            return;
        elseif v333 == "SettingsDisabledVpc" then
            v69("CoreScripts.TextChat.ChatWindow.ChatDisabled.AskForPermission", nil, "Roblox.ChatDisabled.Info", v177.translator, v177.defaultSystemTextChannel, "You can only view system messages here. Ask your parent for permission to chat in Communication settings.");
            return;
        elseif v333 == "AgeCheckVpc" then
            v69("CoreScripts.TextChat.ChatWindow.ChatDisabled.AskForPermissionToAgeCheck", nil, "Roblox.ChatDisabled.Info", v177.translator, v177.defaultSystemTextChannel, "You can only view system messages here. Ask your parent for permission to age check in Communication settings.");
            return;
        elseif not v40() and v333 == "AgeVerificationRequired" or v333 == "IdVerificationRequired" then
            v69(v95 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.GetAnAgeCheckInCommsSetting" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.CheckAgeInSettings", nil, "Roblox.ChatDisabled.Info", v177.translator, v177.defaultSystemTextChannel, v95 and "Don\226\128\153t miss messages. Unlock chat with an age check in your communication settings." or "You can only view system messages here. To chat, get an age check in your Communication settings.");
            return;
        elseif v333 == "AgeVerificationRequired" then
            if l_GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled_0() and l_FIntMaxExpChatUnlockChatButtonImpressionsCount_0 < v185 then
                v69("CoreScripts.TextChat.ChatWindow.ChatDisabled.GetAnAgeCheckInCommsSetting", nil, "Roblox.ChatDisabled.Info", v177.translator, v177.defaultSystemTextChannel, "Don\226\128\153t miss messages. Unlock chat with an age check in your communication settings.");
                return;
            else
                v69(v95 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.DontMissMessages" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.GetAnAgeCheck", nil, "Roblox.ChatDisabled.Info", v177.translator, v177.defaultSystemTextChannel, v95 and "Don\226\128\153t miss messages. Unlock chat with an age check." or "You can only view system messages here. Get an age check to chat.");
                return;
            end;
        elseif v333 == "EnabledBubble" or v333 == "Enabled" and v79() then
            v69("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatInRegion", nil, "Roblox.ChatEnabled.Info", v177.translator, v177.defaultSystemTextChannel, "You can view system messages and chat with users in your region only.");
            return;
        elseif v333 == "Enabled" then
            v69(l_FFlagConnectionsToFriendsRename_0 and "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAAndTF" or "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAndTC", nil, "Roblox.ChatEnabled.Info", v177.translator, v177.defaultSystemTextChannel, "Only people in similar age groups and your Trusted Connections can chat with you.");
            return;
        else
            if v333 == "AllUsers" or v333 == "NoOne" then
                if getChatTranslationEnabled() then
                    v69("CoreScripts.TextChat.ChatTranslation.ChatWindow.SystemMessageNew", nil, "Roblox.ChatTranslation.ChatWindow.SystemMessage", v177.translator, v177.defaultSystemTextChannel, "Roblox automatically translates supported languages in chat");
                    return;
                end;
            elseif v333 == "Ineligible" or v333 ~= "Unknown" then
                v69("CoreScripts.TextChat.ChatWindow.ChatDisabled.OnlyViewSystemMessages", nil, "Roblox.ChatDisabled.Info", v177.translator, v177.defaultSystemTextChannel, "You can only view system messages here.");
            end;
            return;
        end;
    end;
    local v335 = l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatNewHiddenMessagesSystemMessageNudgeEnabled() and 0 or nil;
    local v336 = if l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatNewHiddenMessagesSystemMessageNudgeEnabled() then math.random(v96, v97) else nil;
    local function v338(v337) --[[ Line: 1620 ]] --[[ Name: handleUserMessageIntentSent ]]
        -- upvalues: v34 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v179 (copy), v178 (copy), v66 (ref), l_ExpChatNewHiddenMessagesExperimentation_0 (ref), v78 (ref), l_LocalPlayer_0 (copy), v335 (ref), v336 (ref), v96 (ref), v97 (ref), v69 (ref), v177 (ref), v22 (ref)
        v34:debug("Handling a message from UserMessageIntentSent");
        if l_FFlagExpChatUseMessagesStore_0 then
            v179.handleHiddenMessageReceived(v337);
        else
            v178:dispatch(v66(v337));
        end;
        if l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatNewHiddenMessagesSystemMessageNudgeEnabled() and not v78(l_LocalPlayer_0.ChatAvailabilityStatus) then
            v335 = v335 + 1;
            if v335 == v336 then
                v336 = v336 + math.random(v96, v97);
                v69("CoreScripts.TextChat.ChatWindow.ChatDisabled.DontMissMessages", nil, "Roblox.ChatDisabled.Info", v177.translator, v177.defaultSystemTextChannel, "Don\226\128\153t miss messages. Unlock chat with an age check.");
            end;
        end;
        v22(false).resetTextTransparency();
    end;
    local function _() --[[ Line: 1654 ]] --[[ Name: shouldConnectToUserMessageIntentSent ]]
        -- upvalues: v98 (ref), v81 (ref), v101 (ref), v82 (ref), l_GetFFlagExpChatUserMessageIntentSentCooldown_0 (ref), v185 (ref), v102 (ref)
        local v339 = v98 and v81();
        local v340 = v101 and v82();
        if l_GetFFlagExpChatUserMessageIntentSentCooldown_0() then
            return v340 or v339 and v185 <= v102;
        else
            return v339 or v340;
        end;
    end;
    if v91 and l_LocalPlayer_0 then
        if l_FFlagEnableModerateChatRemoteEvent_0 then
            local v342 = v73();
            local v343 = v26(false);
            local v344 = false;
            local l_v343_0 = v343 --[[ copy: 36 -> 40 ]];
            local l_v342_0 = v342 --[[ copy: 35 -> 41 ]];
            do
                local l_v344_0 = v344;
                v177.moderateChatStoreDisposeEffect = v18.createEffect(function(v348) --[[ Line: 1673 ]]
                    -- upvalues: l_v343_0 (copy), l_v344_0 (ref), v69 (ref), v177 (ref), v16 (ref), v12 (ref), l_v342_0 (copy), l_FFlagConnectionsToFriendsRename_0 (ref)
                    local v349 = l_v343_0.getIsSettingEnabled(v348);
                    if v349 ~= l_v344_0 then
                        if v349 then
                            v69("CoreScripts.TextChat.MessageStatus.Warning.ModerateChatOn", nil, "Roblox.MessageStatus.Warning.ModerateChatOn", v177.translator, v177.defaultSystemTextChannel);
                            v16.SetUIBloxToast({
                                iconImage = v12.App.ImageSet.Images[l_v342_0.icon.off], 
                                toastSubtitle = v177.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOn.Subtitle"), 
                                toastTitle = v177.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOn.Title")
                            });
                        else
                            v69("CoreScripts.TextChat.MessageStatus.Warning.ModerateChatOff", nil, "Roblox.MessageStatus.Warning.ModerateChatOff", v177.translator, v177.defaultSystemTextChannel);
                            v16.SetUIBloxToast({
                                iconImage = v12.App.ImageSet.Images[l_v342_0.icon.off], 
                                toastSubtitle = v177.translator:FormatByKey(l_FFlagConnectionsToFriendsRename_0 and "CoreScripts.TextChat.Toast.ModerateChatOff.Subtitle.FriendsRename" or "CoreScripts.TextChat.Toast.ModerateChatOff.Subtitle"), 
                                toastTitle = v177.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOff.Title")
                            });
                        end;
                        l_v344_0 = v349;
                    end;
                end);
            end;
        end;
        local l_ChatAvailabilityStatus_0 = l_LocalPlayer_0.ChatAvailabilityStatus;
        v34:debug("Local player's initial ChatAvailabilityStatus is {}", l_ChatAvailabilityStatus_0);
        v334(l_ChatAvailabilityStatus_0);
        local v351 = nil;
        local v352 = v98 and v81();
        local v353 = v101 and v82();
        if if l_GetFFlagExpChatUserMessageIntentSentCooldown_0() then v353 or v352 and v185 <= v102 else v352 or v353 then
            l_ExpChatNewHiddenMessagesExperimentation_0.logExposure();
            v34:debug("Connecting to UserMessageIntentSent");
            v351 = l_TextChatService_0.UserMessageIntentSent:Connect(v338);
        end;
        do
            local l_l_ChatAvailabilityStatus_0_0, l_v351_0 = l_ChatAvailabilityStatus_0, v351;
            l_LocalPlayer_0:GetPropertyChangedSignal("ChatAvailabilityStatus"):Connect(function() --[[ Line: 1737 ]]
                -- upvalues: l_l_ChatAvailabilityStatus_0_0 (ref), l_LocalPlayer_0 (copy), v34 (ref), v334 (copy), v98 (ref), v81 (ref), v101 (ref), v82 (ref), l_GetFFlagExpChatUserMessageIntentSentCooldown_0 (ref), v185 (ref), v102 (ref), l_v351_0 (ref), l_ExpChatNewHiddenMessagesExperimentation_0 (ref), l_TextChatService_0 (ref), v338 (copy), v78 (ref), v99 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v179 (copy), v178 (copy), v67 (ref), v22 (ref), v57 (ref)
                l_l_ChatAvailabilityStatus_0_0 = l_LocalPlayer_0.ChatAvailabilityStatus;
                v34:debug("Local player's ChatAvailabilityStatus has changed to {}", l_l_ChatAvailabilityStatus_0_0);
                v334(l_l_ChatAvailabilityStatus_0_0);
                local v356 = v98 and v81();
                local v357 = v101 and v82();
                if (if l_GetFFlagExpChatUserMessageIntentSentCooldown_0() then v357 or v356 and v185 <= v102 else v356 or v357) and not l_v351_0 then
                    l_ExpChatNewHiddenMessagesExperimentation_0.logExposure();
                    v34:debug("Connecting to UserMessageIntentSent");
                    l_v351_0 = l_TextChatService_0.UserMessageIntentSent:Connect(v338);
                end;
                if v98 and v78(l_l_ChatAvailabilityStatus_0_0) and l_v351_0 and (not v101 or not v82()) then
                    v34:debug("Disconnecting from UserMessageIntentSent");
                    l_v351_0:Disconnect();
                    if v99 then
                        if l_FFlagExpChatUseMessagesStore_0 then
                            v179.handleHiddenMessagesCleared();
                        else
                            v178:dispatch(v67());
                        end;
                        v22(false).resetTextTransparency();
                    end;
                end;
                if l_FFlagExpChatUseMessagesStore_0 then
                    v179.setCanLocalUserChat(v78(l_l_ChatAvailabilityStatus_0_0));
                    return;
                else
                    v178:dispatch(v57(v78(l_l_ChatAvailabilityStatus_0_0)));
                    return;
                end;
            end);
        end;
    elseif v77() then
        v69(v95 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionIsntAvailable" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionUnavailable", nil, "Roblox.ChatDisabled.Info", v177.translator, v177.defaultSystemTextChannel, if v91 then v95 and "You can only view system messages here. Chat isn\226\128\153t available in your region." or "You can only view system messages here. Chat is currently unavailable in your region." else "Chat is unavailable in your region. You can still receive system messages.");
    elseif not v91 and getChatTranslationEnabled() then
        v69("CoreScripts.TextChat.ChatTranslation.ChatWindow.SystemMessageNew", nil, "Roblox.ChatTranslation.ChatWindow.SystemMessage", v177.translator, v177.defaultSystemTextChannel, "Roblox automatically translates supported languages in chat");
    end;
    return {
        roactInstance = v332
    };
end;