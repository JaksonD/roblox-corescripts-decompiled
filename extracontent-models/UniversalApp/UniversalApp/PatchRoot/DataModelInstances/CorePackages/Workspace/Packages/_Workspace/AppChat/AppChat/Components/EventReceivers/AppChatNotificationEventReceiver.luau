local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RealtimeDelivery);
local v4 = require(l_Parent_0.AppChatNetworking);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v8 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v9 = require(script.Parent.useRealtimePlatformChat);
local v10 = require(l_script_FirstAncestor_0.Contexts.UnreadMessages.useUnreadMessagesDispatch);
local v11 = require(l_script_FirstAncestor_0.Hooks.useChatIsVisible);
local v12 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
return v2.memo(function() --[[ Line: 17 ]] --[[ Name: AppChatNotificationEventReceiver ]]
    -- upvalues: v8 (copy), v10 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), v11 (copy), v2 (copy), v12 (copy), v4 (copy), v7 (copy), v9 (copy), v3 (copy)
    local v13 = v8();
    local v14 = v10();
    local v15 = l_useDispatch_0();
    local v17 = l_useSelector_0(function(v16) --[[ Line: 22 ]]
        return v16.ChatAppReducer.unreadMessageCount;
    end);
    local v18 = v11();
    v2.useEffect(function() --[[ Line: 28 ]]
        -- upvalues: v12 (ref), v15 (copy), v4 (ref), v13 (copy), v7 (ref)
        v12:debug("Fetching conversation metadata to get unread count");
        v15(v4.rodux.GetConversationMetadata.API()):andThen(function(v19) --[[ Line: 32 ]]
            -- upvalues: v12 (ref), v13 (ref), v7 (ref)
            local l_global_unread_message_count_0 = v19.responseBody.global_unread_message_count;
            v12:info("Initial unread message count: {}", l_global_unread_message_count_0);
            v13.fireAnalyticsEvent(v7.preloadSocialTabDataEvent, {
                unreadConversationCount = l_global_unread_message_count_0
            });
        end):catch(function(v21) --[[ Line: 40 ]]
            -- upvalues: v12 (ref), v13 (ref), v7 (ref)
            v12:error("Failure in GetConversationMetadata. Error: {}", (tostring(v21)));
            v13.fireAnalyticsEvent(v7.preloadSocialTabDataFailedEvent, {});
        end);
    end, {
        v15, 
        v13
    });
    v2.useEffect(function() --[[ Line: 46 ]]
        -- upvalues: v12 (ref), v17 (copy), v14 (copy)
        v12:info("Dispatching unread messsage count as {}", v17);
        v14(v17);
    end, {
        v14, 
        v17
    });
    v9(function(v22) --[[ Line: 51 ]]
        -- upvalues: v12 (ref), v18 (copy), v15 (copy), v4 (ref)
        local v23 = true;
        if v22.Type ~= "ChannelMetadataUpdated" then
            v23 = v22.Type == "ChannelMarkedRead";
        end;
        if v23 then
            v12:info("Received event {}, fetching conversation metadata to get unread count", v22.Type);
            if v18 then
                v12:info("Chat tab is visible during realtime event, calling clear endpoint");
                v15(v4.rodux.ClearGlobalUnreadCount.API()):catch(function(v24) --[[ Line: 59 ]]
                    -- upvalues: v12 (ref)
                    v12:error("Failure in ClearGlobalUnreadCount. Error: {}", (tostring(v24)));
                end);
                return;
            else
                v15(v4.rodux.GetConversationMetadata.API()):catch(function(v25) --[[ Line: 63 ]]
                    -- upvalues: v12 (ref)
                    v12:error("Failure in GetConversationMetadata. Error: {}", (tostring(v25)));
                end);
            end;
        end;
    end, {
        v15, 
        v18
    });
    v3.useRealtimeConnectionStateChanged("CommunicationChannels", function(v26, v27) --[[ Line: 73 ]]
        -- upvalues: v12 (ref), v18 (copy), v15 (copy), v4 (ref)
        if v26 == Enum.ConnectionState.Connected and v27 then
            v12:info("Connection re-established, fetching conversation metadata to get unread count");
            if v18 then
                v12:info("Chat tab is visible during connection recovery, calling clear endpoint");
                v15(v4.rodux.ClearGlobalUnreadCount.API()):catch(function(v28) --[[ Line: 79 ]]
                    -- upvalues: v12 (ref)
                    v12:error("Failure in ClearGlobalUnreadCount. Error: {}", (tostring(v28)));
                end);
                return;
            else
                v15(v4.rodux.GetConversationMetadata.API()):catch(function(v29) --[[ Line: 83 ]]
                    -- upvalues: v12 (ref)
                    v12:error("Failure in GetConversationMetadata. Error: {}", (tostring(v29)));
                end);
            end;
        end;
    end, {
        v15, 
        v18
    });
    return nil;
end);