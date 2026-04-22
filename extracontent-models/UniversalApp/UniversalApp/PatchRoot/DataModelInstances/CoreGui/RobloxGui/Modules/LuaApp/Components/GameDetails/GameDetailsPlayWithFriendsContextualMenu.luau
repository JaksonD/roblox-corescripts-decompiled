local l_CorePackages_0 = game:GetService("CorePackages");
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v5.App.ImageSet.Images;
local l_ContextualMenu_0 = v5.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v5.App.Menu.MenuDirection;
local v9 = require(l_CorePackages_0.Packages.Otter);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local l_CloseCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateDown;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_UserIconList_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).UserIconList;
local l_UrlBuilder_0 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_GameInfosReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameInfosRodux).GameInfosReducer;
local v23 = require(l_CorePackages_0.Workspace.Packages.GameInvite);
local l_GameInviteModalManager_0 = v23.GameInviteModalManager;
local l_GameInviteConstants_0 = v23.GameInviteConstants;
local l_GameInviteAnalyticsManager_0 = v23.GameInviteAnalyticsManager;
local l_GameDetailsEvents_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents;
local l_CreatePrivateGame_0 = l_GameDetailsEvents_0.CreatePrivateGame;
local l_JoinFriendsInGame_0 = l_GameDetailsEvents_0.JoinFriendsInGame;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v31 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v32 = require(l_Modules_0.LuaApp.sortFriendsByPresenceAndRecency);
local v33 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppRenameFriendsToConnectionsEdp;
local l_FFlagHideCloseButtonEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagHideCloseButtonEdp;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local v38 = game:DefineFastFlag("LuaAppCheckPlayabilityStatusPrivateServersEnabled", false);
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_FFlagEnableBlackbirdPageCloseCallback_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableBlackbirdPageCloseCallback;
local l_getSubscriptionPurchaseCloseCallback_0 = require(l_CorePackages_0.Workspace.Packages.RobloxSubscriptionPurchaseApp).Utils.getSubscriptionPurchaseCloseCallback;
local v42 = Vector2.new(64, 24);
local v49 = l_memoize_0(function(v43, v44) --[[ Line: 59 ]]
    -- upvalues: v32 (copy)
    if not v43 or not v44 then
        return {};
    else
        local v45 = {};
        for _, v47 in pairs(v44) do
            local v48 = v43[v47];
            if v48 and v48.isFriend then
                table.insert(v45, v48);
            end;
        end;
        table.sort(v45, v32);
        return v45;
    end;
end);
local v50 = v2.PureComponent:extend("GameDetailsPlayWithFriendsContextualMenu");
v50.validateProps = v4.strictInterface({
    universeId = v4.string, 
    menuPosition = v4.optional(v4.UDim2), 
    hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v4.optional(v4.boolean) else nil, 
    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v4.optional(v4.boolean) else nil, 
    closeCentralOverlayThunk = v4.optional(v4.callback), 
    focusController = v4.optional(v4.table), 
    defaultChildRef = v4.optional(v4.table), 
    rootPlaceId = v4.optional(v4.string), 
    currentPage = v4.string, 
    users = v4.optional(v4.table), 
    inGameUsersByGame = v4.optional(v4.table), 
    screenSize = v4.optional(v4.Vector2), 
    deviceOrientation = v4.string, 
    privateServersEnabled = v4.optional(v4.boolean), 
    closeCallback = v4.callback, 
    navigateDown = v4.callback, 
    appTheme = v4.any, 
    webViewSupport = v4.optional(v4.boolean), 
    renameFriendsToConnections = if l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 then v4.optional(v4.boolean) else nil, 
    networking = v4.callback, 
    localization = v4.table, 
    eventIngest = v4.table
});
v50.init = function(v51) --[[ Line: 114 ]] --[[ Name: init ]]
    v51.getMenuPos = function() --[[ Line: 115 ]]
        -- upvalues: v51 (copy)
        if v51.props.menuPosition == nil then
            return UDim2.fromOffset(0, 0);
        else
            return v51.props.menuPosition;
        end;
    end;
    v51.getMenuSize = function() --[[ Line: 122 ]]
        return UDim2.new(0, 300, 1, 0);
    end;
    v51.getMenuAnchor = function() --[[ Line: 126 ]]
        -- upvalues: v51 (copy)
        if v51.props.menuPosition == nil or v51.props.screenSize == nil then
            return nil;
        else
            return Vector2.new(0, 0);
        end;
    end;
