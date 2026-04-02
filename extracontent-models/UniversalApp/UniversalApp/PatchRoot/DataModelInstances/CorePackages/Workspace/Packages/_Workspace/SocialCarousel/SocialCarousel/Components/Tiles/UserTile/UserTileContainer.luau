local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.GameJoinCard);
local v5 = require(l_Parent_0.PlayerContextualMenu);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.Responsive);
local v8 = require(l_Parent_0.RobloxAppEnums);
local v9 = require(l_Parent_0.UserProfiles);
local v10 = require(l_Parent_0.SocialCommon);
local l_Enums_0 = require(l_Parent_0.FriendsNetworking).Enums;
local l_FFlagSocialCarouselUseProfileStore_0 = require(l_script_FirstAncestor_0.Flags).FFlagSocialCarouselUseProfileStore;
local v13 = require(l_Parent_0.Signals);
local v14 = require(l_Parent_0.SignalsReact);
local v15 = v9.Stores.UserProfileStore.get();
local l_PresenceTypes_0 = v10.Enums.PresenceTypes;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_Enums_1 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums;
local v19 = require(l_script_FirstAncestor_0.Common.Enums);
local v20 = require(l_Parent_0.Localization);
local v21 = require(l_script_FirstAncestor_0.Analytics.useSocialCarouselAnalytics);
local l_usePreferredInput_0 = v7.usePreferredInput;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_ControlState_0 = v3.Enums.ControlState;
local l_View_0 = v3.View;
local l_CentralOverlayType_0 = v8.CentralOverlayType;
local l_AppPage_0 = v8.AppPage;
local l_useLocalization_0 = v20.Hooks.useLocalization;
local l_Tile_0 = v19.Tile;
local v31 = require(script.Parent.UserTile);
local v32 = require(l_script_FirstAncestor_0.Common.Constants);
local v33 = require(l_script_FirstAncestor_0.Contexts.useSocialCarouselContext);
local l_DesktopGameJoinCardContainer_0 = v4.DesktopGameJoinCardContainer;
local v35 = game:DefineFastString("SocialCarouselVendorImagePath", "rbxasset://textures/ui/Shell/Icons/PlatformLogo.png");
local l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 = require(l_Parent_0.SharedFlags).FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel;
local l_FFlagPPVEnabledOnConsole_0 = require(l_Parent_0.SharedFlags).FFlagPPVEnabledOnConsole;
local v38 = require(l_script_FirstAncestor_0.Flags.FFlagSocialCarouselEnableUserSeenEvents);
local l_FFlagEnableDesktopGameJoinCard_0 = require(l_Parent_0.SharedFlags).FFlagEnableDesktopGameJoinCard;
local l_FFlagEnableMobileGameJoinCard_0 = require(l_Parent_0.SharedFlags).FFlagEnableMobileGameJoinCard;
local function _(v41) --[[ Line: 79 ]]
    -- upvalues: l_Tile_0 (copy)
    if v41.tileType ~= l_Tile_0.Recommendation then
        return Enum.FriendStatus.Friend;
    elseif v41.isFriendWithUser then
        return Enum.FriendStatus.Friend;
    elseif v41.hasIncomingFriendRequest then
        return Enum.FriendStatus.FriendRequestReceived;
    elseif v41.hasPendingFriendRequest then
        return Enum.FriendStatus.FriendRequestSent;
    else
        return Enum.FriendStatus.NotFriend;
    end;
