local l_CorePackages_0 = game:GetService("CorePackages");
local l_IXPService_0 = game:GetService("IXPService");
local l_SessionService_0 = game:GetService("SessionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v5 = require(l_CorePackages_0.Packages.ApolloClient);
local v6 = require(l_CorePackages_0.Packages.Cryo);
local v7 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v8 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local l_UrlBuilder_0 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder;
local v14 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenGameDetails);
local v15 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local l_SetGamePlaySession_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SetGamePlaySession;
local v19 = require(l_CorePackages_0.Workspace.Packages.VirtualEvents);
local v20 = require(l_script_FirstAncestor_0.LuaApp.Enum.TransitionAnimation);
local v21 = require(script.Parent.LaunchGameOnMount);
local l_useQuery_0 = v5.useQuery;
local l_useUserExperiment_0 = v7.useUserExperiment;
local l_useIXPService_0 = v7.useIXPService;
local l_getFFlagRemoveVirtualEventsExperiment_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagRemoveVirtualEventsExperiment;
local l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableVirtualEventPlaceId;
local l_FFlagLuaAppSduiEventDetailsLogExposure_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppSduiEventDetailsLogExposure;
local l_FStringLuaAppSduiEventDetailsIxpLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FStringLuaAppSduiEventDetailsIxpLayer;
local v29 = {
    referralSource = "link"
};
return function(v30) --[[ Line: 55 ]] --[[ Name: EventDetailsWrapper ]]
    -- upvalues: v6 (copy), v29 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), v8 (copy), l_GuiService_0 (copy), l_useQuery_0 (copy), v19 (copy), l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 (copy), l_useLocalization_0 (copy), l_useIXPService_0 (copy), l_getFFlagRemoveVirtualEventsExperiment_0 (copy), l_useUserExperiment_0 (copy), v14 (copy), l_default_0 (copy), l_UrlBuilder_0 (copy), l_isSubjectToDesktopPolicies_0 (copy), v15 (copy), l_SetGamePlaySession_0 (copy), l_SessionService_0 (copy), l_SessionType_0 (copy), l_FFlagLuaAppSduiEventDetailsLogExposure_0 (copy), l_IXPService_0 (copy), l_FStringLuaAppSduiEventDetailsIxpLayer_0 (copy), v20 (copy), v21 (copy)
    local v31 = v6.Dictionary.join(v29, v30);
    local v32 = l_useDispatch_0();
    local v33 = l_useNavigation_0();
    local v34, v35 = v8.useState(false);
    local v36 = v8.useRef(true);
    local l_l_GuiService_0_SafeZoneOffsets_0 = l_GuiService_0:GetSafeZoneOffsets();
    local v38 = l_useQuery_0(v19.requests.GET_VIRTUAL_EVENT, {
        variables = {
            virtualEventId = v31.virtualEventId
        }
    });
    local v39 = if v38.data then v38.data.virtualEvent else nil;
    local v40 = if v39 and v39.universeId then tostring(v39.universeId) else nil;
    local v41 = if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() and v39 and v39.placeId then tostring(v39.placeId) else nil;
    local v42 = if v39 then v39.experienceDetails.playing else 0;
    local v43 = l_useLocalization_0({
        hostTitle = "Feature.GameDetails.Label.Developer"
    });
    local v44 = l_useIXPService_0();
    local v47 = if l_getFFlagRemoveVirtualEventsExperiment_0() then nil else l_useUserExperiment_0({
        "Ecosystems.EventsOnExperienceDetailsPage"
    }, function(v45) --[[ Line: 89 ]]
        local v46 = v45["Ecosystems.EventsOnExperienceDetailsPage"];
        if v46 then
            return v46.virtualEventsMVPEnabled;
        else
            return nil;
        end;
    end, false);
    local v48 = v8.useCallback(function() --[[ Line: 94 ]]
        -- upvalues: v33 (copy)
        v33.goBack();
    end, {});
    local v49 = v8.useCallback(function() --[[ Line: 98 ]]
        -- upvalues: v40 (copy), v32 (copy), v14 (ref)
        if v40 then
            v32(v14(v40));
        end;
    end, {
        v40
    });
    local v51 = v8.useCallback(function(v50) --[[ Line: 104 ]]
        -- upvalues: l_default_0 (ref)
        if l_default_0 then
            l_default_0:shareUrl({
                url = v50, 
                context = "eventDetailsPage"
            });
        end;
    end, {});
    local v53 = v8.useCallback(function(v52) --[[ Line: 113 ]]
        -- upvalues: v40 (copy), v19 (ref), v31 (copy), v42 (copy)
        if v40 then
            v19.fireVirtualEventLinkCopied({
                virtualEventId = v31.virtualEventId, 
                virtualEventLink = v52, 
                universeId = v40, 
                attendanceCount = v42
            });
        end;
    end, {
        v31.virtualEventId, 
        v40, 
        v42
    });
    local v55 = v8.useCallback(function() --[[ Line: 124 ]]
        -- upvalues: v40 (copy), v19 (ref), v31 (copy), v42 (copy), l_UrlBuilder_0 (ref), l_isSubjectToDesktopPolicies_0 (ref), v33 (copy), v15 (ref), v53 (copy), l_default_0 (ref), v51 (copy)
        if v40 then
            v19.fireShareVirtualEventIconClicked({
                virtualEventId = v31.virtualEventId, 
                universeId = v40, 
                channel = "eventDetailsPage", 
                attendanceCount = v42
            });
            local v54 = l_UrlBuilder_0.virtualevents.appsflyer({
                eventId = v31.virtualEventId
            });
            if l_isSubjectToDesktopPolicies_0() then
                v33.navigate(v15.ShareVirtualEventModal, {
                    extraProps = {
                        virtualEventId = v31.virtualEventId, 
                        onCopy = function() --[[ Line: 141 ]] --[[ Name: onCopy ]]
                            -- upvalues: v53 (ref), v54 (copy), l_default_0 (ref)
                            v53(v54);
                            if l_default_0 then
                                l_default_0:shareUrl({
                                    url = v54, 
                                    context = "eventDetailsPage"
                                });
                            end;
                        end
                    }
                });
                return;
            else
                v51(v54);
            end;
        end;
    end, {
        v31.virtualEventId, 
        v40, 
        v42
    });
    local v56 = v8.useCallback(function() --[[ Line: 159 ]]
        -- upvalues: v35 (copy)
        v35(true);
    end, {});
    local v57 = v8.useCallback(function() --[[ Line: 163 ]]
        -- upvalues: l_SetGamePlaySession_0 (ref), l_SessionService_0 (ref), l_SessionType_0 (ref), v19 (ref), v39 (copy), v42 (copy)
        l_SetGamePlaySession_0(l_SessionService_0, l_SessionType_0.StructuralIdentifier.GamePlayFromEventDetails, true);
        v19.fireVirtualEventJoined({
            virtualEventId = v39.id, 
            universeId = tostring(v39.universeId), 
            channel = "eventDetailsPage", 
            attendanceCount = v42
        });
    end, {
        v39, 
        v42
    });
    local v60 = v8.useCallback(function(v58, v59) --[[ Line: 175 ]]
        -- upvalues: v19 (ref), v39 (copy), v42 (copy), l_getFFlagRemoveVirtualEventsExperiment_0 (ref), v33 (copy), v15 (ref), v44 (copy), v47 (copy)
        v19.fireVirtualEventRSVP({
            virtualEventId = v39.id, 
            universeId = tostring(v39.universeId), 
            channel = "eventDetailsPage", 
            status = v58, 
            attendanceCount = v42
        });
        if v59 then
            if l_getFFlagRemoveVirtualEventsExperiment_0() then
                v33.navigate(v15.EventNotificationsModal, {
                    extraProps = {
                        virtualEvent = v39, 
                        channel = "eventDetailsPage"
                    }
                });
                return;
            else
                v44:LogUserLayerExposure("Ecosystems.EventsOnExperienceDetailsPage");
                if v47 then
                    v33.navigate(v15.EventNotificationsModal, {
                        extraProps = {
                            virtualEvent = v39, 
                            channel = "eventDetailsPage"
                        }
                    });
                end;
            end;
        end;
    end, {
        v39, 
        v33, 
        v42, 
        v47, 
        v44
    });
    v8.useEffect(function() --[[ Line: 209 ]]
        -- upvalues: v36 (copy), v39 (copy), v19 (ref), v31 (copy)
        if v36.current and v39 then
            v19.fireEventDetailsPageVisit({
                virtualEventId = v39.id, 
                universeId = tostring(v39.universeId), 
                channel = v31.referralSource
            });
            v36.current = false;
        end;
    end, {
        v39
    });
    v8.useEffect(function() --[[ Line: 221 ]]
        -- upvalues: v31 (copy), l_FFlagLuaAppSduiEventDetailsLogExposure_0 (ref), l_IXPService_0 (ref), l_FStringLuaAppSduiEventDetailsIxpLayer_0 (ref)
        if v31.virtualEventId and l_FFlagLuaAppSduiEventDetailsLogExposure_0 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(l_FStringLuaAppSduiEventDetailsIxpLayer_0);
        end;
    end, {
        v31.virtualEventId
    });
    local v62 = v8.useCallback(function(v61) --[[ Line: 227 ]]
        -- upvalues: v33 (copy), v15 (ref), l_UrlBuilder_0 (ref), v43 (copy), v20 (ref)
        v33.navigate(v15.GenericWebPage, {
            detail = l_UrlBuilder_0.game.info.creator({
                creatorType = v61.hostType == "group" and "Group" or "User", 
                creatorId = v61.hostId
            }), 
            extraProps = {
                title = v43.hostTitle, 
                transitionAnimation = v20.SlideInFromRight
            }
        });
    end, {
        v33, 
        v43
    });
    return v8.createElement(v8.Fragment, nil, {
        GameLauncher = if v34 and v40 then v8.createElement(v21, {
            universeId = v40, 
            placeId = if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v41 else nil, 
            launchSource = "eventDetailsPage", 
            referralSource = v31.referralSource, 
            onGameLaunching = v57, 
            experienceJoinData = {
                eventId = v31.virtualEventId
            }
        }) else nil, 
        Wrapper = v8.createElement("Frame", {
            Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(0, l_l_GuiService_0_SafeZoneOffsets_0.top), 
            Position = UDim2.fromOffset(0, l_l_GuiService_0_SafeZoneOffsets_0.top), 
            BackgroundTransparency = 1, 
            SelectionGroup = true, 
            SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorDown = Enum.SelectionBehavior.Stop
        }, {
            EventDetailsPageLoader = v8.createElement(v19.EventDetailsPageLoader, {
                virtualEventId = v31.virtualEventId, 
                currentTime = DateTime.now(), 
                onClose = v48, 
                onShare = v55, 
                onRsvpChanged = v60, 
                onJoinEvent = v56, 
                onExperienceTileActivated = v49, 
                onHostActivated = v62
            })
        })
    });
end;