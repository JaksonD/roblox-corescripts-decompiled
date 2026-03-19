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
local v10 = require(l_script_FirstAncestor_0.Constants);
local v11 = require(l_script_FirstAncestor_0.Utility.blendTransparencies);
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
local _ = require(l_script_FirstAncestor_0.Enums.Radius);
local v24 = require(l_script_FirstAncestor_0.Enums.ControlState);
local v25 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local v26 = {
    size = v22.Large, 
    numLines = 1, 
    testId = "--foundation-internal-text-input"
};
local v31 = v2.memo(v2.forwardRef(function(v27, v28) --[[ Line: 104 ]]
    -- upvalues: v2 (copy), v9 (copy), v13 (copy), v4 (copy)
    local l_isBoundsChecker_0 = v27.isBoundsChecker;
    local v30 = v27.isMultiLine or l_isBoundsChecker_0;
    return v2.createElement("TextBox", {
        ClearTextOnFocus = false, 
        Selectable = false, 
        Active = not l_isBoundsChecker_0 and nil, 
        Visible = not l_isBoundsChecker_0 and nil, 
        BackgroundTransparency = if v9.FoundationCleanupTextInputPolyfill then nil else 1, 
        ClipsDescendants = not v9.FoundationCleanupTextInputPolyfill or nil, 
        TextXAlignment = if v9.FoundationCleanupTextInputPolyfill then nil else Enum.TextXAlignment.Left, 
        Font = v27.fontStyle.Font, 
        TextSize = v27.fontStyle.FontSize, 
        LineHeight = v27.fontStyle.LineHeight, 
        TextColor3 = if not v9.FoundationCleanupTextInputPolyfill and v27.textStyle then v27.textStyle.Color3 else nil, 
        TextTransparency = if not v9.FoundationCleanupTextInputPolyfill and v27.textStyle then v27.textStyle.Transparency else nil, 
        MultiLine = v30, 
        TextWrapped = v30, 
        TextYAlignment = if v30 then Enum.TextYAlignment.Top else Enum.TextYAlignment.Center, 
        TextEditable = not l_isBoundsChecker_0 and not v27.isDisabled, 
        PlaceholderText = v27.placeholder, 
        TextInputType = if v13() then v27.textInputType else nil, 
        Size = if v27.Size ~= nil then v27.Size else UDim2.fromScale(1, 1), 
        AutomaticSize = v27.automaticSize, 
        Text = if l_isBoundsChecker_0 then nil else v27.text, 
        ref = v28, 
        [v2.Tag] = v27.tag, 
        [v2.Change.Text] = v27.onTextChanged, 
        [v2.Change.CursorPosition] = v27.onCursorPositionChanged, 
        [v2.Event.Focused] = v27.onFocusGained, 
        [v2.Event.FocusLost] = v27.onFocusLost
    }, if v27.padding then {
        Padding = v2.createElement(v4, {
            value = v27.padding
        })
    } else nil, v27.children);
end));
return v2.memo(v2.forwardRef(function(v32, v33) --[[ Line: 155 ]] --[[ Name: InternalTextInput ]]
    -- upvalues: v21 (copy), v26 (copy), v19 (copy), v2 (copy), v18 (copy), v9 (copy), v17 (copy), v16 (copy), v24 (copy), v12 (copy), v14 (copy), v15 (copy), v7 (copy), v20 (copy), v10 (copy), v11 (copy), v8 (copy), v25 (copy), v5 (copy), v31 (copy)
    local v34 = v21(v32, v26);
    local v35 = v19();
    local v36 = math.max(1, v34.numLines);
    local v37 = v36 > 1;
    local v38 = v2.useRef(nil);
    local v39 = v2.useRef(nil);
    local v40 = v2.useRef(nil);
    local v41 = v2.useRef("");
    local v42 = v2.useRef(nil);
    local v43 = v2.useRef(Vector2.zero);
    local v44, v45 = v2.useState(false);
    local v46, v47 = v2.useState(false);
    local v48 = v18(v35, v34.size, if v9.FoundationInternalTextInputCornerRadius then v34.radius else nil, if v9.FoundationTextInputAlignStrokeBehavior then v46 else nil, if v9.FoundationTextInputAlignStrokeBehavior then v44 else nil, if v9.FoundationTextInputAlignStrokeBehavior then v34.hasError else nil);
    local v49 = v17(v48.textBox.tag);
    local v50 = v16();
    local v51, v52 = v2.useState(false);
    local v53 = v50 == Enum.PreferredInput.Touch;
    local l_Standard_0 = v35.Stroke.Standard;
    local v55 = math.ceil(l_Standard_0) * 2;
    local l_Thick_0 = v35.Stroke.Thick;
    local v57 = math.ceil(l_Thick_0) * 2;
    local v58 = if v9.FoundationCleanupTextInputPolyfill then nil else v35.Color.Content.Emphasis;
    local l_fontStyle_0 = v48.textBox.fontStyle;
    local l_FontSize_0 = l_fontStyle_0.FontSize;
    local l_LineHeight_0 = l_fontStyle_0.LineHeight;
    local v62 = v2.useCallback(function() --[[ Line: 196 ]]
        -- upvalues: v38 (copy)
        if v38.current then
            v38.current:CaptureFocus();
        end;
    end, {});
    local v63 = v2.useCallback(function() --[[ Line: 202 ]]
        -- upvalues: v38 (copy)
        if v38.current then
            v38.current:ReleaseFocus();
        end;
    end, {});
    local v64 = v2.useCallback(function() --[[ Line: 208 ]]
        -- upvalues: v38 (copy)
        if v38.current then
            return (v38.current:IsFocused());
        else
            return nil;
        end;
    end, {});
    local v65 = v2.useCallback(function() --[[ Line: 215 ]]
        -- upvalues: v38 (copy)
        if v38.current then
            return v38.current.SelectionStart;
        else
            return nil;
        end;
    end, {});
    local v66 = v2.useCallback(function() --[[ Line: 222 ]]
        -- upvalues: v38 (copy)
        if v38.current then
            return v38.current.CursorPosition;
        else
            return nil;
        end;
    end, {});
    local v68 = v2.useCallback(function(v67) --[[ Line: 229 ]]
        -- upvalues: v38 (copy)
        if v38.current then
            v38.current.SelectionStart = v67;
        end;
    end, {});
    local v70 = v2.useCallback(function(v69) --[[ Line: 235 ]]
        -- upvalues: v38 (copy)
        if v38.current then
            v38.current.CursorPosition = v69;
        end;
    end, {});
    v2.useImperativeHandle(v33, function() --[[ Line: 243 ]]
        -- upvalues: v64 (copy), v62 (copy), v63 (copy), v45 (copy), v65 (copy), v66 (copy), v70 (copy), v68 (copy)
        return {
            getIsFocused = v64, 
            focus = v62, 
            releaseFocus = v63, 
            setHover = v45, 
            getSelectionStart = v65, 
            getCursorPosition = v66, 
            setCursorPosition = v70, 
            setSelectionStart = v68
        };
    end, {
        v66, 
        v64, 
        v65, 
        v62, 
        v63, 
        v70, 
        v68
    });
    local v73 = v2.useCallback(function(v71) --[[ Line: 266 ]]
        -- upvalues: v41 (copy), v37 (copy), v39 (copy), v34 (copy)
        if v71 == nil or v71.Parent == nil or v41.current ~= "" then
            return;
        else
            local l_Text_0 = v71.Text;
            if v37 and v39.current then
                v39.current.Text = l_Text_0;
            end;
            v34.onChanged(l_Text_0);
            return;
        end;
    end, {
        v34.onChanged, 
        v37, 
        v51
    });
    local v74 = v2.useCallback(function() --[[ Line: 280 ]]
        -- upvalues: v34 (copy), v37 (copy), v53 (copy), v38 (copy), v41 (copy), v52 (copy), v47 (copy)
        if v34.isDisabled then
            return;
        else
            if v37 and v53 then
                if v38.current and v38.current.Parent then
                    v41.current = v38.current.Text;
                end;
                v52(true);
            end;
            v47(true);
            if v34.onFocus then
                v34.onFocus();
            end;
            return;
        end;
    end, {
        v34.onFocus, 
        v34.isDisabled, 
        v53, 
        v37
    });
    local v78 = v2.useCallback(function(_, v76, v77) --[[ Line: 300 ]]
        -- upvalues: v47 (copy), v37 (copy), v52 (copy), v34 (copy)
        v47(false);
        if v37 then
            v52(false);
        end;
        if v34.onFocusLost then
            v34.onFocusLost(v77);
        end;
        if v76 and v34.onReturnPressed then
            v34.onReturnPressed();
        end;
    end, {
        v34.onReturnPressed, 
        v37, 
        v34.onFocusLost
    });
    local v80 = v2.useCallback(function(v79) --[[ Line: 318 ]]
        -- upvalues: v45 (copy), v24 (ref)
        v45(v79 == v24.Hover);
    end, {});
    local v83 = v2.useCallback(function(v81, v82) --[[ Line: 322 ]]
        -- upvalues: v42 (copy), v34 (copy)
        v42.current = v82;
        if v34.onDragStarted then
            v34.onDragStarted(v81, v82);
        end;
    end, {
        v34.onDragStarted
    });
    local v86 = v2.useCallback(function(v84, v85) --[[ Line: 329 ]]
        -- upvalues: v34 (copy)
        if v34.onDrag then
            v34.onDrag(v84, v85);
        end;
    end, {
        v34.onDrag
    });
    local v89 = v2.useCallback(function(v87, v88) --[[ Line: 335 ]]
        -- upvalues: v42 (copy), v62 (copy), v63 (copy), v47 (copy), v34 (copy)
        if v42.current == v88 then
            v62();
        else
            v63();
            v47(false);
        end;
        v42.current = nil;
        if v34.onDragEnded then
            v34.onDragEnded(v87, v88);
        end;
    end, {
        v34.onDragEnded
    });
    local v90 = v2.useMemo(function() --[[ Line: 348 ]]
        -- upvalues: v48 (copy), v35 (copy)
        return {
            radius = UDim.new(0, v48.innerContainer.radius), 
            offset = v35.Stroke.Thick, 
            borderWidth = v35.Stroke.Thick
        };
    end, {
        v35, 
        v48.innerContainer.radius
    });
    local v91 = v2.useMemo(function() --[[ Line: 356 ]]
        -- upvalues: v12 (ref), l_FontSize_0 (copy), v36 (copy), l_LineHeight_0 (copy)
        return v12(l_FontSize_0, v36, l_LineHeight_0);
    end, {
        l_FontSize_0, 
        v36, 
        l_LineHeight_0
    });
    local v96, v97 = v2.useMemo(function() --[[ Line: 361 ]]
        -- upvalues: v48 (copy), v55 (copy), v12 (ref), l_FontSize_0 (copy), l_LineHeight_0 (copy), v91 (copy)
        local v92 = math.round((v48.outerContainer.minHeight - v55 - v12(l_FontSize_0, 1, l_LineHeight_0)) * 2) / 2;
        local v93 = UDim.new(0, (math.floor(v92 / 2)));
        local v94 = UDim.new(0, (math.ceil(v92 / 2)));
        local v95 = v91 + math.round(v92) + v55;
        return {
            top = v93, 
            bottom = v94, 
            left = UDim.new(0, 0), 
            right = UDim.new(0, 0)
        }, v95;
    end, {
        v48.outerContainer.minHeight, 
        v55, 
        v57, 
        l_FontSize_0, 
        v91, 
        l_LineHeight_0
    });
    local v98 = v96.bottom.Offset + v96.top.Offset;
    local v99 = UDim2.new(1, 0, 0, v91 + v98);
    local v100 = v2.useMemo(function() --[[ Line: 397 ]]
        -- upvalues: v37 (copy)
        if v37 then
            return {
                FillDirection = Enum.FillDirection.Vertical, 
                ItemLineAlignment = Enum.ItemLineAlignment.Center
            };
        else
            return nil;
        end;
    end, {
        v37
    });
    local v101 = v2.useMemo(function() --[[ Line: 406 ]]
        -- upvalues: v37 (copy)
        if v37 then
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
        v37
    });
    local v110 = v2.useCallback(function(v102) --[[ Line: 417 ]]
        -- upvalues: v40 (copy), v39 (copy), v14 (ref), v96 (copy)
        local l_current_0 = v40.current;
        local l_current_1 = v39.current;
        if l_current_0 == nil or l_current_1 == nil then
            return;
        else
            local v105 = v102.TextSize * v102.LineHeight;
            local l_Y_0 = l_current_0.CanvasPosition.Y;
            l_current_1.Text = v14(v102);
            local l_Y_1 = l_current_1.TextBounds.Y;
            local v108 = l_Y_0 - v96.top.Offset + v96.bottom.Offset;
            local v109 = l_Y_0 + l_current_0.AbsoluteSize.Y - v96.top.Offset - v96.bottom.Offset;
            if l_Y_1 - v105 < v108 then
                l_current_0.CanvasPosition = l_current_0.CanvasPosition + Vector2.new(0, l_Y_1 - v105 - v108);
            end;
            if v109 < l_Y_1 then
                l_current_0.CanvasPosition = l_current_0.CanvasPosition + Vector2.new(0, l_Y_1 - v109);
            end;
            return;
        end;
    end, {
        v96
    });
    local v112 = v2.useCallback(function(v111) --[[ Line: 450 ]]
        -- upvalues: v40 (copy), v43 (copy)
        if v111 == nil then
            return;
        else
            v40.current = v111;
            v111.ClipsDescendants = true;
            v111.CanvasPosition = v43.current;
            return;
        end;
    end, {});
    local v114 = v2.useCallback(function(v113) --[[ Line: 460 ]]
        -- upvalues: v41 (copy)
        if v113 then
            v113.Text = v41.current;
            v41.current = "";
            v113:CaptureFocus();
        end;
    end, {});
    local v116 = v2.useCallback(function(v115) --[[ Line: 468 ]]
        -- upvalues: v43 (copy)
        v43.current = v115.CanvasPosition;
    end, {});
    local v117 = v2.useMemo(function() --[[ Line: 472 ]]
        -- upvalues: v34 (copy), v2 (ref), v83 (copy), v86 (copy), v89 (copy), v46 (copy)
        if not v34.onDragStarted and not v34.onDrag and not v34.onDragEnded then
            return nil;
        else
            return v2.createElement("UIDragDetector", {
                DragStyle = Enum.UIDragDetectorDragStyle.Scriptable, 
                [v2.Event.DragStart] = v83, 
                [v2.Event.DragContinue] = v86, 
                [v2.Event.DragEnd] = v89, 
                Enabled = not v46 and not v34.isDisabled
            });
        end;
    end, {
        v83, 
        v86, 
        v89, 
        v46, 
        v34.isDisabled
    });
    local v118 = v15(if v34.horizontalPadding then v34.horizontalPadding.left or UDim.new(0, 0) else UDim.new(0, 0));
    local v119 = v15(if v34.horizontalPadding then v34.horizontalPadding.right or UDim.new(0, 0) else UDim.new(0, 0));
    return v2.createElement(v7, v20(v34, {
        GroupTransparency = if v34.isDisabled then v10.DISABLED_TRANSPARENCY else nil, 
        Size = UDim2.new(1, 0, 0, v97), 
        selection = {
            Selectable = not v34.isDisabled
        }, 
        cursor = v90, 
        stroke = if not v9.FoundationTextInputAlignStrokeBehavior or v48.outerView.strokeStyle and v48.outerView.strokeThickness then {
            Color = if v9.FoundationTextInputAlignStrokeBehavior then v48.outerView.strokeStyle.Color3 else if v34.hasError then v35.Color.System.Alert.Color3 else v35.Color.Stroke.Emphasis.Color3, 
            Transparency = if v9.FoundationTextInputAlignStrokeBehavior then if v34.isDisabled then v11(v48.outerView.strokeStyle.Transparency, v8.DISABLED_TRANSPARENCY) else v48.outerView.strokeStyle.Transparency else if v34.hasError then v35.Color.System.Alert.Transparency else v46 and 0 or v35.Color.Stroke.Emphasis.Transparency, 
            Thickness = if v9.FoundationTextInputAlignStrokeBehavior then v48.outerView.strokeThickness else l_Standard_0, 
            BorderStrokePosition = if v9.FoundationTextInputAlignStrokeBehavior and (v46 or v44) then Enum.BorderStrokePosition.Center else Enum.BorderStrokePosition.Inner
        } else nil, 
        padding = {
            left = v118:map(function(v120) --[[ Line: 526 ]]
                -- upvalues: l_Standard_0 (copy)
                return UDim.new(0, l_Standard_0) + v120;
            end), 
            right = v119:map(function(v121) --[[ Line: 529 ]]
                -- upvalues: l_Standard_0 (copy)
                return UDim.new(0, l_Standard_0) + v121;
            end), 
            top = UDim.new(0, l_Standard_0), 
            bottom = UDim.new(0, l_Standard_0)
        }, 
        onActivated = if not v34.isDisabled then v62 else nil, 
        onStateChanged = v80, 
        isDisabled = v34.isDisabled, 
        backgroundStyle = {
            Color3 = v48.outerView.bgStyle.Color3, 
            Transparency = v34.backgroundGradient and 0 or v48.outerView.bgStyle.Transparency
        }, 
        stateLayer = {
            affordance = v25.None
        }, 
        tag = v48.outerView.tag, 
        testId = ("%*--outer-container"):format(v34.testId)
    }), {
        DragDetector = v117, 
        Background = v34.backgroundGradient, 
        HoverStroke = if not (not not v9.FoundationTextInputAlignStrokeBehavior or v34.isDisabled) and (v44 or v46) then v2.createElement("UIStroke", {
            Color = v35.Color.Stroke.Emphasis.Color3, 
            Transparency = v35.Color.Stroke.Emphasis.Transparency, 
            Thickness = l_Thick_0, 
            BorderStrokePosition = Enum.BorderStrokePosition.Inner, 
            BorderOffset = UDim.new(0, -v57 / 2)
        }) else nil, 
        Leading = if v34.leadingElement then v2.createElement(v7, {
            LayoutOrder = 1, 
            tag = "size-0-full auto-x", 
            testId = ("%*--leading"):format(v34.testId)
        }, v34.leadingElement) else nil, 
        TextBoxWrapper = v2.createElement(if v37 then v5 else v7, {
            LayoutOrder = 2, 
            scroll = v101, 
            layout = v100, 
            onCanvasPositionChanged = if v37 then v116 else nil, 
            scrollingFrameRef = if v37 then v112 else nil, 
            tag = "size-full fill clip"
        }, {
            TextBox = if not v51 then v2.createElement(v31, {
                text = v34.text, 
                placeholder = v34.placeholder, 
                textInputType = v34.textInputType, 
                fontStyle = l_fontStyle_0, 
                textStyle = if v9.FoundationCleanupTextInputPolyfill then nil else v58, 
                isMultiLine = v37, 
                isDisabled = v34.isDisabled, 
                ref = v38, 
                tag = ("%* data-testid=%*--textbox"):format(v49 or "", v34.testId), 
                Size = if v37 then v99 else nil, 
                automaticSize = if not (not v37 or v51) and v34.text ~= "" then Enum.AutomaticSize.Y else nil, 
                padding = v96, 
                onFocusGained = v74, 
                onFocusLost = if v37 and v53 then nil else v78, 
                onTextChanged = v73, 
                onCursorPositionChanged = if v37 then v110 else nil
            }, {
                DragDetector = v117, 
                BoundsChecker = if v37 then v2.createElement(v31, {
                    isBoundsChecker = true, 
                    fontStyle = l_fontStyle_0, 
                    textStyle = if v9.FoundationCleanupTextInputPolyfill then nil else v58, 
                    Size = UDim2.new(1, 0, 1, v98), 
                    ref = v39
                }) else nil
            }) else nil, 
            MobileTextBox = if v37 and v51 then v2.createElement(v31, {
                text = v34.text, 
                placeholder = v34.placeholder, 
                textInputType = v34.textInputType, 
                fontStyle = l_fontStyle_0, 
                textStyle = if v9.FoundationCleanupTextInputPolyfill then nil else v58, 
                isMultiLine = v37, 
                isDisabled = v34.isDisabled, 
                padding = v96, 
                ref = v114, 
                tag = ("%* data-testid=%*--mobile-textbox"):format(v49 or "", v34.testId), 
                Size = v99, 
                onFocusLost = if v37 and v53 then v78 else nil, 
                onTextChanged = v73, 
                onCursorPositionChanged = if v37 then v110 else nil
            }) else nil
        }), 
        Trailing = if v34.trailingElement then v2.createElement(v7, {
            LayoutOrder = 3, 
            tag = "size-0-full auto-x", 
            testId = ("%*--trailing"):format(v34.testId)
        }, v34.trailingElement) else nil
    });
end));