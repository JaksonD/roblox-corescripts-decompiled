local l_script_FirstAncestor_0 = script:FindFirstAncestor("AddFriends");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.CentralOverlay);
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local v4 = require(l_Parent_0.FocusNavigationUtils);
local l_Enums_0 = require(l_Parent_0.FriendsNetworking).Enums;
local _ = require(l_Parent_0.PlayerContextualMenu);
local v7 = require(l_Parent_0.ToastRodux);
local v8 = require(l_Parent_0.React);
local v9 = require(l_Parent_0.ReactFocusNavigation);
local v10 = require(l_Parent_0.Responsive);
local v11 = require(l_Parent_0.RoactUtils);
local v12 = require(l_Parent_0.SocialCommon);
local v13 = require(l_Parent_0.SocialLuaAnalytics);
local v14 = require(l_Parent_0.UIBlox);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v16 = require(l_Parent_0.UserProfiles);
local l_useImpressionsTagger_0 = require(l_Parent_0.Impressions).useImpressionsTagger;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v20 = require(l_Parent_0.RobloxAppEnums);
local l_View_0 = require(l_Parent_0.Foundation).View;
local l_Contexts_0 = v13.Analytics.Enums.Contexts;
local l_dependencyArray_0 = v11.Hooks.dependencyArray;
local l_FriendshipOriginSourceType_0 = l_Enums_0.FriendshipOriginSourceType;
local l_OpenTypeSupport_0 = v14.Utility.OpenTypeSupport;
local l_PlayerTile_0 = v14.App.Tile.PlayerTile;
local l_SetCentralOverlay_0 = v2.Actions.SetCentralOverlay;
local l_useSelector_0 = v11.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v11.Hooks.RoactRodux.useDispatch;
local l_useFocusGuiObject_0 = v9.useFocusGuiObject;
local l_usePreferredInput_0 = v10.usePreferredInput;
local l_convertUserPresenceTypeToString_0 = v12.Utils.convertUserPresenceTypeToString;
local l_useStyle_0 = v14.Core.Style.useStyle;
local l_Images_0 = v14.App.ImageSet.Images;
local l_AppPage_0 = v20.AppPage;
local v36 = require(l_Parent_0.AddFriendsState);
local l_AddFriendsSelector_0 = v36.AddFriendsSelector;
local l_RecommendationContextType_0 = v36.RoduxFriends.Enums.RecommendationContextType;
local v39 = require(l_script_FirstAncestor_0.Common.Constants);
local l_PresenceType_0 = v36.RoduxPresence.Enums.PresenceType;
local l_FriendsNetworking_0 = v36.Networking.FriendsNetworking;
local v42 = require(l_script_FirstAncestor_0.Analytics.useFireAnalyticsEvent);
local v43 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v43.EventNames;
local l_Namespaces_0 = v43.Namespaces;
local l_EntityTypes_0 = v13.Analytics.Enums.EntityTypes;
local l_getSessionIdByKey_0 = v36.RoduxAnalytics.Selectors.getSessionIdByKey;
local v48 = require(script.Parent.getFooterRelevanceInfo);
local v49 = require(script.Parent.getOverlayButtons);
local _ = require(script.Parent.getFriendRequestHandlersExtraProps);
local l_UserTileEventHandlers_0 = require(l_Parent_0.UserTile).UserTileEventHandlers;
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local l_useLastInputMode_0 = v4.useLastInputMode;
local v54 = require(l_Parent_0.UserList);
local l_FFlagPPVEnabledOnConsole_0 = require(l_Parent_0.SharedFlags).FFlagPPVEnabledOnConsole;
local l_FFlagAddFriendsPYMKPresence_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsPYMKPresence;
local l_FFlagAddFriendsPYMKPresenceAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsPYMKPresenceAnalytics;
local l_FFlagAddFriendsRenderTileRefactor_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsRenderTileRefactor;
local l_FFlagAddFriendsUserListEnabled_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsUserListEnabled;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
return function(v61) --[[ Line: 116 ]] --[[ Name: AddFriendsTile ]]
    -- upvalues: l_useDispatch_0 (copy), l_useFocusGuiObject_0 (copy), l_useLastInputMode_0 (copy), l_useStyle_0 (copy), l_FFlagPPVEnabledOnConsole_0 (copy), l_usePreferredInput_0 (copy), v8 (copy), v10 (copy), l_dependencyArray_0 (copy), l_useImpressionsTagger_0 (copy), l_FFlagAddFriendsRenderTileRefactor_0 (copy), v54 (copy), l_RecommendationContextType_0 (copy), l_useLocalUserId_0 (copy), l_useSelector_0 (copy), l_AddFriendsSelector_0 (copy), l_FFlagAddFriendsPYMKPresence_0 (copy), l_getSessionIdByKey_0 (copy), v39 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v48 (copy), v42 (copy), l_EntityTypes_0 (copy), l_Namespaces_0 (copy), l_FFlagAddFriendsPYMKPresenceAnalytics_0 (copy), v7 (copy), l_EventNames_0 (copy), l_FriendsNetworking_0 (copy), l_Images_0 (copy), l_FriendshipOriginSourceType_0 (copy), l_useNavigation_0 (copy), l_AppPage_0 (copy), l_Contexts_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_convertUserPresenceTypeToString_0 (copy), l_FFlagAddFriendsUserListEnabled_0 (copy), v16 (copy), v12 (copy), l_PresenceType_0 (copy), v49 (copy), l_View_0 (copy), l_UserTileEventHandlers_0 (copy), l_PlayerTile_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy)
    local v62 = l_useDispatch_0();
    local v63 = l_useFocusGuiObject_0();
    local v64 = l_useLastInputMode_0();
    local v65 = l_useStyle_0();
    local v66 = nil;
    if not l_FFlagPPVEnabledOnConsole_0 then
        v66 = l_usePreferredInput_0();
    end;
    local v67 = v8.useRef(nil);
    local v68 = v10.usePreferredInput() == v10.Input.Directional;
    local v70 = v8.useCallback(function() --[[ Line: 130 ]]
        -- upvalues: v61 (copy), v64 (copy), v67 (copy), v63 (copy)
        if v61.selected and v64 == "Focus" then
            local l_current_0 = v67.current;
            if l_current_0 then
                v63(l_current_0);
            end;
        end;
    end, l_dependencyArray_0(v61.selected, v64, v67, v63));
    v8.useEffect(function() --[[ Line: 139 ]]
        -- upvalues: v70 (copy)
        v70();
    end, {});
    l_useImpressionsTagger_0(v67, v61.impressionsTag, v61.position);
    local v71 = if l_FFlagAddFriendsRenderTileRefactor_0 then v61.user.type == v54.Enums.EntityType.Contact else v61.user.contextType and v61.user.contextType == l_RecommendationContextType_0.Contacts;
    local v72 = l_useLocalUserId_0();
    local v74 = l_useSelector_0(function(v73) --[[ Line: 151 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v61 (copy)
        return l_AddFriendsSelector_0(v73, "Friends.friendshipStatus.%s", v61.user.id) or nil;
    end);
    local v76 = l_useSelector_0(function(v75) --[[ Line: 157 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v61 (copy)
        return (l_AddFriendsSelector_0(v75, "RequestsFromOriginSourceType") or {})[v61.user.id];
    end);
    local v79 = l_useSelector_0(function(v77) --[[ Line: 162 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v61 (copy)
        local v78 = (l_AddFriendsSelector_0(v77, "Friends.requests.sourceUniverseIds") or {})[v61.user.id];
        if v78 ~= nil and v78 ~= 0 then
            return (l_AddFriendsSelector_0(v77, "Games.byGameId.%s", (tostring(v78))) or {}).name;
        else
            return nil;
        end;
    end);
    local v81 = if l_FFlagAddFriendsRenderTileRefactor_0 then l_useSelector_0(function(v80) --[[ Line: 174 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v61 (copy)
        return l_AddFriendsSelector_0(v80, "Friends.requests.mutualFriends.%s", v61.user.id) or {};
    end) else nil;
    local v83 = if l_FFlagAddFriendsRenderTileRefactor_0 then l_useSelector_0(function(v82) --[[ Line: 180 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v61 (copy)
        return l_AddFriendsSelector_0(v82, "Friends.contactNamesByUserId.%s", v61.user.id);
    end) else nil;
    local v86 = l_useSelector_0(function(v84) --[[ Line: 185 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v61 (copy)
        local v85 = l_AddFriendsSelector_0(v84, "IsUserFollowing") or {};
        return v85[v61.user.id] and v85[v61.user.id].isFollowing or false;
    end);
    local v89 = l_useSelector_0(function(v87) --[[ Line: 190 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v61 (copy)
        local v88 = l_AddFriendsSelector_0(v87, "IsUserFollowing") or {};
        return v88[v61.user.id] and v88[v61.user.id].isFollowed or false;
    end);
    local v91 = l_useSelector_0(function(v90) --[[ Line: 196 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v61 (copy)
        return l_AddFriendsSelector_0(v90, "Friends.recommendations.hasIncomingFriendRequest.%s", v61.user.id) or false;
    end);
    local v93 = if l_FFlagAddFriendsRenderTileRefactor_0 then l_useSelector_0(function(v92) --[[ Line: 201 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v72 (copy), v61 (copy)
        return l_AddFriendsSelector_0(v92, "Friends.recommendations.byUserId.%s.%s", v72, v61.user.id) or {};
    end) else nil;
    local v94 = if l_FFlagAddFriendsRenderTileRefactor_0 then v93.contextType else nil;
    local v95 = if l_FFlagAddFriendsRenderTileRefactor_0 then v93.mutualFriendsCount else nil;
    local v96 = if l_FFlagAddFriendsRenderTileRefactor_0 then v93.rank else nil;
    local v98 = if l_FFlagAddFriendsPYMKPresence_0 then l_useSelector_0(function(v97) --[[ Line: 211 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v61 (copy)
        return l_AddFriendsSelector_0(v97, "Presence.byUserId.%s", v61.user.id) or nil;
    end) else nil;
    local v100 = l_useSelector_0(function(v99) --[[ Line: 216 ]]
        -- upvalues: l_getSessionIdByKey_0 (ref), v39 (ref)
        return l_getSessionIdByKey_0(v99)(v39.RECOMMENDATION_SESSION_ID_KEY);
    end);
    local v101 = l_useLocalization_0({
        mutualFriendsText = if l_FFlagAddFriendsRenderTileRefactor_0 then nil else v61.user.mutualFriends and #v61.user.mutualFriends == 1 and "Feature.Friends.Label.SingularMutualFriend" or "Feature.Friends.Label.MutualFriends", 
        sentFromWithContextText = {
            "Feature.Friends.Label.SentFromWithContext"; 
            gameName = v79 or ""
        }, 
        youAreFollowingText = "Feature.Friends.Label.YouAreFollowing", 
        followsYouText = "Feature.Friends.Label.FollowsYou", 
        fromContactsText = "Feature.Friends.Description.FoundFromContactImporter", 
        contactNameText = if if l_FFlagAddFriendsRenderTileRefactor_0 then v83 else v61.user.contactName then {
            "Feature.Friends.Description.FromContactsV2"; 
            contactName = if l_FFlagAddFriendsRenderTileRefactor_0 then v83 else v61.user.contactName
        } else nil, 
        singularMutualConnection = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.MutualFriendTitle" or "Feature.Friends.Label.MutualConnection", 
        mutualConnections = {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.MutualFriendsTitle" or "Feature.Friends.Label.MutualConnections"; 
            numConnections = if l_FFlagAddFriendsRenderTileRefactor_0 then v95 or v81 and #v81 else v61.user.mutualFriendsCount or v61.user.mutualFriends and #v61.user.mutualFriends
        }, 
        foundThroughQRCode = "Feature.Profile.Label.QRCodeFriendRequest", 
        connectionRequests = "Feature.Friends.Label.ConnectionRequest", 
        frequents = "Feature.Friends.Label.Frequent", 
        fromContacts = "Feature.Friends.Description.FromContacts"
    });
    local v102, v103 = v8.useMemo(function() --[[ Line: 262 ]]
        -- upvalues: v48 (ref), l_FFlagAddFriendsRenderTileRefactor_0 (ref), v81 (copy), v61 (copy), v89 (copy), v86 (copy), v79 (copy), v76 (copy), v94 (copy), v95 (copy), v91 (copy), v65 (copy), v101 (copy)
        return v48({
            mutualFriends = if l_FFlagAddFriendsRenderTileRefactor_0 then v81 else v61.user.mutualFriends, 
            isUserFollowingMe = v89, 
            amIFollowingUser = v86, 
            sentFromExperienceName = v79, 
            isFriendRequest = v61.isFriendRequest or false, 
            isRecommendation = v61.isRecommendation, 
            userPresenceType = if l_FFlagAddFriendsRenderTileRefactor_0 then nil else v61.user.userPresenceType, 
            lastLocation = if l_FFlagAddFriendsRenderTileRefactor_0 then nil else v61.user.lastLocation, 
            originSourceType = v76, 
            contextType = if l_FFlagAddFriendsRenderTileRefactor_0 then v94 else v61.user.contextType, 
            mutualFriendsCount = if l_FFlagAddFriendsRenderTileRefactor_0 then v95 else v61.user.mutualFriendsCount, 
            hasIncomingFriendRequest = v91
        }, v65, v101);
    end, l_dependencyArray_0(v61.user, v89, v86, v79, v61.isFriendRequest, v61.isRecommendation, v76, v91, if l_FFlagAddFriendsRenderTileRefactor_0 then v95 else nil, if l_FFlagAddFriendsRenderTileRefactor_0 then v81 else nil, if l_FFlagAddFriendsRenderTileRefactor_0 then v94 else nil, v65, v101));
    local v104 = v42({
        targetUserId = v61.user.id, 
        absolutePosition = v61.position, 
        rank = if l_FFlagAddFriendsRenderTileRefactor_0 then v96 else v61.user.rank, 
        contextType = v103, 
        entityType = if v71 then l_EntityTypes_0.Contact else nil, 
        namespace = if v61.isFriendRequest then l_Namespaces_0.FriendRequests else l_Namespaces_0.PYMK, 
        friendStatus = v74, 
        presence = if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then (v98 or {}).userPresenceType else nil
    });
    local v106 = v8.useCallback(function(v105) --[[ Line: 308 ]]
        -- upvalues: v62 (copy), v7 (ref)
        if not v105 then
            return;
        else
            v62(v7.Actions.SetCurrentToastMessage({
                toastMessage = v105.toastTitle, 
                toastIcon = v105.iconImage
            }));
            return;
        end;
    end, {
        v62
    });
    local v109 = v8.useCallback(function(v107, v108) --[[ Line: 319 ]]
        -- upvalues: v106 (copy)
        return v107:andThen(function() --[[ Line: 321 ]]
            -- upvalues: v106 (ref), v108 (copy)
            v106(v108);
        end):catch(function() --[[ Line: 324 ]]
            -- upvalues: v106 (ref)
            v106({
                toastTitle = "Feature.Toast.NetworkingError.SomethingIsWrong"
            });
        end);
    end, {
        v106
    });
    local v110 = v8.useCallback(function() --[[ Line: 329 ]]
        -- upvalues: v104 (copy), l_EventNames_0 (ref), v109 (copy), v62 (copy), l_FriendsNetworking_0 (ref), v72 (copy), v61 (copy), l_FFlagConnectionsToFriendsRename_0 (ref), l_Images_0 (ref)
        v104(l_EventNames_0.AcceptFriendshipBtnClick);
        return v109(v62(l_FriendsNetworking_0.AcceptFriendRequestFromUserId.API({
            currentUserId = v72, 
            targetUserId = v61.user.id
        })), {
            toastTitle = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Action.FriendAdded" or "Feature.Friends.Action.ConnectionAdded", 
            iconImage = l_Images_0["icons/actions/friends/friendAdd"]
        });
    end, {
        v61.user.id, 
        v72, 
        v62, 
        v109, 
        v104
    });
    local v111 = v8.useCallback(function() --[[ Line: 346 ]]
        -- upvalues: v104 (copy), l_EventNames_0 (ref), v109 (copy), v62 (copy), l_FriendsNetworking_0 (ref), v72 (copy), v61 (copy), l_Images_0 (ref)
        v104(l_EventNames_0.DeclineFriendshipBtnClick);
        return v109(v62(l_FriendsNetworking_0.DeclineFriendRequestFromUserId.API({
            currentUserId = v72, 
            targetUserId = v61.user.id
        })), {
            toastTitle = "Feature.AddFriends.Action.RequestIgnored", 
            iconImage = l_Images_0["icons/actions/reject"]
        });
    end, {
        v61.user.id, 
        v72, 
        v62, 
        v109, 
        v104
    });
    local v113 = v8.useCallback(function() --[[ Line: 362 ]]
        -- upvalues: v104 (copy), l_EventNames_0 (ref), v71 (copy), l_FriendsNetworking_0 (ref), v72 (copy), v61 (copy), l_FriendshipOriginSourceType_0 (ref), v109 (copy), v62 (copy), l_FFlagConnectionsToFriendsRename_0 (ref), l_Images_0 (ref)
        v104(l_EventNames_0.RequestFriendshipBtnClick);
        local v112 = if v71 then l_FriendsNetworking_0.RequestFriendshipFromContactId.API({
            currentUserId = v72, 
            contactId = v61.user.id
        }) else l_FriendsNetworking_0.RequestFriendshipFromUserId.API({
            currentUserId = v72, 
            targetUserId = v61.user.id, 
            friendshipOriginSourceType = if v61.isRecommendation then l_FriendshipOriginSourceType_0.FriendRecommendations.rawValue() else nil
        });
        return v109(v62(v112), {
            toastTitle = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Action.FriendRequestSent" or "Feature.Friends.Action.ConnectionRequestSent", 
            iconImage = l_Images_0["icons/actions/friends/friendAdd"]
        });
    end, {
        v71, 
        v61.isRecommendation, 
        v61.user.id, 
        v72, 
        v62, 
        v109, 
        v104
    });
    local v114 = l_useNavigation_0();
    local v115 = v8.useCallback(function() --[[ Line: 391 ]]
        -- upvalues: v104 (copy), l_EventNames_0 (ref), v114 (copy), l_AppPage_0 (ref), v61 (copy), v71 (copy), v100 (copy), l_FFlagAddFriendsRenderTileRefactor_0 (ref), v96 (copy), v74 (copy), v39 (ref), l_Contexts_0 (ref), v103 (copy), v102 (copy)
        v104(l_EventNames_0.PlayerTileClick);
        v114.navigate(l_AppPage_0.ProfilePlatform, {
            detail = v61.user.id, 
            extraProps = {
                profileType = v71 and "Contact" or nil, 
                recommendationSessionId = v100, 
                absolutePosition = v61.position, 
                rank = if l_FFlagAddFriendsRenderTileRefactor_0 then v96 else v61.user.rank, 
                isRecommendation = v61.isRecommendation, 
                isContact = v71, 
                contactProps = if v71 then {
                    contactId = v61.user.entityId, 
                    contactname = v61.user.entityDisplayName, 
                    avatarImageUrl = if l_FFlagAddFriendsRenderTileRefactor_0 then v61.user.thumbnailEntities and v61.user.thumbnailEntities.avatarImageUrl else v61.user.thumbnailEntities.avatarImageUrl
                } else nil, 
                friendStatus = v74, 
                source = if v61.isRecommendation then v39.AddFriendsPYMKSourceName else l_Contexts_0.AddFriends, 
                contextualInfoType = v103, 
                contextualInfoDisplay = if v61.isRecommendation then v102 else nil
            }
        });
    end, {
        v61.user, 
        v61.position, 
        v61.isRecommendation, 
        v74, 
        v100, 
        v71, 
        v114, 
        v103, 
        v102, 
        if l_FFlagAddFriendsRenderTileRefactor_0 then v96 else nil
    });
    local v117 = v8.useCallback(function() --[[ Line: 433 ]]
        -- upvalues: v61 (copy), v74 (copy), v62 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), l_convertUserPresenceTypeToString_0 (ref), l_FriendshipOriginSourceType_0 (ref)
        local v116 = if v61.isRecommendation then v74 or Enum.FriendStatus.NotFriend else Enum.FriendStatus.FriendRequestReceived;
        v62(l_SetCentralOverlay_0(l_CentralOverlayType_0.PlayerContextualMenu, {
            subjectUserId = v61.user.id, 
            contactId = v61.user.entityId, 
            contactName = v61.user.entityDisplayName, 
            recommendationContext = v61.user.contextType, 
            mutualFriendsCount = v61.user.mutualFriendsCount, 
            robloxFriendshipStatus = v116, 
            subjectPresence = {
                locationString = v61.user.lastLocation, 
                locationPlaceId = v61.user.placeId, 
                locationRootPlaceId = v61.user.rootPlaceId, 
                locationUniverseId = v61.user.universeId, 
                status = l_convertUserPresenceTypeToString_0(v61.user.userPresenceType)
            }, 
            friendshipOriginSourceType = if v61.isRecommendation then l_FriendshipOriginSourceType_0.FriendRecommendations.rawValue() else nil
        }));
    end, l_dependencyArray_0(v61.isRecommendation, v74, v61.user, v62));
    local v118 = v8.useCallback(function() --[[ Line: 462 ]]
        -- upvalues: l_FFlagPPVEnabledOnConsole_0 (ref), v66 (ref), v10 (ref), v117 (copy), v115 (copy)
        if not l_FFlagPPVEnabledOnConsole_0 and v66 == v10.Input.Directional then
            return v117();
        else
            v115();
            return;
        end;
    end, l_dependencyArray_0(if l_FFlagPPVEnabledOnConsole_0 then nil else v66, if l_FFlagPPVEnabledOnConsole_0 then nil else v117, v115));
    local v119 = nil;
    local v120 = nil;
    local v121 = nil;
    if not l_FFlagAddFriendsUserListEnabled_0 then
        local v122 = v16.Hooks.useUserProfilesFetch({
            userIds = {
                v61.user.id
            }, 
            query = v16.Queries.userProfilesCombinedNameAndUsernameByUserIds, 
            skip = v71
        });
        if v71 then
            v119 = v61.user.entityDisplayName;
            v120 = nil;
            v121 = if l_FFlagAddFriendsRenderTileRefactor_0 then v61.user.thumbnailEntities and v61.user.thumbnailEntities.avatarImageUrl else v61.user.thumbnailEntities.avatarImageUrl;
        else
            local v123 = "";
            local v124 = "";
            if v122 and v122.data then
                v123 = v16.Selectors.getCombinedNameFromId(v122.data, v61.user.id) or "";
                v124 = v16.Selectors.getUsernameFromId(v122.data, v61.user.id) or "";
            end;
            v119 = v123;
            v120 = if l_FFlagAddFriendsRenderTileRefactor_0 then "@" .. v124 else "@" .. (v61.user.externalAppDisplayName or v124);
            v121 = string.format("rbxthumb://type=Avatar&id=%s&w=720&h=720", (tostring(v61.user.id)));
        end;
    end;
    local v125 = nil;
    local v126 = nil;
    if l_FFlagAddFriendsPYMKPresence_0 then
        if l_FFlagAddFriendsUserListEnabled_0 then
            v126 = v8.useMemo(function() --[[ Line: 514 ]]
                -- upvalues: v98 (copy), v12 (ref)
                if v98 and v98.userPresenceType then
                    local v127 = tostring(v98.userPresenceType);
                    return (string.gsub(v127, "PresenceType%.", ""));
                else
                    return v12.Enums.PresenceTypes.Offline;
                end;
            end, {
                v98
            });
        else
            local v130 = v8.useMemo(function() --[[ Line: 522 ]]
                -- upvalues: v98 (copy), l_PresenceType_0 (ref)
                local v128 = v98 and v98.userPresenceType or nil;
                local v129 = true;
                if v128 ~= l_PresenceType_0.Online then
                    v129 = true;
                    if v128 ~= l_PresenceType_0.InStudio then
                        v129 = v128 == l_PresenceType_0.InGame;
                    end;
                end;
                return v129;
            end, {
                v98
            });
            local l_Color_0 = v65.Theme.OnlineStatus.Color;
            local l_l_Color_0_0 = l_Color_0 --[[ copy: 44 -> 46 ]];
            local l_v130_0 = v130 --[[ copy: 43 -> 47 ]];
            v125 = v8.useMemo(function() --[[ Line: 533 ]]
                -- upvalues: l_l_Color_0_0 (copy), l_v130_0 (copy), v119 (ref)
                local v134 = ("<font color=\"rgb(%*,%*,%*)\">\226\151\143 </font>"):format(math.round(l_l_Color_0_0.R * 255), math.round(l_l_Color_0_0.G * 255), (math.round(l_l_Color_0_0.B * 255)));
                if l_v130_0 then
                    return v134 .. v119;
                else
                    return v119;
                end;
            end, {
                v119, 
                v130, 
                l_Color_0
            });
        end;
    end;
    local v135 = v8.useMemo(function() --[[ Line: 545 ]]
        -- upvalues: v49 (ref), v61 (copy), v91 (copy), v74 (copy), v113 (copy), v110 (copy), v111 (copy), v68 (copy)
        return v49({
            isFriendRequest = v61.isFriendRequest or false, 
            hasIncomingFriendRequest = v91, 
            friendStatus = v74, 
            handleRequestFriendship = v113, 
            handleAcceptFriendRequest = v110, 
            handleDeclineFriendRequest = v111, 
            shouldAddFocusEventName = v68
        });
    end, l_dependencyArray_0(v61.isFriendRequest, v74, v113, v110, v111, v91, v68));
    if l_FFlagAddFriendsUserListEnabled_0 then
        local v136 = v135 and v135[#v135] or nil;
        local v137 = v135 and v135[#v135 - 1] or nil;
        return v8.createElement(l_View_0, {
            tag = "size-full-0 auto-y", 
            ref = v67
        }, {
            UserRow = v61.createRow({
                onRowActivated = v115, 
                primaryCta = v136 and {
                    type = v136.type, 
                    icon = v136.icon, 
                    isDisabled = v136.isDisabled, 
                    onActivated = v136.onActivated
                }, 
                secondaryCta = v137 and {
                    type = v137.type, 
                    icon = v137.icon, 
                    isDisabled = v137.isDisabled, 
                    onActivated = v137.onActivated
                }, 
                contextualInfo = v102 and {
                    text = v102.text, 
                    icon = v102.icon
                }, 
                presence = v126
            }), 
            UserTileEventHandlers = if v68 then v8.createElement(l_UserTileEventHandlers_0, {
                buttons = v135, 
                onTileActivated = v118, 
                tileRef = v67
            }) else nil
        });
    else
        return (v8.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.fromScale(1, 0.5), 
            Size = UDim2.new(0, v61.size.X, 0, v61.size.Y), 
            BackgroundTransparency = 1, 
            ZIndex = 1, 
            LayoutOrder = v61.layoutOrder
        }, {
            PlayerTile = v8.createElement(l_PlayerTile_0, {
                buttonRef = v67, 
                thumbnail = v121, 
                title = if l_FFlagAddFriendsPYMKPresence_0 then v125 else v119, 
                tileSize = UDim2.new(0, v61.size.X, 0, v61.size.Y), 
                subtitle = v120, 
                buttons = if v68 then nil else v135, 
                relevancyInfo = v102, 
                onActivated = v118, 
                Selectable = true, 
                openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil
            }), 
            UserTileEventHandlers = if v68 then v8.createElement(l_UserTileEventHandlers_0, {
                buttons = v135, 
                onTileActivated = v118, 
                tileRef = v67
            }) else nil
        }));
    end;
end;