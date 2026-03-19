local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_2.Cryo);
local v6 = require(l_Parent_2.t);
local v7 = require(l_Parent_2.RoactGamepad);
local v8 = require(l_Parent_0.ImageSet.ImageSetComponent);
local v9 = require(l_Parent_1.App.SelectionCursor.useCursorByType);
local v10 = require(l_Parent_1.App.SelectionCursor.CursorType);
local v11 = require(l_Parent_1.Utility.lerp);
local v12 = require(l_Parent_1.App.SelectionImage.withSelectionCursorProvider);
local v13 = v4.PureComponent:extend("GenericSlider");
v13.validateProps = v6.strictInterface({
    lowerValue = v6.number, 
    upperValue = v6.optional(v6.number), 
    min = v6.number, 
    max = v6.number, 
    stepInterval = v6.numberPositive, 
    isDisabled = v6.optional(v6.boolean), 
    onValueChanged = v6.callback, 
    onDragStartLower = v6.optional(v6.callback), 
    onDragStartUpper = v6.optional(v6.callback), 
    onDragEnd = v6.optional(v6.callback), 
    trackImage = v6.union(v6.string, v6.table), 
    trackColor = v6.union(v6.Color3, v6.table), 
    trackTransparency = v6.union(v6.number, v6.table), 
    trackSliceCenter = v6.optional(v6.Rect), 
    trackFillImage = v6.union(v6.string, v6.table), 
    trackFillColor = v6.union(v6.Color3, v6.table), 
    trackFillTransparency = v6.union(v6.number, v6.table), 
    trackFillSliceCenter = v6.optional(v6.Rect), 
    knobImage = v6.union(v6.string, v6.table), 
    knobColorLower = v6.union(v6.Color3, v6.table), 
    knobColorUpper = v6.optional(v6.union(v6.Color3, v6.table)), 
    knobTransparency = v6.union(v6.number, v6.table), 
    knobImagePadding = v6.optional(v6.numberMin(0)), 
    knobShadowImage = v6.union(v6.string, v6.table), 
    knobShadowTransparencyLower = v6.union(v6.number, v6.table), 
    knobShadowTransparencyUpper = v6.optional(v6.union(v6.number, v6.table)), 
    width = v6.optional(v6.UDim), 
    position = v6.optional(v6.UDim2), 
    anchorPoint = v6.optional(v6.Vector2), 
    layoutOrder = v6.optional(v6.integer), 
    imageButtonRef = v6.optional(v6.table), 
    NextSelectionUp = v6.optional(v6.table), 
    NextSelectionDown = v6.optional(v6.table), 
    focusController = v6.optional(v6.table), 
    containerRef = v6.optional(v6.table), 
    customTrack = v6.optional(v6.table), 
    customKnobHeight = v6.optional(v6.number), 
    customKnobBorderColor = v6.optional(v6.Color3), 
    customKnobBorderSize = v6.optional(v6.number), 
    selectedCursor = v6.table, 
    unselectedCursor = v6.table
});
v13.defaultProps = {
    width = UDim.new(1, 0), 
    knobImagePadding = 0, 
    customKnobBorderColor = Color3.new(0, 0, 0)
};
v13.init = function(v14) --[[ Line: 103 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy)
    v14.rootRef = v14.props.imageButtonRef or v4.createRef();
    v14.lowerKnobRef = v4.createRef();
    v14.upperKnobRef = v4.createRef();
    v14.moveDirection = 0;
    v14.lowerKnobDrag = false;
    v14.upperKnobDrag = false;
    v14.totalMoveTime = 0;
    v14.isFirstMove = true;
    v14.unhandledTime = 0;
    v14.state = {
        lowerKnobIsSelected = false, 
        upperKnobIsSelected = false
    };
end;
v13.getKnobVisibleHeight = function(v15) --[[ Line: 121 ]] --[[ Name: getKnobVisibleHeight ]]
    if v15.props.customKnobHeight then
        return (44 - v15.props.knobImagePadding * 2) / 44 * v15.props.customKnobHeight;
    else
        return 44 - v15.props.knobImagePadding * 2;
    end;
end;
v13.getKnobHeight = function(v16) --[[ Line: 130 ]] --[[ Name: getKnobHeight ]]
    if v16.props.customKnobHeight then
        return 44 / (44 - v16.props.knobImagePadding * 2) * v16.props.customKnobHeight;
    else
        return 44;
    end;
end;
v13.onMoveStep = function(v17, v18, v19) --[[ Line: 140 ]] --[[ Name: onMoveStep ]]
    if not v17.state.lowerKnobIsSelected and not v17.state.upperKnobIsSelected then
        return;
    else
        local l_Position_0 = v18[Enum.KeyCode.Thumbstick1].Position;
        local v21 = l_Position_0.Magnitude > 0.2;
        local v22 = 0;
        local v23 = nil;
        local v24 = nil;
        local v25 = nil;
        v17.totalMoveTime = v17.totalMoveTime + v19;
        if v21 then
            v24 = l_Position_0.x > 0 and 1 or -1;
            v23 = 0.2;
            v25 = 12;
        else
            v24 = (v18[Enum.KeyCode.DPadLeft].UserInputState == Enum.UserInputState.Begin and -1 or 0) + (v18[Enum.KeyCode.DPadRight].UserInputState == Enum.UserInputState.Begin and 1 or 0);
            v23 = 0.5;
            v25 = 8;
        end;
        if v24 ~= 0 then
            if v17.isFirstMove then
                v17.isFirstMove = false;
                v17.totalMoveTime = 0;
                v17.unhandledTime = 0;
                v22 = 1;
            elseif v23 < v17.totalMoveTime then
                local v26 = v19 - math.max(v23 - v17.totalMoveTime - v19, 0) + v17.unhandledTime;
                v22 = math.floor(v25 * v26);
                v17.unhandledTime = v26 - v22 / v25;
            else
                v22 = 0;
                v17.unhandledTime = 0;
            end;
        else
            v17.totalMoveTime = 0;
            v17.isFirstMove = true;
        end;
        if v22 > 0 then
            v17:processGamepadInput(v24, v22);
        end;
        return;
    end;
end;
v13.processGamepadInput = function(v27, v28, v29) --[[ Line: 194 ]] --[[ Name: processGamepadInput ]]
    if v27:hasTwoKnobs() then
        v27:processTwoKnobGamepadInput(v28, v29);
        return;
    else
        v27:processOneKnobGamepadInput(v28, v29);
        return;
    end;
end;
v13.processTwoKnobGamepadInput = function(v30, v31, v32) --[[ Line: 202 ]] --[[ Name: processTwoKnobGamepadInput ]]
    local v33 = v30.props.stepInterval * v31;
    local l_lowerValue_0 = v30.props.lowerValue;
    local l_upperValue_0 = v30.props.upperValue;
    if l_lowerValue_0 == l_upperValue_0 and not v30.state.processingGamepad then
        if v30.state.lowerKnobIsSelected and v31 == 1 and l_lowerValue_0 ~= v30.props.max then
            v30:setState({
                lowerKnobIsSelected = false, 
                upperKnobIsSelected = true, 
                processingGamepad = true
            });
            v30.props.focusController.moveFocusTo(v30.upperKnobRef);
        elseif v30.state.upperKnobIsSelected and v31 == -1 and l_upperValue_0 ~= v30.props.min then
            v30:setState({
                lowerKnobIsSelected = true, 
                upperKnobIsSelected = false, 
                processingGamepad = true
            });
            v30.props.focusController.moveFocusTo(v30.lowerKnobRef);
        end;
    elseif not v30.state.processingGamepad then
        v30:setState({
            processingGamepad = true
        });
    end;
    if v30.state.lowerKnobIsSelected then
        local v36 = math.max(math.min(l_lowerValue_0 + v33 * v32, v30.props.max), v30.props.min);
        l_lowerValue_0 = if v36 <= l_upperValue_0 then v36 else l_upperValue_0;
    elseif v30.state.upperKnobIsSelected then
        local v37 = math.max(math.min(l_upperValue_0 + v33 * v32, v30.props.max), v30.props.min);
        l_upperValue_0 = if l_lowerValue_0 <= v37 then v37 else l_lowerValue_0;
    end;
    if l_upperValue_0 ~= v30.props.upperValue or l_lowerValue_0 ~= v30.props.lowerValue then
        v30.props.onValueChanged(l_lowerValue_0, l_upperValue_0);
    end;
end;
v13.processOneKnobGamepadInput = function(v38, v39, v40) --[[ Line: 256 ]] --[[ Name: processOneKnobGamepadInput ]]
    local v41 = v38.props.stepInterval * v39;
    local l_lowerValue_1 = v38.props.lowerValue;
    if v38.state.lowerKnobIsSelected then
        l_lowerValue_1 = math.max(math.min(l_lowerValue_1 + v41 * v40, v38.props.max), v38.props.min);
    end;
    if l_lowerValue_1 ~= v38.props.lowerValue then
        v38.props.onValueChanged(l_lowerValue_1);
    end;
end;
v13.renderTrack = function(v43, v44, v45, v46) --[[ Line: 269 ]] --[[ Name: renderTrack ]]
    -- upvalues: v4 (copy), v8 (copy)
    if v43.props.customTrack then
        return v43.props.customTrack;
    else
        return v4.createElement(v8.Label, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            ImageColor3 = v43.props.trackColor, 
            ImageTransparency = v43.props.trackTransparency, 
            Image = v43.props.trackImage, 
            Size = UDim2.new(1, 0, 0, 4), 
            Position = UDim2.fromScale(0.5, 0.5), 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v43.props.trackSliceCenter
        }, {
            TrackFill = v4.createElement(v8.Label, {
                BackgroundTransparency = 1, 
                ImageColor3 = v43.props.trackFillColor, 
                ImageTransparency = v43.props.trackFillTransparency, 
                Image = v43.props.trackFillImage, 
                Size = v44, 
                Position = v45 and UDim2.new(v46, 0, 0, 0) or UDim2.new(0, 0, 0, 0), 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v43.props.trackFillSliceCenter
            })
        });
    end;
