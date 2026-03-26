local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Chat_0 = game:GetService("Chat");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v9 = require(l_Parent_0.Promise);
local v10 = require(l_Parent_0.Roact);
local v11 = require(l_Parent_0.UIBlox);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v13 = require(l_Parent_0.ExpChatShared);
local l_LocalStorageKey_0 = require(l_Parent_0.LocalStorage).Enums.LocalStorageKey;
local v15 = require(l_Parent_0.NotificationModalsManager);
local v16 = require(l_Parent_0.SharedFlags);
local v17 = require(l_Parent_0.Signals);
local v18 = require(l_script_FirstAncestor_0.Stores.GetAdorneeStore);
local v19 = require(l_script_FirstAncestor_0.Stores.GetMessagesStore);
local v20 = require(l_script_FirstAncestor_0.Stores.GetChannelTabsStore);
local v21 = require(l_script_FirstAncestor_0.Stores.GetTransparencyStore);
local v22 = require(l_script_FirstAncestor_0.Stores.GetCharacterStore);
local v23 = require(l_script_FirstAncestor_0.Stores.GetChatConfigurationStore);
local v24 = require(l_script_FirstAncestor_0.Stores.GetChatStatusStore);
local v25 = require(l_script_FirstAncestor_0.Stores.GetChatModerationStore);
local l_FFlagConnectionsToFriendsRename_0 = v16.FFlagConnectionsToFriendsRename;
local l_FFlagExpChatUseProximityStore_0 = v16.FFlagExpChatUseProximityStore;
local v28 = if l_FFlagExpChatUseProximityStore_0 then require(l_script_FirstAncestor_0.Stores.GetProximityStore) else nil;
local l_Analytics_0 = v13.Analytics;
local l_countParticipantsInTextChannel_0 = v13.countParticipantsInTextChannel;
local v31 = require(script.Parent.App);
local v32 = v13.Logger:new("ExpChat/" .. script.Name);
local v33 = require(script.Parent.createDispatchBindableEvent);
local v34 = require(l_script_FirstAncestor_0.Events.bindableEventQueue);
local v35 = require(script.Parent.createStore);
local v36 = require(script.Parent.GetNameColor);
local v37 = require(script.Parent.reportMessageReceived);
local v38 = require(script.Parent.canPlatformEnableChat);
local l_watchForErrors_0 = v13.watchForErrors;
local l_Commands_0 = v13.Commands;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v42 = require(l_Actions_0.IncomingMessageReceived);
local v43 = require(l_Actions_0.IncomingBubbleChatMessageReceived);
local v44 = require(l_Actions_0.OutgoingMessageSent);
local l_TextChannelCreated_0 = v13.Actions.TextChannelCreated;
local l_TextChannelRemoved_0 = v13.Actions.TextChannelRemoved;
local l_PlayerAdded_0 = v13.Actions.PlayerAdded;
local l_PlayerRemoved_0 = v13.Actions.PlayerRemoved;
local l_CharacterAdded_0 = v13.Actions.CharacterAdded;
local l_LocalCharacterLoaded_0 = v13.Actions.LocalCharacterLoaded;
local l_LocalTeamChanged_0 = v13.Actions.LocalTeamChanged;
local l_ClientAppLoaded_0 = v13.Actions.ClientAppLoaded;
local v53 = require(l_Actions_0.LastInputTypeChanged);
local v54 = require(l_Actions_0.ChatPrivacySettingsReceived);
local v55 = require(l_Actions_0.ChatPrivacySettingsFetchFailed);
local l_CommandAliasChanged_0 = v13.Actions.CommandAliasChanged;
local v57 = require(l_Actions_0.HumanoidDied);
local v58 = require(l_Actions_0.AdorneeAdded);
local v59 = require(l_Actions_0.LegacyBubbleChatEnabledChanged);
local v60 = require(l_Actions_0.LegacyBubbleChatSettingsChanged);
local v61 = require(l_Actions_0.LocalTextChannelParticipantAdded);
local l_LocalTextChannelParticipantRemoved_0 = v13.Actions.LocalTextChannelParticipantRemoved;
local v63 = require(l_Actions_0.HiddenMessageReceived);
local v64 = require(l_Actions_0.HiddenMessagesCleared);
local v65 = require(l_script_FirstAncestor_0.displaySystemMessage);
local v66 = require(l_script_FirstAncestor_0.getExperienceChatVisualConfig);
local v67 = require(l_script_FirstAncestor_0.getOtherDisplayNameInWhisperChannel);
local v68 = require(l_script_FirstAncestor_0.handleChannelWelcomeMessage);
local v69 = require(l_script_FirstAncestor_0.isPlayerVerified);
local v70 = require(l_script_FirstAncestor_0.isChatRegionLocked);
local v71 = require(l_script_FirstAncestor_0.isUserChatEnabled);
local v72 = require(l_script_FirstAncestor_0.canOnlyChatInRegion);
local v73 = require(l_script_FirstAncestor_0.shouldSendHighFrequencyTelemetry);
local v74 = require(l_script_FirstAncestor_0.shouldShowFOMOUpsell);
local v75 = require(l_script_FirstAncestor_0.shouldShowCrossAgeChatActivity);
local v76 = require(l_script_FirstAncestor_0.Telemetry.ExpChatPerfTracker);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v78 = require(l_Flags_0.getEngineFeatureFlagEnableDisplayBubble);
local v79 = require(l_Flags_0.getFFlagUnreduxLastInputTypeChanged);
local v80 = require(l_Flags_0.getFFlagExpChatEnableChannelTabsUI);
local v81 = require(l_Flags_0.getFFlagExpChatMoveWhisperWelcome);
local v82 = require(l_Flags_0.getFFlagExpChatOverridePrefixNameColor);
local l_getFFlagUseCharacterStore_0 = v13.Flags.getFFlagUseCharacterStore;
local v84 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatTelemetryEventTrigger);
local v85 = require(l_Flags_0.FFlagAEGIS2EnableGatesForExpChat);
local v86 = game:DefineFastFlag("ExpChatShowBubblesOnMeshParts", false);
local v87 = game:DefineFastFlag("ExpChatMigrateMessageResponse", false);
local v88 = game:DefineFastInt("ExpChatMessageResponseThrottlePermyriad", 0);
local v89 = game:DefineFastInt("ExpChatMessageResponseUserSamplePermyriad", 0);
local v90 = game:DefineFastFlag("ExpChatEnableNewFOMOSystemMessages", false);
local v91 = game:DefineFastInt("ExpChatHiddenMessagesPromptThresholdLowerBound", 10);
local v92 = game:DefineFastInt("ExpChatHiddenMessagesPromptThresholdUpperBound", 45);
local v93 = require(l_Flags_0.FFlagExpChatEnableFOMOUpsell);
local v94 = require(l_Flags_0.FFlagExpChatClearHiddenMessagesPostAgeCheck);
local v95 = require(l_Flags_0.FFlagExpChatEnableCrossAgeChatActivity);
local v96 = game:DefineFastInt("MaxExpChatUserMessageIntentImpressionCount", 9999999);
local l_GetFFlagExpChatUserMessageIntentSentCooldown_0 = v16.GetFFlagExpChatUserMessageIntentSentCooldown;
local l_GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled_0 = v16.GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled;
local l_FIntMaxExpChatUnlockChatButtonImpressionsCount_0 = v16.FIntMaxExpChatUnlockChatButtonImpressionsCount;
local l_FStringExpChatFOMOUpsellImpressionsCountKey_0 = v16.FStringExpChatFOMOUpsellImpressionsCountKey;
local l_GetFFlagExpChatFOMOUpsellImpressionsCountEnabled_0 = v16.GetFFlagExpChatFOMOUpsellImpressionsCountEnabled;
local l_FFlagExpChatUseAdorneeStore_0 = v16.FFlagExpChatUseAdorneeStore;
local l_FFlagExpChatUseMessagesStore_0 = v16.FFlagExpChatUseMessagesStore;
local l_FFlagExpChatUseChannelTabsStore_0 = v16.FFlagExpChatUseChannelTabsStore;
local l_FFlagExpChatUseChatConfigStore_0 = v16.FFlagExpChatUseChatConfigStore;
local l_FFlagEnableModerateChatRemoteEvent_0 = v16.FFlagEnableModerateChatRemoteEvent;
local l_FFlagExpChatPerfTracking_0 = v16.FFlagExpChatPerfTracking;
local v108 = game:DefineFastFlag("ExpChatRemoveSpaceFromTeamPrefix", false);
local l_ExpChatNewHiddenMessagesExperimentation_0 = require(l_Parent_0.SocialExperiments).ExpChatNewHiddenMessagesExperimentation;
getChatTranslationEnabled = function() --[[ Line: 134 ]] --[[ Name: getChatTranslationEnabled ]]
    -- upvalues: l_TextChatService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 135 ]]
        -- upvalues: l_TextChatService_0 (ref)
        return l_TextChatService_0.ChatTranslationEnabled;
    end);
    return l_status_0 and l_result_0;