end;
v50.getItems = function(v52, v53) --[[ Line: 134 ]] --[[ Name: getItems ]]
    -- upvalues: v49 (copy), l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 (copy), l_Images_0 (copy), l_GameInviteAnalyticsManager_0 (copy), l_GameInviteModalManager_0 (copy), l_GameInviteConstants_0 (copy), l_FFlagHideCloseButtonEdp_0 (copy), l_FFlagEnableBlackbirdPageCloseCallback_0 (copy), l_getSubscriptionPurchaseCloseCallback_0 (copy), l_UrlBuilder_0 (copy), l_AppPage_0 (copy), l_CreatePrivateGame_0 (copy), l_JoinFriendsInGame_0 (copy), v2 (copy), l_UserIconList_0 (copy), v42 (copy)
    local l_closeCallback_0 = v52.props.closeCallback;
    local l_eventIngest_0 = v52.props.eventIngest;
    local l_rootPlaceId_0 = v52.props.rootPlaceId;
    local l_users_0 = v52.props.users;
    local l_inGameUsersByGame_0 = v52.props.inGameUsersByGame;
    local v59 = v49(l_users_0, l_inGameUsersByGame_0);
    local l_appTheme_0 = v52.props.appTheme;
    local l_privateServersEnabled_0 = v52.props.privateServersEnabled;
    local v62 = if l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 then v52.props.renameFriendsToConnections else nil;
    local v63 = {};
    table.insert(v63, {
        text = if l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 and v62 then v53.inviteConnections else v53.inviteFriends, 
        icon = l_Images_0["icons/actions/friends/friendInvite"], 
        onActivated = function() --[[ Line: 155 ]] --[[ Name: onActivated ]]
            -- upvalues: v52 (copy), l_rootPlaceId_0 (copy), l_GameInviteAnalyticsManager_0 (ref), l_GameInviteModalManager_0 (ref), l_GameInviteConstants_0 (ref), l_FFlagHideCloseButtonEdp_0 (ref), l_closeCallback_0 (copy)
            if not v52.isMounted or not l_rootPlaceId_0 then
                return;
            else
                l_GameInviteAnalyticsManager_0:withButtonName(l_GameInviteAnalyticsManager_0.ButtonName.GameDetailsPlayWithFriendsMenu);
                l_GameInviteAnalyticsManager_0:inputShareGameEntryPoint(l_rootPlaceId_0, v52.props.universeId);
                l_GameInviteModalManager_0:openModal({
                    trigger = l_GameInviteConstants_0.Triggers.GameDetailsPlayWithFriendsMenu, 
                    rootPlaceId = l_rootPlaceId_0, 
                    universeId = v52.props.universeId, 
                    hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v52.props.hideCloseButton else nil
                });
                l_closeCallback_0();
                return;
            end;
        end
    });
    local l_webViewSupport_0 = v52.props.webViewSupport;
    local v65 = if l_FFlagEnableBlackbirdPageCloseCallback_0 and l_getSubscriptionPurchaseCloseCallback_0 then l_getSubscriptionPurchaseCloseCallback_0() else nil;
    if l_webViewSupport_0 and l_privateServersEnabled_0 then
        table.insert(v63, {
            text = v53.createPrivateGame, 
            icon = l_Images_0["icons/actions/edit/add"], 
            onActivated = function() --[[ Line: 184 ]] --[[ Name: onActivated ]]
                -- upvalues: v52 (copy), l_rootPlaceId_0 (copy), l_UrlBuilder_0 (ref), l_AppPage_0 (ref), v53 (copy), l_FFlagEnableBlackbirdPageCloseCallback_0 (ref), v65 (copy), l_CreatePrivateGame_0 (ref), l_eventIngest_0 (copy), l_closeCallback_0 (copy)
                if not v52.isMounted or not l_rootPlaceId_0 then
                    return;
                else
                    local l_universeId_0 = v52.props.universeId;
                    local v67 = l_UrlBuilder_0.game.info.serversPreopenCreateVip({
                        universeId = l_universeId_0
                    });
                    v52.props.navigateDown({
                        name = l_AppPage_0.GenericWebPage, 
                        detail = v67, 
                        extraProps = {
                            title = v53.createPrivateGame, 
                            onClose = if l_FFlagEnableBlackbirdPageCloseCallback_0 then v65 else nil
                        }
                    });
                    l_CreatePrivateGame_0(l_eventIngest_0, "GameDetailsPlayWithFriendsContextualMenu", l_rootPlaceId_0);
                    l_closeCallback_0();
                    return;
                end;
            end
        });
    end;
    if v52.props.webViewSupport then
        table.insert(v63, {
            text = if l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 and v62 then v53.joinConnections else v53.joinFriendsInGame, 
            icon = l_Images_0["icons/actions/friends/friendsplaying"], 
            onActivated = function() --[[ Line: 214 ]] --[[ Name: onActivated ]]
                -- upvalues: v52 (copy), l_rootPlaceId_0 (copy), l_UrlBuilder_0 (ref), l_AppPage_0 (ref), l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 (ref), v62 (copy), v53 (copy), l_FFlagEnableBlackbirdPageCloseCallback_0 (ref), v65 (copy), l_JoinFriendsInGame_0 (ref), l_eventIngest_0 (copy), l_closeCallback_0 (copy)
                if not v52.isMounted or not l_rootPlaceId_0 then
                    return;
                else
                    local l_universeId_1 = v52.props.universeId;
                    local v69 = l_UrlBuilder_0.game.info.servers({
                        universeId = l_universeId_1
                    });
                    v52.props.navigateDown({
                        name = l_AppPage_0.GenericWebPage, 
                        detail = v69, 
                        extraProps = {
                            title = if l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 and v62 then v53.joinConnections else v53.joinFriendsInGame, 
                            onClose = if l_FFlagEnableBlackbirdPageCloseCallback_0 then v65 else nil
                        }
                    });
                    l_JoinFriendsInGame_0(l_eventIngest_0, "GameDetailsPlayWithFriendsContextualMenu", l_rootPlaceId_0);
                    l_closeCallback_0();
                    return;
                end;
            end, 
            renderRightSideGadget = function() --[[ Line: 237 ]] --[[ Name: renderRightSideGadget ]]
                -- upvalues: v2 (ref), l_UserIconList_0 (ref), v59 (copy), v42 (ref), l_appTheme_0 (copy)
                return {
                    UserIconList = v2.createElement(l_UserIconList_0, {
                        users = v59, 
                        width = v42.X, 
                        height = v42.Y, 
                        maskColor = l_appTheme_0.Background and l_appTheme_0.Background.Color or nil
                    })
                };
            end, 
            rightSideGadgetSize = v42
        });
    end;
    return v63;
