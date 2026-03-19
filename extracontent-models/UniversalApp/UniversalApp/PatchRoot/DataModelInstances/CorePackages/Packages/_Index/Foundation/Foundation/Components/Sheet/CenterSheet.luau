local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.Otter);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.ReactOtter);
local v6 = require(l_Parent_0.ReactRoblox);
local l_useAnimatedBinding_0 = v5.useAnimatedBinding;
local v8 = require(l_script_FirstAncestor_0.Enums.CloseAffordanceVariant);
local v9 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local v10 = require(l_script_FirstAncestor_0.Providers.Overlay.useOverlay);
local v11 = require(l_script_FirstAncestor_0.Utility.useScaledValue);
local v12 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v13 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local l_DIALOG_SIZES_0 = require(l_script_FirstAncestor_0.Components.Dialog.useDialogVariants).DIALOG_SIZES;
local v15 = require(l_script_FirstAncestor_0.Constants);
local v16 = require(l_script_FirstAncestor_0.Enums.DialogSize);
local v17 = require(l_script_FirstAncestor_0.Enums.ElevationLayer);
local v18 = require(l_script_FirstAncestor_0.Providers.Elevation.useElevation);
local l_ElevationOwnerScope_0 = require(l_script_FirstAncestor_0.Providers.Elevation.ElevationProvider).ElevationOwnerScope;
local v20 = require(l_script_FirstAncestor_0.Utility.Flags);
local v21 = require(l_script_FirstAncestor_0.Providers.Preferences.usePreferences);
local v22 = require(script.Parent.SheetContext);
local v23 = require(script.Parent.Types);
local v24 = require(script.Parent.SheetType);
local v25 = require(l_script_FirstAncestor_0.Components.CloseAffordance);
local v26 = require(l_script_FirstAncestor_0.Components.Image);
local v27 = require(l_script_FirstAncestor_0.Components.View);
local v28 = {
    size = v16.Medium, 
    testId = "--foundation-sheet"
};
local l_SHADOW_IMAGE_0 = v15.SHADOW_IMAGE;
local l_SHADOW_SIZE_0 = v15.SHADOW_SIZE;
return v4.memo(v4.forwardRef(function(v31, v32) --[[ Line: 50 ]] --[[ Name: CenterSheet ]]
    -- upvalues: v13 (copy), v28 (copy), v10 (copy), v12 (copy), v18 (copy), v17 (copy), v20 (copy), v21 (copy), v11 (copy), l_DIALOG_SIZES_0 (copy), v4 (copy), l_useAnimatedBinding_0 (copy), v3 (copy), v2 (copy), v24 (copy), v27 (copy), v9 (copy), v23 (copy), v22 (copy), l_ElevationOwnerScope_0 (copy), v25 (copy), v8 (copy), v26 (copy), l_SHADOW_IMAGE_0 (copy), l_SHADOW_SIZE_0 (copy), v6 (copy)
    local v33 = v13(v31, v28);
    local v34 = v10();
    local v35 = v12();
    local v36 = v18(v17.Sheet, {
        stackAboveOwner = false
    });
    local v37 = false;
    if v20.FoundationSheetReducedMotion then
        v37 = v21().reducedMotion;
    end;
    local v38 = v11(l_DIALOG_SIZES_0[v33.size]);
    local v39 = v11(600);
    local l_Size_800_0 = v35.Size.Size_800;
    local v41 = nil;
    local v42 = nil;
    if v20.FoundationAddHeightPropToCenterSheet then
        local v43, v44 = v4.useBinding(v39);
        v41 = v43;
        v42 = v44;
    end;
    local v46 = if v20.FoundationAddHeightPropToCenterSheet and v41 then v41:map(function(v45) --[[ Line: 73 ]]
        -- upvalues: v33 (copy)
        if v33.centerSheetHeight then
            if v33.centerSheetHeight > 0 and v33.centerSheetHeight <= 1 then
                return v45 * v33.centerSheetHeight;
            elseif v33.centerSheetHeight > 1 then
                return (math.min(v33.centerSheetHeight, v45));
            end;
        end;
        return nil;
    end) else nil;
    local v47, v48 = v4.useState(true);
    local v49 = v4.useRef(false);
    local v50, v51 = l_useAnimatedBinding_0(1, function() --[[ Line: 88 ]]
        -- upvalues: v49 (copy), v33 (copy)
        if v49.current then
            v33.onClose();
        end;
    end);
    local v52, v53 = l_useAnimatedBinding_0(l_Size_800_0, function() --[[ Line: 94 ]]
        -- upvalues: v48 (copy)
        v48(false);
    end);
    local v54, v55 = v4.useBinding(false);
    local v56, v57 = v4.useBinding(false);
    local v58, v59 = v4.useBinding(0);
    local v60, v61 = v4.useBinding(0);
    local v62 = v4.useRef(nil);
    local v63, v64 = v4.useState(nil);
    local v66 = if v20.FoundationCenterSheetUseStableContainer then v4.useMemo(function() --[[ Line: 110 ]]
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.BackgroundTransparency = 1;
        l_Frame_0.BorderSizePixel = 0;
        l_Frame_0.AutomaticSize = Enum.AutomaticSize.XY;
        return l_Frame_0;
    end, {}) else nil;
    if v20.FoundationCenterSheetUseStableContainer then
        v4.useEffect(function() --[[ Line: 120 ]]
            -- upvalues: v66 (copy)
            return function() --[[ Line: 121 ]]
                -- upvalues: v66 (ref)
                v66:Destroy();
            end;
        end, {});
    end;
    local v68 = if v20.FoundationCenterSheetUseStableContainer then v4.useCallback(function(v67) --[[ Line: 129 ]]
        -- upvalues: v66 (copy)
        if v67 then
            v66.Parent = v67;
            return;
        else
            v66.Parent = nil;
            return;
        end;
    end, {}) else nil;
    v4.useEffect(function() --[[ Line: 141 ]]
        -- upvalues: v20 (ref), v37 (ref), v53 (copy), v3 (ref), v51 (copy), v35 (copy)
        if v20.FoundationSheetReducedMotion and v37 then
            v53((v3.instant(0)));
            v51((v3.instant(0)));
            return;
        else
            v53(v3.ease(0, {
                easingStyle = v35.Ease.StandardOut, 
                duration = v35.Time.Time_300
            }));
            v51(v3.ease(0, {
                duration = v35.Time.Time_100
            }));
            return;
        end;
    end, {});
    local v69 = v4.useCallback(function() --[[ Line: 157 ]]
        -- upvalues: v49 (copy), v20 (ref), v37 (ref), v53 (copy), v3 (ref), l_Size_800_0 (copy), v51 (copy), v35 (copy), v48 (copy)
        if v49.current then
            return;
        elseif v20.FoundationSheetReducedMotion and v37 then
            v49.current = true;
            v53(v3.instant(l_Size_800_0));
            v51(v3.instant(1));
            return;
        else
            v53(v3.ease(l_Size_800_0, {
                easingStyle = v35.Ease.StandardIn, 
                duration = v35.Time.Time_100
            }));
            v51(v3.ease(1, {
                duration = v35.Time.Time_100
            }));
            v48(true);
            v49.current = true;
            return;
        end;
    end, {
        l_Size_800_0, 
        if v20.FoundationSheetReducedMotion then v37 else nil
    });
    v4.useImperativeHandle(v33.sheetRef, function() --[[ Line: 178 ]]
        -- upvalues: v69 (copy)
        return {
            close = v69
        };
    end, {});
    local v70 = v4.useMemo(function() --[[ Line: 184 ]]
        -- upvalues: v2 (ref), v54 (copy), v55 (copy), v46 (copy), v58 (copy), v59 (copy), v56 (copy), v57 (copy), v69 (copy), v24 (ref), v33 (copy), v62 (copy), v63 (copy), v64 (copy)
        return {
            actionsHeight = 0, 
            setActionsHeight = v2.noop, 
            hasActionsDivider = v54, 
            setHasActionsDivider = v55, 
            sheetContentHeight = v46, 
            setSheetContentHeight = v2.noop, 
            sheetHeightAvailable = 0, 
            setSheetHeightAvailable = v2.noop, 
            safeAreaPadding = 0, 
            bottomPadding = 0, 
            innerScrollingEnabled = true, 
            innerScrollY = v58, 
            setInnerScrollY = v59, 
            hasHeader = v56, 
            setHasHeader = v57, 
            closeSheet = v69, 
            sheetType = v24.Center, 
            testId = v33.testId, 
            closeAffordanceRef = v62, 
            contentStartRef = v63, 
            setContentStartRef = v64
        };
    end, {
        v33.testId, 
        v69, 
        v63, 
        v62, 
        v46
    });
    local v76 = v4.createElement(v27, {
        ClipsDescendants = true, 
        Size = if v20.FoundationAddHeightPropToCenterSheet and v33.centerSheetHeight and v46 then v46:map(function(v71) --[[ Line: 215 ]]
            if v71 then
                return (UDim2.new(1, 0, 0, v71));
            else
                return nil;
            end;
        end) else nil, 
        sizeConstraint = if v20.FoundationAddHeightPropToCenterSheet and v33.centerSheetHeight and v41 then {
            MaxSize = v41:map(function(v72) --[[ Line: 223 ]]
                return Vector2.new(1e999, v72);
            end)
        } else nil, 
        stateLayer = {
            affordance = v9.None
        }, 
        ZIndex = 2, 
        onActivated = v2.noop, 
        onAbsoluteSizeChanged = function(v73) --[[ Line: 234 ]] --[[ Name: onAbsoluteSizeChanged ]]
            -- upvalues: v61 (copy)
            v61(v73.AbsoluteSize.Y);
        end, 
        ref = v32, 
        selection = v23.nonSelectable, 
        selectionGroup = v23.isolatedSelectionGroup, 
        tag = if v20.FoundationAddHeightPropToCenterSheet then {
            ["bg-surface-100 stroke-default stroke-standard radius-large"] = true, 
            ["size-full-0 auto-y"] = v33.centerSheetHeight == nil
        } else "bg-surface-100 stroke-default stroke-standard radius-large size-full-0 auto-y", 
        testId = v33.testId
    }, {
        Content = v4.createElement(v27, {
            Size = if v20.FoundationAddHeightPropToCenterSheet and v33.centerSheetHeight and v46 then v46:map(function(v74) --[[ Line: 254 ]]
                if v74 then
                    return (UDim2.new(1, 0, 0, v74));
                else
                    return nil;
                end;
            end) else nil, 
            tag = "size-full-0 auto-y col items-center clip"
        }, v4.createElement(v22.Provider, {
            value = v70
        }, v4.createElement(l_ElevationOwnerScope_0, {
            owner = v36
        }, v33.children))), 
        CloseAffordance = v4.createElement(v25, {
            onActivated = v69, 
            ref = v62, 
            NextSelectionDown = v63, 
            variant = v8.Utility, 
            Position = UDim2.new(1, -v35.Margin.Small, 0, v35.Margin.Small), 
            AnchorPoint = Vector2.new(1, 0), 
            Visible = v56:map(function(v75) --[[ Line: 271 ]]
                return not v75;
            end), 
            testId = ("%*--close-affordance"):format(v33.testId)
        })
    });
    local v78 = v4.createElement(v26, {
        Image = l_SHADOW_IMAGE_0, 
        Size = v60:map(function(v77) --[[ Line: 280 ]]
            -- upvalues: l_SHADOW_SIZE_0 (ref)
            return UDim2.new(1, l_SHADOW_SIZE_0 * 2, 0, v77 + l_SHADOW_SIZE_0 * 2);
        end), 
        Position = UDim2.new(0, -l_SHADOW_SIZE_0, 0.5, 0), 
        ZIndex = 1, 
        slice = {
            center = Rect.new(l_SHADOW_SIZE_0, l_SHADOW_SIZE_0, l_SHADOW_SIZE_0 + 1, l_SHADOW_SIZE_0 + 1), 
            scale = 2
        }, 
        imageStyle = v35.Color.Extended.Black.Black_10, 
        tag = "anchor-center-left"
    });
    return v34 and v4.createElement(v4.Fragment, nil, {
        OverlayPortal = v6.createPortal(v4.createElement(v27, {
            ZIndex = v36.zIndex, 
            tag = "size-full", 
            testId = ("%*--surface"):format(v33.testId)
        }, {
            SheetContainer = v4.createElement(v27, {
                ref = v68, 
                ZIndex = 2, 
                sizeConstraint = {
                    MaxSize = Vector2.new(v38, v39)
                }, 
                Position = v52:map(function(v79) --[[ Line: 309 ]]
                    return UDim2.new(0.5, 0, 0.5, v79);
                end), 
                tag = "size-full col align-y-center padding-medium anchor-center-center", 
                testId = ("%*--center-sheet-container"):format(v33.testId), 
                GroupTransparency = if v47 then v52:map(function(v80) --[[ Line: 315 ]]
                    -- upvalues: l_Size_800_0 (copy)
                    return v80 / l_Size_800_0;
                end) else nil, 
                onAbsoluteSizeChanged = v20.FoundationAddHeightPropToCenterSheet and v33.centerSheetHeight and v42 and function(v81) --[[ Line: 322 ]]
                    -- upvalues: v35 (copy), v42 (ref), v39 (copy)
                    local v82 = v35.Margin.Medium * 2;
                    v42((math.min(v81.AbsoluteSize.Y - v82, v39)));
                end or nil
            }, if not v20.FoundationCenterSheetUseStableContainer then {
                Sheet = v76, 
                Shadow = v4.createElement("Folder", nil, v78)
            } else nil), 
            Backdrop = v4.createElement(v27, {
                Size = UDim2.fromScale(2, 2), 
                Position = UDim2.fromScale(-0.5, -0.5), 
                ZIndex = 1, 
                stateLayer = {
                    affordance = v9.None
                }, 
                backgroundStyle = v50:map(function(v83) --[[ Line: 342 ]]
                    -- upvalues: v35 (copy)
                    return {
                        Color3 = v35.Color.Common.Backdrop.Color3, 
                        Transparency = math.lerp(v35.Color.Common.Backdrop.Transparency, 1, v83)
                    };
                end), 
                onActivated = v69, 
                testId = ("%*--backdrop"):format(v33.testId)
            })
        }), v34), 
        SheetContent = if v20.FoundationCenterSheetUseStableContainer then v6.createPortal({
            Sheet = v76, 
            Shadow = v78
        }, v66) else nil
    });
end));