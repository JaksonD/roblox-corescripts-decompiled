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
local v26 = {
    defaultSnapPointIndex = 1, 
    testId = "--foundation-sheet"
};
local l_SHADOW_IMAGE_0 = v16.SHADOW_IMAGE;
local l_SHADOW_SIZE_0 = v16.SHADOW_SIZE;
local function _(v29, v30, v31, v32) --[[ Line: 59 ]] --[[ Name: advanceCriticalDampedSpring ]]
    local v33 = v29 - v31;
    local v34 = 25.132741228718345 * v32;
    local v35 = math.exp(-v34);
    local v36 = v30 + 25.132741228718345 * v33;
    local v37 = (v33 + v36 * v32) * v35;
    local v38 = (v30 - v36 * v34) * v35;
    return v31 + v37, v38;
end;
return v4.memo(v4.forwardRef(function(v40, v41) --[[ Line: 76 ]] --[[ Name: BottomSheet ]]
    -- upvalues: v13 (copy), v26 (copy), v11 (copy), v12 (copy), v10 (copy), v15 (copy), v22 (copy), v25 (copy), v21 (copy), v4 (copy), v20 (copy), l_useAnimatedBinding_0 (copy), v3 (copy), v7 (copy), v19 (copy), v6 (copy), v24 (copy), v18 (copy), v9 (copy), v2 (copy), v17 (copy), l_ElevationOwnerScope_0 (copy), v23 (copy), l_SHADOW_IMAGE_0 (copy), l_SHADOW_SIZE_0 (copy)
    local v42 = v13(v40, v26);
    local v43 = v11();
    local v44 = v12();
    local v45 = v10(v15.Sheet, {
        stackAboveOwner = false
    });
    local v46 = false;
    if v22.FoundationSheetReducedMotion then
        v46 = v25().reducedMotion;
    end;
    local v47 = v21();
    local v48, v49 = v4.useState(0);
    local v50 = v4.useMemo(function() --[[ Line: 90 ]]
        -- upvalues: v48 (copy)
        return {
            v48
        };
    end, {
        v48
    });
    local v51 = v42.snapPoints or v50;
    local v53 = v4.useCallback(function(v52) --[[ Line: 97 ]]
        -- upvalues: v47 (copy)
        if v52 > 1 then
            return v52;
        else
            return v52 * v47;
        end;
    end, {
        v47
    });
    local v54 = 0;
    for _, v56 in v51 do
        local v57 = v53(v56);
        if v54 < v57 then
            v54 = v57;
        end;
    end;
    v54 = math.min(v54, v47);
    local l_bottom_0 = v20(v43).bottom;
    local v59 = v4.useRef(0);
    local v60 = v4.useRef(false);
    local v61, v62 = l_useAnimatedBinding_0(1, function() --[[ Line: 117 ]]
        -- upvalues: v60 (copy), v42 (copy)
        if v60.current then
            v42.onClose();
        end;
    end);
    local v63, v64 = v4.useBinding(-l_bottom_0);
    local v65, v66 = v4.useBinding(0);
    local v67, v68 = v4.useBinding(false);
    local v69, v70 = v4.useBinding(false);
    local v71 = v4.useRef(0);
    local v72 = v4.useRef(nil);
    local v73, v74 = v4.useBinding(0);
    local v75, v76 = v4.useBinding(false);
    local v77 = v4.useRef(false);
    local v78 = v4.useRef(0);
    local v79 = v4.useRef(nil);
    local v80 = v4.useRef(false);
    local v81 = v4.useRef(0);
    local v82 = v4.useCallback(function() --[[ Line: 138 ]]
        -- upvalues: v79 (copy), v78 (copy), v80 (copy)
        if v79.current then
            v79.current:Disconnect();
            v79.current = nil;
        end;
        v78.current = 0;
        v80.current = false;
    end, {});
    local v104 = v4.useCallback(function(v83) --[[ Line: 147 ]]
        -- upvalues: v82 (copy), v80 (copy), v22 (ref), v72 (copy), v79 (copy), v81 (copy)
        v82();
        v80.current = true;
        if v22.FoundationBottomSheetImproveSpring and v72.current then
            v72.current:ResetScrollVelocity();
        end;
        local v84 = if v72.current then v72.current.CanvasPosition.Y else 0;
        v79.current = game:GetService("RunService").Heartbeat:Connect(function(v85) --[[ Line: 159 ]]
            -- upvalues: v72 (ref), v80 (ref), v82 (ref), v22 (ref), v81 (ref), v83 (copy), v84 (ref)
            if not v72.current or not v80.current then
                v82();
                return;
            else
                local l_Y_0 = v72.current.CanvasPosition.Y;
                local v87 = nil;
                if v22.FoundationBottomSheetImproveSpring then
                    local l_current_0 = v81.current;
                    local l_v83_0 = v83;
                    local v90 = l_Y_0 - l_v83_0;
                    local v91 = 25.132741228718345 * v85;
                    local v92 = math.exp(-v91);
                    local v93 = l_current_0 + 25.132741228718345 * v90;
                    local v94 = (v90 + v93 * v85) * v92;
                    local v95 = (l_current_0 - v93 * v91) * v92;
                    local v96 = l_v83_0 + v94;
                    v81.current = v95;
                    v72.current.CanvasPosition = Vector2.new(0, v96);
                    v84 = v72.current.CanvasPosition.Y;
                    v87 = v83 - v72.current.CanvasPosition.Y;
                else
                    v87 = v83 - l_Y_0;
                    local v97 = v87 * 18 * 18;
                    local v98 = (l_Y_0 - v84) / v85;
                    local l_v81_0 = v81;
                    l_v81_0.current = l_v81_0.current - v98;
                    local v100 = v97 + -v81.current * 2 * 0.9 * 18;
                    local v101 = math.min(v85, 0.03333333333333333);
                    v81.current = v81.current + v100 * v101;
                    local v102 = l_Y_0 + v81.current * v101;
                    v72.current.CanvasPosition = Vector2.new(0, v102);
                    v84 = v72.current.CanvasPosition.Y;
                end;
                local v103 = false;
                if math.abs(v87) < 0.5 then
                    v103 = math.abs(v81.current) < 1;
                end;
                if v103 then
                    v72.current.CanvasPosition = Vector2.new(0, v83);
                    v82();
                end;
                return;
            end;
        end);
    end, {
        v82
    });
    local v106 = v4.useCallback(function(v105) --[[ Line: 206 ]]
        -- upvalues: v53 (copy), l_bottom_0 (copy)
        return v53(v105) + l_bottom_0;
    end, {
        l_bottom_0, 
        v53
    });
    local v108 = v4.useCallback(function(v107) --[[ Line: 210 ]]
        -- upvalues: v59 (copy), v104 (copy), v106 (copy), v51 (copy)
        v59.current = v107;
        v104(v106(v51[v107]));
    end, {
        v106, 
        v51
    });
    local v110 = if v22.FoundationSheetReducedMotion then v4.useCallback(function(v109) --[[ Line: 216 ]]
        -- upvalues: v82 (copy), v59 (copy), v72 (copy), v106 (copy), v51 (copy)
        v82();
        v59.current = v109;
        if v72.current then
            v72.current.CanvasPosition = Vector2.new(0, v106(v51[v109]));
        end;
    end, {
        v82, 
        v106, 
        v51
    }) else nil;
    local v112 = v4.useCallback(function(v111) --[[ Line: 226 ]]
        -- upvalues: v60 (copy), v22 (ref), v46 (ref), v82 (copy), v72 (copy), v62 (copy), v3 (ref), v81 (copy), v78 (copy), v104 (copy), v44 (copy)
        if v60.current then
            return;
        elseif v22.FoundationSheetReducedMotion and v46 and not v111 then
            v60.current = true;
            v82();
            if v72.current then
                v72.current.CanvasPosition = Vector2.new(0, 0);
            end;
            v62((v3.instant(1)));
            return;
        else
            v81.current = -v78.current;
            v104(0);
            v62(v3.ease(1, {
                duration = v44.Time.Time_100
            }));
            v60.current = true;
            return;
        end;
    end, if v22.FoundationSheetReducedMotion then {
        v104, 
        v82, 
        v46
    } else {
        v104
    });
    local v115 = v4.useCallback(function() --[[ Line: 251 ]]
        -- upvalues: v73 (copy), v71 (copy), v22 (ref), v54 (ref), l_bottom_0 (copy), v78 (copy), v77 (copy), v76 (copy)
        local v113 = v73:getValue() <= 0;
        local v114 = v71.current >= if v22.FoundationBottomSheetImproveSpring then math.floor(v54 + l_bottom_0) else math.round(v54 + l_bottom_0);
        if v78.current > 0 and v113 and v77.current then
            v76(false);
            return;
        else
            if (v78.current < 0 or v22.FoundationBottomSheetImproveSpring and v78.current == 0) and v114 then
                v76(true);
            end;
            return;
        end;
    end, {
        v54, 
        l_bottom_0
    });
    local v124 = v4.useCallback(function() --[[ Line: 268 ]]
        -- upvalues: v78 (copy), v71 (copy), v51 (copy), v106 (copy), v77 (copy), v81 (copy), v22 (ref), v112 (copy), v108 (copy)
        local l_current_1 = v78.current;
        local v117 = v71.current - l_current_1 / 2.35;
        local v118 = {
            {
                index = 0, 
                position = 0
            }
        };
        for v119, v120 in v51 do
            table.insert(v118, {
                index = v119, 
                position = v106(v120)
            });
        end;
        table.sort(v118, function(v121, v122) --[[ Line: 286 ]]
            -- upvalues: v117 (copy)
            return math.abs(v121.position - v117) < math.abs(v122.position - v117);
        end);
        local v123 = v118[1];
        if not v77.current then
            v81.current = -l_current_1;
            if v123.index == 0 then
                if v22.FoundationSheetReducedMotion then
                    v112(true);
                    return;
                else
                    v112();
                    return;
                end;
            else
                v108(v123.index);
            end;
        end;
    end, {
        v51, 
        v108, 
        v106, 
        v112
    });
    v4.useEffect(function() --[[ Line: 306 ]]
        -- upvalues: v43 (copy), v22 (ref), v46 (ref), v110 (copy), v42 (copy), v62 (copy), v3 (ref), v108 (copy), v44 (copy), v53 (copy), v51 (copy), v54 (ref), v76 (copy), v82 (copy)
        if v43 then
            if v22.FoundationSheetReducedMotion and v46 then
                v110(v42.defaultSnapPointIndex);
                v62(v3.instant(0));
            else
                v108(v42.defaultSnapPointIndex);
                v62(v3.ease(0, {
                    duration = v44.Time.Time_100
                }));
            end;
            if v53(v51[v42.defaultSnapPointIndex]) == v54 then
                v76(true);
            end;
        end;
        return function() --[[ Line: 324 ]]
            -- upvalues: v82 (ref)
            v82();
        end;
    end, if v22.FoundationSheetReducedMotion then {
        v43, 
        v51, 
        v42.defaultSnapPointIndex, 
        v108, 
        v53, 
        v110, 
        v46
    } else {
        v43, 
        v51, 
        v42.defaultSnapPointIndex, 
        v108, 
        v53
    });
    v4.useEffect(function() --[[ Line: 350 ]]
        -- upvalues: v78 (copy), v115 (copy), v77 (copy), v82 (copy), v22 (ref), v72 (copy), v71 (copy), v54 (ref), l_bottom_0 (copy), v60 (copy), v76 (copy), v75 (copy), v124 (copy)
        local v129 = game:GetService("UserInputService").TouchPan:Connect(function(_, _, v127, _) --[[ Line: 351 ]]
            -- upvalues: v78 (ref), v115 (ref)
            v78.current = v127.Y;
            v115();
        end);
        local v130 = game:GetService("UserInputService").InputBegan:Connect(function() --[[ Line: 355 ]]
            -- upvalues: v77 (ref), v78 (ref), v82 (ref)
            v77.current = true;
            v78.current = 0;
            v82();
        end);
        local v135 = game:GetService("UserInputService").InputEnded:Connect(function() --[[ Line: 360 ]]
            -- upvalues: v77 (ref), v22 (ref), v72 (ref), v78 (ref), v71 (ref), v54 (ref), l_bottom_0 (ref), v60 (ref), v76 (ref), v75 (ref), v124 (ref)
            if v77.current == false then
                return;
            else
                v77.current = false;
                if v22.FoundationBottomSheetImproveSpring then
                    v78.current = if v72.current then v72.current:GetScrollVelocity().Y else 0;
                    local v131 = true;
                    if v71.current < math.floor(v54 + l_bottom_0) then
                        v131 = v60.current;
                    end;
                    if v131 then
                        v76(true);
                        return;
                    end;
                elseif v22.FoundationSheetFixClosingSwipe then
                    local v132 = nil;
                    if v72.current then
                        local l_status_0, l_result_0 = pcall(function() --[[ Line: 385 ]]
                            -- upvalues: v72 (ref)
                            return v72.current:GetScrollVelocity().Y == 0;
                        end);
                        if l_status_0 then
                            v132 = l_result_0;
                        end;
                    end;
                    if v132 or v60.current then
                        v76(true);
                        return;
                    end;
                elseif v75:getValue() and v71.current >= math.round(v54 + l_bottom_0) or v60.current then
                    return;
                end;
                v124();
                return;
            end;
        end);
        return function() --[[ Line: 416 ]]
            -- upvalues: v129 (copy), v130 (copy), v135 (copy)
            v129:Disconnect();
            v130:Disconnect();
            v135:Disconnect();
        end;
    end, {
        v43, 
        v124, 
        v115, 
        v82
    });
    local v136 = v4.useRef(nil);
    local v137, v138 = v4.useState(nil);
    local v139, v140 = v4.useState(nil);
    local v141 = v7.useComposedRef(v41, v140);
    v4.useImperativeHandle(v42.sheetRef, function() --[[ Line: 429 ]]
        -- upvalues: v112 (copy)
        return {
            close = v112
        };
    end, {});
    local v143 = v4.useMemo(function() --[[ Line: 436 ]]
        -- upvalues: v65 (copy), v66 (copy), v67 (copy), v68 (copy), v63 (copy), v64 (copy), l_bottom_0 (copy), v75 (copy), v73 (copy), v74 (copy), v115 (copy), v69 (copy), v70 (copy), v112 (copy), v19 (ref), v139 (copy), v42 (copy), v136 (copy), v137 (copy), v138 (copy)
        return {
            actionsHeight = v65, 
            setActionsHeight = v66, 
            hasActionsDivider = v67, 
            setHasActionsDivider = v68, 
            sheetHeightAvailable = v63, 
            setSheetHeightAvailable = v64, 
            safeAreaPadding = l_bottom_0, 
            bottomPadding = 200, 
            innerScrollingEnabled = v75, 
            innerScrollY = v73, 
            setInnerScrollY = function(v142) --[[ Line: 448 ]] --[[ Name: setInnerScrollY ]]
                -- upvalues: v74 (ref), v115 (ref)
                v74(v142);
                v115();
            end, 
            hasHeader = v69, 
            setHasHeader = v70, 
            closeSheet = v112, 
            sheetType = v19.Bottom, 
            innerSurface = v139, 
            testId = v42.testId, 
            closeAffordanceRef = v136, 
            contentStartRef = v137, 
            setContentStartRef = v138
        };
    end, {
        v42.testId, 
        v112, 
        l_bottom_0, 
        v115, 
        v139, 
        v136, 
        v137
    });
    return v43 and v6.createPortal(v4.createElement(v24, {
        ZIndex = v45.zIndex, 
        ref = v141, 
        selection = v18.nonSelectable, 
        selectionGroup = v18.isolatedSelectionGroup, 
        tag = "size-full", 
        testId = ("%*--surface"):format(v42.testId)
    }, v4.createElement("ScrollingFrame", {
        Size = UDim2.fromScale(1, 1), 
        CanvasSize = if v22.FoundationSheetPreventCloseOnResize then UDim2.new(1, 0, 1, v54 + l_bottom_0) else UDim2.new(1, 0, 0, v47 + v54 + l_bottom_0), 
        ClipsDescendants = false, 
        BackgroundTransparency = 1, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        ScrollBarThickness = 0, 
        ref = v72, 
        [v4.Change.CanvasPosition] = function(v144) --[[ Line: 496 ]]
            -- upvalues: v71 (copy), v64 (copy), l_bottom_0 (copy), v44 (copy), v115 (copy), v112 (copy)
            v71.current = v144.CanvasPosition.Y;
            v64(v71.current - l_bottom_0 - v44.Margin.Small);
            v115();
            if v71.current <= 0 then
                v112();
            end;
        end
    }, {
        SheetContainer = v4.createElement(v24, {
            Size = if v22.FoundationSheetPreventCloseOnResize then UDim2.new(1, 0, 1, 200 - v54 - l_bottom_0) else UDim2.new(1, 0, 0, v47 + 200), 
            Position = if v22.FoundationSheetPreventCloseOnResize then UDim2.new(0, 0, 1, -v54) else UDim2.fromOffset(0, v47 + l_bottom_0), 
            ZIndex = 3
        }, {
            Sheet = v4.createElement(v24, {
                Size = if v42.snapPoints == nil then UDim2.fromScale(1, 0) else UDim2.new(1, 0, 0, v54 + 200), 
                AutomaticSize = if v42.snapPoints == nil then Enum.AutomaticSize.Y else nil, 
                onAbsoluteSizeChanged = v42.snapPoints == nil and function(v145) --[[ Line: 520 ]]
                    -- upvalues: v49 (copy)
                    v49(v145.AbsoluteSize.Y - 200);
                end or nil, 
                stateLayer = {
                    affordance = v9.None
                }, 
                onActivated = v2.noop, 
                testId = v42.testId, 
                tag = "bg-surface-100 radius-large col items-center clip padding-top-small"
            }, {
                Gripper = v4.createElement(v24, {
                    ZIndex = 3, 
                    backgroundStyle = v44.Color.Content.Muted, 
                    tag = "padding-y-small size-1000-100 radius-small align-y-center", 
                    testId = ("%*--gripper"):format(v42.testId)
                }, {
                    TouchTarget = v4.createElement(v24, {
                        tag = "size-1000-600", 
                        stateLayer = {
                            affordance = v9.None
                        }, 
                        onActivated = function() --[[ Line: 543 ]] --[[ Name: onActivated ]]
                            -- upvalues: v77 (copy), v51 (copy), v59 (copy), v22 (ref), v46 (ref), v110 (copy), v108 (copy), v53 (copy), v54 (ref), v76 (copy), v112 (copy)
                            v77.current = false;
                            if #v51 > 1 then
                                local v146 = v59.current % #v51 + 1;
                                if v22.FoundationSheetReducedMotion and v46 then
                                    v110(v146);
                                else
                                    v108(v146);
                                end;
                                if v22.FoundationSheetFixClosingSwipe and v53(v51[v146]) == v54 then
                                    v76(true);
                                    return;
                                end;
                            else
                                v112();
                            end;
                        end
                    })
                }), 
                Content = v4.createElement(v17.Provider, {
                    value = v143
                }, v4.createElement(l_ElevationOwnerScope_0, {
                    owner = v45
                }, v42.children))
            })
        }), 
        Shadow = v4.createElement(v23, {
            Image = l_SHADOW_IMAGE_0, 
            Size = UDim2.new(1, l_SHADOW_SIZE_0 * 2, 0, v54 + 200 + l_SHADOW_SIZE_0 * 2), 
            Position = if v22.FoundationSheetPreventCloseOnResize then UDim2.new(-l_SHADOW_SIZE_0, 0, 1, -v54 - l_SHADOW_SIZE_0) else UDim2.fromOffset(-l_SHADOW_SIZE_0, v47 + l_bottom_0 - l_SHADOW_SIZE_0), 
            ZIndex = 2, 
            slice = {
                center = Rect.new(l_SHADOW_SIZE_0, l_SHADOW_SIZE_0, l_SHADOW_SIZE_0 + 1, l_SHADOW_SIZE_0 + 1), 
                scale = 2
            }, 
            imageStyle = v44.Color.Extended.Black.Black_10
        }), 
        Backdrop = v4.createElement(v24, {
            Size = UDim2.fromScale(1, 2), 
            Position = UDim2.fromScale(0, -0.5), 
            ZIndex = 1, 
            stateLayer = {
                affordance = v9.None
            }, 
            backgroundStyle = v61:map(function(v147) --[[ Line: 591 ]]
                -- upvalues: v44 (copy)
                return {
                    Color3 = v44.Color.Common.Backdrop.Color3, 
                    Transparency = math.lerp(v44.Color.Common.Backdrop.Transparency, 1, v147)
                };
            end), 
            onActivated = v22.FoundationSheetReducedMotion and function() --[[ Line: 598 ]]
                -- upvalues: v112 (copy)
                v112();
            end or v112, 
            testId = ("%*--backdrop"):format(v42.testId)
        })
    })), v43);
end));