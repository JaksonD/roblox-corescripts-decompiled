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
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_UserIconList_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).UserIconList;
local l_UrlBuilder_0 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_GameInfosReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameInfosRodux).GameInfosReducer;
local v22 = require(l_CorePackages_0.Workspace.Packages.GameInvite);
local l_GameInviteModalManager_0 = v22.GameInviteModalManager;
local l_GameInviteConstants_0 = v22.GameInviteConstants;
local l_GameInviteAnalyticsManager_0 = v22.GameInviteAnalyticsManager;
local l_GameDetailsEvents_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents;
local l_CreatePrivateGame_0 = l_GameDetailsEvents_0.CreatePrivateGame;
local l_JoinFriendsInGame_0 = l_GameDetailsEvents_0.JoinFriendsInGame;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v30 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v31 = require(l_Modules_0.LuaApp.sortFriendsByPresenceAndRecency);
local v32 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppRenameFriendsToConnectionsEdp;
local l_FFlagHideCloseButtonEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagHideCloseButtonEdp;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local v37 = game:DefineFastFlag("LuaAppCheckPlayabilityStatusPrivateServersEnabled", false);
local v38 = Vector2.new(64, 24);
local v45 = l_memoize_0(function(v39, v40) --[[ Line: 53 ]]
    -- upvalues: v31 (copy)
    if not v39 or not v40 then
        return {};
    else
        local v41 = {};
        for _, v43 in pairs(v40) do
            local v44 = v39[v43];
            if v44 and v44.isFriend then
                table.insert(v41, v44);
            end;
        end;
        table.sort(v41, v31);
        return v41;
    end;
end);
local v46 = v2.PureComponent:extend("GameDetailsPlayWithFriendsContextualMenu");
v46.validateProps = v4.strictInterface({
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
v46.init = function(v47) --[[ Line: 108 ]] --[[ Name: init ]]
    v47.getMenuPos = function() --[[ Line: 109 ]]
        -- upvalues: v47 (copy)
        if v47.props.menuPosition == nil then
            return UDim2.fromOffset(0, 0);
        else
            return v47.props.menuPosition;
        end;
    end;
    v47.getMenuSize = function() --[[ Line: 116 ]]
        return UDim2.new(0, 300, 1, 0);
    end;
    v47.getMenuAnchor = function() --[[ Line: 120 ]]
        -- upvalues: v47 (copy)
        if v47.props.menuPosition == nil or v47.props.screenSize == nil then
            return nil;
        else
            return Vector2.new(0, 0);
        end;
    end;
end;
v46.getItems = function(v48, v49) --[[ Line: 128 ]] --[[ Name: getItems ]]
    -- upvalues: v45 (copy), l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 (copy), l_Images_0 (copy), l_GameInviteAnalyticsManager_0 (copy), l_GameInviteModalManager_0 (copy), l_GameInviteConstants_0 (copy), l_FFlagHideCloseButtonEdp_0 (copy), l_UrlBuilder_0 (copy), l_AppPage_0 (copy), l_CreatePrivateGame_0 (copy), l_JoinFriendsInGame_0 (copy), v2 (copy), l_UserIconList_0 (copy), v38 (copy)
    local l_closeCallback_0 = v48.props.closeCallback;
    local l_eventIngest_0 = v48.props.eventIngest;
    local l_rootPlaceId_0 = v48.props.rootPlaceId;
    local l_users_0 = v48.props.users;
    local l_inGameUsersByGame_0 = v48.props.inGameUsersByGame;
    local v55 = v45(l_users_0, l_inGameUsersByGame_0);
    local l_appTheme_0 = v48.props.appTheme;
    local l_privateServersEnabled_0 = v48.props.privateServersEnabled;
    local v58 = if l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 then v48.props.renameFriendsToConnections else nil;
    local v59 = {};
    table.insert(v59, {
        text = if l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 and v58 then v49.inviteConnections else v49.inviteFriends, 
        icon = l_Images_0["icons/actions/friends/friendInvite"], 
        onActivated = function() --[[ Line: 149 ]] --[[ Name: onActivated ]]
            -- upvalues: v48 (copy), l_rootPlaceId_0 (copy), l_GameInviteAnalyticsManager_0 (ref), l_GameInviteModalManager_0 (ref), l_GameInviteConstants_0 (ref), l_FFlagHideCloseButtonEdp_0 (ref), l_closeCallback_0 (copy)
            if not v48.isMounted or not l_rootPlaceId_0 then
                return;
            else
                l_GameInviteAnalyticsManager_0:withButtonName(l_GameInviteAnalyticsManager_0.ButtonName.GameDetailsPlayWithFriendsMenu);
                l_GameInviteAnalyticsManager_0:inputShareGameEntryPoint(l_rootPlaceId_0, v48.props.universeId);
                l_GameInviteModalManager_0:openModal({
                    trigger = l_GameInviteConstants_0.Triggers.GameDetailsPlayWithFriendsMenu, 
                    rootPlaceId = l_rootPlaceId_0, 
                    universeId = v48.props.universeId, 
                    hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v48.props.hideCloseButton else nil
                });
                l_closeCallback_0();
                return;
            end;
        end
    });
    if v48.props.webViewSupport and l_privateServersEnabled_0 then
        table.insert(v59, {
            text = v49.createPrivateGame, 
            icon = l_Images_0["icons/actions/edit/add"], 
            onActivated = function() --[[ Line: 174 ]] --[[ Name: onActivated ]]
                -- upvalues: v48 (copy), l_rootPlaceId_0 (copy), l_UrlBuilder_0 (ref), l_AppPage_0 (ref), v49 (copy), l_CreatePrivateGame_0 (ref), l_eventIngest_0 (copy), l_closeCallback_0 (copy)
                if not v48.isMounted or not l_rootPlaceId_0 then
                    return;
                else
                    local l_universeId_0 = v48.props.universeId;
                    local v61 = l_UrlBuilder_0.game.info.serversPreopenCreateVip({
                        universeId = l_universeId_0
                    });
                    v48.props.navigateDown({
                        name = l_AppPage_0.GenericWebPage, 
                        detail = v61, 
                        extraProps = {
                            title = v49.createPrivateGame
                        }
                    });
                    l_CreatePrivateGame_0(l_eventIngest_0, "GameDetailsPlayWithFriendsContextualMenu", l_rootPlaceId_0);
                    l_closeCallback_0();
                    return;
                end;
            end
        });
    end;
    if v48.props.webViewSupport then
        table.insert(v59, {
            text = if l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 and v58 then v49.joinConnections else v49.joinFriendsInGame, 
            icon = l_Images_0["icons/actions/friends/friendsplaying"], 
            onActivated = function() --[[ Line: 203 ]] --[[ Name: onActivated ]]
                -- upvalues: v48 (copy), l_rootPlaceId_0 (copy), l_UrlBuilder_0 (ref), l_AppPage_0 (ref), l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 (ref), v58 (copy), v49 (copy), l_JoinFriendsInGame_0 (ref), l_eventIngest_0 (copy), l_closeCallback_0 (copy)
                if not v48.isMounted or not l_rootPlaceId_0 then
                    return;
                else
                    local l_universeId_1 = v48.props.universeId;
                    local v63 = l_UrlBuilder_0.game.info.servers({
                        universeId = l_universeId_1
                    });
                    v48.props.navigateDown({
                        name = l_AppPage_0.GenericWebPage, 
                        detail = v63, 
                        extraProps = {
                            title = if l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 and v58 then v49.joinConnections else v49.joinFriendsInGame
                        }
                    });
                    l_JoinFriendsInGame_0(l_eventIngest_0, "GameDetailsPlayWithFriendsContextualMenu", l_rootPlaceId_0);
                    l_closeCallback_0();
                    return;
                end;
            end, 
            renderRightSideGadget = function() --[[ Line: 225 ]] --[[ Name: renderRightSideGadget ]]
                -- upvalues: v2 (ref), l_UserIconList_0 (ref), v55 (copy), v38 (ref), l_appTheme_0 (copy)
                return {
                    UserIconList = v2.createElement(l_UserIconList_0, {
                        users = v55, 
                        width = v38.X, 
                        height = v38.Y, 
                        maskColor = l_appTheme_0.Background and l_appTheme_0.Background.Color or nil
                    })
                };
            end, 
            rightSideGadgetSize = v38
        });
    end;
    return v59;
end;
v46.renderLandscapeContextualMenu = function(v64) --[[ Line: 242 ]] --[[ Name: renderLandscapeContextualMenu ]]
    -- upvalues: v2 (copy), l_ContextualMenu_0 (copy), v9 (copy), l_withLocalization_0 (copy), l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 (copy)
    local l_closeCallback_1 = v64.props.closeCallback;
    local l_screenSize_0 = v64.props.screenSize;
    local function v72(v67) --[[ Line: 246 ]]
        -- upvalues: v64 (copy), v2 (ref), l_ContextualMenu_0 (ref), l_screenSize_0 (copy), l_closeCallback_1 (copy), v9 (ref)
        local v68 = v64:getItems(v67);
        local v69 = v64.getMenuPos();
        local v70 = v64:getMenuAnchor();
        local v71 = v64.getMenuSize();
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = v69, 
            Size = v71
        }, {
            ContextMenu = v2.createElement(l_ContextualMenu_0, {
                buttonProps = v68, 
                open = true, 
                horizontalAlignment = Enum.HorizontalAlignment.Left, 
                openPositionX = UDim.new(0, 0), 
                openPositionY = UDim.new(0, 0), 
                closeBackgroundVisible = false, 
                screenSize = l_screenSize_0, 
                onDismiss = l_closeCallback_1, 
                contextMenuWidthOverride = UDim.new(1, 0), 
                anchorPointOverride = v70, 
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
    })(v72);
end;
v46.didMount = function(v73) --[[ Line: 294 ]] --[[ Name: didMount ]]
    -- upvalues: l_AppPage_0 (copy)
    v73.isMounted = true;
    local l_currentPage_0 = v73.props.currentPage;
    local l_closeCallback_2 = v73.props.closeCallback;
    if l_currentPage_0 ~= l_AppPage_0.GameDetail and l_currentPage_0 ~= l_AppPage_0.ExperienceDetail then
        l_closeCallback_2();
    end;
end;
v46.WillUnmount = function(v76) --[[ Line: 304 ]] --[[ Name: WillUnmount ]]
    v76.isMounted = false;
end;
v46.renderPortraitContextualMenu = function(v77) --[[ Line: 308 ]] --[[ Name: renderPortraitContextualMenu ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v2 (copy), l_ContextualMenu_0 (copy), l_MenuDirection_0 (copy), l_withLocalization_0 (copy), l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 (copy)
    local l_closeCallback_3 = v77.props.closeCallback;
    local l_screenSize_1 = v77.props.screenSize;
    local function v85(v80) --[[ Line: 312 ]]
        -- upvalues: v77 (copy), l_DeviceOrientationMode_0 (ref), l_screenSize_1 (copy), v2 (ref), l_ContextualMenu_0 (ref), l_MenuDirection_0 (ref), l_closeCallback_3 (copy)
        local v81 = v77:getItems(v80);
        local v82 = v77.props.deviceOrientation == l_DeviceOrientationMode_0.Portrait;
        local v83 = l_screenSize_1 ~= nil and l_screenSize_1.X > 0 and v77.props.menuPosition.X.Offset / l_screenSize_1.X / 2 or 0;
        local v84 = v82 and 0 or v83;
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(v84, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            ContextMenu = v2.createElement(l_ContextualMenu_0, {
                buttonProps = v81, 
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
    })(v85);
end;
v46.render = function(v86) --[[ Line: 353 ]] --[[ Name: render ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy)
    if v86.props.deviceOrientation == l_DeviceOrientationMode_0.Portrait then
        return v86:renderPortraitContextualMenu();
    else
        return v86:renderLandscapeContextualMenu();
    end;
end;
v46 = v32((v3.connect(function(v87, v88) --[[ Line: 365 ]]
    -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_GameInfosReducer_0 (copy), v37 (copy)
    local v89 = v87.Navigation.history[#v87.Navigation.history];
    local v90 = if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v88.shouldHydrateLegacyIxp then v87.GameDetailsV2[v88.universeId] else v87.GameDetails[v88.universeId];
    local v91 = v87.Personalization[l_GameInfosReducer_0.key][v88.universeId];
    local v92 = if v37 then v87.PlayabilityStatus[v88.universeId] and v87.PlayabilityStatus[v88.universeId].isPlayable and v87.GamePrivateServersEnabled[v88.universeId] else v87.GamePrivateServersEnabled[v88.universeId];
    return {
        rootPlaceId = v90 and v90.rootPlaceId or v91 and v91.placeId or nil, 
        currentPage = v89[#v89].name, 
        users = v87.Users, 
        inGameUsersByGame = v87.InGameUsersByGame[v88.universeId], 
        screenSize = v87.ScreenSize, 
        deviceOrientation = v87.DeviceOrientation, 
        privateServersEnabled = v92
    };
end, function(v93) --[[ Line: 390 ]]
    -- upvalues: l_CloseCentralOverlay_0 (copy), l_NavigateDown_0 (copy)
    return {
        closeCallback = function() --[[ Line: 392 ]] --[[ Name: closeCallback ]]
            -- upvalues: v93 (copy), l_CloseCentralOverlay_0 (ref)
            v93(l_CloseCentralOverlay_0());
        end, 
        navigateDown = function(v94) --[[ Line: 395 ]] --[[ Name: navigateDown ]]
            -- upvalues: v93 (copy), l_NavigateDown_0 (ref)
            return v93(l_NavigateDown_0(v94));
        end
    };
end)(v46)));
v46 = l_RoactAppPolicy_0.connect(function(v95) --[[ Line: 403 ]]
    -- upvalues: l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 (copy)
    local v96 = v95.getWebViewSupport();
    local v97 = if l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 then v95.getRenameFriendsToConnections() else nil;
    return {
        webViewSupport = v96, 
        renameFriendsToConnections = if l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 then v97 else nil
    };
end)(v46);
return l_RoactServices_0.connect({
    networking = l_RoactNetworking_0, 
    localization = v30, 
    eventIngest = l_AppEventIngestService_0
})(v46);