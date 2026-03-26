local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.PlayerContextualMenu);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Responsive);
local v6 = require(l_Parent_0.RobloxAppEnums);
local v7 = require(l_Parent_0.UserProfiles);
local v8 = require(l_Parent_0.SocialCommon);
local l_Enums_0 = require(l_Parent_0.FriendsNetworking).Enums;
local l_FFlagSocialCarouselUseProfileStore_0 = require(l_script_FirstAncestor_0.Flags).FFlagSocialCarouselUseProfileStore;
local v11 = require(l_Parent_0.Signals);
local v12 = require(l_Parent_0.SignalsReact);
local v13 = v7.Stores.UserProfileStore.get();
local l_PresenceTypes_0 = v8.Enums.PresenceTypes;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_Enums_1 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums;
local v17 = require(l_script_FirstAncestor_0.Common.Enums);
local v18 = require(l_Parent_0.Localization);
local v19 = require(l_script_FirstAncestor_0.Analytics.useSocialCarouselAnalytics);
local l_usePreferredInput_0 = v5.usePreferredInput;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_CentralOverlayType_0 = v6.CentralOverlayType;
local l_AppPage_0 = v6.AppPage;
local l_useLocalization_0 = v18.Hooks.useLocalization;
local l_Tile_0 = v17.Tile;
local v27 = require(script.Parent.UserTile);
local v28 = require(l_script_FirstAncestor_0.Common.Constants);
local v29 = require(l_script_FirstAncestor_0.Contexts.useSocialCarouselContext);
local v30 = game:DefineFastString("SocialCarouselVendorImagePath", "rbxasset://textures/ui/Shell/Icons/PlatformLogo.png");
local l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 = require(l_Parent_0.SharedFlags).FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel;
local l_FFlagPPVEnabledOnConsole_0 = require(l_Parent_0.SharedFlags).FFlagPPVEnabledOnConsole;
local v33 = require(l_script_FirstAncestor_0.Flags.FFlagSocialCarouselEnableUserSeenEvents);
local l_FFlagEnableMobileGameJoinCard_0 = require(l_Parent_0.SharedFlags).FFlagEnableMobileGameJoinCard;
local function _(v35) --[[ Line: 73 ]]
    -- upvalues: l_Tile_0 (copy)
    if v35.tileType ~= l_Tile_0.Recommendation then
        return Enum.FriendStatus.Friend;
    elseif v35.isFriendWithUser then
        return Enum.FriendStatus.Friend;
    elseif v35.hasIncomingFriendRequest then
        return Enum.FriendStatus.FriendRequestReceived;
    elseif v35.hasPendingFriendRequest then
        return Enum.FriendStatus.FriendRequestSent;
    else
        return Enum.FriendStatus.NotFriend;
    end;
