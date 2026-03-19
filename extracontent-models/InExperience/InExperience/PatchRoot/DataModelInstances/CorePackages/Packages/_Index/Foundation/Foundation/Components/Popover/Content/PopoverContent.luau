local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Constants);
local v3 = require(l_script_FirstAncestor_0.Components.Image);
local v4 = require(script.Parent.Parent.PopoverContext);
local v5 = require(l_script_FirstAncestor_0.Components.View);
local v6 = require(l_script_FirstAncestor_0.Utility.isPointInGuiObjectBounds);
local v7 = require(script.Parent.Parent.useFloating);
local v8 = require(l_script_FirstAncestor_0.Providers.Overlay.useOverlay);
local v9 = require(l_script_FirstAncestor_0.Utility.usePointerPosition);
local v10 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v11 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v12 = require(l_script_FirstAncestor_0.Utility.Flags);
local v13 = require(l_script_FirstAncestor_0.Enums.PopoverAlign);
local v14 = require(l_script_FirstAncestor_0.Enums.PopoverSide);
local v15 = require(l_script_FirstAncestor_0.Enums.Radius);
local v16 = require(l_Parent_0.React);
local v17 = require(l_Parent_0.ReactRoblox);
local v18 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local v19 = require(l_script_FirstAncestor_0.Enums.ElevationLayer);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v21 = require(l_script_FirstAncestor_0.Providers.Elevation.useElevation);
local l_ElevationOwnerScope_0 = require(l_script_FirstAncestor_0.Providers.Elevation.ElevationProvider).ElevationOwnerScope;
local v23 = {
    side = v14.Bottom, 
    align = v13.Center, 
    hasArrow = true, 
    selection = v2.MODAL.DISABLE_SELECTION, 
    selectionGroup = v2.MODAL.TRAP_FOCUS, 
    radius = v15.Medium
};
local v24 = {
    [v15.Small] = "radius-small", 
    [v15.Medium] = "radius-medium", 
    [v15.Circle] = "radius-circle"
};
local l_SHADOW_IMAGE_0 = v2.SHADOW_IMAGE;
local l_SHADOW_SIZE_0 = v2.SHADOW_SIZE;
return v16.forwardRef(function(v27, v28) --[[ Line: 74 ]] --[[ Name: PopoverContent ]]
    -- upvalues: v11 (copy), v23 (copy), v16 (copy), v4 (copy), v8 (copy), v10 (copy), v21 (copy), v19 (copy), v9 (copy), v7 (copy), v6 (copy), v12 (copy), v5 (copy), v18 (copy), v3 (copy), l_SHADOW_IMAGE_0 (copy), l_SHADOW_SIZE_0 (copy), v24 (copy), l_ElevationOwnerScope_0 (copy), v17 (copy)
    local v29 = v11(v27, v23);
    local v30 = v16.useContext(v4);
    local v31 = typeof(v30.anchor) == "Instance";
    local v32 = if v31 then v29.hasArrow else false;
    local v33 = v8();
    local v34 = v10();
    local v35 = v21(v19.Popover, {
        stackAboveOwner = true
    });
    local l_Size_200_0 = v34.Size.Size_200;
    local v37 = l_Size_200_0 * 1.4142135623730951 / 2;
    local v38 = v29.backgroundStyle or v34.Color.Surface.Surface_100;
    local v39, v40 = v16.useState(nil);
    local v41, v42 = v16.useState(nil);
    local v43 = v9(v41);
    v16.useImperativeHandle(v28, function() --[[ Line: 93 ]]
        -- upvalues: v39 (copy)
        return v39;
    end, {
        v39
    });
    local v44, v45, v46, v47, v48, v49 = v7(v30.isOpen, v30.anchor, v39, v33, v29.side, v29.align, if v32 then v37 else 0);
    local v50 = v16.useRef(nil);
    local v54 = v16.useCallback(function(v51) --[[ Line: 109 ]]
        -- upvalues: v50 (copy), v42 (copy), v29 (copy), v30 (copy), v31 (copy), v43 (copy), v6 (ref)
        if v50.current then
            v50.current:Disconnect();
        end;
        v42(v51);
        if v51 ~= nil and v29.onPressedOutside then
            v50.current = v51:GetPropertyChangedSignal("GuiState"):Connect(function() --[[ Line: 116 ]]
                -- upvalues: v51 (copy), v30 (ref), v31 (ref), v43 (ref), v6 (ref), v29 (ref)
                if v51.GuiState == Enum.GuiState.Press then
                    if v30.anchor and v31 then
                        local l_anchor_0 = v30.anchor;
                        local v53 = v43:getValue();
                        if v6(l_anchor_0, v53) then
                            return;
                        elseif l_anchor_0.GuiState ~= Enum.GuiState.Idle then
                            return;
                        end;
                    end;
                    v29.onPressedOutside();
                end;
            end);
        end;
    end, {
        v29.onPressedOutside, 
        v30.anchor
    });
    v16.useEffect(function() --[[ Line: 139 ]]
        -- upvalues: v50 (copy)
        return function() --[[ Line: 140 ]]
            -- upvalues: v50 (ref)
            if v50.current then
                v50.current:Disconnect();
            end;
        end;
    end, {});
    local v61 = if not v12.FoundationPopoverConditionalRender or v30.isOpen then v16.createElement(v5, {
        ZIndex = v35.zIndex, 
        tag = "size-full", 
        Visible = v45, 
        testId = ("%*--container"):format(v30.testId)
    }, {
        Backdrop = if v29.onPressedOutside and v30.isOpen then v16.createElement(v5, {
            ZIndex = 1, 
            stateLayer = {
                affordance = v18.None
            }, 
            Size = UDim2.fromScale(2, 2), 
            tag = "position-center-center anchor-center-center", 
            ref = v54, 
            testId = ("%*--backdrop"):format(v30.testId)
        }) else nil, 
        Shadow = v16.createElement(v3, {
            AnchorPoint = v49, 
            Image = l_SHADOW_IMAGE_0, 
            Size = v46:map(function(v55) --[[ Line: 170 ]]
                -- upvalues: l_SHADOW_SIZE_0 (ref)
                return v55 + UDim2.fromOffset(l_SHADOW_SIZE_0, l_SHADOW_SIZE_0);
            end), 
            Position = v16.joinBindings({
                v44, 
                v49
            }):map(function(v56) --[[ Line: 173 ]]
                -- upvalues: l_SHADOW_SIZE_0 (ref)
                local v57 = v56[2].X == 0 and -1 or 1;
                local v58 = v56[2].Y == 0 and -1 or 1;
                return UDim2.fromOffset(v56[1].X + l_SHADOW_SIZE_0 / 2 * v57, v56[1].Y + l_SHADOW_SIZE_0 / 2 * v58 + 2);
            end), 
            ZIndex = 2, 
            slice = {
                center = Rect.new(l_SHADOW_SIZE_0, l_SHADOW_SIZE_0, l_SHADOW_SIZE_0 + 1, l_SHADOW_SIZE_0 + 1)
            }, 
            imageStyle = v34.Color.Extended.Black.Black_20, 
            testId = ("%*--shadow"):format(v30.testId)
        }), 
        Arrow = if v32 then v16.createElement(v5, {
            Size = UDim2.fromOffset(l_Size_200_0, l_Size_200_0), 
            Position = v47:map(function(v59) --[[ Line: 191 ]]
                return UDim2.fromOffset(v59.X, v59.Y);
            end), 
            Rotation = 45, 
            ZIndex = 3, 
            backgroundStyle = v38, 
            tag = "anchor-center-center", 
            testId = ("%*--arrow"):format(v30.testId)
        }) else nil, 
        Content = v16.createElement(v5, {
            AnchorPoint = v49, 
            Position = v44:map(function(v60) --[[ Line: 205 ]]
                return UDim2.fromOffset(v60.X, v60.Y);
            end), 
            selection = v29.selection, 
            selectionGroup = v29.selectionGroup, 
            sizeConstraint = {
                MaxSize = v48
            }, 
            stateLayer = {
                affordance = v18.None
            }, 
            ZIndex = 4, 
            onActivated = v29.onPressedOutside and function() --[[ Line: 218 ]]

            end or nil, 
            backgroundStyle = v38, 
            tag = ("auto-xy %*"):format(v24[v29.radius]), 
            ref = v40, 
            testId = ("%*--content"):format(v30.testId)
        }, if v12.FoundationElevationKeepSiblingZIndex then v16.createElement(l_ElevationOwnerScope_0, {
            owner = v35
        }, v29.children) else v29.children)
    }) else nil;
    if v33 == nil then
        return v61;
    else
        return v17.createPortal(v61, v33);
    end;
end);