end;
v13.wrapKnobWithBorder = function(v47, v48, v49) --[[ Line: 298 ]] --[[ Name: wrapKnobWithBorder ]]
    -- upvalues: v4 (copy)
    local v50 = if v47.props.customKnobHeight then v47.props.customKnobHeight else v47:getKnobVisibleHeight();
    return v4.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.fromOffset(v50, v50), 
        Position = v49, 
        BackgroundColor3 = v47.props.customKnobBorderColor, 
        ZIndex = 3
    }, {
        UICorner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }), 
        KnobContent = v48
    });
end;
v13.renderUpperKnob = function(v51, v52, v53, v54, _) --[[ Line: 315 ]] --[[ Name: renderUpperKnob ]]
    -- upvalues: v4 (copy), v7 (copy), v8 (copy)
    if not v54 then
        return nil;
    else
        local v56 = v51:getKnobHeight();
        local l_v52_0 = v52;
        if v51.props.customKnobBorderSize and v51.props.customKnobBorderSize > 0 then
            v56 = v56 - 2 * (v51.props.customKnobBorderSize + 2);
            l_v52_0 = UDim2.fromScale(0.5, 0.5);
        end;
        local v63 = v4.createElement(v7.Focusable[v8.Button], {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            ImageColor3 = v51.props.knobColorUpper, 
            ImageTransparency = v51.props.knobTransparency, 
            Image = v51.props.knobImage, 
            Size = UDim2.fromOffset(v56, v56), 
            Position = l_v52_0, 
            ZIndex = 3, 
            NextSelectionLeft = not v53 and v51.props.upperValue ~= v51.props.lowerValue and v51.lowerKnobRef or nil, 
            NextSelectionRight = v53 and v51.upperKnobRef or nil, 
            NextSelectionUp = v53 and v51.upperKnobRef or nil, 
            NextSelectionDown = v53 and v51.upperKnobRef or nil, 
            SelectionImageObject = v53 and v51.props.selectedCursor or v51.props.unselectedCursor, 
            [v4.Ref] = v51.upperKnobRef, 
            [v4.Event.InputBegan] = function(_, v59) --[[ Line: 345 ]]
                -- upvalues: v51 (copy)
                if v51.props.isDisabled then
                    return;
                else
                    v51:onInputBegan(v59, true);
                    return;
                end;
            end, 
            inputBindings = {
                OnMoveStep = v7.Input.onMoveStep(function(v60, v61) --[[ Line: 353 ]]
                    -- upvalues: v51 (copy)
                    v51:onMoveStep(v60, v61);
                end), 
                SelectUpperKnob = v7.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 356 ]]
                    -- upvalues: v51 (copy)
                    v51:setState(function(v62) --[[ Line: 357 ]]
                        return {
                            upperKnobIsSelected = not v62.upperKnobIsSelected, 
                            processingGamepad = false
                        };
                    end);
                end), 
                UnselectUpperKnob = v53 and v7.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 364 ]]
                    -- upvalues: v51 (copy)
                    v51:setState({
                        upperKnobIsSelected = false, 
                        processingGamepad = false
                    });
                end) or nil
            }
        });
        if v51.props.customKnobBorderSize and v51.props.customKnobBorderSize > 0 then
            return v51:wrapKnobWithBorder(v63, v52);
        else
            return v63;
        end;
    end;