end;
local v112 = {
    eventName = "MessageResponse", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = v88, 
    lastUpdated = {
        25, 
        10, 
        8
    }, 
    description = "When a client receives a text chat message through TextChatService.", 
    links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/message_response.proto"
};
local l_helpers_0 = script.helpers;
local v114 = require(l_helpers_0.setUpConfigurationObjects);
local v115 = require(l_helpers_0.setUpClientSettings);
local v116 = require(l_helpers_0.waitForFirst);
local l_context_0 = v13.context;
local v118 = require(script.reportVersionLoaded);
local l_Version_0 = v13.Version;
local v120 = require(l_script_FirstAncestor_0.AtomicBinding);
local function v159(v121, v122, v123) --[[ Line: 163 ]] --[[ Name: watchPlayersService ]]
    -- upvalues: v32 (copy), v69 (copy), l_PlayerAdded_0 (copy), l_Players_0 (copy), l_LocalTeamChanged_0 (copy), v86 (copy), l_FFlagExpChatUseAdorneeStore_0 (copy), l_context_0 (copy), v58 (copy), v57 (copy), v120 (copy), v116 (copy), l_LocalCharacterLoaded_0 (copy), l_getFFlagUseCharacterStore_0 (copy), l_CharacterAdded_0 (copy), v9 (copy), v65 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_PlayerRemoved_0 (copy), l_FFlagExpChatUseMessagesStore_0 (copy)
    v32:trace("Watching Players service");
    local v124 = {};
    local function v148(v125) --[[ Line: 167 ]] --[[ Name: onPlayerAdded ]]
        -- upvalues: v32 (ref), v69 (ref), v122 (copy), l_PlayerAdded_0 (ref), l_Players_0 (ref), l_LocalTeamChanged_0 (ref), v86 (ref), l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v58 (ref), v57 (ref), v120 (ref), v116 (ref), l_LocalCharacterLoaded_0 (ref), l_getFFlagUseCharacterStore_0 (ref), l_CharacterAdded_0 (ref), v124 (copy)
        v32:trace("Player added: {} {}", v125.Name, (tostring(v125.UserId)));
        local v126 = v69(v125) and true or nil;
        v122:dispatch(l_PlayerAdded_0(v125.UserId, v125.Name, v125.DisplayName, v126));
        if v125 == l_Players_0.LocalPlayer then
            v32:trace("Found local player");
            v125:GetPropertyChangedSignal("Team"):Connect(function() --[[ Line: 176 ]]
                -- upvalues: v122 (ref), l_LocalTeamChanged_0 (ref), v125 (copy)
                v122:dispatch(l_LocalTeamChanged_0(v125.Team));
            end);
        end;
        local function _() --[[ Line: 181 ]] --[[ Name: getHumanoidBinding ]]
            -- upvalues: v86 (ref), v125 (copy), l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v122 (ref), v58 (ref), v57 (ref), v120 (ref)
            local function v133(v127) --[[ Line: 184 ]] --[[ Name: dispatchBubbleChatAdornee ]]
                -- upvalues: v86 (ref), v125 (ref), l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v122 (ref), v58 (ref), v57 (ref)
                local l_root_0 = v127.root;
                local l_humanoid_0 = v127.humanoid;
                local l_humanoidRootPart_0 = v127.humanoidRootPart;
                local v131 = v86 and "BasePart" or "Part";
                if l_humanoid_0:IsA("Humanoid") and l_humanoidRootPart_0:IsA(v131) then
                    if l_root_0 and l_humanoidRootPart_0 and v125.Character == l_root_0 then
                        if l_FFlagExpChatUseAdorneeStore_0 then
                            l_context_0.adorneeStore.handleAdorneeAdded(v125.UserId, l_root_0, l_humanoid_0);
                        else
                            v122:dispatch(v58(v125.UserId, l_root_0, l_humanoid_0));
                        end;
                    end;
                    local v132 = l_humanoid_0.Died:Connect(function() --[[ Line: 199 ]]
                        -- upvalues: l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v125 (ref), v122 (ref), v57 (ref)
                        if l_FFlagExpChatUseAdorneeStore_0 then
                            l_context_0.adorneeStore.handleHumanoidDied(v125.UserId);
                            return;
                        else
                            v122:dispatch(v57(v125.UserId));
                            return;
                        end;
                    end);
                    return function() --[[ Line: 207 ]] --[[ Name: disconnectHumanoidDied ]]
                        -- upvalues: v132 (copy)
                        if v132 then
                            v132:Disconnect();
                        end;
                    end;
                else
                    return function() --[[ Line: 218 ]]

                    end;
                end;
            end;
            return (v120.new({
                humanoid = "Humanoid", 
                humanoidRootPart = "HumanoidRootPart"
            }, v133));
        end;
        local function v141(v135) --[[ Line: 184 ]] --[[ Name: dispatchBubbleChatAdornee ]]
            -- upvalues: v86 (ref), v125 (copy), l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v122 (ref), v58 (ref), v57 (ref)
            local l_root_1 = v135.root;
            local l_humanoid_1 = v135.humanoid;
            local l_humanoidRootPart_1 = v135.humanoidRootPart;
            local v139 = v86 and "BasePart" or "Part";
            if l_humanoid_1:IsA("Humanoid") and l_humanoidRootPart_1:IsA(v139) then
                if l_root_1 and l_humanoidRootPart_1 and v125.Character == l_root_1 then
                    if l_FFlagExpChatUseAdorneeStore_0 then
                        l_context_0.adorneeStore.handleAdorneeAdded(v125.UserId, l_root_1, l_humanoid_1);
                    else
                        v122:dispatch(v58(v125.UserId, l_root_1, l_humanoid_1));
                    end;
                end;
                local v140 = l_humanoid_1.Died:Connect(function() --[[ Line: 199 ]]
                    -- upvalues: l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v125 (ref), v122 (ref), v57 (ref)
                    if l_FFlagExpChatUseAdorneeStore_0 then
                        l_context_0.adorneeStore.handleHumanoidDied(v125.UserId);
                        return;
                    else
                        v122:dispatch(v57(v125.UserId));
                        return;
                    end;
                end);
                return function() --[[ Line: 207 ]] --[[ Name: disconnectHumanoidDied ]]
                    -- upvalues: v140 (copy)
                    if v140 then
                        v140:Disconnect();
                    end;
                end;
            else
                return function() --[[ Line: 218 ]]

                end;
            end;
        end;
        local v142 = v120.new({
            humanoid = "Humanoid", 
            humanoidRootPart = "HumanoidRootPart"
        }, v141);
        v141 = function(v143) --[[ Line: 229 ]] --[[ Name: onCharacterAdded ]]
            -- upvalues: v116 (ref), v125 (copy), v32 (ref), l_Players_0 (ref), v122 (ref), l_LocalCharacterLoaded_0 (ref), l_getFFlagUseCharacterStore_0 (ref), l_context_0 (ref), l_CharacterAdded_0 (ref), v142 (copy)
            if not v143.Parent then
                v116(v143.AncestryChanged, v125.CharacterAdded);
            end;
            if v125.Character ~= v143 or not v143.Parent then
                v32:debug("Mismatched or unparented character in onCharacterAdded for {}", (tostring(v125.UserId)));
                return;
            else
                if v125 == l_Players_0.LocalPlayer then
                    v32:debug("Local character loaded: {}", v143.Name);
                    v122:dispatch(l_LocalCharacterLoaded_0(v143));
                end;
                if l_getFFlagUseCharacterStore_0() then
                    l_context_0.characterStore.handleCharacterAdded(v125.UserId, v143);
                else
                    v122:dispatch(l_CharacterAdded_0(v125.UserId, v143));
                end;
                v142:bindRoot(v143);
                return;
            end;
        end;
        local function v145(v144) --[[ Line: 253 ]] --[[ Name: onCharacterRemoving ]]
            -- upvalues: v142 (copy)
            v142:unbindRoot(v144);
        end;
        if v125.Character then
            v141(v125.Character);
        end;
        local v146 = v125.CharacterAdded:Connect(v141);
        local v147 = v125.CharacterRemoving:Connect(v145);
        if not v124[v125.UserId] then
            v124[v125.UserId] = {
                v146, 
                v147
            };
        end;
    end;
    local function v152(v149) --[[ Line: 271 ]] --[[ Name: onNewPlayerAdded ]]
        -- upvalues: v148 (copy), l_Players_0 (ref), v9 (ref), v65 (ref), l_FFlagConnectionsToFriendsRename_0 (ref), v121 (copy), v32 (ref)
        v148(v149);
        if l_Players_0.LocalPlayer then
            v9.try(function() --[[ Line: 275 ]]
                -- upvalues: v149 (copy), l_Players_0 (ref)
                if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                    return v149:IsFriendsWithAsync(l_Players_0.LocalPlayer.UserId);
                else
                    return v149:IsFriendsWith(l_Players_0.LocalPlayer.UserId);
                end;
            end):andThen(function(v150) --[[ Line: 282 ]]
                -- upvalues: v65 (ref), l_FFlagConnectionsToFriendsRename_0 (ref), v149 (copy), v121 (ref)
                if v150 then
                    v65(l_FFlagConnectionsToFriendsRename_0 and "InGame.UnknownNamespace.GameChat.FriendChatNotifier.JoinMessage" or "InGame.UnknownNamespace.GameChat_FriendChatNotifier_JoinMessage", {
                        RBX_NAME = v149.DisplayName
                    }, "Roblox.Notification.Friend.Joined", v121.translator, v121.defaultSystemTextChannel);
                end;
            end):catch(function(v151) --[[ Line: 295 ]]
                -- upvalues: v32 (ref)
                v32:error("Could not fetch friendship status. Error: {}", (tostring(v151)));
            end);
        end;
    end;
    for _, v154 in pairs(l_Players_0:GetPlayers()) do
        if v154:IsA("Player") then
            v148(v154);
        end;
    end;
    l_Players_0.PlayerAdded:Connect(v152);
    l_Players_0.PlayerRemoving:Connect(function(v155) --[[ Line: 310 ]]
        -- upvalues: v32 (ref), v122 (copy), l_PlayerRemoved_0 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v123 (copy), l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), l_getFFlagUseCharacterStore_0 (ref), v124 (copy)
        v32:trace("Player removed: {} {}", v155.Name, (tostring(v155.UserId)));
        v122:dispatch(l_PlayerRemoved_0(v155.UserId));
        if l_FFlagExpChatUseMessagesStore_0 then
            v123.handlePlayerRemoved(v155.UserId);
        end;
        if l_FFlagExpChatUseAdorneeStore_0 then
            l_context_0.adorneeStore.handlePlayerRemoved(v155.UserId);
        end;
        if l_getFFlagUseCharacterStore_0() then
            l_context_0.characterStore.handlePlayerRemoved(v155.UserId);
        end;
        local v156 = v124[v155.UserId];
        if v156 then
            for _, v158 in ipairs(v156) do
                v158:Disconnect();
            end;
            v124[v155.UserId] = nil;
        end;
    end);