end;
return function(v37) --[[ Line: 89 ]]
    -- upvalues: v4 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_FFlagEnableMobileGameJoinCard_0 (copy), l_usePreferredInput_0 (copy), l_FFlagPPVEnabledOnConsole_0 (copy), v5 (copy), v29 (copy), v19 (copy), l_useLocalization_0 (copy), l_FFlagSocialCarouselUseProfileStore_0 (copy), v13 (copy), v11 (copy), v12 (copy), v7 (copy), v3 (copy), l_Tile_0 (copy), l_Enums_0 (copy), l_PresenceTypes_0 (copy), l_AppPage_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), v17 (copy), l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (copy), l_Enums_1 (copy), v28 (copy), v33 (copy), v27 (copy), v2 (copy), v30 (copy)
    local v38 = v4.useRef(nil);
    local v39 = l_useDispatch_0();
    local v40 = l_useNavigation_0();
    local v41 = if l_FFlagEnableMobileGameJoinCard_0 then l_usePreferredInput_0() else nil;
    local v42 = nil;
    if not l_FFlagPPVEnabledOnConsole_0 then
        v42 = (if l_FFlagEnableMobileGameJoinCard_0 then v41 else l_usePreferredInput_0()) == v5.Input.Directional;
    end;
    local v43 = v29();
    local v44 = v19();
    local v45 = l_useLocalization_0({
        suggestedLabel = "Feature.Friends.Label.Suggested"
    });
    local v46 = if v37.item.presence then {
        locationString = v37.item.presence.lastLocation, 
        locationPlaceId = v37.item.presence.placeId, 
        locationRootPlaceId = v37.item.presence.rootPlaceId, 
        locationUniverseId = v37.item.presence.universeId, 
        status = v37.item.presence.userPresenceType
    } else nil;
    local v47 = nil;
    local v48 = nil;
    if l_FFlagSocialCarouselUseProfileStore_0 then
        local v49 = v4.useMemo(function() --[[ Line: 119 ]]
            -- upvalues: v13 (ref), v37 (copy)
            return v13.fetchNamesByUserIds({
                v37.item.id
            });
        end, {
            v37.item.id
        });
        local l_v49_0 = v49 --[[ copy: 12 -> 16 ]];
        local v54 = v4.useMemo(function() --[[ Line: 123 ]]
            -- upvalues: v11 (ref), l_v49_0 (copy)
            return v11.createComputed(function(v51) --[[ Line: 124 ]]
                -- upvalues: l_v49_0 (ref)
                local v52 = l_v49_0(v51);
                local v53 = v52 and v52.data and v52.data[1];
                if v53 and v53.names then
                    return (v53.names.getCombinedName(v51));
                else
                    return nil;
                end;
            end);
        end, {
            v49
        });
        local v58 = v4.useMemo(function() --[[ Line: 131 ]]
            -- upvalues: v11 (ref), l_v49_0 (copy)
            return v11.createComputed(function(v55) --[[ Line: 132 ]]
                -- upvalues: l_v49_0 (ref)
                local v56 = l_v49_0(v55);
                local v57 = v56 and v56.data and v56.data[1];
                if v57 and v57.names then
                    return (v57.names.getPlatformName(v55));
                else
                    return nil;
                end;
            end);
        end, {
            v49
        });
        v47 = v12.useSignalState(v54);
        v48 = v12.useSignalState(v58);
    else
        local v59 = v7.Hooks.useUserProfilesFetch({
            userIds = {
                v37.item.id
            }, 
            query = v7.Queries.userProfilesCombinedAndPlatformByUserIds
        });
        local l_v59_0 = v59 --[[ copy: 12 -> 15 ]];
        v47 = v4.useMemo(function() --[[ Line: 147 ]]
            -- upvalues: l_v59_0 (copy), v7 (ref), v37 (copy)
            if not l_v59_0.data then
                return nil;
            else
                return v7.Selectors.getCombinedNameFromId(l_v59_0.data, v37.item.id);
            end;
        end, {
            v59.data
        });
        v48 = v4.useMemo(function() --[[ Line: 155 ]]
            -- upvalues: l_v59_0 (copy), v7 (ref), v37 (copy)
            if not l_v59_0.data then
                return nil;
            else
                return v7.Selectors.getPlatformNameFromId(l_v59_0.data, v37.item.id);
            end;
        end, {
            v59.data
        });
    end;
    local v66 = v4.useCallback(function(v61) --[[ Line: 164 ]]
        -- upvalues: v37 (copy), l_FFlagPPVEnabledOnConsole_0 (ref), v42 (ref), v39 (copy), v3 (ref), v46 (copy), l_Tile_0 (ref), l_Enums_0 (ref), l_PresenceTypes_0 (ref), l_FFlagEnableMobileGameJoinCard_0 (ref), v41 (copy), v5 (ref), v40 (copy), l_AppPage_0 (ref), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v47 (ref), v17 (ref), l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (ref), l_Enums_1 (ref), v44 (copy)
        if v37.item.onActivated then
            v37.item.onActivated(v37.item);
        elseif not l_FFlagPPVEnabledOnConsole_0 and v42 then
            local l_v39_0 = v39;
            local l_openPlayerContextualMenu_0 = v3.openPlayerContextualMenu;
            local v64 = {
                subjectUserId = v37.item.id, 
                subjectPresence = v46
            };
            local l_item_0 = v37.item;
            v64.robloxFriendshipStatus = if l_item_0.tileType ~= l_Tile_0.Recommendation then Enum.FriendStatus.Friend else if l_item_0.isFriendWithUser then Enum.FriendStatus.Friend else if l_item_0.hasIncomingFriendRequest then Enum.FriendStatus.FriendRequestReceived else if l_item_0.hasPendingFriendRequest then Enum.FriendStatus.FriendRequestSent else Enum.FriendStatus.NotFriend;
            v64.friendshipOriginSourceType = l_Enums_0.FriendshipOriginSourceType.FriendRecommendations.rawValue();
            l_v39_0(l_openPlayerContextualMenu_0(v64));
        elseif v37.item.presence and v37.item.presence.userPresenceType == l_PresenceTypes_0.InGame then
            if l_FFlagEnableMobileGameJoinCard_0 and v41 == v5.Input.Touch then
                v40.navigate(l_AppPage_0.GameJoinCard);
            else
                v39(l_SetCentralOverlay_0(l_CentralOverlayType_0.PeopleList, {
                    user = {
                        id = v37.item.id, 
                        combinedName = v47, 
                        presence = v17.OldPresence.IN_GAME, 
                        universeId = v37.item.presence.universeId, 
                        rootPlaceId = if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then v37.item.presence.rootPlaceId else nil, 
                        placeId = if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then v37.item.presence.placeId else nil, 
                        gameInstanceId = v37.item.presence.gameId, 
                        lastLocation = v37.item.presence.lastLocation
                    }, 
                    positionIndex = v37.index, 
                    absolutePosition = v37.index, 
                    anchorSpaceSize = v61.AbsoluteSize, 
                    anchorSpacePosition = v61.AbsolutePosition, 
                    source = l_Enums_1.Sources.HomePageFriendsCarousel
                }));
            end;
        else
            v40.navigate(l_AppPage_0.ProfilePlatform, {
                detail = v37.item.id, 
                extraProps = {
                    source = l_Enums_1.Sources.HomePageFriendsCarousel
                }
            });
        end;
        v44.userPressed(v37.item, {
            absolutePosition = v37.index
        });
    end, {
        v37.item
    });
    local v67 = v4.useMemo(function() --[[ Line: 218 ]]
        -- upvalues: v37 (copy), l_Tile_0 (ref), v45 (copy), l_PresenceTypes_0 (ref)
        if v37.item.tileType == l_Tile_0.Recommendation then
            return v45.suggestedLabel;
        elseif v37.item.presence and v37.item.presence.userPresenceType == l_PresenceTypes_0.InGame then
            return v37.item.presence.lastLocation;
        else
            return nil;
        end;
    end, {
        v37.item
    });
    v4.useEffect(function() --[[ Line: 227 ]]
        -- upvalues: v43 (copy), v38 (copy), v37 (copy)
        if v43.unifiedLogging then
            v43.unifiedLogging.tagTileForImpressions(v38, v37.index);
        end;
    end, {
        v37.index
    });
    v4.useEffect(function() --[[ Line: 233 ]]
        -- upvalues: v43 (copy), v28 (ref), v33 (ref), v44 (copy), v37 (copy)
        v43.onSuccessfulRender(v28.ANALYTICS.UI_LOADING_EVENTS.CAROUSEL_FRIEND);
        if v33 then
            v44.userSeen(v37.item, {
                absolutePosition = v37.index
            });
        end;
    end, {});
    v4.useEffect(function() --[[ Line: 242 ]]
        -- upvalues: v37 (copy)
        if v37.onTileContentChanged then
            v37.onTileContentChanged(v37.item.id, v37.index);
        end;
    end, {
        v37.item.id, 
        v37.index
    });
    return v4.createElement(v27, v2.Dictionary.join(v37, {
        onActivated = v66, 
        name = if v37.item.tileType == l_Tile_0.Recommendation then v48 else v47, 
        contextualText = v67, 
        tileRef = v38, 
        titleIcon = if v37.item.tileType == l_Tile_0.Recommendation then v30 else nil
    }));
end;