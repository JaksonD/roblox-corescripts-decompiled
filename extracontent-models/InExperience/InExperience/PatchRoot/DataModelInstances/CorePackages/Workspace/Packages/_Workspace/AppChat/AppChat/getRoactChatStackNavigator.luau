local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_IXPService_0 = game:GetService("IXPService");
local v3 = require(l_script_FirstAncestor_0.EnumScreens);
local v4 = require(l_Parent_0.InputHandlers);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.Roact);
local v7 = require(l_Parent_0.ReactFocusNavigation);
local v8 = require(l_Parent_0.RoactNavigation);
local v9 = require(l_Parent_0.FocusNavigationUtils);
local v10 = require(l_Parent_0.SharedFlags);
local l_FocusNavigationEventNameEnum_0 = v9.FocusNavigationEventNameEnum;
local l_FFlagEnableAppChatFocusableFixes_0 = v10.FFlagEnableAppChatFocusableFixes;
local l_FFlagAppChatFixRootChatBackNavigation_0 = v10.FFlagAppChatFixRootChatBackNavigation;
local v14 = game:DefineFastFlag("AppChatFixRootChatBackNavigationIxpEnabled", false);
local v15 = game:DefineFastString("AppChatFixRootChatBackNavigationIxpLayer", "Party.LandingPage");
local _ = require(l_script_FirstAncestor_0.types);
local function v17(v18) --[[ Line: 26 ]] --[[ Name: getActiveChildParams ]]
    -- upvalues: v17 (copy)
    local l_index_0 = v18.index;
    local v20 = v18.routes and v18.routes[l_index_0];
    if v20 then
        return v17(v20);
    else
        return v18.params;
    end;
end;
local function v21(v22) --[[ Line: 36 ]] --[[ Name: getActiveChildNavigationOptions ]]
    -- upvalues: v21 (copy), v8 (copy)
    local l_state_0 = v22.state;
    local l_index_1 = l_state_0.index;
    local v25 = l_state_0.routes and l_state_0.routes[l_index_1];
    if v25 and v25.routes then
        local v26 = v22.getChildNavigation(v25.key);
        return v21(v26);
    else
        return v8.getActiveChildNavigationOptions(v22);
    end;
end;
local function _(v27) --[[ Line: 49 ]] --[[ Name: getActiveConversationId ]]
    if v27 then
        if v27.conversation then
            return v27.conversation.id;
        else
            return v27.conversationId;
        end;
    else
        return nil;
    end;
end;
local function v33(v29) --[[ Line: 62 ]] --[[ Name: RoactChatStackNavigatorWithFocusNavigation ]]
    -- upvalues: v5 (copy), v4 (copy), v7 (copy), l_FocusNavigationEventNameEnum_0 (copy), v6 (copy)
    local v31 = v5.useCallback(v4.onRelease(function(v30) --[[ Line: 64 ]]
        -- upvalues: v29 (copy)
        if v29.onNavigateBack() then
            v30:cancel();
        end;
    end), {
        v29.onNavigateBack
    });
    local v32 = v7.useEventHandler(l_FocusNavigationEventNameEnum_0.NavigateBack, v31);
    return v6.createFragment({
        FocusNavigationContainer = v6.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ref = v32
        }, {
            navigator = v6.createElement(v29.navigator, {
                navigation = v29.navigation
            })
        })
    });
