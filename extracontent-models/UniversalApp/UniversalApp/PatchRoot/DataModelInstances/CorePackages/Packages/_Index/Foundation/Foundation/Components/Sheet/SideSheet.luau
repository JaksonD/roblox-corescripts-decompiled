local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.Otter);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.ReactOtter);
local v6 = require(l_Parent_0.ReactRoblox);
local l_useAnimatedBinding_0 = v5.useAnimatedBinding;
local v8 = require(l_script_FirstAncestor_0.Enums.CloseAffordanceVariant);
local v9 = require(l_script_FirstAncestor_0.Constants);
local v10 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local v11 = require(l_script_FirstAncestor_0.Providers.Overlay.useOverlay);
local v12 = require(l_script_FirstAncestor_0.Utility.useScaledValue);
local v13 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v14 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v15 = require(script.Parent.SheetContext);
local v16 = require(script.Parent.Types);
local v17 = require(script.Parent.SheetType);
local v18 = require(l_script_FirstAncestor_0.Providers.Elevation.useElevation);
local l_ElevationOwnerScope_0 = require(l_script_FirstAncestor_0.Providers.Elevation.ElevationProvider).ElevationOwnerScope;
local v20 = require(l_script_FirstAncestor_0.Enums.ElevationLayer);
local v21 = require(l_script_FirstAncestor_0.Enums.DialogSize);
local v22 = require(script.Parent.useHardwareInsets);
local v23 = require(script.Parent.useScreenSize);
local v24 = require(l_script_FirstAncestor_0.Components.CloseAffordance);
local v25 = require(l_script_FirstAncestor_0.Utility.Flags);
local v26 = require(l_script_FirstAncestor_0.Components.Image);
local v27 = require(l_script_FirstAncestor_0.Components.View);
local v28 = require(l_script_FirstAncestor_0.Providers.Preferences.usePreferences);
local v29 = {
    [v21.Medium] = {
        TARGET_WIDTH = 0.4, 
        MIN = 360, 
        MAX = 440
    }, 
    [v21.Large] = {
        TARGET_WIDTH = 0.5, 
        MIN = 440, 
        MAX = 640
    }
};
local v30 = {
    testId = "--foundation-sheet", 
    size = if v25.FoundationSideSheetNewWidthCalculation then v21.Medium else nil
};
local l_SHADOW_IMAGE_0 = v9.SHADOW_IMAGE;
local l_SHADOW_SIZE_0 = v9.SHADOW_SIZE;
return v4.memo(v4.forwardRef(function(v33, v34) --[[ Line: 68 ]] --[[ Name: SideSheet ]]
    -- upvalues: v14 (copy), v30 (copy), v11 (copy), v13 (copy), v18 (copy), v20 (copy), v25 (copy), v28 (copy), v22 (copy), v23 (copy), v29 (copy), v12 (copy), v4 (copy), l_useAnimatedBinding_0 (copy), v3 (copy), v2 (copy), v17 (copy), v6 (copy), v27 (copy), v10 (copy), v16 (copy), v15 (copy), l_ElevationOwnerScope_0 (copy), v24 (copy), v8 (copy), v26 (copy), l_SHADOW_IMAGE_0 (copy), l_SHADOW_SIZE_0 (copy)
    local v35 = v14(v33, v30);
    local v36 = v11();
    local v37 = v13();
    local v38 = v18(v20.Sheet, {
        stackAboveOwner = false
    });
    local v39 = false;
    if v25.FoundationSheetReducedMotion then
        v39 = v28().reducedMotion;
    end;
    local v40 = v22(v36);
    local v41 = if v25.FoundationSideSheetNewWidthCalculation then v23() else nil;
    local l_right_0 = v40.right;
    local v43 = v35.displaySize == Enum.DisplaySize.Small;
    local v44 = nil;
    local v45 = nil;
    local v46 = nil;
    if v25.FoundationSideSheetNewWidthCalculation then
        local l_Scale_0 = v37.Config.UI.Scale;
        v44 = v29[v35.size].TARGET_WIDTH;
        v45 = v29[v35.size].MIN * l_Scale_0;
        v46 = v29[v35.size].MAX * l_Scale_0;
    end;
    local v48 = if v25.FoundationSideSheetNewWidthCalculation then math.clamp(v41.X * v44, v45, v46) else v12(v43 and 400 or 360);
    local l_Medium_0 = v37.Padding.Medium;
    local v50 = v4.useRef(false);
    local v51, v52 = l_useAnimatedBinding_0(1, function() --[[ Line: 101 ]]
        -- upvalues: v50 (copy), v35 (copy)
        if v50.current then
            v35.onClose();
        end;
    end);
    local v53 = -(l_right_0 + (v43 and 0 or l_Medium_0));
    local v54, v55 = l_useAnimatedBinding_0(v53);
    local v56, v57 = v4.useBinding(false);
    local v58, v59 = v4.useBinding(false);
    local v60, v61 = v4.useBinding(0);
    local v62 = v4.useRef(nil);
    local v63, v64 = v4.useState(nil);
    v4.useEffect(function() --[[ Line: 119 ]]
        -- upvalues: v25 (ref), v39 (ref), v55 (copy), v3 (ref), v48 (copy), v52 (copy), v37 (copy)
        if v25.FoundationSheetReducedMotion and v39 then
            v55((v3.instant(v48)));
            v52((v3.instant(0)));
            return;
        else
            v55(v3.ease(v48, {
                easingStyle = v37.Ease.StandardOut, 
                duration = v37.Time.Time_300
            }));
            v52(v3.ease(0, {
                duration = v37.Time.Time_100
            }));
            return;
        end;
    end, {
        v48, 
        if v25.FoundationSheetReducedMotion then v39 else nil
    });
    local v65 = v4.useCallback(function() --[[ Line: 135 ]]
        -- upvalues: v50 (copy), v25 (ref), v39 (ref), v55 (copy), v3 (ref), v53 (copy), v52 (copy), v37 (copy)
        if v50.current then
            return;
        elseif v25.FoundationSheetReducedMotion and v39 then
            v50.current = true;
            v55(v3.instant(v53));
            v52(v3.instant(1));
            return;
        else
            v55(v3.ease(v53, {
                easingStyle = v37.Ease.StandardIn, 
                duration = v37.Time.Time_100
            }));
            v52(v3.ease(1, {
                duration = v37.Time.Time_100
            }));
            v50.current = true;
            return;
        end;
    end, {
        v53, 
        if v25.FoundationSheetReducedMotion then v39 else nil
    });
    v4.useImperativeHandle(v35.sheetRef, function() --[[ Line: 155 ]]
        -- upvalues: v65 (copy)
        return {
            close = v65
        };
    end, {});
    local v66 = UDim2.new(0, v48 + if v43 then l_right_0 else 0, 1, v43 and 0 or -l_Medium_0 * 2);
    local v68 = v54:map(function(v67) --[[ Line: 168 ]]
        -- upvalues: v43 (copy), l_Medium_0 (copy)
        return UDim2.new(1, if v43 then -v67 else -(v67 + l_Medium_0), 0, v43 and 0 or l_Medium_0);
    end);
    local v69 = v4.useMemo(function() --[[ Line: 177 ]]
        -- upvalues: v2 (ref), v56 (copy), v57 (copy), v60 (copy), v61 (copy), v58 (copy), v59 (copy), v65 (copy), v17 (ref), v35 (copy), v62 (copy), v63 (copy), v64 (copy)
        return {
            actionsHeight = 0, 
            setActionsHeight = v2.noop, 
            hasActionsDivider = v56, 
            setHasActionsDivider = v57, 
            sheetHeightAvailable = 0, 
            setSheetHeightAvailable = v2.noop, 
            safeAreaPadding = 0, 
            bottomPadding = 0, 
            innerScrollingEnabled = true, 
            innerScrollY = v60, 
            setInnerScrollY = v61, 
            hasHeader = v58, 
            setHasHeader = v59, 
            closeSheet = v65, 
            sheetType = v17.Side, 
            testId = v35.testId, 
            closeAffordanceRef = v62, 
            contentStartRef = v63, 
            setContentStartRef = v64
        };
    end, {
        v35.testId, 
        v65, 
        v63, 
        v62
    });
    return v36 and v6.createPortal(v4.createElement(v27, {
        ZIndex = v38.zIndex, 
        tag = "size-full", 
        testId = ("%*--surface"):format(v35.testId)
    }, {
        Sheet = v4.createElement(v27, {
            Size = v66, 
            Position = v68, 
            ClipsDescendants = true, 
            ZIndex = 3, 
            padding = if v43 and l_right_0 > 0 then {
                right = UDim.new(0, l_right_0)
            } else nil, 
            stateLayer = {
                affordance = v10.None
            }, 
            onActivated = v2.noop, 
            ref = v34, 
            selection = v16.nonSelectable, 
            selectionGroup = v16.isolatedSelectionGroup, 
            tag = {
                ["bg-surface-100 stroke-default stroke-standard"] = true, 
                ["radius-large"] = not v43
            }, 
            testId = v35.testId
        }, {
            Content = v4.createElement(v27, {
                tag = "size-full-full col items-center clip"
            }, v4.createElement(v15.Provider, {
                value = v69
            }, v4.createElement(l_ElevationOwnerScope_0, {
                owner = v38
            }, v35.children))), 
            CloseAffordance = v4.createElement(v24, {
                onActivated = v65, 
                ref = v62, 
                NextSelectionDown = v63, 
                variant = v8.Utility, 
                Position = UDim2.new(1, -v37.Margin.Small, 0, v37.Margin.Small), 
                AnchorPoint = Vector2.new(1, 0), 
                Visible = v58:map(function(v70) --[[ Line: 248 ]]
                    return not v70;
                end), 
                testId = ("%*--close-affordance"):format(v35.testId)
            })
        }), 
        Shadow = v4.createElement(v26, {
            Image = l_SHADOW_IMAGE_0, 
            Size = v66 + UDim2.fromOffset(l_SHADOW_SIZE_0 * 2, l_SHADOW_SIZE_0 * 2), 
            Position = v68:map(function(v71) --[[ Line: 257 ]]
                -- upvalues: l_SHADOW_SIZE_0 (ref)
                return v71 + UDim2.fromOffset(-l_SHADOW_SIZE_0, -l_SHADOW_SIZE_0);
            end), 
            ZIndex = 2, 
            slice = {
                center = Rect.new(l_SHADOW_SIZE_0, l_SHADOW_SIZE_0, l_SHADOW_SIZE_0 + 1, l_SHADOW_SIZE_0 + 1), 
                scale = 2
            }, 
            imageStyle = v37.Color.Extended.Black.Black_10
        }), 
        Backdrop = v4.createElement(v27, {
            Size = UDim2.fromScale(2, 2), 
            Position = UDim2.fromScale(-0.5, -0.5), 
            ZIndex = 1, 
            stateLayer = {
                affordance = v10.None
            }, 
            backgroundStyle = v51:map(function(v72) --[[ Line: 274 ]]
                -- upvalues: v37 (copy)
                return {
                    Color3 = v37.Color.Common.Backdrop.Color3, 
                    Transparency = math.lerp(v37.Color.Common.Backdrop.Transparency, 1, v72)
                };
            end), 
            onActivated = v65, 
            testId = ("%*--backdrop"):format(v35.testId)
        })
    }), v36);
end));