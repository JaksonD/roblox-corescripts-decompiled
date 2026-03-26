local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Localization);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactNavigation);
local v5 = require(l_Parent_0.RoactUtils);
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_Parent_0.AppChatNetworking);
local v8 = require(l_Parent_0.SocialUpsell);
local l_dependencyArray_0 = v5.Hooks.dependencyArray;
local l_useCallback_0 = v3.useCallback;
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v3.useEffect;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_useMemo_0 = v3.useMemo;
local l_useRef_0 = v3.useRef;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local v18 = require(l_script_FirstAncestor_0.Logger):new("AppChat.Realtime");
local v19 = require(l_script_FirstAncestor_0.Models.Conversation);
local v20 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v21 = require(l_script_FirstAncestor_0.Conversations.Actions.ChangedParticipants);
local v22 = require(l_script_FirstAncestor_0.Http.RoduxAliases);
local v23 = require(l_script_FirstAncestor_0.Conversations.Actions.ReceivedUserTyping);
local v24 = require(l_script_FirstAncestor_0.Conversations.Actions.RemovedConversation);
local v25 = require(l_script_FirstAncestor_0.Conversations.Actions.RenamedGroupConversation);
local v26 = require(l_script_FirstAncestor_0.Actions.SetConnectionState);
local v27 = require(l_script_FirstAncestor_0.Conversations.Actions.FriendConversationCreated);
local v28 = require(l_script_FirstAncestor_0.Actions.FriendshipDestroyed);
local v29 = require(l_script_FirstAncestor_0.Conversations.Actions.DismissedAllConversationModalsForSequence);
local v30 = require(l_script_FirstAncestor_0.Hooks.useIsChatEnabled);
local v31 = require(l_script_FirstAncestor_0.Hooks.useIsGroupChatEnabled);
local v32 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v33 = require(l_script_FirstAncestor_0.Hooks.useGetOneToOneFriendIdFromConversationId);
local v34 = require(l_script_FirstAncestor_0.Components.ChatConversation.Messages);
local v35 = require(l_script_FirstAncestor_0.EnumScreens);
local l_getNewMessages_0 = v34.Thunks.getNewMessages;
local v37 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatPerfTracking);
local v38 = require(l_script_FirstAncestor_0.Telemetry.AppChatPerfTracker);
local v39 = require(l_script_FirstAncestor_0.Conversations.Thunks.paginateAndRefreshConversations);
local v40 = require(l_script_FirstAncestor_0.Conversations.Thunks.fetchChatMetadata);
local v41 = require(l_script_FirstAncestor_0.Conversations.Thunks.getAllUserPresences);
local v42 = require(l_script_FirstAncestor_0.Conversations.Thunks.fetchLatestConversationDetails);
local v43 = require(l_script_FirstAncestor_0.Conversations.Thunks.getAllFriendsAsync);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v45 = require(l_script_FirstAncestor_0.Conversations.Thunks.multiGetConversationDetails);
local v46 = require(l_script_FirstAncestor_0.Conversations.Thunks.refreshConversationUnfilteredThreadsDetails);
local v47 = require(script.Parent.CommunicationChannelsTypes);
local _ = require(script.Parent.UnfilteredThreadsTypes);
local _ = require(script.Parent.ChatMigrationTypes);
local v50 = require(l_script_FirstAncestor_0.Components.EventReceivers.useChatTrustedConnectionsEvents);
local l_getFFlagDebugUnfilteredThreads_0 = require(l_Parent_0.SharedFlags).getFFlagDebugUnfilteredThreads;
local l_FFlagEnableAEGIS2CommsFAEUpsell_0 = require(l_Parent_0.SharedFlags).FFlagEnableAEGIS2CommsFAEUpsell;
local v53 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatHandleAgeChange);
local l_FFlagAppChatEnableDoubleOptIn_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableDoubleOptIn;
local l_FFlagEnableAEGIS1AppChatBanner_0 = v8.Flags.FFlagEnableAEGIS1AppChatBanner;
local l_FFlagEnableAEGIS2AppChatBanner_0 = require(l_Parent_0.SharedFlags).FFlagEnableAEGIS2AppChatBanner;
local l_FFlagEnableAEGIS2AppChatConversationBanner_0 = require(l_Parent_0.SharedFlags).FFlagEnableAEGIS2AppChatConversationBanner;
local v58 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatReloadMessagesOnTrustedConnectionRTN);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local function v65(v60) --[[ Line: 75 ]] --[[ Name: chunkAndLogString ]]
    -- upvalues: v18 (copy)
    local v61 = {};
    for v62 = 1, #v60, 800 do
        table.insert(v61, v60:sub(v62, v62 + 800 - 1));
    end;
    for _, v64 in v61 do
        v18:debug(v64);
    end;
