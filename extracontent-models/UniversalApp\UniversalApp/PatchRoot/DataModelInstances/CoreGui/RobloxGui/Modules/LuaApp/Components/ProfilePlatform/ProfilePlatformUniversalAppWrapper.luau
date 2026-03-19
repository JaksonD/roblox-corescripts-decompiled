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
local l_AvatarEditorCategories_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.AvatarEditorCategories;
local function v80(v52) --[[ Line: 64 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useRoactService_0 (copy), v48 (copy), l_useNavigationProps_0 (copy), l_Enums_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_FFlagEnablePlatformProfileContextualMenuOption_0 (copy), v9 (copy), l_ProfileTypes_0 (copy), l_FFlagProfilePlatformEnableImpressions_0 (copy), v2 (copy), l_HttpService_0 (copy), v16 (copy), l_Contexts_0 (copy), l_peekViewDismissedEvent_0 (copy), l_DefaultAnalyticsService_0 (copy), l_NavigateBack_0 (copy), v32 (copy), v31 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), l_ImpressionEnums_0 (copy), l_FFlagProfilePlatformEnableStore_0 (copy), v40 (copy), v39 (copy), l_FFlagAddIEMProfilePage_0 (copy), l_FFlagProfilePlatformEnableEditAppearanceMenu_0 (copy), l_AvatarScreen_0 (copy), v50 (copy), l_AvatarEditorCategories_0 (copy), v15 (copy), v17 (copy), v18 (copy), l_FFlagAddSocialLinksToCommunityProfile_0 (copy), v34 (copy), v35 (copy), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (copy), l_dependencyArray_0 (copy), l_ProfileWrapperContext_0 (copy), l_ProfilePlatformNavigator_0 (copy), v13 (copy), v14 (copy)
    local v53 = l_useDispatch_0();
    local v54 = l_useNavigation_0();
    local v55 = l_useRoactService_0(v48);
    local v58 = l_useNavigationProps_0(function(v56, v57) --[[ Line: 69 ]]
        return {
            profileId = v56, 
            profileType = v57.profileType, 
            absolutePosition = v57.absolutePosition, 
            source = v57.source, 
            contextualInfoType = v57.contextualInfoType, 
            contextualInfoDisplay = v57.contextualInfoDisplay, 
            profileUserNickname = v57.profileUserNickname, 
            sessionIdOverride = v57.sessionIdOverride, 
            isRecommendation = v57.isRecommendation, 
            recommendationContextType = v57.recommendationContextType, 
            recommendationSessionId = v57.recommendationSessionId, 
            recommendationRank = v57.recommendationRank, 
            offNetworkFriendRequestToken = v57.offNetworkFriendRequestToken, 
            shareLinkId = v57.shareLinkId, 
            friendshipOriginSourceType = v57.friendshipOriginSourceType, 
            initialPresence = v57.initialPresence
        };
    end);
    local v59 = l_Enums_0.FriendshipOriginSourceType.UserProfile.rawValue();
    if v58.source == "playerSearch" then
        v59 = l_Enums_0.FriendshipOriginSourceType.PlayerSearch.rawValue();
    elseif v58.isRecommendation then
        v59 = l_Enums_0.FriendshipOriginSourceType.FriendRecommendations.rawValue();
    elseif v58.friendshipOriginSourceType then
        v59 = v58.friendshipOriginSourceType;
    end;
    local v62 = l_useSelector_0(function(v60) --[[ Line: 99 ]]
        -- upvalues: l_getDeepValue_0 (ref)
        local v61 = l_getDeepValue_0(v60, "Navigation.history") or {};
        return ((v61[#v61] or {})[#v61] or {}).name;
    end);
    local v63 = if l_FFlagEnablePlatformProfileContextualMenuOption_0 then v9.Hooks.useUserProfilesFetch({
        userIds = {
            v58.profileId
        }, 
        query = v9.Queries.userProfilesPlatformProfileIdsByUserIds
    }) else nil;
    local v64 = if l_FFlagEnablePlatformProfileContextualMenuOption_0 and v63.data then v9.Selectors.getPlatformProfileIdFromId(v63.data, v58.profileId) else nil;
    local v65 = tostring(v58.profileId);
    local v66 = v58.profileType or l_ProfileTypes_0.User;
    local v67 = if l_FFlagProfilePlatformEnableImpressions_0 then v2.useMemo(function() --[[ Line: 121 ]]
        -- upvalues: v58 (copy), l_HttpService_0 (ref)
        return v58.sessionIdOverride or l_HttpService_0:GenerateGUID(false);
    end, {
        v58.sessionIdOverride
    }) else nil;
    local v79 = v2.useMemo(function() --[[ Line: 129 ]]
        -- upvalues: v53 (copy), v16 (ref), l_Contexts_0 (ref), l_peekViewDismissedEvent_0 (ref), l_DefaultAnalyticsService_0 (ref), v62 (copy), l_NavigateBack_0 (ref), v32 (ref), v31 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), l_ImpressionEnums_0 (ref), l_FFlagProfilePlatformEnableStore_0 (ref), v40 (ref), v39 (ref), v54 (copy), l_FFlagAddIEMProfilePage_0 (ref), l_FFlagProfilePlatformEnableEditAppearanceMenu_0 (ref), l_AvatarScreen_0 (ref), v50 (ref), l_AvatarEditorCategories_0 (ref), v15 (ref), v17 (ref), v18 (ref), l_FFlagAddSocialLinksToCommunityProfile_0 (ref), v34 (ref), v35 (ref), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (ref), v55 (copy), v58 (copy), v59 (ref), l_FFlagProfilePlatformEnableImpressions_0 (ref), v67 (copy), v65 (copy), v64 (copy), v66 (copy)
        return {
            navigateTo = {
                qRCodePage = function() --[[ Line: 132 ]] --[[ Name: qRCodePage ]]
                    -- upvalues: v53 (ref), v16 (ref), l_Contexts_0 (ref)
                    v53(v16({
                        source = l_Contexts_0.ProfileCard
                    }));
                end, 
                previousView = function(v68) --[[ Line: 137 ]] --[[ Name: previousView ]]
                    -- upvalues: l_peekViewDismissedEvent_0 (ref), l_DefaultAnalyticsService_0 (ref), v62 (ref), v53 (ref), l_NavigateBack_0 (ref)
                    if v68 then
                        l_peekViewDismissedEvent_0.logEvent(l_DefaultAnalyticsService_0.EventStream, "ProfilePeekView", {
                            dismissMethod = l_peekViewDismissedEvent_0.dismissMethodEnum.topBarTap, 
                            page = v62
                        });
                    end;
                    local v69 = not v68 or nil;
                    v53(l_NavigateBack_0(v69));
                end, 
                itemDetails = function(v70) --[[ Line: 149 ]] --[[ Name: itemDetails ]]
                    -- upvalues: v53 (ref), v32 (ref), v31 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), l_ImpressionEnums_0 (ref)
                    v53(v32(v70, v31.ItemType.Asset, nil, l_FFlagAXFixPurchaseSurfaceLogging_0 and true or nil, if l_FFlagAXFixPurchaseSurfaceLogging_0 then l_ImpressionEnums_0.MarketplaceSurfaceType.USER_PROFILE else nil));
                end, 
                itemOrBundleDetails = l_FFlagProfilePlatformEnableStore_0 and function(v71, v72) --[[ Line: 163 ]]
                    -- upvalues: v53 (ref), v32 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), l_ImpressionEnums_0 (ref)
                    v53(v32(v71, v72, nil, l_FFlagAXFixPurchaseSurfaceLogging_0 and true or nil, if l_FFlagAXFixPurchaseSurfaceLogging_0 then l_ImpressionEnums_0.MarketplaceSurfaceType.USER_PROFILE else nil));
                end or nil, 
                catalogSearch = l_FFlagProfilePlatformEnableStore_0 and function(v73) --[[ Line: 178 ]]
                    -- upvalues: v53 (ref), v40 (ref), v39 (ref), v54 (ref)
                    v53(v40(v73));
                    v53(v39(v54, {}));
                end or nil, 
                inspectAvatar = l_FFlagAddIEMProfilePage_0 and function() --[[ Line: 183 ]]

                end or nil, 
                editAvatar = function() --[[ Line: 184 ]] --[[ Name: editAvatar ]]
                    -- upvalues: l_FFlagProfilePlatformEnableEditAppearanceMenu_0 (ref), v54 (ref), l_AvatarScreen_0 (ref)
                    if l_FFlagProfilePlatformEnableEditAppearanceMenu_0 then
                        v54.navigate(l_AvatarScreen_0.Catalog);
                        return;
                    else
                        v54.navigate(l_AvatarScreen_0.AvatarEditor);
                        return;
                    end;
                end, 
                editEmotes = l_FFlagProfilePlatformEnableEditAppearanceMenu_0 and function() --[[ Line: 192 ]]
                    -- upvalues: v50 (ref), l_AvatarEditorCategories_0 (ref), v54 (ref), l_AvatarScreen_0 (ref)
                    local v74 = v50.resolveEditorCategory(l_AvatarEditorCategories_0.Emotes);
                    v54.navigate(l_AvatarScreen_0.AvatarEditor, {
                        category = v74
                    });
                end or nil, 
                switchAvatar = l_FFlagProfilePlatformEnableEditAppearanceMenu_0 and function() --[[ Line: 199 ]]
                    -- upvalues: v50 (ref), l_AvatarEditorCategories_0 (ref), v54 (ref), l_AvatarScreen_0 (ref)
                    local v75 = v50.resolveEditorCategory(l_AvatarEditorCategories_0.Avatars);
                    v54.navigate(l_AvatarScreen_0.AvatarEditor, {
                        category = v75
                    });
                end or nil, 
                editUsername = function(v76) --[[ Line: 205 ]] --[[ Name: editUsername ]]
                    -- upvalues: v53 (ref), v15 (ref), v17 (ref), v18 (ref)
                    v53(v15({
                        name = v17.EditUsername, 
                        extraProps = {
                            BrowserWrapperComponent = v18, 
                            showToast = v76.showToast, 
                            onUsernameChanged = v76.onUsernameChanged
                        }
                    }));
                end, 
                openLeaveRobloxAlertUIBlox = l_FFlagAddSocialLinksToCommunityProfile_0 and function(v77) --[[ Line: 219 ]]
                    -- upvalues: v53 (ref), v34 (ref)
                    v53(v34(v77));
                end or nil, 
                closeLeaveRobloxAlert = l_FFlagAddSocialLinksToCommunityProfile_0 and function() --[[ Line: 224 ]]
                    -- upvalues: v53 (ref), v35 (ref)
                    v53(v35());
                end or nil, 
                navigateToTransfer = l_FFlagProfilePlatformEnableCurrencyTransfer_0 and function(v78) --[[ Line: 229 ]]
                    -- upvalues: v53 (ref), v15 (ref), v17 (ref)
                    v53(v15({
                        name = v17.TransferRobuxFlow, 
                        extraProps = {
                            direction = v78.direction, 
                            recipientUserId = v78.recipientUserId, 
                            transferId = v78.transferId, 
                            transferOrigination = v78.transferOrigination
                        }
                    }));
                end or nil
            }, 
            externalAnalytics = {
                catalogAnalytics = v55
            }, 
            sourceInfo = {
                homepageCarouselAbsolutePosition = v58.absolutePosition, 
                source = v58.source, 
                contextualInfoType = v58.contextualInfoType, 
                contextualOverride = v58.contextualInfoDisplay, 
                isRecommendation = v58.isRecommendation, 
                recommendationContextType = v58.recommendationContextType, 
                recommendationSessionId = v58.recommendationSessionId, 
                recommendationRank = v58.recommendationRank, 
                friendshipOriginSourceType = v59, 
                shareLinkId = v58.shareLinkId
            }, 
            profileSessionId = if l_FFlagProfilePlatformEnableImpressions_0 then v67 else nil, 
            profileId = v65, 
            profilePlatformId = v64, 
            profileType = v66, 
            profileUserNickname = v58.profileUserNickname, 
            sessionIdOverride = if l_FFlagProfilePlatformEnableImpressions_0 then nil else v58.sessionIdOverride, 
            offNetworkFriendRequestToken = v58.offNetworkFriendRequestToken, 
            initialPresence = v58.initialPresence
        };
    end, l_dependencyArray_0(v65, v53, v62, v58.absolutePosition, v58.source, v55, v54));
    return v2.createElement(l_ProfileWrapperContext_0.Provider, {
        value = v79
    }, {
        ProfilePlatformNavigator = v2.createElement(l_ProfilePlatformNavigator_0, v52), 
        androidBackButtonNavigationHandler = v2.createElement(v13, {
            canGoBackInRN = not v14(v54.state), 
            navigateBackInRN = v54.pop
        })
    });
end;
local v81 = v2.PureComponent:extend("classWrapper");
v81.render = function(v82) --[[ Line: 295 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v80 (copy)
    return v2.createElement(v80, v82.props);
end;
v81.router = l_ProfilePlatformNavigator_0.router;
return v81;