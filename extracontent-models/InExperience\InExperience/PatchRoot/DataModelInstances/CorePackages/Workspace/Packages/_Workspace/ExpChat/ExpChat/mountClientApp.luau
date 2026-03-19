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
local l_FFlagExpChatUseProximityStore_0 = v16.FFlagExpChatUseProximityStore;
local v27 = if l_FFlagExpChatUseProximityStore_0 then require(l_script_FirstAncestor_0.Stores.GetProximityStore) else nil;
local l_Analytics_0 = v13.Analytics;
local l_countParticipantsInTextChannel_0 = v13.countParticipantsInTextChannel;
local v30 = require(script.Parent.App);
local v31 = v13.Logger:new("ExpChat/" .. script.Name);
local v32 = require(script.Parent.createDispatchBindableEvent);
local v33 = require(l_script_FirstAncestor_0.Events.bindableEventQueue);
local v34 = require(script.Parent.createStore);
local v35 = require(script.Parent.GetNameColor);
local v36 = require(script.Parent.reportMessageReceived);
local v37 = require(script.Parent.canPlatformEnableChat);
local l_watchForErrors_0 = v13.watchForErrors;
local l_Commands_0 = v13.Commands;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v41 = require(l_Actions_0.IncomingMessageReceived);
local v42 = require(l_Actions_0.IncomingBubbleChatMessageReceived);
local v43 = require(l_Actions_0.OutgoingMessageSent);
local l_TextChannelCreated_0 = v13.Actions.TextChannelCreated;
local l_TextChannelRemoved_0 = v13.Actions.TextChannelRemoved;
local l_PlayerAdded_0 = v13.Actions.PlayerAdded;
local l_PlayerRemoved_0 = v13.Actions.PlayerRemoved;
local l_CharacterAdded_0 = v13.Actions.CharacterAdded;
local l_LocalCharacterLoaded_0 = v13.Actions.LocalCharacterLoaded;
local l_LocalTeamChanged_0 = v13.Actions.LocalTeamChanged;
local l_ClientAppLoaded_0 = v13.Actions.ClientAppLoaded;
local v52 = require(l_Actions_0.LastInputTypeChanged);
local v53 = require(l_Actions_0.ChatPrivacySettingsReceived);
local v54 = require(l_Actions_0.ChatPrivacySettingsFetchFailed);
local l_CommandAliasChanged_0 = v13.Actions.CommandAliasChanged;
local v56 = require(l_Actions_0.HumanoidDied);
local v57 = require(l_Actions_0.AdorneeAdded);
local v58 = require(l_Actions_0.LegacyBubbleChatEnabledChanged);
local v59 = require(l_Actions_0.LegacyBubbleChatSettingsChanged);
local v60 = require(l_Actions_0.LocalTextChannelParticipantAdded);
local l_LocalTextChannelParticipantRemoved_0 = v13.Actions.LocalTextChannelParticipantRemoved;
local v62 = require(l_Actions_0.HiddenMessageReceived);
local v63 = require(l_Actions_0.HiddenMessagesCleared);
local v64 = require(l_script_FirstAncestor_0.displaySystemMessage);
local v65 = require(l_script_FirstAncestor_0.getExperienceChatVisualConfig);
local v66 = require(l_script_FirstAncestor_0.getOtherDisplayNameInWhisperChannel);
local v67 = require(l_script_FirstAncestor_0.handleChannelWelcomeMessage);
local v68 = require(l_script_FirstAncestor_0.isPlayerVerified);
local v69 = require(l_script_FirstAncestor_0.isChatRegionLocked);
local v70 = require(l_script_FirstAncestor_0.isUserChatEnabled);
local v71 = require(l_script_FirstAncestor_0.canOnlyChatInRegion);
local v72 = require(l_script_FirstAncestor_0.shouldSendHighFrequencyTelemetry);
local v73 = require(l_script_FirstAncestor_0.shouldShowFOMOUpsell);
local v74 = require(l_script_FirstAncestor_0.shouldShowCrossAgeChatActivity);
local v75 = require(l_script_FirstAncestor_0.Telemetry.ExpChatPerfTracker);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v77 = require(l_Flags_0.getEngineFeatureFlagEnableDisplayBubble);
local v78 = require(l_Flags_0.getFFlagUnreduxLastInputTypeChanged);
local v79 = require(l_Flags_0.getFFlagExpChatEnableChannelTabsUI);
local v80 = require(l_Flags_0.getFFlagExpChatMoveWhisperWelcome);
local v81 = require(l_Flags_0.getFFlagExpChatOverridePrefixNameColor);
local l_getFFlagUseCharacterStore_0 = v13.Flags.getFFlagUseCharacterStore;
local v83 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatTelemetryEventTrigger);
local v84 = require(l_Flags_0.FFlagAEGIS2EnableGatesForExpChat);
local v85 = game:DefineFastFlag("ExpChatShowBubblesOnMeshParts", false);
local v86 = game:DefineFastFlag("ExpChatMigrateMessageResponse", false);
local v87 = game:DefineFastInt("ExpChatMessageResponseThrottlePermyriad", 0);
local v88 = game:DefineFastInt("ExpChatMessageResponseUserSamplePermyriad", 0);
local v89 = game:DefineFastFlag("ExpChatEnableNewFOMOSystemMessages", false);
local v90 = game:DefineFastInt("ExpChatHiddenMessagesPromptThresholdLowerBound", 10);
local v91 = game:DefineFastInt("ExpChatHiddenMessagesPromptThresholdUpperBound", 45);
local v92 = require(l_Flags_0.FFlagExpChatEnableFOMOUpsell);
local v93 = require(l_Flags_0.FFlagExpChatClearHiddenMessagesPostAgeCheck);
local v94 = require(l_Flags_0.FFlagExpChatEnableCrossAgeChatActivity);
local v95 = game:DefineFastInt("MaxExpChatUserMessageIntentImpressionCount", 9999999);
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
local l_ExpChatNewHiddenMessagesExperimentation_0 = require(l_Parent_0.SocialExperiments).ExpChatNewHiddenMessagesExperimentation;
getChatTranslationEnabled = function() --[[ Line: 132 ]] --[[ Name: getChatTranslationEnabled ]]
    -- upvalues: l_TextChatService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 133 ]]
        -- upvalues: l_TextChatService_0 (ref)
        return l_TextChatService_0.ChatTranslationEnabled;
    end);
    return l_status_0 and l_result_0;
