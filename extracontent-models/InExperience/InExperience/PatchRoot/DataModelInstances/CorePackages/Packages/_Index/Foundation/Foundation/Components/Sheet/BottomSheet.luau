local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.Otter);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.ReactOtter);
local v6 = require(l_Parent_0.ReactRoblox);
local v7 = require(l_Parent_0.ReactUtils);
local l_useAnimatedBinding_0 = v5.useAnimatedBinding;
local v9 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local v10 = require(l_script_FirstAncestor_0.Providers.Elevation.useElevation);
local v11 = require(l_script_FirstAncestor_0.Providers.Overlay.useOverlay);
local v12 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v13 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local l_ElevationOwnerScope_0 = require(l_script_FirstAncestor_0.Providers.Elevation.ElevationProvider).ElevationOwnerScope;
local v15 = require(l_script_FirstAncestor_0.Enums.ElevationLayer);
local v16 = require(l_script_FirstAncestor_0.Constants);
local v17 = require(script.Parent.SheetContext);
local v18 = require(script.Parent.Types);
local v19 = require(script.Parent.SheetType);
local v20 = require(script.Parent.useHardwareInsets);
local v21 = require(script.Parent.useScreenHeight);
local v22 = require(l_script_FirstAncestor_0.Utility.Flags);
local v23 = require(l_script_FirstAncestor_0.Components.Image);
local v24 = require(l_script_FirstAncestor_0.Components.View);
local v25 = require(l_script_FirstAncestor_0.Providers.Preferences.usePreferences);
local v26 = v22.FoundationBottomSheetImproveSpring and 1 or 0.9;
local v27 = {
    defaultSnapPointIndex = 1, 
    testId = "--foundation-sheet"
};
local l_SHADOW_IMAGE_0 = v16.SHADOW_IMAGE;
local l_SHADOW_SIZE_0 = v16.SHADOW_SIZE;
return v4.memo(v4.forwardRef(function(v30, v31) --[[ Line: 52 ]] --[[ Name: BottomSheet ]]
    -- upvalues: v13 (copy), v27 (copy), v11 (copy), v12 (copy), v10 (copy), v15 (copy), v22 (copy), v25 (copy), v21 (copy), v4 (copy), v20 (copy), l_useAnimatedBinding_0 (copy), v26 (copy), v3 (copy), v7 (copy), v19 (copy), v6 (copy), v24 (copy), v18 (copy), v9 (copy), v2 (copy), v17 (copy), l_ElevationOwnerScope_0 (copy), v23 (copy), l_SHADOW_IMAGE_0 (copy), l_SHADOW_SIZE_0 (copy)
    local v32 = v13(v30, v27);
    local v33 = v11();
    local v34 = v12();
    local v35 = v10(v15.Sheet, {
        stackAboveOwner = false
    });
    local v36 = false;
    if v22.FoundationSheetReducedMotion then
        v36 = v25().reducedMotion;
    end;
    local v37 = v21();
    local v38, v39 = v4.useState(0);
    local v40 = v4.useMemo(function() --[[ Line: 66 ]]
        -- upvalues: v38 (copy)
        return {
            v38
        };
    end, {
        v38
    });
    local v41 = v32.snapPoints or v40;
    local v43 = v4.useCallback(function(v42) --[[ Line: 73 ]]
        -- upvalues: v37 (copy)
        if v42 > 1 then
            return v42;
        else
            return v42 * v37;
        end;
    end, {
        v37
    });
    local v44 = 0;
    for _, v46 in v41 do
        local v47 = v43(v46);
        if v44 < v47 then
            v44 = v47;
        end;
    end;
    v44 = math.min(v44, v37);
    local l_bottom_0 = v20(v33).bottom;
    local v49 = v4.useRef(0);
    local v50 = v4.useRef(false);
    local v51, v52 = l_useAnimatedBinding_0(1, function() --[[ Line: 93 ]]
        -- upvalues: v50 (copy), v32 (copy)
        if v50.current then
            v32.onClose();
        end;
    end);
    local v53, v54 = v4.useBinding(-l_bottom_0);
    local v55, v56 = v4.useBinding(0);
    local v57, v58 = v4.useBinding(false);
    local v59, v60 = v4.useBinding(false);
    local v61 = v4.useRef(0);
    local v62 = v4.useRef(nil);
    local v63, v64 = v4.useBinding(0);
    local v65, v66 = v4.useBinding(false);
    local v67 = v4.useRef(false);
    local v68 = v4.useRef(0);
    local v69 = v4.useRef(nil);
    local v70 = v4.useRef(false);
    local v71 = v4.useRef(0);
    local v72 = v4.useCallback(function() --[[ Line: 114 ]]
        -- upvalues: v69 (copy), v68 (copy), v70 (copy)
        if v69.current then
            v69.current:Disconnect();
            v69.current = nil;
        end;
        v68.current = 0;
        v70.current = false;
    end, {});
    local v85 = v4.useCallback(function(v73) --[[ Line: 123 ]]
        -- upvalues: v72 (copy), v70 (copy), v22 (ref), v62 (copy), v69 (copy), v71 (copy), v26 (ref)
        v72();
        v70.current = true;
        if v22.FoundationBottomSheetImproveSpring and v62.current then
            v62.current:ResetScrollVelocity();
        end;
        local v74 = if v62.current then v62.current.CanvasPosition.Y else 0;
        v69.current = game:GetService("RunService").Heartbeat:Connect(function(v75) --[[ Line: 135 ]]
            -- upvalues: v62 (ref), v70 (ref), v72 (ref), v73 (copy), v22 (ref), v74 (ref), v71 (ref), v26 (ref)
            if not v62.current or not v70.current then
                v72();
                return;
            else
                local l_Y_0 = v62.current.CanvasPosition.Y;
                local v77 = v73 - l_Y_0;
                local v78 = if v22.FoundationBottomSheetImproveSpring then v77 * 25.132741228718345 * 25.132741228718345 else v77 * 18 * 18;
                if not v22.FoundationBottomSheetImproveSpring then
                    local v79 = (l_Y_0 - v74) / v75;
                    local l_v71_0 = v71;
                    l_v71_0.current = l_v71_0.current - v79;
                end;
                local v81 = v78 + if v22.FoundationBottomSheetImproveSpring then -v71.current * 2 * v26 * 25.132741228718345 else -v71.current * 2 * v26 * 18;
                local v82 = math.min(v75, 0.03333333333333333);
                v71.current = v71.current + v81 * v82;
                local v83 = l_Y_0 + v71.current * v82;
                v62.current.CanvasPosition = Vector2.new(0, v83);
                v74 = v62.current.CanvasPosition.Y;
                local v84 = false;
                if math.abs(v77) < 0.5 then
                    v84 = math.abs(v71.current) < 1;
                end;
                if v84 then
                    v62.current.CanvasPosition = Vector2.new(0, v73);
                    v72();
                end;
                return;
            end;
        end);
    end, {
        v72
    });
    local v87 = v4.useCallback(function(v86) --[[ Line: 177 ]]
        -- upvalues: v43 (copy), l_bottom_0 (copy)
        return v43(v86) + l_bottom_0;
    end, {
        l_bottom_0, 
        v43
    });
    local v89 = v4.useCallback(function(v88) --[[ Line: 181 ]]
        -- upvalues: v49 (copy), v85 (copy), v87 (copy), v41 (copy)
        v49.current = v88;
        v85(v87(v41[v88]));
    end, {
        v87, 
        v41
    });
    local v91 = if v22.FoundationSheetReducedMotion then v4.useCallback(function(v90) --[[ Line: 187 ]]
        -- upvalues: v72 (copy), v49 (copy), v62 (copy), v87 (copy), v41 (copy)
        v72();
        v49.current = v90;
        if v62.current then
            v62.current.CanvasPosition = Vector2.new(0, v87(v41[v90]));
        end;
    end, {
        v72, 
        v87, 
        v41
    }) else nil;
    local v93 = v4.useCallback(function(v92) --[[ Line: 197 ]]
        -- upvalues: v50 (copy), v22 (ref), v36 (ref), v72 (copy), v62 (copy), v52 (copy), v3 (ref), v71 (copy), v68 (copy), v85 (copy), v34 (copy)
        if v50.current then
            return;
        elseif v22.FoundationSheetReducedMotion and v36 and not v92 then
            v50.current = true;
            v72();
            if v62.current then
                v62.current.CanvasPosition = Vector2.new(0, 0);
            end;
            v52((v3.instant(1)));
            return;
        else
            v71.current = -v68.current;
            v85(0);
            v52(v3.ease(1, {
                duration = v34.Time.Time_100
            }));
            v50.current = true;
            return;
        end;
    end, if v22.FoundationSheetReducedMotion then {
        v85, 
        v72, 
        v36
    } else {
        v85
    });
    local v96 = v4.useCallback(function() --[[ Line: 222 ]]
        -- upvalues: v63 (copy), v61 (copy), v22 (ref), v44 (ref), l_bottom_0 (copy), v68 (copy), v67 (copy), v66 (copy)
        local v94 = v63:getValue() <= 0;
        local v95 = v61.current >= if v22.FoundationBottomSheetImproveSpring then math.floor(v44 + l_bottom_0) else math.round(v44 + l_bottom_0);
        if v68.current > 0 and v94 and v67.current then
            v66(false);
            return;
        else
            if (v68.current < 0 or v22.FoundationBottomSheetImproveSpring and v68.current == 0) and v95 then
                v66(true);
            end;
            return;
        end;
    end, {
        v44, 
        l_bottom_0
    });
    local v105 = v4.useCallback(function() --[[ Line: 239 ]]
        -- upvalues: v68 (copy), v61 (copy), v41 (copy), v87 (copy), v67 (copy), v71 (copy), v22 (ref), v93 (copy), v89 (copy)
        local l_current_0 = v68.current;
        local v98 = v61.current - l_current_0 / 2.35;
        local v99 = {
            {
                index = 0, 
                position = 0
            }
        };
        for v100, v101 in v41 do
            table.insert(v99, {
                index = v100, 
                position = v87(v101)
            });
        end;
        table.sort(v99, function(v102, v103) --[[ Line: 257 ]]
            -- upvalues: v98 (copy)
            return math.abs(v102.position - v98) < math.abs(v103.position - v98);
        end);
        local v104 = v99[1];
        if not v67.current then
            v71.current = -l_current_0;
            if v104.index == 0 then
                if v22.FoundationSheetReducedMotion then
                    v93(true);
                    return;
                else
                    v93();
                    return;
                end;
            else
                v89(v104.index);
            end;
        end;
    end, {
        v41, 
        v89, 
        v87, 
        v93
    });
    v4.useEffect(function() --[[ Line: 277 ]]
        -- upvalues: v33 (copy), v22 (ref), v36 (ref), v91 (copy), v32 (copy), v52 (copy), v3 (ref), v89 (copy), v34 (copy), v43 (copy), v41 (copy), v44 (ref), v66 (copy), v72 (copy)
        if v33 then
            if v22.FoundationSheetReducedMotion and v36 then
                v91(v32.defaultSnapPointIndex);
                v52(v3.instant(0));
            else
                v89(v32.defaultSnapPointIndex);
                v52(v3.ease(0, {
                    duration = v34.Time.Time_100
                }));
            end;
            if v43(v41[v32.defaultSnapPointIndex]) == v44 then
                v66(true);
            end;
        end;
        return function() --[[ Line: 295 ]]
            -- upvalues: v72 (ref)
            v72();
        end;
    end, if v22.FoundationSheetReducedMotion then {
        v33, 
        v41, 
        v32.defaultSnapPointIndex, 
        v89, 
        v43, 
        v91, 
        v36
    } else {
        v33, 
        v41, 
        v32.defaultSnapPointIndex, 
        v89, 
        v43
    });
    v4.useEffect(function() --[[ Line: 321 ]]
        -- upvalues: v68 (copy), v96 (copy), v67 (copy), v72 (copy), v22 (ref), v62 (copy), v61 (copy), v44 (ref), l_bottom_0 (copy), v50 (copy), v66 (copy), v65 (copy), v105 (copy)
        local v110 = game:GetService("UserInputService").TouchPan:Connect(function(_, _, v108, _) --[[ Line: 322 ]]
            -- upvalues: v68 (ref), v96 (ref)
            v68.current = v108.Y;
            v96();
        end);
        local v111 = game:GetService("UserInputService").InputBegan:Connect(function() --[[ Line: 326 ]]
            -- upvalues: v67 (ref), v68 (ref), v72 (ref)
            v67.current = true;
            v68.current = 0;
            v72();
        end);
        local v116 = game:GetService("UserInputService").InputEnded:Connect(function() --[[ Line: 331 ]]
            -- upvalues: v67 (ref), v22 (ref), v62 (ref), v68 (ref), v61 (ref), v44 (ref), l_bottom_0 (ref), v50 (ref), v66 (ref), v65 (ref), v105 (ref)
            if v67.current == false then
                return;
            else
                v67.current = false;
                if v22.FoundationBottomSheetImproveSpring then
                    v68.current = if v62.current then v62.current:GetScrollVelocity().Y else 0;
                    local v112 = true;
                    if v61.current < math.floor(v44 + l_bottom_0) then
                        v112 = v50.current;
                    end;
                    if v112 then
                        v66(true);
                        return;
                    end;
                elseif v22.FoundationSheetFixClosingSwipe then
                    local v113 = nil;
                    if v62.current then
                        local l_status_0, l_result_0 = pcall(function() --[[ Line: 356 ]]
                            -- upvalues: v62 (ref)
                            return v62.current:GetScrollVelocity().Y == 0;
                        end);
                        if l_status_0 then
                            v113 = l_result_0;
                        end;
                    end;
                    if v113 or v50.current then
                        v66(true);
                        return;
                    end;
                elseif v65:getValue() and v61.current >= math.round(v44 + l_bottom_0) or v50.current then
                    return;
                end;
                v105();
                return;
            end;
        end);
        return function() --[[ Line: 387 ]]
            -- upvalues: v110 (copy), v111 (copy), v116 (copy)
            v110:Disconnect();
            v111:Disconnect();
            v116:Disconnect();
        end;
    end, {
        v33, 
        v105, 
        v96, 
        v72
    });
    local v117 = v4.useRef(nil);
    local v118, v119 = v4.useState(nil);
    local v120, v121 = v4.useState(nil);
    local v122 = v7.useComposedRef(v31, v121);
    v4.useImperativeHandle(v32.sheetRef, function() --[[ Line: 400 ]]
        -- upvalues: v93 (copy)
        return {
            close = v93
        };
    end, {});
    local v124 = v4.useMemo(function() --[[ Line: 407 ]]
        -- upvalues: v55 (copy), v56 (copy), v57 (copy), v58 (copy), v53 (copy), v54 (copy), l_bottom_0 (copy), v65 (copy), v63 (copy), v64 (copy), v96 (copy), v59 (copy), v60 (copy), v93 (copy), v19 (ref), v120 (copy), v32 (copy), v117 (copy), v118 (copy), v119 (copy)
        return {
            actionsHeight = v55, 
            setActionsHeight = v56, 
            hasActionsDivider = v57, 
            setHasActionsDivider = v58, 
            sheetHeightAvailable = v53, 
            setSheetHeightAvailable = v54, 
            safeAreaPadding = l_bottom_0, 
            bottomPadding = 200, 
            innerScrollingEnabled = v65, 
            innerScrollY = v63, 
            setInnerScrollY = function(v123) --[[ Line: 419 ]] --[[ Name: setInnerScrollY ]]
                -- upvalues: v64 (ref), v96 (ref)
                v64(v123);
                v96();
            end, 
            hasHeader = v59, 
            setHasHeader = v60, 
            closeSheet = v93, 
            sheetType = v19.Bottom, 
            innerSurface = v120, 
            testId = v32.testId, 
            closeAffordanceRef = v117, 
            contentStartRef = v118, 
            setContentStartRef = v119
        };
    end, {
        v32.testId, 
        v93, 
        l_bottom_0, 
        v96, 
        v120, 
        v117, 
        v118
    });
    return v33 and v6.createPortal(v4.createElement(v24, {
        ZIndex = v35.zIndex, 
        ref = v122, 
        selection = v18.nonSelectable, 
        selectionGroup = v18.isolatedSelectionGroup, 
        tag = "size-full", 
        testId = ("%*--surface"):format(v32.testId)
    }, v4.createElement("ScrollingFrame", {
        Size = UDim2.fromScale(1, 1), 
        CanvasSize = if v22.FoundationSheetPreventCloseOnResize then UDim2.new(1, 0, 1, v44 + l_bottom_0) else UDim2.new(1, 0, 0, v37 + v44 + l_bottom_0), 
        ClipsDescendants = false, 
        BackgroundTransparency = 1, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        ScrollBarThickness = 0, 
        ref = v62, 
        [v4.Change.CanvasPosition] = function(v125) --[[ Line: 467 ]]
            -- upvalues: v61 (copy), v54 (copy), l_bottom_0 (copy), v34 (copy), v96 (copy), v93 (copy)
            v61.current = v125.CanvasPosition.Y;
            v54(v61.current - l_bottom_0 - v34.Margin.Small);
            v96();
            if v61.current <= 0 then
                v93();
            end;
        end
    }, {
        SheetContainer = v4.createElement(v24, {
            Size = if v22.FoundationSheetPreventCloseOnResize then UDim2.new(1, 0, 1, 200 - v44 - l_bottom_0) else UDim2.new(1, 0, 0, v37 + 200), 
            Position = if v22.FoundationSheetPreventCloseOnResize then UDim2.new(0, 0, 1, -v44) else UDim2.fromOffset(0, v37 + l_bottom_0), 
            ZIndex = 3
        }, {
            Sheet = v4.createElement(v24, {
                Size = if v32.snapPoints == nil then UDim2.fromScale(1, 0) else UDim2.new(1, 0, 0, v44 + 200), 
                AutomaticSize = if v32.snapPoints == nil then Enum.AutomaticSize.Y else nil, 
                onAbsoluteSizeChanged = v32.snapPoints == nil and function(v126) --[[ Line: 491 ]]
                    -- upvalues: v39 (copy)
                    v39(v126.AbsoluteSize.Y - 200);
                end or nil, 
                stateLayer = {
                    affordance = v9.None
                }, 
                onActivated = v2.noop, 
                testId = v32.testId, 
                tag = "bg-surface-100 radius-large col items-center clip padding-top-small"
            }, {
                Gripper = v4.createElement(v24, {
                    ZIndex = 3, 
                    backgroundStyle = v34.Color.Content.Muted, 
                    tag = "padding-y-small size-1000-100 radius-small align-y-center", 
                    testId = ("%*--gripper"):format(v32.testId)
                }, {
                    TouchTarget = v4.createElement(v24, {
                        tag = "size-1000-600", 
                        stateLayer = {
                            affordance = v9.None
                        }, 
                        onActivated = function() --[[ Line: 514 ]] --[[ Name: onActivated ]]
                            -- upvalues: v67 (copy), v41 (copy), v49 (copy), v22 (ref), v36 (ref), v91 (copy), v89 (copy), v43 (copy), v44 (ref), v66 (copy), v93 (copy)
                            v67.current = false;
                            if #v41 > 1 then
                                local v127 = v49.current % #v41 + 1;
                                if v22.FoundationSheetReducedMotion and v36 then
                                    v91(v127);
                                else
                                    v89(v127);
                                end;
                                if v22.FoundationSheetFixClosingSwipe and v43(v41[v127]) == v44 then
                                    v66(true);
                                    return;
                                end;
                            else
                                v93();
                            end;
                        end
                    })
                }), 
                Content = v4.createElement(v17.Provider, {
                    value = v124
                }, v4.createElement(l_ElevationOwnerScope_0, {
                    owner = v35
                }, v32.children))
            })
        }), 
        Shadow = v4.createElement(v23, {
            Image = l_SHADOW_IMAGE_0, 
            Size = UDim2.new(1, l_SHADOW_SIZE_0 * 2, 0, v44 + 200 + l_SHADOW_SIZE_0 * 2), 
            Position = if v22.FoundationSheetPreventCloseOnResize then UDim2.new(-l_SHADOW_SIZE_0, 0, 1, -v44 - l_SHADOW_SIZE_0) else UDim2.fromOffset(-l_SHADOW_SIZE_0, v37 + l_bottom_0 - l_SHADOW_SIZE_0), 
            ZIndex = 2, 
            slice = {
                center = Rect.new(l_SHADOW_SIZE_0, l_SHADOW_SIZE_0, l_SHADOW_SIZE_0 + 1, l_SHADOW_SIZE_0 + 1), 
                scale = 2
            }, 
            imageStyle = v34.Color.Extended.Black.Black_10
        }), 
        Backdrop = v4.createElement(v24, {
            Size = UDim2.fromScale(1, 2), 
            Position = UDim2.fromScale(0, -0.5), 
            ZIndex = 1, 
            stateLayer = {
                affordance = v9.None
            }, 
            backgroundStyle = v51:map(function(v128) --[[ Line: 562 ]]
                -- upvalues: v34 (copy)
                return {
                    Color3 = v34.Color.Common.Backdrop.Color3, 
                    Transparency = math.lerp(v34.Color.Common.Backdrop.Transparency, 1, v128)
                };
            end), 
            onActivated = v22.FoundationSheetReducedMotion and function() --[[ Line: 569 ]]
                -- upvalues: v93 (copy)
                v93();
            end or v93, 
            testId = ("%*--backdrop"):format(v32.testId)
        })
    })), v33);
end));