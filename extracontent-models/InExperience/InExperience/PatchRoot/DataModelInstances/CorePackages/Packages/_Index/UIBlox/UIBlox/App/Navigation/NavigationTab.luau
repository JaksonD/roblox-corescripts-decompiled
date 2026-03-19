local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.Cryo);
local v5 = require(l_Parent_1.Foundation);
local v6 = require(l_Parent_0.Core.Control.StateLayer);
local v7 = require(l_Parent_0.Core.Style.useStyle);
local l_Label_0 = require(l_Parent_0.Core.ImageSet.ImageSetComponent).Label;
local v9 = require(l_Parent_0.App.Navigation.Enum.NavigationTabLayout);
local _ = require(l_Parent_0.App.ImageSet.ImagesTypes);
local _ = require(l_Parent_0.App.Style.StyleTypes);
local l_StatusIndicator_0 = v5.StatusIndicator;
local v13 = require(l_Parent_0.Utility.migrateBadgeVariant);
local v14 = Vector2.new(1e999, 1e999);
local v15 = {
    hasLabel = false, 
    isChecked = false, 
    badgeValue = nil, 
    layout = v9.Stacked
};
return (v3.forwardRef(function(v16, v17) --[[ Line: 67 ]]
    -- upvalues: v4 (copy), v15 (copy), v7 (copy), v3 (copy), l_TextService_0 (copy), v14 (copy), l_Label_0 (copy), v9 (copy), l_StatusIndicator_0 (copy), v13 (copy), v6 (copy)
    local v18 = v4.Dictionary.join(v15, v16);
    local l_Tokens_0 = v7().Tokens;
    local v20, v21 = v3.useBinding(UDim2.new());
    local v23 = v3.useCallback(function(v22) --[[ Line: 71 ]]
        -- upvalues: v21 (copy)
        v21(UDim2.fromOffset(v22.AbsoluteSize.X, v22.AbsoluteSize.Y));
    end, {});
    local v24 = nil;
    local v25 = nil;
    if v18.labelTypography then
        v25 = v18.labelTypography.FontSize;
        if v25 ~= nil and typeof(v25) ~= "number" then
            v25 = v25:getValue();
        end;
    end;
    v24 = v3.useMemo(function() --[[ Line: 84 ]]
        -- upvalues: v18 (copy), l_TextService_0 (ref), v25 (ref), v14 (ref)
        if v18.hasLabel and v18.labelText and v18.labelTypography then
            local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v18.labelText, v25, v18.labelTypography.Font, v14);
            return UDim2.new(0, l_l_TextService_0_TextSize_0.X + 2, 0, l_l_TextService_0_TextSize_0.Y + 2);
        else
            return nil;
        end;
    end, {
        v18.hasLabel, 
        v18.labelText, 
        v18.labelTypography, 
        v25
    });
    local v27 = nil;
    local v28 = UDim2.fromOffset(l_Tokens_0.Global.Size_350, l_Tokens_0.Global.Size_350);
    if v18.renderIcon then
        v27 = v18.renderIcon(v18.isChecked);
    else
        local v29 = if v18.isChecked and v18.iconCheckedImage then v18.iconCheckedImage else v18.iconImage;
        local v30 = if v18.isChecked then l_Tokens_0.Semantic.Color.Icon.Emphasis else l_Tokens_0.Semantic.Color.Icon.Default;
        v27 = v3.createElement(l_Label_0, {
            BackgroundTransparency = 1, 
            Size = v28, 
            Image = v29, 
            ScaleType = Enum.ScaleType.Fit, 
            ImageColor3 = v30.Color3, 
            ImageTransparency = v30.Transparency
        });
    end;
    if v18.layout == v9.Stacked and v18.badgeValue ~= nil then
        v27 = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = v28, 
            LayoutOrder = 1
        }, {
            Icon = v27, 
            Badge = v3.createElement(l_StatusIndicator_0, {
                Position = UDim2.fromScale(1, 0), 
                AnchorPoint = Vector2.new(0.6, 0.35), 
                value = tonumber(v18.badgeValue), 
                variant = v13(v18.badgeVariant), 
                max = tonumber(v18.badgeValue) and 99 or nil
            })
        });
    end;
    local v31 = nil;
    if v18.hasLabel and v18.labelText then
        local v32 = if v18.isChecked then l_Tokens_0.Semantic.Color.Text.Emphasis else l_Tokens_0.Semantic.Color.Text.Default;
        v31 = v3.createElement("TextLabel", {
            AutomaticSize = if v24 then nil else Enum.AutomaticSize.XY, 
            Size = v24, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextWrapped = false, 
            Text = v18.labelText, 
            Font = if v18.labelTypography then v18.labelTypography.Font else nil, 
            TextSize = if v18.labelTypography then v18.labelTypography.FontSize else nil, 
            LineHeight = if v18.labelTypography then v18.labelTypography.LineHeight else nil, 
            TextColor3 = v32.Color3, 
            TextTransparency = v32.Transparency
        });
    end;
    local v33 = nil;
    local v34 = nil;
    if v18.layout == v9.Stacked then
        v34 = UDim.new(0, l_Tokens_0.Semantic.Radius.Medium);
        v33 = v3.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(l_Tokens_0.Global.Space_600, l_Tokens_0.Global.Space_600), 
            [v3.Change.AbsoluteSize] = v23
        }, {
            UIPadding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_Tokens_0.Global.Space_100), 
                PaddingBottom = UDim.new(0, l_Tokens_0.Global.Space_100)
            }), 
            UIListLayout = v3.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, l_Tokens_0.Global.Space_50)
            }), 
            Icon = v27, 
            Label = v31
        });
    elseif v18.layout == v9.Inline then
        v34 = UDim.new(0, l_Tokens_0.Semantic.Radius.Large);
        local v35 = if v18.isChecked then l_Tokens_0.Semantic.Color.State.Standard.Pressed else {
            Transparency = 1, 
            Color3 = nil
        };
        v33 = v3.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = v35.Transparency, 
            BackgroundColor3 = v35.Color3, 
            Size = UDim2.fromOffset(l_Tokens_0.Global.Space_600, l_Tokens_0.Global.Space_500), 
            [v3.Change.AbsoluteSize] = v23
        }, {
            UIPadding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_Tokens_0.Global.Space_50), 
                PaddingBottom = UDim.new(0, l_Tokens_0.Global.Space_50), 
                PaddingLeft = UDim.new(0, l_Tokens_0.Global.Space_150), 
                PaddingRight = UDim.new(0, l_Tokens_0.Global.Space_150)
            }), 
            UIListLayout = v3.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, l_Tokens_0.Global.Space_150)
            }), 
            UICorner = v3.createElement("UICorner", {
                CornerRadius = v34
            }), 
            Icon = v27, 
            Label = v31, 
            Badge = if v18.badgeValue ~= nil then v3.createElement(l_StatusIndicator_0, {
                LayoutOrder = 3, 
                value = tonumber(v18.badgeValue), 
                variant = v13(v18.badgeVariant), 
                max = tonumber(v18.badgeValue) and 99 or nil
            }) else nil
        });
    end;
    return v3.createElement("Frame", {
        ref = v17, 
        Size = v20, 
        BackgroundTransparency = 1, 
        AnchorPoint = v18.anchorPoint, 
        Position = v18.position, 
        LayoutOrder = v18.layoutOrder
    }, {
        Contents = v33, 
        StateLayer = v3.createElement(v6, {
            affordance = "Background", 
            cornerRadius = v34, 
            zIndex = 10, 
            onActivated = v18.onActivated, 
            onStateChanged = v18.onStateChanged
        })
    });
end));