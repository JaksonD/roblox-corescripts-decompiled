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
local v13 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 = v13.GetFFlagLuaAppEnableVirtualEventPlaceId;
local l_FFlagLuaAppSduiEventDetailsEnabled_0 = v13.FFlagLuaAppSduiEventDetailsEnabled;
local v16 = {
    pollInterval = 300000
};
return function(v17) --[[ Line: 45 ]] --[[ Name: EventsListWrapper ]]
    -- upvalues: v4 (copy), v16 (copy), l_useNavigation_0 (copy), v7 (copy), l_useQuery_0 (copy), v9 (copy), l_useMutation_0 (copy), v2 (copy), l_FFlagLuaAppSduiEventDetailsEnabled_0 (copy), l_CorePackages_0 (copy), v6 (copy), l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 (copy), l_EventsListCarousel_0 (copy)
    local v18 = v4.Dictionary.join(v16, v17);
    local v19 = l_useNavigation_0();
    local v20, v21 = v7.useState(nil);
    local v22 = v7.useMemo(function() --[[ Line: 51 ]]
        return DateTime.now();
    end, {});
    local v23 = l_useQuery_0(v9.requests.GET_EVENTS_FOR_EXPERIENCE, {
        variables = {
            universeId = v18.universeId, 
            options = {
                fromUtc = v22:ToIsoDate()
            }
        }, 
        pollInterval = v18.pollInterval
    });
    local v31 = l_useMutation_0(v9.requests.UPDATE_RSVP_STATUS, {
        update = function(_, v25, v26) --[[ Line: 66 ]] --[[ Name: update ]]
            -- upvalues: v4 (ref)
            local l_virtualEvent_0 = v26.data.virtualEventRsvp.virtualEvent;
            v25:modify({
                id = v25:identify(l_virtualEvent_0), 
                fields = {
                    rsvpCounters = function(_, v29) --[[ Line: 72 ]] --[[ Name: rsvpCounters ]]
                        -- upvalues: l_virtualEvent_0 (copy), v4 (ref)
                        local v30 = l_virtualEvent_0.userRsvpStatus == "going" and 1 or -1;
                        return v4.Dictionary.join(v29, {
                            going = v29.going + v30
                        });
                    end
                }
            });
        end
    });
    local v35 = v7.useCallback(function(v32, v33) --[[ Line: 84 ]]
        -- upvalues: v9 (ref), v18 (copy), v31 (copy), v19 (copy), v2 (ref)
        v9.fireVirtualEventRSVP({
            virtualEventId = v32.id, 
            universeId = tostring(v32.universeId), 
            channel = v18.referralSource, 
            status = v33, 
            attendanceCount = if v32 and v32.experienceDetails then v32.experienceDetails.playing else 0
        });
        v31[1]({
            variables = {
                virtualEventId = v32.id, 
                rsvpStatus = v33
            }
        }):andThen(function(v34) --[[ Line: 102 ]]
            -- upvalues: v19 (ref), v2 (ref), v32 (copy), v18 (ref)
            if v34.data.virtualEventRsvp.shouldSeeNotificationsUpsellModal then
                v19.navigate(v2.EventNotificationsModal, {
                    extraProps = {
                        virtualEvent = v32, 
                        channel = v18.referralSource
                    }
                });
            end;
        end);
    end, {
        v18.referralSource
    });
    local v37 = v7.useCallback(function(v36) --[[ Line: 116 ]]
        -- upvalues: l_FFlagLuaAppSduiEventDetailsEnabled_0 (ref), l_CorePackages_0 (ref), v19 (copy), v2 (ref), v18 (copy)
        if l_FFlagLuaAppSduiEventDetailsEnabled_0 then
            require(l_CorePackages_0.Workspace.Packages.VirtualEvents).navigateToEventDetails(v19, v36.id);
            return;
        else
            v19.navigate(v2.EventDetails, {
                extraProps = {
                    currentTime = DateTime.now(), 
                    virtualEventId = v36.id, 
                    referralSource = v18.referralSource
                }
            });
            return;
        end;
    end, {
        v19
    });
    local v39 = v7.useCallback(function(v38) --[[ Line: 131 ]]
        -- upvalues: v9 (ref), v18 (copy)
        v9.fireVirtualEventImpression({
            virtualEventId = v38.id, 
            universeId = v38.universeId, 
            channel = v18.referralSource
        });
    end, {
        v18.referralSource
    });
    local v41 = v7.useCallback(function(v40) --[[ Line: 139 ]]
        -- upvalues: v21 (copy)
        v21(v40);
    end, {});
    local v42 = v7.useCallback(function() --[[ Line: 143 ]]
        -- upvalues: v9 (ref), v20 (copy), v18 (copy)
        v9.fireVirtualEventJoined({
            virtualEventId = v20.id, 
            universeId = tostring(v20.universeId), 
            channel = v18.referralSource, 
            attendanceCount = if v20 and v20.experienceDetails then v20.experienceDetails.playing else 0
        });
    end, {
        v20
    });
    if v23.data then
        return (v7.createElement(v7.Fragment, nil, {
            GameLauncher = if v20 then v7.createElement(v6, {
                universeId = tostring(v20.universeId), 
                placeId = if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() and v20.placeId then tostring(v20.placeId) else nil, 
                launchSource = v18.referralSource, 
                referralSource = v18.referralSource, 
                onGameLaunching = v42, 
                experienceJoinData = {
                    eventId = v20.id
                }
            }) else nil, 
            EventsCarousel = v7.createElement(l_EventsListCarousel_0, {
                layoutOrder = v18.layoutOrder, 
                virtualEvents = v23.data.virtualEventsByUniverseId.virtualEvents, 
                onTileActivated = v37, 
                onRsvpChanged = v35, 
                onJoinEvent = v41, 
                onEventImpression = v39, 
                defaultThumbnail = v18.defaultThumbnail, 
                peekViewFormat = v18.peekViewFormat, 
                referralSource = v18.referralSource, 
                universeId = v18.universeId
            })
        }));
    else
        return nil;
    end;
end;