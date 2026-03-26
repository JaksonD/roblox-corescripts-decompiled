local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.VirtualEvents);
local l_EventsListCarousel_0 = v2.EventsListCarousel;
local v4 = require(l_script_FirstAncestor_0.Common.Enums);
local v5 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v6 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.Signals);
local v8 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v9 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v10 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local l_LaunchGame_0 = require(l_script_FirstAncestor_0.Parent.GameLaunch).LaunchGame;
local l_useNavigation_0 = require(l_script_FirstAncestor_0.Parent.Navigation).useNavigation;
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppGame_0 = require(l_Parent_0.RoactServiceTags).AppGame;
local v16 = require(l_Parent_0.React);
local l_HorizontalPageMargin_0 = require(l_Parent_0.UIBlox).App.Container.HorizontalPageMargin;
local v18 = require(l_script_FirstAncestor_0.Stores.createGroupEventsStore);
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_FFlagLuaAppSduiEventDetailsEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiEventDetailsEnabled;
local l_navigateToEventDetails_0 = require(l_Parent_0.VirtualEvents).navigateToEventDetails;
local l_useApolloClient_0 = require(l_Parent_0.ApolloClient).useApolloClient;
local v24 = require(l_Parent_0.RoactNavigation);
local v25 = require(l_script_FirstAncestor_0.Components.Events.EventsSkeleton);
local v26 = require(l_script_FirstAncestor_0.Flags.FFlagEnableCommunityProfileLoadingSkeletons);
return function(v27) --[[ Line: 63 ]] --[[ Name: EventsContainer ]]
    -- upvalues: v9 (copy), v4 (copy), v8 (copy), l_useRoactService_0 (copy), l_AppGame_0 (copy), l_useNavigation_0 (copy), l_useApolloClient_0 (copy), v10 (copy), v16 (copy), v18 (copy), l_useSignalState_0 (copy), v5 (copy), v2 (copy), v6 (copy), l_FFlagLuaAppSduiEventDetailsEnabled_0 (copy), l_navigateToEventDetails_0 (copy), l_AppPage_0 (copy), l_LaunchGame_0 (copy), v26 (copy), l_HorizontalPageMargin_0 (copy), v24 (copy), v25 (copy), l_EventsListCarousel_0 (copy)
    local v28 = v9(v4.Components.Events);
    local v29 = tonumber(v8().profileId);
    local v30 = l_useRoactService_0(l_AppGame_0);
    local v31 = l_useNavigation_0();
    local v32 = l_useApolloClient_0();
    local v33 = v10();
    local v34 = v16.useMemo(function() --[[ Line: 73 ]]
        -- upvalues: v18 (ref), v29 (copy)
        return v18(v29);
    end, {
        v29
    });
    local v35 = l_useSignalState_0(v34.getEvents);
    local v45 = v16.useMemo(function() --[[ Line: 80 ]]
        -- upvalues: v35 (copy), v28 (copy)
        local v36 = {};
        if v35 == nil then
            return v36;
        else
            local v37 = {};
            for _, v39 in ipairs(v35) do
                v37[v39.id] = v39;
            end;
            local l_ipairs_0 = ipairs;
            local v41 = if v28 then v28.events else {};
            for _, v43 in l_ipairs_0(v41) do
                local v44 = v37[v43.id];
                if v44 ~= nil then
                    table.insert(v36, v44);
                end;
            end;
            return v36;
        end;
    end, {
        v35, 
        v28
    });
    local v46 = if #v45 > 0 then tonumber(v45[1].universeId) or 0 else 0;
    local v56 = v16.useCallback(function(v47, v48) --[[ Line: 110 ]]
        -- upvalues: v33 (copy), v5 (ref), v2 (ref), v34 (copy), v32 (copy), v6 (ref)
        v33.fireAnalyticsEvent(v5.EventRSVP, {
            virtualEventId = v47.id, 
            status = v48
        });
        v2.fireVirtualEventRSVP({
            virtualEventId = v47.id, 
            universeId = tostring(v47.universeId), 
            channel = "communityPeekView", 
            status = v48
        });
        v34.updateRsvpStatus(v47, v48);
        v32.cache:modify({
            id = "VirtualEvent:" .. v47.id, 
            fields = {
                userRsvpStatus = function(_, _, _) --[[ Line: 126 ]] --[[ Name: userRsvpStatus ]]
                    -- upvalues: v48 (copy)
                    return v48;
                end, 
                rsvpCounters = function(_, v53, _) --[[ Line: 129 ]] --[[ Name: rsvpCounters ]]
                    -- upvalues: v48 (copy), v6 (ref)
                    local v55 = v48 == "going" and 1 or -1;
                    return v6.Dictionary.join(v53, {
                        going = v53.going + v55
                    });
                end
            }
        });
    end, {
        v34
    });
    local v58 = v16.useCallback(function(v57) --[[ Line: 141 ]]
        -- upvalues: v33 (copy), v5 (ref), l_FFlagLuaAppSduiEventDetailsEnabled_0 (ref), l_navigateToEventDetails_0 (ref), v31 (copy), l_AppPage_0 (ref)
        v33.fireAnalyticsEvent(v5.EventOpened, {
            virtualEventId = v57.id
        });
        if l_FFlagLuaAppSduiEventDetailsEnabled_0 then
            l_navigateToEventDetails_0(v31, v57.id);
            return;
        else
            v31.navigate(l_AppPage_0.EventDetails, {
                extraProps = {
                    currentTime = DateTime.now(), 
                    virtualEventId = v57.id
                }
            });
            return;
        end;
    end, {
        v31
    });
    local v60 = v16.useCallback(function(v59) --[[ Line: 157 ]]
        -- upvalues: v33 (copy), v5 (ref), v2 (ref), l_LaunchGame_0 (ref), v30 (copy)
        v33.fireAnalyticsEvent(v5.EventJoined, {
            virtualEventId = v59.id
        });
        v2.fireVirtualEventJoined({
            virtualEventId = v59.id, 
            universeId = tostring(v59.universeId), 
            channel = "communityPeekView"
        });
        l_LaunchGame_0(v59.placeId, nil, {
            eventId = v59.id
        }, v30);
    end, {});
    local v62 = v16.useCallback(function(v61) --[[ Line: 169 ]]
        -- upvalues: v2 (ref)
        v2.fireVirtualEventImpression({
            virtualEventId = v61.id, 
            universeId = v61.universeId, 
            channel = "communityPeekView"
        });
    end, {});
    local v63 = if v26 then l_useSignalState_0(v34.isLoading) else false;
    return v16.createElement(l_HorizontalPageMargin_0, {
        size = UDim2.new(1, 0, 0, 0), 
        backgroundTransparency = 1, 
        layoutOrder = v27.layoutOrder, 
        useAutomaticSizing = true
    }, {
        NavEvents = v16.createElement(v24.NavigationEvents, {
            onDidFocus = function() --[[ Line: 188 ]] --[[ Name: onDidFocus ]]
                -- upvalues: v34 (copy)
                v34.refetch();
            end
        }), 
        EventsCarousel = if v26 and v63 then v16.createElement(v25, {
            numSkeletons = #v28.events
        }) else v16.createElement(l_EventsListCarousel_0, {
            virtualEvents = v45, 
            onTileActivated = v58, 
            onRsvpChanged = v56, 
            onJoinEvent = v60, 
            onEventImpression = v62, 
            peekViewFormat = true, 
            referralSource = "communityPeekView", 
            universeId = v46
        })
    });
end;