local l_Chat_0 = game:GetService("Chat");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("StarterGui");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local v8 = require(l_CorePackages_0.Workspace.Packages.VoiceChatCore);
local v9 = require(l_CorePackages_0.Packages.Rodux);
local v10 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Reducers.chatReducer);
local v11 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Actions.SetMessageText);
local v12 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Actions.AddMessageFromEvent);
local v13 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Actions.AddMessageWithTimeout);
local v14 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Actions.UpdateChatSettings);
local v15 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Actions.BubbleChatEnabledChanged);
local v16 = require(l_RobloxGui_0.Modules.VoiceChat.Actions.VoiceEnabledChanged);
local v17 = require(l_RobloxGui_0.Modules.VoiceChat.Actions.ParticipantsChanged);
local v18 = require(l_RobloxGui_0.Modules.VoiceChat.Actions.VoiceStateChanged);
local v19 = require(l_RobloxGui_0.Modules.VoiceChat.Actions.ParticipantAdded);
local v20 = require(l_RobloxGui_0.Modules.VoiceChat.Actions.ParticipantRemoved);
local v21 = require(l_RobloxGui_0.Modules.VoiceChat.Actions.PlayerRemoved);
local v22 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Helpers.getPlayerFromPart);
local v23 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Helpers.validateMessage);
local v24 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Constants);
local v25 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Types);
local v26 = require(l_CorePackages_0.Workspace.Packages.BlockingUtility);
local v27 = require(l_RobloxGui_0.Modules.GameTranslator);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v29 = require(l_RobloxGui_0.Modules.VoiceChat.initVoiceChatStore);
local v30 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoiceChatVoiceUISync);
local l_GetFFlagLocalMutedNilFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLocalMutedNilFix;
local l_GetFFlagBatchVoiceParticipantsUpdates_0 = v8.Flags.GetFFlagBatchVoiceParticipantsUpdates;
local v33 = game:DefineFastFlag("FixMessageReceivedEventLeak", false);
local l_getFFlagExpChatAlwaysRunTCS_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagExpChatAlwaysRunTCS;
local l_GetFFlagExpChatUseVoiceParticipantsStore_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagExpChatUseVoiceParticipantsStore;
local _ = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagExpChatUseMessagesStore;
local l_FFlagExpChatUseChatConfigStore_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagExpChatUseChatConfigStore;
local v38 = require(l_CorePackages_0.Workspace.Packages.ExpChat);
local v39 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Logger)(script.Name);
local v40 = nil;
local v41 = if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then v38.Stores.GetVoiceStore(false) else nil;
local v47 = {
    [v16.name] = function(v42) --[[ Line: 69 ]]
        -- upvalues: v38 (copy)
        v38.Events.VoiceEnabledChanged(v42.enabled);
    end, 
    [v18.name] = function(v43) --[[ Line: 73 ]]
        -- upvalues: l_GetFFlagExpChatUseVoiceParticipantsStore_0 (copy), v41 (copy), v38 (copy)
        if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then
            v41.handleVoiceStateChanged(v43.userId, v43.newState);
            return;
        else
            v38.Events.VoiceStateChanged(v43.userId, v43.newState);
            return;
        end;
    end, 
    [v17.name] = function(v44) --[[ Line: 81 ]]
        -- upvalues: l_GetFFlagExpChatUseVoiceParticipantsStore_0 (copy), v41 (copy), v38 (copy)
        if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then
            v41.handleVoiceParticipantsChanged(v44.newParticipants);
            return;
        else
            v38.Events.VoiceParticipantsChanged(v44.newParticipants);
            return;
        end;
    end, 
    [v19.name] = if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then nil else function(v45) --[[ Line: 92 ]]
        -- upvalues: v38 (copy)
        v38.Events.VoiceParticipantAdded(v45.userId);
    end, 
    [v20.name] = if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then nil else function(v46) --[[ Line: 99 ]]
        -- upvalues: v38 (copy)
        v38.Events.VoiceParticipantRemoved(v46.userId);
    end
};
v40 = v9.Store.new(v10, nil, {
    v9.thunkMiddleware, 
    function(v48) --[[ Line: 104 ]]
        -- upvalues: v47 (copy)
        return function(v49) --[[ Line: 105 ]]
            -- upvalues: v47 (ref), v48 (copy)
            local v50 = v47[v49.type];
            if v50 then
                v50(v49);
            end;
            v48(v49);
        end;
    end
});
local v51 = nil;
local function _() --[[ Line: 121 ]] --[[ Name: isTextChatServiceOn ]]
    -- upvalues: l_getFFlagExpChatAlwaysRunTCS_0 (copy), l_TextChatService_0 (copy)
    if l_getFFlagExpChatAlwaysRunTCS_0() then
        return true;
    else
        return l_TextChatService_0.ChatVersion == Enum.ChatVersion.TextChatService;
    end;
