local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v6 = require(l_script_FirstAncestor_0.EnumScreens);
local v7 = require(l_script_FirstAncestor_0.configureTopBarWithNavigationOptions);
local v8 = require(script.Parent.conversationStackNavigator);
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarConfigDriven);
local v11 = require(l_script_FirstAncestor_0.Components.TopBar.ChatConversationTopBar);
local v12 = require(l_script_FirstAncestor_0.Components.TopBar.ChatTopBarBase);
local v13 = require(l_script_FirstAncestor_0.Components.TopBar.SystemMenuTopBar);
local v14 = require(l_script_FirstAncestor_0.Components.Squads.SquadAddFriendsIconButton);
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatPerfTracking);
local v16 = require(l_script_FirstAncestor_0.Telemetry.AppChatPerfTracker);
local v17 = {
    configureTopBar = v7, 
    createNewNavigator = v8
};
ConversationStackNavigatorConnector = function(v18) --[[ Line: 40 ]] --[[ Name: ConversationStackNavigatorConnector ]]
    -- upvalues: v3 (copy), v17 (copy), l_useStyle_0 (copy), v4 (copy), l_UserGameSettings_0 (copy), v10 (copy), v15 (copy), v16 (copy), v6 (copy), v11 (copy), v12 (copy), v14 (copy), v13 (copy)
    local v19 = v3.Dictionary.union(v17, v18);
    local v20 = l_useStyle_0();
    local v21 = nil;
    local v22, v23 = v4.useState(l_UserGameSettings_0.ReducedMotion);
    v4.useEffect(function() --[[ Line: 47 ]]
        -- upvalues: l_UserGameSettings_0 (ref), v23 (copy)
        local v24 = l_UserGameSettings_0:GetPropertyChangedSignal("ReducedMotion"):Connect(function() --[[ Line: 48 ]]
            -- upvalues: v23 (ref), l_UserGameSettings_0 (ref)
            v23(l_UserGameSettings_0.ReducedMotion);
        end);
        return function() --[[ Line: 51 ]]
            -- upvalues: v24 (copy)
            v24:Disconnect();
        end;
    end, {});
    v21 = v4.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v19 (copy), v20 (copy), v22 (copy)
        local v25 = v19.createNewNavigator({
            cardColor3 = v20.Theme.BackgroundDefault.Color, 
            transparent = true
        }, v22);
        v19.setRouter(v25.router);
        return v25;
    end, {
        v20.Theme.BackgroundDefault.Color, 
        v22
    });
    local v26 = nil;
    if v10() then
        if v15 then
            v16.start(v16.Events.TopBarRenderInterval);
        end;
        local v27 = v19.navigation and v19.navigation.state;
        local v28 = v27 and v27.routes and v27.index and v27.routes[v27.index] and v27.routes[v27.index].routeName or nil;
        if v28 == v6.ChatConversation then
            v26 = v4.createElement(v11, {
                screenName = v6.ChatConversation, 
                navigation = v19.navigation
            });
        elseif v28 == v6.ChatDetails then
            v26 = v4.createElement(v12, {
                screenName = v6.ChatDetails, 
                navigation = v19.navigation
            });
        elseif v28 == v6.SquadLobby then
            v26 = v4.createElement(v12, {
                screenName = v6.SquadLobby, 
                navigation = v19.navigation, 
                renderRight = function() --[[ Line: 92 ]] --[[ Name: renderRight ]]
                    -- upvalues: v4 (ref), v14 (ref), v19 (copy)
                    return v4.createElement(v14, {
                        navigation = v19.navigation
                    });
                end
            });
        elseif v28 == v6.SquadInviteFriends then
            v26 = v4.createElement(v13, {
                screenName = v6.SquadInviteFriends, 
                navigation = v19.navigation
            });
        end;
    end;
    if not v26 then
        v26 = v19.configureTopBar(v19.navigation);
    end;
    return v4.createElement(v4.Fragment, nil, {
        layout = v4.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        topBar = v26, 
        navigatorFrame = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -v19.navigation.getScreenProps("topBarHeight", 0)), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            navigator = v4.createElement(v21, v19)
        })
    });
end;
local v29 = v4.PureComponent:extend("ConversationStackNavigatorConnectorWrapper");
v29.router = v8().router;
v29.render = function(v30) --[[ Line: 129 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v3 (copy), v29 (copy)
    return v4.createElement(ConversationStackNavigatorConnector, v3.Dictionary.join(v30.props, {
        setRouter = function(v31) --[[ Line: 133 ]] --[[ Name: setRouter ]]
            -- upvalues: v29 (ref)
            v29.router = v31;
        end
    }));
end;
return v29;