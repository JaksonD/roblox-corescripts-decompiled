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
local function v64(v59) --[[ Line: 73 ]] --[[ Name: chunkAndLogString ]]
    -- upvalues: v18 (copy)
    local v60 = {};
    for v61 = 1, #v59, 800 do
        table.insert(v60, v59:sub(v61, v61 + 800 - 1));
    end;
    for _, v63 in v60 do
        v18:debug(v63);
    end;
end;
local v65 = {
    handlesAppShellNotifications = true
};
ChatEventReceiver = function(v66) --[[ Line: 96 ]] --[[ Name: ChatEventReceiver ]]
    -- upvalues: l_useEffect_0 (copy), v18 (copy), l_useSelector_0 (copy), l_useCallback_0 (copy), v6 (copy), l_useLocalUserId_0 (copy), v30 (copy), v31 (copy), v32 (copy), l_useDispatch_0 (copy), v21 (copy), v40 (copy), v42 (copy), v43 (copy), v41 (copy), l_getNewMessages_0 (copy), v37 (copy), v38 (copy), v22 (copy), v23 (copy), v39 (copy), v24 (copy), v25 (copy), v26 (copy), v65 (copy), l_useRef_0 (copy), l_useLocalization_0 (copy), l_dependencyArray_0 (copy), v4 (copy), v35 (copy), l_FormFactor_0 (copy), v28 (copy), v19 (copy), v47 (copy), v20 (copy), v27 (copy), l_useMemo_0 (copy), l_getFFlagDebugUnfilteredThreads_0 (copy), v64 (copy), v45 (copy), v7 (copy), l_FFlagAppChatEnableDoubleOptIn_0 (copy), v46 (copy), v33 (copy), l_FFlagEnableAEGIS1AppChatBanner_0 (copy), v3 (copy), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (copy), v29 (copy), v8 (copy), l_FFlagEnableAEGIS2AppChatBanner_0 (copy), l_FFlagEnableAEGIS2AppChatConversationBanner_0 (copy), v53 (copy), v58 (copy), v50 (copy)
    l_useEffect_0(function() --[[ Line: 97 ]]
        -- upvalues: v18 (ref)
        v18:info("ChatEventReceiver mounted");
        return function() --[[ Line: 99 ]]
            -- upvalues: v18 (ref)
            v18:info("ChatEventReceiver unmounted");
        end;
    end, {});
    local v68 = l_useSelector_0(l_useCallback_0(function(v67) --[[ Line: 105 ]]
        return v67.ChatAppReducer.AppLoaded;
    end, {}));
    local v70 = l_useSelector_0(l_useCallback_0(function(v69) --[[ Line: 108 ]]
        return v69.ChatAppReducer.Conversations;
    end, {}));
    local v72 = l_useSelector_0(l_useCallback_0(function(v71) --[[ Line: 111 ]]
        return v71.FormFactor;
    end, {}));
    local v74 = l_useSelector_0(l_useCallback_0(function(v73) --[[ Line: 114 ]]
        return v73.Users;
    end, {}));
    local v75 = v6.isEmpty(v70);
    local v76 = l_useLocalUserId_0();
    local v77 = v30();
    local v78 = v31();
    local v79 = v32();
    local v80 = l_useDispatch_0();
    local function v85(v81, v82, v83, v84) --[[ Line: 125 ]]
        -- upvalues: v80 (copy), v21 (ref)
        v80(v21(v81, v82, v83, v84));
    end;
    local function v86() --[[ Line: 128 ]]
        -- upvalues: v80 (copy), v40 (ref)
        return v80(v40());
    end;
    local function v88(v87) --[[ Line: 132 ]]
        -- upvalues: v80 (copy), v42 (ref)
        return v80(v42(v87));
    end;
    local function v89() --[[ Line: 135 ]]
        -- upvalues: v80 (copy), v43 (ref)
        v80(v43());
    end;
    local function v90() --[[ Line: 138 ]]
        -- upvalues: v80 (copy), v41 (ref)
        spawn(function() --[[ Line: 139 ]]
            -- upvalues: v80 (ref), v41 (ref)
            v80(v41());
        end);
    end;
    local function v94(v91, v92, v93) --[[ Line: 143 ]]
        -- upvalues: v80 (copy), l_getNewMessages_0 (ref)
        return v80(l_getNewMessages_0(v91, v92, v93));
    end;
    local function v96(v95) --[[ Line: 147 ]] --[[ Name: restartMessageReceiveToRender ]]
        -- upvalues: v37 (ref), v38 (ref)
        if not v37 then
            return;
        else
            v38.cancel(v38.Events.MessageReceiveToRender, {
                conversationId = tostring(v95)
            });
            v38.start(v38.Events.MessageReceiveToRender, {
                conversationId = tostring(v95)
            });
            return;
        end;
    end;
    local function _(v97, v98) --[[ Line: 160 ]]
        -- upvalues: v80 (copy), v22 (ref)
        v80(v22.Actions.AliasUpdated(v97, v98));
    end;
    local function v102(v100, v101) --[[ Line: 163 ]]
        -- upvalues: v80 (copy), v23 (ref)
        v80(v23(v100, v101));
    end;
    local function v103() --[[ Line: 167 ]]
        -- upvalues: v80 (copy), v39 (ref)
        v80(v39());
    end;
    local function v105(v104) --[[ Line: 171 ]]
        -- upvalues: v80 (copy), v24 (ref)
        v80(v24(v104));
    end;
    local function v110(v106, v107, v108, v109) --[[ Line: 174 ]]
        -- upvalues: v80 (copy), v25 (ref)
        v80(v25(v106, v107, v108, v109));
    end;
    local function _(v111) --[[ Line: 177 ]]
        -- upvalues: v80 (copy), v26 (ref)
        v80(v26(v111));
    end;
    local v113 = v6.Dictionary.join(v65, v66);
    local l_robloxEventReceiver_0 = v113.robloxEventReceiver;
    local v115 = l_useRef_0({});
    local v116 = l_useRef_0(Enum.ConnectionState.Connected);
    local v117 = l_useLocalization_0({
        networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        removedFromConversationToastTitle = "Feature.Chat.Message.RemovedFromConversation"
    });
    local l_networkErrorText_0 = v117.networkErrorText;
    local l_removedFromConversationToastTitle_0 = v117.removedFromConversationToastTitle;
    local v122 = l_useCallback_0(function(v120, v121) --[[ Line: 194 ]]
        -- upvalues: v115 (copy)
        assert(v115.current, "table");
        v115.current[v120] = v121;
    end, l_dependencyArray_0(v115.current));
    local v123 = l_useCallback_0(function() --[[ Line: 199 ]]
        -- upvalues: v113 (copy), v4 (ref), v35 (ref), l_networkErrorText_0 (copy)
        if v113.rnBypassActionSignal then
            v113.rnBypassActionSignal:fire(v4.Actions.navigate({
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
    end, l_dependencyArray_0(v113.rnBypassActionSignal, l_networkErrorText_0));
    l_useEffect_0(function() --[[ Line: 215 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v122 (copy), v18 (ref), v80 (copy), v24 (ref), v113 (copy), v4 (ref), v72 (copy), l_FormFactor_0 (ref), v35 (ref), l_removedFromConversationToastTitle_0 (copy), v42 (ref), v25 (ref), v21 (ref), v75 (copy), v37 (ref), v96 (copy), l_getNewMessages_0 (ref), v23 (ref)
        local v144 = l_robloxEventReceiver_0:observeEvent("ChatNotifications", function(v124, v125, _) --[[ Line: 218 ]]
            -- upvalues: v122 (ref), v18 (ref), v80 (ref), v24 (ref), v113 (ref), v4 (ref), v72 (ref), l_FormFactor_0 (ref), v35 (ref), l_removedFromConversationToastTitle_0 (ref), v42 (ref), v25 (ref), v21 (ref), v75 (ref), v37 (ref), v96 (ref), l_getNewMessages_0 (ref), v23 (ref)
            v122("ChatNotifications", v124.SequenceNumber);
            local v127 = v124.Type or v125;
            v18:info("Received chat notification: {}", v127);
            local v128 = v124.ConversationId and tostring(v124.ConversationId) or "";
            if v127 == "RemovedFromConversation" or v127 == "ConversationRemoved" then
                v80(v24(v128));
                local l_activeConversationId_0 = v113.activeConversationId;
                if l_activeConversationId_0 ~= nil and tostring(l_activeConversationId_0) == v128 and v113.rnBypassActionSignal then
                    v113.rnBypassActionSignal:fire(v4.Actions.navigate({
                        routeName = v72 == l_FormFactor_0.WIDE and v35.EmptyConversation or v35.ChatLanding
                    }));
                end;
                if v127 == "RemovedFromConversation" then
                    v113.rnBypassActionSignal:fire(v4.Actions.navigate({
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
            elseif v127 == "ConversationTitleChanged" or v127 == "ParticipantAdded" or v127 == "ParticipantLeft" then
                task.spawn(function() --[[ Line: 256 ]]
                    -- upvalues: v128 (copy), v80 (ref), v42 (ref), v127 (copy), v25 (ref), v21 (ref), v18 (ref)
                    v80(v42(v128)):andThen(function(v130) --[[ Line: 258 ]]
                        -- upvalues: v127 (ref), v128 (ref), v80 (ref), v25 (ref), v21 (ref)
                        local l_title_0 = v130.title;
                        local l_lastUpdated_0 = v130.lastUpdated;
                        if v127 == "ConversationTitleChanged" then
                            local l_v128_0 = v128;
                            local l_isDefaultTitle_0 = v130.isDefaultTitle;
                            v80(v25(l_v128_0, l_title_0, l_isDefaultTitle_0, l_lastUpdated_0));
                            return;
                        else
                            local l_v128_1 = v128;
                            local l_participants_0 = v130.participants;
                            v80(v21(l_v128_1, l_participants_0, l_title_0, l_lastUpdated_0));
                            return;
                        end;
                    end):catch(function(v137) --[[ Line: 279 ]]
                        -- upvalues: v18 (ref), v127 (ref)
                        v18:warning((("NetworkingChat failure in RobloxEventReceiver->%*, Status: %*"):format(v127, (tostring(v137)))));
                    end);
                end);
                return;
            elseif v127 == "AddedToConversation" or v127 == "NewConversation" then
                if v75 then
                    v18:debug((("Received %* event while loading conversation data"):format(v127)));
                    return;
                else
                    task.spawn(function() --[[ Line: 293 ]]
                        -- upvalues: v128 (copy), v80 (ref), v42 (ref), v18 (ref), v127 (copy)
                        v80(v42(v128)):catch(function(v138) --[[ Line: 294 ]]
                            -- upvalues: v18 (ref), v127 (ref)
                            v18:warning((("NetworkingChat failure in RobloxEventReceiver->%*, Status: %*"):format(v127, (tostring(v138)))));
                        end);
                    end);
                    return;
                end;
            elseif v127 == "NewMessage" then
                if v37 and v113.activeConversationId and tostring(v113.activeConversationId) == v128 then
                    v96(v128);
                end;
                local v139 = tick();
                local _ = v80(l_getNewMessages_0(v128, false, v139));
                return;
            elseif v127 == "NewMessageBySelf" then
                local v141 = tick();
                local _ = v80(l_getNewMessages_0(v128, true, v141));
                return;
            elseif v127 == "ParticipantTyping" then
                local v143 = tostring(v124.UserId);
                v80(v23(v128, v143));
            end;
        end);
        return function() --[[ Line: 321 ]]
            -- upvalues: v144 (copy)
            if v144 and v144.disconnect then
                v144:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v80, v122, v113.activeConversationId, v113.rnBypassActionSignal, v75, v72, v74));
    l_useEffect_0(function() --[[ Line: 338 ]]
        -- upvalues: v77 (copy), v113 (copy), v18 (ref), v4 (ref), v72 (copy), l_FormFactor_0 (ref), v35 (ref)
        if not v77 and v113.activeConversationId and v113.rnBypassActionSignal then
            v18:debug("Chat is disabled for our user, navigating away from active conversation");
            v113.rnBypassActionSignal:fire(v4.Actions.navigate({
                routeName = v72 == l_FormFactor_0.WIDE and v35.EmptyConversation or v35.ChatLanding
            }));
        end;
    end, {
        v77
    });
    local v145 = if v113.activeConversationId then v70[v113.activeConversationId] else nil;
    l_useEffect_0(function() --[[ Line: 351 ]]
        -- upvalues: v78 (copy), v145 (copy), v113 (copy), v18 (ref), v4 (ref), v72 (copy), l_FormFactor_0 (ref), v35 (ref)
        if not v78 and v145 and v113.rnBypassActionSignal and v145.type == "group" then
            v18:debug("Group chats are disabled and we are navigated to a group chat. Navigating to ChatLanding");
            v113.rnBypassActionSignal:fire(v4.Actions.navigate({
                routeName = v72 == l_FormFactor_0.WIDE and v35.EmptyConversation or v35.ChatLanding
            }));
        end;
    end, l_dependencyArray_0(v78, v145));
    l_useEffect_0(function() --[[ Line: 367 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v80 (copy), v22 (ref)
        local v150 = l_robloxEventReceiver_0:observeEvent("UserTagChangeNotification", function(v146, _) --[[ Line: 368 ]]
            -- upvalues: v80 (ref), v22 (ref)
            if v146.Type == "UserTagUpdate" then
                local v148 = tostring(v146.UserId);
                local l_NewAlias_0 = v146.NewAlias;
                v80(v22.Actions.AliasUpdated(v148, l_NewAlias_0));
            end;
        end);
        return function() --[[ Line: 374 ]]
            -- upvalues: v150 (copy)
            if v150 and v150.disconnect then
                v150:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v80));
    l_useEffect_0(function() --[[ Line: 382 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v18 (ref), v80 (copy), v39 (ref), v76 (copy), v28 (ref), v145 (copy), v19 (ref), v6 (ref), v72 (copy), l_FormFactor_0 (ref), v35 (ref), v113 (copy), v4 (ref)
        local v160 = l_robloxEventReceiver_0:observeEvent("FriendshipNotifications", function(v151, _) --[[ Line: 383 ]]
            -- upvalues: v18 (ref), v80 (ref), v39 (ref), v76 (ref), v28 (ref), v145 (ref), v19 (ref), v6 (ref), v72 (ref), l_FormFactor_0 (ref), v35 (ref), v113 (ref), v4 (ref)
            local l_Type_0 = v151.Type;
            v18:info("Received friendship notification: {}", l_Type_0);
            if l_Type_0 == "FriendshipCreated" then
                v80(v39());
                return;
            else
                if l_Type_0 == "FriendshipDestroyed" then
                    local v154 = nil;
                    if v151.EventArgs then
                        local v155 = tostring(v151.EventArgs.UserId1);
                        local v156 = tostring(v151.EventArgs.UserId2);
                        if v155 == v76 then
                            v155 = "localUserId";
                            v154 = v156;
                        end;
                        if v156 == v76 then
                            v156 = "localUserId";
                            v154 = v155;
                        end;
                        v80(v28({
                            userId1 = v155, 
                            userId2 = v156
                        }));
                    end;
                    do
                        local l_v154_0 = v154;
                        if v145 and v145.source == "friends" and v145.conversationType == v19.Type.ONE_TO_ONE_CONVERSATION and v6.List.findWhere(v145.participants, function(v158) --[[ Line: 415 ]]
                            -- upvalues: l_v154_0 (ref)
                            return v158 == l_v154_0;
                        end) then
                            local v159 = if v72 == l_FormFactor_0.WIDE then v35.EmptyConversation else v35.ChatLanding;
                            v113.rnBypassActionSignal:fire(v4.Actions.navigate({
                                routeName = v159
                            }));
                        end;
                    end;
                end;
                return;
            end;
        end);
        return function() --[[ Line: 429 ]]
            -- upvalues: v160 (copy)
            if v160 and v160.disconnect then
                v160:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v80, v103, v76, v72, v145, v113.rnBypassActionSignal));
    l_useEffect_0(function() --[[ Line: 446 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v18 (ref), v80 (copy), v24 (ref), v42 (ref), v113 (copy), v4 (ref), v35 (ref)
        local v167 = l_robloxEventReceiver_0:observeEvent("ChatMigration", function(v161, _) --[[ Line: 449 ]]
            -- upvalues: v18 (ref), v80 (ref), v24 (ref), v42 (ref), v113 (ref), v4 (ref), v35 (ref)
            local l_Type_1 = v161.Type;
            v18:info("Received chat migration notification: {}", l_Type_1);
            local v164 = nil;
            local v165 = nil;
            if l_Type_1 == "ConversationBackfilled" then
                v164 = v161.ConversationId;
                v165 = v161.ChannelId;
            elseif l_Type_1 == "ConversationReset" then
                v164 = v161.ChannelId;
                v165 = v161.ConversationId;
            else
                v18:warning((("ChatEventReceiver: unknown notification %*"):format(l_Type_1)));
                return;
            end;
            v80(v24(v164));
            v80(v42(v165)):catch(function(v166) --[[ Line: 467 ]]
                -- upvalues: v18 (ref), l_Type_1 (copy)
                v18:warning((("NetworkingChat failure in RobloxEventReceiver->%*, Status: %*"):format(l_Type_1, (tostring(v166)))));
            end);
            if v113.activeConversationId and v164 and tostring(v113.activeConversationId) == v164 and v113.rnBypassActionSignal then
                v113.rnBypassActionSignal:fire(v4.Actions.navigate({
                    routeName = v35.ChatConversation, 
                    params = {
                        conversationId = v165
                    }
                }));
            end;
        end);
        return function() --[[ Line: 489 ]]
            -- upvalues: v167 (copy)
            if v167 and v167.disconnect then
                v167:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v80, v113.activeConversationId, v113.rnBypassActionSignal, v88));
    local v169 = l_useCallback_0(function() --[[ Line: 503 ]]
        -- upvalues: v68 (copy), v80 (copy), v40 (ref), v18 (ref), v39 (ref), v43 (ref), v41 (ref)
        if v68 then
            v80(v40()):andThen(function(v168) --[[ Line: 505 ]]
                -- upvalues: v18 (ref), v80 (ref), v39 (ref), v43 (ref), v41 (ref)
                if v168 then
                    v18:trace("Chat is enabled for our user, refreshing conversations");
                    v80(v39());
                    task.spawn(function() --[[ Line: 510 ]]
                        -- upvalues: v80 (ref), v43 (ref)
                        v80(v43());
                    end);
                    spawn(function() --[[ Line: 139 ]]
                        -- upvalues: v80 (ref), v41 (ref)
                        v80(v41());
                    end);
                    return;
                else
                    v18:trace("Chat is disabled for our user, no need to refresh conversations");
                    return;
                end;
            end);
        end;
    end, l_dependencyArray_0(v68, v103, v89, v90, v86));
    l_useEffect_0(function() --[[ Line: 521 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v18 (ref), v80 (copy), v26 (ref), v116 (copy), v115 (copy), v68 (copy), v169 (copy)
        local v173 = l_robloxEventReceiver_0:observeEvent("signalR", function(v170, _, v172) --[[ Line: 524 ]]
            -- upvalues: v18 (ref), v80 (ref), v26 (ref), v116 (ref), v115 (ref), v68 (ref), v169 (ref)
            v18:info("SignalR connection state transitioned to {}", (tostring(v170)));
            v80(v26(v170));
            v116.current = v170;
            if v170 == Enum.ConnectionState.Connected and v172 and (v115.current == nil or v115.current.ChatNotifications ~= v172.ChatNotifications or v115.current.CommunicationChannels ~= v172.CommunicationChannels) then
                v18:trace("We missed some messages while we were disconnected. The chat app was previously {}", v68 and "loaded" or "unloaded");
                v169();
            end;
        end);
        return function() --[[ Line: 547 ]]
            -- upvalues: v173 (copy)
            if v173 and v173.disconnect then
                v173:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v80, v116, v115, v123, v68));
    l_useEffect_0(function() --[[ Line: 555 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v47 (ref), v18 (ref), v122 (copy), v80 (copy), v24 (ref), v113 (copy), v72 (copy), l_FormFactor_0 (ref), v35 (ref), v4 (ref), v76 (copy), l_removedFromConversationToastTitle_0 (copy), v42 (ref), v25 (ref), v21 (ref), v75 (copy), v20 (ref), v27 (ref), v37 (ref), v96 (copy), l_getNewMessages_0 (ref), v23 (ref)
        local v197 = l_robloxEventReceiver_0:observeEvent("CommunicationChannels", function(v174, _) --[[ Line: 558 ]]
            -- upvalues: v47 (ref), v18 (ref), v122 (ref), v80 (ref), v24 (ref), v113 (ref), v72 (ref), l_FormFactor_0 (ref), v35 (ref), v4 (ref), v76 (ref), l_removedFromConversationToastTitle_0 (ref), v42 (ref), v25 (ref), v21 (ref), v75 (ref), v20 (ref), v27 (ref), v37 (ref), v96 (ref), l_getNewMessages_0 (ref), v23 (ref)
            if v174.ChannelVertical ~= "PlatformChat" then
                return;
            elseif not table.find(v47.ChannelTypeAllowlist, v174.ChannelType) then
                return;
            else
                v18:info("Received channels notification: {}", v174.Type);
                v122("CommunicationChannels", v174.SequenceNumber);
                local l_ChannelId_0 = v174.ChannelId;
                if v174.Type == "ChannelDeleted" or v174.Type == "RemovedFromChannel" or v174.Type == "ChannelArchived" then
                    v80(v24(l_ChannelId_0));
                    local l_activeConversationId_1 = v113.activeConversationId;
                    if l_activeConversationId_1 ~= nil and tostring(l_activeConversationId_1) == v174.ChannelId and v113.rnBypassActionSignal then
                        local v178 = if v72 == l_FormFactor_0.WIDE then v35.EmptyConversation else v35.ChatLanding;
                        v113.rnBypassActionSignal:fire(v4.Actions.navigate({
                            routeName = v178
                        }));
                    end;
                    if v174.Actor.Id ~= tostring(v76) then
                        v113.rnBypassActionSignal:fire(v4.Actions.navigate({
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
                elseif v174.Type == "ChannelUpdated" or v174.Type == "ParticipantsAdded" or v174.Type == "ParticipantsRemoved" then
                    task.spawn(function() --[[ Line: 611 ]]
                        -- upvalues: l_ChannelId_0 (copy), v80 (ref), v42 (ref), v174 (copy), v25 (ref), v21 (ref), v18 (ref)
                        v80(v42(l_ChannelId_0)):andThen(function(v179) --[[ Line: 613 ]]
                            -- upvalues: v174 (ref), l_ChannelId_0 (ref), v80 (ref), v25 (ref), v21 (ref)
                            local l_title_1 = v179.title;
                            local l_lastUpdated_1 = v179.lastUpdated;
                            if v174.Type == "ChannelUpdated" then
                                local l_l_ChannelId_0_0 = l_ChannelId_0;
                                local l_isDefaultTitle_1 = v179.isDefaultTitle;
                                v80(v25(l_l_ChannelId_0_0, l_title_1, l_isDefaultTitle_1, l_lastUpdated_1));
                                return;
                            else
                                local l_l_ChannelId_0_1 = l_ChannelId_0;
                                local l_participants_1 = v179.participants;
                                v80(v21(l_l_ChannelId_0_1, l_participants_1, l_title_1, l_lastUpdated_1));
                                return;
                            end;
                        end):catch(function(v186) --[[ Line: 629 ]]
                            -- upvalues: v18 (ref), v174 (ref)
                            v18:warning((("Failure in RobloxEventReceiver->%*, Status: %*"):format(v174.Type, (tostring(v186)))));
                        end);
                    end);
                    return;
                elseif v174.Type == "AddedToChannel" or v174.Type == "ChannelCreated" or v174.Type == "ChannelMarkedRead" or v174.Type == "ChannelMetadataUpdated" and l_ChannelId_0 ~= nil or v174.Type == "ChannelUnarchived" then
                    if v75 then
                        v18:debug("Received {} event while loading conversation data", v174.Type);
                        return;
                    else
                        task.spawn(function() --[[ Line: 647 ]]
                            -- upvalues: l_ChannelId_0 (copy), v80 (ref), v42 (ref), v174 (copy), v20 (ref), v27 (ref), v113 (ref), v4 (ref), v35 (ref), v18 (ref)
                            v80(v42(l_ChannelId_0)):andThen(function(v187) --[[ Line: 649 ]]
                                -- upvalues: v174 (ref), v20 (ref), v80 (ref), v27 (ref), v113 (ref), v4 (ref), v35 (ref)
                                if (v174.Type == "ChannelCreated" or v174.Type == "ChannelUnarchived") and v187.type == "one_to_one" then
                                    local v188 = v20.getFriendConversationId(v187.participants);
                                    if v188 then
                                        v80(v27({
                                            newConversationId = v187.id, 
                                            oldFriendConversationId = v188
                                        }));
                                        if v113.activeConversationId == v188 then
                                            v113.rnBypassActionSignal:fire(v4.Actions.navigate({
                                                routeName = v35.ChatConversation, 
                                                params = {
                                                    conversationId = v187.id
                                                }
                                            }));
                                        end;
                                    end;
                                end;
                            end):catch(function(v189) --[[ Line: 673 ]]
                                -- upvalues: v18 (ref), v174 (ref)
                                v18:warning("Failure in RobloxEventReceiver->{}, Status: {}", v174.Type, (tostring(v189)));
                            end);
                        end);
                        return;
                    end;
                elseif v174.Type == "MessageCreated" or v174.Type == "SystemMessageCreated" then
                    if v37 then
                        local v190 = v174.Actor.Id == tostring(v76);
                        if not v190 and v113.activeConversationId and tostring(v113.activeConversationId) == l_ChannelId_0 then
                            v96(l_ChannelId_0);
                        end;
                        local v191 = tick();
                        local _ = v80(l_getNewMessages_0(l_ChannelId_0, v190, v191));
                        return;
                    else
                        local v193 = v174.Actor.Id == tostring(v76);
                        local v194 = tick();
                        local _ = v80(l_getNewMessages_0(l_ChannelId_0, v193, v194));
                        return;
                    end;
                elseif v174.Type == "ParticipantTyping" and v174.IsTyping then
                    local l_Id_0 = v174.Actor.Id;
                    v80(v23(l_ChannelId_0, l_Id_0));
                end;
                return;
            end;
        end);
        return function() --[[ Line: 702 ]]
            -- upvalues: v197 (copy)
            if v197 and v197.disconnect then
                v197:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v76, l_robloxEventReceiver_0, v122, v105, v113.activeConversationId, v113.rnBypassActionSignal, l_removedFromConversationToastTitle_0, v88, v110, v85, v75, v94, v102, v169));
    local v199 = l_useMemo_0(function() --[[ Line: 726 ]]
        -- upvalues: v70 (copy), v6 (ref)
        if not v70 then
            return {};
        else
            return (v6.List.filterMap(v6.Dictionary.values(v70), function(v198) --[[ Line: 731 ]]
                if v198 and v198.id and v198.source ~= "friends" then
                    return v198.id;
                else
                    return nil;
                end;
            end));
        end;
    end, l_dependencyArray_0(v70));
    l_useEffect_0(function() --[[ Line: 741 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v18 (ref), l_getFFlagDebugUnfilteredThreads_0 (ref), v64 (ref), v6 (ref), v199 (copy), v80 (copy), v45 (ref), v113 (copy), v7 (ref), l_FFlagAppChatEnableDoubleOptIn_0 (ref), v46 (ref), v79 (copy)
        local v214 = l_robloxEventReceiver_0:observeEvent("ChatModerationTypeEligibility", function(v200, _) --[[ Line: 744 ]]
            -- upvalues: v18 (ref), l_getFFlagDebugUnfilteredThreads_0 (ref), v64 (ref), v6 (ref), v199 (ref), v80 (ref), v45 (ref), v113 (ref), v7 (ref), l_FFlagAppChatEnableDoubleOptIn_0 (ref), v46 (ref), v79 (ref)
            v18:debug("Received ChatModerationTypeEligibility notification");
            local l_channels_inspected_0 = v200.channels_inspected;
            if not l_channels_inspected_0 or #l_channels_inspected_0 == 0 then
                return;
            else
                if l_getFFlagDebugUnfilteredThreads_0() then
                    local v203 = "";
                    for _, v205 in l_channels_inspected_0 do
                        v203 = ("%*, %*"):format(v203, v205);
                    end;
                    v64((("RTN CONVERSATIONS INSPECTED%*"):format(v203)));
                end;
                local v207 = v6.List.filter(l_channels_inspected_0, function(v206) --[[ Line: 758 ]]
                    -- upvalues: v199 (ref)
                    return table.find(v199, v206);
                end);
                if #v207 == 0 then
                    v18:debug("No filtered existing conversation IDs found in ChatModerationTypeEligibility notification");
                    return;
                else
                    if l_getFFlagDebugUnfilteredThreads_0() then
                        local v208 = "";
                        for _, v210 in v207 do
                            v208 = ("%*, %*"):format(v208, v210);
                        end;
                        v64((("RTN FILTERED CONVERSATIONS%*"):format(v208)));
                    end;
                    v80(v45(v207)):catch(function(v211) --[[ Line: 774 ]]
                        -- upvalues: v18 (ref)
                        v18:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->MultiGetConversationDetails, Status: " .. tostring(v211));
                    end);
                    if not v113.activeConversationId then
                        return;
                    else
                        if table.find(l_channels_inspected_0, v113.activeConversationId) then
                            v80(v7.rodux.GetConversationsParticipantsMetadata.API({
                                v113.activeConversationId
                            })):catch(function(v212) --[[ Line: 788 ]]
                                -- upvalues: v18 (ref)
                                v18:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->GetConversationsParticipantsMetadata, Status: " .. tostring(v212));
                            end);
                            if l_FFlagAppChatEnableDoubleOptIn_0 then
                                v80(v46(v113.activeConversationId, v79));
                                return;
                            else
                                v80(v7.rodux.GetConversationTopModal.API(v113.activeConversationId, v79)):catch(function(v213) --[[ Line: 805 ]]
                                    -- upvalues: v18 (ref)
                                    v18:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->GetConversationTopModal, Status: " .. tostring(v213));
                                end);
                            end;
                        end;
                        return;
                    end;
                end;
            end;
        end);
        return function() --[[ Line: 817 ]]
            -- upvalues: v214 (copy)
            if v214 and v214.disconnect then
                v214:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v80, v113.activeConversationId, v199));
    l_useEffect_0(function() --[[ Line: 824 ]]
        -- upvalues: l_robloxEventReceiver_0 (copy), v18 (ref), v80 (copy), v7 (ref), v79 (copy)
        local v218 = l_robloxEventReceiver_0:observeEvent("EligibilityStatusChanged", function(_, _) --[[ Line: 827 ]]
            -- upvalues: v18 (ref), v80 (ref), v7 (ref), v79 (ref)
            v18:info("Received EligibilityStatusChanged notification");
            v80(v7.rodux.GetChatLandingModal.API(v79)):catch(function(v217) --[[ Line: 830 ]]
                -- upvalues: v18 (ref)
                v18:warning("Error in GetChatLandingModal request. Error: {}", (tostring(v217)));
            end);
        end);
        return function() --[[ Line: 836 ]]
            -- upvalues: v218 (copy)
            if v218 and v218.disconnect then
                v218:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v80));
    local v219 = v33(v113.activeConversationId) or "";
    if l_FFlagEnableAEGIS1AppChatBanner_0 then
        v3.useEffect(function() --[[ Line: 845 ]]
            -- upvalues: v79 (copy), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (ref), v80 (copy), v29 (ref), v8 (ref), l_FFlagEnableAEGIS1AppChatBanner_0 (ref), l_FFlagEnableAEGIS2AppChatBanner_0 (ref), v7 (ref), v18 (ref), l_FFlagEnableAEGIS2AppChatConversationBanner_0 (ref), v145 (copy), v219 (copy), v53 (ref), v40 (ref)
            if v79 and not l_FFlagEnableAEGIS2CommsFAEUpsell_0 then
                return;
            else
                local function _(v220) --[[ Line: 850 ]]
                    -- upvalues: v80 (ref), v29 (ref)
                    v80(v29(v220));
                end;
                local v226 = v8.Signals.GetAgeVerifiedChangedSignal():connect(function() --[[ Line: 854 ]]
                    -- upvalues: l_FFlagEnableAEGIS1AppChatBanner_0 (ref), l_FFlagEnableAEGIS2AppChatBanner_0 (ref), v80 (ref), v7 (ref), v79 (ref), v18 (ref), l_FFlagEnableAEGIS2AppChatConversationBanner_0 (ref), v29 (ref), v145 (ref), v219 (ref), v53 (ref), v40 (ref)
                    if l_FFlagEnableAEGIS1AppChatBanner_0 or l_FFlagEnableAEGIS2AppChatBanner_0 then
                        v80(v7.rodux.GetChatLandingModal.API(v79)):catch(function(v222) --[[ Line: 856 ]]
                            -- upvalues: v18 (ref)
                            v18:warning("Error in GetChatLandingModal request. Error: {}", (tostring(v222)));
                        end);
                    end;
                    if l_FFlagEnableAEGIS2AppChatConversationBanner_0 then
                        local l_ConversationBottomModal_0 = v7.Constants.ModalSequence.ConversationBottomModal;
                        v80(v29(l_ConversationBottomModal_0));
                        if v145 then
                            v80(v7.rodux.GetModalSequence.API({
                                modalSequence = v7.Constants.ModalSequence.ConversationBottomModal, 
                                isInExperience = v79, 
                                conversationId = if v145.source == "channels" then v145.id else nil, 
                                friendId = if v145.source == "friends" then v219 else nil
                            })):catch(function(v224) --[[ Line: 875 ]]
                                -- upvalues: v18 (ref)
                                v18:warning((("Error in GetModalSequence -> conversationBottomModal request after age verification status changes. Error: %*"):format((tostring(v224)))));
                            end);
                        end;
                    end;
                    if v53 then
                        v18:debug("AgeVerifiedChangedSignal Received, fetching chat metadata");
                        v80(v40()):catch(function(v225) --[[ Line: 887 ]]
                            -- upvalues: v18 (ref)
                            v18:warning("Error in fetchChatMetadata request after age verification status changes. Error: {}", (tostring(v225)));
                        end);
                    end;
                end);
                return function() --[[ Line: 896 ]]
                    -- upvalues: v226 (copy)
                    if v226 and v226.disconnect then
                        v226:disconnect();
                    end;
                end;
            end;
        end, {
            v80, 
            v79, 
            v145, 
            v219
        });
    end;
    if l_FFlagAppChatEnableDoubleOptIn_0 or v58 then
        v50({
            activeConversationId = v113.activeConversationId
        });
    end;
    return {};
end;
return ChatEventReceiver;