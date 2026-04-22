local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux);
local l_Selectors_0 = v3.Selectors;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v6 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics);
local v7 = require(l_CorePackages_0.Workspace.Packages.PeekView);
local v8 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v9 = require(l_CorePackages_0.Workspace.Packages.UserProfiles);
local v10 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.ProfilePlatformNavigator);
local v11 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.ProfileWrapperContext);
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
local l_ProfileTypes_0 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.Enums).ProfileTypes;
local l_useDispatch_0 = v8.Hooks.RoactRodux.useDispatch;
local l_Contexts_0 = v6.Analytics.Enums.Contexts;
local l_useNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).useNavigationProps;
local l_NavigateBack_0 = v3.Thunks.NavigateBack;
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
local v46 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.FFlagProfilePlatformEnableEditAppearanceMenu);
local l_FFlagProfilePlatformEnableCurrencyTransfer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer;
local v48 = require(l_script_FirstAncestor_0.AvatarExperience.Catalog.Services.Analytics);
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v42.FFlagAXFixPurchaseSurfaceLogging;
local v50 = require(l_script_FirstAncestor_0.AvatarExperience.Common.Utils);
local l_FFlagRemoveDependencyArrayAntipattern_0 = v42.FFlagRemoveDependencyArrayAntipattern;
local l_FFlagUseNavigationSelectors_0 = v42.FFlagUseNavigationSelectors;
local l_AvatarEditorCategories_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.AvatarEditorCategories;
local l_FFlagEnableMobileGameJoinCard_0 = v42.FFlagEnableMobileGameJoinCard;
local function v83(v55) --[[ Line: 70 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useRoactService_0 (copy), v48 (copy), l_useNavigationProps_0 (copy), l_FFlagEnableMobileGameJoinCard_0 (copy), l_Enums_0 (copy), l_useSelector_0 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), l_getDeepValue_0 (copy), l_FFlagEnablePlatformProfileContextualMenuOption_0 (copy), v9 (copy), l_ProfileTypes_0 (copy), l_FFlagProfilePlatformEnableImpressions_0 (copy), v2 (copy), l_HttpService_0 (copy), v16 (copy), l_Contexts_0 (copy), l_peekViewDismissedEvent_0 (copy), l_DefaultAnalyticsService_0 (copy), l_NavigateBack_0 (copy), v32 (copy), v31 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), l_ImpressionEnums_0 (copy), l_FFlagProfilePlatformEnableStore_0 (copy), v40 (copy), v39 (copy), l_FFlagAddIEMProfilePage_0 (copy), v46 (copy), l_AvatarScreen_0 (copy), v50 (copy), l_AvatarEditorCategories_0 (copy), v15 (copy), v17 (copy), v18 (copy), l_FFlagAddSocialLinksToCommunityProfile_0 (copy), v34 (copy), v35 (copy), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v11 (copy), v10 (copy), v13 (copy), v14 (copy)
    local v56 = l_useDispatch_0();
    local v57 = l_useNavigation_0();
    local v58 = l_useRoactService_0(v48);
    local v61 = l_useNavigationProps_0(function(v59, v60) --[[ Line: 75 ]]
        -- upvalues: l_FFlagEnableMobileGameJoinCard_0 (ref)
        return {
            profileId = v59, 
            profileType = v60.profileType, 
            absolutePosition = v60.absolutePosition, 
            source = v60.source, 
            contextualInfoType = v60.contextualInfoType, 
            contextualInfoDisplay = v60.contextualInfoDisplay, 
            profileUserNickname = v60.profileUserNickname, 
            sessionIdOverride = v60.sessionIdOverride, 
            isRecommendation = v60.isRecommendation, 
            recommendationContextType = v60.recommendationContextType, 
            recommendationSessionId = v60.recommendationSessionId, 
            recommendationRank = v60.recommendationRank, 
            offNetworkFriendRequestToken = v60.offNetworkFriendRequestToken, 
            shareLinkId = v60.shareLinkId, 
            friendshipOriginSourceType = v60.friendshipOriginSourceType, 
            initialPresence = v60.initialPresence, 
            mountAsFullView = if l_FFlagEnableMobileGameJoinCard_0 then v60.mountAsFullView else nil
        };
    end);
    local v62 = l_Enums_0.FriendshipOriginSourceType.UserProfile.rawValue();
    if v61.source == "playerSearch" then
        v62 = l_Enums_0.FriendshipOriginSourceType.PlayerSearch.rawValue();
    elseif v61.isRecommendation then
        v62 = l_Enums_0.FriendshipOriginSourceType.FriendRecommendations.rawValue();
    elseif v61.friendshipOriginSourceType then
        v62 = v61.friendshipOriginSourceType;
    end;
    local v65 = l_useSelector_0(function(v63) --[[ Line: 106 ]]
        -- upvalues: l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref), l_getDeepValue_0 (ref)
        if l_FFlagUseNavigationSelectors_0 then
            return l_Selectors_0.selectCurrentPageName(v63);
        else
            local v64 = l_getDeepValue_0(v63, "Navigation.history") or {};
            return ((v64[#v64] or {})[#v64] or {}).name;
        end;
    end);
    local v66 = if l_FFlagEnablePlatformProfileContextualMenuOption_0 then v9.Hooks.useUserProfilesFetch({
        userIds = {
            v61.profileId
        }, 
        query = v9.Queries.userProfilesPlatformProfileIdsByUserIds
    }) else nil;
    local v67 = if l_FFlagEnablePlatformProfileContextualMenuOption_0 and v66.data then v9.Selectors.getPlatformProfileIdFromId(v66.data, v61.profileId) else nil;
    local v68 = tostring(v61.profileId);
    local v69 = v61.profileType or l_ProfileTypes_0.User;
    local v70 = if l_FFlagProfilePlatformEnableImpressions_0 then v2.useMemo(function() --[[ Line: 131 ]]
        -- upvalues: v61 (copy), l_HttpService_0 (ref)
        return v61.sessionIdOverride or l_HttpService_0:GenerateGUID(false);
    end, {
        v61.sessionIdOverride
    }) else nil;
    local v82 = v2.useMemo(function() --[[ Line: 139 ]]
        -- upvalues: v56 (copy), v16 (ref), l_Contexts_0 (ref), l_peekViewDismissedEvent_0 (ref), l_DefaultAnalyticsService_0 (ref), v65 (copy), l_NavigateBack_0 (ref), v32 (ref), v31 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), l_ImpressionEnums_0 (ref), l_FFlagProfilePlatformEnableStore_0 (ref), v40 (ref), v39 (ref), v57 (copy), l_FFlagAddIEMProfilePage_0 (ref), v46 (ref), l_AvatarScreen_0 (ref), v50 (ref), l_AvatarEditorCategories_0 (ref), v15 (ref), v17 (ref), v18 (ref), l_FFlagAddSocialLinksToCommunityProfile_0 (ref), v34 (ref), v35 (ref), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (ref), v58 (copy), v61 (copy), v62 (ref), l_FFlagProfilePlatformEnableImpressions_0 (ref), v70 (copy), v68 (copy), v67 (copy), v69 (copy), l_FFlagEnableMobileGameJoinCard_0 (ref)
        return {
            navigateTo = {
                qRCodePage = function() --[[ Line: 142 ]] --[[ Name: qRCodePage ]]
                    -- upvalues: v56 (ref), v16 (ref), l_Contexts_0 (ref)
                    v56(v16({
                        source = l_Contexts_0.ProfileCard
                    }));
                end, 
                previousView = function(v71) --[[ Line: 147 ]] --[[ Name: previousView ]]
                    -- upvalues: l_peekViewDismissedEvent_0 (ref), l_DefaultAnalyticsService_0 (ref), v65 (ref), v56 (ref), l_NavigateBack_0 (ref)
                    if v71 then
                        l_peekViewDismissedEvent_0.logEvent(l_DefaultAnalyticsService_0.EventStream, "ProfilePeekView", {
                            dismissMethod = l_peekViewDismissedEvent_0.dismissMethodEnum.topBarTap, 
                            page = v65
                        });
                    end;
                    local v72 = not v71 or nil;
                    v56(l_NavigateBack_0(v72));
                end, 
                itemDetails = function(v73) --[[ Line: 159 ]] --[[ Name: itemDetails ]]
                    -- upvalues: v56 (ref), v32 (ref), v31 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), l_ImpressionEnums_0 (ref)
                    v56(v32(v73, v31.ItemType.Asset, nil, l_FFlagAXFixPurchaseSurfaceLogging_0 and true or nil, if l_FFlagAXFixPurchaseSurfaceLogging_0 then l_ImpressionEnums_0.MarketplaceSurfaceType.USER_PROFILE else nil));
                end, 
                itemOrBundleDetails = l_FFlagProfilePlatformEnableStore_0 and function(v74, v75) --[[ Line: 173 ]]
                    -- upvalues: v56 (ref), v32 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), l_ImpressionEnums_0 (ref)
                    v56(v32(v74, v75, nil, l_FFlagAXFixPurchaseSurfaceLogging_0 and true or nil, if l_FFlagAXFixPurchaseSurfaceLogging_0 then l_ImpressionEnums_0.MarketplaceSurfaceType.USER_PROFILE else nil));
                end or nil, 
                catalogSearch = l_FFlagProfilePlatformEnableStore_0 and function(v76) --[[ Line: 188 ]]
                    -- upvalues: v56 (ref), v40 (ref), v39 (ref), v57 (ref)
                    v56(v40(v76));
                    v56(v39(v57, {}));
                end or nil, 
                inspectAvatar = l_FFlagAddIEMProfilePage_0 and function() --[[ Line: 193 ]]

                end or nil, 
                editAvatar = function() --[[ Line: 194 ]] --[[ Name: editAvatar ]]
                    -- upvalues: v46 (ref), v57 (ref), l_AvatarScreen_0 (ref)
                    if v46 then
                        v57.navigate(l_AvatarScreen_0.Catalog);
                        return;
                    else
                        v57.navigate(l_AvatarScreen_0.AvatarEditor);
                        return;
                    end;
                end, 
                editEmotes = v46 and function() --[[ Line: 202 ]]
                    -- upvalues: v50 (ref), l_AvatarEditorCategories_0 (ref), v57 (ref), l_AvatarScreen_0 (ref)
                    local v77 = v50.resolveEditorCategory(l_AvatarEditorCategories_0.Emotes);
                    v57.navigate(l_AvatarScreen_0.AvatarEditor, {
                        category = v77
                    });
                end or nil, 
                switchAvatar = v46 and function() --[[ Line: 209 ]]
                    -- upvalues: v50 (ref), l_AvatarEditorCategories_0 (ref), v57 (ref), l_AvatarScreen_0 (ref)
                    local v78 = v50.resolveEditorCategory(l_AvatarEditorCategories_0.Avatars);
                    v57.navigate(l_AvatarScreen_0.AvatarEditor, {
                        category = v78
                    });
                end or nil, 
                editUsername = function(v79) --[[ Line: 215 ]] --[[ Name: editUsername ]]
                    -- upvalues: v56 (ref), v15 (ref), v17 (ref), v18 (ref)
                    v56(v15({
                        name = v17.EditUsername, 
                        extraProps = {
                            BrowserWrapperComponent = v18, 
                            showToast = v79.showToast, 
                            onUsernameChanged = v79.onUsernameChanged
                        }
                    }));
                end, 
                openLeaveRobloxAlertUIBlox = l_FFlagAddSocialLinksToCommunityProfile_0 and function(v80) --[[ Line: 229 ]]
                    -- upvalues: v56 (ref), v34 (ref)
                    v56(v34(v80));
                end or nil, 
                closeLeaveRobloxAlert = l_FFlagAddSocialLinksToCommunityProfile_0 and function() --[[ Line: 234 ]]
                    -- upvalues: v56 (ref), v35 (ref)
                    v56(v35());
                end or nil, 
                navigateToTransfer = l_FFlagProfilePlatformEnableCurrencyTransfer_0 and function(v81) --[[ Line: 239 ]]
                    -- upvalues: v56 (ref), v15 (ref), v17 (ref)
                    v56(v15({
                        name = v17.TransferRobuxFlow, 
                        extraProps = {
                            direction = v81.direction, 
                            recipientUserId = v81.recipientUserId, 
                            transferId = v81.transferId, 
                            transferOrigination = v81.transferOrigination
                        }
                    }));
                end or nil
            }, 
            externalAnalytics = {
                catalogAnalytics = v58
            }, 
            sourceInfo = {
                homepageCarouselAbsolutePosition = v61.absolutePosition, 
                source = v61.source, 
                contextualInfoType = v61.contextualInfoType, 
                contextualOverride = v61.contextualInfoDisplay, 
                isRecommendation = v61.isRecommendation, 
                recommendationContextType = v61.recommendationContextType, 
                recommendationSessionId = v61.recommendationSessionId, 
                recommendationRank = v61.recommendationRank, 
                friendshipOriginSourceType = v62, 
                shareLinkId = v61.shareLinkId
            }, 
            profileSessionId = if l_FFlagProfilePlatformEnableImpressions_0 then v70 else nil, 
            profileId = v68, 
            profilePlatformId = v67, 
            profileType = v69, 
            profileUserNickname = v61.profileUserNickname, 
            sessionIdOverride = if l_FFlagProfilePlatformEnableImpressions_0 then nil else v61.sessionIdOverride, 
            offNetworkFriendRequestToken = v61.offNetworkFriendRequestToken, 
            initialPresence = v61.initialPresence, 
            mountAsFullView = if l_FFlagEnableMobileGameJoinCard_0 then v61.mountAsFullView else nil
        };
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v68, 
        v56, 
        v65, 
        v61.absolutePosition, 
        v61.source, 
        v58, 
        v57
    } else l_dependencyArray_0(v68, v56, v65, v61.absolutePosition, v61.source, v58, v57));
    return v2.createElement(v11.Provider, {
        value = v82
    }, {
        ProfilePlatformNavigator = v2.createElement(v10, v55), 
        androidBackButtonNavigationHandler = v2.createElement(v13, {
            canGoBackInRN = not v14(v57.state), 
            navigateBackInRN = v57.pop
        })
    });
end;
local v84 = v2.PureComponent:extend("classWrapper");
v84.render = function(v85) --[[ Line: 316 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v83 (copy)
    return v2.createElement(v83, v85.props);
end;
v84.router = v10.router;
return v84;