end;
v50.renderLandscapeContextualMenu = function(v70) --[[ Line: 254 ]] --[[ Name: renderLandscapeContextualMenu ]]
    -- upvalues: v2 (copy), l_ContextualMenu_0 (copy), v9 (copy), l_withLocalization_0 (copy), l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 (copy)
    local l_closeCallback_1 = v70.props.closeCallback;
    local l_screenSize_0 = v70.props.screenSize;
    local function v78(v73) --[[ Line: 258 ]]
        -- upvalues: v70 (copy), v2 (ref), l_ContextualMenu_0 (ref), l_screenSize_0 (copy), l_closeCallback_1 (copy), v9 (ref)
        local v74 = v70:getItems(v73);
        local v75 = v70.getMenuPos();
        local v76 = v70:getMenuAnchor();
        local v77 = v70.getMenuSize();
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = v75, 
            Size = v77
        }, {
            ContextMenu = v2.createElement(l_ContextualMenu_0, {
                buttonProps = v74, 
                open = true, 
                horizontalAlignment = Enum.HorizontalAlignment.Left, 
                openPositionX = UDim.new(0, 0), 
                openPositionY = UDim.new(0, 0), 
                closeBackgroundVisible = false, 
                screenSize = l_screenSize_0, 
                onDismiss = l_closeCallback_1, 
                contextMenuWidthOverride = UDim.new(1, 0), 
                anchorPointOverride = v76, 
                motorOverrideOptions = {
                    motorCallback = v9.instant, 
                    open = {
                        targetValue = 1
                    }, 
                    close = {
                        targetValue = 0
                    }
                }
            })
        });
    end;
    return l_withLocalization_0({
        inviteFriends = "Feature.GameDetails.Action.InviteFriends", 
        inviteConnections = l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 and "CommonUI.Features.Label.InviteConnections" or nil, 
        joinFriendsInGame = "Feature.GameDetails.Action.JoinFriendsInGame", 
        joinConnections = l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 and "CommonUI.Features.Label.JoinConnections" or nil, 
        createPrivateGame = "Feature.GameDetails.Action.CreatePrivateGame"
    })(v78);
end;
v50.didMount = function(v79) --[[ Line: 306 ]] --[[ Name: didMount ]]
    -- upvalues: l_AppPage_0 (copy)
    v79.isMounted = true;
    local l_currentPage_0 = v79.props.currentPage;
    local l_closeCallback_2 = v79.props.closeCallback;
    if l_currentPage_0 ~= l_AppPage_0.GameDetail and l_currentPage_0 ~= l_AppPage_0.ExperienceDetail then
        l_closeCallback_2();
    end;
end;
v50.WillUnmount = function(v82) --[[ Line: 316 ]] --[[ Name: WillUnmount ]]
    v82.isMounted = false;
