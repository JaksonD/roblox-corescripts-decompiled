local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactNavigation);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v5 = require(l_Parent_0.Responsive);
local v6 = require(l_script_FirstAncestor_0.configureTopBarWithNavigationOptions);
local function _(v7) --[[ Line: 14 ]] --[[ Name: wrapInOverlay ]]
    -- upvalues: v5 (copy), l_useStyle_0 (copy), v2 (copy), v6 (copy)
    return function(v8) --[[ Line: 15 ]]
        -- upvalues: v5 (ref), l_useStyle_0 (ref), v2 (ref), v6 (ref), v7 (copy)
        local v9 = v5.useBreakpointXOrSmaller(v5.Keys.Small);
        local v10 = v5.useBreakpointYOrSmaller(v5.Keys.Small);
        local v11 = l_useStyle_0();
        return v2.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(1, v9 and -24 or -360, 1, v10 and -24 or -72), 
            Image = "rbxasset://textures/ui/LuaChat/9-slice/modal.png", 
            ImageColor3 = v11.Theme.BackgroundUIDefault.Color, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(Vector2.new(5, 5), Vector2.new(6, 6))
        }, {
            sizeConstraint = v2.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(1000, 800), 
                MinSize = Vector2.new(0, 0)
            }), 
            padding = v2.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 2.5), 
                PaddingLeft = UDim.new(0, 2.5), 
                PaddingRight = UDim.new(0, 2.5), 
                PaddingTop = UDim.new(0, 2.5)
            }), 
            layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            topBar = v6(v8.navigation), 
            overlayContent = v2.createElement(v7, v8)
        });
    end;
end;
return function(v13) --[[ Line: 54 ]]
    -- upvalues: v3 (copy), v2 (copy), v5 (copy), l_useStyle_0 (copy), v6 (copy)
    local v14 = v3.createRobloxStackNavigator(v13);
    local v15 = v2.PureComponent:extend("OverlayNavigatorConnector");
    v15.router = v14.router;
    local function v20(v16) --[[ Line: 15 ]]
        -- upvalues: v5 (ref), l_useStyle_0 (ref), v2 (ref), v6 (ref), v14 (copy)
        local v17 = v5.useBreakpointXOrSmaller(v5.Keys.Small);
        local v18 = v5.useBreakpointYOrSmaller(v5.Keys.Small);
        local v19 = l_useStyle_0();
        return v2.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(1, v17 and -24 or -360, 1, v18 and -24 or -72), 
            Image = "rbxasset://textures/ui/LuaChat/9-slice/modal.png", 
            ImageColor3 = v19.Theme.BackgroundUIDefault.Color, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(Vector2.new(5, 5), Vector2.new(6, 6))
        }, {
            sizeConstraint = v2.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(1000, 800), 
                MinSize = Vector2.new(0, 0)
            }), 
            padding = v2.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 2.5), 
                PaddingLeft = UDim.new(0, 2.5), 
                PaddingRight = UDim.new(0, 2.5), 
                PaddingTop = UDim.new(0, 2.5)
            }), 
            layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            topBar = v6(v16.navigation), 
            overlayContent = v2.createElement(v14, v16)
        });
    end;
    v15.render = function(v21) --[[ Line: 61 ]] --[[ Name: render ]]
        -- upvalues: v2 (ref), v20 (copy)
        return v2.createElement(v20, v21.props);
    end;
    return v15;
end;