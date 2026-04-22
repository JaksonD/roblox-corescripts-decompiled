local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactNavigation);
local v5 = require(l_Parent_0.Foundation);
local v6 = require(l_Parent_0.Responsive);
local v7 = require(l_script_FirstAncestor_0.EnumScreens);
local v8 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarConfigDriven);
local v9 = require(l_script_FirstAncestor_0.Components.TopBar.SystemMenuTopBar);
local v10 = require(l_script_FirstAncestor_0.configureTopBarWithNavigationOptions);
local v11 = require(l_script_FirstAncestor_0.Navigators.isolatedAutoFocusNavigation);
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatPerfTracking);
local v13 = require(l_script_FirstAncestor_0.Telemetry.AppChatPerfTracker);
local function _(v14) --[[ Line: 25 ]] --[[ Name: getActiveRouteName ]]
    local v15 = v14 and v14.state;
    if not v15 or not v15.routes or not v15.index then
        return nil;
    else
        local v16 = v15.routes[v15.index];
        if not v16 then
            return nil;
        else
            return v16.routeName;
        end;
    end;
end;
local function _(v18) --[[ Line: 37 ]] --[[ Name: wrapInOverlay ]]
    -- upvalues: v6 (copy), v8 (copy), v12 (copy), v13 (copy), v7 (copy), v3 (copy), v9 (copy), v10 (copy), v5 (copy)
    return function(v19) --[[ Line: 38 ]]
        -- upvalues: v6 (ref), v8 (ref), v12 (ref), v13 (ref), v7 (ref), v3 (ref), v9 (ref), v10 (ref), v5 (ref), v18 (copy)
        local v20 = v6.useBreakpointXOrSmaller(v6.Keys.Small);
        local v21 = v6.useBreakpointYOrSmaller(v6.Keys.Small);
        local v22 = v20 and -24 or -360;
        local v23 = v21 and -24 or -72;
        local v24 = UDim2.new(1, v22, 1, v23);
        local v25 = nil;
        if v8() then
            if v12 then
                v13.start(v13.Events.TopBarRenderInterval);
            end;
            local l_navigation_0 = v19.navigation;
            local v27 = l_navigation_0 and l_navigation_0.state;
            local v28;
            if not v27 or not v27.routes or not v27.index then
                v28 = nil;
            else
                local v29 = v27.routes[v27.index];
                v28 = if not v29 then nil else v29.routeName;
            end;
            if v28 == v7.CreateNewChat or v28 == v7.EditChatMembers or v28 == v7.QuickStartSquadInviteFriends then
                v25 = v3.createElement(v9, {
                    screenName = v28, 
                    navigation = v19.navigation
                });
            end;
        end;
        if not v25 then
            v25 = v10(v19.navigation);
        end;
        return v3.createElement(v5.View, {
            tag = "col position-center-center anchor-center-center clip bg-surface-0 radius-large", 
            Size = v24
        }, {
            sizeConstraint = v3.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(1000, 800), 
                MinSize = Vector2.new(0, 0)
            }), 
            topBar = v25, 
            overlayContent = v3.createElement(v18, v19)
        });
    end;
end;
return function(v31) --[[ Line: 85 ]]
    -- upvalues: v4 (copy), v3 (copy), v11 (copy), v6 (copy), v8 (copy), v12 (copy), v13 (copy), v7 (copy), v9 (copy), v10 (copy), v5 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    local v32 = v4.createRobloxStackNavigator(v31, {
        defaultNavigationOptions = {
            isDialog = true
        }
    });
    local v33 = v3.PureComponent:extend("OverlayNavigatorConnector");
    v33.router = v32.router;
    local v45 = v11(function(v34) --[[ Line: 38 ]]
        -- upvalues: v6 (ref), v8 (ref), v12 (ref), v13 (ref), v7 (ref), v3 (ref), v9 (ref), v10 (ref), v5 (ref), v32 (copy)
        local v35 = v6.useBreakpointXOrSmaller(v6.Keys.Small);
        local v36 = v6.useBreakpointYOrSmaller(v6.Keys.Small);
        local v37 = v35 and -24 or -360;
        local v38 = v36 and -24 or -72;
        local v39 = UDim2.new(1, v37, 1, v38);
        local v40 = nil;
        if v8() then
            if v12 then
                v13.start(v13.Events.TopBarRenderInterval);
            end;
            local l_navigation_1 = v34.navigation;
            local v42 = l_navigation_1 and l_navigation_1.state;
            local v43;
            if not v42 or not v42.routes or not v42.index then
                v43 = nil;
            else
                local v44 = v42.routes[v42.index];
                v43 = if not v44 then nil else v44.routeName;
            end;
            if v43 == v7.CreateNewChat or v43 == v7.EditChatMembers or v43 == v7.QuickStartSquadInviteFriends then
                v40 = v3.createElement(v9, {
                    screenName = v43, 
                    navigation = v34.navigation
                });
            end;
        end;
        if not v40 then
            v40 = v10(v34.navigation);
        end;
        return v3.createElement(v5.View, {
            tag = "col position-center-center anchor-center-center clip bg-surface-0 radius-large", 
            Size = v39
        }, {
            sizeConstraint = v3.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(1000, 800), 
                MinSize = Vector2.new(0, 0)
            }), 
            topBar = v40, 
            overlayContent = v3.createElement(v32, v34)
        });
    end, l_FocusNavigableSurfaceIdentifierEnum_0.PopUp);
    v33.render = function(v46) --[[ Line: 94 ]] --[[ Name: render ]]
        -- upvalues: v3 (ref), v45 (copy)
        return v3.createElement(v45, v46.props);
    end;
    return v33;
end;