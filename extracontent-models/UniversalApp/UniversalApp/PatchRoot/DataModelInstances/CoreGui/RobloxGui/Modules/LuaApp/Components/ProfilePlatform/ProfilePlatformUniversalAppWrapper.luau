local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform);
local v4 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v6 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics);
local v7 = require(l_CorePackages_0.Workspace.Packages.PeekView);
local v8 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v9 = require(l_CorePackages_0.Workspace.Packages.UserProfiles);
local l_ProfilePlatformNavigator_0 = v3.ProfilePlatformNavigator;
local l_ProfileWrapperContext_0 = v3.ProfileWrapperContext;
local l_useSelector_0 = v8.Hooks.RoactRodux.useSelector;
local v13 = require(l_script_FirstAncestor_0.LuaApp.Navigation.AndroidBackButtonNavigationHandler.Container);
local v14 = require(l_script_FirstAncestor_0.LuaApp.Navigation.isRootRouteInRN);
local v15 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDown);
local v16 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDownTo3DQRCodePage);
local v17 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local v18 = require(l_script_FirstAncestor_0.LuaApp.Components.BrowserServiceWrapper);
local l_dependencyArray_0 = v8.Hooks.dependencyArray;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_HttpService_0 = game:GetService("HttpService");
local l_Enums_0 = require(l_CorePackages_0.Workspace.Packages.FriendsNetworking).Enums;
local l_ProfileTypes_0 = v3.ProfileTypes;
local l_useDispatch_0 = v8.Hooks.RoactRodux.useDispatch;
local l_Contexts_0 = v6.Analytics.Enums.Contexts;
local l_useNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).useNavigationProps;
local l_NavigateBack_0 = v4.Thunks.NavigateBack;
local l_DefaultAnalyticsService_0 = v6.Analytics.DefaultAnalyticsService;
local l_peekViewDismissedEvent_0 = v7.analytics.peekViewDismissedEvent;
local v31 = require(l_script_FirstAncestor_0.AvatarExperience.Common.Constants);
local v32 = require(l_script_FirstAncestor_0.AvatarExperience.Common.Thunks.OpenAppItemDetails);
local v33 = require(l_CorePackages_0.Packages.LuaSocialLibrariesDeps);
local v34 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert);
local v35 = require(l_script_FirstAncestor_0.LuaApp.Thunks.CloseCentralOverlay);
local l_getDeepValue_0 = v33.SocialLibraries.config({}).Dictionary.getDeepValue;
local l_FFlagProfilePlatformEnableStore_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagProfilePlatformEnableStore;
local l_FFlagProfilePlatformEnableImpressions_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagProfilePlatformEnableImpressions;
local v39 = require(l_script_FirstAncestor_0.AvatarExperience.Catalog.Thunks.NavigateToSearch);
local v40 = require(l_script_FirstAncestor_0.AvatarExperience.Catalog.Actions.SetCreatorFilter);
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
local v42 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAddSocialLinksToCommunityProfile_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAddSocialLinksToCommunityProfile;
local l_FFlagEnablePlatformProfileContextualMenuOption_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption;
local l_FFlagAddIEMProfilePage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAddIEMProfilePage;
local l_FFlagProfilePlatformEnableEditAppearanceMenu_0 = v3.FFlagProfilePlatformEnableEditAppearanceMenu;
local l_FFlagProfilePlatformEnableCurrencyTransfer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer;
local v48 = require(l_script_FirstAncestor_0.AvatarExperience.Catalog.Services.Analytics);
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v42.FFlagAXFixPurchaseSurfaceLogging;
local v50 = require(l_script_FirstAncestor_0.AvatarExperience.Common.Utils);
local l_FFlagRemoveDependencyArrayAntipattern_0 = v42.FFlagRemoveDependencyArrayAntipattern;
local l_AvatarEditorCategories_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.AvatarEditorCategories;
local l_FFlagEnableMobileGameJoinCard_0 = v42.FFlagEnableMobileGameJoinCard;
local function v82(v54) --[[ Line: 68 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useRoactService_0 (copy), v48 (copy), l_useNavigationProps_0 (copy), l_FFlagEnableMobileGameJoinCard_0 (copy), l_Enums_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_FFlagEnablePlatformProfileContextualMenuOption_0 (copy), v9 (copy), l_ProfileTypes_0 (copy), l_FFlagProfilePlatformEnableImpressions_0 (copy), v2 (copy), l_HttpService_0 (copy), v16 (copy), l_Contexts_0 (copy), l_peekViewDismissedEvent_0 (copy), l_DefaultAnalyticsService_0 (copy), l_NavigateBack_0 (copy), v32 (copy), v31 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), l_ImpressionEnums_0 (copy), l_FFlagProfilePlatformEnableStore_0 (copy), v40 (copy), v39 (copy), l_FFlagAddIEMProfilePage_0 (copy), l_FFlagProfilePlatformEnableEditAppearanceMenu_0 (copy), l_AvatarScreen_0 (copy), v50 (copy), l_AvatarEditorCategories_0 (copy), v15 (copy), v17 (copy), v18 (copy), l_FFlagAddSocialLinksToCommunityProfile_0 (copy), v34 (copy), v35 (copy), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_ProfileWrapperContext_0 (copy), l_ProfilePlatformNavigator_0 (copy), v13 (copy), v14 (copy)
    local v55 = l_useDispatch_0();
    local v56 = l_useNavigation_0();
    local v57 = l_useRoactService_0(v48);
    local v60 = l_useNavigationProps_0(function(v58, v59) --[[ Line: 73 ]]
        -- upvalues: l_FFlagEnableMobileGameJoinCard_0 (ref)
        return {
            profileId = v58, 
            profileType = v59.profileType, 
            absolutePosition = v59.absolutePosition, 
            source = v59.source, 
            contextualInfoType = v59.contextualInfoType, 
            contextualInfoDisplay = v59.contextualInfoDisplay, 
            profileUserNickname = v59.profileUserNickname, 
            sessionIdOverride = v59.sessionIdOverride, 
            isRecommendation = v59.isRecommendation, 
            recommendationContextType = v59.recommendationContextType, 
            recommendationSessionId = v59.recommendationSessionId, 
            recommendationRank = v59.recommendationRank, 
            offNetworkFriendRequestToken = v59.offNetworkFriendRequestToken, 
            shareLinkId = v59.shareLinkId, 
            friendshipOriginSourceType = v59.friendshipOriginSourceType, 
            initialPresence = v59.initialPresence, 
            mountAsFullView = if l_FFlagEnableMobileGameJoinCard_0 then v59.mountAsFullView else nil
        };
    end);
    local v61 = l_Enums_0.FriendshipOriginSourceType.UserProfile.rawValue();
    if v60.source == "playerSearch" then
        v61 = l_Enums_0.FriendshipOriginSourceType.PlayerSearch.rawValue();
    elseif v60.isRecommendation then
        v61 = l_Enums_0.FriendshipOriginSourceType.FriendRecommendations.rawValue();
    elseif v60.friendshipOriginSourceType then
        v61 = v60.friendshipOriginSourceType;
    end;
    local v64 = l_useSelector_0(function(v62) --[[ Line: 104 ]]
        -- upvalues: l_getDeepValue_0 (ref)
        local v63 = l_getDeepValue_0(v62, "Navigation.history") or {};
        return ((v63[#v63] or {})[#v63] or {}).name;
    end);
    local v65 = if l_FFlagEnablePlatformProfileContextualMenuOption_0 then v9.Hooks.useUserProfilesFetch({
        userIds = {
            v60.profileId
        }, 
        query = v9.Queries.userProfilesPlatformProfileIdsByUserIds
    }) else nil;
    local v66 = if l_FFlagEnablePlatformProfileContextualMenuOption_0 and v65.data then v9.Selectors.getPlatformProfileIdFromId(v65.data, v60.profileId) else nil;
    local v67 = tostring(v60.profileId);
    local v68 = v60.profileType or l_ProfileTypes_0.User;
    local v69 = if l_FFlagProfilePlatformEnableImpressions_0 then v2.useMemo(function() --[[ Line: 126 ]]
        -- upvalues: v60 (copy), l_HttpService_0 (ref)
        return v60.sessionIdOverride or l_HttpService_0:GenerateGUID(false);
    end, {
        v60.sessionIdOverride
    }) else nil;
    local v81 = v2.useMemo(function() --[[ Line: 134 ]]
        -- upvalues: v55 (copy), v16 (ref), l_Contexts_0 (ref), l_peekViewDismissedEvent_0 (ref), l_DefaultAnalyticsService_0 (ref), v64 (copy), l_NavigateBack_0 (ref), v32 (ref), v31 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), l_ImpressionEnums_0 (ref), l_FFlagProfilePlatformEnableStore_0 (ref), v40 (ref), v39 (ref), v56 (copy), l_FFlagAddIEMProfilePage_0 (ref), l_FFlagProfilePlatformEnableEditAppearanceMenu_0 (ref), l_AvatarScreen_0 (ref), v50 (ref), l_AvatarEditorCategories_0 (ref), v15 (ref), v17 (ref), v18 (ref), l_FFlagAddSocialLinksToCommunityProfile_0 (ref), v34 (ref), v35 (ref), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (ref), v57 (copy), v60 (copy), v61 (ref), l_FFlagProfilePlatformEnableImpressions_0 (ref), v69 (copy), v67 (copy), v66 (copy), v68 (copy), l_FFlagEnableMobileGameJoinCard_0 (ref)
        return {
            navigateTo = {
                qRCodePage = function() --[[ Line: 137 ]] --[[ Name: qRCodePage ]]
                    -- upvalues: v55 (ref), v16 (ref), l_Contexts_0 (ref)
                    v55(v16({
                        source = l_Contexts_0.ProfileCard
                    }));
                end, 
                previousView = function(v70) --[[ Line: 142 ]] --[[ Name: previousView ]]
                    -- upvalues: l_peekViewDismissedEvent_0 (ref), l_DefaultAnalyticsService_0 (ref), v64 (ref), v55 (ref), l_NavigateBack_0 (ref)
                    if v70 then
                        l_peekViewDismissedEvent_0.logEvent(l_DefaultAnalyticsService_0.EventStream, "ProfilePeekView", {
                            dismissMethod = l_peekViewDismissedEvent_0.dismissMethodEnum.topBarTap, 
                            page = v64
                        });
                    end;
                    local v71 = not v70 or nil;
                    v55(l_NavigateBack_0(v71));
                end, 
                itemDetails = function(v72) --[[ Line: 154 ]] --[[ Name: itemDetails ]]
                    -- upvalues: v55 (ref), v32 (ref), v31 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), l_ImpressionEnums_0 (ref)
                    v55(v32(v72, v31.ItemType.Asset, nil, l_FFlagAXFixPurchaseSurfaceLogging_0 and true or nil, if l_FFlagAXFixPurchaseSurfaceLogging_0 then l_ImpressionEnums_0.MarketplaceSurfaceType.USER_PROFILE else nil));
                end, 
                itemOrBundleDetails = l_FFlagProfilePlatformEnableStore_0 and function(v73, v74) --[[ Line: 168 ]]
                    -- upvalues: v55 (ref), v32 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), l_ImpressionEnums_0 (ref)
                    v55(v32(v73, v74, nil, l_FFlagAXFixPurchaseSurfaceLogging_0 and true or nil, if l_FFlagAXFixPurchaseSurfaceLogging_0 then l_ImpressionEnums_0.MarketplaceSurfaceType.USER_PROFILE else nil));
                end or nil, 
                catalogSearch = l_FFlagProfilePlatformEnableStore_0 and function(v75) --[[ Line: 183 ]]
                    -- upvalues: v55 (ref), v40 (ref), v39 (ref), v56 (ref)
                    v55(v40(v75));
                    v55(v39(v56, {}));
                end or nil, 
                inspectAvatar = l_FFlagAddIEMProfilePage_0 and function() --[[ Line: 188 ]]

                end or nil, 
                editAvatar = function() --[[ Line: 189 ]] --[[ Name: editAvatar ]]
                    -- upvalues: l_FFlagProfilePlatformEnableEditAppearanceMenu_0 (ref), v56 (ref), l_AvatarScreen_0 (ref)
                    if l_FFlagProfilePlatformEnableEditAppearanceMenu_0 then
                        v56.navigate(l_AvatarScreen_0.Catalog);
                        return;
                    else
                        v56.navigate(l_AvatarScreen_0.AvatarEditor);
                        return;
                    end;
                end, 
                editEmotes = l_FFlagProfilePlatformEnableEditAppearanceMenu_0 and function() --[[ Line: 197 ]]
                    -- upvalues: v50 (ref), l_AvatarEditorCategories_0 (ref), v56 (ref), l_AvatarScreen_0 (ref)
                    local v76 = v50.resolveEditorCategory(l_AvatarEditorCategories_0.Emotes);
                    v56.navigate(l_AvatarScreen_0.AvatarEditor, {
                        category = v76
                    });
                end or nil, 
                switchAvatar = l_FFlagProfilePlatformEnableEditAppearanceMenu_0 and function() --[[ Line: 204 ]]
                    -- upvalues: v50 (ref), l_AvatarEditorCategories_0 (ref), v56 (ref), l_AvatarScreen_0 (ref)
                    local v77 = v50.resolveEditorCategory(l_AvatarEditorCategories_0.Avatars);
                    v56.navigate(l_AvatarScreen_0.AvatarEditor, {
                        category = v77
                    });
                end or nil, 
                editUsername = function(v78) --[[ Line: 210 ]] --[[ Name: editUsername ]]
                    -- upvalues: v55 (ref), v15 (ref), v17 (ref), v18 (ref)
                    v55(v15({
                        name = v17.EditUsername, 
                        extraProps = {
                            BrowserWrapperComponent = v18, 
                            showToast = v78.showToast, 
                            onUsernameChanged = v78.onUsernameChanged
                        }
                    }));
                end, 
                openLeaveRobloxAlertUIBlox = l_FFlagAddSocialLinksToCommunityProfile_0 and function(v79) --[[ Line: 224 ]]
                    -- upvalues: v55 (ref), v34 (ref)
                    v55(v34(v79));
                end or nil, 
                closeLeaveRobloxAlert = l_FFlagAddSocialLinksToCommunityProfile_0 and function() --[[ Line: 229 ]]
                    -- upvalues: v55 (ref), v35 (ref)
                    v55(v35());
                end or nil, 
                navigateToTransfer = l_FFlagProfilePlatformEnableCurrencyTransfer_0 and function(v80) --[[ Line: 234 ]]
                    -- upvalues: v55 (ref), v15 (ref), v17 (ref)
                    v55(v15({
                        name = v17.TransferRobuxFlow, 
                        extraProps = {
                            direction = v80.direction, 
                            recipientUserId = v80.recipientUserId, 
                            transferId = v80.transferId, 
                            transferOrigination = v80.transferOrigination
                        }
                    }));
                end or nil
            }, 
            externalAnalytics = {
                catalogAnalytics = v57
            }, 
            sourceInfo = {
                homepageCarouselAbsolutePosition = v60.absolutePosition, 
                source = v60.source, 
                contextualInfoType = v60.contextualInfoType, 
                contextualOverride = v60.contextualInfoDisplay, 
                isRecommendation = v60.isRecommendation, 
                recommendationContextType = v60.recommendationContextType, 
                recommendationSessionId = v60.recommendationSessionId, 
                recommendationRank = v60.recommendationRank, 
                friendshipOriginSourceType = v61, 
                shareLinkId = v60.shareLinkId
            }, 
            profileSessionId = if l_FFlagProfilePlatformEnableImpressions_0 then v69 else nil, 
            profileId = v67, 
            profilePlatformId = v66, 
            profileType = v68, 
            profileUserNickname = v60.profileUserNickname, 
            sessionIdOverride = if l_FFlagProfilePlatformEnableImpressions_0 then nil else v60.sessionIdOverride, 
            offNetworkFriendRequestToken = v60.offNetworkFriendRequestToken, 
            initialPresence = v60.initialPresence, 
            mountAsFullView = if l_FFlagEnableMobileGameJoinCard_0 then v60.mountAsFullView else nil
        };
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v67, 
        v55, 
        v64, 
        v60.absolutePosition, 
        v60.source, 
        v57, 
        v56
    } else l_dependencyArray_0(v67, v55, v64, v60.absolutePosition, v60.source, v57, v56));
    return v2.createElement(l_ProfileWrapperContext_0.Provider, {
        value = v81
    }, {
        ProfilePlatformNavigator = v2.createElement(l_ProfilePlatformNavigator_0, v54), 
        androidBackButtonNavigationHandler = v2.createElement(v13, {
            canGoBackInRN = not v14(v56.state), 
            navigateBackInRN = v56.pop
        })
    });
end;
local v83 = v2.PureComponent:extend("classWrapper");
v83.render = function(v84) --[[ Line: 311 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v82 (copy)
    return v2.createElement(v82, v84.props);
end;
v83.router = l_ProfilePlatformNavigator_0.router;
return v83;