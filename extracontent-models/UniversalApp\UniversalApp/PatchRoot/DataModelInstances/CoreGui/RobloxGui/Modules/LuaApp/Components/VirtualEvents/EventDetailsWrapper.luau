local l_CorePackages_0 = game:GetService("CorePackages");
local l_SessionService_0 = game:GetService("SessionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v4 = require(l_CorePackages_0.Packages.ApolloClient);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v7 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local l_UrlBuilder_0 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder;
local v13 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenGameDetails);
local v14 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local l_SetGamePlaySession_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SetGamePlaySession;
local v18 = require(l_CorePackages_0.Workspace.Packages.VirtualEvents);
local v19 = require(l_script_FirstAncestor_0.LuaApp.Enum.TransitionAnimation);
local v20 = require(script.Parent.LaunchGameOnMount);
local l_useQuery_0 = v4.useQuery;
local l_useUserExperiment_0 = v6.useUserExperiment;
local l_useIXPService_0 = v6.useIXPService;
local l_getFFlagRemoveVirtualEventsExperiment_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagRemoveVirtualEventsExperiment;
local l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableVirtualEventPlaceId;
local v26 = {
    referralSource = "link"
};
return function(v27) --[[ Line: 50 ]] --[[ Name: EventDetailsWrapper ]]
    -- upvalues: v5 (copy), v26 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), v7 (copy), l_GuiService_0 (copy), l_useQuery_0 (copy), v18 (copy), l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 (copy), l_useLocalization_0 (copy), l_useIXPService_0 (copy), l_getFFlagRemoveVirtualEventsExperiment_0 (copy), l_useUserExperiment_0 (copy), v13 (copy), l_default_0 (copy), l_UrlBuilder_0 (copy), l_isSubjectToDesktopPolicies_0 (copy), v14 (copy), l_SetGamePlaySession_0 (copy), l_SessionService_0 (copy), l_SessionType_0 (copy), v19 (copy), v20 (copy)
    local v28 = v5.Dictionary.join(v26, v27);
    local v29 = l_useDispatch_0();
    local v30 = l_useNavigation_0();
    local v31, v32 = v7.useState(false);
    local v33 = v7.useRef(true);
    local l_l_GuiService_0_SafeZoneOffsets_0 = l_GuiService_0:GetSafeZoneOffsets();
    local v35 = l_useQuery_0(v18.requests.GET_VIRTUAL_EVENT, {
        variables = {
            virtualEventId = v28.virtualEventId
        }
    });
    local v36 = if v35.data then v35.data.virtualEvent else nil;
    local v37 = if v36 and v36.universeId then tostring(v36.universeId) else nil;
    local v38 = if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() and v36 and v36.placeId then tostring(v36.placeId) else nil;
    local v39 = if v36 then v36.experienceDetails.playing else 0;
    local v40 = l_useLocalization_0({
        hostTitle = "Feature.GameDetails.Label.Developer"
    });
    local v41 = l_useIXPService_0();
    local v44 = if l_getFFlagRemoveVirtualEventsExperiment_0() then nil else l_useUserExperiment_0({
        "Ecosystems.EventsOnExperienceDetailsPage"
    }, function(v42) --[[ Line: 84 ]]
        local v43 = v42["Ecosystems.EventsOnExperienceDetailsPage"];
        if v43 then
            return v43.virtualEventsMVPEnabled;
        else
            return nil;
        end;
    end, false);
    local v45 = v7.useCallback(function() --[[ Line: 89 ]]
        -- upvalues: v30 (copy)
        v30.goBack();
    end, {});
    local v46 = v7.useCallback(function() --[[ Line: 93 ]]
        -- upvalues: v37 (copy), v29 (copy), v13 (ref)
        if v37 then
            v29(v13(v37));
        end;
    end, {
        v37
    });
    local v48 = v7.useCallback(function(v47) --[[ Line: 99 ]]
        -- upvalues: l_default_0 (ref)
        if l_default_0 then
            l_default_0:shareUrl({
                url = v47, 
                context = "eventDetailsPage"
            });
        end;
    end, {});
    local v50 = v7.useCallback(function(v49) --[[ Line: 108 ]]
        -- upvalues: v37 (copy), v18 (ref), v28 (copy), v39 (copy)
        if v37 then
            v18.fireVirtualEventLinkCopied({
                virtualEventId = v28.virtualEventId, 
                virtualEventLink = v49, 
                universeId = v37, 
                attendanceCount = v39
            });
        end;
    end, {
        v28.virtualEventId, 
        v37, 
        v39
    });
    local v52 = v7.useCallback(function() --[[ Line: 119 ]]
        -- upvalues: v37 (copy), v18 (ref), v28 (copy), v39 (copy), l_UrlBuilder_0 (ref), l_isSubjectToDesktopPolicies_0 (ref), v30 (copy), v14 (ref), v50 (copy), l_default_0 (ref), v48 (copy)
        if v37 then
            v18.fireShareVirtualEventIconClicked({
                virtualEventId = v28.virtualEventId, 
                universeId = v37, 
                channel = "eventDetailsPage", 
                attendanceCount = v39
            });
            local v51 = l_UrlBuilder_0.virtualevents.appsflyer({
                eventId = v28.virtualEventId
            });
            if l_isSubjectToDesktopPolicies_0() then
                v30.navigate(v14.ShareVirtualEventModal, {
                    extraProps = {
                        virtualEventId = v28.virtualEventId, 
                        onCopy = function() --[[ Line: 136 ]] --[[ Name: onCopy ]]
                            -- upvalues: v50 (ref), v51 (copy), l_default_0 (ref)
                            v50(v51);
                            if l_default_0 then
                                l_default_0:shareUrl({
                                    url = v51, 
                                    context = "eventDetailsPage"
                                });
                            end;
                        end
                    }
                });
                return;
            else
                v48(v51);
            end;
        end;
    end, {
        v28.virtualEventId, 
        v37, 
        v39
    });
    local v53 = v7.useCallback(function() --[[ Line: 154 ]]
        -- upvalues: v32 (copy)
        v32(true);
    end, {});
    local v54 = v7.useCallback(function() --[[ Line: 158 ]]
        -- upvalues: l_SetGamePlaySession_0 (ref), l_SessionService_0 (ref), l_SessionType_0 (ref), v18 (ref), v36 (copy), v39 (copy)
        l_SetGamePlaySession_0(l_SessionService_0, l_SessionType_0.StructuralIdentifier.GamePlayFromEventDetails, true);
        v18.fireVirtualEventJoined({
            virtualEventId = v36.id, 
            universeId = tostring(v36.universeId), 
            channel = "eventDetailsPage", 
            attendanceCount = v39
        });
    end, {
        v36, 
        v39
    });
    local v57 = v7.useCallback(function(v55, v56) --[[ Line: 170 ]]
        -- upvalues: v18 (ref), v36 (copy), v39 (copy), l_getFFlagRemoveVirtualEventsExperiment_0 (ref), v30 (copy), v14 (ref), v41 (copy), v44 (copy)
        v18.fireVirtualEventRSVP({
            virtualEventId = v36.id, 
            universeId = tostring(v36.universeId), 
            channel = "eventDetailsPage", 
            status = v55, 
            attendanceCount = v39
        });
        if v56 then
            if l_getFFlagRemoveVirtualEventsExperiment_0() then
                v30.navigate(v14.EventNotificationsModal, {
                    extraProps = {
                        virtualEvent = v36, 
                        channel = "eventDetailsPage"
                    }
                });
                return;
            else
                v41:LogUserLayerExposure("Ecosystems.EventsOnExperienceDetailsPage");
                if v44 then
                    v30.navigate(v14.EventNotificationsModal, {
                        extraProps = {
                            virtualEvent = v36, 
                            channel = "eventDetailsPage"
                        }
                    });
                end;
            end;
        end;
    end, {
        v36, 
        v30, 
        v39, 
        v44, 
        v41
    });
    v7.useEffect(function() --[[ Line: 204 ]]
        -- upvalues: v33 (copy), v36 (copy), v18 (ref), v28 (copy)
        if v33.current and v36 then
            v18.fireEventDetailsPageVisit({
                virtualEventId = v36.id, 
                universeId = tostring(v36.universeId), 
                channel = v28.referralSource
            });
            v33.current = false;
        end;
    end, {
        v36
    });
    local v59 = v7.useCallback(function(v58) --[[ Line: 216 ]]
        -- upvalues: v30 (copy), v14 (ref), l_UrlBuilder_0 (ref), v40 (copy), v19 (ref)
        v30.navigate(v14.GenericWebPage, {
            detail = l_UrlBuilder_0.game.info.creator({
                creatorType = v58.hostType == "group" and "Group" or "User", 
                creatorId = v58.hostId
            }), 
            extraProps = {
                title = v40.hostTitle, 
                transitionAnimation = v19.SlideInFromRight
            }
        });
    end, {
        v30, 
        v40
    });
    return v7.createElement(v7.Fragment, nil, {
        GameLauncher = if v31 and v37 then v7.createElement(v20, {
            universeId = v37, 
            placeId = if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v38 else nil, 
            launchSource = "eventDetailsPage", 
            referralSource = v28.referralSource, 
            onGameLaunching = v54, 
            experienceJoinData = {
                eventId = v28.virtualEventId
            }
        }) else nil, 
        Wrapper = v7.createElement("Frame", {
            Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(0, l_l_GuiService_0_SafeZoneOffsets_0.top), 
            Position = UDim2.fromOffset(0, l_l_GuiService_0_SafeZoneOffsets_0.top), 
            BackgroundTransparency = 1, 
            SelectionGroup = true, 
            SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorDown = Enum.SelectionBehavior.Stop
        }, {
            EventDetailsPageLoader = v7.createElement(v18.EventDetailsPageLoader, {
                virtualEventId = v28.virtualEventId, 
                currentTime = DateTime.now(), 
                onClose = v45, 
                onShare = v52, 
                onRsvpChanged = v57, 
                onJoinEvent = v53, 
                onExperienceTileActivated = v46, 
                onHostActivated = v59
            })
        })
    });
end;