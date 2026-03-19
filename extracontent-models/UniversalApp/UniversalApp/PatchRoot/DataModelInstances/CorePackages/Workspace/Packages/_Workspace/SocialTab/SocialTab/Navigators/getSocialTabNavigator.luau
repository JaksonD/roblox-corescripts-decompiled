local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Roact_0 = v1.Roact;
local l_llama_0 = v1.llama;
local l_RoactNavigation_0 = v1.RoactNavigation;
local l_BackBehavior_0 = v1.RoactNavigation.BackBehavior;
local v7 = require(l_script_FirstAncestor_0.SocialTabContext);
local v8 = require(l_script_FirstAncestor_0.SocialTabEventReceiver);
local v9 = require(l_script_FirstAncestor_0.SocialTabNavigationEventReceiver);
local v10 = require(l_script_FirstAncestor_0.Components.SocialTabContainer);
local v11 = require(l_script_FirstAncestor_0.EnumScreens);
local l_ChatPlacementContext_0 = v1.AppChat.Contexts.ChatPlacementContext;
local v13 = game:DefineFastFlag("SocialTabBarVisibleFix", false);
local v14 = game:DefineFastFlag("SocialTabBarSwitchNavUseContext2", false);
local l_FFlagCreateConnectionsHub_0 = require(l_Parent_0.SharedFlags).FFlagCreateConnectionsHub;
local l_FFlagAppChatFixRootChatBackNavigation_0 = require(l_Parent_0.SharedFlags).FFlagAppChatFixRootChatBackNavigation;
local function v17(v18) --[[ Line: 21 ]] --[[ Name: getActiveChildNavigationOptions ]]
    -- upvalues: v17 (copy), l_RoactNavigation_0 (copy)
    local l_state_0 = v18.state;
    local l_index_0 = l_state_0.index;
    local v21 = l_state_0.routes and l_state_0.routes[l_index_0];
    if v21 and v21.routes then
        local v22 = v18.getChildNavigation(v21.key);
        return v17(v22);
    else
        return l_RoactNavigation_0.getActiveChildNavigationOptions(v18);
    end;
end;
local function v23(v24) --[[ Line: 34 ]] --[[ Name: getActiveRouteName ]]
    -- upvalues: v23 (copy)
    local l_index_1 = v24.index;
    local v26 = v24.routes and v24.routes[l_index_1];
    if v26 then
        return v23(v26);
    else
        return v24.routeName;
    end;
