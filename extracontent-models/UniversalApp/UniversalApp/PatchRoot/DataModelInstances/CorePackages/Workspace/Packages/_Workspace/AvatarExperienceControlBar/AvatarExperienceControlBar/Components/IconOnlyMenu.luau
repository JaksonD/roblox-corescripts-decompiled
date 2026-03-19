local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceControlBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_script_FirstAncestor_0.Hooks.useSemanticTokens);
local _ = require(l_script_FirstAncestor_0.ControlBarTypes);
local v6 = require(l_script_FirstAncestor_0.Components.Items.IconItem);
local v7 = require(l_script_FirstAncestor_0.Components.Items.ImageItem);
local v8 = require(l_script_FirstAncestor_0.Components.Items.ColorItem);
local l_FFlagAXAddToolTipToIconItemMenu_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXAddToolTipToIconItemMenu;
local l_FFlagAXMigrateBuilderIcons_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXMigrateBuilderIcons;
local l_FFlagAXResetAvatarButton_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXResetAvatarButton;
return v2.memo(v2.forwardRef(function(v12, v13) --[[ Line: 27 ]] --[[ Name: IconOnlyMenu ]]
    -- upvalues: v4 (copy), v2 (copy), l_FFlagAXResetAvatarButton_0 (copy), v7 (copy), v6 (copy), l_FFlagAXMigrateBuilderIcons_0 (copy), l_FFlagAXAddToolTipToIconItemMenu_0 (copy), v8 (copy), v3 (copy)
    local v14 = v4();
    local v20 = v2.useCallback(function(v15) --[[ Line: 30 ]]
        -- upvalues: l_FFlagAXResetAvatarButton_0 (ref), v2 (ref), v7 (ref), v6 (ref), l_FFlagAXMigrateBuilderIcons_0 (ref), l_FFlagAXAddToolTipToIconItemMenu_0 (ref), v12 (copy), v8 (ref), v3 (ref)
        local l_item_0 = v15.item;
        local l_isActive_0 = v15.isActive;
        local l_onItemActivated_0 = v15.onItemActivated;
        local v19 = if l_FFlagAXResetAvatarButton_0 and l_item_0.type == "divider" then nil else function() --[[ Line: 43 ]]
            -- upvalues: l_onItemActivated_0 (copy), l_item_0 (copy)
            if l_onItemActivated_0 then
                l_onItemActivated_0(l_item_0.id);
            end;
            if l_item_0.onActivated then
                l_item_0.onActivated();
            end;
        end;
        if l_item_0.type == "image" then
            return v2.createElement(v7, {
                thumbnailUrl = l_item_0.thumbnailUrl, 
                isActive = l_isActive_0, 
                onActivated = v19, 
                disabled = l_item_0.disabled, 
                ref = l_item_0.ref, 
                enableFocusAnimation = l_item_0.enableFocusAnimation, 
                Visible = l_item_0.visible, 
                LayoutOrder = v15.index, 
                hideIndicator = l_item_0.hideIndicator
            });
        elseif l_item_0.type == "icon" then
            return v2.createElement(v6, {
                icon = l_item_0.icon, 
                activeIcon = l_item_0.activeIcon, 
                iconSize = l_item_0.iconSize, 
                iconVariant = if l_FFlagAXMigrateBuilderIcons_0 then l_item_0.iconVariant else nil, 
                activeIconVariant = if l_FFlagAXMigrateBuilderIcons_0 then l_item_0.activeIconVariant else nil, 
                isActive = l_isActive_0, 
                animate = not l_item_0.disableAnimation, 
                onActivated = v19, 
                disabled = l_item_0.disabled, 
                toolTipConfig = if l_FFlagAXAddToolTipToIconItemMenu_0 and v12.activeItemId ~= "" and l_item_0.toolTipConfig then nil else l_item_0.toolTipConfig, 
                ref = l_item_0.ref, 
                Visible = l_item_0.visible, 
                LayoutOrder = v15.index
            });
        elseif l_item_0.type == "color" then
            return v2.createElement(v8, {
                colors = l_item_0.colors, 
                colorSize = l_item_0.colorSize, 
                isActive = l_item_0.isActive, 
                size = l_item_0.size, 
                onActivated = v19, 
                disabled = l_item_0.disabled, 
                ref = l_item_0.ref, 
                Visible = l_item_0.visible, 
                LayoutOrder = v15.index, 
                Selectable = l_item_0.Selectable
            });
        elseif l_FFlagAXResetAvatarButton_0 and l_item_0.type == "divider" then
            return v2.createElement(v3.Divider, {
                variant = l_item_0.variant, 
                ref = l_item_0.ref, 
                Visible = l_item_0.visible, 
                LayoutOrder = v15.index
            });
        else
            return nil;
        end;
    end, {
        if l_FFlagAXAddToolTipToIconItemMenu_0 then v12.activeItemId else nil
    });
    local v25 = v2.useMemo(function() --[[ Line: 110 ]]
        -- upvalues: v2 (ref), v12 (copy), v14 (copy), v20 (copy)
        local v21 = {
            IconOnlyMenuListLayout = v2.createElement("UIListLayout", {
                FillDirection = if v12.direction == "horizontal" then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v14.iconOnlyMenuItemGap)
            })
        };
        for v22, v23 in v12.items do
            local v24 = if v23.type == "divider" then nil else if v23.isActive ~= nil then v23.isActive else v23.id == v12.activeItemId;
            v21[("MenuItem-%*"):format(v23.id)] = v20({
                item = v23, 
                isActive = v24, 
                onItemActivated = v12.onItemActivated, 
                index = v22
            });
        end;
        return v21;
    end, {
        v12.items, 
        v12.activeItemId, 
        v12.onItemActivated, 
        v12.direction, 
        v20
    });
    return v2.createElement(v3.View, {
        tag = "auto-xy radius-circle padding-xsmall", 
        backgroundStyle = v14.menuBackgroundStyle, 
        ref = v13, 
        Visible = #v12.items > 0, 
        LayoutOrder = v12.LayoutOrder, 
        onAbsoluteSizeChanged = v12.onAbsoluteSizeChanged, 
        Position = v12.Position
    }, v25);
end));