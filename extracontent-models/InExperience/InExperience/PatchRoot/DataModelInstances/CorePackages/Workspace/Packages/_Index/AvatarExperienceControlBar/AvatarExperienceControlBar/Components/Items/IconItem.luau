local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceControlBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.ReactOtter);
local v5 = require(l_script_FirstAncestor_0.Components.Tooltip);
local _ = require(l_script_FirstAncestor_0.ControlBarTypes);
local l_FFlagAXAddToolTipToIconItemMenu_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXAddToolTipToIconItemMenu;
local l_FFlagAXMigrateBuilderIcons_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXMigrateBuilderIcons;
local l_isBuilderIcon_0 = v3.Utility.isBuilderIcon;
local l_IconVariant_0 = v3.Enums.IconVariant;
local v11 = require(l_script_FirstAncestor_0.Hooks.useSemanticTokens);
local v12 = require(l_script_FirstAncestor_0.Hooks.useHoverBinding);
local v13 = if l_FFlagAXMigrateBuilderIcons_0 then v3.Enums.IconName.X else "icons/navigation/close";
local v14 = {
    dampingRatio = 1, 
    frequency = 5
};
return v2.forwardRef(function(v15, v16) --[[ Line: 44 ]] --[[ Name: IconItem ]]
    -- upvalues: v11 (copy), v12 (copy), v4 (copy), l_FFlagAXMigrateBuilderIcons_0 (copy), v13 (copy), l_IconVariant_0 (copy), v2 (copy), v14 (copy), l_FFlagAXAddToolTipToIconItemMenu_0 (copy), v3 (copy), v5 (copy), l_isBuilderIcon_0 (copy)
    local v17 = v11();
    local v18, v19 = v12();
    local v20, v21 = v4.useAnimatedBinding(0);
    local v22 = v15.isActive or false;
    local v23 = if v15.size then v15.size else v17.defaultIconContainerSize;
    local v24 = if v15.iconSize then v15.iconSize else if l_FFlagAXMigrateBuilderIcons_0 then v17.defaultLegacyIconSize else v17.defaultIconSize;
    local v25 = if v15.activeIcon then v15.activeIcon else v13;
    local v26 = if l_FFlagAXMigrateBuilderIcons_0 then if v15.activeIconVariant then v15.activeIconVariant else l_IconVariant_0.Regular else nil;
    local v27 = if v15.activeIconSize then v15.activeIconSize else if v25 == v13 then v17.closeIconSize else v24;
    v2.useEffect(function() --[[ Line: 64 ]]
        -- upvalues: v15 (copy), v21 (copy), v4 (ref), v22 (copy), v14 (ref)
        if v15.animate then
            v21(v4.spring(v22 and 1 or 0, v14));
            return;
        else
            v21((v4.instant(v22 and 1 or 0)));
            return;
        end;
    end, {
        v22, 
        v15.animate
    });
    if l_FFlagAXAddToolTipToIconItemMenu_0 then
        return v2.createElement(v3.View, {
            Size = UDim2.new(0, v23, 0, v23), 
            LayoutOrder = v15.LayoutOrder, 
            tag = "row align-x-center align-y-center"
        }, {
            TooltipIconItem = v2.createElement(v5, v15.toolTipConfig, v2.createElement(v3.View, {
                Size = UDim2.new(0, v23, 0, v23), 
                onStateChanged = v19, 
                stateLayer = {
                    affordance = v3.Enums.StateLayerAffordance.None
                }, 
                tag = "radius-circle", 
                onActivated = v15.onActivated, 
                disabled = v15.disabled, 
                ref = v16, 
                LayoutOrder = v15.LayoutOrder
            }, {
                Icon = v2.createElement(v3.View, {
                    Size = UDim2.fromScale(1, 1), 
                    Visible = not v15.isActive or v15.animate and true or false, 
                    backgroundStyle = if v15.disabled then nil else v18:map(function(v28) --[[ Line: 98 ]]
                        -- upvalues: v17 (copy)
                        return {
                            Color3 = v17.hoverIconBackgroundStyle.Color3, 
                            Transparency = if v28 then v17.hoverIconBackgroundStyle.Transparency else 1
                        };
                    end), 
                    tag = if l_FFlagAXMigrateBuilderIcons_0 then {
                        ["radius-circle position-center-center anchor-center-center clip"] = true, 
                        ["row align-x-center align-y-center"] = l_isBuilderIcon_0(v15.icon)
                    } else "radius-circle position-center-center anchor-center-center clip"
                }, {
                    IconImage = if l_FFlagAXMigrateBuilderIcons_0 and l_isBuilderIcon_0(v15.icon) then v2.createElement(v3.Icon, {
                        name = v15.icon, 
                        size = v20:map(function(v29) --[[ Line: 114 ]]
                            -- upvalues: v24 (copy)
                            return (math.round((1 - v29) * v24));
                        end), 
                        variant = if v15.iconVariant then v15.iconVariant else l_IconVariant_0.Regular, 
                        style = {
                            Color3 = v17.contentForegroundStyle.Color3, 
                            Transparency = if v15.disabled then v17.contentDisabledTransparency else v17.contentForegroundStyle.Transparency
                        }, 
                        tag = "position-center-center anchor-center-center content-emphasis"
                    }) else v2.createElement(v3.Image, {
                        Image = v15.icon, 
                        Size = v20:map(function(v30) --[[ Line: 129 ]]
                            -- upvalues: v24 (copy)
                            local v31 = math.round((1 - v30) * v24);
                            return UDim2.fromOffset(v31, v31);
                        end), 
                        imageStyle = {
                            Color3 = v17.contentForegroundStyle.Color3, 
                            Transparency = if v15.disabled then v17.contentDisabledTransparency else v17.contentForegroundStyle.Transparency
                        }, 
                        tag = "position-center-center anchor-center-center content-emphasis"
                    })
                }), 
                ActiveIcon = if not not v22 or v15.animate then v2.createElement(v3.View, {
                    Size = UDim2.fromScale(1, 1), 
                    GroupTransparency = v20:map(function(v32) --[[ Line: 145 ]]
                        return 1 - v32;
                    end), 
                    backgroundStyle = if v15.disabled then nil else v18:map(function(v33) --[[ Line: 150 ]]
                        -- upvalues: v17 (copy)
                        if v33 then
                            return v17.hoverIconBackgroundStyle;
                        else
                            return v17.activeIconBackgroundStyle;
                        end;
                    end), 
                    tag = if l_FFlagAXMigrateBuilderIcons_0 then {
                        ["radius-circle position-center-center anchor-center-center clip"] = true, 
                        ["row align-x-center align-y-center"] = l_isBuilderIcon_0(v25)
                    } else "radius-circle position-center-center anchor-center-center clip"
                }, {
                    ActiveIconImage = if l_FFlagAXMigrateBuilderIcons_0 and l_isBuilderIcon_0(v25) then v2.createElement(v3.Icon, {
                        name = v25, 
                        size = v20:map(function(v34) --[[ Line: 166 ]]
                            -- upvalues: v24 (copy)
                            return (math.round(v34 * v24));
                        end), 
                        variant = v26, 
                        style = {
                            Color3 = v17.contentForegroundStyle.Color3, 
                            Transparency = if v15.disabled then v17.contentDisabledTransparency else v17.contentForegroundStyle.Transparency
                        }, 
                        tag = "size-full-full position-center-center anchor-center-center content-emphasis"
                    }) else v2.createElement(v3.Image, {
                        Image = v25, 
                        Size = v20:map(function(v35) --[[ Line: 181 ]]
                            -- upvalues: v27 (copy)
                            local v36 = math.round(v35 * v27);
                            return UDim2.fromOffset(v36, v36);
                        end), 
                        tag = "position-center-center anchor-center-center clip content-emphasis"
                    })
                }) else nil
            }))
        });
    else
        return v2.createElement(v3.View, {
            Size = UDim2.new(0, v23, 0, v23), 
            onStateChanged = v19, 
            stateLayer = {
                affordance = v3.Enums.StateLayerAffordance.None
            }, 
            tag = "radius-circle", 
            onActivated = v15.onActivated, 
            disabled = v15.disabled, 
            ref = v16, 
            LayoutOrder = v15.LayoutOrder
        }, {
            Icon = v2.createElement(v3.View, {
                Size = UDim2.fromScale(1, 1), 
                Visible = not v15.isActive or v15.animate and true or false, 
                backgroundStyle = if v15.disabled then nil else v18:map(function(v37) --[[ Line: 210 ]]
                    -- upvalues: v17 (copy)
                    return {
                        Color3 = v17.hoverIconBackgroundStyle.Color3, 
                        Transparency = if v37 then v17.hoverIconBackgroundStyle.Transparency else 1
                    };
                end), 
                tag = if l_FFlagAXMigrateBuilderIcons_0 then {
                    ["radius-circle position-center-center anchor-center-center clip"] = true, 
                    ["row align-x-center align-y-center"] = l_isBuilderIcon_0(v15.icon)
                } else "radius-circle position-center-center anchor-center-center clip"
            }, {
                IconImage = if l_FFlagAXMigrateBuilderIcons_0 and l_isBuilderIcon_0(v15.icon) then v2.createElement(v3.Icon, {
                    name = v15.icon, 
                    size = v20:map(function(v38) --[[ Line: 226 ]]
                        -- upvalues: v24 (copy)
                        return (math.round((1 - v38) * v24));
                    end), 
                    variant = if v15.iconVariant then v15.iconVariant else l_IconVariant_0.Regular, 
                    style = {
                        Color3 = v17.contentForegroundStyle.Color3, 
                        Transparency = if v15.disabled then v17.contentDisabledTransparency else v17.contentForegroundStyle.Transparency
                    }, 
                    tag = "position-center-center anchor-center-center content-emphasis"
                }) else v2.createElement(v3.Image, {
                    Image = v15.icon, 
                    Size = v20:map(function(v39) --[[ Line: 241 ]]
                        -- upvalues: v24 (copy)
                        local v40 = math.round((1 - v39) * v24);
                        return UDim2.fromOffset(v40, v40);
                    end), 
                    imageStyle = {
                        Color3 = v17.contentForegroundStyle.Color3, 
                        Transparency = if v15.disabled then v17.contentDisabledTransparency else v17.contentForegroundStyle.Transparency
                    }, 
                    tag = "position-center-center anchor-center-center content-emphasis"
                })
            }), 
            ActiveIcon = if not not v22 or v15.animate then v2.createElement(v3.View, {
                Size = UDim2.fromScale(1, 1), 
                GroupTransparency = v20:map(function(v41) --[[ Line: 257 ]]
                    return 1 - v41;
                end), 
                backgroundStyle = if v15.disabled then nil else v18:map(function(v42) --[[ Line: 262 ]]
                    -- upvalues: v17 (copy)
                    if v42 then
                        return v17.hoverIconBackgroundStyle;
                    else
                        return v17.activeIconBackgroundStyle;
                    end;
                end), 
                tag = if l_FFlagAXMigrateBuilderIcons_0 then {
                    ["radius-circle position-center-center anchor-center-center clip"] = true, 
                    ["row align-x-center align-y-center"] = l_isBuilderIcon_0(v25)
                } else "radius-circle position-center-center anchor-center-center clip"
            }, {
                ActiveIconImage = if l_FFlagAXMigrateBuilderIcons_0 and l_isBuilderIcon_0(v25) then v2.createElement(v3.Icon, {
                    name = v25, 
                    size = v20:map(function(v43) --[[ Line: 278 ]]
                        -- upvalues: v24 (copy)
                        return (math.round((1 - v43) * v24));
                    end), 
                    variant = v26, 
                    tag = "position-center-center anchor-center-center clip content-emphasis"
                }) else v2.createElement(v3.Image, {
                    Image = v25, 
                    Size = v20:map(function(v44) --[[ Line: 287 ]]
                        -- upvalues: v27 (copy)
                        local v45 = math.round(v44 * v27);
                        return UDim2.fromOffset(v45, v45);
                    end), 
                    tag = "position-center-center anchor-center-center clip content-emphasis"
                })
            }) else nil
        });
    end;
end);