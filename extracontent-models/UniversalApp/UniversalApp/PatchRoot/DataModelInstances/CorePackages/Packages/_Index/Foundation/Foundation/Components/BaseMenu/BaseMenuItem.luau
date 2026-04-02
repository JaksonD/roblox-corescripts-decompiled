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
local v30 = (function() --[[ Line: 58 ]] --[[ Name: getInputSinkAll ]]
    -- upvalues: v21 (copy)
    if not v21.FoundationGuiObjectInputSinkProperty then
        return nil;
    else
        local l_status_0, l_result_0 = pcall(game.GetEngineFeature, game, "GuiObjectInputSink");
        if not l_status_0 or not l_result_0 then
            return nil;
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 68 ]]
                return Enum.InputSink.All;
            end);
            if l_status_1 then
                return l_result_1;
            else
                return nil;
            end;
        end;
    end;
end)();
return v3.memo(v3.forwardRef(function(v31, v32) --[[ Line: 77 ]] --[[ Name: BaseMenuItem ]]
    -- upvalues: v15 (copy), v25 (copy), v3 (copy), v22 (copy), v13 (copy), v21 (copy), v23 (copy), v24 (copy), v5 (copy), v2 (copy), l_useComposedRef_0 (copy), v12 (copy), v14 (copy), v6 (copy), l_isBuilderOrMigratedIcon_0 (copy), v7 (copy), v8 (copy), v10 (copy), v9 (copy), v19 (copy), v18 (copy), v20 (copy), v30 (copy)
    local v33 = v15(v31, v25);
    local v34 = v3.useContext(v22);
    local l_hasLeading_0 = v34.hasLeading;
    local v36 = v13();
    local v37 = v33.size or v34.size;
    local l_depth_0 = v34.depth;
    local v39 = v21.FoundationBaseMenuSubmenuSupport and v33.children ~= nil;
    local v40 = v39 and v34.hoverOpenPath[l_depth_0] == v33.id;
    local v41 = v23(v36, v37, not v39 and v33.isChecked);
    local v42 = v3.useRef(nil);
    local v43 = nil;
    local v44 = nil;
    local v45 = nil;
    if v21.FoundationBaseMenuSubmenuSupport then
        local v46, v47 = v3.useState(false);
        v43 = v46;
        v44 = v47;
        v45 = v3.useCallback(function() --[[ Line: 96 ]]
            -- upvalues: v44 (ref)
            v44(true);
        end, {});
    end;
    v3.useEffect(function() --[[ Line: 101 ]]
        -- upvalues: v33 (copy), v34 (copy)
        if v33.icon and v34.setHasLeading then
            v34.setHasLeading();
        end;
    end, {
        v33.icon, 
        v34.setHasLeading
    });
    if v21.FoundationBaseMenuSubmenuSupport then
        v24({
            itemRef = v42, 
            id = v33.id, 
            depth = l_depth_0, 
            isSubmenu = v39, 
            isDisabled = v33.isDisabled, 
            hoverOpenAtDepth = v34.hoverOpenAtDepth, 
            hoverCloseAtDepth = v34.hoverCloseAtDepth
        });
    end;
    local v49 = v3.useCallback(function() --[[ Line: 120 ]]
        -- upvalues: v39 (copy), v33 (copy), v34 (copy), v40 (copy), l_depth_0 (copy), v21 (ref), v5 (ref)
        if v39 then
            if v33.isDisabled then
                return;
            elseif v34.hoverOpenAtDepth and not v40 then
                v34.hoverOpenAtDepth(l_depth_0, v33.id, true);
                return;
            end;
        else
            if v21.FoundationBaseMenuSubmenuSupport and v34.hoverReset then
                v34.hoverReset();
            end;
            local v48 = if v33.onActivated then v33.onActivated else v34.onActivated;
            if not v48 then
                v5:warning("Menu should have either onActivated on itself or on all of its children");
                return;
            else
                v48(v33.id);
            end;
        end;
    end, {
        v39, 
        v33.isDisabled, 
        v40, 
        l_depth_0, 
        v33.id, 
        v33.onActivated, 
        v34.onActivated, 
        v34.hoverOpenAtDepth, 
        v34.hoverReset
    });
    local v50 = nil;
    if v21.FoundationBaseMenuSubmenuSupport then
        v50 = v3.useCallback(function() --[[ Line: 158 ]]
            -- upvalues: v34 (copy)
            if v34.hoverReset then
                v34.hoverReset();
            end;
        end, {
            v34.hoverReset
        });
    end;
    local v51 = v3.useMemo(function() --[[ Line: 165 ]]
        -- upvalues: v36 (copy)
        return {
            radius = UDim.new(0, v36.Radius.Small), 
            offset = v36.Size.Size_200, 
            borderWidth = v36.Stroke.Thicker
        };
    end, {
        v36
    });
    local v52 = v3.useMemo(function() --[[ Line: 173 ]]
        -- upvalues: v2 (ref), v33 (copy)
        return v2.Migration.uiblox[v33.icon];
    end, {
        v33.icon
    });
    local v53 = l_useComposedRef_0(v42, v32);
    local v54 = v3.createElement(v12, v14(v33, {
        GroupTransparency = if v33.isDisabled then v6.DISABLED_TRANSPARENCY else nil, 
        isDisabled = v33.isDisabled, 
        onActivated = v49, 
        selection = {
            Selectable = not v33.isDisabled
        }, 
        cursor = v51, 
        tag = v41.container.tag, 
        ref = if v21.FoundationBaseMenuSubmenuSupport then v53 else v32
    }), {
        Icon = if not not v33.icon or l_hasLeading_0 then if v33.icon and l_isBuilderOrMigratedIcon_0(v33.icon) then v3.createElement(v12, {
            LayoutOrder = 1, 
            tag = ("align-x-center align-y-center %*"):format(v41.icon.tag)
        }, {
            Icon = v3.createElement(v7, {
                name = if v52 then v52.name else v33.icon, 
                style = v41.icon.style, 
                size = v41.icon.size
            })
        }) else v3.createElement(v8, {
            LayoutOrder = 1, 
            Image = v33.icon, 
            tag = v41.icon.tag
        }) else nil, 
        Text = v3.createElement(v10, {
            LayoutOrder = 2, 
            Text = v33.text, 
            tag = v41.text.tag
        }), 
        Chevron = if v39 then v3.createElement(v7, {
            LayoutOrder = 3, 
            name = v2.Icon.ChevronSmallRight, 
            style = v41.check.style, 
            size = v41.chevron.size, 
            testId = ("%*--chevron"):format(v33.testId)
        }) else nil, 
        Check = if not v39 and v33.isChecked then v3.createElement(v7, {
            LayoutOrder = 3, 
            name = v2.Icon.Check, 
            style = v41.check.style, 
            size = v41.check.size, 
            testId = ("%*--checkmark"):format(v33.testId)
        }) else nil
    });
    if not v39 then
        return v54;
    else
        local l_Standard_0 = v36.Stroke.Standard;
        local l_size_0 = v41.groupPadding.size;
        return v3.createElement(v3.Fragment, nil, {
            Item = v54, 
            Submenu = v3.createElement(v9.Root, {
                isOpen = v40, 
                testId = ("%*--submenu"):format(v33.testId)
            }, {
                Anchor = v3.createElement(v9.Anchor, {
                    anchorRef = v42
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
                    onPressedOutside = v50, 
                    backgroundStyle = v36.Color.Surface.Surface_100, 
                    radius = v20.Medium
                }, v3.createElement(v12, {
                    tag = "col auto-xy stroke-standard stroke-default radius-medium", 
                    InputSink = v30
                }, v3.createElement(v22.Provider, {
                    value = {
                        onActivated = v34.onActivated, 
                        size = v37, 
                        hasLeading = v43, 
                        setHasLeading = v45, 
                        hoverOpenPath = v34.hoverOpenPath, 
                        hoverOpenAtDepth = v34.hoverOpenAtDepth, 
                        hoverCloseAtDepth = v34.hoverCloseAtDepth, 
                        hoverReset = v34.hoverReset, 
                        depth = l_depth_0 + 1
                    }
                }, v33.children)))
            })
        });
    end;
end));