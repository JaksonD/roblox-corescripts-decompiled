local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.BuilderIcons);
local v3 = require(l_Parent_0.React);
local l_isBuilderOrMigratedIcon_0 = require(l_script_FirstAncestor_0.Utility.iconMigrationUtils).isBuilderOrMigratedIcon;
local v5 = require(l_script_FirstAncestor_0.Utility.Logger);
local v6 = require(l_script_FirstAncestor_0.Constants);
local v7 = require(l_script_FirstAncestor_0.Components.Icon);
local v8 = require(l_script_FirstAncestor_0.Components.Image);
local v9 = require(l_script_FirstAncestor_0.Components.Popover);
local v10 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v12 = require(l_script_FirstAncestor_0.Components.View);
local v13 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v14 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v15 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local l_useComposedRef_0 = require(l_Parent_0.ReactUtils).useComposedRef;
local _ = require(l_script_FirstAncestor_0.Enums.InputSize);
local v18 = require(l_script_FirstAncestor_0.Enums.PopoverAlign);
local v19 = require(l_script_FirstAncestor_0.Enums.PopoverSide);
local v20 = require(l_script_FirstAncestor_0.Enums.Radius);
local v21 = require(l_script_FirstAncestor_0.Utility.Flags);
local v22 = require(script.Parent.BaseMenuContext);
local v23 = require(script.Parent.useBaseMenuItemVariants);
local v24 = require(script.Parent.useMenuItemHover);
local v25 = {
    isChecked = false
};
return v3.memo(v3.forwardRef(function(v26, v27) --[[ Line: 57 ]] --[[ Name: BaseMenuItem ]]
    -- upvalues: v15 (copy), v25 (copy), v3 (copy), v22 (copy), v13 (copy), v21 (copy), v23 (copy), v24 (copy), v5 (copy), v2 (copy), l_useComposedRef_0 (copy), v12 (copy), v14 (copy), v6 (copy), l_isBuilderOrMigratedIcon_0 (copy), v7 (copy), v8 (copy), v10 (copy), v9 (copy), v19 (copy), v18 (copy), v20 (copy)
    local v28 = v15(v26, v25);
    local v29 = v3.useContext(v22);
    local l_hasLeading_0 = v29.hasLeading;
    local v31 = v13();
    local v32 = v28.size or v29.size;
    local l_depth_0 = v29.depth;
    local v34 = v21.FoundationBaseMenuSubmenuSupport and v28.children ~= nil;
    local v35 = v34 and v29.hoverOpenPath[l_depth_0] == v28.id;
    local v36 = v23(v31, v32, not v34 and v28.isChecked);
    local v37 = v3.useRef(nil);
    local v38 = nil;
    local v39 = nil;
    local v40 = nil;
    if v21.FoundationBaseMenuSubmenuSupport then
        local v41, v42 = v3.useState(false);
        v38 = v41;
        v39 = v42;
        v40 = v3.useCallback(function() --[[ Line: 76 ]]
            -- upvalues: v39 (ref)
            v39(true);
        end, {});
    end;
    v3.useEffect(function() --[[ Line: 81 ]]
        -- upvalues: v28 (copy), v29 (copy)
        if v28.icon and v29.setHasLeading then
            v29.setHasLeading();
        end;
    end, {
        v28.icon, 
        v29.setHasLeading
    });
    if v21.FoundationBaseMenuSubmenuSupport then
        v24({
            itemRef = v37, 
            id = v28.id, 
            depth = l_depth_0, 
            isSubmenu = v34, 
            isDisabled = v28.isDisabled, 
            hoverOpenAtDepth = v29.hoverOpenAtDepth, 
            hoverCloseAtDepth = v29.hoverCloseAtDepth
        });
    end;
    local v44 = v3.useCallback(function() --[[ Line: 100 ]]
        -- upvalues: v34 (copy), v28 (copy), v29 (copy), v35 (copy), l_depth_0 (copy), v21 (ref), v5 (ref)
        if v34 then
            if v28.isDisabled then
                return;
            elseif v29.hoverOpenAtDepth and not v35 then
                v29.hoverOpenAtDepth(l_depth_0, v28.id, true);
                return;
            end;
        else
            if v21.FoundationBaseMenuSubmenuSupport and v29.hoverReset then
                v29.hoverReset();
            end;
            local v43 = if v28.onActivated then v28.onActivated else v29.onActivated;
            if not v43 then
                v5:warning("Menu should have either onActivated on itself or on all of its children");
                return;
            else
                v43(v28.id);
            end;
        end;
    end, {
        v34, 
        v28.isDisabled, 
        v35, 
        l_depth_0, 
        v28.id, 
        v28.onActivated, 
        v29.onActivated, 
        v29.hoverOpenAtDepth, 
        v29.hoverReset
    });
    local v45 = nil;
    if v21.FoundationBaseMenuSubmenuSupport then
        v45 = v3.useCallback(function() --[[ Line: 138 ]]
            -- upvalues: v29 (copy)
            if v29.hoverReset then
                v29.hoverReset();
            end;
        end, {
            v29.hoverReset
        });
    end;
    local v46 = v3.useMemo(function() --[[ Line: 145 ]]
        -- upvalues: v31 (copy)
        return {
            radius = UDim.new(0, v31.Radius.Small), 
            offset = v31.Size.Size_200, 
            borderWidth = v31.Stroke.Thicker
        };
    end, {
        v31
    });
    local v47 = v3.useMemo(function() --[[ Line: 153 ]]
        -- upvalues: v2 (ref), v28 (copy)
        return v2.Migration.uiblox[v28.icon];
    end, {
        v28.icon
    });
    local v48 = l_useComposedRef_0(v37, v27);
    local v49 = v3.createElement(v12, v14(v28, {
        GroupTransparency = if v28.isDisabled then v6.DISABLED_TRANSPARENCY else nil, 
        isDisabled = v28.isDisabled, 
        onActivated = v44, 
        selection = {
            Selectable = not v28.isDisabled
        }, 
        cursor = v46, 
        tag = v36.container.tag, 
        ref = if v21.FoundationBaseMenuSubmenuSupport then v48 else v27
    }), {
        Icon = if not not v28.icon or l_hasLeading_0 then if v28.icon and l_isBuilderOrMigratedIcon_0(v28.icon) then v3.createElement(v12, {
            LayoutOrder = 1, 
            tag = ("align-x-center align-y-center %*"):format(v36.icon.tag)
        }, {
            Icon = v3.createElement(v7, {
                name = if v47 then v47.name else v28.icon, 
                style = v36.icon.style, 
                size = v36.icon.size
            })
        }) else v3.createElement(v8, {
            LayoutOrder = 1, 
            Image = v28.icon, 
            tag = v36.icon.tag
        }) else nil, 
        Text = v3.createElement(v10, {
            LayoutOrder = 2, 
            Text = v28.text, 
            tag = v36.text.tag
        }), 
        Chevron = if v34 then v3.createElement(v7, {
            LayoutOrder = 3, 
            name = v2.Icon.ChevronSmallRight, 
            style = v36.check.style, 
            size = v36.chevron.size, 
            testId = ("%*--chevron"):format(v28.testId)
        }) else nil, 
        Check = if not v34 and v28.isChecked then v3.createElement(v7, {
            LayoutOrder = 3, 
            name = v2.Icon.Check, 
            style = v36.check.style, 
            size = v36.check.size, 
            testId = ("%*--checkmark"):format(v28.testId)
        }) else nil
    });
    if not v34 then
        return v49;
    else
        local l_Standard_0 = v31.Stroke.Standard;
        local l_size_0 = v36.groupPadding.size;
        return v3.createElement(v3.Fragment, nil, {
            Item = v49, 
            Submenu = v3.createElement(v9.Root, {
                isOpen = v35, 
                testId = ("%*--submenu"):format(v28.testId)
            }, {
                Anchor = v3.createElement(v9.Anchor, {
                    anchorRef = v37
                }), 
                Content = v3.createElement(v9.Content, {
                    side = {
                        position = v19.Right, 
                        offset = l_size_0 / 2 + l_Standard_0
                    }, 
                    align = {
                        position = v18.Start, 
                        offset = -l_size_0
                    }, 
                    hasArrow = false, 
                    onPressedOutside = v45, 
                    backgroundStyle = v31.Color.Surface.Surface_100, 
                    radius = v20.Medium
                }, v3.createElement(v12, {
                    tag = "col auto-xy stroke-standard stroke-default radius-medium"
                }, v3.createElement(v22.Provider, {
                    value = {
                        onActivated = v29.onActivated, 
                        size = v32, 
                        hasLeading = v38, 
                        setHasLeading = v40, 
                        hoverOpenPath = v29.hoverOpenPath, 
                        hoverOpenAtDepth = v29.hoverOpenAtDepth, 
                        hoverCloseAtDepth = v29.hoverCloseAtDepth, 
                        hoverReset = v29.hoverReset, 
                        depth = l_depth_0 + 1
                    }
                }, v28.children)))
            })
        });
    end;
end));