end;
local v66 = {
    handlesAppShellNotifications = true
};
ChatEventReceiver = function(v67) --[[ Line: 98 ]] --[[ Name: ChatEventReceiver ]]
    -- upvalues: l_useEffect_0 (copy), v18 (copy), l_useSelector_0 (copy), l_useCallback_0 (copy), v6 (copy), l_useLocalUserId_0 (copy), v30 (copy), v31 (copy), v32 (copy), l_useDispatch_0 (copy), v21 (copy), v40 (copy), v42 (copy), v43 (copy), v41 (copy), l_getNewMessages_0 (copy), v37 (copy), v38 (copy), v22 (copy), v23 (copy), v39 (copy), v24 (copy), v25 (copy), v26 (copy), v66 (copy), l_useRef_0 (copy), l_useLocalization_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v4 (copy), v35 (copy), l_FormFactor_0 (copy), v28 (copy), v19 (copy), v47 (copy), v20 (copy), v27 (copy), l_useMemo_0 (copy), l_getFFlagDebugUnfilteredThreads_0 (copy), v65 (copy), v45 (copy), v7 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (copy), v46 (copy), v33 (copy), l_FFlagEnableAEGIS1AppChatBanner_0 (copy), v3 (copy), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (copy), v29 (copy), v8 (copy), l_FFlagEnableAEGIS2AppChatBanner_0 (copy), l_FFlagEnableAEGIS2AppChatConversationBanner_0 (copy), v53 (copy), v58 (copy), v50 (copy)
    l_useEffect_0(function() --[[ Line: 99 ]]
        -- upvalues: v18 (ref)
        v18:info("ChatEventReceiver mounted");
        return function() --[[ Line: 101 ]]
            -- upvalues: v18 (ref)
            v18:info("ChatEventReceiver unmounted");
        end;
    end, {});
    local v69 = l_useSelector_0(l_useCallback_0(function(v68) --[[ Line: 107 ]]
        return v68.ChatAppReducer.AppLoaded;
    end, {}));
    local v71 = l_useSelector_0(l_useCallback_0(function(v70) --[[ Line: 110 ]]
        return v70.ChatAppReducer.Conversations;
    end, {}));
    local v73 = l_useSelector_0(l_useCallback_0(function(v72) --[[ Line: 113 ]]
        return v72.FormFactor;
    end, {}));
    local v75 = l_useSelector_0(l_useCallback_0(function(v74) --[[ Line: 116 ]]
        return v74.Users;
    end, {}));
    local v76 = v6.isEmpty(v71);
    local v77 = l_useLocalUserId_0();
    local v78 = v30();
    local v79 = v31();
    local v80 = v32();
    local v81 = l_useDispatch_0();
    local function v86(v82, v83, v84, v85) --[[ Line: 127 ]]
        -- upvalues: v81 (copy), v21 (ref)
        v81(v21(v82, v83, v84, v85));
    end;
    local function v87() --[[ Line: 130 ]]
        -- upvalues: v81 (copy), v40 (ref)
        return v81(v40());
    end;
    local function v89(v88) --[[ Line: 134 ]]
        -- upvalues: v81 (copy), v42 (ref)
        return v81(v42(v88));
    end;
    local function v90() --[[ Line: 137 ]]
        -- upvalues: v81 (copy), v43 (ref)
        v81(v43());
    end;
    local function v91() --[[ Line: 140 ]]
        -- upvalues: v81 (copy), v41 (ref)
        spawn(function() --[[ Line: 141 ]]
            -- upvalues: v81 (ref), v41 (ref)
            v81(v41());
        end);
    end;
    local function v95(v92, v93, v94) --[[ Line: 145 ]]
        -- upvalues: v81 (copy), l_getNewMessages_0 (ref)
        return v81(l_getNewMessages_0(v92, v93, v94));
    end;
    local function v97(v96) --[[ Line: 149 ]] --[[ Name: restartMessageReceiveToRender ]]
        -- upvalues: v37 (ref), v38 (ref)
        if not v37 then
            return;
        else
            v38.cancel(v38.Events.MessageReceiveToRender, {
                conversationId = tostring(v96)
            });
            v38.start(v38.Events.MessageReceiveToRender, {
                conversationId = tostring(v96)
            });
            return;
        end;
    end;
    local function _(v98, v99) --[[ Line: 162 ]]
        -- upvalues: v81 (copy), v22 (ref)
        v81(v22.Actions.AliasUpdated(v98, v99));
    end;
    local function v103(v101, v102) --[[ Line: 165 ]]
        -- upvalues: v81 (copy), v23 (ref)
        v81(v23(v101, v102));
    end;
    local function v104() --[[ Line: 169 ]]
        -- upvalues: v81 (copy), v39 (ref)
        v81(v39());
    end;
    local function v106(v105) --[[ Line: 173 ]]
        -- upvalues: v81 (copy), v24 (ref)
        v81(v24(v105));
    end;
    local function v111(v107, v108, v109, v110) --[[ Line: 176 ]]
        -- upvalues: v81 (copy), v25 (ref)
        v81(v25(v107, v108, v109, v110));
    end;
    local function _(v112) --[[ Line: 179 ]]
        -- upvalues: v81 (copy), v26 (ref)
        v81(v26(v112));
    end;
    local v114 = v6.Dictionary.join(v66, v67);
    local l_robloxEventReceiver_0 = v114.robloxEventReceiver;
    local v116 = l_useRef_0({});
    local v117 = l_useRef_0(Enum.ConnectionState.Connected);
    local v118 = l_useLocalization_0({
        networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        removedFromConversationToastTitle = "Feature.Chat.Message.RemovedFromConversation"
    });
    local l_networkErrorText_0 = v118.networkErrorText;
    local l_removedFromConversationToastTitle_0 = v118.removedFromConversationToastTitle;
    local v123 = l_useCallback_0(function(v121, v122) --[[ Line: 197 ]]
        -- upvalues: v116 (copy)
        assert(v116.current, "table");
        v116.current[v121] = v122;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v116.current
    } else l_dependencyArray_0(v116.current));
    local v124 = l_useCallback_0(function() --[[ Line: 207 ]]
        -- upvalues: v114 (copy), v4 (ref), v35 (ref), l_networkErrorText_0 (copy)
        if v114.rnBypassActionSignal then
            v114.rnBypassActionSignal:fire(v4.Actions.navigate({
                routeName = v35.RoactChatToast, 
                params = {
                    toastProps = {
                        toastContent = {
                            toastTitle = l_networkErrorText_0
                        }
                    }
                }
            }));
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v114.rnBypassActionSignal, 
        l_networkErrorText_0
    } else l_dependencyArray_0(v114.rnBypassActionSignal, l_networkErrorText_0));
    l_useEffect_0(function() --[[ Line: 227 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v123 (copy), v18 (ref), v81 (copy), v24 (ref), v114 (copy), v4 (ref), v73 (copy), l_FormFactor_0 (ref), v35 (ref), l_removedFromConversationToastTitle_0 (copy), v42 (ref), v25 (ref), v21 (ref), v76 (copy), v37 (ref), v97 (copy), l_getNewMessages_0 (ref), v23 (ref)
        local v145 = l_robloxEventReceiver_0:observeEvent("ChatNotifications", function(v125, v126, _) --[[ Line: 230 ]]
            -- upvalues: v123 (ref), v18 (ref), v81 (ref), v24 (ref), v114 (ref), v4 (ref), v73 (ref), l_FormFactor_0 (ref), v35 (ref), l_removedFromConversationToastTitle_0 (ref), v42 (ref), v25 (ref), v21 (ref), v76 (ref), v37 (ref), v97 (ref), l_getNewMessages_0 (ref), v23 (ref)
            v123("ChatNotifications", v125.SequenceNumber);
            local v128 = v125.Type or v126;
            v18:info("Received chat notification: {}", v128);
            local v129 = v125.ConversationId and tostring(v125.ConversationId) or "";
            if v128 == "RemovedFromConversation" or v128 == "ConversationRemoved" then
                v81(v24(v129));
                local l_activeConversationId_0 = v114.activeConversationId;
                if l_activeConversationId_0 ~= nil and tostring(l_activeConversationId_0) == v129 and v114.rnBypassActionSignal then
                    v114.rnBypassActionSignal:fire(v4.Actions.navigate({
                        routeName = v73 == l_FormFactor_0.WIDE and v35.EmptyConversation or v35.ChatLanding
                    }));
                end;
                if v128 == "RemovedFromConversation" then
                    v114.rnBypassActionSignal:fire(v4.Actions.navigate({
                        routeName = v35.RoactChatToast, 
                        params = {
                            toastProps = {
                                toastContent = {
                                    toastTitle = l_removedFromConversationToastTitle_0
                                }
                            }
                        }
                    }));
                    return;
                end;
            elseif v128 == "ConversationTitleChanged" or v128 == "ParticipantAdded" or v128 == "ParticipantLeft" then
                task.spawn(function() --[[ Line: 268 ]]
                    -- upvalues: v129 (copy), v81 (ref), v42 (ref), v128 (copy), v25 (ref), v21 (ref), v18 (ref)
                    v81(v42(v129)):andThen(function(v131) --[[ Line: 270 ]]
                        -- upvalues: v128 (ref), v129 (ref), v81 (ref), v25 (ref), v21 (ref)
                        local l_title_0 = v131.title;
                        local l_lastUpdated_0 = v131.lastUpdated;
                        if v128 == "ConversationTitleChanged" then
                            local l_v129_0 = v129;
                            local l_isDefaultTitle_0 = v131.isDefaultTitle;
                            v81(v25(l_v129_0, l_title_0, l_isDefaultTitle_0, l_lastUpdated_0));
                            return;
                        else
                            local l_v129_1 = v129;
                            local l_participants_0 = v131.participants;
                            v81(v21(l_v129_1, l_participants_0, l_title_0, l_lastUpdated_0));
                            return;
                        end;
                    end):catch(function(v138) --[[ Line: 291 ]]
                        -- upvalues: v18 (ref), v128 (ref)
                        v18:warning((("NetworkingChat failure in RobloxEventReceiver->%*, Status: %*"):format(v128, (tostring(v138)))));
                    end);
                end);
                return;
            elseif v128 == "AddedToConversation" or v128 == "NewConversation" then
                if v76 then
                    v18:debug((("Received %* event while loading conversation data"):format(v128)));
                    return;
                else
                    task.spawn(function() --[[ Line: 305 ]]
                        -- upvalues: v129 (copy), v81 (ref), v42 (ref), v18 (ref), v128 (copy)
                        v81(v42(v129)):catch(function(v139) --[[ Line: 306 ]]
                            -- upvalues: v18 (ref), v128 (ref)
                            v18:warning((("NetworkingChat failure in RobloxEventReceiver->%*, Status: %*"):format(v128, (tostring(v139)))));
                        end);
                    end);
                    return;
                end;
            elseif v128 == "NewMessage" then
                if v37 and v114.activeConversationId and tostring(v114.activeConversationId) == v129 then
                    v97(v129);
                end;
                local v140 = tick();
                local _ = v81(l_getNewMessages_0(v129, false, v140));
                return;
            elseif v128 == "NewMessageBySelf" then
                local v142 = tick();
                local _ = v81(l_getNewMessages_0(v129, true, v142));
                return;
            elseif v128 == "ParticipantTyping" then
                local v144 = tostring(v125.UserId);
                v81(v23(v129, v144));
            end;
        end);
        return function() --[[ Line: 333 ]]
            -- upvalues: v145 (copy)
            if v145 and v145.disconnect then
                v145:disconnect();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v81, 
        v123, 
        v114.activeConversationId, 
        v114.rnBypassActionSignal, 
        v76, 
        v73, 
        v75
    } else l_dependencyArray_0(v81, v123, v114.activeConversationId, v114.rnBypassActionSignal, v76, v73, v75));
    l_useEffect_0(function() --[[ Line: 360 ]]
        -- upvalues: v78 (copy), v114 (copy), v18 (ref), v4 (ref), v73 (copy), l_FormFactor_0 (ref), v35 (ref)
        if not v78 and v114.activeConversationId and v114.rnBypassActionSignal then
            v18:debug("Chat is disabled for our user, navigating away from active conversation");
            v114.rnBypassActionSignal:fire(v4.Actions.navigate({
                routeName = v73 == l_FormFactor_0.WIDE and v35.EmptyConversation or v35.ChatLanding
            }));
        end;
    end, {
        v78
    });
    local v146 = if v114.activeConversationId then v71[v114.activeConversationId] else nil;
    l_useEffect_0(function() --[[ Line: 374 ]]
        -- upvalues: v79 (copy), v146 (copy), v114 (copy), v18 (ref), v4 (ref), v73 (copy), l_FormFactor_0 (ref), v35 (ref)
        if not v79 and v146 and v114.rnBypassActionSignal and v146.type == "group" then
            v18:debug("Group chats are disabled and we are navigated to a group chat. Navigating to ChatLanding");
            v114.rnBypassActionSignal:fire(v4.Actions.navigate({
                routeName = v73 == l_FormFactor_0.WIDE and v35.EmptyConversation or v35.ChatLanding
            }));
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v79, 
        v146
    } else l_dependencyArray_0(v79, v146));
    l_useEffect_0(function() --[[ Line: 394 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v81 (copy), v22 (ref)
        local v151 = l_robloxEventReceiver_0:observeEvent("UserTagChangeNotification", function(v147, _) --[[ Line: 395 ]]
            -- upvalues: v81 (ref), v22 (ref)
            if v147.Type == "UserTagUpdate" then
                local v149 = tostring(v147.UserId);
                local l_NewAlias_0 = v147.NewAlias;
                v81(v22.Actions.AliasUpdated(v149, l_NewAlias_0));
            end;
        end);
        return function() --[[ Line: 401 ]]
            -- upvalues: v151 (copy)
            if v151 and v151.disconnect then
                v151:disconnect();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v81
    } else l_dependencyArray_0(v81));
    l_useEffect_0(function() --[[ Line: 409 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v18 (ref), v81 (copy), v39 (ref), v77 (copy), v28 (ref), v146 (copy), v19 (ref), v6 (ref), v73 (copy), l_FormFactor_0 (ref), v35 (ref), v114 (copy), v4 (ref)
        local v161 = l_robloxEventReceiver_0:observeEvent("FriendshipNotifications", function(v152, _) --[[ Line: 410 ]]
            -- upvalues: v18 (ref), v81 (ref), v39 (ref), v77 (ref), v28 (ref), v146 (ref), v19 (ref), v6 (ref), v73 (ref), l_FormFactor_0 (ref), v35 (ref), v114 (ref), v4 (ref)
            local l_Type_0 = v152.Type;
            v18:info("Received friendship notification: {}", l_Type_0);
            if l_Type_0 == "FriendshipCreated" then
                v81(v39());
                return;
            else
                if l_Type_0 == "FriendshipDestroyed" then
                    local v155 = nil;
                    if v152.EventArgs then
                        local v156 = tostring(v152.EventArgs.UserId1);
                        local v157 = tostring(v152.EventArgs.UserId2);
                        if v156 == v77 then
                            v156 = "localUserId";
                            v155 = v157;
                        end;
                        if v157 == v77 then
                            v157 = "localUserId";
                            v155 = v156;
                        end;
                        v81(v28({
                            userId1 = v156, 
                            userId2 = v157
                        }));
                    end;
                    do
                        local l_v155_0 = v155;
                        if v146 and v146.source == "friends" and v146.conversationType == v19.Type.ONE_TO_ONE_CONVERSATION and v6.List.findWhere(v146.participants, function(v159) --[[ Line: 442 ]]
                            -- upvalues: l_v155_0 (ref)
                            return v159 == l_v155_0;
                        end) then
                            local v160 = if v73 == l_FormFactor_0.WIDE then v35.EmptyConversation else v35.ChatLanding;
                            v114.rnBypassActionSignal:fire(v4.Actions.navigate({
                                routeName = v160
                            }));
                        end;
                    end;
                end;
                return;
            end;
        end);
        return function() --[[ Line: 456 ]]
            -- upvalues: v161 (copy)
            if v161 and v161.disconnect then
                v161:disconnect();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v81, 
        v104, 
        v77, 
        v73, 
        v146, 
        v114.rnBypassActionSignal
    } else l_dependencyArray_0(v81, v104, v77, v73, v146, v114.rnBypassActionSignal));
    l_useEffect_0(function() --[[ Line: 482 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v18 (ref), v81 (copy), v24 (ref), v42 (ref), v114 (copy), v4 (ref), v35 (ref)
        local v168 = l_robloxEventReceiver_0:observeEvent("ChatMigration", function(v162, _) --[[ Line: 485 ]]
            -- upvalues: v18 (ref), v81 (ref), v24 (ref), v42 (ref), v114 (ref), v4 (ref), v35 (ref)
            local l_Type_1 = v162.Type;
            v18:info("Received chat migration notification: {}", l_Type_1);
            local v165 = nil;
            local v166 = nil;
            if l_Type_1 == "ConversationBackfilled" then
                v165 = v162.ConversationId;
                v166 = v162.ChannelId;
            elseif l_Type_1 == "ConversationReset" then
                v165 = v162.ChannelId;
                v166 = v162.ConversationId;
            else
                v18:warning((("ChatEventReceiver: unknown notification %*"):format(l_Type_1)));
                return;
            end;
            v81(v24(v165));
            v81(v42(v166)):catch(function(v167) --[[ Line: 503 ]]
                -- upvalues: v18 (ref), l_Type_1 (copy)
                v18:warning((("NetworkingChat failure in RobloxEventReceiver->%*, Status: %*"):format(l_Type_1, (tostring(v167)))));
            end);
            if v114.activeConversationId and v165 and tostring(v114.activeConversationId) == v165 and v114.rnBypassActionSignal then
                v114.rnBypassActionSignal:fire(v4.Actions.navigate({
                    routeName = v35.ChatConversation, 
                    params = {
                        conversationId = v166
                    }
                }));
            end;
        end);
        return function() --[[ Line: 525 ]]
            -- upvalues: v168 (copy)
            if v168 and v168.disconnect then
                v168:disconnect();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v81, 
        v114.activeConversationId, 
        v114.rnBypassActionSignal, 
        v89
    } else l_dependencyArray_0(v81, v114.activeConversationId, v114.rnBypassActionSignal, v89));
    local v170 = l_useCallback_0(function() --[[ Line: 547 ]]
        -- upvalues: v69 (copy), v81 (copy), v40 (ref), v18 (ref), v39 (ref), v43 (ref), v41 (ref)
        if v69 then
            v81(v40()):andThen(function(v169) --[[ Line: 549 ]]
                -- upvalues: v18 (ref), v81 (ref), v39 (ref), v43 (ref), v41 (ref)
                if v169 then
                    v18:trace("Chat is enabled for our user, refreshing conversations");
                    v81(v39());
                    task.spawn(function() --[[ Line: 554 ]]
                        -- upvalues: v81 (ref), v43 (ref)
                        v81(v43());
                    end);
                    spawn(function() --[[ Line: 141 ]]
                        -- upvalues: v81 (ref), v41 (ref)
                        v81(v41());
                    end);
                    return;
                else
                    v18:trace("Chat is disabled for our user, no need to refresh conversations");
                    return;
                end;
            end);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v69, 
        v104, 
        v90, 
        v91, 
        v87
    } else l_dependencyArray_0(v69, v104, v90, v91, v87));
    l_useEffect_0(function() --[[ Line: 576 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v18 (ref), v81 (copy), v26 (ref), v117 (copy), v116 (copy), v69 (copy), v170 (copy)
        local v174 = l_robloxEventReceiver_0:observeEvent("signalR", function(v171, _, v173) --[[ Line: 579 ]]
            -- upvalues: v18 (ref), v81 (ref), v26 (ref), v117 (ref), v116 (ref), v69 (ref), v170 (ref)
            v18:info("SignalR connection state transitioned to {}", (tostring(v171)));
            v81(v26(v171));
            v117.current = v171;
            if v171 == Enum.ConnectionState.Connected and v173 and (v116.current == nil or v116.current.ChatNotifications ~= v173.ChatNotifications or v116.current.CommunicationChannels ~= v173.CommunicationChannels) then
                v18:trace("We missed some messages while we were disconnected. The chat app was previously {}", v69 and "loaded" or "unloaded");
                v170();
            end;
        end);
        return function() --[[ Line: 602 ]]
            -- upvalues: v174 (copy)
            if v174 and v174.disconnect then
                v174:disconnect();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v81, 
        v117, 
        v116, 
        v124, 
        v69
    } else l_dependencyArray_0(v81, v117, v116, v124, v69));
    l_useEffect_0(function() --[[ Line: 620 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v47 (ref), v18 (ref), v123 (copy), v81 (copy), v24 (ref), v114 (copy), v73 (copy), l_FormFactor_0 (ref), v35 (ref), v4 (ref), v77 (copy), l_removedFromConversationToastTitle_0 (copy), v42 (ref), v25 (ref), v21 (ref), v76 (copy), v20 (ref), v27 (ref), v37 (ref), v97 (copy), l_getNewMessages_0 (ref), v23 (ref)
        local v198 = l_robloxEventReceiver_0:observeEvent("CommunicationChannels", function(v175, _) --[[ Line: 623 ]]
            -- upvalues: v47 (ref), v18 (ref), v123 (ref), v81 (ref), v24 (ref), v114 (ref), v73 (ref), l_FormFactor_0 (ref), v35 (ref), v4 (ref), v77 (ref), l_removedFromConversationToastTitle_0 (ref), v42 (ref), v25 (ref), v21 (ref), v76 (ref), v20 (ref), v27 (ref), v37 (ref), v97 (ref), l_getNewMessages_0 (ref), v23 (ref)
            if v175.ChannelVertical ~= "PlatformChat" then
                return;
            elseif not table.find(v47.ChannelTypeAllowlist, v175.ChannelType) then
                return;
            else
                v18:info("Received channels notification: {}", v175.Type);
                v123("CommunicationChannels", v175.SequenceNumber);
                local l_ChannelId_0 = v175.ChannelId;
                if v175.Type == "ChannelDeleted" or v175.Type == "RemovedFromChannel" or v175.Type == "ChannelArchived" then
                    v81(v24(l_ChannelId_0));
                    local l_activeConversationId_1 = v114.activeConversationId;
                    if l_activeConversationId_1 ~= nil and tostring(l_activeConversationId_1) == v175.ChannelId and v114.rnBypassActionSignal then
                        local v179 = if v73 == l_FormFactor_0.WIDE then v35.EmptyConversation else v35.ChatLanding;
                        v114.rnBypassActionSignal:fire(v4.Actions.navigate({
                            routeName = v179
                        }));
                    end;
                    if v175.Actor.Id ~= tostring(v77) then
                        v114.rnBypassActionSignal:fire(v4.Actions.navigate({
                            routeName = v35.RoactChatToast, 
                            params = {
                                toastProps = {
                                    toastContent = {
                                        toastTitle = l_removedFromConversationToastTitle_0
                                    }
                                }
                            }
                        }));
                        return;
                    end;
                elseif v175.Type == "ChannelUpdated" or v175.Type == "ParticipantsAdded" or v175.Type == "ParticipantsRemoved" then
                    task.spawn(function() --[[ Line: 676 ]]
                        -- upvalues: l_ChannelId_0 (copy), v81 (ref), v42 (ref), v175 (copy), v25 (ref), v21 (ref), v18 (ref)
                        v81(v42(l_ChannelId_0)):andThen(function(v180) --[[ Line: 678 ]]
                            -- upvalues: v175 (ref), l_ChannelId_0 (ref), v81 (ref), v25 (ref), v21 (ref)
                            local l_title_1 = v180.title;
                            local l_lastUpdated_1 = v180.lastUpdated;
                            if v175.Type == "ChannelUpdated" then
                                local l_l_ChannelId_0_0 = l_ChannelId_0;
                                local l_isDefaultTitle_1 = v180.isDefaultTitle;
                                v81(v25(l_l_ChannelId_0_0, l_title_1, l_isDefaultTitle_1, l_lastUpdated_1));
                                return;
                            else
                                local l_l_ChannelId_0_1 = l_ChannelId_0;
                                local l_participants_1 = v180.participants;
                                v81(v21(l_l_ChannelId_0_1, l_participants_1, l_title_1, l_lastUpdated_1));
                                return;
                            end;
                        end):catch(function(v187) --[[ Line: 694 ]]
                            -- upvalues: v18 (ref), v175 (ref)
                            v18:warning((("Failure in RobloxEventReceiver->%*, Status: %*"):format(v175.Type, (tostring(v187)))));
                        end);
                    end);
                    return;
                elseif v175.Type == "AddedToChannel" or v175.Type == "ChannelCreated" or v175.Type == "ChannelMarkedRead" or v175.Type == "ChannelMetadataUpdated" and l_ChannelId_0 ~= nil or v175.Type == "ChannelUnarchived" then
                    if v76 then
                        v18:debug("Received {} event while loading conversation data", v175.Type);
                        return;
                    else
                        task.spawn(function() --[[ Line: 712 ]]
                            -- upvalues: l_ChannelId_0 (copy), v81 (ref), v42 (ref), v175 (copy), v20 (ref), v27 (ref), v114 (ref), v4 (ref), v35 (ref), v18 (ref)
                            v81(v42(l_ChannelId_0)):andThen(function(v188) --[[ Line: 714 ]]
                                -- upvalues: v175 (ref), v20 (ref), v81 (ref), v27 (ref), v114 (ref), v4 (ref), v35 (ref)
                                if (v175.Type == "ChannelCreated" or v175.Type == "ChannelUnarchived") and v188.type == "one_to_one" then
                                    local v189 = v20.getFriendConversationId(v188.participants);
                                    if v189 then
                                        v81(v27({
                                            newConversationId = v188.id, 
                                            oldFriendConversationId = v189
                                        }));
                                        if v114.activeConversationId == v189 then
                                            v114.rnBypassActionSignal:fire(v4.Actions.navigate({
                                                routeName = v35.ChatConversation, 
                                                params = {
                                                    conversationId = v188.id
                                                }
                                            }));
                                        end;
                                    end;
                                end;
                            end):catch(function(v190) --[[ Line: 738 ]]
                                -- upvalues: v18 (ref), v175 (ref)
                                v18:warning("Failure in RobloxEventReceiver->{}, Status: {}", v175.Type, (tostring(v190)));
                            end);
                        end);
                        return;
                    end;
                elseif v175.Type == "MessageCreated" or v175.Type == "SystemMessageCreated" then
                    if v37 then
                        local v191 = v175.Actor.Id == tostring(v77);
                        if not v191 and v114.activeConversationId and tostring(v114.activeConversationId) == l_ChannelId_0 then
                            v97(l_ChannelId_0);
                        end;
                        local v192 = tick();
                        local _ = v81(l_getNewMessages_0(l_ChannelId_0, v191, v192));
                        return;
                    else
                        local v194 = v175.Actor.Id == tostring(v77);
                        local v195 = tick();
                        local _ = v81(l_getNewMessages_0(l_ChannelId_0, v194, v195));
                        return;
                    end;
                elseif v175.Type == "ParticipantTyping" and v175.IsTyping then
                    local l_Id_0 = v175.Actor.Id;
                    v81(v23(l_ChannelId_0, l_Id_0));
                end;
                return;
            end;
        end);
        return function() --[[ Line: 767 ]]
            -- upvalues: v198 (copy)
            if v198 and v198.disconnect then
                v198:disconnect();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v77, 
        l_robloxEventReceiver_0, 
        v123, 
        v106, 
        v114.activeConversationId, 
        v114.rnBypassActionSignal, 
        l_removedFromConversationToastTitle_0, 
        v89, 
        v111, 
        v86, 
        v76, 
        v95, 
        v103, 
        v170
    } else l_dependencyArray_0(v77, l_robloxEventReceiver_0, v123, v106, v114.activeConversationId, v114.rnBypassActionSignal, l_removedFromConversationToastTitle_0, v89, v111, v86, v76, v95, v103, v170));
    local v200 = l_useMemo_0(function() --[[ Line: 808 ]]
        -- upvalues: v71 (copy), v6 (ref)
        if not v71 then
            return {};
        else
            return (v6.List.filterMap(v6.Dictionary.values(v71), function(v199) --[[ Line: 813 ]]
                if v199 and v199.id and v199.source ~= "friends" then
                    return v199.id;
                else
                    return nil;
                end;
            end));
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v71
    } else l_dependencyArray_0(v71));
    l_useEffect_0(function() --[[ Line: 824 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v18 (ref), l_getFFlagDebugUnfilteredThreads_0 (ref), v65 (ref), v6 (ref), v200 (copy), v81 (copy), v45 (ref), v114 (copy), v7 (ref), l_FFlagAppChatEnableDoubleOptIn_0 (ref), v46 (ref), v80 (copy)
        local v215 = l_robloxEventReceiver_0:observeEvent("ChatModerationTypeEligibility", function(v201, _) --[[ Line: 827 ]]
            -- upvalues: v18 (ref), l_getFFlagDebugUnfilteredThreads_0 (ref), v65 (ref), v6 (ref), v200 (ref), v81 (ref), v45 (ref), v114 (ref), v7 (ref), l_FFlagAppChatEnableDoubleOptIn_0 (ref), v46 (ref), v80 (ref)
            v18:debug("Received ChatModerationTypeEligibility notification");
            local l_channels_inspected_0 = v201.channels_inspected;
            if not l_channels_inspected_0 or #l_channels_inspected_0 == 0 then
                return;
            else
                if l_getFFlagDebugUnfilteredThreads_0() then
                    local v204 = "";
                    for _, v206 in l_channels_inspected_0 do
                        v204 = ("%*, %*"):format(v204, v206);
                    end;
                    v65((("RTN CONVERSATIONS INSPECTED%*"):format(v204)));
                end;
                local v208 = v6.List.filter(l_channels_inspected_0, function(v207) --[[ Line: 841 ]]
                    -- upvalues: v200 (ref)
                    return table.find(v200, v207);
                end);
                if #v208 == 0 then
                    v18:debug("No filtered existing conversation IDs found in ChatModerationTypeEligibility notification");
                    return;
                else
                    if l_getFFlagDebugUnfilteredThreads_0() then
                        local v209 = "";
                        for _, v211 in v208 do
                            v209 = ("%*, %*"):format(v209, v211);
                        end;
                        v65((("RTN FILTERED CONVERSATIONS%*"):format(v209)));
                    end;
                    v81(v45(v208)):catch(function(v212) --[[ Line: 857 ]]
                        -- upvalues: v18 (ref)
                        v18:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->MultiGetConversationDetails, Status: " .. tostring(v212));
                    end);
                    if not v114.activeConversationId then
                        return;
                    else
                        if table.find(l_channels_inspected_0, v114.activeConversationId) then
                            v81(v7.rodux.GetConversationsParticipantsMetadata.API({
                                v114.activeConversationId
                            })):catch(function(v213) --[[ Line: 871 ]]
                                -- upvalues: v18 (ref)
                                v18:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->GetConversationsParticipantsMetadata, Status: " .. tostring(v213));
                            end);
                            if l_FFlagAppChatEnableDoubleOptIn_0 then
                                v81(v46(v114.activeConversationId, v80));
                                return;
                            else
                                v81(v7.rodux.GetConversationTopModal.API(v114.activeConversationId, v80)):catch(function(v214) --[[ Line: 888 ]]
                                    -- upvalues: v18 (ref)
                                    v18:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->GetConversationTopModal, Status: " .. tostring(v214));
                                end);
                            end;
                        end;
                        return;
                    end;
                end;
            end;
        end);
        return function() --[[ Line: 900 ]]
            -- upvalues: v215 (copy)
            if v215 and v215.disconnect then
                v215:disconnect();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v81, 
        v114.activeConversationId, 
        v200
    } else l_dependencyArray_0(v81, v114.activeConversationId, v200));
    l_useEffect_0(function() --[[ Line: 911 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v18 (ref), v81 (copy), v7 (ref), v80 (copy)
        local v219 = l_robloxEventReceiver_0:observeEvent("EligibilityStatusChanged", function(_, _) --[[ Line: 914 ]]
            -- upvalues: v18 (ref), v81 (ref), v7 (ref), v80 (ref)
            v18:info("Received EligibilityStatusChanged notification");
            v81(v7.rodux.GetChatLandingModal.API(v80)):catch(function(v218) --[[ Line: 917 ]]
                -- upvalues: v18 (ref)
                v18:warning("Error in GetChatLandingModal request. Error: {}", (tostring(v218)));
            end);
        end);
        return function() --[[ Line: 923 ]]
            -- upvalues: v219 (copy)
            if v219 and v219.disconnect then
                v219:disconnect();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v81
    } else l_dependencyArray_0(v81));
    local v220 = v33(v114.activeConversationId) or "";
    if l_FFlagEnableAEGIS1AppChatBanner_0 then
        v3.useEffect(function() --[[ Line: 932 ]]
            -- upvalues: v80 (copy), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (ref), v81 (copy), v29 (ref), v8 (ref), l_FFlagEnableAEGIS1AppChatBanner_0 (ref), l_FFlagEnableAEGIS2AppChatBanner_0 (ref), v7 (ref), v18 (ref), l_FFlagEnableAEGIS2AppChatConversationBanner_0 (ref), v146 (copy), v220 (copy), v53 (ref), v40 (ref)
            if v80 and not l_FFlagEnableAEGIS2CommsFAEUpsell_0 then
                return;
            else
                local function _(v221) --[[ Line: 937 ]]
                    -- upvalues: v81 (ref), v29 (ref)
                    v81(v29(v221));
                end;
                local v227 = v8.Signals.GetAgeVerifiedChangedSignal():connect(function() --[[ Line: 941 ]]
                    -- upvalues: l_FFlagEnableAEGIS1AppChatBanner_0 (ref), l_FFlagEnableAEGIS2AppChatBanner_0 (ref), v81 (ref), v7 (ref), v80 (ref), v18 (ref), l_FFlagEnableAEGIS2AppChatConversationBanner_0 (ref), v29 (ref), v146 (ref), v220 (ref), v53 (ref), v40 (ref)
                    if l_FFlagEnableAEGIS1AppChatBanner_0 or l_FFlagEnableAEGIS2AppChatBanner_0 then
                        v81(v7.rodux.GetChatLandingModal.API(v80)):catch(function(v223) --[[ Line: 943 ]]
                            -- upvalues: v18 (ref)
                            v18:warning("Error in GetChatLandingModal request. Error: {}", (tostring(v223)));
                        end);
                    end;
                    if l_FFlagEnableAEGIS2AppChatConversationBanner_0 then
                        local l_ConversationBottomModal_0 = v7.Constants.ModalSequence.ConversationBottomModal;
                        v81(v29(l_ConversationBottomModal_0));
                        if v146 then
                            v81(v7.rodux.GetModalSequence.API({
                                modalSequence = v7.Constants.ModalSequence.ConversationBottomModal, 
                                isInExperience = v80, 
                                conversationId = if v146.source == "channels" then v146.id else nil, 
                                friendId = if v146.source == "friends" then v220 else nil
                            })):catch(function(v225) --[[ Line: 962 ]]
                                -- upvalues: v18 (ref)
                                v18:warning((("Error in GetModalSequence -> conversationBottomModal request after age verification status changes. Error: %*"):format((tostring(v225)))));
                            end);
                        end;
                    end;
                    if v53 then
                        v18:debug("AgeVerifiedChangedSignal Received, fetching chat metadata");
                        v81(v40()):catch(function(v226) --[[ Line: 974 ]]
                            -- upvalues: v18 (ref)
                            v18:warning("Error in fetchChatMetadata request after age verification status changes. Error: {}", (tostring(v226)));
                        end);
                    end;
                end);
                return function() --[[ Line: 983 ]]
                    -- upvalues: v227 (copy)
                    if v227 and v227.disconnect then
                        v227:disconnect();
                    end;
                end;
            end;
        end, {
            v81, 
            v80, 
            v146, 
            v220
        });
    end;
    if l_FFlagAppChatEnableDoubleOptIn_0 or v58 then
        v50({
            activeConversationId = v114.activeConversationId
        });
    end;
    return {};
end;
return ChatEventReceiver;