end;
local v110 = {
    eventName = "MessageResponse", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = v87, 
    lastUpdated = {
        25, 
        10, 
        8
    }, 
    description = "When a client receives a text chat message through TextChatService.", 
    links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/message_response.proto"
};
local l_helpers_0 = script.helpers;
local v112 = require(l_helpers_0.setUpConfigurationObjects);
local v113 = require(l_helpers_0.setUpClientSettings);
local v114 = require(l_helpers_0.waitForFirst);
local l_context_0 = v13.context;
local v116 = require(script.reportVersionLoaded);
local l_Version_0 = v13.Version;
local v118 = require(l_script_FirstAncestor_0.AtomicBinding);
local function v157(v119, v120, v121) --[[ Line: 161 ]] --[[ Name: watchPlayersService ]]
    -- upvalues: v31 (copy), v68 (copy), l_PlayerAdded_0 (copy), l_Players_0 (copy), l_LocalTeamChanged_0 (copy), v85 (copy), l_FFlagExpChatUseAdorneeStore_0 (copy), l_context_0 (copy), v57 (copy), v56 (copy), v118 (copy), v114 (copy), l_LocalCharacterLoaded_0 (copy), l_getFFlagUseCharacterStore_0 (copy), l_CharacterAdded_0 (copy), v9 (copy), v64 (copy), l_PlayerRemoved_0 (copy), l_FFlagExpChatUseMessagesStore_0 (copy)
    v31:trace("Watching Players service");
    local v122 = {};
    local function v146(v123) --[[ Line: 165 ]] --[[ Name: onPlayerAdded ]]
        -- upvalues: v31 (ref), v68 (ref), v120 (copy), l_PlayerAdded_0 (ref), l_Players_0 (ref), l_LocalTeamChanged_0 (ref), v85 (ref), l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v57 (ref), v56 (ref), v118 (ref), v114 (ref), l_LocalCharacterLoaded_0 (ref), l_getFFlagUseCharacterStore_0 (ref), l_CharacterAdded_0 (ref), v122 (copy)
        v31:trace("Player added: {} {}", v123.Name, (tostring(v123.UserId)));
        local v124 = v68(v123) and true or nil;
        v120:dispatch(l_PlayerAdded_0(v123.UserId, v123.Name, v123.DisplayName, v124));
        if v123 == l_Players_0.LocalPlayer then
            v31:trace("Found local player");
            v123:GetPropertyChangedSignal("Team"):Connect(function() --[[ Line: 174 ]]
                -- upvalues: v120 (ref), l_LocalTeamChanged_0 (ref), v123 (copy)
                v120:dispatch(l_LocalTeamChanged_0(v123.Team));
            end);
        end;
        local function _() --[[ Line: 179 ]] --[[ Name: getHumanoidBinding ]]
            -- upvalues: v85 (ref), v123 (copy), l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v120 (ref), v57 (ref), v56 (ref), v118 (ref)
            local function v131(v125) --[[ Line: 182 ]] --[[ Name: dispatchBubbleChatAdornee ]]
                -- upvalues: v85 (ref), v123 (ref), l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v120 (ref), v57 (ref), v56 (ref)
                local l_root_0 = v125.root;
                local l_humanoid_0 = v125.humanoid;
                local l_humanoidRootPart_0 = v125.humanoidRootPart;
                local v129 = v85 and "BasePart" or "Part";
                if l_humanoid_0:IsA("Humanoid") and l_humanoidRootPart_0:IsA(v129) then
                    if l_root_0 and l_humanoidRootPart_0 and v123.Character == l_root_0 then
                        if l_FFlagExpChatUseAdorneeStore_0 then
                            l_context_0.adorneeStore.handleAdorneeAdded(v123.UserId, l_root_0, l_humanoid_0);
                        else
                            v120:dispatch(v57(v123.UserId, l_root_0, l_humanoid_0));
                        end;
                    end;
                    local v130 = l_humanoid_0.Died:Connect(function() --[[ Line: 197 ]]
                        -- upvalues: l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v123 (ref), v120 (ref), v56 (ref)
                        if l_FFlagExpChatUseAdorneeStore_0 then
                            l_context_0.adorneeStore.handleHumanoidDied(v123.UserId);
                            return;
                        else
                            v120:dispatch(v56(v123.UserId));
                            return;
                        end;
                    end);
                    return function() --[[ Line: 205 ]] --[[ Name: disconnectHumanoidDied ]]
                        -- upvalues: v130 (copy)
                        if v130 then
                            v130:Disconnect();
                        end;
                    end;
                else
                    return function() --[[ Line: 216 ]]

                    end;
                end;
            end;
            return (v118.new({
                humanoid = "Humanoid", 
                humanoidRootPart = "HumanoidRootPart"
            }, v131));
        end;
        local function v139(v133) --[[ Line: 182 ]] --[[ Name: dispatchBubbleChatAdornee ]]
            -- upvalues: v85 (ref), v123 (copy), l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v120 (ref), v57 (ref), v56 (ref)
            local l_root_1 = v133.root;
            local l_humanoid_1 = v133.humanoid;
            local l_humanoidRootPart_1 = v133.humanoidRootPart;
            local v137 = v85 and "BasePart" or "Part";
            if l_humanoid_1:IsA("Humanoid") and l_humanoidRootPart_1:IsA(v137) then
                if l_root_1 and l_humanoidRootPart_1 and v123.Character == l_root_1 then
                    if l_FFlagExpChatUseAdorneeStore_0 then
                        l_context_0.adorneeStore.handleAdorneeAdded(v123.UserId, l_root_1, l_humanoid_1);
                    else
                        v120:dispatch(v57(v123.UserId, l_root_1, l_humanoid_1));
                    end;
                end;
                local v138 = l_humanoid_1.Died:Connect(function() --[[ Line: 197 ]]
                    -- upvalues: l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v123 (ref), v120 (ref), v56 (ref)
                    if l_FFlagExpChatUseAdorneeStore_0 then
                        l_context_0.adorneeStore.handleHumanoidDied(v123.UserId);
                        return;
                    else
                        v120:dispatch(v56(v123.UserId));
                        return;
                    end;
                end);
                return function() --[[ Line: 205 ]] --[[ Name: disconnectHumanoidDied ]]
                    -- upvalues: v138 (copy)
                    if v138 then
                        v138:Disconnect();
                    end;
                end;
            else
                return function() --[[ Line: 216 ]]

                end;
            end;
        end;
        local v140 = v118.new({
            humanoid = "Humanoid", 
            humanoidRootPart = "HumanoidRootPart"
        }, v139);
        v139 = function(v141) --[[ Line: 227 ]] --[[ Name: onCharacterAdded ]]
            -- upvalues: v114 (ref), v123 (copy), v31 (ref), l_Players_0 (ref), v120 (ref), l_LocalCharacterLoaded_0 (ref), l_getFFlagUseCharacterStore_0 (ref), l_context_0 (ref), l_CharacterAdded_0 (ref), v140 (copy)
            if not v141.Parent then
                v114(v141.AncestryChanged, v123.CharacterAdded);
            end;
            if v123.Character ~= v141 or not v141.Parent then
                v31:debug("Mismatched or unparented character in onCharacterAdded for {}", (tostring(v123.UserId)));
                return;
            else
                if v123 == l_Players_0.LocalPlayer then
                    v31:debug("Local character loaded: {}", v141.Name);
                    v120:dispatch(l_LocalCharacterLoaded_0(v141));
                end;
                if l_getFFlagUseCharacterStore_0() then
                    l_context_0.characterStore.handleCharacterAdded(v123.UserId, v141);
                else
                    v120:dispatch(l_CharacterAdded_0(v123.UserId, v141));
                end;
                v140:bindRoot(v141);
                return;
            end;
        end;
        local function v143(v142) --[[ Line: 251 ]] --[[ Name: onCharacterRemoving ]]
            -- upvalues: v140 (copy)
            v140:unbindRoot(v142);
        end;
        if v123.Character then
            v139(v123.Character);
        end;
        local v144 = v123.CharacterAdded:Connect(v139);
        local v145 = v123.CharacterRemoving:Connect(v143);
        if not v122[v123.UserId] then
            v122[v123.UserId] = {
                v144, 
                v145
            };
        end;
    end;
    local function v150(v147) --[[ Line: 269 ]] --[[ Name: onNewPlayerAdded ]]
        -- upvalues: v146 (copy), l_Players_0 (ref), v9 (ref), v64 (ref), v119 (copy), v31 (ref)
        v146(v147);
        if l_Players_0.LocalPlayer then
            v9.try(function() --[[ Line: 273 ]]
                -- upvalues: v147 (copy), l_Players_0 (ref)
                if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                    return v147:IsFriendsWithAsync(l_Players_0.LocalPlayer.UserId);
                else
                    return v147:IsFriendsWith(l_Players_0.LocalPlayer.UserId);
                end;
            end):andThen(function(v148) --[[ Line: 280 ]]
                -- upvalues: v64 (ref), v147 (copy), v119 (ref)
                if v148 then
                    v64("InGame.UnknownNamespace.GameChat_FriendChatNotifier_JoinMessage", {
                        RBX_NAME = v147.DisplayName
                    }, "Roblox.Notification.Friend.Joined", v119.translator, v119.defaultSystemTextChannel);
                end;
            end):catch(function(v149) --[[ Line: 291 ]]
                -- upvalues: v31 (ref)
                v31:error("Could not fetch friendship status. Error: {}", (tostring(v149)));
            end);
        end;
    end;
    for _, v152 in pairs(l_Players_0:GetPlayers()) do
        if v152:IsA("Player") then
            v146(v152);
        end;
    end;
    l_Players_0.PlayerAdded:Connect(v150);
    l_Players_0.PlayerRemoving:Connect(function(v153) --[[ Line: 306 ]]
        -- upvalues: v31 (ref), v120 (copy), l_PlayerRemoved_0 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v121 (copy), l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), l_getFFlagUseCharacterStore_0 (ref), v122 (copy)
        v31:trace("Player removed: {} {}", v153.Name, (tostring(v153.UserId)));
        v120:dispatch(l_PlayerRemoved_0(v153.UserId));
        if l_FFlagExpChatUseMessagesStore_0 then
            v121.handlePlayerRemoved(v153.UserId);
        end;
        if l_FFlagExpChatUseAdorneeStore_0 then
            l_context_0.adorneeStore.handlePlayerRemoved(v153.UserId);
        end;
        if l_getFFlagUseCharacterStore_0() then
            l_context_0.characterStore.handlePlayerRemoved(v153.UserId);
        end;
        local v154 = v122[v153.UserId];
        if v154 then
            for _, v156 in ipairs(v154) do
                v156:Disconnect();
            end;
            v122[v153.UserId] = nil;
        end;
    end);