end;
v13.renderLowerKnob = function(v64, v65, v66, v67, _) --[[ Line: 380 ]] --[[ Name: renderLowerKnob ]]
    -- upvalues: v4 (copy), v7 (copy), v8 (copy)
    local v69 = v64:getKnobHeight();
    local l_v65_0 = v65;
    if v64.props.customKnobBorderSize and v64.props.customKnobBorderSize > 0 then
        v69 = v69 - 2 * (v64.props.customKnobBorderSize + 2);
        l_v65_0 = UDim2.fromScale(0.5, 0.5);
    end;
    local v76 = v4.createElement(v7.Focusable[v8.Button], {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        ImageColor3 = v64.props.knobColorLower, 
        ImageTransparency = v64.props.knobTransparency, 
        Image = v64.props.knobImage, 
        Size = UDim2.fromOffset(v69, v69), 
        Position = l_v65_0, 
        ZIndex = 3, 
        inputBindings = {
            OnMoveStep = v7.Input.onMoveStep(function(v71, v72) --[[ Line: 398 ]]
                -- upvalues: v64 (copy)
                v64:onMoveStep(v71, v72);
            end), 
            SelectLowerKnob = v7.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 401 ]]
                -- upvalues: v64 (copy)
                v64:setState(function(v73) --[[ Line: 402 ]]
                    return {
                        lowerKnobIsSelected = not v73.lowerKnobIsSelected, 
                        processingGamepad = false
                    };
                end);
            end), 
            UnselectLowerKnob = v66 and v7.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 409 ]]
                -- upvalues: v64 (copy)
                v64:setState({
                    lowerKnobIsSelected = false, 
                    processingGamepad = false
                });
            end) or nil
        }, 
        NextSelectionLeft = v66 and v64.lowerKnobRef or nil, 
        NextSelectionRight = not (not v67 or v66) and v64.props.upperValue ~= v64.props.lowerValue and v64.upperKnobRef or nil, 
        NextSelectionUp = v66 and v64.lowerKnobRef or nil, 
        NextSelectionDown = v66 and v64.lowerKnobRef or nil, 
        SelectionImageObject = v66 and v64.props.selectedCursor or v64.props.unselectedCursor, 
        [v4.Ref] = v64.lowerKnobRef, 
        [v4.Event.InputBegan] = function(_, v75) --[[ Line: 424 ]]
            -- upvalues: v64 (copy)
            if v64.props.isDisabled then
                return;
            else
                v64:onInputBegan(v75, true);
                return;
            end;
        end
    });
    if v64.props.customKnobBorderSize and v64.props.customKnobBorderSize > 0 then
        return v64:wrapKnobWithBorder(v76, v65);
    else
        return v76;
    end;
