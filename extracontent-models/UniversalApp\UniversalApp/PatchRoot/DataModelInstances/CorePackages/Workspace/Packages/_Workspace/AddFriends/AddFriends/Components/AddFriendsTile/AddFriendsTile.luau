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
return function(v60) --[[ Line: 115 ]] --[[ Name: AddFriendsTile ]]
    -- upvalues: l_useDispatch_0 (copy), l_useFocusGuiObject_0 (copy), l_useLastInputMode_0 (copy), l_useStyle_0 (copy), l_FFlagPPVEnabledOnConsole_0 (copy), l_usePreferredInput_0 (copy), v8 (copy), v10 (copy), l_dependencyArray_0 (copy), l_useImpressionsTagger_0 (copy), l_FFlagAddFriendsRenderTileRefactor_0 (copy), v54 (copy), l_RecommendationContextType_0 (copy), l_useLocalUserId_0 (copy), l_useSelector_0 (copy), l_AddFriendsSelector_0 (copy), l_FFlagAddFriendsPYMKPresence_0 (copy), l_getSessionIdByKey_0 (copy), v39 (copy), l_useLocalization_0 (copy), v48 (copy), v42 (copy), l_EntityTypes_0 (copy), l_Namespaces_0 (copy), l_FFlagAddFriendsPYMKPresenceAnalytics_0 (copy), v7 (copy), l_EventNames_0 (copy), l_FriendsNetworking_0 (copy), l_Images_0 (copy), l_FriendshipOriginSourceType_0 (copy), l_useNavigation_0 (copy), l_AppPage_0 (copy), l_Contexts_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_convertUserPresenceTypeToString_0 (copy), l_FFlagAddFriendsUserListEnabled_0 (copy), v16 (copy), v12 (copy), l_PresenceType_0 (copy), v49 (copy), l_View_0 (copy), l_UserTileEventHandlers_0 (copy), l_PlayerTile_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy)
    local v61 = l_useDispatch_0();
    local v62 = l_useFocusGuiObject_0();
    local v63 = l_useLastInputMode_0();
    local v64 = l_useStyle_0();
    local v65 = nil;
    if not l_FFlagPPVEnabledOnConsole_0 then
        v65 = l_usePreferredInput_0();
    end;
    local v66 = v8.useRef(nil);
    local v67 = v10.usePreferredInput() == v10.Input.Directional;
    local v69 = v8.useCallback(function() --[[ Line: 129 ]]
        -- upvalues: v60 (copy), v63 (copy), v66 (copy), v62 (copy)
        if v60.selected and v63 == "Focus" then
            local l_current_0 = v66.current;
            if l_current_0 then
                v62(l_current_0);
            end;
        end;
    end, l_dependencyArray_0(v60.selected, v63, v66, v62));
    v8.useEffect(function() --[[ Line: 138 ]]
        -- upvalues: v69 (copy)
        v69();
    end, {});
    l_useImpressionsTagger_0(v66, v60.impressionsTag, v60.position);
    local v70 = if l_FFlagAddFriendsRenderTileRefactor_0 then v60.user.type == v54.Enums.EntityType.Contact else v60.user.contextType and v60.user.contextType == l_RecommendationContextType_0.Contacts;
    local v71 = l_useLocalUserId_0();
    local v73 = l_useSelector_0(function(v72) --[[ Line: 150 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v60 (copy)
        return l_AddFriendsSelector_0(v72, "Friends.friendshipStatus.%s", v60.user.id) or nil;
    end);
    local v75 = l_useSelector_0(function(v74) --[[ Line: 156 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v60 (copy)
        return (l_AddFriendsSelector_0(v74, "RequestsFromOriginSourceType") or {})[v60.user.id];
    end);
    local v78 = l_useSelector_0(function(v76) --[[ Line: 161 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v60 (copy)
        local v77 = (l_AddFriendsSelector_0(v76, "Friends.requests.sourceUniverseIds") or {})[v60.user.id];
        if v77 ~= nil and v77 ~= 0 then
            return (l_AddFriendsSelector_0(v76, "Games.byGameId.%s", (tostring(v77))) or {}).name;
        else
            return nil;
        end;
    end);
    local v80 = if l_FFlagAddFriendsRenderTileRefactor_0 then l_useSelector_0(function(v79) --[[ Line: 173 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v60 (copy)
        return l_AddFriendsSelector_0(v79, "Friends.requests.mutualFriends.%s", v60.user.id) or {};
    end) else nil;
    local v82 = if l_FFlagAddFriendsRenderTileRefactor_0 then l_useSelector_0(function(v81) --[[ Line: 179 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v60 (copy)
        return l_AddFriendsSelector_0(v81, "Friends.contactNamesByUserId.%s", v60.user.id);
    end) else nil;
    local v85 = l_useSelector_0(function(v83) --[[ Line: 184 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v60 (copy)
        local v84 = l_AddFriendsSelector_0(v83, "IsUserFollowing") or {};
        return v84[v60.user.id] and v84[v60.user.id].isFollowing or false;
    end);
    local v88 = l_useSelector_0(function(v86) --[[ Line: 189 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v60 (copy)
        local v87 = l_AddFriendsSelector_0(v86, "IsUserFollowing") or {};
        return v87[v60.user.id] and v87[v60.user.id].isFollowed or false;
    end);
    local v90 = l_useSelector_0(function(v89) --[[ Line: 195 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v60 (copy)
        return l_AddFriendsSelector_0(v89, "Friends.recommendations.hasIncomingFriendRequest.%s", v60.user.id) or false;
    end);
    local v92 = if l_FFlagAddFriendsRenderTileRefactor_0 then l_useSelector_0(function(v91) --[[ Line: 200 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v71 (copy), v60 (copy)
        return l_AddFriendsSelector_0(v91, "Friends.recommendations.byUserId.%s.%s", v71, v60.user.id) or {};
    end) else nil;
    local v93 = if l_FFlagAddFriendsRenderTileRefactor_0 then v92.contextType else nil;
    local v94 = if l_FFlagAddFriendsRenderTileRefactor_0 then v92.mutualFriendsCount else nil;
    local v95 = if l_FFlagAddFriendsRenderTileRefactor_0 then v92.rank else nil;
    local v97 = if l_FFlagAddFriendsPYMKPresence_0 then l_useSelector_0(function(v96) --[[ Line: 210 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref), v60 (copy)
        return l_AddFriendsSelector_0(v96, "Presence.byUserId.%s", v60.user.id) or nil;
    end) else nil;
    local v99 = l_useSelector_0(function(v98) --[[ Line: 215 ]]
        -- upvalues: l_getSessionIdByKey_0 (ref), v39 (ref)
        return l_getSessionIdByKey_0(v98)(v39.RECOMMENDATION_SESSION_ID_KEY);
    end);
    local v100 = l_useLocalization_0({
        mutualFriendsText = if l_FFlagAddFriendsRenderTileRefactor_0 then nil else v60.user.mutualFriends and #v60.user.mutualFriends == 1 and "Feature.Friends.Label.SingularMutualFriend" or "Feature.Friends.Label.MutualFriends", 
        sentFromWithContextText = {
            "Feature.Friends.Label.SentFromWithContext"; 
            gameName = v78 or ""
        }, 
        youAreFollowingText = "Feature.Friends.Label.YouAreFollowing", 
        followsYouText = "Feature.Friends.Label.FollowsYou", 
        fromContactsText = "Feature.Friends.Description.FoundFromContactImporter", 
        contactNameText = if if l_FFlagAddFriendsRenderTileRefactor_0 then v82 else v60.user.contactName then {
            "Feature.Friends.Description.FromContactsV2"; 
            contactName = if l_FFlagAddFriendsRenderTileRefactor_0 then v82 else v60.user.contactName
        } else nil, 
        singularMutualConnection = "Feature.Friends.Label.MutualConnection", 
        mutualConnections = {
            "Feature.Friends.Label.MutualConnections"; 
            numConnections = if l_FFlagAddFriendsRenderTileRefactor_0 then v94 or v80 and #v80 else v60.user.mutualFriendsCount or v60.user.mutualFriends and #v60.user.mutualFriends
        }, 
        foundThroughQRCode = "Feature.Profile.Label.QRCodeFriendRequest", 
        connectionRequests = "Feature.Friends.Label.ConnectionRequest", 
        frequents = "Feature.Friends.Label.Frequent", 
        fromContacts = "Feature.Friends.Description.FromContacts"
    });
    local v101, v102 = v8.useMemo(function() --[[ Line: 257 ]]
        -- upvalues: v48 (ref), l_FFlagAddFriendsRenderTileRefactor_0 (ref), v80 (copy), v60 (copy), v88 (copy), v85 (copy), v78 (copy), v75 (copy), v93 (copy), v94 (copy), v90 (copy), v64 (copy), v100 (copy)
        return v48({
            mutualFriends = if l_FFlagAddFriendsRenderTileRefactor_0 then v80 else v60.user.mutualFriends, 
            isUserFollowingMe = v88, 
            amIFollowingUser = v85, 
            sentFromExperienceName = v78, 
            isFriendRequest = v60.isFriendRequest or false, 
            isRecommendation = v60.isRecommendation, 
            userPresenceType = if l_FFlagAddFriendsRenderTileRefactor_0 then nil else v60.user.userPresenceType, 
            lastLocation = if l_FFlagAddFriendsRenderTileRefactor_0 then nil else v60.user.lastLocation, 
            originSourceType = v75, 
            contextType = if l_FFlagAddFriendsRenderTileRefactor_0 then v93 else v60.user.contextType, 
            mutualFriendsCount = if l_FFlagAddFriendsRenderTileRefactor_0 then v94 else v60.user.mutualFriendsCount, 
            hasIncomingFriendRequest = v90
        }, v64, v100);
    end, l_dependencyArray_0(v60.user, v88, v85, v78, v60.isFriendRequest, v60.isRecommendation, v75, v90, if l_FFlagAddFriendsRenderTileRefactor_0 then v94 else nil, if l_FFlagAddFriendsRenderTileRefactor_0 then v80 else nil, if l_FFlagAddFriendsRenderTileRefactor_0 then v93 else nil, v64, v100));
    local v103 = v42({
        targetUserId = v60.user.id, 
        absolutePosition = v60.position, 
        rank = if l_FFlagAddFriendsRenderTileRefactor_0 then v95 else v60.user.rank, 
        contextType = v102, 
        entityType = if v70 then l_EntityTypes_0.Contact else nil, 
        namespace = if v60.isFriendRequest then l_Namespaces_0.FriendRequests else l_Namespaces_0.PYMK, 
        friendStatus = v73, 
        presence = if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then (v97 or {}).userPresenceType else nil
    });
    local v105 = v8.useCallback(function(v104) --[[ Line: 303 ]]
        -- upvalues: v61 (copy), v7 (ref)
        if not v104 then
            return;
        else
            v61(v7.Actions.SetCurrentToastMessage({
                toastMessage = v104.toastTitle, 
                toastIcon = v104.iconImage
            }));
            return;
        end;
    end, {
        v61
    });
    local v108 = v8.useCallback(function(v106, v107) --[[ Line: 314 ]]
        -- upvalues: v105 (copy)
        return v106:andThen(function() --[[ Line: 316 ]]
            -- upvalues: v105 (ref), v107 (copy)
            v105(v107);
        end):catch(function() --[[ Line: 319 ]]
            -- upvalues: v105 (ref)
            v105({
                toastTitle = "Feature.Toast.NetworkingError.SomethingIsWrong"
            });
        end);
    end, {
        v105
    });
    local v109 = v8.useCallback(function() --[[ Line: 324 ]]
        -- upvalues: v103 (copy), l_EventNames_0 (ref), v108 (copy), v61 (copy), l_FriendsNetworking_0 (ref), v71 (copy), v60 (copy), l_Images_0 (ref)
        v103(l_EventNames_0.AcceptFriendshipBtnClick);
        return v108(v61(l_FriendsNetworking_0.AcceptFriendRequestFromUserId.API({
            currentUserId = v71, 
            targetUserId = v60.user.id
        })), {
            toastTitle = "Feature.Friends.Action.ConnectionAdded", 
            iconImage = l_Images_0["icons/actions/friends/friendAdd"]
        });
    end, {
        v60.user.id, 
        v71, 
        v61, 
        v108, 
        v103
    });
    local v110 = v8.useCallback(function() --[[ Line: 339 ]]
        -- upvalues: v103 (copy), l_EventNames_0 (ref), v108 (copy), v61 (copy), l_FriendsNetworking_0 (ref), v71 (copy), v60 (copy), l_Images_0 (ref)
        v103(l_EventNames_0.DeclineFriendshipBtnClick);
        return v108(v61(l_FriendsNetworking_0.DeclineFriendRequestFromUserId.API({
            currentUserId = v71, 
            targetUserId = v60.user.id
        })), {
            toastTitle = "Feature.AddFriends.Action.RequestIgnored", 
            iconImage = l_Images_0["icons/actions/reject"]
        });
    end, {
        v60.user.id, 
        v71, 
        v61, 
        v108, 
        v103
    });
    local v112 = v8.useCallback(function() --[[ Line: 355 ]]
        -- upvalues: v103 (copy), l_EventNames_0 (ref), v70 (copy), l_FriendsNetworking_0 (ref), v71 (copy), v60 (copy), l_FriendshipOriginSourceType_0 (ref), v108 (copy), v61 (copy), l_Images_0 (ref)
        v103(l_EventNames_0.RequestFriendshipBtnClick);
        local v111 = if v70 then l_FriendsNetworking_0.RequestFriendshipFromContactId.API({
            currentUserId = v71, 
            contactId = v60.user.id
        }) else l_FriendsNetworking_0.RequestFriendshipFromUserId.API({
            currentUserId = v71, 
            targetUserId = v60.user.id, 
            friendshipOriginSourceType = if v60.isRecommendation then l_FriendshipOriginSourceType_0.FriendRecommendations.rawValue() else nil
        });
        return v108(v61(v111), {
            toastTitle = "Feature.Friends.Action.ConnectionRequestSent", 
            iconImage = l_Images_0["icons/actions/friends/friendAdd"]
        });
    end, {
        v70, 
        v60.isRecommendation, 
        v60.user.id, 
        v71, 
        v61, 
        v108, 
        v103
    });
    local v113 = l_useNavigation_0();
    local v114 = v8.useCallback(function() --[[ Line: 382 ]]
        -- upvalues: v103 (copy), l_EventNames_0 (ref), v113 (copy), l_AppPage_0 (ref), v60 (copy), v70 (copy), v99 (copy), l_FFlagAddFriendsRenderTileRefactor_0 (ref), v95 (copy), v73 (copy), v39 (ref), l_Contexts_0 (ref), v102 (copy), v101 (copy)
        v103(l_EventNames_0.PlayerTileClick);
        v113.navigate(l_AppPage_0.ProfilePlatform, {
            detail = v60.user.id, 
            extraProps = {
                profileType = v70 and "Contact" or nil, 
                recommendationSessionId = v99, 
                absolutePosition = v60.position, 
                rank = if l_FFlagAddFriendsRenderTileRefactor_0 then v95 else v60.user.rank, 
                isRecommendation = v60.isRecommendation, 
                isContact = v70, 
                contactProps = if v70 then {
                    contactId = v60.user.entityId, 
                    contactname = v60.user.entityDisplayName, 
                    avatarImageUrl = if l_FFlagAddFriendsRenderTileRefactor_0 then v60.user.thumbnailEntities and v60.user.thumbnailEntities.avatarImageUrl else v60.user.thumbnailEntities.avatarImageUrl
                } else nil, 
                friendStatus = v73, 
                source = if v60.isRecommendation then v39.AddFriendsPYMKSourceName else l_Contexts_0.AddFriends, 
                contextualInfoType = v102, 
                contextualInfoDisplay = if v60.isRecommendation then v101 else nil
            }
        });
    end, {
        v60.user, 
        v60.position, 
        v60.isRecommendation, 
        v73, 
        v99, 
        v70, 
        v113, 
        v102, 
        v101, 
        if l_FFlagAddFriendsRenderTileRefactor_0 then v95 else nil
    });
    local v116 = v8.useCallback(function() --[[ Line: 424 ]]
        -- upvalues: v60 (copy), v73 (copy), v61 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), l_convertUserPresenceTypeToString_0 (ref), l_FriendshipOriginSourceType_0 (ref)
        local v115 = if v60.isRecommendation then v73 or Enum.FriendStatus.NotFriend else Enum.FriendStatus.FriendRequestReceived;
        v61(l_SetCentralOverlay_0(l_CentralOverlayType_0.PlayerContextualMenu, {
            subjectUserId = v60.user.id, 
            contactId = v60.user.entityId, 
            contactName = v60.user.entityDisplayName, 
            recommendationContext = v60.user.contextType, 
            mutualFriendsCount = v60.user.mutualFriendsCount, 
            robloxFriendshipStatus = v115, 
            subjectPresence = {
                locationString = v60.user.lastLocation, 
                locationPlaceId = v60.user.placeId, 
                locationRootPlaceId = v60.user.rootPlaceId, 
                locationUniverseId = v60.user.universeId, 
                status = l_convertUserPresenceTypeToString_0(v60.user.userPresenceType)
            }, 
            friendshipOriginSourceType = if v60.isRecommendation then l_FriendshipOriginSourceType_0.FriendRecommendations.rawValue() else nil
        }));
    end, l_dependencyArray_0(v60.isRecommendation, v73, v60.user, v61));
    local v117 = v8.useCallback(function() --[[ Line: 453 ]]
        -- upvalues: l_FFlagPPVEnabledOnConsole_0 (ref), v65 (ref), v10 (ref), v116 (copy), v114 (copy)
        if not l_FFlagPPVEnabledOnConsole_0 and v65 == v10.Input.Directional then
            return v116();
        else
            v114();
            return;
        end;
    end, l_dependencyArray_0(if l_FFlagPPVEnabledOnConsole_0 then nil else v65, if l_FFlagPPVEnabledOnConsole_0 then nil else v116, v114));
    local v118 = nil;
    local v119 = nil;
    local v120 = nil;
    if not l_FFlagAddFriendsUserListEnabled_0 then
        local v121 = v16.Hooks.useUserProfilesFetch({
            userIds = {
                v60.user.id
            }, 
            query = v16.Queries.userProfilesCombinedNameAndUsernameByUserIds, 
            skip = v70
        });
        if v70 then
            v118 = v60.user.entityDisplayName;
            v119 = nil;
            v120 = if l_FFlagAddFriendsRenderTileRefactor_0 then v60.user.thumbnailEntities and v60.user.thumbnailEntities.avatarImageUrl else v60.user.thumbnailEntities.avatarImageUrl;
        else
            local v122 = "";
            local v123 = "";
            if v121 and v121.data then
                v122 = v16.Selectors.getCombinedNameFromId(v121.data, v60.user.id) or "";
                v123 = v16.Selectors.getUsernameFromId(v121.data, v60.user.id) or "";
            end;
            v118 = v122;
            v119 = if l_FFlagAddFriendsRenderTileRefactor_0 then "@" .. v123 else "@" .. (v60.user.externalAppDisplayName or v123);
            v120 = string.format("rbxthumb://type=Avatar&id=%s&w=720&h=720", (tostring(v60.user.id)));
        end;
    end;
    local v124 = nil;
    local v125 = nil;
    if l_FFlagAddFriendsPYMKPresence_0 then
        if l_FFlagAddFriendsUserListEnabled_0 then
            v125 = v8.useMemo(function() --[[ Line: 505 ]]
                -- upvalues: v97 (copy), v12 (ref)
                if v97 and v97.userPresenceType then
                    local v126 = tostring(v97.userPresenceType);
                    return (string.gsub(v126, "PresenceType%.", ""));
                else
                    return v12.Enums.PresenceTypes.Offline;
                end;
            end, {
                v97
            });
        else
            local v129 = v8.useMemo(function() --[[ Line: 513 ]]
                -- upvalues: v97 (copy), l_PresenceType_0 (ref)
                local v127 = v97 and v97.userPresenceType or nil;
                local v128 = true;
                if v127 ~= l_PresenceType_0.Online then
                    v128 = true;
                    if v127 ~= l_PresenceType_0.InStudio then
                        v128 = v127 == l_PresenceType_0.InGame;
                    end;
                end;
                return v128;
            end, {
                v97
            });
            local l_Color_0 = v64.Theme.OnlineStatus.Color;
            local l_l_Color_0_0 = l_Color_0 --[[ copy: 44 -> 46 ]];
            local l_v129_0 = v129 --[[ copy: 43 -> 47 ]];
            v124 = v8.useMemo(function() --[[ Line: 524 ]]
                -- upvalues: l_l_Color_0_0 (copy), l_v129_0 (copy), v118 (ref)
                local v133 = ("<font color=\"rgb(%*,%*,%*)\">\226\151\143 </font>"):format(math.round(l_l_Color_0_0.R * 255), math.round(l_l_Color_0_0.G * 255), (math.round(l_l_Color_0_0.B * 255)));
                if l_v129_0 then
                    return v133 .. v118;
                else
                    return v118;
                end;
            end, {
                v118, 
                v129, 
                l_Color_0
            });
        end;
    end;
    local v134 = v8.useMemo(function() --[[ Line: 536 ]]
        -- upvalues: v49 (ref), v60 (copy), v90 (copy), v73 (copy), v112 (copy), v109 (copy), v110 (copy), v67 (copy)
        return v49({
            isFriendRequest = v60.isFriendRequest or false, 
            hasIncomingFriendRequest = v90, 
            friendStatus = v73, 
            handleRequestFriendship = v112, 
            handleAcceptFriendRequest = v109, 
            handleDeclineFriendRequest = v110, 
            shouldAddFocusEventName = v67
        });
    end, l_dependencyArray_0(v60.isFriendRequest, v73, v112, v109, v110, v90, v67));
    if l_FFlagAddFriendsUserListEnabled_0 then
        local v135 = v134 and v134[#v134] or nil;
        local v136 = v134 and v134[#v134 - 1] or nil;
        return v8.createElement(l_View_0, {
            tag = "size-full-0 auto-y", 
            ref = v66
        }, {
            UserRow = v60.createRow({
                onRowActivated = v114, 
                primaryCta = v135 and {
                    type = v135.type, 
                    icon = v135.icon, 
                    isDisabled = v135.isDisabled, 
                    onActivated = v135.onActivated
                }, 
                secondaryCta = v136 and {
                    type = v136.type, 
                    icon = v136.icon, 
                    isDisabled = v136.isDisabled, 
                    onActivated = v136.onActivated
                }, 
                contextualInfo = v101 and {
                    text = v101.text, 
                    icon = v101.icon
                }, 
                presence = v125
            }), 
            UserTileEventHandlers = if v67 then v8.createElement(l_UserTileEventHandlers_0, {
                buttons = v134, 
                onTileActivated = v117, 
                tileRef = v66
            }) else nil
        });
    else
        return (v8.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.fromScale(1, 0.5), 
            Size = UDim2.new(0, v60.size.X, 0, v60.size.Y), 
            BackgroundTransparency = 1, 
            ZIndex = 1, 
            LayoutOrder = v60.layoutOrder
        }, {
            PlayerTile = v8.createElement(l_PlayerTile_0, {
                buttonRef = v66, 
                thumbnail = v120, 
                title = if l_FFlagAddFriendsPYMKPresence_0 then v124 else v118, 
                tileSize = UDim2.new(0, v60.size.X, 0, v60.size.Y), 
                subtitle = v119, 
                buttons = if v67 then nil else v134, 
                relevancyInfo = v101, 
                onActivated = v117, 
                Selectable = true, 
                openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil
            }), 
            UserTileEventHandlers = if v67 then v8.createElement(l_UserTileEventHandlers_0, {
                buttons = v134, 
                onTileActivated = v117, 
                tileRef = v66
            }) else nil
        }));
    end;
end;