end;
return function(v27, v28) --[[ Line: 44 ]]
    -- upvalues: v11 (copy), l_Roact_0 (copy), v10 (copy), v9 (copy), l_RoactNavigation_0 (copy), v7 (copy), l_llama_0 (copy), l_FFlagAppChatFixRootChatBackNavigation_0 (copy), l_FFlagCreateConnectionsHub_0 (copy), l_ChatPlacementContext_0 (copy), l_BackBehavior_0 (copy), v23 (copy), v17 (copy), v13 (copy), v8 (copy), v14 (copy)
    local v35 = {
        {
            [v11.SocialTab] = {
                screen = function(v29) --[[ Line: 49 ]] --[[ Name: screen ]]
                    -- upvalues: l_Roact_0 (ref), v10 (ref), v9 (ref), l_RoactNavigation_0 (ref)
                    return l_Roact_0.createFragment({
                        screen = l_Roact_0.createElement(v10, {
                            navigation = v29.navigation
                        }), 
                        navigationEvents = l_Roact_0.createElement(v9, {
                            navigationEventReceiver = l_RoactNavigation_0.NavigationEvents
                        })
                    });
                end, 
                navigationOptions = {
                    tabBarVisible = true
                }
            }
        }, 
        {
            [v11.RoactChat] = {
                screen = function(v30) --[[ Line: 66 ]] --[[ Name: screen ]]
                    -- upvalues: v7 (ref), v28 (copy), v11 (ref), l_llama_0 (ref), l_FFlagAppChatFixRootChatBackNavigation_0 (ref), l_FFlagCreateConnectionsHub_0 (ref), l_ChatPlacementContext_0 (ref), l_Roact_0 (ref), v27 (copy)
                    return v7.with(function(v31) --[[ Line: 67 ]]
                        -- upvalues: v28 (ref), v11 (ref), l_llama_0 (ref), v30 (copy), l_FFlagAppChatFixRootChatBackNavigation_0 (ref), l_FFlagCreateConnectionsHub_0 (ref), l_ChatPlacementContext_0 (ref), l_Roact_0 (ref), v27 (ref)
                        local v32 = {
                            logger = v31.Logger, 
                            isLuaProfilePageEnabled = v31.isLuaProfilePageEnabled, 
                            parameters = v31.parameters, 
                            wideMode = v31.wideMode, 
                            isVisible = v31.isVisible, 
                            notificationCount = v31.notificationCount, 
                            navigateToLuaAppPages = v31.navigateToLuaAppPages, 
                            rnBypassActionSignal = v31.rnBypassActionSignal, 
                            setActiveConversationId = v31.setActiveConversationId, 
                            setBackButtonEnabled = v31.setBackButtonEnabled, 
                            setTabBarVisible = v31.setTabBarVisible, 
                            androidBackButtonSignal = v28.androidBackButtonSignal[v11.RoactChat], 
                            androidBackButtonConnection = v28.androidBackButtonConnection, 
                            updateExternalNavigationForScreen = v31.updateExternalNavigationForScreen
                        };
                        local v34 = l_llama_0.Dictionary.join(v30, v28, v32, {
                            navigateToRootStack = function() --[[ Line: 87 ]] --[[ Name: navigateToRootStack ]]
                                -- upvalues: l_FFlagAppChatFixRootChatBackNavigation_0 (ref), v32 (copy), v11 (ref), v30 (ref)
                                if l_FFlagAppChatFixRootChatBackNavigation_0 then
                                    local v33 = v32.navigateToLuaAppPages[v11.Home];
                                    if v33 then
                                        v33();
                                        return;
                                    end;
                                else
                                    v30.navigation.navigate(v11.SocialTab);
                                end;
                            end, 
                            navigateToAddFriends = if l_FFlagCreateConnectionsHub_0 then nil else function() --[[ Line: 100 ]]
                                -- upvalues: v28 (ref)
                                v28.navigateToAddFriends();
                            end
                        });
                        v34 = l_llama_0.Dictionary.join(v34, {
                            chatPlacement = l_ChatPlacementContext_0.Enum.ChatTab
                        });
                        return l_Roact_0.createElement(v27[v11.RoactChat], v34);
                    end);
                end, 
                navigationOptions = {
                    tabBarVisible = true
                }
            }
        }
    };
    v35 = l_llama_0.List.removeIndex(v35, 1);
    local v36 = l_RoactNavigation_0.createRobloxSwitchNavigator(v35, {
        initialRouteName = v28.initialRouteName, 
        keepVisitedScreensMounted = false, 
        backBehavior = l_BackBehavior_0.History
    });
    local v37 = l_Roact_0.PureComponent:extend("SocialTabSwitchNavigator");
    v37.init = function(v38) --[[ Line: 130 ]] --[[ Name: init ]]
        -- upvalues: v23 (ref), v11 (ref), v28 (copy)
        v38.onBackButtonPressed = function() --[[ Line: 132 ]]
            -- upvalues: v38 (copy), v23 (ref), v11 (ref), v28 (ref)
            local l_state_1 = v38.props.navigation.state;
            local l_index_2 = l_state_1.index;
            local v41 = l_state_1.routes and l_state_1.routes[l_index_2];
            local v42 = if v41 then v23(v41) else l_state_1.routeName;
            if v38.props.androidBackButtonHandlerDisabled then
                return;
            elseif v42 == v11.RoactChat or v42 == v11.SocialTab then
                v28.androidBackButtonSignal[v42]:fire();
                return;
            else
                v38.props.navigation.goBack();
                return;
            end;
        end;
        v38.isTabViewVisible = function() --[[ Line: 158 ]]
            -- upvalues: v38 (copy), v23 (ref), v11 (ref)
            local l_state_2 = v38.props.navigation.state;
            local l_index_3 = l_state_2.index;
            local v45 = l_state_2.routes and l_state_2.routes[l_index_3];
            return (if v45 then v23(v45) else l_state_2.routeName) == v11.RoactChat;
        end;
    end;
    v37.didMount = function(v46) --[[ Line: 164 ]] --[[ Name: didMount ]]
        -- upvalues: v28 (copy)
        v28.connectToAndroidBackButton(v46.onBackButtonPressed);
    end;
    v37.willUnmount = function(_) --[[ Line: 168 ]] --[[ Name: willUnmount ]]
        -- upvalues: v28 (copy)
        v28.disconnectFromAndroidBackButton();
    end;
    v37.willUpdate = function(_, v49) --[[ Line: 172 ]] --[[ Name: willUpdate ]]
        -- upvalues: v17 (ref), l_RoactNavigation_0 (ref), v13 (ref), v7 (ref), v28 (copy)
        local l_navigation_0 = v49.navigation;
        local l_state_3 = l_navigation_0.state;
        local l_index_4 = l_state_3.index;
        local v53 = l_state_3.routes and l_state_3.routes[l_index_4];
        local v54;
        if v53 and v53.routes then
            local v55 = l_navigation_0.getChildNavigation(v53.key);
            v54 = v17(v55);
        else
            v54 = l_RoactNavigation_0.getActiveChildNavigationOptions(l_navigation_0);
        end;
        if v54 and v54.tabBarVisible ~= nil then
            if v13 then
                v7.with(function(v56) --[[ Line: 177 ]]
                    -- upvalues: v54 (copy)
                    if v56.setTabBarVisible then
                        v56.setTabBarVisible(v54.tabBarVisible);
                    end;
                end);
                return;
            else
                v28.setTabBarVisible(v54.tabBarVisible);
            end;
        end;
    end;
    v37.render = function(v57) --[[ Line: 189 ]] --[[ Name: render ]]
        -- upvalues: v7 (ref), l_Roact_0 (ref), v8 (ref), v23 (ref), v14 (ref), v11 (ref), v28 (copy), v36 (copy)
        return v7.with(function(v58) --[[ Line: 190 ]]
            -- upvalues: v57 (copy), l_Roact_0 (ref), v8 (ref), v23 (ref), v14 (ref), v11 (ref), v28 (ref), v36 (ref)
            if v58.isLuaProfilePageEnabled then
                v58.setIsTabBarEnabled(v57.isTabViewVisible);
            end;
            return l_Roact_0.createFragment({
                eventReceiver = l_Roact_0.createElement(v8, {
                    robloxEventReceiver = v58.robloxEventReceiver, 
                    getActiveConversationId = v58.getActiveConversationId, 
                    showTabBar = function() --[[ Line: 199 ]] --[[ Name: showTabBar ]]
                        -- upvalues: v57 (ref), v23 (ref), v14 (ref), v58 (copy), v11 (ref), v28 (ref)
                        local l_state_4 = v57.props.navigation.state;
                        local l_index_5 = l_state_4.index;
                        local v61 = l_state_4.routes and l_state_4.routes[l_index_5];
                        local v62 = if v61 then v23(v61) else l_state_4.routeName;
                        if v14 then
                            v58.setTabBarVisible(v62 == v11.RoactChat);
                            return;
                        else
                            v28.setTabBarVisible(v62 == v11.RoactChat);
                            return;
                        end;
                    end, 
                    goToChat = function() --[[ Line: 207 ]] --[[ Name: goToChat ]]
                        -- upvalues: v57 (ref), v11 (ref)
                        v57.props.navigation.navigate(v11.RoactChat);
                    end
                }), 
                switchNavigator = l_Roact_0.createElement(v36, {
                    navigation = v57.props.navigation
                })
            });
        end);
    end;
    v37.router = v36.router;
    return v37;
end;