local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local v3 = require(l_script_FirstAncestor_0.Logger);
local v4 = require(l_script_FirstAncestor_0.Analytics);
local l_UIBlox_0 = v2.UIBlox;
local l_Roact_0 = v2.Roact;
local l_RoactRodux_0 = v2.RoactRodux;
local l_RoactNavigation_0 = v2.RoactNavigation;
local l_memoize_0 = v2.memoize;
local l_RetrievalStatus_0 = v2.RetrievalStatus;
local v11 = require(l_script_FirstAncestor_0.SocialTabContext);
local v12 = require(l_script_FirstAncestor_0.Navigators.getSocialTabNavigator);
local v13 = require(l_script_FirstAncestor_0.EnumScreens);
local l_LoadingStateContainer_0 = l_UIBlox_0.App.Container.LoadingStateContainer;
local l_RetrievalStatus_1 = l_UIBlox_0.App.Loading.Enum.RetrievalStatus;
local v16 = require(l_script_FirstAncestor_0.Components.SocialTabEntryPoint.mapStateToProps);
local v17 = require(l_script_FirstAncestor_0.Components.SocialTabEntryPoint.mapDispatchToProps);
local l_FFlagCreateConnectionsHub_0 = require(l_Parent_0.SharedFlags).FFlagCreateConnectionsHub;
local v19 = l_Roact_0.PureComponent:extend("SocialTabEntryPoint");
v19.defaultProps = {
    logger = nil
};
v19.getDerivedStateFromProps = function(v20, _) --[[ Line: 43 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    local v22 = nil;
    if v20.retrievalStatus == l_RetrievalStatus_0.Done then
        v22 = true;
    end;
    return {
        wasEverDoneRetrieving = v22
    };
end;
v19.init = function(v23) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v13 (copy), l_RoactNavigation_0 (copy), l_memoize_0 (copy), v12 (copy), l_FFlagCreateConnectionsHub_0 (copy), v4 (copy), v2 (copy), v11 (copy), l_Roact_0 (copy), l_RetrievalStatus_1 (copy), l_RetrievalStatus_0 (copy), l_LoadingStateContainer_0 (copy)
    if v23.props.logger then
        v3:setParent(v23.props.logger);
    end;
    v23.connectSocTabExternalDispatch = function(v24) --[[ Line: 60 ]]
        -- upvalues: v23 (copy), v13 (ref), l_RoactNavigation_0 (ref)
        if v23.props.updateExternalNavigationForScreen then
            local l_RoactChat_0 = v13.RoactChat;
            v23.props.updateExternalNavigationForScreen(function(v26) --[[ Line: 63 ]]
                -- upvalues: v24 (copy), l_RoactNavigation_0 (ref), v13 (ref), v23 (ref)
                v24(l_RoactNavigation_0.Actions.navigate({
                    routeName = v13.RoactChat
                }));
                v23.props.navigateIntoChat({
                    screen = "ChatConversation", 
                    params = v26
                });
            end, l_RoactChat_0);
            return function() --[[ Line: 73 ]]
                -- upvalues: v23 (ref), l_RoactChat_0 (copy)
                v23.props.updateExternalNavigationForScreen(nil, l_RoactChat_0);
            end;
        else
            return function() --[[ Line: 77 ]]

            end;
        end;
    end;
    v23._performanceTesting = v23.props.performanceTesting;
    v23.androidBackButtonSignal = {
        [v13.SocialTab] = v23.props.signal.new(), 
        [v13.RoactChat] = v23.props.signal.new()
    };
    v23.getAppContainer = l_memoize_0(function(v27, _) --[[ Line: 88 ]]
        -- upvalues: v13 (ref), v12 (ref), v23 (copy), l_FFlagCreateConnectionsHub_0 (ref), l_RoactNavigation_0 (ref)
        local v29 = {
            [v13.RoactChat] = v27
        };
        local v30 = v12(v29, {
            setTabBarVisible = v23.props.setTabBarVisible, 
            androidBackButtonSignal = v23.androidBackButtonSignal, 
            connectToAndroidBackButton = v23.props.androidBackButtonConnection.connect, 
            disconnectFromAndroidBackButton = v23.props.androidBackButtonConnection.disconnect, 
            androidBackButtonConnection = v23.props.androidBackButtonConnection, 
            initialRouteName = v23.props.initialRouteName, 
            navigateToAddFriends = if l_FFlagCreateConnectionsHub_0 then nil else v23.props.navigateToAddFriends
        });
        return l_RoactNavigation_0.createAppContainer(v30);
    end);
    v23.getAnalytics = l_memoize_0(function(v31) --[[ Line: 106 ]]
        -- upvalues: v4 (ref), v2 (ref)
        return v4.Class.new(v2.AnalyticsService, v31.localUserId);
    end);
    v23.fetchChatSettings = function(v32) --[[ Line: 110 ]]
        -- upvalues: v23 (copy)
        return v23.props.fetchChatSettings(v32);
    end;
    v23.renderRoactChat = function() --[[ Line: 114 ]]
        -- upvalues: v23 (copy), v11 (ref), l_Roact_0 (ref)
        if v23.props.debug_mockRenderRoactChat then
            return v23.props.debug_mockRenderRoactChat();
        else
            return v11.with(function(v33) --[[ Line: 118 ]]
                -- upvalues: l_Roact_0 (ref), v23 (ref)
                return v33.wasEverVisible and l_Roact_0.createElement(v23.props.roactChatEntryPoint, v33) or nil;
            end);
        end;
    end;
    v23.renderAppContainer = function(v34, v35) --[[ Line: 125 ]]
        -- upvalues: v23 (copy), l_Roact_0 (ref)
        if v23.props.debug_mockRenderAppContainer then
            return v23.props.debug_mockRenderAppContainer();
        else
            local l_connectSocTabExternalDispatch_0 = v23.connectSocTabExternalDispatch;
            return l_Roact_0.createElement(v34, {
                externalDispatchConnector = l_connectSocTabExternalDispatch_0, 
                androidBackButtonHandlerDisabled = v35.androidBackButtonHandlerDisabled
            });
        end;
    end;
    v23.getLoadingState = function() --[[ Line: 137 ]]
        -- upvalues: l_RetrievalStatus_1 (ref), v23 (copy), l_RetrievalStatus_0 (ref), l_Roact_0 (ref), l_LoadingStateContainer_0 (ref)
        local v37 = l_RetrievalStatus_1.fromRawValue(v23.props.retrievalStatus);
        if v23.state.wasEverDoneRetrieving then
            v37 = l_RetrievalStatus_1.fromRawValue(l_RetrievalStatus_0.Done);
        end;
        return l_Roact_0.createElement(l_LoadingStateContainer_0, {
            dataStatus = v37, 
            onRetry = v23.fetchChatSettings, 
            renderOnLoaded = v23.renderOnLoaded
        });
    end;
    v23.renderOnLoaded = function() --[[ Line: 150 ]]
        -- upvalues: v11 (ref), v23 (copy), l_Roact_0 (ref), v4 (ref)
        return v11.with(function(v38) --[[ Line: 151 ]]
            -- upvalues: v23 (ref), l_Roact_0 (ref), v4 (ref)
            local v39 = v23.getAppContainer(v38.roactChatEntryPoint);
            return l_Roact_0.createElement(v4.Context.Provider, {
                value = v23.getAnalytics(v38)
            }, {
                appContainer = v23.renderAppContainer(v39, v38)
            });
        end);
    end;
end;
v19.didMount = function(v40) --[[ Line: 162 ]] --[[ Name: didMount ]]
    -- upvalues: v13 (copy)
    if v40.props.isVisible and v40.props.toggleChatPaused ~= nil then
        v40.props.toggleChatPaused(false);
    end;
    if v40.androidBackButtonSignal then
        v40.androidBackButtonSignal[v13.SocialTab]:connect(function() --[[ Line: 170 ]]
            -- upvalues: v40 (copy)
            if v40.props.isVisible then
                v40.props.androidBackButtonConnection.showExitDialog();
            end;
        end);
    end;
end;
v19.didUpdate = function(v41, v42, _) --[[ Line: 178 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    if not v42.chatLoaded and v41.props.chatLoaded then
        v41.props.notificationService:ActionEnabled(Enum.AppShellActionType.TapConversationEntry);
    end;
    if v41.props.retrievalStatus == l_RetrievalStatus_0.NotStarted then
        v41.fetchChatSettings(v41.props.setAppLoaded);
    end;
end;
v19.render = function(v44) --[[ Line: 188 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), l_Roact_0 (copy), v4 (copy)
    return v11.with(function(v45) --[[ Line: 189 ]]
        -- upvalues: l_Roact_0 (ref), v4 (ref), v44 (copy)
        return l_Roact_0.createElement(v4.Context.Provider, {
            value = v44.getAnalytics(v45)
        }, {
            LoadingState = v44.getLoadingState()
        });
    end);
end;
v19 = l_RoactRodux_0.connect(v16, v17)(v19);
return (v11.connect(function(v46) --[[ Line: 199 ]]
    return {
        fetchUnreadConversationCount = v46.fetchUnreadConversationCount, 
        setAppLoaded = v46.setAppLoaded, 
        roactChatEntryPoint = v46.roactChatEntryPoint, 
        notificationService = v46.notificationService, 
        config = v46.config, 
        toggleChatPaused = v46.toggleChatPaused, 
        performanceTesting = v46.performanceTesting, 
        notificationType = v46.notificationType, 
        updateExternalNavigationForScreen = v46.updateExternalNavigationForScreen
    };
end)(v19));