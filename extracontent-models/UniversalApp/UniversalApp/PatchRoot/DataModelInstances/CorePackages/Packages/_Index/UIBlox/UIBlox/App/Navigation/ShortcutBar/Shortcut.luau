local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_1.UIBloxConfig);
local v4 = require(l_Parent_2.React);
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v6 = require(l_Parent_2.Foundation);
local v7 = require(l_Parent_1.Core.Style.useStyle);
local v8 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v9 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v10 = require(l_Parent_0.ImageSet.getIconSize);
local v11 = require(l_Parent_1.Core.Text.GenericTextLabel.GenericTextLabel);
local v12 = require(l_Parent_0.Menu.KeyLabel.KeyLabel);
local v13 = require(script.Parent.ProgressIconAnimated);
local _ = require(script.Parent.Types);
local v15 = {
    iconLabelGap = 6, 
    actionTextSpacingLeading = 12, 
    size = UDim2.fromOffset(0, 0), 
    automaticSize = Enum.AutomaticSize.XY
};
local v16 = {
    hasProgress = false, 
    animationTriggerTime = 0.3, 
    animationKeyHoldingTime = 1.5, 
    animationCoolDownTime = 0.75
};
local function v33(v17, v18) --[[ Line: 43 ]] --[[ Name: renderIcon ]]
    -- upvalues: v6 (copy), v3 (copy), v10 (copy), v9 (copy), v4 (copy), v12 (copy), v8 (copy), v13 (copy)
    local l_layoutOrder_0 = v17.layoutOrder;
    local l_itemProps_0 = v17.itemProps;
    local v21 = v6.Hooks.useTokens();
    local v22 = if v3.useTokenizedShortcutBar then v21.Size.Size_600 else v10(v9.Medium);
    local l_hasProgress_0 = l_itemProps_0.hasProgress;
    local v24 = nil;
    if l_hasProgress_0 then
        v24 = l_itemProps_0;
    end;
    local l_icon_0 = l_itemProps_0.icon;
    local v26 = nil;
    local v27 = typeof(l_icon_0) == "EnumItem";
    local v28 = false;
    if typeof(l_icon_0) == "table" then
        v28 = #l_icon_0 > 0;
    end;
    if v27 or v28 then
        v26 = Enum.AutomaticSize.X;
    end;
    local v29 = nil;
    if v27 then
        v29 = v4.createElement(v12, {
            keyCode = l_icon_0, 
            iconThemeKey = "IconEmphasis"
        });
    elseif v28 then
        local v30 = {
            Layout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            })
        };
        for v31, v32 in l_icon_0 do
            v30["KeyLabel" .. v31] = v4.createElement(v12, {
                keyCode = v32, 
                LayoutOrder = v31, 
                iconThemeKey = "IconEmphasis"
            });
        end;
        v29 = v4.createElement("Frame", {
            Size = UDim2.fromScale(0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }, v30);
    else
        v29 = v4.createElement(v8.Label, {
            Size = UDim2.fromScale(1, 1), 
            Image = l_icon_0, 
            ImageColor3 = v18.Theme.TextEmphasis.Color, 
            ImageTransparency = v18.Theme.TextEmphasis.Transparency, 
            BackgroundTransparency = 1
        });
    end;
    return v4.createElement("Frame", {
        LayoutOrder = l_layoutOrder_0, 
        Size = UDim2.fromOffset(v22, v22), 
        AutomaticSize = v26, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, {
        ProgressIcon = if l_hasProgress_0 then v4.createElement(v13, v24) else nil, 
        Image = if l_hasProgress_0 then nil else v29
    });
end;
return function(v34) --[[ Line: 119 ]] --[[ Name: Shortcut ]]
    -- upvalues: l_Object_0 (copy), v15 (copy), v16 (copy), v7 (copy), v6 (copy), v4 (copy), v3 (copy), v11 (copy), v33 (copy)
    local v35 = l_Object_0.assign({}, v15, v34);
    local v36 = l_Object_0.assign({}, v16, v35.publicProps);
    local v37 = v7();
    local v38 = v6.Hooks.useTokens();
    local l_index_0 = v35.index;
    return v4.createElement("Frame", {
        LayoutOrder = l_index_0, 
        Size = if v3.enableShortcutCustomization then v35.size else UDim2.fromOffset(0, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        AutomaticSize = if v3.enableShortcutCustomization then v35.automaticSize else Enum.AutomaticSize.XY
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v35.iconLabelGap)
        }), 
        ActionText = if v36.actionText then v4.createElement("Frame", {
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(0, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            Padding = v4.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v35.actionTextSpacingLeading)
            }), 
            Label = v4.createElement(v11, {
                Size = UDim2.fromOffset(0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = v36.actionText, 
                colorStyle = v37.Theme.TextEmphasis, 
                fontStyle = v37.Font.SubHeader1, 
                BackgroundTransparency = 1
            })
        }) else nil, 
        Icon = if v3.enableShortcutCustomization and v35.renderIcon then v35.renderIcon({
            layoutOrder = 2
        }) else v33({
            layoutOrder = 2, 
            itemProps = v36
        }, v37), 
        LabelText = v4.createElement(v11, {
            LayoutOrder = 3, 
            Size = UDim2.fromOffset(0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = v36.text, 
            TextSize = if v3.enableShortcutCustomization and v35.labelTextSize then v35.labelTextSize else if v3.useTokenizedShortcutBar then v38.FontSize.FontSize_50 else nil, 
            colorStyle = if v3.enableShortcutCustomization and v35.labelColorStyle then v35.labelColorStyle else v37.Theme.TextEmphasis, 
            fontStyle = if v3.enableShortcutCustomization and v35.labelFontStyle then v35.labelFontStyle else v37.Font.SubHeader1, 
            BackgroundTransparency = 1
        })
    });
end;