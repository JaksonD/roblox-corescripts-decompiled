local l_Parent_0 = script:FindFirstAncestor("GameFilters").Parent;
local v1 = require(l_Parent_0.Foundation);
local l_IconButton_0 = v1.IconButton;
local l_IconSize_0 = v1.Enums.IconSize;
local l_useTokens_0 = v1.Hooks.useTokens;
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.Responsive);
local l_FFlagLuaAppChartsFilterOptionTextTag_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag;
return function(v8) --[[ Line: 19 ]]
    -- upvalues: l_useTokens_0 (copy), v6 (copy), v5 (copy), l_FFlagLuaAppChartsFilterOptionTextTag_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy)
    local v9 = l_useTokens_0();
    local v10 = v6.usePreferredInput() == v6.Input.Directional;
    local l_HeadingSmall_0 = v9.Typography.HeadingSmall;
    local l_Emphasis_0 = v9.Color.Content.Emphasis;
    return v5.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then nil else UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v8.LayoutOrder, 
        [v5.Change.AbsoluteSize] = function(v13) --[[ Line: 31 ]]
            -- upvalues: v8 (copy)
            v8.onHeightChanged(v13.AbsoluteSize.Y);
        end
    }, {
        Padding = v5.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v9.Padding.Medium), 
            PaddingBottom = UDim.new(0, v9.Padding.Medium), 
            PaddingLeft = UDim.new(0, v9.Padding.XXLarge), 
            PaddingRight = UDim.new(0, v9.Padding.XXLarge)
        }), 
        UIListLayout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Title = v5.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1, 
            Text = v8.title, 
            Font = l_HeadingSmall_0.Font, 
            TextSize = l_HeadingSmall_0.FontSize, 
            TextColor3 = l_Emphasis_0.Color3, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextWrapped = true
        }), 
        CloseButton = if v10 then nil else v5.createElement(l_IconButton_0, {
            LayoutOrder = 2, 
            icon = "icons/navigation/close", 
            size = l_IconSize_0.Small, 
            onActivated = v8.onCloseButtonActivated
        })
    });
end;