end;
return function(v43) --[[ Line: 95 ]]
    -- upvalues: v6 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_FFlagEnableMobileGameJoinCard_0 (copy), l_usePreferredInput_0 (copy), l_FFlagPPVEnabledOnConsole_0 (copy), v7 (copy), v33 (copy), v21 (copy), l_useLocalization_0 (copy), l_FFlagSocialCarouselUseProfileStore_0 (copy), v15 (copy), v13 (copy), v14 (copy), v9 (copy), v5 (copy), l_Tile_0 (copy), l_Enums_0 (copy), l_PresenceTypes_0 (copy), l_AppPage_0 (copy), l_FFlagEnableDesktopGameJoinCard_0 (copy), l_Enums_1 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), v19 (copy), l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (copy), v32 (copy), v38 (copy), l_ControlState_0 (copy), v31 (copy), v2 (copy), v35 (copy), l_View_0 (copy), v3 (copy), l_DesktopGameJoinCardContainer_0 (copy)
    local v44 = v6.useRef(nil);
    local v45 = l_useDispatch_0();
    local v46 = l_useNavigation_0();
    local v47 = if l_FFlagEnableMobileGameJoinCard_0 then l_usePreferredInput_0() else nil;
    local v48 = nil;
    if not l_FFlagPPVEnabledOnConsole_0 then
        v48 = (if l_FFlagEnableMobileGameJoinCard_0 then v47 else l_usePreferredInput_0()) == v7.Input.Directional;
    end;
    local v49 = v33();
    local v50 = v21();
    local v51 = l_useLocalization_0({
        suggestedLabel = "Feature.Friends.Label.Suggested"
    });
    local v52 = if v43.item.presence then {
        locationString = v43.item.presence.lastLocation, 
        locationPlaceId = v43.item.presence.placeId, 
        locationRootPlaceId = v43.item.presence.rootPlaceId, 
        locationUniverseId = v43.item.presence.universeId, 
        status = v43.item.presence.userPresenceType
    } else nil;
    local v53 = nil;
    local v54 = nil;
    if l_FFlagSocialCarouselUseProfileStore_0 then
        local v55 = v6.useMemo(function() --[[ Line: 125 ]]
            -- upvalues: v15 (ref), v43 (copy)
            return v15.fetchNamesByUserIds({
                v43.item.id
            });
        end, {
            v43.item.id
        });
        local l_v55_0 = v55 --[[ copy: 12 -> 27 ]];
        local v60 = v6.useMemo(function() --[[ Line: 129 ]]
            -- upvalues: v13 (ref), l_v55_0 (copy)
            return v13.createComputed(function(v57) --[[ Line: 130 ]]
                -- upvalues: l_v55_0 (ref)
                local v58 = l_v55_0(v57);
                local v59 = v58 and v58.data and v58.data[1];
                if v59 and v59.names then
                    return (v59.names.getCombinedName(v57));
                else
                    return nil;
                end;
            end);
        end, {
            v55
        });
        local v64 = v6.useMemo(function() --[[ Line: 137 ]]
            -- upvalues: v13 (ref), l_v55_0 (copy)
            return v13.createComputed(function(v61) --[[ Line: 138 ]]
                -- upvalues: l_v55_0 (ref)
                local v62 = l_v55_0(v61);
                local v63 = v62 and v62.data and v62.data[1];
                if v63 and v63.names then
                    return (v63.names.getPlatformName(v61));
                else
                    return nil;
                end;
            end);
        end, {
            v55
        });
        v53 = v14.useSignalState(v60);
        v54 = v14.useSignalState(v64);
    else
        local v65 = v9.Hooks.useUserProfilesFetch({
            userIds = {
                v43.item.id
            }, 
            query = v9.Queries.userProfilesCombinedAndPlatformByUserIds
        });
        local l_v65_0 = v65 --[[ copy: 12 -> 26 ]];
        v53 = v6.useMemo(function() --[[ Line: 153 ]]
            -- upvalues: l_v65_0 (copy), v9 (ref), v43 (copy)
            if not l_v65_0.data then
                return nil;
            else
                return v9.Selectors.getCombinedNameFromId(l_v65_0.data, v43.item.id);
            end;
        end, {
            v65.data
        });
        v54 = v6.useMemo(function() --[[ Line: 161 ]]
            -- upvalues: l_v65_0 (copy), v9 (ref), v43 (copy)
            if not l_v65_0.data then
                return nil;
            else
                return v9.Selectors.getPlatformNameFromId(l_v65_0.data, v43.item.id);
            end;
        end, {
            v65.data
        });
    end;
    local v72 = v6.useCallback(function(v67) --[[ Line: 170 ]]
        -- upvalues: v43 (copy), l_FFlagPPVEnabledOnConsole_0 (ref), v48 (ref), v45 (copy), v5 (ref), v52 (copy), l_Tile_0 (ref), l_Enums_0 (ref), l_PresenceTypes_0 (ref), l_FFlagEnableMobileGameJoinCard_0 (ref), v47 (copy), v7 (ref), v46 (copy), l_AppPage_0 (ref), v53 (ref), l_FFlagEnableDesktopGameJoinCard_0 (ref), l_Enums_1 (ref), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v19 (ref), l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (ref), v50 (copy)
        if v43.item.onActivated then
            v43.item.onActivated(v43.item);
        elseif not l_FFlagPPVEnabledOnConsole_0 and v48 then
            local l_v45_0 = v45;
            local l_openPlayerContextualMenu_0 = v5.openPlayerContextualMenu;
            local v70 = {
                subjectUserId = v43.item.id, 
                subjectPresence = v52
            };
            local l_item_0 = v43.item;
            v70.robloxFriendshipStatus = if l_item_0.tileType ~= l_Tile_0.Recommendation then Enum.FriendStatus.Friend else if l_item_0.isFriendWithUser then Enum.FriendStatus.Friend else if l_item_0.hasIncomingFriendRequest then Enum.FriendStatus.FriendRequestReceived else if l_item_0.hasPendingFriendRequest then Enum.FriendStatus.FriendRequestSent else Enum.FriendStatus.NotFriend;
            v70.friendshipOriginSourceType = l_Enums_0.FriendshipOriginSourceType.FriendRecommendations.rawValue();
            l_v45_0(l_openPlayerContextualMenu_0(v70));
        elseif v43.item.presence and v43.item.presence.userPresenceType == l_PresenceTypes_0.InGame then
            if l_FFlagEnableMobileGameJoinCard_0 and v47 == v7.Input.Touch then
                v46.navigate(l_AppPage_0.GameJoinCard, {
                    userId = v43.item.id, 
                    universeId = v43.item.presence.universeId, 
                    playerName = v53, 
                    experienceName = v43.item.presence.lastLocation
                });
            elseif l_FFlagEnableDesktopGameJoinCard_0 then
                v46.navigate(l_AppPage_0.ProfilePlatform, {
                    detail = v43.item.id, 
                    extraProps = {
                        source = l_Enums_1.Sources.HomePageFriendsCarousel
                    }
                });
            else
                v45(l_SetCentralOverlay_0(l_CentralOverlayType_0.PeopleList, {
                    user = {
                        id = v43.item.id, 
                        combinedName = v53, 
                        presence = v19.OldPresence.IN_GAME, 
                        universeId = v43.item.presence.universeId, 
                        rootPlaceId = if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then v43.item.presence.rootPlaceId else nil, 
                        placeId = if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then v43.item.presence.placeId else nil, 
                        gameInstanceId = v43.item.presence.gameId, 
                        lastLocation = v43.item.presence.lastLocation
                    }, 
                    positionIndex = v43.index, 
                    absolutePosition = v43.index, 
                    anchorSpaceSize = v67.AbsoluteSize, 
                    anchorSpacePosition = v67.AbsolutePosition, 
                    source = l_Enums_1.Sources.HomePageFriendsCarousel
                }));
            end;
        else
            v46.navigate(l_AppPage_0.ProfilePlatform, {
                detail = v43.item.id, 
                extraProps = {
                    source = l_Enums_1.Sources.HomePageFriendsCarousel
                }
            });
        end;
        v50.userPressed(v43.item, {
            absolutePosition = v43.index
        });
    end, {
        v43.item
    });
    local v73 = v6.useMemo(function() --[[ Line: 236 ]]
        -- upvalues: v43 (copy), l_Tile_0 (ref), v51 (copy), l_PresenceTypes_0 (ref)
        if v43.item.tileType == l_Tile_0.Recommendation then
            return v51.suggestedLabel;
        elseif v43.item.presence and v43.item.presence.userPresenceType == l_PresenceTypes_0.InGame then
            return v43.item.presence.lastLocation;
        else
            return nil;
        end;
    end, {
        v43.item
    });
    v6.useEffect(function() --[[ Line: 245 ]]
        -- upvalues: v49 (copy), v44 (copy), v43 (copy)
        if v49.unifiedLogging then
            v49.unifiedLogging.tagTileForImpressions(v44, v43.index);
        end;
    end, {
        v43.index
    });
    v6.useEffect(function() --[[ Line: 251 ]]
        -- upvalues: v49 (copy), v32 (ref), v38 (ref), v50 (copy), v43 (copy)
        v49.onSuccessfulRender(v32.ANALYTICS.UI_LOADING_EVENTS.CAROUSEL_FRIEND);
        if v38 then
            v50.userSeen(v43.item, {
                absolutePosition = v43.index
            });
        end;
    end, {});
    v6.useEffect(function() --[[ Line: 260 ]]
        -- upvalues: v43 (copy)
        if v43.onTileContentChanged then
            v43.onTileContentChanged(v43.item.id, v43.index);
        end;
    end, {
        v43.item.id, 
        v43.index
    });
    if l_FFlagEnableDesktopGameJoinCard_0 then
        local v74, v75 = v6.useState(false);
        local v76, v77 = v6.useState(false);
        local v79 = v6.useCallback(function(v78) --[[ Line: 269 ]]
            -- upvalues: v75 (copy), l_ControlState_0 (ref)
            v75(v78 == l_ControlState_0.Hover);
        end, {});
        local v81 = v6.useCallback(function(v80) --[[ Line: 272 ]]
            -- upvalues: v77 (copy), l_ControlState_0 (ref)
            v77(v80 == l_ControlState_0.Hover);
        end, {});
        local l_presence_0 = v43.item.presence;
        local v83 = l_presence_0 and l_presence_0.userPresenceType == l_PresenceTypes_0.InGame;
        local v84 = (not not v74 or v76) and v83 and v52 ~= nil;
        local v85 = v6.createElement(v31, v2.Dictionary.join(v43, {
            itemSize = UDim2.fromScale(1, 1), 
            onActivated = v72, 
            name = if v43.item.tileType == l_Tile_0.Recommendation then v54 else v53, 
            contextualText = v73, 
            tileRef = v44, 
            titleIcon = if v43.item.tileType == l_Tile_0.Recommendation then v35 else nil
        }));
        local v86 = l_presence_0 and l_presence_0.universeId or "";
        local v87 = l_presence_0 and l_presence_0.lastLocation or "";
        return v6.createElement(l_View_0, {
            Size = v43.itemSize, 
            LayoutOrder = v43.index, 
            BackgroundTransparency = 1, 
            ref = v44, 
            onStateChanged = v79, 
            stateLayer = {
                affordance = v3.Enums.StateLayerAffordance.None
            }
        }, {
            UserTile = v85, 
            GameJoinCardPopover = if v52 then v6.createElement(l_DesktopGameJoinCardContainer_0, {
                layoutOrder = 1, 
                playerName = v53 or "", 
                universeId = v86, 
                experienceName = v87, 
                userId = v43.item.id, 
                anchorRef = v44, 
                isOpen = v84 == true, 
                onPopoverStateChanged = v81
            }) else nil
        });
    else
        return v6.createElement(v31, v2.Dictionary.join(v43, {
            onActivated = v72, 
            name = if v43.item.tileType == l_Tile_0.Recommendation then v54 else v53, 
            contextualText = v73, 
            tileRef = v44, 
            titleIcon = if v43.item.tileType == l_Tile_0.Recommendation then v35 else nil
        }));
    end;
end;