end;
return function(v34, v35, v36, v37) --[[ Line: 88 ]]
    -- upvalues: v6 (copy), v21 (copy), v8 (copy), v14 (copy), l_IXPService_0 (copy), v15 (copy), v3 (copy), l_FFlagAppChatFixRootChatBackNavigation_0 (copy), v17 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v33 (copy)
    local v38 = v6.PureComponent:extend("RoactChatStackNavigator");
    v38.defaultProps = {
        navigation = nil, 
        parameters = nil, 
        setActiveConversationId = function() --[[ Line: 99 ]] --[[ Name: setActiveConversationId ]]

        end, 
        setBackButtonEnabled = function() --[[ Line: 100 ]] --[[ Name: setBackButtonEnabled ]]

        end, 
        setTabBarVisible = function() --[[ Line: 101 ]] --[[ Name: setTabBarVisible ]]

        end, 
        notificationCount = 0
    };
    v38.init = function(v39) --[[ Line: 105 ]] --[[ Name: init ]]
        -- upvalues: v21 (ref), v8 (ref), v35 (copy), v14 (ref), l_IXPService_0 (ref), v15 (ref), v3 (ref), l_FFlagAppChatFixRootChatBackNavigation_0 (ref), v37 (copy)
        v39.backButtonConnection = nil;
        v39.onBackButtonPressed = function() --[[ Line: 109 ]]
            -- upvalues: v39 (copy), v21 (ref), v8 (ref), v35 (ref), v14 (ref), l_IXPService_0 (ref), v15 (ref), v3 (ref), l_FFlagAppChatFixRootChatBackNavigation_0 (ref), v37 (ref)
            local l_navigation_0 = v39.props.navigation;
            local l_state_1 = l_navigation_0.state;
            local l_index_2 = l_state_1.index;
            local v43 = l_state_1.routes and l_state_1.routes[l_index_2];
            local v44;
            if v43 and v43.routes then
                local v45 = l_navigation_0.getChildNavigation(v43.key);
                v44 = v21(v45);
            else
                v44 = v8.getActiveChildNavigationOptions(l_navigation_0);
            end;
            if v35 and v44.isRoot then
                if v14 then
                    l_IXPService_0:LogFlagLinkedUserLayerExposure(v15);
                end;
                v39.props.navigation.navigate(v3.EmptyConversation);
                v35();
                if not l_FFlagAppChatFixRootChatBackNavigation_0 and v37 and v39.props.chatIsVisible then
                    v37.showExitDialog();
                end;
                return false;
            else
                v39.props.navigation.pop();
                return true;
            end;
        end;
    end;
    v38.willUpdate = function(v46, v47) --[[ Line: 133 ]] --[[ Name: willUpdate ]]
        -- upvalues: v17 (ref), v21 (ref), v8 (ref)
        local l_state_2 = v46.props.navigation.state;
        local l_index_3 = l_state_2.index;
        local v50 = l_state_2.routes and l_state_2.routes[l_index_3];
        local v51 = if v50 then v17(v50) else l_state_2.params;
        l_index_3 = v47.navigation.state;
        v50 = l_index_3.index;
        local v52 = l_index_3.routes and l_index_3.routes[v50];
        l_state_2 = if v52 then v17(v52) else l_index_3.params;
        l_index_3 = if v51 then if v51.conversation then v51.conversation.id else v51.conversationId else nil;
        v50 = if l_state_2 then if l_state_2.conversation then l_state_2.conversation.id else l_state_2.conversationId else nil;
        if l_index_3 ~= v50 then
            v46.props.setActiveConversationId(v50);
        end;
        if not v47.chatIsVisible then
            return;
        else
            local l_navigation_1 = v47.navigation;
            local l_state_3 = l_navigation_1.state;
            local l_index_4 = l_state_3.index;
            local v56 = l_state_3.routes and l_state_3.routes[l_index_4];
            if v56 and v56.routes then
                local v57 = l_navigation_1.getChildNavigation(v56.key);
                v52 = v21(v57);
            else
                v52 = v8.getActiveChildNavigationOptions(l_navigation_1);
            end;
            if v52 then
                if v52.backButtonEnabled ~= nil then
                    v46.props.setBackButtonEnabled(v52.backButtonEnabled);
                end;
                if v52.tabBarVisible ~= nil then
                    v46.props.setTabBarVisible(v52.tabBarVisible);
                end;
            end;
            return;
        end;
    end;
    v38.didMount = function(v58) --[[ Line: 161 ]] --[[ Name: didMount ]]
        -- upvalues: v36 (copy), v35 (copy), v3 (ref)
        if v36 and v35 then
            v58.backButtonConnection = v36:connect(v58.onBackButtonPressed);
        end;
        local l_parameters_0 = v58.props.parameters;
        local v60 = l_parameters_0 and l_parameters_0.conversationId;
        if v60 then
            v58.props.navigation.navigate(v3.ChatConversation, {
                conversationId = v60
            });
        end;
    end;
    v38.willUnmount = function(v61) --[[ Line: 174 ]] --[[ Name: willUnmount ]]
        v61.props.setActiveConversationId(nil);
        if v61.backButtonConnection then
            v61.backButtonConnection:disconnect();
        end;
    end;
    v38.render = function(v62) --[[ Line: 181 ]] --[[ Name: render ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), v6 (ref), v33 (ref), v34 (copy)
        local l_navigation_2 = v62.props.navigation;
        if l_FFlagEnableAppChatFocusableFixes_0 then
            return v6.createElement(v33, {
                navigation = l_navigation_2, 
                navigator = v34, 
                onNavigateBack = v62.onBackButtonPressed
            });
        else
            return v6.createElement(v34, {
                navigation = l_navigation_2
            });
        end;
    end;
    v38.router = v34.router;
    return v38;
end;