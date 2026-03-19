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
local l_useApolloClient_0 = require(l_Parent_0.ApolloClient).useApolloClient;
local v22 = require(l_Parent_0.RoactNavigation);
local v23 = require(l_script_FirstAncestor_0.Components.Events.EventsSkeleton);
local v24 = require(l_script_FirstAncestor_0.Flags.FFlagEnableCommunityProfileLoadingSkeletons);
return function(v25) --[[ Line: 59 ]] --[[ Name: EventsContainer ]]
    -- upvalues: v9 (copy), v4 (copy), v8 (copy), l_useRoactService_0 (copy), l_AppGame_0 (copy), l_useNavigation_0 (copy), l_useApolloClient_0 (copy), v10 (copy), v16 (copy), v18 (copy), l_useSignalState_0 (copy), v5 (copy), v2 (copy), v6 (copy), l_AppPage_0 (copy), l_LaunchGame_0 (copy), v24 (copy), l_HorizontalPageMargin_0 (copy), v22 (copy), v23 (copy), l_EventsListCarousel_0 (copy)
    local v26 = v9(v4.Components.Events);
    local v27 = tonumber(v8().profileId);
    local v28 = l_useRoactService_0(l_AppGame_0);
    local v29 = l_useNavigation_0();
    local v30 = l_useApolloClient_0();
    local v31 = v10();
    local v32 = v16.useMemo(function() --[[ Line: 69 ]]
        -- upvalues: v18 (ref), v27 (copy)
        return v18(v27);
    end, {
        v27
    });
    local v33 = l_useSignalState_0(v32.getEvents);
    local v43 = v16.useMemo(function() --[[ Line: 76 ]]
        -- upvalues: v33 (copy), v26 (copy)
        local v34 = {};
        if v33 == nil then
            return v34;
        else
            local v35 = {};
            for _, v37 in ipairs(v33) do
                v35[v37.id] = v37;
            end;
            local l_ipairs_0 = ipairs;
            local v39 = if v26 then v26.events else {};
            for _, v41 in l_ipairs_0(v39) do
                local v42 = v35[v41.id];
                if v42 ~= nil then
                    table.insert(v34, v42);
                end;
            end;
            return v34;
        end;
    end, {
        v33, 
        v26
    });
    local v44 = if #v43 > 0 then tonumber(v43[1].universeId) or 0 else 0;
    local v54 = v16.useCallback(function(v45, v46) --[[ Line: 106 ]]
        -- upvalues: v31 (copy), v5 (ref), v2 (ref), v32 (copy), v30 (copy), v6 (ref)
        v31.fireAnalyticsEvent(v5.EventRSVP, {
            virtualEventId = v45.id, 
            status = v46
        });
        v2.fireVirtualEventRSVP({
            virtualEventId = v45.id, 
            universeId = tostring(v45.universeId), 
            channel = "communityPeekView", 
            status = v46
        });
        v32.updateRsvpStatus(v45, v46);
        v30.cache:modify({
            id = "VirtualEvent:" .. v45.id, 
            fields = {
                userRsvpStatus = function(_, _, _) --[[ Line: 122 ]] --[[ Name: userRsvpStatus ]]
                    -- upvalues: v46 (copy)
                    return v46;
                end, 
                rsvpCounters = function(_, v51, _) --[[ Line: 125 ]] --[[ Name: rsvpCounters ]]
                    -- upvalues: v46 (copy), v6 (ref)
                    local v53 = v46 == "going" and 1 or -1;
                    return v6.Dictionary.join(v51, {
                        going = v51.going + v53
                    });
                end
            }
        });
    end, {
        v32
    });
    local v56 = v16.useCallback(function(v55) --[[ Line: 137 ]]
        -- upvalues: v31 (copy), v5 (ref), v29 (copy), l_AppPage_0 (ref)
        v31.fireAnalyticsEvent(v5.EventOpened, {
            virtualEventId = v55.id
        });
        v29.navigate(l_AppPage_0.EventDetails, {
            extraProps = {
                currentTime = DateTime.now(), 
                virtualEventId = v55.id
            }
        });
    end, {
        v29
    });
    local v58 = v16.useCallback(function(v57) --[[ Line: 149 ]]
        -- upvalues: v31 (copy), v5 (ref), v2 (ref), l_LaunchGame_0 (ref), v28 (copy)
        v31.fireAnalyticsEvent(v5.EventJoined, {
            virtualEventId = v57.id
        });
        v2.fireVirtualEventJoined({
            virtualEventId = v57.id, 
            universeId = tostring(v57.universeId), 
            channel = "communityPeekView"
        });
        l_LaunchGame_0(v57.placeId, nil, {
            eventId = v57.id
        }, v28);
    end, {});
    local v60 = v16.useCallback(function(v59) --[[ Line: 161 ]]
        -- upvalues: v2 (ref)
        v2.fireVirtualEventImpression({
            virtualEventId = v59.id, 
            universeId = v59.universeId, 
            channel = "communityPeekView"
        });
    end, {});
    local v61 = if v24 then l_useSignalState_0(v32.isLoading) else false;
    return v16.createElement(l_HorizontalPageMargin_0, {
        size = UDim2.new(1, 0, 0, 0), 
        backgroundTransparency = 1, 
        layoutOrder = v25.layoutOrder, 
        useAutomaticSizing = true
    }, {
        NavEvents = v16.createElement(v22.NavigationEvents, {
            onDidFocus = function() --[[ Line: 180 ]] --[[ Name: onDidFocus ]]
                -- upvalues: v32 (copy)
                v32.refetch();
            end
        }), 
        EventsCarousel = if v24 and v61 then v16.createElement(v23, {
            numSkeletons = #v26.events
        }) else v16.createElement(l_EventsListCarousel_0, {
            virtualEvents = v43, 
            onTileActivated = v56, 
            onRsvpChanged = v54, 
            onJoinEvent = v58, 
            onEventImpression = v60, 
            peekViewFormat = true, 
            referralSource = "communityPeekView", 
            universeId = v44
        })
    });
end;