local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v4 = require(l_Components_0.Padding);
local v5 = require(l_Components_0.ScrollView);
local _ = require(l_Components_0.Types);
local v7 = require(l_Components_0.View);
local v8 = require(l_script_FirstAncestor_0.Constants);
local v9 = require(l_script_FirstAncestor_0.Utility.Flags);
local v10 = require(l_script_FirstAncestor_0.Utility.blendTransparencies);
local v11 = require(l_script_FirstAncestor_0.Utility.getDisabledStyle);
local v12 = require(l_script_FirstAncestor_0.Utility.getMultiLineTextHeight);
local v13 = require(l_script_FirstAncestor_0.Utility.isPluginSecurity);
local v14 = require(script.Parent.truncateTextToCursor);
local v15 = require(l_script_FirstAncestor_0.Utility.useBindable);
local v16 = require(l_script_FirstAncestor_0.Utility.usePreferredInput);
local v17 = require(l_script_FirstAncestor_0.Providers.Style.useStyleTags);
local v18 = require(l_Components_0.TextInput.useTextInputVariants);
local v19 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v20 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v21 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v22 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v23 = require(l_script_FirstAncestor_0.Enums.InputVariant);
local v24 = require(l_script_FirstAncestor_0.Enums.Radius);
local v25 = require(l_script_FirstAncestor_0.Enums.ControlState);
local v26 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local v27 = {
    size = v22.Large, 
    variant = if v9.FoundationInternalTextInputVariants then v23.Standard else nil, 
    numLines = 1, 
    testId = "--foundation-internal-text-input"
};
local v32 = v2.memo(v2.forwardRef(function(v28, v29) --[[ Line: 110 ]]
    -- upvalues: v2 (copy), v9 (copy), v13 (copy), v4 (copy)
    local l_isBoundsChecker_0 = v28.isBoundsChecker;
    local v31 = v28.isMultiLine or l_isBoundsChecker_0;
    return v2.createElement("TextBox", {
        ClearTextOnFocus = false, 
        Selectable = false, 
        Active = not l_isBoundsChecker_0 and nil, 
        Visible = not l_isBoundsChecker_0 and nil, 
        BackgroundTransparency = if v9.FoundationCleanupTextInputPolyfill then nil else 1, 
        ClipsDescendants = not v9.FoundationCleanupTextInputPolyfill or nil, 
        TextXAlignment = if v9.FoundationCleanupTextInputPolyfill then nil else Enum.TextXAlignment.Left, 
        Font = v28.fontStyle.Font, 
        TextSize = v28.fontStyle.FontSize, 
        LineHeight = v28.fontStyle.LineHeight, 
        TextColor3 = if not v9.FoundationCleanupTextInputPolyfill and v28.textStyle then v28.textStyle.Color3 else nil, 
        TextTransparency = if not v9.FoundationCleanupTextInputPolyfill and v28.textStyle then v28.textStyle.Transparency else nil, 
        MultiLine = v31, 
        TextWrapped = v31, 
        TextYAlignment = if v31 then Enum.TextYAlignment.Top else Enum.TextYAlignment.Center, 
        TextEditable = not l_isBoundsChecker_0 and not v28.isDisabled, 
        PlaceholderText = v28.placeholder, 
        TextInputType = if v13() then v28.textInputType else nil, 
        Size = if v28.Size ~= nil then v28.Size else UDim2.fromScale(1, 1), 
        AutomaticSize = v28.automaticSize, 
        Text = if l_isBoundsChecker_0 then nil else v28.text, 
        ref = v29, 
        [v2.Tag] = v28.tag, 
        [v2.Change.Text] = v28.onTextChanged, 
        [v2.Change.CursorPosition] = v28.onCursorPositionChanged, 
        [v2.Event.Focused] = v28.onFocusGained, 
        [v2.Event.FocusLost] = v28.onFocusLost
    }, if v28.padding then {
        Padding = v2.createElement(v4, {
            value = v28.padding
        })
    } else nil, v28.children);
end));
return v2.memo(v2.forwardRef(function(v33, v34) --[[ Line: 161 ]] --[[ Name: InternalTextInput ]]
    -- upvalues: v21 (copy), v27 (copy), v19 (copy), v2 (copy), v9 (copy), v23 (copy), v18 (copy), v17 (copy), v16 (copy), v11 (copy), v25 (copy), v12 (copy), v14 (copy), v15 (copy), v7 (copy), v20 (copy), v8 (copy), v10 (copy), v24 (copy), v26 (copy), v5 (copy), v32 (copy)
    local v35 = v21(v33, v27);
    local v36 = v19();
    local v37 = math.max(1, v35.numLines);
    local v38 = v37 > 1;
    local v39 = v2.useRef(nil);
    local v40 = v2.useRef(nil);
    local v41 = v2.useRef(nil);
    local v42 = v2.useRef("");
    local v43 = v2.useRef(nil);
    local v44 = v2.useRef(Vector2.zero);
    local v45, v46 = v2.useState(false);
    local v47, v48 = v2.useState(false);
    if v9.FoundationInternalTextInputVariants then
        v35.variant = if v35.variant then v35.variant else v23.Standard;
    end;
    local v49 = v18(v36, v35.size, if v9.FoundationInternalTextInputVariants then v35.variant else nil, if v9.FoundationInternalTextInputCornerRadius then v35.radius else nil, if v9.FoundationTextInputAlignStrokeBehavior then v47 else nil, if v9.FoundationTextInputAlignStrokeBehavior then v45 else nil, if v9.FoundationTextInputAlignStrokeBehavior then v35.hasError else nil);
    local v50 = v17(v49.textBox.tag);
    local v51 = v16();
    local v52, v53 = v2.useState(false);
    local v54 = v51 == Enum.PreferredInput.Touch;
    local l_Standard_0 = v36.Stroke.Standard;
    local v56 = math.ceil(l_Standard_0) * 2;
    local l_Thick_0 = v36.Stroke.Thick;
    local v58 = math.ceil(l_Thick_0) * 2;
    local v59 = if v9.FoundationInternalTextInputDisabledTransparency then v11(v36.Color.Content.Emphasis, v35.isDisabled) else v36.Color.Content.Emphasis;
    local l_fontStyle_0 = v49.textBox.fontStyle;
    local l_FontSize_0 = l_fontStyle_0.FontSize;
    local l_LineHeight_0 = l_fontStyle_0.LineHeight;
    local v63 = v2.useCallback(function() --[[ Line: 209 ]]
        -- upvalues: v39 (copy)
        if v39.current then
            v39.current:CaptureFocus();
        end;
    end, {});
    local v64 = v2.useCallback(function() --[[ Line: 215 ]]
        -- upvalues: v39 (copy)
        if v39.current then
            v39.current:ReleaseFocus();
        end;
    end, {});
    local v65 = v2.useCallback(function() --[[ Line: 221 ]]
        -- upvalues: v39 (copy)
        if v39.current then
            return (v39.current:IsFocused());
        else
            return nil;
        end;
    end, {});
    local v66 = v2.useCallback(function() --[[ Line: 228 ]]
        -- upvalues: v39 (copy)
        if v39.current then
            return v39.current.SelectionStart;
        else
            return nil;
        end;
    end, {});
    local v67 = v2.useCallback(function() --[[ Line: 235 ]]
        -- upvalues: v39 (copy)
        if v39.current then
            return v39.current.CursorPosition;
        else
            return nil;
        end;
    end, {});
    local v69 = v2.useCallback(function(v68) --[[ Line: 242 ]]
        -- upvalues: v39 (copy)
        if v39.current then
            v39.current.SelectionStart = v68;
        end;
    end, {});
    local v71 = v2.useCallback(function(v70) --[[ Line: 248 ]]
        -- upvalues: v39 (copy)
        if v39.current then
            v39.current.CursorPosition = v70;
        end;
    end, {});
    v2.useImperativeHandle(v34, function() --[[ Line: 256 ]]
        -- upvalues: v65 (copy), v63 (copy), v64 (copy), v46 (copy), v66 (copy), v67 (copy), v71 (copy), v69 (copy)
        return {
            getIsFocused = v65, 
            focus = v63, 
            releaseFocus = v64, 
            setHover = v46, 
            getSelectionStart = v66, 
            getCursorPosition = v67, 
            setCursorPosition = v71, 
            setSelectionStart = v69
        };
    end, {
        v67, 
        v65, 
        v66, 
        v63, 
        v64, 
        v71, 
        v69
    });
    local v74 = v2.useCallback(function(v72) --[[ Line: 279 ]]
        -- upvalues: v42 (copy), v38 (copy), v40 (copy), v35 (copy)
        if v72 == nil or v72.Parent == nil or v42.current ~= "" then
            return;
        else
            local l_Text_0 = v72.Text;
            if v38 and v40.current then
                v40.current.Text = l_Text_0;
            end;
            v35.onChanged(l_Text_0);
            return;
        end;
    end, {
        v35.onChanged, 
        v38, 
        v52
    });
    local v75 = v2.useCallback(function() --[[ Line: 293 ]]
        -- upvalues: v35 (copy), v38 (copy), v54 (copy), v39 (copy), v42 (copy), v53 (copy), v48 (copy)
        if v35.isDisabled then
            return;
        else
            if v38 and v54 then
                if v39.current and v39.current.Parent then
                    v42.current = v39.current.Text;
                end;
                v53(true);
            end;
            v48(true);
            if v35.onFocus then
                v35.onFocus();
            end;
            return;
        end;
    end, {
        v35.onFocus, 
        v35.isDisabled, 
        v54, 
        v38
    });
    local v79 = v2.useCallback(function(_, v77, v78) --[[ Line: 313 ]]
        -- upvalues: v48 (copy), v38 (copy), v53 (copy), v35 (copy)
        v48(false);
        if v38 then
            v53(false);
        end;
        if v35.onFocusLost then
            v35.onFocusLost(v78);
        end;
        if v77 and v35.onReturnPressed then
            v35.onReturnPressed();
        end;
    end, {
        v35.onReturnPressed, 
        v38, 
        v35.onFocusLost
    });
    local v81 = v2.useCallback(function(v80) --[[ Line: 331 ]]
        -- upvalues: v46 (copy), v25 (ref)
        v46(v80 == v25.Hover);
    end, {});
    local v84 = v2.useCallback(function(v82, v83) --[[ Line: 335 ]]
        -- upvalues: v43 (copy), v35 (copy)
        v43.current = v83;
        if v35.onDragStarted then
            v35.onDragStarted(v82, v83);
        end;
    end, {
        v35.onDragStarted
    });
    local v87 = v2.useCallback(function(v85, v86) --[[ Line: 342 ]]
        -- upvalues: v35 (copy)
        if v35.onDrag then
            v35.onDrag(v85, v86);
        end;
    end, {
        v35.onDrag
    });
    local v90 = v2.useCallback(function(v88, v89) --[[ Line: 348 ]]
        -- upvalues: v43 (copy), v63 (copy), v64 (copy), v48 (copy), v35 (copy)
        if v43.current == v89 then
            v63();
        else
            v64();
            v48(false);
        end;
        v43.current = nil;
        if v35.onDragEnded then
            v35.onDragEnded(v88, v89);
        end;
    end, {
        v35.onDragEnded
    });
    local v91 = v2.useMemo(function() --[[ Line: 361 ]]
        -- upvalues: v49 (copy), v36 (copy)
        return {
            radius = UDim.new(0, v49.innerContainer.radius), 
            offset = v36.Stroke.Thick, 
            borderWidth = v36.Stroke.Thick
        };
    end, {
        v36, 
        v49.innerContainer.radius
    });
    local v92 = v2.useMemo(function() --[[ Line: 369 ]]
        -- upvalues: v12 (ref), l_FontSize_0 (copy), v37 (copy), l_LineHeight_0 (copy)
        return v12(l_FontSize_0, v37, l_LineHeight_0);
    end, {
        l_FontSize_0, 
        v37, 
        l_LineHeight_0
    });
    local v97, v98 = v2.useMemo(function() --[[ Line: 374 ]]
        -- upvalues: v49 (copy), v56 (copy), v12 (ref), l_FontSize_0 (copy), l_LineHeight_0 (copy), v92 (copy)
        local v93 = math.round((v49.outerContainer.minHeight - v56 - v12(l_FontSize_0, 1, l_LineHeight_0)) * 2) / 2;
        local v94 = UDim.new(0, (math.floor(v93 / 2)));
        local v95 = UDim.new(0, (math.ceil(v93 / 2)));
        local v96 = v92 + math.round(v93) + v56;
        return {
            top = v94, 
            bottom = v95, 
            left = UDim.new(0, 0), 
            right = UDim.new(0, 0)
        }, v96;
    end, {
        v49.outerContainer.minHeight, 
        v56, 
        v58, 
        l_FontSize_0, 
        v92, 
        l_LineHeight_0
    });
    local v99 = v97.bottom.Offset + v97.top.Offset;
    local v100 = UDim2.new(1, 0, 0, v92 + v99);
    local v101 = v2.useMemo(function() --[[ Line: 410 ]]
        -- upvalues: v38 (copy)
        if v38 then
            return {
                FillDirection = Enum.FillDirection.Vertical, 
                ItemLineAlignment = Enum.ItemLineAlignment.Center
            };
        else
            return nil;
        end;
    end, {
        v38
    });
    local v102 = v2.useMemo(function() --[[ Line: 419 ]]
        -- upvalues: v38 (copy)
        if v38 then
            return {
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                CanvasSize = UDim2.fromOffset(0, 0), 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                VerticalScrollBarInset = Enum.ScrollBarInset.Always
            };
        else
            return nil;
        end;
    end, {
        v38
    });
    local v111 = v2.useCallback(function(v103) --[[ Line: 430 ]]
        -- upvalues: v41 (copy), v40 (copy), v14 (ref), v97 (copy)
        local l_current_0 = v41.current;
        local l_current_1 = v40.current;
        if l_current_0 == nil or l_current_1 == nil then
            return;
        else
            local v106 = v103.TextSize * v103.LineHeight;
            local l_Y_0 = l_current_0.CanvasPosition.Y;
            l_current_1.Text = v14(v103);
            local l_Y_1 = l_current_1.TextBounds.Y;
            local v109 = l_Y_0 - v97.top.Offset + v97.bottom.Offset;
            local v110 = l_Y_0 + l_current_0.AbsoluteSize.Y - v97.top.Offset - v97.bottom.Offset;
            if l_Y_1 - v106 < v109 then
                l_current_0.CanvasPosition = l_current_0.CanvasPosition + Vector2.new(0, l_Y_1 - v106 - v109);
            end;
            if v110 < l_Y_1 then
                l_current_0.CanvasPosition = l_current_0.CanvasPosition + Vector2.new(0, l_Y_1 - v110);
            end;
            return;
        end;
    end, {
        v97
    });
    local v113 = v2.useCallback(function(v112) --[[ Line: 463 ]]
        -- upvalues: v41 (copy), v44 (copy)
        if v112 == nil then
            return;
        else
            v41.current = v112;
            v112.ClipsDescendants = true;
            v112.CanvasPosition = v44.current;
            return;
        end;
    end, {});
    local v115 = v2.useCallback(function(v114) --[[ Line: 473 ]]
        -- upvalues: v42 (copy)
        if v114 then
            v114.Text = v42.current;
            v42.current = "";
            v114:CaptureFocus();
        end;
    end, {});
    local v117 = v2.useCallback(function(v116) --[[ Line: 481 ]]
        -- upvalues: v44 (copy)
        v44.current = v116.CanvasPosition;
    end, {});
    local v118 = v2.useMemo(function() --[[ Line: 485 ]]
        -- upvalues: v35 (copy), v2 (ref), v84 (copy), v87 (copy), v90 (copy), v47 (copy)
        if not v35.onDragStarted and not v35.onDrag and not v35.onDragEnded then
            return nil;
        else
            return v2.createElement("UIDragDetector", {
                DragStyle = Enum.UIDragDetectorDragStyle.Scriptable, 
                [v2.Event.DragStart] = v84, 
                [v2.Event.DragContinue] = v87, 
                [v2.Event.DragEnd] = v90, 
                Enabled = not v47 and not v35.isDisabled
            });
        end;
    end, {
        v84, 
        v87, 
        v90, 
        v47, 
        v35.isDisabled
    });
    local v119 = v15(if v35.horizontalPadding then v35.horizontalPadding.left or UDim.new(0, 0) else UDim.new(0, 0));
    local v120 = v15(if v35.horizontalPadding then v35.horizontalPadding.right or UDim.new(0, 0) else UDim.new(0, 0));
    return v2.createElement(v7, v20(v35, {
        GroupTransparency = if not v9.FoundationInternalTextInputDisabledTransparency and v35.isDisabled then v8.DISABLED_TRANSPARENCY else nil, 
        Size = UDim2.new(1, 0, 0, v98), 
        selection = {
            Selectable = not v35.isDisabled
        }, 
        cursor = v91, 
        stroke = if not v9.FoundationTextInputAlignStrokeBehavior or v49.outerView.strokeStyle and v49.outerView.strokeThickness then {
            Color = if v9.FoundationTextInputAlignStrokeBehavior then v49.outerView.strokeStyle.Color3 else if v35.hasError then v36.Color.System.Alert.Color3 else v36.Color.Stroke.Emphasis.Color3, 
            Transparency = if v9.FoundationTextInputAlignStrokeBehavior then if v35.isDisabled then v10(v49.outerView.strokeStyle.Transparency, v8.DISABLED_TRANSPARENCY) else v49.outerView.strokeStyle.Transparency else if v35.hasError then v36.Color.System.Alert.Transparency else v47 and 0 or v36.Color.Stroke.Emphasis.Transparency, 
            Thickness = if v9.FoundationTextInputAlignStrokeBehavior then v49.outerView.strokeThickness else l_Standard_0, 
            BorderStrokePosition = if v9.FoundationTextInputAlignStrokeBehavior and (v47 or v45) then Enum.BorderStrokePosition.Center else Enum.BorderStrokePosition.Inner
        } else nil, 
        cornerRadius = if v9.FoundationTextInputSingleLineCircleRadius and v35.radius == v24.Circle then UDim.new(0, (math.ceil(v49.outerContainer.minHeight / 2))) else nil, 
        padding = {
            left = v119:map(function(v121) --[[ Line: 545 ]]
                -- upvalues: l_Standard_0 (copy)
                return UDim.new(0, l_Standard_0) + v121;
            end), 
            right = v120:map(function(v122) --[[ Line: 548 ]]
                -- upvalues: l_Standard_0 (copy)
                return UDim.new(0, l_Standard_0) + v122;
            end), 
            top = UDim.new(0, l_Standard_0), 
            bottom = UDim.new(0, l_Standard_0)
        }, 
        onActivated = if not v35.isDisabled then v63 else nil, 
        onStateChanged = v81, 
        isDisabled = v35.isDisabled, 
        backgroundStyle = if not v9.FoundationInternalTextInputVariants or v49.outerView.bgStyle then if v9.FoundationInternalTextInputDisabledTransparency then v11({
            Color3 = v49.outerView.bgStyle.Color3, 
            Transparency = v35.backgroundGradient and 0 or v49.outerView.bgStyle.Transparency
        }, v35.isDisabled) else {
            Color3 = v49.outerView.bgStyle.Color3, 
            Transparency = v35.backgroundGradient and 0 or v49.outerView.bgStyle.Transparency
        } else nil, 
        stateLayer = {
            affordance = v26.None
        }, 
        tag = v49.outerView.tag, 
        testId = ("%*--outer-container"):format(v35.testId)
    }), {
        DragDetector = v118, 
        Background = v35.backgroundGradient, 
        HoverStroke = if not (not not v9.FoundationTextInputAlignStrokeBehavior or v35.isDisabled) and (v45 or v47) then v2.createElement("UIStroke", {
            Color = v36.Color.Stroke.Emphasis.Color3, 
            Transparency = v36.Color.Stroke.Emphasis.Transparency, 
            Thickness = l_Thick_0, 
            BorderStrokePosition = Enum.BorderStrokePosition.Inner, 
            BorderOffset = UDim.new(0, -v58 / 2)
        }) else nil, 
        Leading = if v35.leadingElement then v2.createElement(v7, {
            GroupTransparency = if v9.FoundationInternalTextInputDisabledTransparency and v35.isDisabled then v8.DISABLED_TRANSPARENCY else nil, 
            LayoutOrder = 1, 
            tag = "size-0-full auto-x", 
            testId = ("%*--leading"):format(v35.testId)
        }, v35.leadingElement) else nil, 
        TextBoxWrapper = v2.createElement(if v38 then v5 else v7, {
            LayoutOrder = 2, 
            scroll = v102, 
            layout = v101, 
            onCanvasPositionChanged = if v38 then v117 else nil, 
            scrollingFrameRef = if v38 then v113 else nil, 
            tag = "size-full fill clip"
        }, {
            TextBox = if not v52 then v2.createElement(v32, {
                text = v35.text, 
                placeholder = v35.placeholder, 
                textInputType = v35.textInputType, 
                fontStyle = l_fontStyle_0, 
                textStyle = v59, 
                isMultiLine = v38, 
                isDisabled = v35.isDisabled, 
                ref = v39, 
                tag = ("%* data-testid=%*--textbox"):format(v50 or "", v35.testId), 
                Size = if v38 then v100 else nil, 
                automaticSize = if not (not v38 or v52) and v35.text ~= "" then Enum.AutomaticSize.Y else nil, 
                padding = v97, 
                onFocusGained = v75, 
                onFocusLost = if v38 and v54 then nil else v79, 
                onTextChanged = v74, 
                onCursorPositionChanged = if v38 then v111 else nil
            }, {
                DragDetector = v118, 
                BoundsChecker = if v38 then v2.createElement(v32, {
                    isBoundsChecker = true, 
                    fontStyle = l_fontStyle_0, 
                    textStyle = v59, 
                    Size = UDim2.new(1, 0, 1, v99), 
                    ref = v40
                }) else nil
            }) else nil, 
            MobileTextBox = if v38 and v52 then v2.createElement(v32, {
                text = v35.text, 
                placeholder = v35.placeholder, 
                textInputType = v35.textInputType, 
                fontStyle = l_fontStyle_0, 
                textStyle = v59, 
                isMultiLine = v38, 
                isDisabled = v35.isDisabled, 
                padding = v97, 
                ref = v115, 
                tag = ("%* data-testid=%*--mobile-textbox"):format(v50 or "", v35.testId), 
                Size = v100, 
                onFocusLost = if v38 and v54 then v79 else nil, 
                onTextChanged = v74, 
                onCursorPositionChanged = if v38 then v111 else nil
            }) else nil
        }), 
        Trailing = if v35.trailingElement then v2.createElement(v7, {
            GroupTransparency = if v9.FoundationInternalTextInputDisabledTransparency and v35.isDisabled then v8.DISABLED_TRANSPARENCY else nil, 
            LayoutOrder = 3, 
            tag = "size-0-full auto-x", 
            testId = ("%*--trailing"):format(v35.testId)
        }, v35.trailingElement) else nil
    });
end));