end;
local v161 = {
    canUserChatAsync = function(v160) --[[ Line: 363 ]] --[[ Name: canUserChatAsync ]]
        -- upvalues: l_Chat_0 (copy)
        return l_Chat_0:CanUserChatAsync(v160);
    end
};
local function v164(v162) --[[ Line: 368 ]]
    -- upvalues: v32 (copy), v11 (copy)
    v32:trace("System OnIncomingMessage started: {} {}", v162.PrefixText, v162.Text);
    local l_TextChatMessageProperties_0 = Instance.new("TextChatMessageProperties");
    l_TextChatMessageProperties_0.Text = string.format("<font color=\"#%s\">%s</font>", if string.find(v162.Metadata, "Error") then v11.App.Style.Colors.Red:ToHex() else v11.App.Style.Colors.LightGrey:ToHex(), v162.Text);
    v32:trace("System OnIncomingMessage finished: {} {}", l_TextChatMessageProperties_0.PrefixText, l_TextChatMessageProperties_0.Text);
    return l_TextChatMessageProperties_0;
end;
return function(v165) --[[ Line: 384 ]]
    -- upvalues: v32 (copy), l_Dictionary_0 (copy), v161 (copy), v35 (copy), v33 (copy), v34 (copy), l_watchForErrors_0 (copy), l_context_0 (copy), l_FFlagExpChatUseAdorneeStore_0 (copy), v18 (copy), l_FFlagExpChatUseProximityStore_0 (copy), v28 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), v19 (copy), l_FFlagExpChatUseChannelTabsStore_0 (copy), v20 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy), v23 (copy), v85 (copy), v24 (copy), l_getFFlagUseCharacterStore_0 (copy), v22 (copy), l_Analytics_0 (copy), v79 (copy), l_UserInputService_0 (copy), v53 (copy), v164 (copy), l_Chat_0 (copy), l_TextChatService_0 (copy), v114 (copy), v115 (copy), l_GetFFlagExpChatFOMOUpsellImpressionsCountEnabled_0 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), l_HttpService_0 (copy), l_FStringExpChatFOMOUpsellImpressionsCountKey_0 (copy), l_Players_0 (copy), v65 (copy), l_TextChannelCreated_0 (copy), v80 (copy), v36 (copy), v82 (copy), v108 (copy), v67 (copy), l_FFlagExpChatPerfTracking_0 (copy), v76 (copy), v37 (copy), v68 (copy), v81 (copy), v21 (copy), v42 (copy), v87 (copy), v73 (copy), v89 (copy), v112 (copy), l_TextChannelRemoved_0 (copy), v44 (copy), l_countParticipantsInTextChannel_0 (copy), v61 (copy), l_LocalTextChannelParticipantRemoved_0 (copy), v43 (copy), v59 (copy), v60 (copy), v78 (copy), l_Commands_0 (copy), l_CommandAliasChanged_0 (copy), v9 (copy), v54 (copy), v55 (copy), v159 (copy), v11 (copy), v10 (copy), v31 (copy), v84 (copy), l_ClientAppLoaded_0 (copy), l_StarterGui_0 (copy), v118 (copy), l_Version_0 (copy), v70 (copy), v90 (copy), v38 (copy), l_GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled_0 (copy), l_FIntMaxExpChatUnlockChatButtonImpressionsCount_0 (copy), v72 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_ExpChatNewHiddenMessagesExperimentation_0 (copy), v91 (copy), v92 (copy), v63 (copy), v71 (copy), v93 (copy), v74 (copy), v95 (copy), v75 (copy), l_GetFFlagExpChatUserMessageIntentSentCooldown_0 (copy), v96 (copy), l_FFlagEnableModerateChatRemoteEvent_0 (copy), v66 (copy), v25 (copy), v17 (copy), v15 (copy), v94 (copy), v64 (copy)
    v32:trace("mountClientApp started");
    v165 = l_Dictionary_0.join(v161, v165);
    local v166 = v35();
    v33(v166);
    v34:flush();
    l_watchForErrors_0(game:GetService("ScriptContext"), v165.script, false);
    l_context_0.translator = v165.translator;
    l_context_0.store = v166;
    if l_FFlagExpChatUseAdorneeStore_0 then
        l_context_0.adorneeStore = v18(false);
    end;
    if l_FFlagExpChatUseProximityStore_0 then
        l_context_0.proximityStore = v28(false);
    end;
    local v167 = if l_FFlagExpChatUseMessagesStore_0 then v19(false) else nil;
    local v168 = if l_FFlagExpChatUseChannelTabsStore_0 then v20(false) else nil;
    local v169 = if l_FFlagExpChatUseChatConfigStore_0 then v23(false) else nil;
    local v170 = if v85 then v24(false) else nil;
    if l_FFlagExpChatUseMessagesStore_0 then
        l_context_0.messagesStore = v167;
    end;
    if l_getFFlagUseCharacterStore_0() then
        l_context_0.characterStore = v22(false);
    end;
    if v165.analytics then
        l_Analytics_0.with(v165.analytics);
    end;
    if not v79() then
        l_UserInputService_0.LastInputTypeChanged:Connect(function(v171) --[[ Line: 427 ]]
            -- upvalues: v166 (copy), v53 (ref)
            v166:dispatch(v53(v171));
        end);
    end;
    if v165.defaultSystemTextChannel then
        v165.defaultSystemTextChannel.OnIncomingMessage = v164;
    else
        l_Chat_0:GetPropertyChangedSignal("IsAutoMigrated"):Once(function() --[[ Line: 435 ]]
            -- upvalues: l_TextChatService_0 (ref), v165 (ref), v164 (ref)
            local l_l_TextChatService_0_FirstChild_0 = l_TextChatService_0:FindFirstChild("RBXSystem", true);
            if l_l_TextChatService_0_FirstChild_0 and l_l_TextChatService_0_FirstChild_0:IsA("TextChannel") then
                v165.defaultSystemTextChannel = l_l_TextChatService_0_FirstChild_0;
                l_l_TextChatService_0_FirstChild_0.OnIncomingMessage = v164;
            end;
        end);
    end;
    v114(v166, v165);
    v115(v166);
    local v173 = 1;
    if l_GetFFlagExpChatFOMOUpsellImpressionsCountEnabled_0() then
        local v174 = {};
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 455 ]]
            -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref)
            return l_AppStorageService_0:GetItem(l_LocalStorageKey_0.ExpChatFOMOUpsellImpressionsCount);
        end);
        if l_status_1 and l_result_1 ~= "" then
            local l_l_result_1_0 = l_result_1 --[[ copy: 9 -> 35 ]];
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 460 ]]
                -- upvalues: l_HttpService_0 (ref), l_l_result_1_0 (copy)
                return l_HttpService_0:JSONDecode(l_l_result_1_0);
            end);
            if l_status_2 then
                v174 = l_result_2;
            end;
        end;
        if v174[l_FStringExpChatFOMOUpsellImpressionsCountKey_0] then
            v173 = v174[l_FStringExpChatFOMOUpsellImpressionsCountKey_0] + 1;
        end;
        v174[l_FStringExpChatFOMOUpsellImpressionsCountKey_0] = v173;
        l_AppStorageService_0:SetItem(l_LocalStorageKey_0.ExpChatFOMOUpsellImpressionsCount, l_HttpService_0:JSONEncode(v174));
        l_AppStorageService_0:Flush();
    end;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if l_LocalPlayer_0 then
        l_LocalPlayer_0:GetPropertyChangedSignal("Team"):Connect(function() --[[ Line: 482 ]]
            -- upvalues: l_LocalPlayer_0 (copy), v65 (ref), v165 (ref)
            local l_Team_0 = l_LocalPlayer_0.Team;
            if l_Team_0 then
                v65("InGame.UnknownNamespace.GameChat_TeamChat_NowInTeam", {
                    RBX_NAME = l_Team_0.Name
                }, "Roblox.Team.Success.NowInTeam", v165.translator, v165.defaultSystemTextChannel);
            end;
        end);
    end;
    local function v201(v182) --[[ Line: 496 ]] --[[ Name: handleMessageReceived ]]
        -- upvalues: v166 (copy), l_TextChannelCreated_0 (ref), v80 (ref), l_TextChatService_0 (ref), v36 (ref), v82 (ref), v32 (ref), l_Players_0 (ref), v108 (ref), l_LocalPlayer_0 (copy), v67 (ref), v165 (ref), l_FFlagExpChatPerfTracking_0 (ref), v76 (ref), v37 (ref), v68 (ref), v65 (ref), v81 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v167 (copy), v21 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v168 (copy), v42 (ref), v87 (ref), v73 (ref), v89 (ref), l_Analytics_0 (ref), v112 (ref)
        v166:dispatch(l_TextChannelCreated_0(v182));
        local v183 = false;
        if v80() then
            local l_ChannelTabsConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChannelTabsConfiguration");
            if l_ChannelTabsConfiguration_0 then
                v183 = l_ChannelTabsConfiguration_0.Enabled;
            end;
        end;
        if string.find(v182.Name, "RBXGeneral") then
            v182.OnIncomingMessage = function(v185) --[[ Line: 508 ]]
                -- upvalues: v36 (ref), v82 (ref)
                local l_TextChatMessageProperties_1 = Instance.new("TextChatMessageProperties");
                if v185.TextSource then
                    local v187 = v36(v185.TextSource.UserId);
                    if not v82() or not v185.ChatWindowMessageProperties then
                        l_TextChatMessageProperties_1.PrefixText = string.format("<font color=\"#%s\">%s</font>", v187:ToHex(), v185.PrefixText);
                    end;
                end;
                return l_TextChatMessageProperties_1;
            end;
        elseif string.find(v182.Name, "^RBXTeam") then
            v182.OnIncomingMessage = function(v188) --[[ Line: 522 ]]
                -- upvalues: v32 (ref), l_Players_0 (ref), v108 (ref), v183 (ref)
                v32:trace("Team OnIncomingMessage started: {} {}", v188.PrefixText, v188.Text);
                local l_TextChatMessageProperties_2 = Instance.new("TextChatMessageProperties");
                if l_Players_0.LocalPlayer then
                    local l_Color_0 = l_Players_0.LocalPlayer.TeamColor.Color;
                    local v191 = "";
                    v191 = if v108 then v183 and "" or #(v188.PrefixText or "") > 0 and "[Team] " or "[Team]" else v183 and "" or "[Team] ";
                    l_TextChatMessageProperties_2.PrefixText = string.format("<font color=\"#%s\">%s%s</font>", l_Color_0:ToHex(), v191, v188.PrefixText);
                end;
                v32:trace("Team OnIncomingMessage finished: {} {}", l_TextChatMessageProperties_2.PrefixText, l_TextChatMessageProperties_2.Text);
                return l_TextChatMessageProperties_2;
            end;
        elseif string.find(v182.Name, "^RBXWhisper") and l_LocalPlayer_0 then
            v182.OnIncomingMessage = function(v192) --[[ Line: 552 ]]
                -- upvalues: v67 (ref), v182 (copy), l_LocalPlayer_0 (ref), v183 (ref), v165 (ref), v36 (ref)
                local l_TextSource_0 = v192.TextSource;
                if l_TextSource_0 then
                    local v194 = v67(v182, l_LocalPlayer_0);
                    if v194 then
                        local v195 = nil;
                        if not v183 then
                            v195 = if l_TextSource_0.UserId == l_LocalPlayer_0.UserId then v165.translator:FormatByKey("CoreScripts.TextChat.WhisperChat.PrefixText.Outgoing", {
                                RBX_NAME = v194
                            }) else v165.translator:FormatByKey("CoreScripts.TextChat.WhisperChat.PrefixText.Incoming", {
                                RBX_NAME = v194
                            });
                        end;
                        local l_TextChatMessageProperties_3 = Instance.new("TextChatMessageProperties");
                        local v197 = v36(l_TextSource_0.UserId);
                        l_TextChatMessageProperties_3.PrefixText = string.format("%s<font color=\"#%s\">%s</font>", if v195 then v195 .. " " else "", v197:ToHex(), v192.PrefixText);
                        return l_TextChatMessageProperties_3;
                    end;
                end;
                return nil;
            end;
        end;
        v182.MessageReceived:Connect(function(v198) --[[ Line: 589 ]]
            -- upvalues: v32 (ref), l_FFlagExpChatPerfTracking_0 (ref), l_LocalPlayer_0 (ref), v76 (ref), v37 (ref), v68 (ref), v65 (ref), v165 (ref), v81 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v167 (ref), v21 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v168 (ref), v166 (ref), v42 (ref), v87 (ref), v73 (ref), v89 (ref), l_Analytics_0 (ref), v112 (ref)
            v32:debug("Incoming MessageReceived Status: {} Text: {}", v198.Status.Name, v198.Text);
            if l_FFlagExpChatPerfTracking_0 and (v198.TextSource and v198.TextSource.UserId or "UNKNOWN_TEXT_SOURCE_USER_ID") ~= (l_LocalPlayer_0 and l_LocalPlayer_0.UserId or "UNKNOWN_LOCAL_USER_ID") then
                v76.start(v76.Events.MessageReceiveToWindowRenderInterval, {
                    messageId = v198.MessageId
                });
            end;
            if l_LocalPlayer_0 then
                v37(l_LocalPlayer_0.UserId, v198);
            end;
            if l_LocalPlayer_0 and v198.TextSource and v198.TextSource.UserId ~= l_LocalPlayer_0.UserId then
                local v199 = v68(v198, l_LocalPlayer_0);
                if v199 then
                    v65(v199.key, v199.args, v199.metadata, v165.translator, if v81() then v198.TextChannel else v165.defaultSystemTextChannel);
                end;
            end;
            local v200 = l_LocalPlayer_0 and v198.TextSource and v198.TextSource.UserId == l_LocalPlayer_0.UserId;
            if l_FFlagExpChatUseMessagesStore_0 then
                v167.handleIncomingOrOutgoingMessage(v198, v200);
                v21(false).resetTextTransparency();
                if l_FFlagExpChatUseChannelTabsStore_0 and v168 then
                    v168.handleIncomingOrOutgoingMessage(v198, v200);
                end;
            else
                v166:dispatch(v42(v198, v200));
                v21(false).resetTextTransparency();
            end;
            if v198.Status == Enum.TextChatMessageStatus.Floodchecked then
                v65("CoreScripts.TextChat.MessageStatus.Warning.Floodchecked", nil, "Roblox.MessageStatus.Warning.Floodchecked", v165.translator, v165.defaultSystemTextChannel);
            elseif v198.Status == Enum.TextChatMessageStatus.TextFilterFailed then
                v65("CoreScripts.TextChat.MessageStatus.Warning.TextFilterFailed", nil, "Roblox.MessageStatus.Warning.TextFilterFailed", v165.translator, v165.defaultSystemTextChannel);
            elseif v198.Status == Enum.TextChatMessageStatus.InvalidPrivacySettings then
                v65("CoreScripts.TextChat.MessageStatus.Warning.InvalidPrivacySettings", nil, "Roblox.MessageStatus.Warning.InvalidPrivacySettings", v165.translator, v165.defaultSystemTextChannel);
            elseif v198.Status == Enum.TextChatMessageStatus.MessageTooLong then
                v65("CoreScripts.TextChat.MessageStatus.Warning.MessageTooLong", nil, "Roblox.MessageStatus.Warning.MessageTooLong", v165.translator, v165.defaultSystemTextChannel);
            elseif v198.Status == Enum.TextChatMessageStatus.ModerationTimeout then
                v65("CoreScripts.TextChat.MessageStatus.Warning.ModerationTimeout", nil, "Roblox.MessageStatus.Warning.ModerationTimeout", v165.translator, v165.defaultSystemTextChannel);
            elseif v198.Status == Enum.TextChatMessageStatus.Unknown then
                v65("CoreScripts.TextChat.MessageStatus.Warning.Unknown", nil, "Roblox.MessageStatus.Warning.Unknown", v165.translator, v165.defaultSystemTextChannel);
            end;
            if v87 then
                if v73(v89) then
                    l_Analytics_0:TelemetryLogEvent(v112, {
                        messageStatus = v198.Status.Name
                    }, {
                        "addOsInfo", 
                        "addSessionId", 
                        "addUniverseId", 
                        "addPlaceId"
                    });
                    return;
                end;
            else
                l_Analytics_0.FireClientAnalyticsWithEventName("MessageResponse", {
                    messageStatus = v198.Status.Name
                });
            end;
        end);
    end;
    local function _(v202) --[[ Line: 712 ]] --[[ Name: watchTextChatCommand ]]
        -- upvalues: l_Analytics_0 (ref)
        v202.Triggered:Connect(function() --[[ Line: 713 ]]
            -- upvalues: l_Analytics_0 (ref), v202 (copy)
            l_Analytics_0.FireClientAnalyticsWithEventName("CommandSent", {
                commandName = v202.Name
            });
        end);
    end;
    for _, v205 in pairs(l_TextChatService_0:GetDescendants()) do
        if v205:IsA("TextChannel") then
            v201(v205);
        elseif v205:IsA("TextChatCommand") then
            v205.Triggered:Connect(function() --[[ Line: 713 ]]
                -- upvalues: l_Analytics_0 (ref), v205 (copy)
                l_Analytics_0.FireClientAnalyticsWithEventName("CommandSent", {
                    commandName = v205.Name
                });
            end);
        end;
    end;
    l_TextChatService_0.DescendantAdded:Connect(function(v206) --[[ Line: 729 ]]
        -- upvalues: v201 (copy), l_Analytics_0 (ref)
        if v206:IsA("TextChannel") then
            v201(v206);
            return;
        else
            if v206:IsA("TextChatCommand") then
                v206.Triggered:Connect(function() --[[ Line: 713 ]]
                    -- upvalues: l_Analytics_0 (ref), v206 (copy)
                    l_Analytics_0.FireClientAnalyticsWithEventName("CommandSent", {
                        commandName = v206.Name
                    });
                end);
            end;
            return;
        end;
    end);
    l_TextChatService_0.DescendantRemoving:Connect(function(v207) --[[ Line: 737 ]]
        -- upvalues: v166 (copy), l_TextChannelRemoved_0 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v168 (copy)
        if v207:IsA("TextChannel") then
            v166:dispatch(l_TextChannelRemoved_0(v207));
            if l_FFlagExpChatUseChannelTabsStore_0 and v168 then
                v168.handleChannelRemoved(v207);
            end;
        end;
    end);
    l_TextChatService_0.SendingMessage:Connect(function(v208) --[[ Line: 747 ]]
        -- upvalues: l_FFlagExpChatPerfTracking_0 (ref), v76 (ref), v32 (ref), l_LocalPlayer_0 (copy), v68 (ref), v65 (ref), v165 (ref), v81 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v167 (copy), v166 (copy), v44 (ref), l_Analytics_0 (ref), l_countParticipantsInTextChannel_0 (ref)
        if l_FFlagExpChatPerfTracking_0 then
            v76.start(v76.Events.MessageSendToWindowRenderInterval, {
                messageId = v208.MessageId
            });
        end;
        v32:debug("Outgoing SendingMessage Status: {} Text: {}", v208.Status.Name, v208.Text);
        if l_LocalPlayer_0 then
            local v209 = v68(v208, l_LocalPlayer_0);
            if v209 and v209.key then
                v65(v209.key, v209.args, v209.metadata, v165.translator, if v81() then v208.TextChannel else v165.defaultSystemTextChannel);
            end;
        end;
        if l_FFlagExpChatUseMessagesStore_0 then
            v167.handleIncomingOrOutgoingMessage(v208, true);
        else
            v166:dispatch(v44(v208));
        end;
        local l_TextChannel_0 = v208.TextChannel;
        if l_TextChannel_0 then
            l_Analytics_0.FireClientAnalyticsWithEventName("MessageSent", {
                channelName = l_TextChannel_0.Name, 
                totalParticipants = l_countParticipantsInTextChannel_0(l_TextChannel_0)
            });
        end;
    end);
    local function _(v211) --[[ Line: 785 ]] --[[ Name: isInstanceALocalTextChannelParticipant ]]
        -- upvalues: l_Players_0 (ref)
        return v211 and v211:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v211.UserId;
    end;
    if v80() then
        for _, v214 in pairs(l_TextChatService_0:GetDescendants()) do
            if v214.Parent and v214.Parent:IsA("TextChannel") and v214 and v214:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v214.UserId then
                v166:dispatch(v61(v214.Parent));
                if l_FFlagExpChatUseChannelTabsStore_0 and v168 then
                    local l_Name_0 = v214.Parent.Name;
                    if l_Name_0 ~= "RBXSystem" then
                        local v216 = l_Name_0 == "RBXGeneral" and 1 or 2;
                        v168.addChannelTab(l_Name_0, v216);
                    end;
                end;
            end;
            if v214:IsA("TextChannel") then
                v214.DescendantRemoving:Connect(function(v217) --[[ Line: 815 ]]
                    -- upvalues: l_Players_0 (ref), v166 (copy), l_LocalTextChannelParticipantRemoved_0 (ref), v214 (copy), l_FFlagExpChatUseChannelTabsStore_0 (ref), v168 (copy)
                    if v217 and v217:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v217.UserId then
                        v166:dispatch(l_LocalTextChannelParticipantRemoved_0(v214));
                        if l_FFlagExpChatUseChannelTabsStore_0 and v168 then
                            local l_Name_1 = v214.Name;
                            v168.removeChannelTab(l_Name_1);
                        end;
                    end;
                end);
            end;
        end;
        l_TextChatService_0.DescendantAdded:Connect(function(v219) --[[ Line: 829 ]]
            -- upvalues: l_Players_0 (ref), v166 (copy), v61 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v168 (copy), l_LocalTextChannelParticipantRemoved_0 (ref)
            if v219.Parent and v219.Parent:IsA("TextChannel") and v219 and v219:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v219.UserId then
                v166:dispatch(v61(v219.Parent));
                if l_FFlagExpChatUseChannelTabsStore_0 and v168 then
                    local l_Name_2 = v219.Parent.Name;
                    if l_Name_2 ~= "RBXSystem" then
                        local v221 = l_Name_2 == "RBXGeneral" and 1 or 2;
                        v168.addChannelTab(l_Name_2, v221);
                    end;
                end;
            end;
            if v219:IsA("TextChannel") then
                v219.DescendantRemoving:Connect(function(v222) --[[ Line: 851 ]]
                    -- upvalues: l_Players_0 (ref), v166 (ref), l_LocalTextChannelParticipantRemoved_0 (ref), v219 (copy), l_FFlagExpChatUseChannelTabsStore_0 (ref), v168 (ref)
                    if v222 and v222:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v222.UserId then
                        v166:dispatch(l_LocalTextChannelParticipantRemoved_0(v219));
                        if l_FFlagExpChatUseChannelTabsStore_0 and v168 then
                            local l_Name_3 = v219.Name;
                            v168.removeChannelTab(l_Name_3);
                        end;
                    end;
                end);
            end;
        end);
    end;
    local function v233(v224, v225, v226) --[[ Line: 866 ]] --[[ Name: runOnBubbleDisplayed ]]
        -- upvalues: l_Players_0 (ref), l_HttpService_0 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v167 (copy), v166 (copy), v43 (ref)
        local v227 = nil;
        if v224:IsA("Model") then
            v227 = l_Players_0:GetPlayerFromCharacter(v224);
        end;
        local v228 = l_HttpService_0:GenerateGUID(false);
        local v229 = nil;
        local v230 = nil;
        if v226 then
            v228 = v226.MessageId;
            v229 = v226.BubbleChatMessageProperties;
            v230 = v226.Translation;
        end;
        local v231 = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000);
        local v232 = {
            message = v225, 
            translation = v230, 
            bubbleChatMessageId = v228, 
            bubbleChatMessageUserId = v227 and tostring(v227.UserId) or nil, 
            partOrModel = v224, 
            timestamp = v231, 
            bubbleChatMessageProperties = v229
        };
        if l_FFlagExpChatUseMessagesStore_0 then
            v167.handleIncomingBubbleChatMessage(v232);
            return;
        else
            v166:dispatch(v43(v232));
            return;
        end;
    end;
    l_Chat_0.Chatted:Connect(function(v234, v235) --[[ Line: 899 ]]
        -- upvalues: l_TextChatService_0 (ref), l_Chat_0 (ref), v233 (copy)
        if l_TextChatService_0.ChatVersion ~= Enum.ChatVersion.LegacyChatService or l_Chat_0.BubbleChatEnabled then
            v233(v234, v235);
        end;
    end);
    local function v237() --[[ Line: 906 ]]
        -- upvalues: l_Chat_0 (ref), v166 (copy), v59 (ref)
        local l_BubbleChatEnabled_0 = l_Chat_0.BubbleChatEnabled;
        v166:dispatch(v59("Enabled", l_BubbleChatEnabled_0));
    end;
    l_Chat_0:GetPropertyChangedSignal("BubbleChatEnabled"):Connect(v237);
    local l_BubbleChatEnabled_1 = l_Chat_0.BubbleChatEnabled;
    v166:dispatch(v59("Enabled", l_BubbleChatEnabled_1));
    l_Chat_0.BubbleChatSettingsChanged:Connect(function(v239) --[[ Line: 915 ]]
        -- upvalues: v165 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v169 (copy), v166 (copy), v60 (ref)
        if v165.validateLegacyBubbleChatSettings then
            local v240, v241 = v165.validateLegacyBubbleChatSettings(v239);
            assert(v240, "Bad settings object passed to Chat:SetBubbleChatSettings:\n inside consolidated BubbleChat " .. (v241 or ""));
            if l_FFlagExpChatUseMessagesStore_0 and v169 then
                v169.setBubbleChatSettings(v239);
                return;
            else
                v166:dispatch(v60(v239));
            end;
        end;
    end);
    if v78() then
        l_TextChatService_0.BubbleDisplayed:Connect(function(v242, v243) --[[ Line: 933 ]]
            -- upvalues: v233 (copy)
            v233(v242, v243 and v243.Text, v243);
        end);
    end;
    l_BubbleChatEnabled_1 = function(v244) --[[ Line: 938 ]] --[[ Name: findCommandInstance ]]
        -- upvalues: l_TextChatService_0 (ref)
        for _, v246 in ipairs(l_TextChatService_0:GetDescendants()) do
            if v246.Name == v244 and v246:IsA("TextChatCommand") then
                return v246;
            end;
        end;
        return nil;
    end;
    local v247 = {};
    local function v255() --[[ Line: 949 ]] --[[ Name: setupTextChatCommands ]]
        -- upvalues: l_Commands_0 (ref), l_BubbleChatEnabled_1 (copy), v247 (copy), l_FFlagExpChatUseMessagesStore_0 (ref), v166 (copy), l_context_0 (ref), v65 (ref), v165 (ref), l_CommandAliasChanged_0 (ref)
        for _, v249 in ipairs(l_Commands_0.enabledCommands) do
            if v249.clientRun then
                local v250 = l_BubbleChatEnabled_1(v249.name);
                if v250 and not v247[v250] then
                    v247[v250] = true;
                    v250.Triggered:Connect(function(v251, ...) --[[ Line: 960 ]]
                        -- upvalues: l_FFlagExpChatUseMessagesStore_0 (ref), v249 (copy), v166 (ref), l_context_0 (ref), v65 (ref), v165 (ref)
                        local v252 = nil;
                        v252 = if l_FFlagExpChatUseMessagesStore_0 then v249.clientRun(v166, v251.UserId, ..., l_context_0) else v249.clientRun(v166, v251.UserId, ...);
                        if v252 then
                            v65(v252.key, v252.args, v252.metadata, v165.translator, v165.defaultSystemTextChannel);
                        end;
                    end);
                    if string.find(v250.Name, "RBXTeamCommand") or string.find(v250.Name, "RBXWhisperCommand") then
                        for _, v254 in {
                            "PrimaryAlias", 
                            "SecondaryAlias"
                        } do
                            v250:GetPropertyChangedSignal(v254):Connect(function() --[[ Line: 983 ]]
                                -- upvalues: v166 (ref), l_CommandAliasChanged_0 (ref), v250 (copy)
                                v166:dispatch(l_CommandAliasChanged_0(v250.Name, v250.PrimaryAlias, v250.SecondaryAlias));
                            end);
                        end;
                    end;
                end;
            end;
        end;
    end;
    v255();
    l_Chat_0:GetPropertyChangedSignal("IsAutoMigrated"):Once(v255);
    if v165.canUserChatAsync and l_Players_0.LocalPlayer then
        v9.try(function() --[[ Line: 1003 ]]
            -- upvalues: v165 (ref), l_Players_0 (ref)
            return v165.canUserChatAsync(l_Players_0.LocalPlayer.UserId);
        end):andThen(function(v256) --[[ Line: 1006 ]]
            -- upvalues: l_FFlagExpChatUseMessagesStore_0 (ref), v167 (copy), v166 (copy), v54 (ref)
            if l_FFlagExpChatUseMessagesStore_0 then
                v167.setCanLocalUserChat(v256);
                return;
            else
                v166:dispatch(v54(v256));
                return;
            end;
        end):catch(function() --[[ Line: 1013 ]]
            -- upvalues: l_FFlagExpChatUseMessagesStore_0 (ref), v167 (copy), v166 (copy), v55 (ref)
            if l_FFlagExpChatUseMessagesStore_0 then
                v167.setCanLocalUserChat(false);
                return;
            else
                v166:dispatch(v55());
                return;
            end;
        end);
    end;
    v159(v165, v166, v167);
    local l_AppStyleProvider_0 = v11.App.Style.AppStyleProvider;
    local l_Constants_0 = v11.App.Style.Constants;
    local l_Dark_0 = l_Constants_0.ThemeName.Dark;
    local l_Gotham_0 = l_Constants_0.FontName.Gotham;
    local v261 = {
        Dark = {
            themeName = l_Dark_0, 
            fontName = l_Gotham_0
        }
    };
    local v262 = v10.createElement(l_AppStyleProvider_0, {
        style = v261.Dark
    }, {
        app = v10.createElement(v31, {
            store = v166, 
            translator = v165.translator, 
            gameTranslator = if v80() then v165.gameTranslator else nil, 
            isChatWindowVisible = true, 
            isChatInputBarVisible = true, 
            isChannelBarVisible = false, 
            isDefaultChatEnabled = true, 
            getIconVoiceIndicator = v165.getIconVoiceIndicator, 
            onClickedVoiceIndicator = v165.onClickedVoiceIndicator, 
            onClickedCameraIndicator = v165.onClickedCameraIndicator, 
            selfViewListenerChanged = v165.selfViewListenerChanged, 
            getPermissions = v165.getPermissions, 
            displayCameraDeniedToast = v165.displayCameraDeniedToast, 
            isCamEnabledForUserAndPlace = v165.isCamEnabledForUserAndPlace, 
            isCameraOnlyUser = v165.isCameraOnlyUser, 
            isVoiceServiceInitialized = v165.isVoiceServiceInitialized, 
            onClickedLikelySpeakingBubble = v165.onClickedLikelySpeakingBubble, 
            isSpatialUIEnabled = v165.isSpatialUIEnabled, 
            expChatLoadStartTime = if v84() then os.clock() else nil
        })
    });
    v166:dispatch(l_ClientAppLoaded_0({
        team = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.Team, 
        isChatCoreGuiEnabled = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Chat), 
        isTouchEnabled = l_UserInputService_0.TouchEnabled, 
        isGamepadEnabled = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Gamepad
    }));
    v118(l_Analytics_0, l_Version_0[1]);
    v32:trace("Roact.mount to {}", (tostring(v165.parent)));
    local v263 = v10.mount(v262, v165.parent, "ExperienceChat");
    local function v265(v264) --[[ Line: 1073 ]] --[[ Name: updateChatStatus ]]
        -- upvalues: v170 (copy), v70 (ref), v65 (ref), v90 (ref), v165 (ref), v38 (ref), l_GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled_0 (ref), v173 (ref), l_FIntMaxExpChatUnlockChatButtonImpressionsCount_0 (ref), v72 (ref), l_FFlagConnectionsToFriendsRename_0 (ref)
        v170.setChatStatus(v264);
        if v264 == "GeoBlocked" or v264 ~= "Unknown" and v70() then
            v65(v90 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionIsntAvailable" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionUnavailable", nil, "Roblox.ChatDisabled.Info", v165.translator, v165.defaultSystemTextChannel, v90 and "You can only view system messages here. Chat isn\226\128\153t available in your region." or "You can only view system messages here. Chat is not available in your region.");
            return;
        elseif v264 == "AgeCheckGateExperiment" then
            v65("CoreScripts.TextChat.ChatWindow.ChatDisabled.CheckAgeInAccountInfo", nil, "Roblox.ChatDisabled.Info", v165.translator, v165.defaultSystemTextChannel, "You can only view system messages here. Unlock chat with an age check at Settings > Account info.");
            return;
        elseif v264 == "SettingsDisabled" then
            v65(v90 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.DontMissMessagesUpdateCommsSettings" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.SettingOff", nil, "Roblox.ChatDisabled.Info", v165.translator, v165.defaultSystemTextChannel, v90 and "You can only view system messages here. Update your communication settings to turn on chat." or "You can only view system messages here. Update your Communication settings to turn on chat.");
            return;
        elseif v264 == "SettingsDisabledVpc" then
            v65("CoreScripts.TextChat.ChatWindow.ChatDisabled.AskForPermission", nil, "Roblox.ChatDisabled.Info", v165.translator, v165.defaultSystemTextChannel, "You can only view system messages here. Ask your parent for permission to chat in Communication settings.");
            return;
        elseif v264 == "AgeCheckVpc" then
            v65("CoreScripts.TextChat.ChatWindow.ChatDisabled.AskForPermissionToAgeCheck", nil, "Roblox.ChatDisabled.Info", v165.translator, v165.defaultSystemTextChannel, "You can only view system messages here. Ask your parent for permission to age check in Communication settings.");
            return;
        elseif not v38() and v264 == "AgeVerificationRequired" or v264 == "IdVerificationRequired" then
            v65(v90 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.GetAnAgeCheckInCommsSetting" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.CheckAgeInSettings", nil, "Roblox.ChatDisabled.Info", v165.translator, v165.defaultSystemTextChannel, v90 and "Don\226\128\153t miss messages. Unlock chat with an age check in your communication settings." or "You can only view system messages here. To chat, get an age check in your Communication settings.");
            return;
        elseif v264 == "AgeVerificationRequired" then
            if l_GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled_0() and l_FIntMaxExpChatUnlockChatButtonImpressionsCount_0 < v173 then
                v65("CoreScripts.TextChat.ChatWindow.ChatDisabled.GetAnAgeCheckInCommsSetting", nil, "Roblox.ChatDisabled.Info", v165.translator, v165.defaultSystemTextChannel, "Don\226\128\153t miss messages. Unlock chat with an age check in your communication settings.");
                return;
            else
                v65(v90 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.DontMissMessages" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.GetAnAgeCheck", nil, "Roblox.ChatDisabled.Info", v165.translator, v165.defaultSystemTextChannel, v90 and "Don\226\128\153t miss messages. Unlock chat with an age check." or "You can only view system messages here. Get an age check to chat.");
                return;
            end;
        elseif v264 == "EnabledBubble" or v264 == "Enabled" and v72() then
            v65("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatInRegion", nil, "Roblox.ChatEnabled.Info", v165.translator, v165.defaultSystemTextChannel, "You can view system messages and chat with users in your region only.");
            return;
        elseif v264 == "Enabled" then
            v65(l_FFlagConnectionsToFriendsRename_0 and "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAAndTF" or "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAndTC", nil, "Roblox.ChatEnabled.Info", v165.translator, v165.defaultSystemTextChannel, "Only people in similar age groups and your Trusted Connections can chat with you.");
            return;
        else
            if v264 == "AllUsers" or v264 == "NoOne" then
                if getChatTranslationEnabled() then
                    v65("CoreScripts.TextChat.ChatTranslation.ChatWindow.SystemMessageNew", nil, "Roblox.ChatTranslation.ChatWindow.SystemMessage", v165.translator, v165.defaultSystemTextChannel, "Roblox automatically translates supported languages in chat");
                    return;
                end;
            elseif v264 == "Ineligible" or v264 ~= "Unknown" then
                v65("CoreScripts.TextChat.ChatWindow.ChatDisabled.OnlyViewSystemMessages", nil, "Roblox.ChatDisabled.Info", v165.translator, v165.defaultSystemTextChannel, "You can only view system messages here.");
            end;
            return;
        end;
    end;
    local v266 = l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatNewHiddenMessagesSystemMessageNudgeEnabled() and 0 or nil;
    local v267 = if l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatNewHiddenMessagesSystemMessageNudgeEnabled() then math.random(v91, v92) else nil;
    local function v269(v268) --[[ Line: 1247 ]] --[[ Name: handleUserMessageIntentSent ]]
        -- upvalues: v32 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v167 (copy), v166 (copy), v63 (ref), l_ExpChatNewHiddenMessagesExperimentation_0 (ref), v71 (ref), l_LocalPlayer_0 (copy), v266 (ref), v267 (ref), v91 (ref), v92 (ref), v65 (ref), v165 (ref), v21 (ref)
        v32:debug("Handling a message from UserMessageIntentSent");
        if l_FFlagExpChatUseMessagesStore_0 then
            v167.handleHiddenMessageReceived(v268);
        else
            v166:dispatch(v63(v268));
        end;
        if l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatNewHiddenMessagesSystemMessageNudgeEnabled() and not v71(l_LocalPlayer_0.ChatAvailabilityStatus) then
            v266 = v266 + 1;
            if v266 == v267 then
                v267 = v267 + math.random(v91, v92);
                v65("CoreScripts.TextChat.ChatWindow.ChatDisabled.DontMissMessages", nil, "Roblox.ChatDisabled.Info", v165.translator, v165.defaultSystemTextChannel, "Don\226\128\153t miss messages. Unlock chat with an age check.");
            end;
        end;
        v21(false).resetTextTransparency();
    end;
    local function _() --[[ Line: 1281 ]] --[[ Name: shouldConnectToUserMessageIntentSent ]]
        -- upvalues: v93 (ref), v74 (ref), v95 (ref), v75 (ref), l_GetFFlagExpChatUserMessageIntentSentCooldown_0 (ref), v173 (ref), v96 (ref)
        local v270 = v93 and v74();
        local v271 = v95 and v75();
        if l_GetFFlagExpChatUserMessageIntentSentCooldown_0() then
            return v271 or v270 and v173 <= v96;
        else
            return v270 or v271;
        end;
    end;
    if v85 and l_LocalPlayer_0 then
        if l_FFlagEnableModerateChatRemoteEvent_0 then
            local v273 = v66();
            local v274 = v25(false);
            local v275 = false;
            local l_v274_0 = v274 --[[ copy: 29 -> 33 ]];
            local l_v273_0 = v273 --[[ copy: 28 -> 34 ]];
            do
                local l_v275_0 = v275;
                v165.moderateChatStoreDisposeEffect = v17.createEffect(function(v279) --[[ Line: 1300 ]]
                    -- upvalues: l_v274_0 (copy), l_v275_0 (ref), v65 (ref), v165 (ref), v15 (ref), v11 (ref), l_v273_0 (copy), l_FFlagConnectionsToFriendsRename_0 (ref)
                    local v280 = l_v274_0.getIsSettingEnabled(v279);
                    if v280 ~= l_v275_0 then
                        if v280 then
                            v65("CoreScripts.TextChat.MessageStatus.Warning.ModerateChatOn", nil, "Roblox.MessageStatus.Warning.ModerateChatOn", v165.translator, v165.defaultSystemTextChannel);
                            v15.SetUIBloxToast({
                                iconImage = v11.App.ImageSet.Images[l_v273_0.icon.off], 
                                toastSubtitle = v165.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOn.Subtitle"), 
                                toastTitle = v165.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOn.Title")
                            });
                        else
                            v65("CoreScripts.TextChat.MessageStatus.Warning.ModerateChatOff", nil, "Roblox.MessageStatus.Warning.ModerateChatOff", v165.translator, v165.defaultSystemTextChannel);
                            v15.SetUIBloxToast({
                                iconImage = v11.App.ImageSet.Images[l_v273_0.icon.off], 
                                toastSubtitle = v165.translator:FormatByKey(l_FFlagConnectionsToFriendsRename_0 and "CoreScripts.TextChat.Toast.ModerateChatOff.Subtitle.FriendsRename" or "CoreScripts.TextChat.Toast.ModerateChatOff.Subtitle"), 
                                toastTitle = v165.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOff.Title")
                            });
                        end;
                        l_v275_0 = v280;
                    end;
                end);
            end;
        end;
        local l_ChatAvailabilityStatus_0 = l_LocalPlayer_0.ChatAvailabilityStatus;
        v32:debug("Local player's initial ChatAvailabilityStatus is {}", l_ChatAvailabilityStatus_0);
        v265(l_ChatAvailabilityStatus_0);
        local v282 = nil;
        local v283 = v93 and v74();
        local v284 = v95 and v75();
        if if l_GetFFlagExpChatUserMessageIntentSentCooldown_0() then v284 or v283 and v173 <= v96 else v283 or v284 then
            l_ExpChatNewHiddenMessagesExperimentation_0.logExposure();
            v32:debug("Connecting to UserMessageIntentSent");
            v282 = l_TextChatService_0.UserMessageIntentSent:Connect(v269);
        end;
        do
            local l_l_ChatAvailabilityStatus_0_0, l_v282_0 = l_ChatAvailabilityStatus_0, v282;
            l_LocalPlayer_0:GetPropertyChangedSignal("ChatAvailabilityStatus"):Connect(function() --[[ Line: 1364 ]]
                -- upvalues: l_l_ChatAvailabilityStatus_0_0 (ref), l_LocalPlayer_0 (copy), v32 (ref), v265 (copy), v93 (ref), v74 (ref), v95 (ref), v75 (ref), l_GetFFlagExpChatUserMessageIntentSentCooldown_0 (ref), v173 (ref), v96 (ref), l_v282_0 (ref), l_ExpChatNewHiddenMessagesExperimentation_0 (ref), l_TextChatService_0 (ref), v269 (copy), v71 (ref), v94 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v167 (copy), v166 (copy), v64 (ref), v21 (ref), v54 (ref)
                l_l_ChatAvailabilityStatus_0_0 = l_LocalPlayer_0.ChatAvailabilityStatus;
                v32:debug("Local player's ChatAvailabilityStatus has changed to {}", l_l_ChatAvailabilityStatus_0_0);
                v265(l_l_ChatAvailabilityStatus_0_0);
                local v287 = v93 and v74();
                local v288 = v95 and v75();
                if (if l_GetFFlagExpChatUserMessageIntentSentCooldown_0() then v288 or v287 and v173 <= v96 else v287 or v288) and not l_v282_0 then
                    l_ExpChatNewHiddenMessagesExperimentation_0.logExposure();
                    v32:debug("Connecting to UserMessageIntentSent");
                    l_v282_0 = l_TextChatService_0.UserMessageIntentSent:Connect(v269);
                end;
                if v93 and v71(l_l_ChatAvailabilityStatus_0_0) and l_v282_0 and (not v95 or not v75()) then
                    v32:debug("Disconnecting from UserMessageIntentSent");
                    l_v282_0:Disconnect();
                    if v94 then
                        if l_FFlagExpChatUseMessagesStore_0 then
                            v167.handleHiddenMessagesCleared();
                        else
                            v166:dispatch(v64());
                        end;
                        v21(false).resetTextTransparency();
                    end;
                end;
                if l_FFlagExpChatUseMessagesStore_0 then
                    v167.setCanLocalUserChat(v71(l_l_ChatAvailabilityStatus_0_0));
                    return;
                else
                    v166:dispatch(v54(v71(l_l_ChatAvailabilityStatus_0_0)));
                    return;
                end;
            end);
        end;
    elseif v70() then
        v65(v90 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionIsntAvailable" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionUnavailable", nil, "Roblox.ChatDisabled.Info", v165.translator, v165.defaultSystemTextChannel, if v85 then v90 and "You can only view system messages here. Chat isn\226\128\153t available in your region." or "You can only view system messages here. Chat is currently unavailable in your region." else "Chat is unavailable in your region. You can still receive system messages.");
    elseif not v85 and getChatTranslationEnabled() then
        v65("CoreScripts.TextChat.ChatTranslation.ChatWindow.SystemMessageNew", nil, "Roblox.ChatTranslation.ChatWindow.SystemMessage", v165.translator, v165.defaultSystemTextChannel, "Roblox automatically translates supported languages in chat");
    end;
    return {
        roactInstance = v263
    };
end;