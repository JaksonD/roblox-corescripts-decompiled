local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactNavigation);
local v5 = require(l_Parent_0.Foundation);
local v6 = require(l_Parent_0.Responsive);
local v7 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatDialogRoundedCorners);
local v8 = require(l_script_FirstAncestor_0.configureTopBarWithNavigationOptions);
local v9 = require(l_script_FirstAncestor_0.Navigators.isolatedAutoFocusNavigation);
local function _(v10) --[[ Line: 21 ]] --[[ Name: wrapInOverlay ]]
    -- upvalues: v6 (copy), v3 (copy), v5 (copy), v7 (copy), v8 (copy)
    return function(v11) --[[ Line: 22 ]]
        -- upvalues: v6 (ref), v3 (ref), v5 (ref), v7 (ref), v8 (ref), v10 (copy)
        local v12 = v6.useBreakpointXOrSmaller(v6.Keys.Small);
        local v13 = v6.useBreakpointYOrSmaller(v6.Keys.Small);
        local v14 = v12 and -24 or -360;
        local v15 = v13 and -24 or -72;
        local v16 = UDim2.new(1, v14, 1, v15);
        return v3.createElement(v5.View, {
            tag = {
                ["col position-center-center anchor-center-center clip"] = true, 
                ["bg-surface-0 radius-large"] = v7, 
                ["bg-surface-300 padding-xxsmall radius-small"] = not v7
            }, 
            Size = v16
        }, {
            sizeConstraint = v3.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(1000, 800), 
                MinSize = Vector2.new(0, 0)
            }), 
            topBar = v8(v11.navigation), 
            overlayContent = v3.createElement(v10, v11)
        });
    end;
end;
return function(v18) --[[ Line: 52 ]]
    -- upvalues: v4 (copy), v7 (copy), v3 (copy), v9 (copy), v6 (copy), v5 (copy), v8 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    local v19 = v4.createRobloxStackNavigator(v18, if v7 then {
        defaultNavigationOptions = {
            isDialog = true
        }
    } else nil);
    local v20 = v3.PureComponent:extend("OverlayNavigatorConnector");
    v20.router = v19.router;
    local v27 = v9(function(v21) --[[ Line: 22 ]]
        -- upvalues: v6 (ref), v3 (ref), v5 (ref), v7 (ref), v8 (ref), v19 (copy)
        local v22 = v6.useBreakpointXOrSmaller(v6.Keys.Small);
        local v23 = v6.useBreakpointYOrSmaller(v6.Keys.Small);
        local v24 = v22 and -24 or -360;
        local v25 = v23 and -24 or -72;
        local v26 = UDim2.new(1, v24, 1, v25);
        return v3.createElement(v5.View, {
            tag = {
                ["col position-center-center anchor-center-center clip"] = true, 
                ["bg-surface-0 radius-large"] = v7, 
                ["bg-surface-300 padding-xxsmall radius-small"] = not v7
            }, 
            Size = v26
        }, {
            sizeConstraint = v3.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(1000, 800), 
                MinSize = Vector2.new(0, 0)
            }), 
            topBar = v8(v21.navigation), 
            overlayContent = v3.createElement(v19, v21)
        });
    end, l_FocusNavigableSurfaceIdentifierEnum_0.PopUp);
    v20.render = function(v28) --[[ Line: 63 ]] --[[ Name: render ]]
        -- upvalues: v3 (ref), v27 (copy)
        return v3.createElement(v27, v28.props);
    end;
    return v20;
end;