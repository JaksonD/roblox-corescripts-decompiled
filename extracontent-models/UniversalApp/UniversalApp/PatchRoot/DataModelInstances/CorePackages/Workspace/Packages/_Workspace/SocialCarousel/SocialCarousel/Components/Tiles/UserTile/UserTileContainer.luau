local l_IXPService_0 = game:GetService("IXPService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.GameJoinCard);
local v6 = require(l_Parent_0.PlayerContextualMenu);
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.Responsive);
local v9 = require(l_Parent_0.RobloxAppEnums);
local v10 = require(l_Parent_0.UserProfiles);
local v11 = require(l_Parent_0.SocialCommon);
local l_Enums_0 = require(l_Parent_0.FriendsNetworking).Enums;
local l_FFlagSocialCarouselUseProfileStore_0 = require(l_Parent_0.SharedFlags).FFlagSocialCarouselUseProfileStore;
local l_FFlagUserTilePassOnStateChanged_0 = require(l_Parent_0.SharedFlags).FFlagUserTilePassOnStateChanged;
local v15 = require(l_Parent_0.Signals);
local v16 = require(l_Parent_0.SignalsReact);
local v17 = v10.Stores.UserProfileStore.get();
local l_PresenceTypes_0 = v11.Enums.PresenceTypes;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_Enums_1 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums;
local v21 = require(l_script_FirstAncestor_0.Common.Enums);
local v22 = require(l_Parent_0.Localization);
local v23 = require(l_script_FirstAncestor_0.Analytics.useSocialCarouselAnalytics);
local l_usePreferredInput_0 = v8.usePreferredInput;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_ControlState_0 = v4.Enums.ControlState;
local l_View_0 = v4.View;
local l_CentralOverlayType_0 = v9.CentralOverlayType;
local l_AppPage_0 = v9.AppPage;
local l_useLocalization_0 = v22.Hooks.useLocalization;
local l_Tile_0 = v21.Tile;
local v33 = require(script.Parent.UserTile);
local v34 = require(l_script_FirstAncestor_0.Common.Constants);
local v35 = require(l_script_FirstAncestor_0.Contexts.useSocialCarouselContext);
local l_DesktopGameJoinCardContainer_0 = v5.DesktopGameJoinCardContainer;
local v37 = game:DefineFastString("SocialCarouselVendorImagePath", "rbxasset://textures/ui/Shell/Icons/PlatformLogo.png");
local l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 = require(l_Parent_0.SharedFlags).FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel;
local l_FFlagPPVEnabledOnConsole_0 = require(l_Parent_0.SharedFlags).FFlagPPVEnabledOnConsole;
local v40 = require(l_script_FirstAncestor_0.Flags.FFlagSocialCarouselEnableUserSeenEvents);
local l_FFlagEnableDesktopGameJoinCard_0 = require(l_Parent_0.SharedFlags).FFlagEnableDesktopGameJoinCard;
local l_FFlagEnableMobileGameJoinCard_0 = require(l_Parent_0.SharedFlags).FFlagEnableMobileGameJoinCard;
local v43 = game:DefineFastFlag("EnableFriendCarouselInGameFriendExposureLogging_v2", false) and l_FFlagUserTilePassOnStateChanged_0;
local v44 = game:DefineFastString("SocialViewFriendSortInGameFriendsLayer", "Social.ViewFriendSortInGameFriends");
local function _(v45) --[[ Line: 89 ]]
    -- upvalues: l_Tile_0 (copy)
    if v45.tileType ~= l_Tile_0.Recommendation then
        return Enum.FriendStatus.Friend;
    elseif v45.isFriendWithUser then
        return Enum.FriendStatus.Friend;
    elseif v45.hasIncomingFriendRequest then
        return Enum.FriendStatus.FriendRequestReceived;
    elseif v45.hasPendingFriendRequest then
        return Enum.FriendStatus.FriendRequestSent;
    else
        return Enum.FriendStatus.NotFriend;
    end;
