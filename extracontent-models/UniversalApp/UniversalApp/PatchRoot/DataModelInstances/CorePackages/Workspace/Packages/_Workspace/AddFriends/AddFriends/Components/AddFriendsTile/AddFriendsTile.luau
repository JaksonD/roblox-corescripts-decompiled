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
local l_FFlagFriendsPageViewBtnWidth_0 = require(l_Parent_0.SharedFlags).FFlagFriendsPageViewBtnWidth;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v63) --[[ Line: 119 ]] --[[ Name: AddFriendsTile ]]
    -- upvalues: l_useDispatch_0 (copy), l_useFocusGuiObject_0 (copy), l_useLastInputMode_0 (copy), l_useStyle_0 (copy), l_FFlagPPVEnabledOnConsole_0 (copy), l_usePreferredInput_0 (copy), v8 (copy), v10 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useImpressionsTagger_0 (copy), l_FFlagAddFriendsRenderTileRefactor_0 (copy), v54 (copy), l_RecommendationContextType_0 (copy), l_useLocalUserId_0 (copy), l_useSelector_0 (copy), l_AddFriendsSelector_0 (copy), l_FFlagAddFriendsPYMKPresence_0 (copy), l_getSessionIdByKey_0 (copy), v39 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v48 (copy), v42 (copy), l_EntityTypes_0 (copy), l_Namespaces_0 (copy), l_FFlagAddFriendsPYMKPresenceAnalytics_0 (copy), v7 (copy), l_EventNames_0 (copy), l_FriendsNetworking_0 (copy), l_Images_0 (copy), l_FriendshipOriginSourceType_0 (copy), l_useNavigation_0 (copy), l_AppPage_0 (copy), l_Contexts_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_convertUserPresenceTypeToString_0 (copy), l_FFlagAddFriendsUserListEnabled_0 (copy), v16 (copy), v12 (copy), l_PresenceType_0 (copy), v49 (copy), l_View_0 (copy), l_FFlagFriendsPageViewBtnWidth_0 (copy), l_UserTileEventHandlers_0 (copy), l_PlayerTile_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy)
    local v64 = l_useDispatch_0();
    local v65 = l_useFocusGuiObject_0();
    local v66 = l_useLastInputMode_0();
    local v67 = l_useStyle_0();
    local v68 = nil;
    if not l_FFlagPPVEnabledOnConsole_0 then
        v68 = l_usePreferredInput_0();
    end;
    local v69 = v8.useRef(nil);
    local v70 = v10.usePreferredInput() == v10.Input.Directional;
    local v72 = v8.useCallback(function() --[[ Line: 134 ]]
        -- upvalues: v63 (copy), v66 (copy), v69 (copy), v65 (copy)
        if v63.selected and v66 == "Focus" then
            local l_current_0 = v69.current;
            if l_current_0 then
                v65(l_current_0);
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v63.selected, 
        v66, 
        v69, 
        v65
    } else l_dependencyArray_0(v63.selected, v66, v69, v65));
    v8.useEffect(function() --[[ Line: 147 ]]
        -- upvalues: v72 (copy)
        v72();
    end, {});
    l_useImpressionsTagger_0(v69, v63.impressionsTag, v63.position);
    local v73 = if l_FFlagAddFriendsRenderTileRefactor_0 then v63.user.type == v54.Enums.EntityType.Contact else v63.user.contextType and v63.user.contextType == l_RecommendationContextType_0.Contacts;
    local v74 = l_useLocalUserId_0();
    local v76 = l_useSelector_0(function(v75) --[[ Line: 159 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v63 (copy)
        return l_AddFriendsSelector_0(v75, "Friends.friendshipStatus.%s", v63.user.id) or nil;
    end);
    local v78 = l_useSelector_0(function(v77) --[[ Line: 165 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v63 (copy)
        return (l_AddFriendsSelector_0(v77, "RequestsFromOriginSourceType") or {})[v63.user.id];
    end);
    local v81 = l_useSelector_0(function(v79) --[[ Line: 170 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v63 (copy)
        local v80 = (l_AddFriendsSelector_0(v79, "Friends.requests.sourceUniverseIds") or {})[v63.user.id];
        if v80 ~= nil and v80 ~= 0 then
            return (l_AddFriendsSelector_0(v79, "Games.byGameId.%s", (tostring(v80))) or {}).name;
        else
            return nil;
        end;
    end);
    local v83 = if l_FFlagAddFriendsRenderTileRefactor_0 then l_useSelector_0(function(v82) --[[ Line: 182 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v63 (copy)
        return l_AddFriendsSelector_0(v82, "Friends.requests.mutualFriends.%s", v63.user.id) or {};
    end) else nil;
    local v85 = if l_FFlagAddFriendsRenderTileRefactor_0 then l_useSelector_0(function(v84) --[[ Line: 188 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v63 (copy)
        return l_AddFriendsSelector_0(v84, "Friends.contactNamesByUserId.%s", v63.user.id);
    end) else nil;
    local v88 = l_useSelector_0(function(v86) --[[ Line: 193 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v63 (copy)
        local v87 = l_AddFriendsSelector_0(v86, "IsUserFollowing") or {};
        return v87[v63.user.id] and v87[v63.user.id].isFollowing or false;
    end);
    local v91 = l_useSelector_0(function(v89) --[[ Line: 198 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v63 (copy)
        local v90 = l_AddFriendsSelector_0(v89, "IsUserFollowing") or {};
        return v90[v63.user.id] and v90[v63.user.id].isFollowed or false;
    end);
    local v93 = l_useSelector_0(function(v92) --[[ Line: 204 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v63 (copy)
        return l_AddFriendsSelector_0(v92, "Friends.recommendations.hasIncomingFriendRequest.%s", v63.user.id) or false;
    end);
    local v95 = if l_FFlagAddFriendsRenderTileRefactor_0 then l_useSelector_0(function(v94) --[[ Line: 209 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v74 (copy), v63 (copy)
        return l_AddFriendsSelector_0(v94, "Friends.recommendations.byUserId.%s.%s", v74, v63.user.id) or {};
    end) else nil;
    local v96 = if l_FFlagAddFriendsRenderTileRefactor_0 then v95.contextType else nil;
    local v97 = if l_FFlagAddFriendsRenderTileRefactor_0 then v95.mutualFriendsCount else nil;
    local v98 = if l_FFlagAddFriendsRenderTileRefactor_0 then v95.rank else nil;
    local v100 = if l_FFlagAddFriendsPYMKPresence_0 then l_useSelector_0(function(v99) --[[ Line: 219 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v63 (copy)
        return l_AddFriendsSelector_0(v99, "Presence.byUserId.%s", v63.user.id) or nil;
    end) else nil;
    local v102 = l_useSelector_0(function(v101) --[[ Line: 224 ]]
        -- upvalues: l_getSessionIdByKey_0 (ref), v39 (ref)
        return l_getSessionIdByKey_0(v101)(v39.RECOMMENDATION_SESSION_ID_KEY);
    end);
    local v103 = l_useLocalization_0({
        mutualFriendsText = if l_FFlagAddFriendsRenderTileRefactor_0 then nil else v63.user.mutualFriends and #v63.user.mutualFriends == 1 and "Feature.Friends.Label.SingularMutualFriend" or "Feature.Friends.Label.MutualFriends", 
        sentFromWithContextText = {
            "Feature.Friends.Label.SentFromWithContext"; 
            gameName = v81 or ""
        }, 
        youAreFollowingText = "Feature.Friends.Label.YouAreFollowing", 
        followsYouText = "Feature.Friends.Label.FollowsYou", 
        fromContactsText = "Feature.Friends.Description.FoundFromContactImporter", 
        contactNameText = if if l_FFlagAddFriendsRenderTileRefactor_0 then v85 else v63.user.contactName then {
            "Feature.Friends.Description.FromContactsV2"; 
            contactName = if l_FFlagAddFriendsRenderTileRefactor_0 then v85 else v63.user.contactName
        } else nil, 
        singularMutualConnection = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.MutualFriendTitle" or "Feature.Friends.Label.MutualConnection", 
        mutualConnections = {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Label.MutualFriendsTitle" or "Feature.Friends.Label.MutualConnections"; 
            numConnections = if l_FFlagAddFriendsRenderTileRefactor_0 then v97 or v83 and #v83 else v63.user.mutualFriendsCount or v63.user.mutualFriends and #v63.user.mutualFriends
        }, 
        foundThroughQRCode = "Feature.Profile.Label.QRCodeFriendRequest", 
        connectionRequests = "Feature.Friends.Label.ConnectionRequest", 
        frequents = "Feature.Friends.Label.Frequent", 
        fromContacts = "Feature.Friends.Description.FromContacts"
    });
    local v104, v105 = v8.useMemo(function() --[[ Line: 270 ]]
        -- upvalues: v48 (ref), l_FFlagAddFriendsRenderTileRefactor_0 (ref), v83 (copy), v63 (copy), v91 (copy), v88 (copy), v81 (copy), v78 (copy), v96 (copy), v97 (copy), v93 (copy), v67 (copy), v103 (copy)
        return v48({
            mutualFriends = if l_FFlagAddFriendsRenderTileRefactor_0 then v83 else v63.user.mutualFriends, 
            isUserFollowingMe = v91, 
            amIFollowingUser = v88, 
            sentFromExperienceName = v81, 
            isFriendRequest = v63.isFriendRequest or false, 
            isRecommendation = v63.isRecommendation, 
            userPresenceType = if l_FFlagAddFriendsRenderTileRefactor_0 then nil else v63.user.userPresenceType, 
            lastLocation = if l_FFlagAddFriendsRenderTileRefactor_0 then nil else v63.user.lastLocation, 
            originSourceType = v78, 
            contextType = if l_FFlagAddFriendsRenderTileRefactor_0 then v96 else v63.user.contextType, 
            mutualFriendsCount = if l_FFlagAddFriendsRenderTileRefactor_0 then v97 else v63.user.mutualFriendsCount, 
            hasIncomingFriendRequest = v93
        }, v67, v103);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v63.user, 
        v91, 
        v88, 
        v81, 
        v63.isFriendRequest, 
        v63.isRecommendation, 
        v78, 
        v93, 
        if l_FFlagAddFriendsRenderTileRefactor_0 then v97 else nil, 
        if l_FFlagAddFriendsRenderTileRefactor_0 then v83 else nil, 
        if l_FFlagAddFriendsRenderTileRefactor_0 then v96 else nil, 
        v67, 
        v103
    } else l_dependencyArray_0(v63.user, v91, v88, v81, v63.isFriendRequest, v63.isRecommendation, v78, v93, if l_FFlagAddFriendsRenderTileRefactor_0 then v97 else nil, if l_FFlagAddFriendsRenderTileRefactor_0 then v83 else nil, if l_FFlagAddFriendsRenderTileRefactor_0 then v96 else nil, v67, v103));
    local v106 = v42({
        targetUserId = v63.user.id, 
        absolutePosition = v63.position, 
        rank = if l_FFlagAddFriendsRenderTileRefactor_0 then v98 else v63.user.rank, 
        contextType = v105, 
        entityType = if v73 then l_EntityTypes_0.Contact else nil, 
        namespace = if v63.isFriendRequest then l_Namespaces_0.FriendRequests else l_Namespaces_0.PYMK, 
        friendStatus = v76, 
        presence = if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then (v100 or {}).userPresenceType else nil
    });
    local v108 = v8.useCallback(function(v107) --[[ Line: 332 ]]
        -- upvalues: v64 (copy), v7 (ref)
        if not v107 then
            return;
        else
            v64(v7.Actions.SetCurrentToastMessage({
                toastMessage = v107.toastTitle, 
                toastIcon = v107.iconImage
            }));
            return;
        end;
    end, {
        v64
    });
    local v111 = v8.useCallback(function(v109, v110) --[[ Line: 343 ]]
        -- upvalues: v108 (copy)
        return v109:andThen(function() --[[ Line: 345 ]]
            -- upvalues: v108 (ref), v110 (copy)
            v108(v110);
        end):catch(function() --[[ Line: 348 ]]
            -- upvalues: v108 (ref)
            v108({
                toastTitle = "Feature.Toast.NetworkingError.SomethingIsWrong"
            });
        end);
    end, {
        v108
    });
    local v112 = v8.useCallback(function() --[[ Line: 353 ]]
        -- upvalues: v106 (copy), l_EventNames_0 (ref), v111 (copy), v64 (copy), l_FriendsNetworking_0 (ref), v74 (copy), v63 (copy), l_FFlagConnectionsToFriendsRename_0 (ref), l_Images_0 (ref)
        v106(l_EventNames_0.AcceptFriendshipBtnClick);
        return v111(v64(l_FriendsNetworking_0.AcceptFriendRequestFromUserId.API({
            currentUserId = v74, 
            targetUserId = v63.user.id
        })), {
            toastTitle = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Action.FriendAdded" or "Feature.Friends.Action.ConnectionAdded", 
            iconImage = l_Images_0["icons/actions/friends/friendAdd"]
        });
    end, {
        v63.user.id, 
        v74, 
        v64, 
        v111, 
        v106
    });
    local v113 = v8.useCallback(function() --[[ Line: 370 ]]
        -- upvalues: v106 (copy), l_EventNames_0 (ref), v111 (copy), v64 (copy), l_FriendsNetworking_0 (ref), v74 (copy), v63 (copy), l_Images_0 (ref)
        v106(l_EventNames_0.DeclineFriendshipBtnClick);
        return v111(v64(l_FriendsNetworking_0.DeclineFriendRequestFromUserId.API({
            currentUserId = v74, 
            targetUserId = v63.user.id
        })), {
            toastTitle = "Feature.AddFriends.Action.RequestIgnored", 
            iconImage = l_Images_0["icons/actions/reject"]
        });
    end, {
        v63.user.id, 
        v74, 
        v64, 
        v111, 
        v106
    });
    local v115 = v8.useCallback(function() --[[ Line: 386 ]]
        -- upvalues: v106 (copy), l_EventNames_0 (ref), v73 (copy), l_FriendsNetworking_0 (ref), v74 (copy), v63 (copy), l_FriendshipOriginSourceType_0 (ref), v111 (copy), v64 (copy), l_FFlagConnectionsToFriendsRename_0 (ref), l_Images_0 (ref)
        v106(l_EventNames_0.RequestFriendshipBtnClick);
        local v114 = if v73 then l_FriendsNetworking_0.RequestFriendshipFromContactId.API({
            currentUserId = v74, 
            contactId = v63.user.id
        }) else l_FriendsNetworking_0.RequestFriendshipFromUserId.API({
            currentUserId = v74, 
            targetUserId = v63.user.id, 
            friendshipOriginSourceType = if v63.isRecommendation then l_FriendshipOriginSourceType_0.FriendRecommendations.rawValue() else nil
        });
        return v111(v64(v114), {
            toastTitle = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Action.FriendRequestSent" or "Feature.Friends.Action.ConnectionRequestSent", 
            iconImage = l_Images_0["icons/actions/friends/friendAdd"]
        });
    end, {
        v73, 
        v63.isRecommendation, 
        v63.user.id, 
        v74, 
        v64, 
        v111, 
        v106
    });
    local v116 = l_useNavigation_0();
    local v117 = v8.useCallback(function() --[[ Line: 415 ]]
        -- upvalues: v106 (copy), l_EventNames_0 (ref), v116 (copy), l_AppPage_0 (ref), v63 (copy), v73 (copy), v102 (copy), l_FFlagAddFriendsRenderTileRefactor_0 (ref), v98 (copy), v76 (copy), v39 (ref), l_Contexts_0 (ref), v105 (copy), v104 (copy)
        v106(l_EventNames_0.PlayerTileClick);
        v116.navigate(l_AppPage_0.ProfilePlatform, {
            detail = v63.user.id, 
            extraProps = {
                profileType = v73 and "Contact" or nil, 
                recommendationSessionId = v102, 
                absolutePosition = v63.position, 
                rank = if l_FFlagAddFriendsRenderTileRefactor_0 then v98 else v63.user.rank, 
                isRecommendation = v63.isRecommendation, 
                isContact = v73, 
                contactProps = if v73 then {
                    contactId = v63.user.entityId, 
                    contactname = v63.user.entityDisplayName, 
                    avatarImageUrl = if l_FFlagAddFriendsRenderTileRefactor_0 then v63.user.thumbnailEntities and v63.user.thumbnailEntities.avatarImageUrl else v63.user.thumbnailEntities.avatarImageUrl
                } else nil, 
                friendStatus = v76, 
                source = if v63.isRecommendation then v39.AddFriendsPYMKSourceName else l_Contexts_0.AddFriends, 
                contextualInfoType = v105, 
                contextualInfoDisplay = if v63.isRecommendation then v104 else nil
            }
        });
    end, {
        v63.user, 
        v63.position, 
        v63.isRecommendation, 
        v76, 
        v102, 
        v73, 
        v116, 
        v105, 
        v104, 
        if l_FFlagAddFriendsRenderTileRefactor_0 then v98 else nil
    });
    local v119 = v8.useCallback(function() --[[ Line: 458 ]]
        -- upvalues: v63 (copy), v76 (copy), v64 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), l_convertUserPresenceTypeToString_0 (ref), l_FriendshipOriginSourceType_0 (ref)
        local v118 = if v63.isRecommendation then v76 or Enum.FriendStatus.NotFriend else Enum.FriendStatus.FriendRequestReceived;
        v64(l_SetCentralOverlay_0(l_CentralOverlayType_0.PlayerContextualMenu, {
            subjectUserId = v63.user.id, 
            contactId = v63.user.entityId, 
            contactName = v63.user.entityDisplayName, 
            recommendationContext = v63.user.contextType, 
            mutualFriendsCount = v63.user.mutualFriendsCount, 
            robloxFriendshipStatus = v118, 
            subjectPresence = {
                locationString = v63.user.lastLocation, 
                locationPlaceId = v63.user.placeId, 
                locationRootPlaceId = v63.user.rootPlaceId, 
                locationUniverseId = v63.user.universeId, 
                status = l_convertUserPresenceTypeToString_0(v63.user.userPresenceType)
            }, 
            friendshipOriginSourceType = if v63.isRecommendation then l_FriendshipOriginSourceType_0.FriendRecommendations.rawValue() else nil
        }));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v63.isRecommendation, 
        v76, 
        v63.user, 
        v64
    } else l_dependencyArray_0(v63.isRecommendation, v76, v63.user, v64));
    local v120 = v8.useCallback(function() --[[ Line: 491 ]]
        -- upvalues: l_FFlagPPVEnabledOnConsole_0 (ref), v68 (ref), v10 (ref), v119 (copy), v117 (copy)
        if not l_FFlagPPVEnabledOnConsole_0 and v68 == v10.Input.Directional then
            return v119();
        else
            v117();
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        if l_FFlagPPVEnabledOnConsole_0 then nil else v68, 
        if l_FFlagPPVEnabledOnConsole_0 then nil else v119, 
        v117
    } else l_dependencyArray_0(if l_FFlagPPVEnabledOnConsole_0 then nil else v68, if l_FFlagPPVEnabledOnConsole_0 then nil else v119, v117));
    local v121 = nil;
    local v122 = nil;
    local v123 = nil;
    if not l_FFlagAddFriendsUserListEnabled_0 then
        local v124 = v16.Hooks.useUserProfilesFetch({
            userIds = {
                v63.user.id
            }, 
            query = v16.Queries.userProfilesCombinedNameAndUsernameByUserIds, 
            skip = v73
        });
        if v73 then
            v121 = v63.user.entityDisplayName;
            v122 = nil;
            v123 = if l_FFlagAddFriendsRenderTileRefactor_0 then v63.user.thumbnailEntities and v63.user.thumbnailEntities.avatarImageUrl else v63.user.thumbnailEntities.avatarImageUrl;
        else
            local v125 = "";
            local v126 = "";
            if v124 and v124.data then
                v125 = v16.Selectors.getCombinedNameFromId(v124.data, v63.user.id) or "";
                v126 = v16.Selectors.getUsernameFromId(v124.data, v63.user.id) or "";
            end;
            v121 = v125;
            v122 = if l_FFlagAddFriendsRenderTileRefactor_0 then "@" .. v126 else "@" .. (v63.user.externalAppDisplayName or v126);
            v123 = string.format("rbxthumb://type=Avatar&id=%s&w=720&h=720", (tostring(v63.user.id)));
        end;
    end;
    local v127 = nil;
    local v128 = nil;
    if l_FFlagAddFriendsPYMKPresence_0 then
        if l_FFlagAddFriendsUserListEnabled_0 then
            v128 = v8.useMemo(function() --[[ Line: 549 ]]
                -- upvalues: v100 (copy), v12 (ref)
                if v100 and v100.userPresenceType then
                    local v129 = tostring(v100.userPresenceType);
                    return (string.gsub(v129, "PresenceType%.", ""));
                else
                    return v12.Enums.PresenceTypes.Offline;
                end;
            end, {
                v100
            });
        else
            local v132 = v8.useMemo(function() --[[ Line: 557 ]]
                -- upvalues: v100 (copy), l_PresenceType_0 (ref)
                local v130 = v100 and v100.userPresenceType or nil;
                local v131 = true;
                if v130 ~= l_PresenceType_0.Online then
                    v131 = true;
                    if v130 ~= l_PresenceType_0.InStudio then
                        v131 = v130 == l_PresenceType_0.InGame;
                    end;
                end;
                return v131;
            end, {
                v100
            });
            local l_Color_0 = v67.Theme.OnlineStatus.Color;
            local l_l_Color_0_0 = l_Color_0 --[[ copy: 44 -> 46 ]];
            local l_v132_0 = v132 --[[ copy: 43 -> 47 ]];
            v127 = v8.useMemo(function() --[[ Line: 568 ]]
                -- upvalues: l_l_Color_0_0 (copy), l_v132_0 (copy), v121 (ref)
                local v136 = ("<font color=\"rgb(%*,%*,%*)\">\226\151\143 </font>"):format(math.round(l_l_Color_0_0.R * 255), math.round(l_l_Color_0_0.G * 255), (math.round(l_l_Color_0_0.B * 255)));
                if l_v132_0 then
                    return v136 .. v121;
                else
                    return v121;
                end;
            end, {
                v121, 
                v132, 
                l_Color_0
            });
        end;
    end;
    local v137 = v8.useMemo(function() --[[ Line: 580 ]]
        -- upvalues: v49 (ref), v63 (copy), v93 (copy), v76 (copy), v115 (copy), v112 (copy), v113 (copy), v70 (copy)
        return v49({
            isFriendRequest = v63.isFriendRequest or false, 
            hasIncomingFriendRequest = v93, 
            friendStatus = v76, 
            handleRequestFriendship = v115, 
            handleAcceptFriendRequest = v112, 
            handleDeclineFriendRequest = v113, 
            shouldAddFocusEventName = v70
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v63.isFriendRequest, 
        v76, 
        v115, 
        v112, 
        v113, 
        v93, 
        v70
    } else l_dependencyArray_0(v63.isFriendRequest, v76, v115, v112, v113, v93, v70));
    if l_FFlagAddFriendsUserListEnabled_0 then
        local v138 = v137 and v137[#v137] or nil;
        local v139 = v137 and v137[#v137 - 1] or nil;
        return v8.createElement(l_View_0, {
            tag = "size-full-0 auto-y", 
            ref = v69
        }, {
            UserRow = v63.createRow({
                onRowActivated = v117, 
                primaryCta = v138 and {
                    type = v138.type, 
                    icon = v138.icon, 
                    isDisabled = v138.isDisabled, 
                    onActivated = v138.onActivated, 
                    minWidth = if l_FFlagFriendsPageViewBtnWidth_0 then v39.PRIMARY_CTA_BUTTON_MIN_WIDTH else nil, 
                    maxWidth = if l_FFlagFriendsPageViewBtnWidth_0 then v39.PRIMARY_CTA_BUTTON_MAX_WIDTH else nil
                }, 
                secondaryCta = v139 and {
                    type = v139.type, 
                    icon = v139.icon, 
                    isDisabled = v139.isDisabled, 
                    onActivated = v139.onActivated
                }, 
                contextualInfo = v104 and {
                    text = v104.text, 
                    icon = v104.icon
                }, 
                presence = v128
            }), 
            UserTileEventHandlers = if v70 then v8.createElement(l_UserTileEventHandlers_0, {
                buttons = v137, 
                onTileActivated = v120, 
                tileRef = v69
            }) else nil
        });
    else
        return (v8.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.fromScale(1, 0.5), 
            Size = UDim2.new(0, v63.size.X, 0, v63.size.Y), 
            BackgroundTransparency = 1, 
            ZIndex = 1, 
            LayoutOrder = v63.layoutOrder
        }, {
            PlayerTile = v8.createElement(l_PlayerTile_0, {
                buttonRef = v69, 
                thumbnail = v123, 
                title = if l_FFlagAddFriendsPYMKPresence_0 then v127 else v121, 
                tileSize = UDim2.new(0, v63.size.X, 0, v63.size.Y), 
                subtitle = v122, 
                buttons = if v70 then nil else v137, 
                relevancyInfo = v104, 
                onActivated = v120, 
                Selectable = true, 
                openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil
            }), 
            UserTileEventHandlers = if v70 then v8.createElement(l_UserTileEventHandlers_0, {
                buttons = v137, 
                onTileActivated = v120, 
                tileRef = v69
            }) else nil
        }));
    end;
end;