local l_CorePackages_0 = game:GetService("CorePackages");
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v2 = require(l_CorePackages_0.Packages.Roact);
local l_SearchSourceEvent_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).SearchSourceEvent;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v5 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local l_FFlagSearchTopResultsTabEnabledForAll_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSearchTopResultsTabEnabledForAll;
local v7 = v2.PureComponent:extend("ButtonStripSelectorButton");
v7.render = function(v8) --[[ Line: 23 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v2 (copy), l_SearchSourceEvent_0 (copy), l_FFlagSearchTopResultsTabEnabledForAll_0 (copy), v5 (copy)
    local l_text_0 = v8.props.text;
    local l_layoutOrder_0 = v8.props.layoutOrder;
    local l_selected_0 = v8.props.selected;
    return l_withStyle_0(function(v12) --[[ Line: 27 ]]
        -- upvalues: l_selected_0 (copy), v2 (ref), l_layoutOrder_0 (copy), v8 (copy), l_SearchSourceEvent_0 (ref), l_FFlagSearchTopResultsTabEnabledForAll_0 (ref), v5 (ref), l_text_0 (copy)
        local v13 = l_selected_0 and v12.Theme.TextEmphasis.Color or v12.Theme.TextDefault.Color;
        local v14 = l_selected_0 and v12.Theme.SystemPrimaryContent.Transparency or v12.Theme.TextDefault.Transparency;
        local l_Color_0 = v12.Theme.BackgroundOnHover.Color;
        local v16 = l_selected_0 and v12.Theme.BackgroundOnHover.Transparency or 1;
        local v17 = v12.Font.BaseSize * v12.Font.Header2.RelativeSize;
        return v2.createElement("ImageButton", {
            LayoutOrder = l_layoutOrder_0, 
            Size = UDim2.new(0, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundTransparency = v16, 
            BackgroundColor3 = l_Color_0, 
            BorderSizePixel = 0, 
            [v2.Event.Activated] = function() --[[ Line: 42 ]]
                -- upvalues: v8 (ref), l_SearchSourceEvent_0 (ref)
                if v8.props.handleClick then
                    v8.props.handleClick(l_SearchSourceEvent_0.TabSwitch);
                end;
            end
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 1000)
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, (not not l_FFlagSearchTopResultsTabEnabledForAll_0 or v8.props.newDesignEnabled) and 12 or 6), 
                PaddingRight = UDim.new(0, (not not l_FFlagSearchTopResultsTabEnabledForAll_0 or v8.props.newDesignEnabled) and 12 or 6), 
                PaddingTop = UDim.new(0, (not not l_FFlagSearchTopResultsTabEnabledForAll_0 or v8.props.newDesignEnabled) and 6 or 6), 
                PaddingBottom = UDim.new(0, (not not l_FFlagSearchTopResultsTabEnabledForAll_0 or v8.props.newDesignEnabled) and 6 or 6)
            }), 
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 4)
            }), 
            Image = v8.props.image and v2.createElement(v5, {
                Size = UDim2.new(0, v17, 0, v17), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = v8.props.image, 
                ImageColor3 = v13, 
                ImageTransparency = v14, 
                LayoutOrder = 2, 
                BorderSizePixel = 0
            }) or nil, 
            Label = v2.createElement("TextLabel", {
                Text = l_text_0, 
                LayoutOrder = 3, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                TextSize = v17, 
                Font = if not not l_FFlagSearchTopResultsTabEnabledForAll_0 or v8.props.newDesignEnabled then v12.Font.Body.Font else v12.Font.Header2.Font, 
                TextColor3 = v13, 
                TextTransparency = v14, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            })
        });
    end);
end;
return v7;