end;
v50.renderPortraitContextualMenu = function(v83) --[[ Line: 320 ]] --[[ Name: renderPortraitContextualMenu ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v2 (copy), l_ContextualMenu_0 (copy), l_MenuDirection_0 (copy), l_withLocalization_0 (copy), l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 (copy)
    local l_closeCallback_3 = v83.props.closeCallback;
    local l_screenSize_1 = v83.props.screenSize;
    local function v91(v86) --[[ Line: 324 ]]
        -- upvalues: v83 (copy), l_DeviceOrientationMode_0 (ref), l_screenSize_1 (copy), v2 (ref), l_ContextualMenu_0 (ref), l_MenuDirection_0 (ref), l_closeCallback_3 (copy)
        local v87 = v83:getItems(v86);
        local v88 = v83.props.deviceOrientation == l_DeviceOrientationMode_0.Portrait;
        local v89 = l_screenSize_1 ~= nil and l_screenSize_1.X > 0 and v83.props.menuPosition.X.Offset / l_screenSize_1.X / 2 or 0;
        local v90 = v88 and 0 or v89;
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(v90, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            ContextMenu = v2.createElement(l_ContextualMenu_0, {
                buttonProps = v87, 
                open = true, 
                menuDirection = l_MenuDirection_0.Up, 
                openPositionY = UDim.new(1, -76), 
                closeBackgroundVisible = false, 
                screenSize = l_screenSize_1, 
                onDismiss = l_closeCallback_3
            })
        });
    end;
    return l_withLocalization_0({
        inviteFriends = "Feature.GameDetails.Action.InviteFriends", 
        inviteConnections = l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 and "CommonUI.Features.Label.InviteConnections" or nil, 
        joinFriendsInGame = "Feature.GameDetails.Action.JoinFriendsInGame", 
        joinConnections = l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 and "CommonUI.Features.Label.JoinConnections" or nil, 
        createPrivateGame = "Feature.GameDetails.Action.CreatePrivateGame"
    })(v91);
end;
v50.render = function(v92) --[[ Line: 365 ]] --[[ Name: render ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy)
    if v92.props.deviceOrientation == l_DeviceOrientationMode_0.Portrait then
        return v92:renderPortraitContextualMenu();
    else
        return v92:renderLandscapeContextualMenu();
    end;
end;
v50 = v33((v3.connect(function(v93, v94) --[[ Line: 377 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_GameInfosReducer_0 (copy), v38 (copy)
    local v95 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentLegacyRoute(v93) else v93.Navigation.history[#v93.Navigation.history];
    local v96 = if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v94.shouldHydrateLegacyIxp then v93.GameDetailsV2[v94.universeId] else v93.GameDetails[v94.universeId];
    local v97 = v93.Personalization[l_GameInfosReducer_0.key][v94.universeId];
    local v98 = if v38 then v93.PlayabilityStatus[v94.universeId] and v93.PlayabilityStatus[v94.universeId].isPlayable and v93.GamePrivateServersEnabled[v94.universeId] else v93.GamePrivateServersEnabled[v94.universeId];
    return {
        rootPlaceId = v96 and v96.rootPlaceId or v97 and v97.placeId or nil, 
        currentPage = v95[#v95].name, 
        users = v93.Users, 
        inGameUsersByGame = v93.InGameUsersByGame[v94.universeId], 
        screenSize = v93.ScreenSize, 
        deviceOrientation = v93.DeviceOrientation, 
        privateServersEnabled = v98
    };
end, function(v99) --[[ Line: 404 ]]
    -- upvalues: l_CloseCentralOverlay_0 (copy), l_NavigateDown_0 (copy)
    return {
        closeCallback = function() --[[ Line: 406 ]] --[[ Name: closeCallback ]]
            -- upvalues: v99 (copy), l_CloseCentralOverlay_0 (ref)
            v99(l_CloseCentralOverlay_0());
        end, 
        navigateDown = function(v100) --[[ Line: 409 ]] --[[ Name: navigateDown ]]
            -- upvalues: v99 (copy), l_NavigateDown_0 (ref)
            return v99(l_NavigateDown_0(v100));
        end
    };
end)(v50)));
v50 = l_RoactAppPolicy_0.connect(function(v101) --[[ Line: 417 ]]
    -- upvalues: l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 (copy)
    local v102 = v101.getWebViewSupport();
    local v103 = if l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 then v101.getRenameFriendsToConnections() else nil;
    return {
        webViewSupport = v102, 
        renameFriendsToConnections = if l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 then v103 else nil
    };
end)(v50);
return l_RoactServices_0.connect({
    networking = l_RoactNetworking_0, 
    localization = v31, 
    eventIngest = l_AppEventIngestService_0
})(v50);