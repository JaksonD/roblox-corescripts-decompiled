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
local v89 = game:DefineFastFlag("ExpChatUpdateEnabledCopyWithTC", false);
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
local l_ExpChatNewHiddenMessagesExperimentation_0 = require(l_Parent_0.SocialExperiments).ExpChatNewHiddenMessagesExperimentation;
getChatTranslationEnabled = function() --[[ Line: 133 ]] --[[ Name: getChatTranslationEnabled ]]
    -- upvalues: l_TextChatService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 134 ]]
        -- upvalues: l_TextChatService_0 (ref)
        return l_TextChatService_0.ChatTranslationEnabled;
    end);
    return l_status_0 and l_result_0;
end;
local v111 = {
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
local v113 = require(l_helpers_0.setUpConfigurationObjects);
local v114 = require(l_helpers_0.setUpClientSettings);
local v115 = require(l_helpers_0.waitForFirst);
local l_context_0 = v13.context;
local v117 = require(script.reportVersionLoaded);
local l_Version_0 = v13.Version;
local v119 = require(l_script_FirstAncestor_0.AtomicBinding);
local function v158(v120, v121, v122) --[[ Line: 162 ]] --[[ Name: watchPlayersService ]]
    -- upvalues: v31 (copy), v68 (copy), l_PlayerAdded_0 (copy), l_Players_0 (copy), l_LocalTeamChanged_0 (copy), v85 (copy), l_FFlagExpChatUseAdorneeStore_0 (copy), l_context_0 (copy), v57 (copy), v56 (copy), v119 (copy), v115 (copy), l_LocalCharacterLoaded_0 (copy), l_getFFlagUseCharacterStore_0 (copy), l_CharacterAdded_0 (copy), v9 (copy), v64 (copy), l_PlayerRemoved_0 (copy), l_FFlagExpChatUseMessagesStore_0 (copy)
    v31:trace("Watching Players service");
    local v123 = {};
    local function v147(v124) --[[ Line: 166 ]] --[[ Name: onPlayerAdded ]]
        -- upvalues: v31 (ref), v68 (ref), v121 (copy), l_PlayerAdded_0 (ref), l_Players_0 (ref), l_LocalTeamChanged_0 (ref), v85 (ref), l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v57 (ref), v56 (ref), v119 (ref), v115 (ref), l_LocalCharacterLoaded_0 (ref), l_getFFlagUseCharacterStore_0 (ref), l_CharacterAdded_0 (ref), v123 (copy)
        v31:trace("Player added: {} {}", v124.Name, (tostring(v124.UserId)));
        local v125 = v68(v124) and true or nil;
        v121:dispatch(l_PlayerAdded_0(v124.UserId, v124.Name, v124.DisplayName, v125));
        if v124 == l_Players_0.LocalPlayer then
            v31:trace("Found local player");
            v124:GetPropertyChangedSignal("Team"):Connect(function() --[[ Line: 175 ]]
                -- upvalues: v121 (ref), l_LocalTeamChanged_0 (ref), v124 (copy)
                v121:dispatch(l_LocalTeamChanged_0(v124.Team));
            end);
        end;
        local function _() --[[ Line: 180 ]] --[[ Name: getHumanoidBinding ]]
            -- upvalues: v85 (ref), v124 (copy), l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v121 (ref), v57 (ref), v56 (ref), v119 (ref)
            local function v132(v126) --[[ Line: 183 ]] --[[ Name: dispatchBubbleChatAdornee ]]
                -- upvalues: v85 (ref), v124 (ref), l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v121 (ref), v57 (ref), v56 (ref)
                local l_root_0 = v126.root;
                local l_humanoid_0 = v126.humanoid;
                local l_humanoidRootPart_0 = v126.humanoidRootPart;
                local v130 = v85 and "BasePart" or "Part";
                if l_humanoid_0:IsA("Humanoid") and l_humanoidRootPart_0:IsA(v130) then
                    if l_root_0 and l_humanoidRootPart_0 and v124.Character == l_root_0 then
                        if l_FFlagExpChatUseAdorneeStore_0 then
                            l_context_0.adorneeStore.handleAdorneeAdded(v124.UserId, l_root_0, l_humanoid_0);
                        else
                            v121:dispatch(v57(v124.UserId, l_root_0, l_humanoid_0));
                        end;
                    end;
                    local v131 = l_humanoid_0.Died:Connect(function() --[[ Line: 198 ]]
                        -- upvalues: l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v124 (ref), v121 (ref), v56 (ref)
                        if l_FFlagExpChatUseAdorneeStore_0 then
                            l_context_0.adorneeStore.handleHumanoidDied(v124.UserId);
                            return;
                        else
                            v121:dispatch(v56(v124.UserId));
                            return;
                        end;
                    end);
                    return function() --[[ Line: 206 ]] --[[ Name: disconnectHumanoidDied ]]
                        -- upvalues: v131 (copy)
                        if v131 then
                            v131:Disconnect();
                        end;
                    end;
                else
                    return function() --[[ Line: 217 ]]

                    end;
                end;
            end;
            return (v119.new({
                humanoid = "Humanoid", 
                humanoidRootPart = "HumanoidRootPart"
            }, v132));
        end;
        local function v140(v134) --[[ Line: 183 ]] --[[ Name: dispatchBubbleChatAdornee ]]
            -- upvalues: v85 (ref), v124 (copy), l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v121 (ref), v57 (ref), v56 (ref)
            local l_root_1 = v134.root;
            local l_humanoid_1 = v134.humanoid;
            local l_humanoidRootPart_1 = v134.humanoidRootPart;
            local v138 = v85 and "BasePart" or "Part";
            if l_humanoid_1:IsA("Humanoid") and l_humanoidRootPart_1:IsA(v138) then
                if l_root_1 and l_humanoidRootPart_1 and v124.Character == l_root_1 then
                    if l_FFlagExpChatUseAdorneeStore_0 then
                        l_context_0.adorneeStore.handleAdorneeAdded(v124.UserId, l_root_1, l_humanoid_1);
                    else
                        v121:dispatch(v57(v124.UserId, l_root_1, l_humanoid_1));
                    end;
                end;
                local v139 = l_humanoid_1.Died:Connect(function() --[[ Line: 198 ]]
                    -- upvalues: l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), v124 (ref), v121 (ref), v56 (ref)
                    if l_FFlagExpChatUseAdorneeStore_0 then
                        l_context_0.adorneeStore.handleHumanoidDied(v124.UserId);
                        return;
                    else
                        v121:dispatch(v56(v124.UserId));
                        return;
                    end;
                end);
                return function() --[[ Line: 206 ]] --[[ Name: disconnectHumanoidDied ]]
                    -- upvalues: v139 (copy)
                    if v139 then
                        v139:Disconnect();
                    end;
                end;
            else
                return function() --[[ Line: 217 ]]

                end;
            end;
        end;
        local v141 = v119.new({
            humanoid = "Humanoid", 
            humanoidRootPart = "HumanoidRootPart"
        }, v140);
        v140 = function(v142) --[[ Line: 228 ]] --[[ Name: onCharacterAdded ]]
            -- upvalues: v115 (ref), v124 (copy), v31 (ref), l_Players_0 (ref), v121 (ref), l_LocalCharacterLoaded_0 (ref), l_getFFlagUseCharacterStore_0 (ref), l_context_0 (ref), l_CharacterAdded_0 (ref), v141 (copy)
            if not v142.Parent then
                v115(v142.AncestryChanged, v124.CharacterAdded);
            end;
            if v124.Character ~= v142 or not v142.Parent then
                v31:debug("Mismatched or unparented character in onCharacterAdded for {}", (tostring(v124.UserId)));
                return;
            else
                if v124 == l_Players_0.LocalPlayer then
                    v31:debug("Local character loaded: {}", v142.Name);
                    v121:dispatch(l_LocalCharacterLoaded_0(v142));
                end;
                if l_getFFlagUseCharacterStore_0() then
                    l_context_0.characterStore.handleCharacterAdded(v124.UserId, v142);
                else
                    v121:dispatch(l_CharacterAdded_0(v124.UserId, v142));
                end;
                v141:bindRoot(v142);
                return;
            end;
        end;
        local function v144(v143) --[[ Line: 252 ]] --[[ Name: onCharacterRemoving ]]
            -- upvalues: v141 (copy)
            v141:unbindRoot(v143);
        end;
        if v124.Character then
            v140(v124.Character);
        end;
        local v145 = v124.CharacterAdded:Connect(v140);
        local v146 = v124.CharacterRemoving:Connect(v144);
        if not v123[v124.UserId] then
            v123[v124.UserId] = {
                v145, 
                v146
            };
        end;
    end;
    local function v151(v148) --[[ Line: 270 ]] --[[ Name: onNewPlayerAdded ]]
        -- upvalues: v147 (copy), l_Players_0 (ref), v9 (ref), v64 (ref), v120 (copy), v31 (ref)
        v147(v148);
        if l_Players_0.LocalPlayer then
            v9.try(function() --[[ Line: 274 ]]
                -- upvalues: v148 (copy), l_Players_0 (ref)
                if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                    return v148:IsFriendsWithAsync(l_Players_0.LocalPlayer.UserId);
                else
                    return v148:IsFriendsWith(l_Players_0.LocalPlayer.UserId);
                end;
            end):andThen(function(v149) --[[ Line: 281 ]]
                -- upvalues: v64 (ref), v148 (copy), v120 (ref)
                if v149 then
                    v64("InGame.UnknownNamespace.GameChat_FriendChatNotifier_JoinMessage", {
                        RBX_NAME = v148.DisplayName
                    }, "Roblox.Notification.Friend.Joined", v120.translator, v120.defaultSystemTextChannel);
                end;
            end):catch(function(v150) --[[ Line: 292 ]]
                -- upvalues: v31 (ref)
                v31:error("Could not fetch friendship status. Error: {}", (tostring(v150)));
            end);
        end;
    end;
    for _, v153 in pairs(l_Players_0:GetPlayers()) do
        if v153:IsA("Player") then
            v147(v153);
        end;
    end;
    l_Players_0.PlayerAdded:Connect(v151);
    l_Players_0.PlayerRemoving:Connect(function(v154) --[[ Line: 307 ]]
        -- upvalues: v31 (ref), v121 (copy), l_PlayerRemoved_0 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v122 (copy), l_FFlagExpChatUseAdorneeStore_0 (ref), l_context_0 (ref), l_getFFlagUseCharacterStore_0 (ref), v123 (copy)
        v31:trace("Player removed: {} {}", v154.Name, (tostring(v154.UserId)));
        v121:dispatch(l_PlayerRemoved_0(v154.UserId));
        if l_FFlagExpChatUseMessagesStore_0 then
            v122.handlePlayerRemoved(v154.UserId);
        end;
        if l_FFlagExpChatUseAdorneeStore_0 then
            l_context_0.adorneeStore.handlePlayerRemoved(v154.UserId);
        end;
        if l_getFFlagUseCharacterStore_0() then
            l_context_0.characterStore.handlePlayerRemoved(v154.UserId);
        end;
        local v155 = v123[v154.UserId];
        if v155 then
            for _, v157 in ipairs(v155) do
                v157:Disconnect();
            end;
            v123[v154.UserId] = nil;
        end;
    end);
