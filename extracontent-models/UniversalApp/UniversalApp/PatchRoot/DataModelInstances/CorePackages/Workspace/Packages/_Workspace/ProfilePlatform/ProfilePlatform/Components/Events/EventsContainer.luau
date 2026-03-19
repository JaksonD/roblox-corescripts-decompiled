local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.VirtualEvents);
local l_EventsListCarousel_0 = v2.EventsListCarousel;
local v4 = require(l_script_FirstAncestor_0.Common.Enums);
local v5 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v8 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v9 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local l_LaunchGame_0 = require(l_script_FirstAncestor_0.Parent.GameLaunch).LaunchGame;
local l_useNavigation_0 = require(l_script_FirstAncestor_0.Parent.Navigation).useNavigation;
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppGame_0 = require(l_Parent_0.RoactServiceTags).AppGame;
local v15 = require(l_Parent_0.React);
local l_HorizontalPageMargin_0 = require(l_Parent_0.UIBlox).App.Container.HorizontalPageMargin;
local v17 = require(l_script_FirstAncestor_0.Stores.createGroupEventsStore);
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_useApolloClient_0 = require(l_Parent_0.ApolloClient).useApolloClient;
local v21 = require(l_Parent_0.RoactNavigation);
return function(v22) --[[ Line: 54 ]] --[[ Name: EventsContainer ]]
    -- upvalues: v8 (copy), v4 (copy), v7 (copy), l_useRoactService_0 (copy), l_AppGame_0 (copy), l_useNavigation_0 (copy), l_useApolloClient_0 (copy), v9 (copy), v15 (copy), v17 (copy), l_useSignalState_0 (copy), v5 (copy), v2 (copy), v6 (copy), l_AppPage_0 (copy), l_LaunchGame_0 (copy), l_HorizontalPageMargin_0 (copy), v21 (copy), l_EventsListCarousel_0 (copy)
    local v23 = v8(v4.Components.Events);
    local v24 = tonumber(v7().profileId);
    local v25 = l_useRoactService_0(l_AppGame_0);
    local v26 = l_useNavigation_0();
    local v27 = l_useApolloClient_0();
    local v28 = v9();
    local v29 = v15.useMemo(function() --[[ Line: 64 ]]
        -- upvalues: v17 (ref), v24 (copy)
        return v17(v24);
    end, {
        v24
    });
    local v30 = l_useSignalState_0(v29.getEvents);
    local v40 = v15.useMemo(function() --[[ Line: 71 ]]
        -- upvalues: v30 (copy), v23 (copy)
        local v31 = {};
        if v30 == nil then
            return v31;
        else
            local v32 = {};
            for _, v34 in ipairs(v30) do
                v32[v34.id] = v34;
            end;
            local l_ipairs_0 = ipairs;
            local v36 = if v23 then v23.events else {};
            for _, v38 in l_ipairs_0(v36) do
                local v39 = v32[v38.id];
                if v39 ~= nil then
                    table.insert(v31, v39);
                end;
            end;
            return v31;
        end;
    end, {
        v30, 
        v23
    });
    local v41 = if #v40 > 0 then tonumber(v40[1].universeId) or 0 else 0;
    local v51 = v15.useCallback(function(v42, v43) --[[ Line: 101 ]]
        -- upvalues: v28 (copy), v5 (ref), v2 (ref), v29 (copy), v27 (copy), v6 (ref)
        v28.fireAnalyticsEvent(v5.EventRSVP, {
            virtualEventId = v42.id, 
            status = v43
        });
        v2.fireVirtualEventRSVP({
            virtualEventId = v42.id, 
            universeId = tostring(v42.universeId), 
            channel = "communityPeekView", 
            status = v43
        });
        v29.updateRsvpStatus(v42, v43);
        v27.cache:modify({
            id = "VirtualEvent:" .. v42.id, 
            fields = {
                userRsvpStatus = function(_, _, _) --[[ Line: 117 ]] --[[ Name: userRsvpStatus ]]
                    -- upvalues: v43 (copy)
                    return v43;
                end, 
                rsvpCounters = function(_, v48, _) --[[ Line: 120 ]] --[[ Name: rsvpCounters ]]
                    -- upvalues: v43 (copy), v6 (ref)
                    local v50 = v43 == "going" and 1 or -1;
                    return v6.Dictionary.join(v48, {
                        going = v48.going + v50
                    });
                end
            }
        });
    end, {
        v29
    });
    local v53 = v15.useCallback(function(v52) --[[ Line: 132 ]]
        -- upvalues: v28 (copy), v5 (ref), v26 (copy), l_AppPage_0 (ref)
        v28.fireAnalyticsEvent(v5.EventOpened, {
            virtualEventId = v52.id
        });
        v26.navigate(l_AppPage_0.EventDetails, {
            extraProps = {
                currentTime = DateTime.now(), 
                virtualEventId = v52.id
            }
        });
    end, {
        v26
    });
    local v55 = v15.useCallback(function(v54) --[[ Line: 144 ]]
        -- upvalues: v28 (copy), v5 (ref), v2 (ref), l_LaunchGame_0 (ref), v25 (copy)
        v28.fireAnalyticsEvent(v5.EventJoined, {
            virtualEventId = v54.id
        });
        v2.fireVirtualEventJoined({
            virtualEventId = v54.id, 
            universeId = tostring(v54.universeId), 
            channel = "communityPeekView"
        });
        l_LaunchGame_0(v54.placeId, nil, {
            eventId = v54.id
        }, v25);
    end, {});
    local v57 = v15.useCallback(function(v56) --[[ Line: 156 ]]
        -- upvalues: v2 (ref)
        v2.fireVirtualEventImpression({
            virtualEventId = v56.id, 
            universeId = v56.universeId, 
            channel = "communityPeekView"
        });
    end, {});
    return v15.createElement(l_HorizontalPageMargin_0, {
        size = UDim2.new(1, 0, 0, 0), 
        backgroundTransparency = 1, 
        layoutOrder = v22.layoutOrder, 
        useAutomaticSizing = true
    }, {
        NavEvents = v15.createElement(v21.NavigationEvents, {
            onDidFocus = function() --[[ Line: 171 ]] --[[ Name: onDidFocus ]]
                -- upvalues: v29 (copy)
                v29.refetch();
            end
        }), 
        EventsCarousel = v15.createElement(l_EventsListCarousel_0, {
            virtualEvents = v40, 
            onTileActivated = v53, 
            onRsvpChanged = v51, 
            onJoinEvent = v55, 
            onEventImpression = v57, 
            peekViewFormat = true, 
            referralSource = "communityPeekView", 
            universeId = v41
        })
    });
end;