end;
local v159 = {
    canUserChatAsync = function(v158) --[[ Line: 359 ]] --[[ Name: canUserChatAsync ]]
        -- upvalues: l_Chat_0 (copy)
        return l_Chat_0:CanUserChatAsync(v158);
    end
};
local function v162(v160) --[[ Line: 364 ]]
    -- upvalues: v31 (copy), v11 (copy)
    v31:trace("System OnIncomingMessage started: {} {}", v160.PrefixText, v160.Text);
    local l_TextChatMessageProperties_0 = Instance.new("TextChatMessageProperties");
    l_TextChatMessageProperties_0.Text = string.format("<font color=\"#%s\">%s</font>", if string.find(v160.Metadata, "Error") then v11.App.Style.Colors.Red:ToHex() else v11.App.Style.Colors.LightGrey:ToHex(), v160.Text);
    v31:trace("System OnIncomingMessage finished: {} {}", l_TextChatMessageProperties_0.PrefixText, l_TextChatMessageProperties_0.Text);
    return l_TextChatMessageProperties_0;
end;
return function(v163) --[[ Line: 380 ]]
    -- upvalues: v31 (copy), l_Dictionary_0 (copy), v159 (copy), v34 (copy), v32 (copy), v33 (copy), l_watchForErrors_0 (copy), l_context_0 (copy), l_FFlagExpChatUseAdorneeStore_0 (copy), v18 (copy), l_FFlagExpChatUseProximityStore_0 (copy), v27 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), v19 (copy), l_FFlagExpChatUseChannelTabsStore_0 (copy), v20 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy), v23 (copy), v84 (copy), v24 (copy), l_getFFlagUseCharacterStore_0 (copy), v22 (copy), l_Analytics_0 (copy), v78 (copy), l_UserInputService_0 (copy), v52 (copy), v162 (copy), l_Chat_0 (copy), l_TextChatService_0 (copy), v112 (copy), v113 (copy), l_GetFFlagExpChatFOMOUpsellImpressionsCountEnabled_0 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), l_HttpService_0 (copy), l_FStringExpChatFOMOUpsellImpressionsCountKey_0 (copy), l_Players_0 (copy), v64 (copy), l_TextChannelCreated_0 (copy), v79 (copy), v35 (copy), v81 (copy), v66 (copy), l_FFlagExpChatPerfTracking_0 (copy), v75 (copy), v36 (copy), v67 (copy), v80 (copy), v21 (copy), v41 (copy), v86 (copy), v72 (copy), v88 (copy), v110 (copy), l_TextChannelRemoved_0 (copy), v43 (copy), l_countParticipantsInTextChannel_0 (copy), v60 (copy), l_LocalTextChannelParticipantRemoved_0 (copy), v42 (copy), v58 (copy), v59 (copy), v77 (copy), l_Commands_0 (copy), l_CommandAliasChanged_0 (copy), v9 (copy), v53 (copy), v54 (copy), v157 (copy), v11 (copy), v10 (copy), v30 (copy), v83 (copy), l_ClientAppLoaded_0 (copy), l_StarterGui_0 (copy), v116 (copy), l_Version_0 (copy), v69 (copy), v89 (copy), v37 (copy), l_GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled_0 (copy), l_FIntMaxExpChatUnlockChatButtonImpressionsCount_0 (copy), v71 (copy), l_ExpChatNewHiddenMessagesExperimentation_0 (copy), v90 (copy), v91 (copy), v62 (copy), v70 (copy), v92 (copy), v73 (copy), v94 (copy), v74 (copy), l_GetFFlagExpChatUserMessageIntentSentCooldown_0 (copy), v95 (copy), l_FFlagEnableModerateChatRemoteEvent_0 (copy), v65 (copy), v25 (copy), v17 (copy), v15 (copy), v93 (copy), v63 (copy)
    v31:trace("mountClientApp started");
    v163 = l_Dictionary_0.join(v159, v163);
    local v164 = v34();
    v32(v164);
    v33:flush();
    l_watchForErrors_0(game:GetService("ScriptContext"), v163.script, false);
    l_context_0.translator = v163.translator;
    l_context_0.store = v164;
    if l_FFlagExpChatUseAdorneeStore_0 then
        l_context_0.adorneeStore = v18(false);
    end;
    if l_FFlagExpChatUseProximityStore_0 then
        l_context_0.proximityStore = v27(false);
    end;
    local v165 = if l_FFlagExpChatUseMessagesStore_0 then v19(false) else nil;
    local v166 = if l_FFlagExpChatUseChannelTabsStore_0 then v20(false) else nil;
    local v167 = if l_FFlagExpChatUseChatConfigStore_0 then v23(false) else nil;
    local v168 = if v84 then v24(false) else nil;
    if l_FFlagExpChatUseMessagesStore_0 then
        l_context_0.messagesStore = v165;
    end;
    if l_getFFlagUseCharacterStore_0() then
        l_context_0.characterStore = v22(false);
    end;
    if v163.analytics then
        l_Analytics_0.with(v163.analytics);
    end;
    if not v78() then
        l_UserInputService_0.LastInputTypeChanged:Connect(function(v169) --[[ Line: 423 ]]
            -- upvalues: v164 (copy), v52 (ref)
            v164:dispatch(v52(v169));
        end);
    end;
    if v163.defaultSystemTextChannel then
        v163.defaultSystemTextChannel.OnIncomingMessage = v162;
    else
        l_Chat_0:GetPropertyChangedSignal("IsAutoMigrated"):Once(function() --[[ Line: 431 ]]
            -- upvalues: l_TextChatService_0 (ref), v163 (ref), v162 (ref)
            local l_l_TextChatService_0_FirstChild_0 = l_TextChatService_0:FindFirstChild("RBXSystem", true);
            if l_l_TextChatService_0_FirstChild_0 and l_l_TextChatService_0_FirstChild_0:IsA("TextChannel") then
                v163.defaultSystemTextChannel = l_l_TextChatService_0_FirstChild_0;
                l_l_TextChatService_0_FirstChild_0.OnIncomingMessage = v162;
            end;
        end);
    end;
    v112(v164, v163);
    v113(v164);
    local v171 = 1;
    if l_GetFFlagExpChatFOMOUpsellImpressionsCountEnabled_0() then
        local v172 = {};
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 451 ]]
            -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref)
            return l_AppStorageService_0:GetItem(l_LocalStorageKey_0.ExpChatFOMOUpsellImpressionsCount);
        end);
        if l_status_1 and l_result_1 ~= "" then
            local l_l_result_1_0 = l_result_1 --[[ copy: 9 -> 35 ]];
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 456 ]]
                -- upvalues: l_HttpService_0 (ref), l_l_result_1_0 (copy)
                return l_HttpService_0:JSONDecode(l_l_result_1_0);
            end);
            if l_status_2 then
                v172 = l_result_2;
            end;
        end;
        if v172[l_FStringExpChatFOMOUpsellImpressionsCountKey_0] then
            v171 = v172[l_FStringExpChatFOMOUpsellImpressionsCountKey_0] + 1;
        end;
        v172[l_FStringExpChatFOMOUpsellImpressionsCountKey_0] = v171;
        l_AppStorageService_0:SetItem(l_LocalStorageKey_0.ExpChatFOMOUpsellImpressionsCount, l_HttpService_0:JSONEncode(v172));
        l_AppStorageService_0:Flush();
    end;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if l_LocalPlayer_0 then
        l_LocalPlayer_0:GetPropertyChangedSignal("Team"):Connect(function() --[[ Line: 478 ]]
            -- upvalues: l_LocalPlayer_0 (copy), v64 (ref), v163 (ref)
            local l_Team_0 = l_LocalPlayer_0.Team;
            if l_Team_0 then
                v64("InGame.UnknownNamespace.GameChat_TeamChat_NowInTeam", {
                    RBX_NAME = l_Team_0.Name
                }, "Roblox.Team.Success.NowInTeam", v163.translator, v163.defaultSystemTextChannel);
            end;
        end);
    end;
    local function v199(v180) --[[ Line: 492 ]] --[[ Name: handleMessageReceived ]]
        -- upvalues: v164 (copy), l_TextChannelCreated_0 (ref), v79 (ref), l_TextChatService_0 (ref), v35 (ref), v81 (ref), v31 (ref), l_Players_0 (ref), l_LocalPlayer_0 (copy), v66 (ref), v163 (ref), l_FFlagExpChatPerfTracking_0 (ref), v75 (ref), v36 (ref), v67 (ref), v64 (ref), v80 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v165 (copy), v21 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v166 (copy), v41 (ref), v86 (ref), v72 (ref), v88 (ref), l_Analytics_0 (ref), v110 (ref)
        v164:dispatch(l_TextChannelCreated_0(v180));
        local v181 = false;
        if v79() then
            local l_ChannelTabsConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChannelTabsConfiguration");
            if l_ChannelTabsConfiguration_0 then
                v181 = l_ChannelTabsConfiguration_0.Enabled;
            end;
        end;
        if string.find(v180.Name, "RBXGeneral") then
            v180.OnIncomingMessage = function(v183) --[[ Line: 504 ]]
                -- upvalues: v35 (ref), v81 (ref)
                local l_TextChatMessageProperties_1 = Instance.new("TextChatMessageProperties");
                if v183.TextSource then
                    local v185 = v35(v183.TextSource.UserId);
                    if not v81() or not v183.ChatWindowMessageProperties then
                        l_TextChatMessageProperties_1.PrefixText = string.format("<font color=\"#%s\">%s</font>", v185:ToHex(), v183.PrefixText);
                    end;
                end;
                return l_TextChatMessageProperties_1;
            end;
        elseif string.find(v180.Name, "^RBXTeam") then
            v180.OnIncomingMessage = function(v186) --[[ Line: 518 ]]
                -- upvalues: v31 (ref), l_Players_0 (ref), v181 (ref)
                v31:trace("Team OnIncomingMessage started: {} {}", v186.PrefixText, v186.Text);
                local l_TextChatMessageProperties_2 = Instance.new("TextChatMessageProperties");
                if l_Players_0.LocalPlayer then
                    local l_Color_0 = l_Players_0.LocalPlayer.TeamColor.Color;
                    local v189 = v181 and "" or "[Team] ";
                    l_TextChatMessageProperties_2.PrefixText = string.format("<font color=\"#%s\">%s%s</font>", l_Color_0:ToHex(), v189, v186.PrefixText);
                end;
                v31:trace("Team OnIncomingMessage finished: {} {}", l_TextChatMessageProperties_2.PrefixText, l_TextChatMessageProperties_2.Text);
                return l_TextChatMessageProperties_2;
            end;
        elseif string.find(v180.Name, "^RBXWhisper") and l_LocalPlayer_0 then
            v180.OnIncomingMessage = function(v190) --[[ Line: 539 ]]
                -- upvalues: v66 (ref), v180 (copy), l_LocalPlayer_0 (ref), v181 (ref), v163 (ref), v35 (ref)
                local l_TextSource_0 = v190.TextSource;
                if l_TextSource_0 then
                    local v192 = v66(v180, l_LocalPlayer_0);
                    if v192 then
                        local v193 = nil;
                        if not v181 then
                            v193 = if l_TextSource_0.UserId == l_LocalPlayer_0.UserId then v163.translator:FormatByKey("CoreScripts.TextChat.WhisperChat.PrefixText.Outgoing", {
                                RBX_NAME = v192
                            }) else v163.translator:FormatByKey("CoreScripts.TextChat.WhisperChat.PrefixText.Incoming", {
                                RBX_NAME = v192
                            });
                        end;
                        local l_TextChatMessageProperties_3 = Instance.new("TextChatMessageProperties");
                        local v195 = v35(l_TextSource_0.UserId);
                        l_TextChatMessageProperties_3.PrefixText = string.format("%s<font color=\"#%s\">%s</font>", if v193 then v193 .. " " else "", v195:ToHex(), v190.PrefixText);
                        return l_TextChatMessageProperties_3;
                    end;
                end;
                return nil;
            end;
        end;
        v180.MessageReceived:Connect(function(v196) --[[ Line: 576 ]]
            -- upvalues: v31 (ref), l_FFlagExpChatPerfTracking_0 (ref), l_LocalPlayer_0 (ref), v75 (ref), v36 (ref), v67 (ref), v64 (ref), v163 (ref), v80 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v165 (ref), v21 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v166 (ref), v164 (ref), v41 (ref), v86 (ref), v72 (ref), v88 (ref), l_Analytics_0 (ref), v110 (ref)
            v31:debug("Incoming MessageReceived Status: {} Text: {}", v196.Status.Name, v196.Text);
            if l_FFlagExpChatPerfTracking_0 and (v196.TextSource and v196.TextSource.UserId or "UNKNOWN_TEXT_SOURCE_USER_ID") ~= (l_LocalPlayer_0 and l_LocalPlayer_0.UserId or "UNKNOWN_LOCAL_USER_ID") then
                v75.start(v75.Events.MessageReceiveToWindowRenderInterval, {
                    messageId = v196.MessageId
                });
            end;
            if l_LocalPlayer_0 then
                v36(l_LocalPlayer_0.UserId, v196);
            end;
            if l_LocalPlayer_0 and v196.TextSource and v196.TextSource.UserId ~= l_LocalPlayer_0.UserId then
                local v197 = v67(v196, l_LocalPlayer_0);
                if v197 then
                    v64(v197.key, v197.args, v197.metadata, v163.translator, if v80() then v196.TextChannel else v163.defaultSystemTextChannel);
                end;
            end;
            local v198 = l_LocalPlayer_0 and v196.TextSource and v196.TextSource.UserId == l_LocalPlayer_0.UserId;
            if l_FFlagExpChatUseMessagesStore_0 then
                v165.handleIncomingOrOutgoingMessage(v196, v198);
                v21(false).resetTextTransparency();
                if l_FFlagExpChatUseChannelTabsStore_0 and v166 then
                    v166.handleIncomingOrOutgoingMessage(v196, v198);
                end;
            else
                v164:dispatch(v41(v196, v198));
                v21(false).resetTextTransparency();
            end;
            if v196.Status == Enum.TextChatMessageStatus.Floodchecked then
                v64("CoreScripts.TextChat.MessageStatus.Warning.Floodchecked", nil, "Roblox.MessageStatus.Warning.Floodchecked", v163.translator, v163.defaultSystemTextChannel);
            elseif v196.Status == Enum.TextChatMessageStatus.TextFilterFailed then
                v64("CoreScripts.TextChat.MessageStatus.Warning.TextFilterFailed", nil, "Roblox.MessageStatus.Warning.TextFilterFailed", v163.translator, v163.defaultSystemTextChannel);
            elseif v196.Status == Enum.TextChatMessageStatus.InvalidPrivacySettings then
                v64("CoreScripts.TextChat.MessageStatus.Warning.InvalidPrivacySettings", nil, "Roblox.MessageStatus.Warning.InvalidPrivacySettings", v163.translator, v163.defaultSystemTextChannel);
            elseif v196.Status == Enum.TextChatMessageStatus.MessageTooLong then
                v64("CoreScripts.TextChat.MessageStatus.Warning.MessageTooLong", nil, "Roblox.MessageStatus.Warning.MessageTooLong", v163.translator, v163.defaultSystemTextChannel);
            elseif v196.Status == Enum.TextChatMessageStatus.ModerationTimeout then
                v64("CoreScripts.TextChat.MessageStatus.Warning.ModerationTimeout", nil, "Roblox.MessageStatus.Warning.ModerationTimeout", v163.translator, v163.defaultSystemTextChannel);
            elseif v196.Status == Enum.TextChatMessageStatus.Unknown then
                v64("CoreScripts.TextChat.MessageStatus.Warning.Unknown", nil, "Roblox.MessageStatus.Warning.Unknown", v163.translator, v163.defaultSystemTextChannel);
            end;
            if v86 then
                if v72(v88) then
                    l_Analytics_0:TelemetryLogEvent(v110, {
                        messageStatus = v196.Status.Name
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
                    messageStatus = v196.Status.Name
                });
            end;
        end);
    end;
    local function _(v200) --[[ Line: 699 ]] --[[ Name: watchTextChatCommand ]]
        -- upvalues: l_Analytics_0 (ref)
        v200.Triggered:Connect(function() --[[ Line: 700 ]]
            -- upvalues: l_Analytics_0 (ref), v200 (copy)
            l_Analytics_0.FireClientAnalyticsWithEventName("CommandSent", {
                commandName = v200.Name
            });
        end);
    end;
    for _, v203 in pairs(l_TextChatService_0:GetDescendants()) do
        if v203:IsA("TextChannel") then
            v199(v203);
        elseif v203:IsA("TextChatCommand") then
            v203.Triggered:Connect(function() --[[ Line: 700 ]]
                -- upvalues: l_Analytics_0 (ref), v203 (copy)
                l_Analytics_0.FireClientAnalyticsWithEventName("CommandSent", {
                    commandName = v203.Name
                });
            end);
        end;
    end;
    l_TextChatService_0.DescendantAdded:Connect(function(v204) --[[ Line: 716 ]]
        -- upvalues: v199 (copy), l_Analytics_0 (ref)
        if v204:IsA("TextChannel") then
            v199(v204);
            return;
        else
            if v204:IsA("TextChatCommand") then
                v204.Triggered:Connect(function() --[[ Line: 700 ]]
                    -- upvalues: l_Analytics_0 (ref), v204 (copy)
                    l_Analytics_0.FireClientAnalyticsWithEventName("CommandSent", {
                        commandName = v204.Name
                    });
                end);
            end;
            return;
        end;
    end);
    l_TextChatService_0.DescendantRemoving:Connect(function(v205) --[[ Line: 724 ]]
        -- upvalues: v164 (copy), l_TextChannelRemoved_0 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v166 (copy)
        if v205:IsA("TextChannel") then
            v164:dispatch(l_TextChannelRemoved_0(v205));
            if l_FFlagExpChatUseChannelTabsStore_0 and v166 then
                v166.handleChannelRemoved(v205);
            end;
        end;
    end);
    l_TextChatService_0.SendingMessage:Connect(function(v206) --[[ Line: 734 ]]
        -- upvalues: l_FFlagExpChatPerfTracking_0 (ref), v75 (ref), v31 (ref), l_LocalPlayer_0 (copy), v67 (ref), v64 (ref), v163 (ref), v80 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v165 (copy), v164 (copy), v43 (ref), l_Analytics_0 (ref), l_countParticipantsInTextChannel_0 (ref)
        if l_FFlagExpChatPerfTracking_0 then
            v75.start(v75.Events.MessageSendToWindowRenderInterval, {
                messageId = v206.MessageId
            });
        end;
        v31:debug("Outgoing SendingMessage Status: {} Text: {}", v206.Status.Name, v206.Text);
        if l_LocalPlayer_0 then
            local v207 = v67(v206, l_LocalPlayer_0);
            if v207 and v207.key then
                v64(v207.key, v207.args, v207.metadata, v163.translator, if v80() then v206.TextChannel else v163.defaultSystemTextChannel);
            end;
        end;
        if l_FFlagExpChatUseMessagesStore_0 then
            v165.handleIncomingOrOutgoingMessage(v206, true);
        else
            v164:dispatch(v43(v206));
        end;
        local l_TextChannel_0 = v206.TextChannel;
        if l_TextChannel_0 then
            l_Analytics_0.FireClientAnalyticsWithEventName("MessageSent", {
                channelName = l_TextChannel_0.Name, 
                totalParticipants = l_countParticipantsInTextChannel_0(l_TextChannel_0)
            });
        end;
    end);
    local function _(v209) --[[ Line: 772 ]] --[[ Name: isInstanceALocalTextChannelParticipant ]]
        -- upvalues: l_Players_0 (ref)
        return v209 and v209:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v209.UserId;
    end;
    if v79() then
        for _, v212 in pairs(l_TextChatService_0:GetDescendants()) do
            if v212.Parent and v212.Parent:IsA("TextChannel") and v212 and v212:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v212.UserId then
                v164:dispatch(v60(v212.Parent));
                if l_FFlagExpChatUseChannelTabsStore_0 and v166 then
                    local l_Name_0 = v212.Parent.Name;
                    if l_Name_0 ~= "RBXSystem" then
                        local v214 = l_Name_0 == "RBXGeneral" and 1 or 2;
                        v166.addChannelTab(l_Name_0, v214);
                    end;
                end;
            end;
            if v212:IsA("TextChannel") then
                v212.DescendantRemoving:Connect(function(v215) --[[ Line: 802 ]]
                    -- upvalues: l_Players_0 (ref), v164 (copy), l_LocalTextChannelParticipantRemoved_0 (ref), v212 (copy), l_FFlagExpChatUseChannelTabsStore_0 (ref), v166 (copy)
                    if v215 and v215:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v215.UserId then
                        v164:dispatch(l_LocalTextChannelParticipantRemoved_0(v212));
                        if l_FFlagExpChatUseChannelTabsStore_0 and v166 then
                            local l_Name_1 = v212.Name;
                            v166.removeChannelTab(l_Name_1);
                        end;
                    end;
                end);
            end;
        end;
        l_TextChatService_0.DescendantAdded:Connect(function(v217) --[[ Line: 816 ]]
            -- upvalues: l_Players_0 (ref), v164 (copy), v60 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v166 (copy), l_LocalTextChannelParticipantRemoved_0 (ref)
            if v217.Parent and v217.Parent:IsA("TextChannel") and v217 and v217:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v217.UserId then
                v164:dispatch(v60(v217.Parent));
                if l_FFlagExpChatUseChannelTabsStore_0 and v166 then
                    local l_Name_2 = v217.Parent.Name;
                    if l_Name_2 ~= "RBXSystem" then
                        local v219 = l_Name_2 == "RBXGeneral" and 1 or 2;
                        v166.addChannelTab(l_Name_2, v219);
                    end;
                end;
            end;
            if v217:IsA("TextChannel") then
                v217.DescendantRemoving:Connect(function(v220) --[[ Line: 838 ]]
                    -- upvalues: l_Players_0 (ref), v164 (ref), l_LocalTextChannelParticipantRemoved_0 (ref), v217 (copy), l_FFlagExpChatUseChannelTabsStore_0 (ref), v166 (ref)
                    if v220 and v220:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v220.UserId then
                        v164:dispatch(l_LocalTextChannelParticipantRemoved_0(v217));
                        if l_FFlagExpChatUseChannelTabsStore_0 and v166 then
                            local l_Name_3 = v217.Name;
                            v166.removeChannelTab(l_Name_3);
                        end;
                    end;
                end);
            end;
        end);
    end;
    local function v231(v222, v223, v224) --[[ Line: 853 ]] --[[ Name: runOnBubbleDisplayed ]]
        -- upvalues: l_Players_0 (ref), l_HttpService_0 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v165 (copy), v164 (copy), v42 (ref)
        local v225 = nil;
        if v222:IsA("Model") then
            v225 = l_Players_0:GetPlayerFromCharacter(v222);
        end;
        local v226 = l_HttpService_0:GenerateGUID(false);
        local v227 = nil;
        local v228 = nil;
        if v224 then
            v226 = v224.MessageId;
            v227 = v224.BubbleChatMessageProperties;
            v228 = v224.Translation;
        end;
        local v229 = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000);
        local v230 = {
            message = v223, 
            translation = v228, 
            bubbleChatMessageId = v226, 
            bubbleChatMessageUserId = v225 and tostring(v225.UserId) or nil, 
            partOrModel = v222, 
            timestamp = v229, 
            bubbleChatMessageProperties = v227
        };
        if l_FFlagExpChatUseMessagesStore_0 then
            v165.handleIncomingBubbleChatMessage(v230);
            return;
        else
            v164:dispatch(v42(v230));
            return;
        end;
    end;
    l_Chat_0.Chatted:Connect(function(v232, v233) --[[ Line: 886 ]]
        -- upvalues: l_TextChatService_0 (ref), l_Chat_0 (ref), v231 (copy)
        if l_TextChatService_0.ChatVersion ~= Enum.ChatVersion.LegacyChatService or l_Chat_0.BubbleChatEnabled then
            v231(v232, v233);
        end;
    end);
    local function v235() --[[ Line: 893 ]]
        -- upvalues: l_Chat_0 (ref), v164 (copy), v58 (ref)
        local l_BubbleChatEnabled_0 = l_Chat_0.BubbleChatEnabled;
        v164:dispatch(v58("Enabled", l_BubbleChatEnabled_0));
    end;
    l_Chat_0:GetPropertyChangedSignal("BubbleChatEnabled"):Connect(v235);
    local l_BubbleChatEnabled_1 = l_Chat_0.BubbleChatEnabled;
    v164:dispatch(v58("Enabled", l_BubbleChatEnabled_1));
    l_Chat_0.BubbleChatSettingsChanged:Connect(function(v237) --[[ Line: 902 ]]
        -- upvalues: v163 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v167 (copy), v164 (copy), v59 (ref)
        if v163.validateLegacyBubbleChatSettings then
            local v238, v239 = v163.validateLegacyBubbleChatSettings(v237);
            assert(v238, "Bad settings object passed to Chat:SetBubbleChatSettings:\n inside consolidated BubbleChat " .. (v239 or ""));
            if l_FFlagExpChatUseMessagesStore_0 and v167 then
                v167.setBubbleChatSettings(v237);
                return;
            else
                v164:dispatch(v59(v237));
            end;
        end;
    end);
    if v77() then
        l_TextChatService_0.BubbleDisplayed:Connect(function(v240, v241) --[[ Line: 920 ]]
            -- upvalues: v231 (copy)
            v231(v240, v241 and v241.Text, v241);
        end);
    end;
    l_BubbleChatEnabled_1 = function(v242) --[[ Line: 925 ]] --[[ Name: findCommandInstance ]]
        -- upvalues: l_TextChatService_0 (ref)
        for _, v244 in ipairs(l_TextChatService_0:GetDescendants()) do
            if v244.Name == v242 and v244:IsA("TextChatCommand") then
                return v244;
            end;
        end;
        return nil;
    end;
    local v245 = {};
    local function v253() --[[ Line: 936 ]] --[[ Name: setupTextChatCommands ]]
        -- upvalues: l_Commands_0 (ref), l_BubbleChatEnabled_1 (copy), v245 (copy), l_FFlagExpChatUseMessagesStore_0 (ref), v164 (copy), l_context_0 (ref), v64 (ref), v163 (ref), l_CommandAliasChanged_0 (ref)
        for _, v247 in ipairs(l_Commands_0.enabledCommands) do
            if v247.clientRun then
                local v248 = l_BubbleChatEnabled_1(v247.name);
                if v248 and not v245[v248] then
                    v245[v248] = true;
                    v248.Triggered:Connect(function(v249, ...) --[[ Line: 947 ]]
                        -- upvalues: l_FFlagExpChatUseMessagesStore_0 (ref), v247 (copy), v164 (ref), l_context_0 (ref), v64 (ref), v163 (ref)
                        local v250 = nil;
                        v250 = if l_FFlagExpChatUseMessagesStore_0 then v247.clientRun(v164, v249.UserId, ..., l_context_0) else v247.clientRun(v164, v249.UserId, ...);
                        if v250 then
                            v64(v250.key, v250.args, v250.metadata, v163.translator, v163.defaultSystemTextChannel);
                        end;
                    end);
                    if string.find(v248.Name, "RBXTeamCommand") or string.find(v248.Name, "RBXWhisperCommand") then
                        for _, v252 in {
                            "PrimaryAlias", 
                            "SecondaryAlias"
                        } do
                            v248:GetPropertyChangedSignal(v252):Connect(function() --[[ Line: 970 ]]
                                -- upvalues: v164 (ref), l_CommandAliasChanged_0 (ref), v248 (copy)
                                v164:dispatch(l_CommandAliasChanged_0(v248.Name, v248.PrimaryAlias, v248.SecondaryAlias));
                            end);
                        end;
                    end;
                end;
            end;
        end;
    end;
    v253();
    l_Chat_0:GetPropertyChangedSignal("IsAutoMigrated"):Once(v253);
    if v163.canUserChatAsync and l_Players_0.LocalPlayer then
        v9.try(function() --[[ Line: 990 ]]
            -- upvalues: v163 (ref), l_Players_0 (ref)
            return v163.canUserChatAsync(l_Players_0.LocalPlayer.UserId);
        end):andThen(function(v254) --[[ Line: 993 ]]
            -- upvalues: l_FFlagExpChatUseMessagesStore_0 (ref), v165 (copy), v164 (copy), v53 (ref)
            if l_FFlagExpChatUseMessagesStore_0 then
                v165.setCanLocalUserChat(v254);
                return;
            else
                v164:dispatch(v53(v254));
                return;
            end;
        end):catch(function() --[[ Line: 1000 ]]
            -- upvalues: l_FFlagExpChatUseMessagesStore_0 (ref), v165 (copy), v164 (copy), v54 (ref)
            if l_FFlagExpChatUseMessagesStore_0 then
                v165.setCanLocalUserChat(false);
                return;
            else
                v164:dispatch(v54());
                return;
            end;
        end);
    end;
    v157(v163, v164, v165);
    local l_AppStyleProvider_0 = v11.App.Style.AppStyleProvider;
    local l_Constants_0 = v11.App.Style.Constants;
    local l_Dark_0 = l_Constants_0.ThemeName.Dark;
    local l_Gotham_0 = l_Constants_0.FontName.Gotham;
    local v259 = {
        Dark = {
            themeName = l_Dark_0, 
            fontName = l_Gotham_0
        }
    };
    local v260 = v10.createElement(l_AppStyleProvider_0, {
        style = v259.Dark
    }, {
        app = v10.createElement(v30, {
            store = v164, 
            translator = v163.translator, 
            gameTranslator = if v79() then v163.gameTranslator else nil, 
            isChatWindowVisible = true, 
            isChatInputBarVisible = true, 
            isChannelBarVisible = false, 
            isDefaultChatEnabled = true, 
            getIconVoiceIndicator = v163.getIconVoiceIndicator, 
            onClickedVoiceIndicator = v163.onClickedVoiceIndicator, 
            onClickedCameraIndicator = v163.onClickedCameraIndicator, 
            selfViewListenerChanged = v163.selfViewListenerChanged, 
            getPermissions = v163.getPermissions, 
            displayCameraDeniedToast = v163.displayCameraDeniedToast, 
            isCamEnabledForUserAndPlace = v163.isCamEnabledForUserAndPlace, 
            isCameraOnlyUser = v163.isCameraOnlyUser, 
            isVoiceServiceInitialized = v163.isVoiceServiceInitialized, 
            onClickedLikelySpeakingBubble = v163.onClickedLikelySpeakingBubble, 
            isSpatialUIEnabled = v163.isSpatialUIEnabled, 
            expChatLoadStartTime = if v83() then os.clock() else nil
        })
    });
    v164:dispatch(l_ClientAppLoaded_0({
        team = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.Team, 
        isChatCoreGuiEnabled = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Chat), 
        isTouchEnabled = l_UserInputService_0.TouchEnabled, 
        isGamepadEnabled = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Gamepad
    }));
    v116(l_Analytics_0, l_Version_0[1]);
    v31:trace("Roact.mount to {}", (tostring(v163.parent)));
    local v261 = v10.mount(v260, v163.parent, "ExperienceChat");
    local function v263(v262) --[[ Line: 1060 ]] --[[ Name: updateChatStatus ]]
        -- upvalues: v168 (copy), v69 (ref), v64 (ref), v89 (ref), v163 (ref), v37 (ref), l_GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled_0 (ref), v171 (ref), l_FIntMaxExpChatUnlockChatButtonImpressionsCount_0 (ref), v71 (ref)
        v168.setChatStatus(v262);
        if v262 == "GeoBlocked" or v262 ~= "Unknown" and v69() then
            v64(v89 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionIsntAvailable" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionUnavailable", nil, "Roblox.ChatDisabled.Info", v163.translator, v163.defaultSystemTextChannel, v89 and "You can only view system messages here. Chat isn\226\128\153t available in your region." or "You can only view system messages here. Chat is not available in your region.");
            return;
        elseif v262 == "AgeCheckGateExperiment" then
            v64("CoreScripts.TextChat.ChatWindow.ChatDisabled.CheckAgeInAccountInfo", nil, "Roblox.ChatDisabled.Info", v163.translator, v163.defaultSystemTextChannel, "You can only view system messages here. Unlock chat with an age check at Settings > Account info.");
            return;
        elseif v262 == "SettingsDisabled" then
            v64(v89 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.DontMissMessagesUpdateCommsSettings" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.SettingOff", nil, "Roblox.ChatDisabled.Info", v163.translator, v163.defaultSystemTextChannel, v89 and "You can only view system messages here. Update your communication settings to turn on chat." or "You can only view system messages here. Update your Communication settings to turn on chat.");
            return;
        elseif v262 == "SettingsDisabledVpc" then
            v64("CoreScripts.TextChat.ChatWindow.ChatDisabled.AskForPermission", nil, "Roblox.ChatDisabled.Info", v163.translator, v163.defaultSystemTextChannel, "You can only view system messages here. Ask your parent for permission to chat in Communication settings.");
            return;
        elseif v262 == "AgeCheckVpc" then
            v64("CoreScripts.TextChat.ChatWindow.ChatDisabled.AskForPermissionToAgeCheck", nil, "Roblox.ChatDisabled.Info", v163.translator, v163.defaultSystemTextChannel, "You can only view system messages here. Ask your parent for permission to age check in Communication settings.");
            return;
        elseif not v37() and v262 == "AgeVerificationRequired" or v262 == "IdVerificationRequired" then
            v64(v89 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.GetAnAgeCheckInCommsSetting" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.CheckAgeInSettings", nil, "Roblox.ChatDisabled.Info", v163.translator, v163.defaultSystemTextChannel, v89 and "Don\226\128\153t miss messages. Unlock chat with an age check in your communication settings." or "You can only view system messages here. To chat, get an age check in your Communication settings.");
            return;
        elseif v262 == "AgeVerificationRequired" then
            if l_GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled_0() and l_FIntMaxExpChatUnlockChatButtonImpressionsCount_0 < v171 then
                v64("CoreScripts.TextChat.ChatWindow.ChatDisabled.GetAnAgeCheckInCommsSetting", nil, "Roblox.ChatDisabled.Info", v163.translator, v163.defaultSystemTextChannel, "Don\226\128\153t miss messages. Unlock chat with an age check in your communication settings.");
                return;
            else
                v64(v89 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.DontMissMessages" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.GetAnAgeCheck", nil, "Roblox.ChatDisabled.Info", v163.translator, v163.defaultSystemTextChannel, v89 and "Don\226\128\153t miss messages. Unlock chat with an age check." or "You can only view system messages here. Get an age check to chat.");
                return;
            end;
        elseif v262 == "EnabledBubble" or v262 == "Enabled" and v71() then
            v64("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatInRegion", nil, "Roblox.ChatEnabled.Info", v163.translator, v163.defaultSystemTextChannel, "You can view system messages and chat with users in your region only.");
            return;
        elseif v262 == "Enabled" then
            v64("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAndTC", nil, "Roblox.ChatEnabled.Info", v163.translator, v163.defaultSystemTextChannel, "Only people in similar age groups and your Trusted Connections can chat with you.");
            return;
        else
            if v262 == "AllUsers" or v262 == "NoOne" then
                if getChatTranslationEnabled() then
                    v64("CoreScripts.TextChat.ChatTranslation.ChatWindow.SystemMessageNew", nil, "Roblox.ChatTranslation.ChatWindow.SystemMessage", v163.translator, v163.defaultSystemTextChannel, "Roblox automatically translates supported languages in chat");
                    return;
                end;
            elseif v262 == "Ineligible" or v262 ~= "Unknown" then
                v64("CoreScripts.TextChat.ChatWindow.ChatDisabled.OnlyViewSystemMessages", nil, "Roblox.ChatDisabled.Info", v163.translator, v163.defaultSystemTextChannel, "You can only view system messages here.");
            end;
            return;
        end;
    end;
    local v264 = l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatNewHiddenMessagesSystemMessageNudgeEnabled() and 0 or nil;
    local v265 = if l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatNewHiddenMessagesSystemMessageNudgeEnabled() then math.random(v90, v91) else nil;
    local function v267(v266) --[[ Line: 1232 ]] --[[ Name: handleUserMessageIntentSent ]]
        -- upvalues: v31 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v165 (copy), v164 (copy), v62 (ref), l_ExpChatNewHiddenMessagesExperimentation_0 (ref), v70 (ref), l_LocalPlayer_0 (copy), v264 (ref), v265 (ref), v90 (ref), v91 (ref), v64 (ref), v163 (ref), v21 (ref)
        v31:debug("Handling a message from UserMessageIntentSent");
        if l_FFlagExpChatUseMessagesStore_0 then
            v165.handleHiddenMessageReceived(v266);
        else
            v164:dispatch(v62(v266));
        end;
        if l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatNewHiddenMessagesSystemMessageNudgeEnabled() and not v70(l_LocalPlayer_0.ChatAvailabilityStatus) then
            v264 = v264 + 1;
            if v264 == v265 then
                v265 = v265 + math.random(v90, v91);
                v64("CoreScripts.TextChat.ChatWindow.ChatDisabled.DontMissMessages", nil, "Roblox.ChatDisabled.Info", v163.translator, v163.defaultSystemTextChannel, "Don\226\128\153t miss messages. Unlock chat with an age check.");
            end;
        end;
        v21(false).resetTextTransparency();
    end;
    local function _() --[[ Line: 1266 ]] --[[ Name: shouldConnectToUserMessageIntentSent ]]
        -- upvalues: v92 (ref), v73 (ref), v94 (ref), v74 (ref), l_GetFFlagExpChatUserMessageIntentSentCooldown_0 (ref), v171 (ref), v95 (ref)
        local v268 = v92 and v73();
        local v269 = v94 and v74();
        if l_GetFFlagExpChatUserMessageIntentSentCooldown_0() then
            return v269 or v268 and v171 <= v95;
        else
            return v268 or v269;
        end;
    end;
    if v84 and l_LocalPlayer_0 then
        if l_FFlagEnableModerateChatRemoteEvent_0 then
            local v271 = v65();
            local v272 = v25(false);
            local v273 = false;
            local l_v272_0 = v272 --[[ copy: 29 -> 33 ]];
            local l_v271_0 = v271 --[[ copy: 28 -> 34 ]];
            do
                local l_v273_0 = v273;
                v163.moderateChatStoreDisposeEffect = v17.createEffect(function(v277) --[[ Line: 1285 ]]
                    -- upvalues: l_v272_0 (copy), l_v273_0 (ref), v64 (ref), v163 (ref), v15 (ref), v11 (ref), l_v271_0 (copy)
                    local v278 = l_v272_0.getIsSettingEnabled(v277);
                    if v278 ~= l_v273_0 then
                        if v278 then
                            v64("CoreScripts.TextChat.MessageStatus.Warning.ModerateChatOn", nil, "Roblox.MessageStatus.Warning.ModerateChatOn", v163.translator, v163.defaultSystemTextChannel);
                            v15.SetUIBloxToast({
                                iconImage = v11.App.ImageSet.Images[l_v271_0.icon.off], 
                                toastSubtitle = v163.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOn.Subtitle"), 
                                toastTitle = v163.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOn.Title")
                            });
                        else
                            v64("CoreScripts.TextChat.MessageStatus.Warning.ModerateChatOff", nil, "Roblox.MessageStatus.Warning.ModerateChatOff", v163.translator, v163.defaultSystemTextChannel);
                            v15.SetUIBloxToast({
                                iconImage = v11.App.ImageSet.Images[l_v271_0.icon.off], 
                                toastSubtitle = v163.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOff.Subtitle"), 
                                toastTitle = v163.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOff.Title")
                            });
                        end;
                        l_v273_0 = v278;
                    end;
                end);
            end;
        end;
        local l_ChatAvailabilityStatus_0 = l_LocalPlayer_0.ChatAvailabilityStatus;
        v31:debug("Local player's initial ChatAvailabilityStatus is {}", l_ChatAvailabilityStatus_0);
        v263(l_ChatAvailabilityStatus_0);
        local v280 = nil;
        local v281 = v92 and v73();
        local v282 = v94 and v74();
        if if l_GetFFlagExpChatUserMessageIntentSentCooldown_0() then v282 or v281 and v171 <= v95 else v281 or v282 then
            l_ExpChatNewHiddenMessagesExperimentation_0.logExposure();
            v31:debug("Connecting to UserMessageIntentSent");
            v280 = l_TextChatService_0.UserMessageIntentSent:Connect(v267);
        end;
        do
            local l_l_ChatAvailabilityStatus_0_0, l_v280_0 = l_ChatAvailabilityStatus_0, v280;
            l_LocalPlayer_0:GetPropertyChangedSignal("ChatAvailabilityStatus"):Connect(function() --[[ Line: 1347 ]]
                -- upvalues: l_l_ChatAvailabilityStatus_0_0 (ref), l_LocalPlayer_0 (copy), v31 (ref), v263 (copy), v92 (ref), v73 (ref), v94 (ref), v74 (ref), l_GetFFlagExpChatUserMessageIntentSentCooldown_0 (ref), v171 (ref), v95 (ref), l_v280_0 (ref), l_ExpChatNewHiddenMessagesExperimentation_0 (ref), l_TextChatService_0 (ref), v267 (copy), v70 (ref), v93 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v165 (copy), v164 (copy), v63 (ref), v21 (ref), v53 (ref)
                l_l_ChatAvailabilityStatus_0_0 = l_LocalPlayer_0.ChatAvailabilityStatus;
                v31:debug("Local player's ChatAvailabilityStatus has changed to {}", l_l_ChatAvailabilityStatus_0_0);
                v263(l_l_ChatAvailabilityStatus_0_0);
                local v285 = v92 and v73();
                local v286 = v94 and v74();
                if (if l_GetFFlagExpChatUserMessageIntentSentCooldown_0() then v286 or v285 and v171 <= v95 else v285 or v286) and not l_v280_0 then
                    l_ExpChatNewHiddenMessagesExperimentation_0.logExposure();
                    v31:debug("Connecting to UserMessageIntentSent");
                    l_v280_0 = l_TextChatService_0.UserMessageIntentSent:Connect(v267);
                end;
                if v92 and v70(l_l_ChatAvailabilityStatus_0_0) and l_v280_0 and (not v94 or not v74()) then
                    v31:debug("Disconnecting from UserMessageIntentSent");
                    l_v280_0:Disconnect();
                    if v93 then
                        if l_FFlagExpChatUseMessagesStore_0 then
                            v165.handleHiddenMessagesCleared();
                        else
                            v164:dispatch(v63());
                        end;
                        v21(false).resetTextTransparency();
                    end;
                end;
                if l_FFlagExpChatUseMessagesStore_0 then
                    v165.setCanLocalUserChat(v70(l_l_ChatAvailabilityStatus_0_0));
                    return;
                else
                    v164:dispatch(v53(v70(l_l_ChatAvailabilityStatus_0_0)));
                    return;
                end;
            end);
        end;
    elseif v69() then
        v64(v89 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionIsntAvailable" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionUnavailable", nil, "Roblox.ChatDisabled.Info", v163.translator, v163.defaultSystemTextChannel, if v84 then v89 and "You can only view system messages here. Chat isn\226\128\153t available in your region." or "You can only view system messages here. Chat is currently unavailable in your region." else "Chat is unavailable in your region. You can still receive system messages.");
    elseif not v84 and getChatTranslationEnabled() then
        v64("CoreScripts.TextChat.ChatTranslation.ChatWindow.SystemMessageNew", nil, "Roblox.ChatTranslation.ChatWindow.SystemMessage", v163.translator, v163.defaultSystemTextChannel, "Roblox automatically translates supported languages in chat");
    end;
    return {
        roactInstance = v261
    };
end;