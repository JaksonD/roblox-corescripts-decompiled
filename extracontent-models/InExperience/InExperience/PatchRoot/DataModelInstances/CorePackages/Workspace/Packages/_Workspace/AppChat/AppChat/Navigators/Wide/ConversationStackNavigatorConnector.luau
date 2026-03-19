local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v6 = require(l_script_FirstAncestor_0.configureTopBarWithNavigationOptions);
local v7 = require(script.Parent.conversationStackNavigator);
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v9 = {
    configureTopBar = v6, 
    createNewNavigator = v7
};
ConversationStackNavigatorConnector = function(v10) --[[ Line: 32 ]] --[[ Name: ConversationStackNavigatorConnector ]]
    -- upvalues: v3 (copy), v9 (copy), l_useStyle_0 (copy), v4 (copy), l_UserGameSettings_0 (copy)
    local v11 = v3.Dictionary.union(v9, v10);
    local v12 = l_useStyle_0();
    local v13 = nil;
    local v14, v15 = v4.useState(l_UserGameSettings_0.ReducedMotion);
    v4.useEffect(function() --[[ Line: 39 ]]
        -- upvalues: l_UserGameSettings_0 (ref), v15 (copy)
        local v16 = l_UserGameSettings_0:GetPropertyChangedSignal("ReducedMotion"):Connect(function() --[[ Line: 40 ]]
            -- upvalues: v15 (ref), l_UserGameSettings_0 (ref)
            v15(l_UserGameSettings_0.ReducedMotion);
        end);
        return function() --[[ Line: 43 ]]
            -- upvalues: v16 (copy)
            v16:Disconnect();
        end;
    end, {});
    v13 = v4.useMemo(function() --[[ Line: 48 ]]
        -- upvalues: v11 (copy), v12 (copy), v14 (copy)
        local v17 = v11.createNewNavigator({
            cardColor3 = v12.Theme.BackgroundDefault.Color, 
            transparent = true
        }, v14);
        v11.setRouter(v17.router);
        return v17;
    end, {
        v12.Theme.BackgroundDefault.Color, 
        v14
    });
    return v4.createElement(v4.Fragment, nil, {
        layout = v4.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        topBar = v11.configureTopBar(v11.navigation), 
        navigatorFrame = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -v11.navigation.getScreenProps("topBarHeight", 0)), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            navigator = v4.createElement(v13, v11)
        })
    });
end;
local v18 = v4.PureComponent:extend("ConversationStackNavigatorConnectorWrapper");
v18.router = v7().router;
v18.render = function(v19) --[[ Line: 77 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v3 (copy), v18 (copy)
    return v4.createElement(ConversationStackNavigatorConnector, v3.Dictionary.join(v19.props, {
        setRouter = function(v20) --[[ Line: 81 ]] --[[ Name: setRouter ]]
            -- upvalues: v18 (ref)
            v18.router = v20;
        end
    }));
end;
return v18;