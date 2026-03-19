local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v2 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local v3 = require(l_CorePackages_0.Packages.ApolloClient);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_CorePackages_0.Workspace.Packages.GraphQLServer);
local v6 = require(script.Parent.LaunchGameOnMount);
local v7 = require(l_CorePackages_0.Packages.React);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v9 = require(l_CorePackages_0.Workspace.Packages.VirtualEvents);
local l_EventsListCarousel_0 = v9.EventsListCarousel;
local l_useQuery_0 = v3.useQuery;
local l_useMutation_0 = v3.useMutation;
local l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableVirtualEventPlaceId;
local v14 = {
    pollInterval = 300000
};
return function(v15) --[[ Line: 44 ]] --[[ Name: EventsListWrapper ]]
    -- upvalues: v4 (copy), v14 (copy), l_useNavigation_0 (copy), v7 (copy), l_useQuery_0 (copy), v9 (copy), l_useMutation_0 (copy), v2 (copy), v6 (copy), l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 (copy), l_EventsListCarousel_0 (copy)
    local v16 = v4.Dictionary.join(v14, v15);
    local v17 = l_useNavigation_0();
    local v18, v19 = v7.useState(nil);
    local v20 = v7.useMemo(function() --[[ Line: 50 ]]
        return DateTime.now();
    end, {});
    local v21 = l_useQuery_0(v9.requests.GET_EVENTS_FOR_EXPERIENCE, {
        variables = {
            universeId = v16.universeId, 
            options = {
                fromUtc = v20:ToIsoDate()
            }
        }, 
        pollInterval = v16.pollInterval
    });
    local v29 = l_useMutation_0(v9.requests.UPDATE_RSVP_STATUS, {
        update = function(_, v23, v24) --[[ Line: 65 ]] --[[ Name: update ]]
            -- upvalues: v4 (ref)
            local l_virtualEvent_0 = v24.data.virtualEventRsvp.virtualEvent;
            v23:modify({
                id = v23:identify(l_virtualEvent_0), 
                fields = {
                    rsvpCounters = function(_, v27) --[[ Line: 71 ]] --[[ Name: rsvpCounters ]]
                        -- upvalues: l_virtualEvent_0 (copy), v4 (ref)
                        local v28 = l_virtualEvent_0.userRsvpStatus == "going" and 1 or -1;
                        return v4.Dictionary.join(v27, {
                            going = v27.going + v28
                        });
                    end
                }
            });
        end
    });
    local v33 = v7.useCallback(function(v30, v31) --[[ Line: 83 ]]
        -- upvalues: v9 (ref), v16 (copy), v29 (copy), v17 (copy), v2 (ref)
        v9.fireVirtualEventRSVP({
            virtualEventId = v30.id, 
            universeId = tostring(v30.universeId), 
            channel = v16.referralSource, 
            status = v31, 
            attendanceCount = if v30 and v30.experienceDetails then v30.experienceDetails.playing else 0
        });
        v29[1]({
            variables = {
                virtualEventId = v30.id, 
                rsvpStatus = v31
            }
        }):andThen(function(v32) --[[ Line: 101 ]]
            -- upvalues: v17 (ref), v2 (ref), v30 (copy), v16 (ref)
            if v32.data.virtualEventRsvp.shouldSeeNotificationsUpsellModal then
                v17.navigate(v2.EventNotificationsModal, {
                    extraProps = {
                        virtualEvent = v30, 
                        channel = v16.referralSource
                    }
                });
            end;
        end);
    end, {
        v16.referralSource
    });
    local v35 = v7.useCallback(function(v34) --[[ Line: 115 ]]
        -- upvalues: v17 (copy), v2 (ref), v16 (copy)
        v17.navigate(v2.EventDetails, {
            extraProps = {
                currentTime = DateTime.now(), 
                virtualEventId = v34.id, 
                referralSource = v16.referralSource
            }
        });
    end, {
        v17
    });
    local v37 = v7.useCallback(function(v36) --[[ Line: 125 ]]
        -- upvalues: v9 (ref), v16 (copy)
        v9.fireVirtualEventImpression({
            virtualEventId = v36.id, 
            universeId = v36.universeId, 
            channel = v16.referralSource
        });
    end, {
        v16.referralSource
    });
    local v39 = v7.useCallback(function(v38) --[[ Line: 133 ]]
        -- upvalues: v19 (copy)
        v19(v38);
    end, {});
    local v40 = v7.useCallback(function() --[[ Line: 137 ]]
        -- upvalues: v9 (ref), v18 (copy), v16 (copy)
        v9.fireVirtualEventJoined({
            virtualEventId = v18.id, 
            universeId = tostring(v18.universeId), 
            channel = v16.referralSource, 
            attendanceCount = if v18 and v18.experienceDetails then v18.experienceDetails.playing else 0
        });
    end, {
        v18
    });
    if v21.data then
        return (v7.createElement(v7.Fragment, nil, {
            GameLauncher = if v18 then v7.createElement(v6, {
                universeId = tostring(v18.universeId), 
                placeId = if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() and v18.placeId then tostring(v18.placeId) else nil, 
                launchSource = v16.referralSource, 
                referralSource = v16.referralSource, 
                onGameLaunching = v40, 
                experienceJoinData = {
                    eventId = v18.id
                }
            }) else nil, 
            EventsCarousel = v7.createElement(l_EventsListCarousel_0, {
                layoutOrder = v16.layoutOrder, 
                virtualEvents = v21.data.virtualEventsByUniverseId.virtualEvents, 
                onTileActivated = v35, 
                onRsvpChanged = v33, 
                onJoinEvent = v39, 
                onEventImpression = v37, 
                defaultThumbnail = v16.defaultThumbnail, 
                peekViewFormat = v16.peekViewFormat, 
                referralSource = v16.referralSource, 
                universeId = v16.universeId
            })
        }));
    else
        return nil;
    end;
end;