end;
local v160 = {
    canUserChatAsync = function(v159) --[[ Line: 360 ]] --[[ Name: canUserChatAsync ]]
        -- upvalues: l_Chat_0 (copy)
        return l_Chat_0:CanUserChatAsync(v159);
    end
};
local function v163(v161) --[[ Line: 365 ]]
    -- upvalues: v31 (copy), v11 (copy)
    v31:trace("System OnIncomingMessage started: {} {}", v161.PrefixText, v161.Text);
    local l_TextChatMessageProperties_0 = Instance.new("TextChatMessageProperties");
    l_TextChatMessageProperties_0.Text = string.format("<font color=\"#%s\">%s</font>", if string.find(v161.Metadata, "Error") then v11.App.Style.Colors.Red:ToHex() else v11.App.Style.Colors.LightGrey:ToHex(), v161.Text);
    v31:trace("System OnIncomingMessage finished: {} {}", l_TextChatMessageProperties_0.PrefixText, l_TextChatMessageProperties_0.Text);
    return l_TextChatMessageProperties_0;
end;
return function(v164) --[[ Line: 381 ]]
    -- upvalues: v31 (copy), l_Dictionary_0 (copy), v160 (copy), v34 (copy), v32 (copy), v33 (copy), l_watchForErrors_0 (copy), l_context_0 (copy), l_FFlagExpChatUseAdorneeStore_0 (copy), v18 (copy), l_FFlagExpChatUseProximityStore_0 (copy), v27 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), v19 (copy), l_FFlagExpChatUseChannelTabsStore_0 (copy), v20 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy), v23 (copy), v84 (copy), v24 (copy), l_getFFlagUseCharacterStore_0 (copy), v22 (copy), l_Analytics_0 (copy), v78 (copy), l_UserInputService_0 (copy), v52 (copy), v163 (copy), l_Chat_0 (copy), l_TextChatService_0 (copy), v113 (copy), v114 (copy), l_GetFFlagExpChatFOMOUpsellImpressionsCountEnabled_0 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), l_HttpService_0 (copy), l_FStringExpChatFOMOUpsellImpressionsCountKey_0 (copy), l_Players_0 (copy), v64 (copy), l_TextChannelCreated_0 (copy), v79 (copy), v35 (copy), v81 (copy), v66 (copy), l_FFlagExpChatPerfTracking_0 (copy), v75 (copy), v36 (copy), v67 (copy), v80 (copy), v21 (copy), v41 (copy), v86 (copy), v72 (copy), v88 (copy), v111 (copy), l_TextChannelRemoved_0 (copy), v43 (copy), l_countParticipantsInTextChannel_0 (copy), v60 (copy), l_LocalTextChannelParticipantRemoved_0 (copy), v42 (copy), v58 (copy), v59 (copy), v77 (copy), l_Commands_0 (copy), l_CommandAliasChanged_0 (copy), v9 (copy), v53 (copy), v54 (copy), v158 (copy), v11 (copy), v10 (copy), v30 (copy), v83 (copy), l_ClientAppLoaded_0 (copy), l_StarterGui_0 (copy), v117 (copy), l_Version_0 (copy), v69 (copy), v90 (copy), v37 (copy), l_GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled_0 (copy), l_FIntMaxExpChatUnlockChatButtonImpressionsCount_0 (copy), v71 (copy), v89 (copy), l_ExpChatNewHiddenMessagesExperimentation_0 (copy), v91 (copy), v92 (copy), v62 (copy), v70 (copy), v93 (copy), v73 (copy), v95 (copy), v74 (copy), l_GetFFlagExpChatUserMessageIntentSentCooldown_0 (copy), v96 (copy), l_FFlagEnableModerateChatRemoteEvent_0 (copy), v65 (copy), v25 (copy), v17 (copy), v15 (copy), v94 (copy), v63 (copy)
    v31:trace("mountClientApp started");
    v164 = l_Dictionary_0.join(v160, v164);
    local v165 = v34();
    v32(v165);
    v33:flush();
    l_watchForErrors_0(game:GetService("ScriptContext"), v164.script, false);
    l_context_0.translator = v164.translator;
    l_context_0.store = v165;
    if l_FFlagExpChatUseAdorneeStore_0 then
        l_context_0.adorneeStore = v18(false);
    end;
    if l_FFlagExpChatUseProximityStore_0 then
        l_context_0.proximityStore = v27(false);
    end;
    local v166 = if l_FFlagExpChatUseMessagesStore_0 then v19(false) else nil;
    local v167 = if l_FFlagExpChatUseChannelTabsStore_0 then v20(false) else nil;
    local v168 = if l_FFlagExpChatUseChatConfigStore_0 then v23(false) else nil;
    local v169 = if v84 then v24(false) else nil;
    if l_FFlagExpChatUseMessagesStore_0 then
        l_context_0.messagesStore = v166;
    end;
    if l_getFFlagUseCharacterStore_0() then
        l_context_0.characterStore = v22(false);
    end;
    if v164.analytics then
        l_Analytics_0.with(v164.analytics);
    end;
    if not v78() then
        l_UserInputService_0.LastInputTypeChanged:Connect(function(v170) --[[ Line: 424 ]]
            -- upvalues: v165 (copy), v52 (ref)
            v165:dispatch(v52(v170));
        end);
    end;
    if v164.defaultSystemTextChannel then
        v164.defaultSystemTextChannel.OnIncomingMessage = v163;
    else
        l_Chat_0:GetPropertyChangedSignal("IsAutoMigrated"):Once(function() --[[ Line: 432 ]]
            -- upvalues: l_TextChatService_0 (ref), v164 (ref), v163 (ref)
            local l_l_TextChatService_0_FirstChild_0 = l_TextChatService_0:FindFirstChild("RBXSystem", true);
            if l_l_TextChatService_0_FirstChild_0 and l_l_TextChatService_0_FirstChild_0:IsA("TextChannel") then
                v164.defaultSystemTextChannel = l_l_TextChatService_0_FirstChild_0;
                l_l_TextChatService_0_FirstChild_0.OnIncomingMessage = v163;
            end;
        end);
    end;
    v113(v165, v164);
    v114(v165);
    local v172 = 1;
    if l_GetFFlagExpChatFOMOUpsellImpressionsCountEnabled_0() then
        local v173 = {};
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 452 ]]
            -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref)
            return l_AppStorageService_0:GetItem(l_LocalStorageKey_0.ExpChatFOMOUpsellImpressionsCount);
        end);
        if l_status_1 and l_result_1 ~= "" then
            local l_l_result_1_0 = l_result_1 --[[ copy: 9 -> 35 ]];
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 457 ]]
                -- upvalues: l_HttpService_0 (ref), l_l_result_1_0 (copy)
                return l_HttpService_0:JSONDecode(l_l_result_1_0);
            end);
            if l_status_2 then
                v173 = l_result_2;
            end;
        end;
        if v173[l_FStringExpChatFOMOUpsellImpressionsCountKey_0] then
            v172 = v173[l_FStringExpChatFOMOUpsellImpressionsCountKey_0] + 1;
        end;
        v173[l_FStringExpChatFOMOUpsellImpressionsCountKey_0] = v172;
        l_AppStorageService_0:SetItem(l_LocalStorageKey_0.ExpChatFOMOUpsellImpressionsCount, l_HttpService_0:JSONEncode(v173));
        l_AppStorageService_0:Flush();
    end;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if l_LocalPlayer_0 then
        l_LocalPlayer_0:GetPropertyChangedSignal("Team"):Connect(function() --[[ Line: 479 ]]
            -- upvalues: l_LocalPlayer_0 (copy), v64 (ref), v164 (ref)
            local l_Team_0 = l_LocalPlayer_0.Team;
            if l_Team_0 then
                v64("InGame.UnknownNamespace.GameChat_TeamChat_NowInTeam", {
                    RBX_NAME = l_Team_0.Name
                }, "Roblox.Team.Success.NowInTeam", v164.translator, v164.defaultSystemTextChannel);
            end;
        end);
    end;
    local function v200(v181) --[[ Line: 493 ]] --[[ Name: handleMessageReceived ]]
        -- upvalues: v165 (copy), l_TextChannelCreated_0 (ref), v79 (ref), l_TextChatService_0 (ref), v35 (ref), v81 (ref), v31 (ref), l_Players_0 (ref), l_LocalPlayer_0 (copy), v66 (ref), v164 (ref), l_FFlagExpChatPerfTracking_0 (ref), v75 (ref), v36 (ref), v67 (ref), v64 (ref), v80 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v166 (copy), v21 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v167 (copy), v41 (ref), v86 (ref), v72 (ref), v88 (ref), l_Analytics_0 (ref), v111 (ref)
        v165:dispatch(l_TextChannelCreated_0(v181));
        local v182 = false;
        if v79() then
            local l_ChannelTabsConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChannelTabsConfiguration");
            if l_ChannelTabsConfiguration_0 then
                v182 = l_ChannelTabsConfiguration_0.Enabled;
            end;
        end;
        if string.find(v181.Name, "RBXGeneral") then
            v181.OnIncomingMessage = function(v184) --[[ Line: 505 ]]
                -- upvalues: v35 (ref), v81 (ref)
                local l_TextChatMessageProperties_1 = Instance.new("TextChatMessageProperties");
                if v184.TextSource then
                    local v186 = v35(v184.TextSource.UserId);
                    if not v81() or not v184.ChatWindowMessageProperties then
                        l_TextChatMessageProperties_1.PrefixText = string.format("<font color=\"#%s\">%s</font>", v186:ToHex(), v184.PrefixText);
                    end;
                end;
                return l_TextChatMessageProperties_1;
            end;
        elseif string.find(v181.Name, "^RBXTeam") then
            v181.OnIncomingMessage = function(v187) --[[ Line: 519 ]]
                -- upvalues: v31 (ref), l_Players_0 (ref), v182 (ref)
                v31:trace("Team OnIncomingMessage started: {} {}", v187.PrefixText, v187.Text);
                local l_TextChatMessageProperties_2 = Instance.new("TextChatMessageProperties");
                if l_Players_0.LocalPlayer then
                    local l_Color_0 = l_Players_0.LocalPlayer.TeamColor.Color;
                    local v190 = v182 and "" or "[Team] ";
                    l_TextChatMessageProperties_2.PrefixText = string.format("<font color=\"#%s\">%s%s</font>", l_Color_0:ToHex(), v190, v187.PrefixText);
                end;
                v31:trace("Team OnIncomingMessage finished: {} {}", l_TextChatMessageProperties_2.PrefixText, l_TextChatMessageProperties_2.Text);
                return l_TextChatMessageProperties_2;
            end;
        elseif string.find(v181.Name, "^RBXWhisper") and l_LocalPlayer_0 then
            v181.OnIncomingMessage = function(v191) --[[ Line: 540 ]]
                -- upvalues: v66 (ref), v181 (copy), l_LocalPlayer_0 (ref), v182 (ref), v164 (ref), v35 (ref)
                local l_TextSource_0 = v191.TextSource;
                if l_TextSource_0 then
                    local v193 = v66(v181, l_LocalPlayer_0);
                    if v193 then
                        local v194 = nil;
                        if not v182 then
                            v194 = if l_TextSource_0.UserId == l_LocalPlayer_0.UserId then v164.translator:FormatByKey("CoreScripts.TextChat.WhisperChat.PrefixText.Outgoing", {
                                RBX_NAME = v193
                            }) else v164.translator:FormatByKey("CoreScripts.TextChat.WhisperChat.PrefixText.Incoming", {
                                RBX_NAME = v193
                            });
                        end;
                        local l_TextChatMessageProperties_3 = Instance.new("TextChatMessageProperties");
                        local v196 = v35(l_TextSource_0.UserId);
                        l_TextChatMessageProperties_3.PrefixText = string.format("%s<font color=\"#%s\">%s</font>", if v194 then v194 .. " " else "", v196:ToHex(), v191.PrefixText);
                        return l_TextChatMessageProperties_3;
                    end;
                end;
                return nil;
            end;
        end;
        v181.MessageReceived:Connect(function(v197) --[[ Line: 577 ]]
            -- upvalues: v31 (ref), l_FFlagExpChatPerfTracking_0 (ref), l_LocalPlayer_0 (ref), v75 (ref), v36 (ref), v67 (ref), v64 (ref), v164 (ref), v80 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v166 (ref), v21 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v167 (ref), v165 (ref), v41 (ref), v86 (ref), v72 (ref), v88 (ref), l_Analytics_0 (ref), v111 (ref)
            v31:debug("Incoming MessageReceived Status: {} Text: {}", v197.Status.Name, v197.Text);
            if l_FFlagExpChatPerfTracking_0 and (v197.TextSource and v197.TextSource.UserId or "UNKNOWN_TEXT_SOURCE_USER_ID") ~= (l_LocalPlayer_0 and l_LocalPlayer_0.UserId or "UNKNOWN_LOCAL_USER_ID") then
                v75.start(v75.Events.MessageReceiveToWindowRenderInterval, {
                    messageId = v197.MessageId
                });
            end;
            if l_LocalPlayer_0 then
                v36(l_LocalPlayer_0.UserId, v197);
            end;
            if l_LocalPlayer_0 and v197.TextSource and v197.TextSource.UserId ~= l_LocalPlayer_0.UserId then
                local v198 = v67(v197, l_LocalPlayer_0);
                if v198 then
                    v64(v198.key, v198.args, v198.metadata, v164.translator, if v80() then v197.TextChannel else v164.defaultSystemTextChannel);
                end;
            end;
            local v199 = l_LocalPlayer_0 and v197.TextSource and v197.TextSource.UserId == l_LocalPlayer_0.UserId;
            if l_FFlagExpChatUseMessagesStore_0 then
                v166.handleIncomingOrOutgoingMessage(v197, v199);
                v21(false).resetTextTransparency();
                if l_FFlagExpChatUseChannelTabsStore_0 and v167 then
                    v167.handleIncomingOrOutgoingMessage(v197, v199);
                end;
            else
                v165:dispatch(v41(v197, v199));
                v21(false).resetTextTransparency();
            end;
            if v197.Status == Enum.TextChatMessageStatus.Floodchecked then
                v64("CoreScripts.TextChat.MessageStatus.Warning.Floodchecked", nil, "Roblox.MessageStatus.Warning.Floodchecked", v164.translator, v164.defaultSystemTextChannel);
            elseif v197.Status == Enum.TextChatMessageStatus.TextFilterFailed then
                v64("CoreScripts.TextChat.MessageStatus.Warning.TextFilterFailed", nil, "Roblox.MessageStatus.Warning.TextFilterFailed", v164.translator, v164.defaultSystemTextChannel);
            elseif v197.Status == Enum.TextChatMessageStatus.InvalidPrivacySettings then
                v64("CoreScripts.TextChat.MessageStatus.Warning.InvalidPrivacySettings", nil, "Roblox.MessageStatus.Warning.InvalidPrivacySettings", v164.translator, v164.defaultSystemTextChannel);
            elseif v197.Status == Enum.TextChatMessageStatus.MessageTooLong then
                v64("CoreScripts.TextChat.MessageStatus.Warning.MessageTooLong", nil, "Roblox.MessageStatus.Warning.MessageTooLong", v164.translator, v164.defaultSystemTextChannel);
            elseif v197.Status == Enum.TextChatMessageStatus.ModerationTimeout then
                v64("CoreScripts.TextChat.MessageStatus.Warning.ModerationTimeout", nil, "Roblox.MessageStatus.Warning.ModerationTimeout", v164.translator, v164.defaultSystemTextChannel);
            elseif v197.Status == Enum.TextChatMessageStatus.Unknown then
                v64("CoreScripts.TextChat.MessageStatus.Warning.Unknown", nil, "Roblox.MessageStatus.Warning.Unknown", v164.translator, v164.defaultSystemTextChannel);
            end;
            if v86 then
                if v72(v88) then
                    l_Analytics_0:TelemetryLogEvent(v111, {
                        messageStatus = v197.Status.Name
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
                    messageStatus = v197.Status.Name
                });
            end;
        end);
    end;
    local function _(v201) --[[ Line: 700 ]] --[[ Name: watchTextChatCommand ]]
        -- upvalues: l_Analytics_0 (ref)
        v201.Triggered:Connect(function() --[[ Line: 701 ]]
            -- upvalues: l_Analytics_0 (ref), v201 (copy)
            l_Analytics_0.FireClientAnalyticsWithEventName("CommandSent", {
                commandName = v201.Name
            });
        end);
    end;
    for _, v204 in pairs(l_TextChatService_0:GetDescendants()) do
        if v204:IsA("TextChannel") then
            v200(v204);
        elseif v204:IsA("TextChatCommand") then
            v204.Triggered:Connect(function() --[[ Line: 701 ]]
                -- upvalues: l_Analytics_0 (ref), v204 (copy)
                l_Analytics_0.FireClientAnalyticsWithEventName("CommandSent", {
                    commandName = v204.Name
                });
            end);
        end;
    end;
    l_TextChatService_0.DescendantAdded:Connect(function(v205) --[[ Line: 717 ]]
        -- upvalues: v200 (copy), l_Analytics_0 (ref)
        if v205:IsA("TextChannel") then
            v200(v205);
            return;
        else
            if v205:IsA("TextChatCommand") then
                v205.Triggered:Connect(function() --[[ Line: 701 ]]
                    -- upvalues: l_Analytics_0 (ref), v205 (copy)
                    l_Analytics_0.FireClientAnalyticsWithEventName("CommandSent", {
                        commandName = v205.Name
                    });
                end);
            end;
            return;
        end;
    end);
    l_TextChatService_0.DescendantRemoving:Connect(function(v206) --[[ Line: 725 ]]
        -- upvalues: v165 (copy), l_TextChannelRemoved_0 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v167 (copy)
        if v206:IsA("TextChannel") then
            v165:dispatch(l_TextChannelRemoved_0(v206));
            if l_FFlagExpChatUseChannelTabsStore_0 and v167 then
                v167.handleChannelRemoved(v206);
            end;
        end;
    end);
    l_TextChatService_0.SendingMessage:Connect(function(v207) --[[ Line: 735 ]]
        -- upvalues: l_FFlagExpChatPerfTracking_0 (ref), v75 (ref), v31 (ref), l_LocalPlayer_0 (copy), v67 (ref), v64 (ref), v164 (ref), v80 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v166 (copy), v165 (copy), v43 (ref), l_Analytics_0 (ref), l_countParticipantsInTextChannel_0 (ref)
        if l_FFlagExpChatPerfTracking_0 then
            v75.start(v75.Events.MessageSendToWindowRenderInterval, {
                messageId = v207.MessageId
            });
        end;
        v31:debug("Outgoing SendingMessage Status: {} Text: {}", v207.Status.Name, v207.Text);
        if l_LocalPlayer_0 then
            local v208 = v67(v207, l_LocalPlayer_0);
            if v208 and v208.key then
                v64(v208.key, v208.args, v208.metadata, v164.translator, if v80() then v207.TextChannel else v164.defaultSystemTextChannel);
            end;
        end;
        if l_FFlagExpChatUseMessagesStore_0 then
            v166.handleIncomingOrOutgoingMessage(v207, true);
        else
            v165:dispatch(v43(v207));
        end;
        local l_TextChannel_0 = v207.TextChannel;
        if l_TextChannel_0 then
            l_Analytics_0.FireClientAnalyticsWithEventName("MessageSent", {
                channelName = l_TextChannel_0.Name, 
                totalParticipants = l_countParticipantsInTextChannel_0(l_TextChannel_0)
            });
        end;
    end);
    local function _(v210) --[[ Line: 773 ]] --[[ Name: isInstanceALocalTextChannelParticipant ]]
        -- upvalues: l_Players_0 (ref)
        return v210 and v210:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v210.UserId;
    end;
    if v79() then
        for _, v213 in pairs(l_TextChatService_0:GetDescendants()) do
            if v213.Parent and v213.Parent:IsA("TextChannel") and v213 and v213:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v213.UserId then
                v165:dispatch(v60(v213.Parent));
                if l_FFlagExpChatUseChannelTabsStore_0 and v167 then
                    local l_Name_0 = v213.Parent.Name;
                    if l_Name_0 ~= "RBXSystem" then
                        local v215 = l_Name_0 == "RBXGeneral" and 1 or 2;
                        v167.addChannelTab(l_Name_0, v215);
                    end;
                end;
            end;
            if v213:IsA("TextChannel") then
                v213.DescendantRemoving:Connect(function(v216) --[[ Line: 803 ]]
                    -- upvalues: l_Players_0 (ref), v165 (copy), l_LocalTextChannelParticipantRemoved_0 (ref), v213 (copy), l_FFlagExpChatUseChannelTabsStore_0 (ref), v167 (copy)
                    if v216 and v216:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v216.UserId then
                        v165:dispatch(l_LocalTextChannelParticipantRemoved_0(v213));
                        if l_FFlagExpChatUseChannelTabsStore_0 and v167 then
                            local l_Name_1 = v213.Name;
                            v167.removeChannelTab(l_Name_1);
                        end;
                    end;
                end);
            end;
        end;
        l_TextChatService_0.DescendantAdded:Connect(function(v218) --[[ Line: 817 ]]
            -- upvalues: l_Players_0 (ref), v165 (copy), v60 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v167 (copy), l_LocalTextChannelParticipantRemoved_0 (ref)
            if v218.Parent and v218.Parent:IsA("TextChannel") and v218 and v218:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v218.UserId then
                v165:dispatch(v60(v218.Parent));
                if l_FFlagExpChatUseChannelTabsStore_0 and v167 then
                    local l_Name_2 = v218.Parent.Name;
                    if l_Name_2 ~= "RBXSystem" then
                        local v220 = l_Name_2 == "RBXGeneral" and 1 or 2;
                        v167.addChannelTab(l_Name_2, v220);
                    end;
                end;
            end;
            if v218:IsA("TextChannel") then
                v218.DescendantRemoving:Connect(function(v221) --[[ Line: 839 ]]
                    -- upvalues: l_Players_0 (ref), v165 (ref), l_LocalTextChannelParticipantRemoved_0 (ref), v218 (copy), l_FFlagExpChatUseChannelTabsStore_0 (ref), v167 (ref)
                    if v221 and v221:IsA("TextSource") and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId == v221.UserId then
                        v165:dispatch(l_LocalTextChannelParticipantRemoved_0(v218));
                        if l_FFlagExpChatUseChannelTabsStore_0 and v167 then
                            local l_Name_3 = v218.Name;
                            v167.removeChannelTab(l_Name_3);
                        end;
                    end;
                end);
            end;
        end);
    end;
    local function v232(v223, v224, v225) --[[ Line: 854 ]] --[[ Name: runOnBubbleDisplayed ]]
        -- upvalues: l_Players_0 (ref), l_HttpService_0 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v166 (copy), v165 (copy), v42 (ref)
        local v226 = nil;
        if v223:IsA("Model") then
            v226 = l_Players_0:GetPlayerFromCharacter(v223);
        end;
        local v227 = l_HttpService_0:GenerateGUID(false);
        local v228 = nil;
        local v229 = nil;
        if v225 then
            v227 = v225.MessageId;
            v228 = v225.BubbleChatMessageProperties;
            v229 = v225.Translation;
        end;
        local v230 = DateTime.fromUnixTimestampMillis(workspace:GetServerTimeNow() * 1000);
        local v231 = {
            message = v224, 
            translation = v229, 
            bubbleChatMessageId = v227, 
            bubbleChatMessageUserId = v226 and tostring(v226.UserId) or nil, 
            partOrModel = v223, 
            timestamp = v230, 
            bubbleChatMessageProperties = v228
        };
        if l_FFlagExpChatUseMessagesStore_0 then
            v166.handleIncomingBubbleChatMessage(v231);
            return;
        else
            v165:dispatch(v42(v231));
            return;
        end;
    end;
    l_Chat_0.Chatted:Connect(function(v233, v234) --[[ Line: 887 ]]
        -- upvalues: l_TextChatService_0 (ref), l_Chat_0 (ref), v232 (copy)
        if l_TextChatService_0.ChatVersion ~= Enum.ChatVersion.LegacyChatService or l_Chat_0.BubbleChatEnabled then
            v232(v233, v234);
        end;
    end);
    local function v236() --[[ Line: 894 ]]
        -- upvalues: l_Chat_0 (ref), v165 (copy), v58 (ref)
        local l_BubbleChatEnabled_0 = l_Chat_0.BubbleChatEnabled;
        v165:dispatch(v58("Enabled", l_BubbleChatEnabled_0));
    end;
    l_Chat_0:GetPropertyChangedSignal("BubbleChatEnabled"):Connect(v236);
    local l_BubbleChatEnabled_1 = l_Chat_0.BubbleChatEnabled;
    v165:dispatch(v58("Enabled", l_BubbleChatEnabled_1));
    l_Chat_0.BubbleChatSettingsChanged:Connect(function(v238) --[[ Line: 903 ]]
        -- upvalues: v164 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v168 (copy), v165 (copy), v59 (ref)
        if v164.validateLegacyBubbleChatSettings then
            local v239, v240 = v164.validateLegacyBubbleChatSettings(v238);
            assert(v239, "Bad settings object passed to Chat:SetBubbleChatSettings:\n inside consolidated BubbleChat " .. (v240 or ""));
            if l_FFlagExpChatUseMessagesStore_0 and v168 then
                v168.setBubbleChatSettings(v238);
                return;
            else
                v165:dispatch(v59(v238));
            end;
        end;
    end);
    if v77() then
        l_TextChatService_0.BubbleDisplayed:Connect(function(v241, v242) --[[ Line: 921 ]]
            -- upvalues: v232 (copy)
            v232(v241, v242 and v242.Text, v242);
        end);
    end;
    l_BubbleChatEnabled_1 = function(v243) --[[ Line: 926 ]] --[[ Name: findCommandInstance ]]
        -- upvalues: l_TextChatService_0 (ref)
        for _, v245 in ipairs(l_TextChatService_0:GetDescendants()) do
            if v245.Name == v243 and v245:IsA("TextChatCommand") then
                return v245;
            end;
        end;
        return nil;
    end;
    local v246 = {};
    local function v254() --[[ Line: 937 ]] --[[ Name: setupTextChatCommands ]]
        -- upvalues: l_Commands_0 (ref), l_BubbleChatEnabled_1 (copy), v246 (copy), l_FFlagExpChatUseMessagesStore_0 (ref), v165 (copy), l_context_0 (ref), v64 (ref), v164 (ref), l_CommandAliasChanged_0 (ref)
        for _, v248 in ipairs(l_Commands_0.enabledCommands) do
            if v248.clientRun then
                local v249 = l_BubbleChatEnabled_1(v248.name);
                if v249 and not v246[v249] then
                    v246[v249] = true;
                    v249.Triggered:Connect(function(v250, ...) --[[ Line: 948 ]]
                        -- upvalues: l_FFlagExpChatUseMessagesStore_0 (ref), v248 (copy), v165 (ref), l_context_0 (ref), v64 (ref), v164 (ref)
                        local v251 = nil;
                        v251 = if l_FFlagExpChatUseMessagesStore_0 then v248.clientRun(v165, v250.UserId, ..., l_context_0) else v248.clientRun(v165, v250.UserId, ...);
                        if v251 then
                            v64(v251.key, v251.args, v251.metadata, v164.translator, v164.defaultSystemTextChannel);
                        end;
                    end);
                    if string.find(v249.Name, "RBXTeamCommand") or string.find(v249.Name, "RBXWhisperCommand") then
                        for _, v253 in {
                            "PrimaryAlias", 
                            "SecondaryAlias"
                        } do
                            v249:GetPropertyChangedSignal(v253):Connect(function() --[[ Line: 971 ]]
                                -- upvalues: v165 (ref), l_CommandAliasChanged_0 (ref), v249 (copy)
                                v165:dispatch(l_CommandAliasChanged_0(v249.Name, v249.PrimaryAlias, v249.SecondaryAlias));
                            end);
                        end;
                    end;
                end;
            end;
        end;
    end;
    v254();
    l_Chat_0:GetPropertyChangedSignal("IsAutoMigrated"):Once(v254);
    if v164.canUserChatAsync and l_Players_0.LocalPlayer then
        v9.try(function() --[[ Line: 991 ]]
            -- upvalues: v164 (ref), l_Players_0 (ref)
            return v164.canUserChatAsync(l_Players_0.LocalPlayer.UserId);
        end):andThen(function(v255) --[[ Line: 994 ]]
            -- upvalues: l_FFlagExpChatUseMessagesStore_0 (ref), v166 (copy), v165 (copy), v53 (ref)
            if l_FFlagExpChatUseMessagesStore_0 then
                v166.setCanLocalUserChat(v255);
                return;
            else
                v165:dispatch(v53(v255));
                return;
            end;
        end):catch(function() --[[ Line: 1001 ]]
            -- upvalues: l_FFlagExpChatUseMessagesStore_0 (ref), v166 (copy), v165 (copy), v54 (ref)
            if l_FFlagExpChatUseMessagesStore_0 then
                v166.setCanLocalUserChat(false);
                return;
            else
                v165:dispatch(v54());
                return;
            end;
        end);
    end;
    v158(v164, v165, v166);
    local l_AppStyleProvider_0 = v11.App.Style.AppStyleProvider;
    local l_Constants_0 = v11.App.Style.Constants;
    local l_Dark_0 = l_Constants_0.ThemeName.Dark;
    local l_Gotham_0 = l_Constants_0.FontName.Gotham;
    local v260 = {
        Dark = {
            themeName = l_Dark_0, 
            fontName = l_Gotham_0
        }
    };
    local v261 = v10.createElement(l_AppStyleProvider_0, {
        style = v260.Dark
    }, {
        app = v10.createElement(v30, {
            store = v165, 
            translator = v164.translator, 
            gameTranslator = if v79() then v164.gameTranslator else nil, 
            isChatWindowVisible = true, 
            isChatInputBarVisible = true, 
            isChannelBarVisible = false, 
            isDefaultChatEnabled = true, 
            getIconVoiceIndicator = v164.getIconVoiceIndicator, 
            onClickedVoiceIndicator = v164.onClickedVoiceIndicator, 
            onClickedCameraIndicator = v164.onClickedCameraIndicator, 
            selfViewListenerChanged = v164.selfViewListenerChanged, 
            getPermissions = v164.getPermissions, 
            displayCameraDeniedToast = v164.displayCameraDeniedToast, 
            isCamEnabledForUserAndPlace = v164.isCamEnabledForUserAndPlace, 
            isCameraOnlyUser = v164.isCameraOnlyUser, 
            isVoiceServiceInitialized = v164.isVoiceServiceInitialized, 
            onClickedLikelySpeakingBubble = v164.onClickedLikelySpeakingBubble, 
            isSpatialUIEnabled = v164.isSpatialUIEnabled, 
            expChatLoadStartTime = if v83() then os.clock() else nil
        })
    });
    v165:dispatch(l_ClientAppLoaded_0({
        team = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.Team, 
        isChatCoreGuiEnabled = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Chat), 
        isTouchEnabled = l_UserInputService_0.TouchEnabled, 
        isGamepadEnabled = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Gamepad
    }));
    v117(l_Analytics_0, l_Version_0[1]);
    v31:trace("Roact.mount to {}", (tostring(v164.parent)));
    local v262 = v10.mount(v261, v164.parent, "ExperienceChat");
    local function v264(v263) --[[ Line: 1061 ]] --[[ Name: updateChatStatus ]]
        -- upvalues: v169 (copy), v69 (ref), v64 (ref), v90 (ref), v164 (ref), v37 (ref), l_GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled_0 (ref), v172 (ref), l_FIntMaxExpChatUnlockChatButtonImpressionsCount_0 (ref), v71 (ref), v89 (ref)
        v169.setChatStatus(v263);
        if v263 == "GeoBlocked" or v263 ~= "Unknown" and v69() then
            v64(v90 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionIsntAvailable" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionUnavailable", nil, "Roblox.ChatDisabled.Info", v164.translator, v164.defaultSystemTextChannel, v90 and "You can only view system messages here. Chat isn\226\128\153t available in your region." or "You can only view system messages here. Chat is not available in your region.");
            return;
        elseif v263 == "AgeCheckGateExperiment" then
            v64("CoreScripts.TextChat.ChatWindow.ChatDisabled.CheckAgeInAccountInfo", nil, "Roblox.ChatDisabled.Info", v164.translator, v164.defaultSystemTextChannel, "You can only view system messages here. Unlock chat with an age check at Settings > Account info.");
            return;
        elseif v263 == "SettingsDisabled" then
            v64(v90 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.DontMissMessagesUpdateCommsSettings" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.SettingOff", nil, "Roblox.ChatDisabled.Info", v164.translator, v164.defaultSystemTextChannel, v90 and "You can only view system messages here. Update your communication settings to turn on chat." or "You can only view system messages here. Update your Communication settings to turn on chat.");
            return;
        elseif v263 == "SettingsDisabledVpc" then
            v64("CoreScripts.TextChat.ChatWindow.ChatDisabled.AskForPermission", nil, "Roblox.ChatDisabled.Info", v164.translator, v164.defaultSystemTextChannel, "You can only view system messages here. Ask your parent for permission to chat in Communication settings.");
            return;
        elseif v263 == "AgeCheckVpc" then
            v64("CoreScripts.TextChat.ChatWindow.ChatDisabled.AskForPermissionToAgeCheck", nil, "Roblox.ChatDisabled.Info", v164.translator, v164.defaultSystemTextChannel, "You can only view system messages here. Ask your parent for permission to age check in Communication settings.");
            return;
        elseif not v37() and v263 == "AgeVerificationRequired" or v263 == "IdVerificationRequired" then
            v64(v90 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.GetAnAgeCheckInCommsSetting" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.CheckAgeInSettings", nil, "Roblox.ChatDisabled.Info", v164.translator, v164.defaultSystemTextChannel, v90 and "Don\226\128\153t miss messages. Unlock chat with an age check in your communication settings." or "You can only view system messages here. To chat, get an age check in your Communication settings.");
            return;
        elseif v263 == "AgeVerificationRequired" then
            if l_GetFFlagExpChatFOMOUpsellUnlockChatButtonCooldownEnabled_0() and l_FIntMaxExpChatUnlockChatButtonImpressionsCount_0 < v172 then
                v64("CoreScripts.TextChat.ChatWindow.ChatDisabled.GetAnAgeCheckInCommsSetting", nil, "Roblox.ChatDisabled.Info", v164.translator, v164.defaultSystemTextChannel, "Don\226\128\153t miss messages. Unlock chat with an age check in your communication settings.");
                return;
            else
                v64(v90 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.DontMissMessages" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.GetAnAgeCheck", nil, "Roblox.ChatDisabled.Info", v164.translator, v164.defaultSystemTextChannel, v90 and "Don\226\128\153t miss messages. Unlock chat with an age check." or "You can only view system messages here. Get an age check to chat.");
                return;
            end;
        elseif v263 == "EnabledBubble" or v263 == "Enabled" and v71() then
            v64("CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatInRegion", nil, "Roblox.ChatEnabled.Info", v164.translator, v164.defaultSystemTextChannel, "You can view system messages and chat with users in your region only.");
            return;
        elseif v263 == "Enabled" then
            v64(v89 and "CoreScripts.TextChat.ChatWindow.ChatEnabled.ChatWithAgeGroupAndTC" or "CoreScripts.TextChat.ChatWindow.ChatEnabled.VerifiedUser", nil, "Roblox.ChatEnabled.Info", v164.translator, v164.defaultSystemTextChannel, v89 and "Only people in similar age groups and your Trusted Connections can chat with you." or "Only people in similar age groups can chat with you.");
            return;
        else
            if v263 == "AllUsers" or v263 == "NoOne" then
                if getChatTranslationEnabled() then
                    v64("CoreScripts.TextChat.ChatTranslation.ChatWindow.SystemMessageNew", nil, "Roblox.ChatTranslation.ChatWindow.SystemMessage", v164.translator, v164.defaultSystemTextChannel, "Roblox automatically translates supported languages in chat");
                    return;
                end;
            elseif v263 == "Ineligible" or v263 ~= "Unknown" then
                v64("CoreScripts.TextChat.ChatWindow.ChatDisabled.OnlyViewSystemMessages", nil, "Roblox.ChatDisabled.Info", v164.translator, v164.defaultSystemTextChannel, "You can only view system messages here.");
            end;
            return;
        end;
    end;
    local v265 = l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatNewHiddenMessagesSystemMessageNudgeEnabled() and 0 or nil;
    local v266 = if l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatNewHiddenMessagesSystemMessageNudgeEnabled() then math.random(v91, v92) else nil;
    local function v268(v267) --[[ Line: 1237 ]] --[[ Name: handleUserMessageIntentSent ]]
        -- upvalues: v31 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v166 (copy), v165 (copy), v62 (ref), l_ExpChatNewHiddenMessagesExperimentation_0 (ref), v70 (ref), l_LocalPlayer_0 (copy), v265 (ref), v266 (ref), v91 (ref), v92 (ref), v64 (ref), v164 (ref), v21 (ref)
        v31:debug("Handling a message from UserMessageIntentSent");
        if l_FFlagExpChatUseMessagesStore_0 then
            v166.handleHiddenMessageReceived(v267);
        else
            v165:dispatch(v62(v267));
        end;
        if l_ExpChatNewHiddenMessagesExperimentation_0.getExpChatNewHiddenMessagesSystemMessageNudgeEnabled() and not v70(l_LocalPlayer_0.ChatAvailabilityStatus) then
            v265 = v265 + 1;
            if v265 == v266 then
                v266 = v266 + math.random(v91, v92);
                v64("CoreScripts.TextChat.ChatWindow.ChatDisabled.DontMissMessages", nil, "Roblox.ChatDisabled.Info", v164.translator, v164.defaultSystemTextChannel, "Don\226\128\153t miss messages. Unlock chat with an age check.");
            end;
        end;
        v21(false).resetTextTransparency();
    end;
    local function _() --[[ Line: 1271 ]] --[[ Name: shouldConnectToUserMessageIntentSent ]]
        -- upvalues: v93 (ref), v73 (ref), v95 (ref), v74 (ref), l_GetFFlagExpChatUserMessageIntentSentCooldown_0 (ref), v172 (ref), v96 (ref)
        local v269 = v93 and v73();
        local v270 = v95 and v74();
        if l_GetFFlagExpChatUserMessageIntentSentCooldown_0() then
            return v270 or v269 and v172 <= v96;
        else
            return v269 or v270;
        end;
    end;
    if v84 and l_LocalPlayer_0 then
        if l_FFlagEnableModerateChatRemoteEvent_0 then
            local v272 = v65();
            local v273 = v25(false);
            local v274 = false;
            local l_v273_0 = v273 --[[ copy: 29 -> 33 ]];
            local l_v272_0 = v272 --[[ copy: 28 -> 34 ]];
            do
                local l_v274_0 = v274;
                v164.moderateChatStoreDisposeEffect = v17.createEffect(function(v278) --[[ Line: 1290 ]]
                    -- upvalues: l_v273_0 (copy), l_v274_0 (ref), v64 (ref), v164 (ref), v15 (ref), v11 (ref), l_v272_0 (copy)
                    local v279 = l_v273_0.getIsSettingEnabled(v278);
                    if v279 ~= l_v274_0 then
                        if v279 then
                            v64("CoreScripts.TextChat.MessageStatus.Warning.ModerateChatOn", nil, "Roblox.MessageStatus.Warning.ModerateChatOn", v164.translator, v164.defaultSystemTextChannel);
                            v15.SetUIBloxToast({
                                iconImage = v11.App.ImageSet.Images[l_v272_0.icon.off], 
                                toastSubtitle = v164.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOn.Subtitle"), 
                                toastTitle = v164.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOn.Title")
                            });
                        else
                            v64("CoreScripts.TextChat.MessageStatus.Warning.ModerateChatOff", nil, "Roblox.MessageStatus.Warning.ModerateChatOff", v164.translator, v164.defaultSystemTextChannel);
                            v15.SetUIBloxToast({
                                iconImage = v11.App.ImageSet.Images[l_v272_0.icon.off], 
                                toastSubtitle = v164.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOff.Subtitle"), 
                                toastTitle = v164.translator:FormatByKey("CoreScripts.TextChat.Toast.ModerateChatOff.Title")
                            });
                        end;
                        l_v274_0 = v279;
                    end;
                end);
            end;
        end;
        local l_ChatAvailabilityStatus_0 = l_LocalPlayer_0.ChatAvailabilityStatus;
        v31:debug("Local player's initial ChatAvailabilityStatus is {}", l_ChatAvailabilityStatus_0);
        v264(l_ChatAvailabilityStatus_0);
        local v281 = nil;
        local v282 = v93 and v73();
        local v283 = v95 and v74();
        if if l_GetFFlagExpChatUserMessageIntentSentCooldown_0() then v283 or v282 and v172 <= v96 else v282 or v283 then
            l_ExpChatNewHiddenMessagesExperimentation_0.logExposure();
            v31:debug("Connecting to UserMessageIntentSent");
            v281 = l_TextChatService_0.UserMessageIntentSent:Connect(v268);
        end;
        do
            local l_l_ChatAvailabilityStatus_0_0, l_v281_0 = l_ChatAvailabilityStatus_0, v281;
            l_LocalPlayer_0:GetPropertyChangedSignal("ChatAvailabilityStatus"):Connect(function() --[[ Line: 1352 ]]
                -- upvalues: l_l_ChatAvailabilityStatus_0_0 (ref), l_LocalPlayer_0 (copy), v31 (ref), v264 (copy), v93 (ref), v73 (ref), v95 (ref), v74 (ref), l_GetFFlagExpChatUserMessageIntentSentCooldown_0 (ref), v172 (ref), v96 (ref), l_v281_0 (ref), l_ExpChatNewHiddenMessagesExperimentation_0 (ref), l_TextChatService_0 (ref), v268 (copy), v70 (ref), v94 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), v166 (copy), v165 (copy), v63 (ref), v21 (ref), v53 (ref)
                l_l_ChatAvailabilityStatus_0_0 = l_LocalPlayer_0.ChatAvailabilityStatus;
                v31:debug("Local player's ChatAvailabilityStatus has changed to {}", l_l_ChatAvailabilityStatus_0_0);
                v264(l_l_ChatAvailabilityStatus_0_0);
                local v286 = v93 and v73();
                local v287 = v95 and v74();
                if (if l_GetFFlagExpChatUserMessageIntentSentCooldown_0() then v287 or v286 and v172 <= v96 else v286 or v287) and not l_v281_0 then
                    l_ExpChatNewHiddenMessagesExperimentation_0.logExposure();
                    v31:debug("Connecting to UserMessageIntentSent");
                    l_v281_0 = l_TextChatService_0.UserMessageIntentSent:Connect(v268);
                end;
                if v93 and v70(l_l_ChatAvailabilityStatus_0_0) and l_v281_0 and (not v95 or not v74()) then
                    v31:debug("Disconnecting from UserMessageIntentSent");
                    l_v281_0:Disconnect();
                    if v94 then
                        if l_FFlagExpChatUseMessagesStore_0 then
                            v166.handleHiddenMessagesCleared();
                        else
                            v165:dispatch(v63());
                        end;
                        v21(false).resetTextTransparency();
                    end;
                end;
                if l_FFlagExpChatUseMessagesStore_0 then
                    v166.setCanLocalUserChat(v70(l_l_ChatAvailabilityStatus_0_0));
                    return;
                else
                    v165:dispatch(v53(v70(l_l_ChatAvailabilityStatus_0_0)));
                    return;
                end;
            end);
        end;
    elseif v69() then
        v64(v90 and "CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionIsntAvailable" or "CoreScripts.TextChat.ChatWindow.ChatDisabled.RegionUnavailable", nil, "Roblox.ChatDisabled.Info", v164.translator, v164.defaultSystemTextChannel, if v84 then v90 and "You can only view system messages here. Chat isn\226\128\153t available in your region." or "You can only view system messages here. Chat is currently unavailable in your region." else "Chat is unavailable in your region. You can still receive system messages.");
    elseif not v84 and getChatTranslationEnabled() then
        v64("CoreScripts.TextChat.ChatTranslation.ChatWindow.SystemMessageNew", nil, "Roblox.ChatTranslation.ChatWindow.SystemMessage", v164.translator, v164.defaultSystemTextChannel, "Roblox automatically translates supported languages in chat");
    end;
    return {
        roactInstance = v262
    };
end;