end;
v13.renderKnobShadow = function(v77, v78, v79) --[[ Line: 440 ]] --[[ Name: renderKnobShadow ]]
    -- upvalues: v4 (copy), v8 (copy)
    return v4.createElement(v8.Label, {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        ImageTransparency = v78, 
        Image = v77.props.knobShadowImage, 
        Size = UDim2.fromOffset(v77:getKnobHeight(), v77:getKnobHeight()), 
        Position = v79, 
        ZIndex = 2
    });
end;
v13.render = function(v80) --[[ Line: 452 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v12 (copy), v4 (copy), v7 (copy), v8 (copy)
    local v81 = v80.state.lowerKnobIsSelected or v80.state.upperKnobIsSelected;
    local v82 = v80:hasTwoKnobs();
    local v83 = (v80.props.lowerValue - v80.props.min) / (v80.props.max - v80.props.min);
    local v84 = v82 and (v80.props.upperValue - v80.props.min) / (v80.props.max - v80.props.min) or nil;
    local v85 = v80:getKnobVisibleHeight();
    local v86 = v11(v85 / 2, -v85 / 2, v83);
    local v87 = v82 and v11(v85 / 2, -v85 / 2, v84) or nil;
    local v88 = UDim2.new(v83, v86, 0.5, 0);
    local v89 = v82 and UDim2.new(v84, v87, 0.5, 0) or nil;
    local v90 = v82 and UDim2.fromScale(v84 - v83, 1) or UDim2.fromScale(v83, 1);
    local v91 = v80.state.lowerKnobIsSelected or v80.state.upperKnobIsSelected;
    return v12(function(v92) --[[ Line: 467 ]]
        -- upvalues: v4 (ref), v7 (ref), v8 (ref), v80 (copy), v91 (copy), v90 (copy), v82 (copy), v83 (copy), v88 (copy), v81 (copy), v89 (copy)
        return v4.createElement(v7.Focusable[v8.Button], {
            BackgroundTransparency = 1, 
            AnchorPoint = v80.props.anchorPoint, 
            Size = UDim2.new(v80.props.width.Scale, v80.props.width.Offset, 0, 36), 
            LayoutOrder = v80.props.layoutOrder, 
            Position = v80.props.position, 
            [v4.Event.InputBegan] = function(_, v94) --[[ Line: 474 ]]
                -- upvalues: v80 (ref)
                if v80.props.isDisabled then
                    return;
                else
                    v80:onInputBegan(v94, false);
                    return;
                end;
            end, 
            [v4.Ref] = v80.rootRef, 
            NextSelectionLeft = v91 and v80.rootRef or nil, 
            NextSelectionRight = v91 and v80.rootRef or nil, 
            NextSelectionUp = not v91 and v80.props.NextSelectionUp or v80.rootRef, 
            NextSelectionDown = not v91 and v80.props.NextSelectionDown or v80.rootRef, 
            defaultChild = v80.props.upperValue ~= v80.props.min and v80.lowerKnobRef or v80.upperKnobRef or nil, 
            onFocusLost = function() --[[ Line: 491 ]] --[[ Name: onFocusLost ]]
                -- upvalues: v80 (ref)
                if v80.state.lowerKnobIsSelected or v80.state.upperKnobIsSelected then
                    v80:setState({
                        lowerKnobIsSelected = false, 
                        upperKnobIsSelected = false
                    });
                end;
            end
        }, {
            Track = v80:renderTrack(v90, v82, v83), 
            LowerKnob = v80:renderLowerKnob(v88, v81, v82, v92), 
            LowerKnobShadow = v80:renderKnobShadow(v80.props.knobShadowTransparencyLower, v88), 
            UpperKnob = v80:renderUpperKnob(v89, v81, v82, v92), 
            UpperKnobShadow = v82 and v80:renderKnobShadow(v80.props.knobShadowTransparencyUpper, v89) or nil
        });
    end);
end;
v13.didMount = function(v95) --[[ Line: 511 ]] --[[ Name: didMount ]]
    local l_current_0 = v95.rootRef.current;
    local v97 = nil;
    local function v98() --[[ Line: 519 ]] --[[ Name: checkAncestry ]]
        -- upvalues: l_current_0 (copy), v97 (ref), v95 (copy)
        if not l_current_0:IsDescendantOf(game) then
            return;
        else
            v97:Disconnect();
            v95.canUseUserInputService = l_current_0:FindFirstAncestorWhichIsA("PluginGui") == nil;
            return;
        end;
    end;
    v97 = l_current_0.AncestryChanged:Connect(v98);
    if l_current_0:IsDescendantOf(game) then
        v97:Disconnect();
        v95.canUseUserInputService = l_current_0:FindFirstAncestorWhichIsA("PluginGui") == nil;
    end;
end;
v13.didUpdate = function(v99, _, v101) --[[ Line: 537 ]] --[[ Name: didUpdate ]]
    if v99.props.disabled then
        v99:stopListeningForDrag();
    end;
    local v102 = v101.lowerKnobIsSelected and not v99.state.lowerKnobIsSelected;
    local v103 = v101.upperKnobIsSelected and not v99.state.upperKnobIsSelected;
    if v99.props.onDragEnd ~= nil and (v102 or v103) then
        v99.props.onDragEnd();
        return;
    elseif v99.props.onDragStartLower ~= nil and not v101.lowerKnobIsSelected and v99.state.lowerKnobIsSelected then
        v99.props.onDragStartLower();
        return;
    else
        if v99.props.onDragStartUpper ~= nil and not v101.upperKnobIsSelected and v99.state.upperKnobIsSelected then
            v99.props.onDragStartUpper();
        end;
        return;
    end;
end;
v13.willUnmount = function(v104) --[[ Line: 560 ]] --[[ Name: willUnmount ]]
    v104:stopListeningForDrag();
end;
v13.onInputBegan = function(v105, v106, v107) --[[ Line: 564 ]] --[[ Name: onInputBegan ]]
    if v105.props.disabled then
        return;
    elseif v106.UserInputState ~= Enum.UserInputState.Begin then
        return;
    else
        local l_UserInputType_0 = v106.UserInputType;
        if l_UserInputType_0 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_0 ~= Enum.UserInputType.Touch then
            return;
        elseif l_UserInputType_0 == Enum.UserInputType.Touch and not v107 then
            return;
        else
            v105:processDrag(v106.Position.X);
            v105:startListeningForDrag();
            return;
        end;
    end;
end;
v13.startListeningForDrag = function(v109) --[[ Line: 588 ]] --[[ Name: startListeningForDrag ]]
    -- upvalues: l_UserInputService_0 (copy)
    local l_current_1 = v109.rootRef.current;
    if l_current_1 == nil then
        return;
    elseif v109.dragging then
        return;
    else
        if v109.canUseUserInputService then
            local function v113(v111) --[[ Line: 603 ]]
                -- upvalues: v109 (copy)
                if not v109.dragging then
                    return;
                else
                    local l_UserInputType_1 = v111.UserInputType;
                    if l_UserInputType_1 ~= Enum.UserInputType.MouseMovement and l_UserInputType_1 ~= Enum.UserInputType.Touch then
                        return;
                    elseif v111.UserInputState ~= Enum.UserInputState.Change then
                        return;
                    else
                        v109:processDrag(v111.Position.X);
                        return;
                    end;
                end;
            end;
            if v109.props.containerRef then
                v109.moveConnection = v109.props.containerRef.current.InputChanged:Connect(v113);
            else
                v109.moveConnection = l_UserInputService_0.InputChanged:Connect(v113);
            end;
            v109.releaseConnection = l_UserInputService_0.InputEnded:Connect(function(v114) --[[ Line: 632 ]]
                -- upvalues: v109 (copy)
                local l_UserInputType_2 = v114.UserInputType;
                if l_UserInputType_2 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_2 ~= Enum.UserInputType.Touch then
                    return;
                else
                    v109:stopListeningForDrag();
                    if not v109.props.containerRef then
                        v109:processOneKnobDrag(v114.Position.X);
                    end;
                    return;
                end;
            end);
            v109.focusLostConnection = l_UserInputService_0.WindowFocusReleased:Connect(function() --[[ Line: 655 ]]
                -- upvalues: v109 (copy)
                v109:stopListeningForDrag();
            end);
        else
            local l_l_current_1_FirstAncestorWhichIsA_0 = l_current_1:FindFirstAncestorWhichIsA("PluginGui");
            local l_ImageButton_0 = Instance.new("ImageButton");
            l_ImageButton_0.BackgroundTransparency = 1;
            l_ImageButton_0.Image = "";
            l_ImageButton_0.Name = "SliderPluginGuiInputCapturer";
            l_ImageButton_0.Size = UDim2.new(1, 0, 1, 0);
            l_ImageButton_0.ZIndex = 100000;
            v109.moveConnection = l_ImageButton_0.MouseMoved:Connect(function(v118) --[[ Line: 675 ]]
                -- upvalues: v109 (copy)
                v109:processDrag(v118);
            end);
            v109.releaseConnection = l_ImageButton_0.MouseButton1Up:Connect(function(v119) --[[ Line: 679 ]]
                -- upvalues: v109 (copy)
                v109:stopListeningForDrag();
                v109:processOneKnobDrag(v119);
            end);
            v109.focusLostConnection = l_ImageButton_0.MouseLeave:Connect(function(v120) --[[ Line: 684 ]]
                -- upvalues: v109 (copy)
                v109:stopListeningForDrag();
                v109:processOneKnobDrag(v120);
            end);
            l_ImageButton_0.Parent = l_l_current_1_FirstAncestorWhichIsA_0;
            v109.inputCapturerButton = l_ImageButton_0;
        end;
        v109.dragging = true;
        if v109.lowerKnobDrag and v109.props.onDragStartLower ~= nil then
            v109.props.onDragStartLower();
        end;
        if v109.upperKnobDrag and v109.props.onDragStartUpper ~= nil then
            v109.props.onDragStartUpper();
        end;
        return;
    end;
end;
v13.getSteppedValue = function(v121, v122) --[[ Line: 704 ]] --[[ Name: getSteppedValue ]]
    local l_current_2 = v121.rootRef.current;
    if l_current_2 == nil then
        return 0;
    else
        local l_min_0 = v121.props.min;
        local l_max_0 = v121.props.max;
        local l_stepInterval_0 = v121.props.stepInterval;
        local l_X_0 = l_current_2.AbsoluteSize.X;
        return math.floor((math.clamp(v122 - l_current_2.AbsolutePosition.X, 0, l_X_0) / l_X_0 * (l_max_0 - l_min_0) + l_min_0) / l_stepInterval_0 + 0.5) * l_stepInterval_0;
    end;
end;
v13.processDrag = function(v128, v129) --[[ Line: 722 ]] --[[ Name: processDrag ]]
    if v128:hasTwoKnobs() then
        v128:processTwoKnobDrag(v129);
        return;
    else
        v128:processOneKnobDrag(v129);
        return;
    end;
end;
v13.processOneKnobDrag = function(v130, v131) --[[ Line: 730 ]] --[[ Name: processOneKnobDrag ]]
    if v130:hasTwoKnobs() then
        return;
    else
        local v132 = v130:getSteppedValue(v131);
        v130.lowerKnobDrag = true;
        if v132 ~= v130.props.lowerValue then
            v130.props.onValueChanged(v132);
        end;
        return;
    end;
end;
v13.processTwoKnobDrag = function(v133, v134) --[[ Line: 743 ]] --[[ Name: processTwoKnobDrag ]]
    local v135 = v133:getSteppedValue(v134);
    local l_lowerValue_2 = v133.props.lowerValue;
    local l_upperValue_1 = v133.props.upperValue;
    if not v133.lowerKnobDrag and not v133.upperKnobDrag then
        if v135 == l_lowerValue_2 then
            v133.lowerKnobDrag = true;
        end;
        if v135 == l_upperValue_1 then
            v133.upperKnobDrag = true;
        end;
    elseif v133.lowerKnobDrag and v133.upperKnobDrag then
        if l_upperValue_1 <= v135 - v133.props.stepInterval then
            v133.upperKnobDrag = true;
            v133.lowerKnobDrag = false;
            l_upperValue_1 = v135;
        elseif v135 + v133.props.stepInterval <= l_lowerValue_2 then
            v133.upperKnobDrag = false;
            v133.lowerKnobDrag = true;
            l_lowerValue_2 = v135;
        end;
    elseif v133.lowerKnobDrag then
        if v135 <= l_upperValue_1 then
            l_lowerValue_2 = v135;
        end;
    elseif v133.upperKnobDrag and l_lowerValue_2 <= v135 then
        l_upperValue_1 = v135;
    end;
    if l_upperValue_1 ~= v133.props.upperValue or l_lowerValue_2 ~= v133.props.lowerValue then
        v133.props.onValueChanged(l_lowerValue_2, l_upperValue_1);
    end;
end;
v13.stopListeningForDrag = function(v138) --[[ Line: 784 ]] --[[ Name: stopListeningForDrag ]]
    if v138.moveConnection ~= nil then
        v138.moveConnection:Disconnect();
        v138.moveConnection = nil;
    end;
    if v138.releaseConnection ~= nil then
        v138.releaseConnection:Disconnect();
        v138.releaseConnection = nil;
    end;
    if v138.focusLostConnection ~= nil then
        v138.focusLostConnection:Disconnect();
        v138.focusLostConnection = nil;
    end;
    if v138.inputCapturerButton ~= nil then
        v138.inputCapturerButton:Destroy();
        v138.inputCapturerButton = nil;
    end;
    v138.dragging = false;
    v138.lowerKnobDrag = false;
    v138.upperKnobDrag = false;
    if v138.props.onDragEnd ~= nil then
        v138.props.onDragEnd();
    end;
end;
v13.hasTwoKnobs = function(v139) --[[ Line: 814 ]] --[[ Name: hasTwoKnobs ]]
    return v139.props.upperValue ~= nil;
end;
return v4.forwardRef(function(v140, v141) --[[ Line: 818 ]]
    -- upvalues: v9 (copy), v10 (copy), v5 (copy), v4 (copy), v13 (copy)
    local v142 = v9(v10.SelectedKnob);
    local v143 = v9(v10.UnselectedKnob);
    v140 = v5.Dictionary.join(v140, {
        selectedCursor = v142, 
        unselectedCursor = v143
    });
    return v4.createElement(v13, v5.Dictionary.join(v140, {
        imageButtonRef = v141
    }));
end);