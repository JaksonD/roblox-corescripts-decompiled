local l_Parent_0 = script:FindFirstAncestor("GameFilters").Parent;
local v1 = require(l_Parent_0.Foundation);
local l_IconButton_0 = v1.IconButton;
local l_IconSize_0 = v1.Enums.IconSize;
local l_useTokens_0 = v1.Hooks.useTokens;
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.Responsive);
local l_FFlagLuaAppChartsHandheldFixes_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsHandheldFixes;
local l_FFlagLuaAppChartsFilterOptionTextTag_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag;
return function(v9) --[[ Line: 20 ]]
    -- upvalues: l_useTokens_0 (copy), l_FFlagLuaAppChartsHandheldFixes_0 (copy), v6 (copy), v5 (copy), l_FFlagLuaAppChartsFilterOptionTextTag_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy)
    local v10 = l_useTokens_0();
    local v11 = if l_FFlagLuaAppChartsHandheldFixes_0 then v6.usePreferredInput() == v6.Input.Directional else nil;
    local l_HeadingSmall_0 = v10.Typography.HeadingSmall;
    local l_Emphasis_0 = v10.Color.Content.Emphasis;
    return v5.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then nil else UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v9.LayoutOrder, 
        [v5.Change.AbsoluteSize] = function(v14) --[[ Line: 34 ]]
            -- upvalues: v9 (copy)
            v9.onHeightChanged(v14.AbsoluteSize.Y);
        end
    }, {
        Padding = v5.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v10.Padding.Medium), 
            PaddingBottom = UDim.new(0, v10.Padding.Medium), 
            PaddingLeft = UDim.new(0, v10.Padding.XXLarge), 
            PaddingRight = UDim.new(0, v10.Padding.XXLarge)
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
            Text = v9.title, 
            Font = l_HeadingSmall_0.Font, 
            TextSize = l_HeadingSmall_0.FontSize, 
            TextColor3 = l_Emphasis_0.Color3, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextWrapped = true
        }), 
        CloseButton = if l_FFlagLuaAppChartsHandheldFixes_0 and v11 then nil else v5.createElement(l_IconButton_0, {
            LayoutOrder = 2, 
            icon = "icons/navigation/close", 
            size = l_IconSize_0.Small, 
            onActivated = v9.onCloseButtonActivated
        })
    });
end;