end;
return function(v47) --[[ Line: 105 ]]
    -- upvalues: v7 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_FFlagEnableMobileGameJoinCard_0 (copy), l_FFlagEnableDesktopGameJoinCard_0 (copy), l_usePreferredInput_0 (copy), l_FFlagPPVEnabledOnConsole_0 (copy), v8 (copy), v35 (copy), v23 (copy), l_useLocalization_0 (copy), l_FFlagSocialCarouselUseProfileStore_0 (copy), v17 (copy), v15 (copy), v16 (copy), v10 (copy), v6 (copy), l_Tile_0 (copy), l_Enums_0 (copy), l_PresenceTypes_0 (copy), v43 (copy), l_IXPService_0 (copy), v44 (copy), l_AppPage_0 (copy), l_Enums_1 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), v21 (copy), l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (copy), v34 (copy), v40 (copy), l_ControlState_0 (copy), v33 (copy), v3 (copy), l_FFlagUserTilePassOnStateChanged_0 (copy), v37 (copy), l_View_0 (copy), v4 (copy), l_DesktopGameJoinCardContainer_0 (copy)
    local v48 = v7.useRef(nil);
    local v49 = l_useDispatch_0();
    local v50 = l_useNavigation_0();
    local v51 = if not not l_FFlagEnableMobileGameJoinCard_0 or l_FFlagEnableDesktopGameJoinCard_0 then l_usePreferredInput_0() else nil;
    local v52 = false;
    if not l_FFlagPPVEnabledOnConsole_0 then
        v52 = (if not not l_FFlagEnableMobileGameJoinCard_0 or l_FFlagEnableDesktopGameJoinCard_0 then v51 else l_usePreferredInput_0()) == v8.Input.Directional;
    end;
    local v53 = v35();
    local v54 = v23();
    local v55 = l_useLocalization_0({
        suggestedLabel = "Feature.Friends.Label.Suggested"
    });
    local v56 = if v47.item.presence then {
        locationString = v47.item.presence.lastLocation, 
        locationPlaceId = v47.item.presence.placeId, 
        locationRootPlaceId = v47.item.presence.rootPlaceId, 
        locationUniverseId = v47.item.presence.universeId, 
        status = v47.item.presence.userPresenceType
    } else nil;
    local v57 = nil;
    local v58 = nil;
    if l_FFlagSocialCarouselUseProfileStore_0 then
        local v59 = v7.useMemo(function() --[[ Line: 141 ]]
            -- upvalues: v17 (ref), v47 (copy)
            return v17.fetchNamesByUserIds({
                v47.item.id
            });
        end, {
            v47.item.id
        });
        local l_v59_0 = v59 --[[ copy: 12 -> 26 ]];
        local v64 = v7.useMemo(function() --[[ Line: 145 ]]
            -- upvalues: v15 (ref), l_v59_0 (copy)
            return v15.createComputed(function(v61) --[[ Line: 146 ]]
                -- upvalues: l_v59_0 (ref)
                local v62 = l_v59_0(v61);
                local v63 = v62 and v62.data and v62.data[1];
                if v63 and v63.names then
                    return (v63.names.getCombinedName(v61));
                else
                    return nil;
                end;
            end);
        end, {
            v59
        });
        local v68 = v7.useMemo(function() --[[ Line: 153 ]]
            -- upvalues: v15 (ref), l_v59_0 (copy)
            return v15.createComputed(function(v65) --[[ Line: 154 ]]
                -- upvalues: l_v59_0 (ref)
                local v66 = l_v59_0(v65);
                local v67 = v66 and v66.data and v66.data[1];
                if v67 and v67.names then
                    return (v67.names.getPlatformName(v65));
                else
                    return nil;
                end;
            end);
        end, {
            v59
        });
        v57 = v16.useSignalState(v64);
        v58 = v16.useSignalState(v68);
    else
        local v69 = v10.Hooks.useUserProfilesFetch({
            userIds = {
                v47.item.id
            }, 
            query = v10.Queries.userProfilesCombinedAndPlatformByUserIds
        });
        local l_v69_0 = v69 --[[ copy: 12 -> 25 ]];
        v57 = v7.useMemo(function() --[[ Line: 169 ]]
            -- upvalues: l_v69_0 (copy), v10 (ref), v47 (copy)
            if not l_v69_0.data then
                return nil;
            else
                return v10.Selectors.getCombinedNameFromId(l_v69_0.data, v47.item.id);
            end;
        end, {
            v69.data
        });
        v58 = v7.useMemo(function() --[[ Line: 177 ]]
            -- upvalues: l_v69_0 (copy), v10 (ref), v47 (copy)
            if not l_v69_0.data then
                return nil;
            else
                return v10.Selectors.getPlatformNameFromId(l_v69_0.data, v47.item.id);
            end;
        end, {
            v69.data
        });
    end;
    local v76 = v7.useCallback(function(v71) --[[ Line: 186 ]]
        -- upvalues: v47 (copy), l_FFlagPPVEnabledOnConsole_0 (ref), v52 (ref), v49 (copy), v6 (ref), v56 (copy), l_Tile_0 (ref), l_Enums_0 (ref), l_PresenceTypes_0 (ref), v43 (ref), l_IXPService_0 (ref), v44 (ref), l_FFlagEnableMobileGameJoinCard_0 (ref), v51 (copy), v8 (ref), v50 (copy), l_AppPage_0 (ref), l_FFlagEnableDesktopGameJoinCard_0 (ref), l_Enums_1 (ref), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v57 (ref), v21 (ref), l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (ref), v54 (copy)
        if v47.item.onActivated then
            v47.item.onActivated(v47.item);
        elseif not l_FFlagPPVEnabledOnConsole_0 and v52 then
            local l_v49_0 = v49;
            local l_openPlayerContextualMenu_0 = v6.openPlayerContextualMenu;
            local v74 = {
                subjectUserId = v47.item.id, 
                subjectPresence = v56
            };
            local l_item_0 = v47.item;
            v74.robloxFriendshipStatus = if l_item_0.tileType ~= l_Tile_0.Recommendation then Enum.FriendStatus.Friend else if l_item_0.isFriendWithUser then Enum.FriendStatus.Friend else if l_item_0.hasIncomingFriendRequest then Enum.FriendStatus.FriendRequestReceived else if l_item_0.hasPendingFriendRequest then Enum.FriendStatus.FriendRequestSent else Enum.FriendStatus.NotFriend;
            v74.friendshipOriginSourceType = l_Enums_0.FriendshipOriginSourceType.FriendRecommendations.rawValue();
            l_v49_0(l_openPlayerContextualMenu_0(v74));
        elseif v47.item.presence and v47.item.presence.userPresenceType == l_PresenceTypes_0.InGame then
            if v43 then
                l_IXPService_0:LogFlagLinkedUserLayerExposure(v44);
            end;
            if l_FFlagEnableMobileGameJoinCard_0 and v51 == v8.Input.Touch then
                v50.navigate(l_AppPage_0.GameJoinCard, {
                    userId = v47.item.id, 
                    homepageCarouselAbsolutePosition = v47.index
                });
            elseif l_FFlagEnableDesktopGameJoinCard_0 then
                v50.navigate(l_AppPage_0.ProfilePlatform, {
                    detail = v47.item.id, 
                    extraProps = {
                        source = l_Enums_1.Sources.HomePageFriendsCarousel
                    }
                });
            else
                v49(l_SetCentralOverlay_0(l_CentralOverlayType_0.PeopleList, {
                    user = {
                        id = v47.item.id, 
                        combinedName = v57, 
                        presence = v21.OldPresence.IN_GAME, 
                        universeId = v47.item.presence.universeId, 
                        rootPlaceId = if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then v47.item.presence.rootPlaceId else nil, 
                        placeId = if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then v47.item.presence.placeId else nil, 
                        gameInstanceId = v47.item.presence.gameId, 
                        lastLocation = v47.item.presence.lastLocation
                    }, 
                    positionIndex = v47.index, 
                    absolutePosition = v47.index, 
                    anchorSpaceSize = v71.AbsoluteSize, 
                    anchorSpacePosition = v71.AbsolutePosition, 
                    source = l_Enums_1.Sources.HomePageFriendsCarousel
                }));
            end;
        else
            v50.navigate(l_AppPage_0.ProfilePlatform, {
                detail = v47.item.id, 
                extraProps = {
                    source = l_Enums_1.Sources.HomePageFriendsCarousel
                }
            });
        end;
        v54.userPressed(v47.item, {
            absolutePosition = v47.index
        });
    end, {
        v47.item
    });
    local v77 = v7.useMemo(function() --[[ Line: 253 ]]
        -- upvalues: v47 (copy), l_Tile_0 (ref), v55 (copy), l_PresenceTypes_0 (ref)
        if v47.item.tileType == l_Tile_0.Recommendation then
            return v55.suggestedLabel;
        elseif v47.item.presence and v47.item.presence.userPresenceType == l_PresenceTypes_0.InGame then
            return v47.item.presence.lastLocation;
        else
            return nil;
        end;
    end, {
        v47.item
    });
    v7.useEffect(function() --[[ Line: 262 ]]
        -- upvalues: v53 (copy), v48 (copy), v47 (copy)
        if v53.unifiedLogging then
            v53.unifiedLogging.tagTileForImpressions(v48, v47.index);
        end;
    end, {
        v47.index
    });
    v7.useEffect(function() --[[ Line: 268 ]]
        -- upvalues: v53 (copy), v34 (ref), v40 (ref), v54 (copy), v47 (copy)
        v53.onSuccessfulRender(v34.ANALYTICS.UI_LOADING_EVENTS.CAROUSEL_FRIEND);
        if v40 then
            v54.userSeen(v47.item, {
                absolutePosition = v47.index
            });
        end;
    end, {});
    v7.useEffect(function() --[[ Line: 277 ]]
        -- upvalues: v47 (copy)
        if v47.onTileContentChanged then
            v47.onTileContentChanged(v47.item.id, v47.index);
        end;
    end, {
        v47.item.id, 
        v47.index
    });
    if l_FFlagEnableDesktopGameJoinCard_0 or v43 then
        local v78, v79 = v7.useState(false);
        local v80, v81 = v7.useState(false);
        local v85 = v7.useCallback(function(v82) --[[ Line: 286 ]]
            -- upvalues: v79 (copy), l_ControlState_0 (ref)
            local l_v79_0 = v79;
            local v84 = true;
            if v82 ~= l_ControlState_0.Hover then
                v84 = v82 == l_ControlState_0.Selected;
            end;
            l_v79_0(v84);
        end, {});
        local v89 = v7.useCallback(function(v86) --[[ Line: 289 ]]
            -- upvalues: v81 (copy), l_ControlState_0 (ref)
            local l_v81_0 = v81;
            local v88 = true;
            if v86 ~= l_ControlState_0.Hover then
                v88 = v86 == l_ControlState_0.Selected;
            end;
            l_v81_0(v88);
        end, {});
        local l_presence_0 = v47.item.presence;
        local v91 = l_presence_0 and l_presence_0.userPresenceType == l_PresenceTypes_0.InGame;
        local v92 = (not not v78 or v80) and v91 and v56 ~= nil;
        local v93 = v91 and v52;
        v7.useEffect(function() --[[ Line: 297 ]]
            -- upvalues: v43 (ref), v92 (copy), l_IXPService_0 (ref), v44 (ref)
            if v43 and v92 then
                l_IXPService_0:LogFlagLinkedUserLayerExposure(v44);
            end;
        end, {
            v92
        });
        local v94 = v7.createElement(v33, v3.Dictionary.join(v47, {
            itemSize = UDim2.fromScale(1, 1), 
            onActivated = v76, 
            onStateChanged = if l_FFlagUserTilePassOnStateChanged_0 then v85 else nil, 
            name = if v47.item.tileType == l_Tile_0.Recommendation then v58 else v57, 
            contextualText = v77, 
            tileRef = v48, 
            titleIcon = if v47.item.tileType == l_Tile_0.Recommendation then v37 else nil
        }));
        return v7.createElement(l_View_0, {
            Size = v47.itemSize, 
            LayoutOrder = v47.index, 
            BackgroundTransparency = 1, 
            ref = v48, 
            onStateChanged = if l_FFlagUserTilePassOnStateChanged_0 then nil else v85, 
            stateLayer = {
                affordance = v4.Enums.StateLayerAffordance.None
            }
        }, {
            UserTile = v94, 
            GameJoinCardPopover = if l_FFlagEnableDesktopGameJoinCard_0 and v56 and l_presence_0 then v7.createElement(l_DesktopGameJoinCardContainer_0, {
                layoutOrder = 1, 
                playerName = v57 or "", 
                platformName = v58 or "", 
                universeId = tostring(l_presence_0.universeId), 
                experienceName = l_presence_0.lastLocation, 
                userId = v47.item.id, 
                presence = l_presence_0, 
                anchorRef = v48, 
                isOpen = v92 == true, 
                onPopoverStateChanged = v89, 
                homepageCarouselAbsolutePosition = v47.index, 
                showGamepadJoinFocus = v93 == true
            }) else nil
        });
    else
        return v7.createElement(v33, v3.Dictionary.join(v47, {
            onActivated = v76, 
            name = if v47.item.tileType == l_Tile_0.Recommendation then v58 else v57, 
            contextualText = v77, 
            tileRef = v48, 
            titleIcon = if v47.item.tileType == l_Tile_0.Recommendation then v37 else nil
        }));
    end;
end;