end;
if game:IsLoaded() and (l_getFFlagExpChatAlwaysRunTCS_0() and true or l_TextChatService_0.ChatVersion == Enum.ChatVersion.TextChatService) then
    return;
else
    v51 = game.Loaded:Connect(function() --[[ Line: 132 ]]
        -- upvalues: v51 (ref)
        if game:IsLoaded() then
            v51:Disconnect();
        end;
    end);
    local function v57(v53, v54) --[[ Line: 139 ]] --[[ Name: validateMessageWithWarning ]]
        -- upvalues: v23 (copy), v24 (copy)
        local v55, v56 = v23(v54);
        if not v55 then
            if v56 then
                warn(("Message text %q is too long for chat event %q (expected a message of length %i, got %i)"):format(v54, v53, v24.MAX_MESSAGE_LENGTH, v56));
                return v55;
            else
                warn(("Message text %q sent to chat event %q is not a valid UTF-8 characters sequence"):format(v54, v53));
            end;
        end;
        return v55;
    end;
    local function _(v58, v59) --[[ Line: 153 ]] --[[ Name: validateMessageData ]]
        -- upvalues: v25 (copy)
        local v60, v61 = v25.IMessageData(v59);
        if not v60 then
            warn(("Malformed message data sent to chat event %q. If you have modified the chat system, check what you are firing to this event"):format(v58));
            warn(v61);
        end;
        return v60;
    end;
    local _ = nil;
    local v64 = nil;
    local v65 = nil;
    local v66 = nil;
    local v67 = nil;
    local v68 = nil;
    local v69 = 0;
    local v70 = 0;
    local v71 = {};
    local function v93() --[[ Line: 168 ]] --[[ Name: initBubbleChat ]]
        -- upvalues: l_ReplicatedStorage_0 (copy), v64 (ref), v25 (copy), l_Players_0 (copy), v57 (copy), v40 (ref), v12 (copy), v65 (ref), v11 (copy), v22 (copy), v71 (copy), v69 (ref), v27 (copy), l_CoreGui_0 (copy), v13 (copy), v70 (ref), v66 (ref), l_Chat_0 (copy)
        coroutine.resume(coroutine.create(function() --[[ Line: 169 ]]
            -- upvalues: l_ReplicatedStorage_0 (ref), v64 (ref), v25 (ref), l_Players_0 (ref), v57 (ref), v40 (ref), v12 (ref), v65 (ref), v11 (ref)
            local v72 = l_ReplicatedStorage_0:WaitForChild("DefaultChatSystemChatEvents", 1e999);
            v64 = v72:WaitForChild("OnNewMessage", 1e999).OnClientEvent:Connect(function(v73) --[[ Line: 177 ]]
                -- upvalues: v25 (ref), l_Players_0 (ref), v57 (ref), v40 (ref), v12 (ref)
                local v74, v75 = v25.IMessageData(v73);
                if not v74 then
                    warn(("Malformed message data sent to chat event %q. If you have modified the chat system, check what you are firing to this event"):format("OnNewMessage"));
                    warn(v75);
                end;
                if not v74 then
                    return;
                else
                    if v73.FromSpeaker == l_Players_0.LocalPlayer.Name then
                        if not v57("OnNewMessage", v73.Message) then
                            return;
                        else
                            local v76 = table.clone(v73);
                            v76.Time = workspace:GetServerTimeNow() * 1000;
                            v40:dispatch(v12(v76));
                        end;
                    end;
                    return;
                end;
            end);
            v65 = v72:WaitForChild("OnMessageDoneFiltering", 1e999).OnClientEvent:Connect(function(v77) --[[ Line: 195 ]]
                -- upvalues: v25 (ref), v57 (ref), v40 (ref), v11 (ref), v12 (ref)
                local v78, v79 = v25.IMessageData(v77);
                if not v78 then
                    warn(("Malformed message data sent to chat event %q. If you have modified the chat system, check what you are firing to this event"):format("OnMessageDoneFiltering"));
                    warn(v79);
                end;
                if not v78 or not v57("OnMessageDoneFiltering", v77.Message) then
                    return;
                else
                    local v80 = tostring(v77.ID);
                    if v40:getState().messages[v80] then
                        v40:dispatch(v11(v80, v77.Message));
                        return;
                    else
                        v78 = table.clone(v77);
                        v78.Time = workspace:GetServerTimeNow() * 1000;
                        v40:dispatch(v12(v78));
                        return;
                    end;
                end;
            end);
        end));
        local function v89(v81, v82, v83) --[[ Line: 214 ]] --[[ Name: addMessageWithId ]]
            -- upvalues: v22 (ref), v71 (ref), v69 (ref), v27 (ref), l_CoreGui_0 (ref), v40 (ref), v13 (ref)
            local v84 = nil;
            v84 = if v81:IsA("Model") then if v81.PrimaryPart then v81.PrimaryPart else v81:FindFirstChildWhichIsA("BasePart", true) else v81;
            local v85 = nil;
            if v84 then
                v85 = v22(v84);
            end;
            local v86 = nil;
            if v85 then
                v86 = tostring(v85.UserId);
            else
                local v87 = v71[v81];
                if v87 then
                    v86 = v87;
                else
                    v69 = v69 + 1;
                    v86 = "adornee_" .. v69;
                    v71[v81] = v86;
                end;
            end;
            local v88 = {
                id = "chatted_" .. v83, 
                userId = v86, 
                name = v81.Name, 
                text = v27:TranslateGameText(l_CoreGui_0, v82), 
                timestamp = os.time(), 
                adornee = v81
            };
            v40:dispatch(v13(v88));
        end;
        local function v92(v90, v91) --[[ Line: 257 ]] --[[ Name: addMessage ]]
            -- upvalues: v70 (ref), v89 (copy)
            v70 = v70 + 1;
            v89(v90, v91, v70);
        end;
        v66 = l_Chat_0.Chatted:Connect(v92);
    end;
    local function v94() --[[ Line: 265 ]] --[[ Name: destroyBubbleChat ]]
        -- upvalues: v64 (ref), v65 (ref), v66 (ref), v33 (copy), v68 (ref), v67 (ref)
        if v64 then
            v64:Disconnect();
            v64 = nil;
        end;
        if v65 then
            v65:Disconnect();
            v65 = nil;
        end;
        if v66 then
            v66:Disconnect();
            v66 = nil;
        end;
        if v33 then
            if v68 then
                v68:Disconnect();
                v68 = nil;
            end;
            if v67 then
                v67:Disconnect();
                v67 = nil;
            end;
        end;
    end;
    local function v96() --[[ Line: 291 ]] --[[ Name: onBubbleChatEnabledChanged ]]
        -- upvalues: v94 (copy), l_Chat_0 (copy), v93 (copy), v40 (ref), v15 (copy)
        v94();
        local v95 = not game:GetEngineFeature("EnableBubbleChatFromChatService") or l_Chat_0.BubbleChatEnabled;
        if v95 then
            v93();
        end;
        v40:dispatch(v15(v95));
    end;
    local v97 = {};
    local function v104(v98) --[[ Line: 303 ]] --[[ Name: setVoiceEnabled ]]
        -- upvalues: l_Players_0 (copy), v40 (ref), v16 (copy), v97 (ref), v39 (copy), v18 (copy), v24 (copy), l_GetFFlagLocalMutedNilFix_0 (copy), l_default_0 (copy)
        local v99 = tostring(l_Players_0.LocalPlayer.UserId);
        local v100 = v98 ~= Enum.VoiceChatState.Ended;
        v40:dispatch(v16(v100));
        if not v97[v98] then
            v39:warning("LOCAL_STATE_MAP does not exist for {} state", v98);
            v40:dispatch(v18(v99, v24.VOICE_STATE.MUTED));
        else
            v40:dispatch(v18(v99, v97[v98]));
        end;
        if v98 == Enum.VoiceChatState.Failed then
            for _, v102 in pairs(l_Players_0:GetPlayers()) do
                local v103 = tostring(v102.UserId);
                if v102 ~= l_Players_0.LocalPlayer then
                    v40:dispatch(v18(v103, v24.VOICE_STATE.HIDDEN));
                end;
            end;
            return;
        else
            if v98 == Enum.VoiceChatState.Joined and if l_GetFFlagLocalMutedNilFix_0 then l_default_0.localMuted == false else not l_default_0.localMuted then
                v40:dispatch(v18(v99, v24.VOICE_STATE.INACTIVE));
            end;
            return;
        end;
    end;
    local function _(v105) --[[ Line: 334 ]] --[[ Name: shorten ]]
        return "..." .. string.sub(tostring(v105), -4);
    end;
    local function v124() --[[ Line: 338 ]] --[[ Name: initVoiceChat ]]
        -- upvalues: v30 (copy), v29 (copy), v40 (ref), v39 (copy), l_default_0 (copy), v97 (ref), v24 (copy), l_Players_0 (copy), v19 (copy), v21 (copy), v20 (copy), v18 (copy), l_GetFFlagBatchVoiceParticipantsUpdates_0 (copy), v17 (copy), v26 (copy), v104 (copy)
        if v30() then
            v29(v40);
            return;
        else
            v39:debug("Initializing VoiceChatService connections");
            local v107 = l_default_0:getService();
            if not v107 then
                v39:debug("VoiceChatService is not available");
                return;
            elseif not Enum.VoiceChatState then
                v39:error("Enum.VoiceChatState does not exist but voice is enabled");
                return;
            else
                v97 = {
                    [Enum.VoiceChatState.Idle] = v24.VOICE_STATE.HIDDEN, 
                    [Enum.VoiceChatState.Joining] = v24.VOICE_STATE.CONNECTING, 
                    [Enum.VoiceChatState.JoiningRetry] = v24.VOICE_STATE.CONNECTING, 
                    [Enum.VoiceChatState.Joined] = v24.VOICE_STATE.MUTED, 
                    [Enum.VoiceChatState.Leaving] = v24.VOICE_STATE.MUTED, 
                    [Enum.VoiceChatState.Ended] = v24.VOICE_STATE.HIDDEN, 
                    [Enum.VoiceChatState.Failed] = v24.VOICE_STATE.ERROR
                };
                local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
                for _, v110 in pairs(l_Players_0:GetPlayers()) do
                    v39:trace("Adding existing player {}", "..." .. string.sub(tostring(v110.UserId), -4));
                    v40:dispatch(v19((tostring(v110.UserId))));
                end;
                l_Players_0.PlayerAdded:Connect(function(v111) --[[ Line: 374 ]]
                    -- upvalues: v39 (ref), v40 (ref), v19 (ref)
                    v39:trace("Adding joining player {}", "..." .. string.sub(tostring(v111.UserId), -4));
                    v40:dispatch(v19((tostring(v111.userId))));
                end);
                l_Players_0.PlayerRemoving:Connect(function(v112) --[[ Line: 379 ]]
                    -- upvalues: v39 (ref), v40 (ref), v21 (ref), v20 (ref)
                    v39:trace("Removing player {}", "..." .. string.sub(tostring(v112.UserId), -4));
                    v40:dispatch(v21((tostring(v112.userId))));
                    v40:dispatch(v20((tostring(v112.userId))));
                end);
                v40:dispatch(v18(l_UserId_0, v24.VOICE_STATE.HIDDEN));
                l_default_0.muteChanged.Event:connect(function(v113) --[[ Line: 388 ]]
                    -- upvalues: v39 (ref), v24 (ref), v40 (ref), v18 (ref), l_UserId_0 (copy)
                    v39:debug("Mute changed to {}", v113);
                    local v114 = v113 and v24.VOICE_STATE.MUTED or v24.VOICE_STATE.INACTIVE;
                    v40:dispatch(v18(l_UserId_0, v114));
                end);
                l_default_0.participantsUpdate.Event:Connect(function(v115) --[[ Line: 394 ]]
                    -- upvalues: l_GetFFlagBatchVoiceParticipantsUpdates_0 (ref), v40 (ref), v17 (ref), v24 (ref), v39 (ref), v18 (ref)
                    if l_GetFFlagBatchVoiceParticipantsUpdates_0() then
                        v40:dispatch(v17(v115));
                        return;
                    else
                        for v116, v117 in pairs(v115) do
                            local l_INACTIVE_0 = v24.VOICE_STATE.INACTIVE;
                            if not v117.subscriptionCompleted then
                                l_INACTIVE_0 = v24.VOICE_STATE.CONNECTING;
                            elseif v117.isMutedLocally then
                                l_INACTIVE_0 = v24.VOICE_STATE.LOCAL_MUTED;
                            elseif v117.isMuted then
                                l_INACTIVE_0 = v24.VOICE_STATE.MUTED;
                            elseif v117.isSignalActive then
                                l_INACTIVE_0 = v24.VOICE_STATE.TALKING;
                            end;
                            v39:trace("Participant update for {}, voice state {}", "..." .. string.sub(tostring(v116), -4), l_INACTIVE_0);
                            v40:dispatch(v18(v116, l_INACTIVE_0));
                        end;
                        return;
                    end;
                end);
                l_default_0.talkingChanged.Event:Connect(function(v119) --[[ Line: 416 ]]
                    -- upvalues: v40 (ref), v18 (ref), l_UserId_0 (copy), v24 (ref)
                    if v119 then
                        v40:dispatch(v18(l_UserId_0, v24.VOICE_STATE.TALKING));
                        return;
                    else
                        v40:dispatch(v18(l_UserId_0, v24.VOICE_STATE.INACTIVE));
                        return;
                    end;
                end);
                v26:GetBlockedStatusChangedEvent():Connect(function(v120, v121) --[[ Line: 425 ]]
                    -- upvalues: v40 (ref), v20 (ref), v19 (ref)
                    if v121 then
                        v40:dispatch(v20((tostring(v120))));
                        return;
                    else
                        v40:dispatch(v19((tostring(v120))));
                        return;
                    end;
                end);
                v39:debug("Initial voice state is {}", v107.VoiceChatState);
                v104(v107.VoiceChatState);
                v107.StateChanged:Connect(function(_, v123) --[[ Line: 435 ]]
                    -- upvalues: v39 (ref), v104 (ref)
                    v39:debug("Voice state changed to {}", v123);
                    v104(v123);
                end);
                return;
            end;
        end;
    end;
    if game:GetEngineFeature("EnableBubbleChatFromChatService") then
        l_Chat_0:GetPropertyChangedSignal("BubbleChatEnabled"):Connect(v96);
    end;
    v94();
    local v125 = not game:GetEngineFeature("EnableBubbleChatFromChatService") or l_Chat_0.BubbleChatEnabled;
    if v125 then
        v93();
    end;
    v40:dispatch(v15(v125));
    if game:GetEngineFeature("BubbleChatSettingsApi") then
        l_Chat_0.BubbleChatSettingsChanged:Connect(function(v126) --[[ Line: 447 ]]
            -- upvalues: v25 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy), v38 (copy), v40 (ref), v14 (copy)
            local v127, v128 = v25.IChatSettings(v126);
            assert(v127, "Bad settings object passed to Chat:SetBubbleChatSettings:\n" .. (v128 or ""));
            if l_FFlagExpChatUseChatConfigStore_0 then
                v38.Stores.GetChatConfigurationStore(false).setBubbleChatSettings(v126);
                return;
            else
                v40:dispatch(v14(v126));
                return;
            end;
        end);
    end;
    l_default_0:asyncInit():andThen(v124):catch(function() --[[ Line: 462 ]]
        -- upvalues: v39 (copy)
        v39:debug("VoiceChatServiceManager failed to initialize");
    end);
    return;
end;