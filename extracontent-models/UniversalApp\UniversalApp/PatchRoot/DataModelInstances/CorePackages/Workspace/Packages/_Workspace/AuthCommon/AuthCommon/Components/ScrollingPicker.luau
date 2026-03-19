local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.Cryo);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v5 = require(l_script_FirstAncestor_0.Enums.ScrollingPickerDirection);
local v6 = require(l_Parent_0.Otter);
local v7 = require(l_script_FirstAncestor_0.Components.FitChildren);
local v8 = {
    [v5.Horizontal] = "X", 
    [v5.Vertical] = "Y"
};
local v9 = {
    [v5.Horizontal] = "Y", 
    [v5.Vertical] = "X"
};
local v10 = game:DefineFastFlag("UseAccumulationStepperForMouseWheelScrollPicker", false);
local v11 = game:DefineFastInt("ScrollingPickerSlowScrollStepWaitMs", 100);
local v12 = game:DefineFastInt("ScrollingPickerMaximumPickerChangePerInput", 1);
local v13 = game:DefineFastInt("ScrollingPickerSmallInputDecayFactor", 3);
local v14 = game:DefineFastFlag("ExpandScrollPickerTapTarget", false);
local v15 = {
    spring = "spring", 
    instant = "instant"
};
local v16 = v2.PureComponent:extend("ScrollingPicker");
v16.MOUSE_WHEEL_STEP_THRESHOLD = 0.1;
v16.defaultProps = {
    layoutOrder = 0, 
    parentSpecifiedTarget = 1, 
    entries = {}, 
    entrySizeOnScrollingAxis = 10, 
    scrollDirection = v5.Vertical, 
    clipsDescendants = true, 
    shouldExpandTapTarget = false, 
    tapTargetExpansionSize = 0
};
local v19 = setmetatable({
    [Enum.UserInputType.MouseButton1] = true, 
    [Enum.UserInputType.Touch] = true
}, {
    __index = function(_, _) --[[ Line: 82 ]] --[[ Name: __index ]]
        return false;
    end
});
v16.init = function(v20) --[[ Line: 87 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy), v9 (copy), v2 (copy), v14 (copy), v15 (copy), v6 (copy), v19 (copy), v12 (copy), v16 (copy), v13 (copy), v10 (copy), v11 (copy)
    local l_parentSpecifiedTarget_0 = v20.props.parentSpecifiedTarget;
    local l_scrollDirection_0 = v20.props.scrollDirection;
    local l_shouldExpandTapTarget_0 = v20.props.shouldExpandTapTarget;
    v20.state = {
        scrollDirection = l_scrollDirection_0, 
        scrollingAxis = v8[l_scrollDirection_0], 
        subAxis = v9[l_scrollDirection_0]
    };
    v20.isMounted = false;
    v20.currentIndex = 1;
    v20.targetEntryRef = v2.createRef();
    v20.targetIndex = l_parentSpecifiedTarget_0;
    v20.isEntrySelected = false;
    v20.isTargetIndexSetByUserInput = false;
    v20.timeInputBegan = tick();
    v20.recognizedInputBegan = false;
    v20.inputChanged = false;
    v20.inputPositionAtInputBegan = 0;
    v20.inputPreviousPositionScrollingAxis = 0;
    v20.scrollRef = v2.createRef();
    v20.shouldExpandTapTarget = v14 and l_shouldExpandTapTarget_0;
    v20.tapTargetExpansionSize = v20.props.tapTargetExpansionSize;
    v20.scrollDeltaAccumulator = 0;
    v20.getCenterIndexByPosition = function(v24) --[[ Line: 136 ]]
        -- upvalues: v20 (copy)
        local l_entrySizeOnScrollingAxis_0 = v20.props.entrySizeOnScrollingAxis;
        return math.floor(-v24 / l_entrySizeOnScrollingAxis_0) + 1;
    end;
    v20.getCenterIndexByScrollPosition = function(v26) --[[ Line: 142 ]]
        -- upvalues: v20 (copy)
        v26 = v26 - v20.props.entrySizeOnScrollingAxis / 2;
        return v20.getCenterIndexByPosition(v26);
    end;
    v20.updateParent = function() --[[ Line: 153 ]]
        -- upvalues: v20 (copy)
        local l_onCurrentIndexChanged_0 = v20.props.onCurrentIndexChanged;
        local l_onSelectedIndexChanged_0 = v20.props.onSelectedIndexChanged;
        if l_onCurrentIndexChanged_0 then
            l_onCurrentIndexChanged_0(v20.currentIndex);
        end;
        if l_onSelectedIndexChanged_0 and v20.currentIndex == v20.targetIndex then
            l_onSelectedIndexChanged_0(v20.currentIndex, v20.isTargetIndexSetByUserInput);
        end;
    end;
    v20.onScrollPositionChanged = function() --[[ Line: 166 ]]
        -- upvalues: v20 (copy)
        if v20.scrollRef.current then
            local l_scrollingAxis_0 = v20.state.scrollingAxis;
            local l_Offset_0 = v20.scrollRef.current.Position[l_scrollingAxis_0].Offset;
            local v31 = v20.getCenterIndexByScrollPosition(l_Offset_0);
            if v31 ~= v20.currentIndex then
                v20.currentIndex = v31;
                v20.updateParent();
            end;
        end;
    end;
    v20.updateTargetIndex = function(v32) --[[ Line: 181 ]]
        -- upvalues: v15 (ref), v20 (copy), v6 (ref)
        local l_newTargetIndex_0 = v32.newTargetIndex;
        local l_isSetByUserInput_0 = v32.isSetByUserInput;
        local l_otterAnimationType_0 = v32.otterAnimationType;
        if l_otterAnimationType_0 == nil then
            l_otterAnimationType_0 = v15.spring;
        end;
        local l_entries_0 = v20.props.entries;
        local l_entrySizeOnScrollingAxis_1 = v20.props.entrySizeOnScrollingAxis;
        v20.targetIndex = #l_entries_0 < 1 and 0 or math.clamp(l_newTargetIndex_0, 1, #l_entries_0);
        v20.isTargetIndexSetByUserInput = l_isSetByUserInput_0;
        v20.motor:setGoal(v6[l_otterAnimationType_0](-(l_entrySizeOnScrollingAxis_1 * (v20.targetIndex - 1)), {
            frequency = 2
        }));
        if v20.currentIndex == v20.targetIndex then
            v20.updateParent();
        end;
    end;
    v20.updateIndexByInputPosition = function(v38) --[[ Line: 215 ]]
        -- upvalues: v20 (copy)
        if v20.scrollRef.current then
            local l_scrollingAxis_1 = v20.state.scrollingAxis;
            local l_AbsolutePosition_0 = v20.scrollRef.current.AbsolutePosition;
            local l_AbsoluteSize_0 = v20.scrollRef.current.AbsoluteSize;
            local l_entrySizeOnScrollingAxis_2 = v20.props.entrySizeOnScrollingAxis;
            local v43 = 0;
            v43 = if v38.X > l_AbsolutePosition_0.X and v38.X < l_AbsolutePosition_0.X + l_AbsoluteSize_0.X and v38.Y > l_AbsolutePosition_0.Y and v38.Y < l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y then l_AbsolutePosition_0[l_scrollingAxis_1] - v38[l_scrollingAxis_1] else -(v20.targetIndex - 1) * l_entrySizeOnScrollingAxis_2;
            local v44 = v20.getCenterIndexByPosition(v43);
            v20.updateTargetIndex({
                newTargetIndex = v44, 
                isSetByUserInput = true
            });
        end;
    end;
    v20.updateIndexByScrollPositionAndOffset = function(v45) --[[ Line: 246 ]]
        -- upvalues: v20 (copy)
        v45 = v45 or 0;
        if v20.scrollRef.current then
            local l_scrollingAxis_2 = v20.state.scrollingAxis;
            local v47 = v20.scrollRef.current.Position[l_scrollingAxis_2].Offset + v45;
            local v48 = v20.getCenterIndexByScrollPosition(v47);
            v20.updateTargetIndex({
                newTargetIndex = v48, 
                isSetByUserInput = true
            });
        end;
    end;
    v20.onInputBegan = function(_, v50) --[[ Line: 265 ]]
        -- upvalues: v20 (copy), v19 (ref)
        local l_entries_1 = v20.props.entries;
        local l_scrollingAxis_3 = v20.state.scrollingAxis;
        if v20.isMounted and v19[v50.UserInputType] and #l_entries_1 > 0 and v50.UserInputState == Enum.UserInputState.Begin then
            v20.recognizedInputBegan = true;
            v20.timeInputBegan = tick();
            v20.inputPositionAtInputBegan = v50.Position[l_scrollingAxis_3];
            v20.inputPreviousPositionScrollingAxis = v50.Position[l_scrollingAxis_3];
            v20.motor:stop();
        end;
    end;
    v16.restrictInputChangeDelta = function(_, v54) --[[ Line: 291 ]] --[[ Name: restrictInputChangeDelta ]]
        -- upvalues: v12 (ref), v16 (ref), v13 (ref)
        local v55 = v54 > 0 and 1 or -1;
        local v56 = math.min(math.abs(v54), v12 * v16.MOUSE_WHEEL_STEP_THRESHOLD);
        if v56 < v16.MOUSE_WHEEL_STEP_THRESHOLD then
            return math.pow(v56 / v16.MOUSE_WHEEL_STEP_THRESHOLD, v13) * v16.MOUSE_WHEEL_STEP_THRESHOLD;
        else
            return v56 * v55;
        end;
    end;
    v20.onInputChanged = function(_, v58) --[[ Line: 312 ]]
        -- upvalues: v20 (copy), v10 (ref), v16 (ref), v15 (ref), v11 (ref), v6 (ref)
        local l_entries_2 = v20.props.entries;
        local l_entrySizeOnScrollingAxis_3 = v20.props.entrySizeOnScrollingAxis;
        local l_scrollingAxis_4 = v20.state.scrollingAxis;
        if v10 and v58.UserInputType == Enum.UserInputType.MouseWheel then
            local l_Z_0 = v58.Position.Z;
            local v63 = v16:restrictInputChangeDelta(l_Z_0);
            if l_Z_0 < 0 ~= (v20.scrollDeltaAccumulator < 0) then
                v20.scrollDeltaAccumulator = 0;
            end;
            v20.scrollDeltaAccumulator = v20.scrollDeltaAccumulator + v63;
            local v64 = math.abs(v20.scrollDeltaAccumulator) <= 4 * v16.MOUSE_WHEEL_STEP_THRESHOLD;
            while math.abs(v20.scrollDeltaAccumulator) >= v16.MOUSE_WHEEL_STEP_THRESHOLD do
                local v65 = v20.scrollDeltaAccumulator > 0 and 1 or -1;
                v20.updateTargetIndex({
                    newTargetIndex = v20.targetIndex - v65, 
                    isSetByUserInput = true, 
                    OtterAnimationType = v15.spring
                });
                v20.scrollDeltaAccumulator = v20.scrollDeltaAccumulator - v16.MOUSE_WHEEL_STEP_THRESHOLD * v65;
                if v64 then
                    task.wait(v11);
                end;
            end;
            return;
        else
            if v20.recognizedInputBegan then
                local v66 = v58.Position[l_scrollingAxis_4] - v20.inputPreviousPositionScrollingAxis;
                if v20.scrollRef.current then
                    local v67 = math.max(math.min(0, v20.scrollRef.current.Position[l_scrollingAxis_4].Offset + v66), -(l_entrySizeOnScrollingAxis_3 * (#l_entries_2 - 1)));
                    v20.motor:setGoal(v6.instant(v67));
                end;
                v20.inputChanged = true;
                v20.inputPreviousPositionScrollingAxis = v58.Position[l_scrollingAxis_4];
            end;
            return;
        end;
    end;
    v20.onInputEnded = function(_, v69) --[[ Line: 370 ]]
        -- upvalues: v20 (copy)
        local l_scrollingAxis_5 = v20.state.scrollingAxis;
        if v20.recognizedInputBegan then
            local v71 = v69.Position[l_scrollingAxis_5] - v20.inputPositionAtInputBegan;
            if v20.inputChanged and math.abs(v71) > 1.5 then
                local v72 = tick() - v20.timeInputBegan;
                if v72 < 0.3 then
                    local v73 = v69.Delta[l_scrollingAxis_5] / v72;
                    v20.updateIndexByScrollPositionAndOffset(v73);
                else
                    v20.updateIndexByScrollPositionAndOffset(0);
                end;
            else
                v20.updateIndexByInputPosition(v69.Position);
            end;
        end;
        v20.recognizedInputBegan = false;
        v20.inputChanged = false;
    end;
    v20.onMouseWheelForward = function() --[[ Line: 396 ]]
        -- upvalues: v10 (ref), v20 (copy)
        if not v10 then
            v20.updateTargetIndex({
                newTargetIndex = v20.targetIndex - 1, 
                isSetByUserInput = true
            });
        end;
    end;
    v20.onMouseWheelBackward = function() --[[ Line: 405 ]]
        -- upvalues: v10 (ref), v20 (copy)
        if not v10 then
            v20.updateTargetIndex({
                newTargetIndex = v20.targetIndex + 1, 
                isSetByUserInput = true
            });
        end;
    end;
    v20.onSelectionGained = function(v74) --[[ Line: 414 ]]
        -- upvalues: v20 (copy), v15 (ref)
        v20.isEntrySelected = true;
        v20.updateTargetIndex({
            newTargetIndex = v74, 
            isSetByUserInput = true, 
            otterAnimationType = v15.instant
        });
    end;
    v20.onSelectionLost = function() --[[ Line: 423 ]]
        -- upvalues: v20 (copy)
        v20.isEntrySelected = false;
    end;
end;
v16.didMount = function(v75) --[[ Line: 428 ]] --[[ Name: didMount ]]
    -- upvalues: v6 (copy), v5 (copy), v15 (copy)
    v75.updateParent();
    v75.motor = v6.createSingleMotor(0);
    v75.motor:onStep(function(v76) --[[ Line: 432 ]]
        -- upvalues: v75 (copy), v5 (ref)
        if v75.scrollRef.current then
            local l_scrollingAxis_6 = v75.state.scrollingAxis;
            local l_subAxis_0 = v75.state.subAxis;
            local l_scrollDirection_1 = v75.state.scrollDirection;
            local l_Position_0 = v75.scrollRef.current.Position;
            l_Position_0 = if l_scrollDirection_1 == v5.Horizontal then UDim2.new(UDim.new(l_Position_0[l_scrollingAxis_6].Scale, v76), l_Position_0[l_subAxis_0]) else UDim2.new(l_Position_0[l_subAxis_0], UDim.new(l_Position_0[l_scrollingAxis_6].Scale, v76));
            v75.scrollRef.current.Position = l_Position_0;
        end;
    end);
    v75.motor:onComplete(function() --[[ Line: 450 ]]
        -- upvalues: v75 (copy)
        if v75.props.onAnimationComplete then
            v75.props.onAnimationComplete();
        end;
    end);
    v75.updateTargetIndex({
        newTargetIndex = v75.targetIndex, 
        isSetByUserInput = false, 
        otterAnimationType = v15.instant
    });
    v75.isMounted = true;
end;
v16.willUnmount = function(v81) --[[ Line: 465 ]] --[[ Name: willUnmount ]]
    v81.isMounted = false;
    v81.motor:destroy();
end;
v16.didUpdate = function(v82, v83) --[[ Line: 470 ]] --[[ Name: didUpdate ]]
    local l_parentSpecifiedTarget_1 = v82.props.parentSpecifiedTarget;
    local l_entrySizeOnScrollingAxis_4 = v82.props.entrySizeOnScrollingAxis;
    local v86 = true;
    if l_entrySizeOnScrollingAxis_4 == v83.entrySizeOnScrollingAxis then
        v86 = false;
        if l_parentSpecifiedTarget_1 ~= v82.targetIndex then
            v86 = l_parentSpecifiedTarget_1 ~= v83.parentSpecifiedTarget;
        end;
    end;
    if v86 then
        local v87 = nil;
        v87 = l_parentSpecifiedTarget_1 or v82.targetIndex;
        v82.updateTargetIndex({
            newTargetIndex = v87, 
            isSetByUserInput = false
        });
    end;
end;
v16.render = function(v88) --[[ Line: 492 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v5 (copy), v7 (copy), v2 (copy), v3 (copy)
    return l_withStyle_0(function(_) --[[ Line: 493 ]]
        -- upvalues: v88 (copy), v5 (ref), v7 (ref), v2 (ref), v3 (ref)
        local l_layoutOrder_0 = v88.props.layoutOrder;
        local l_size_0 = v88.props.size;
        local l_entries_3 = v88.props.entries;
        local l_entrySizeOnScrollingAxis_5 = v88.props.entrySizeOnScrollingAxis;
        local l_clipsDescendants_0 = v88.props.clipsDescendants;
        local l_scrollDirection_2 = v88.state.scrollDirection;
        local l_getEntryWrapperProps_0 = v88.props.getEntryWrapperProps;
        local v97 = nil;
        local v98 = nil;
        local v99 = nil;
        local v100 = nil;
        local v101 = nil;
        if l_scrollDirection_2 == v5.Horizontal then
            v97 = v7.FitAxis.Width;
            v98 = Enum.FillDirection.Horizontal;
            v99 = UDim2.new(0, l_entrySizeOnScrollingAxis_5, 1, 0);
            v100 = UDim2.new(0, 0, 1, 0);
            v101 = UDim2.new(0.5, -l_entrySizeOnScrollingAxis_5 / 2, 0, 0);
        else
            v97 = v7.FitAxis.Height;
            v98 = Enum.FillDirection.Vertical;
            v99 = UDim2.new(1, 0, 0, l_entrySizeOnScrollingAxis_5);
            v100 = UDim2.new(1, 0, 0, 0);
            v101 = UDim2.new(0, 0, 0.5, -l_entrySizeOnScrollingAxis_5 / 2);
        end;
        local v102 = nil;
        v102 = {};
        for v103, v104 in ipairs(l_entries_3) do
            local v105 = {};
            local v106 = false;
            if v103 == v88.targetIndex then
                v106 = v88.isEntrySelected;
            end;
            v105.Interactable = v106;
            v105.BackgroundTransparency = 1;
            v105.BorderSizePixel = 0;
            v105.Text = "";
            v105.Selectable = math.abs(v88.targetIndex - v103) < 2;
            v105[v2.Ref] = if v103 == v88.targetIndex then v88.targetEntryRef else nil;
            v105[v2.Event.SelectionGained] = function() --[[ Line: 533 ]]
                -- upvalues: v88 (ref), v103 (copy)
                v88.onSelectionGained(v103);
            end;
            v105[v2.Event.SelectionLost] = v88.onSelectionLost;
            v105[v2.Event.Activated] = v88.props.onEntryActivated;
            if l_getEntryWrapperProps_0 then
                v105 = v3.Dictionary.join(v105, l_getEntryWrapperProps_0(v104));
            end;
            v105 = v3.Dictionary.join(v105, {
                Size = v99, 
                LayoutOrder = v103
            });
            table.insert(v102, v2.createElement("TextButton", v105, {
                v88.props.renderEntry(v104)
            }));
        end;
        table.insert(v102, v2.createElement("UIListLayout", {
            FillDirection = v98, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }));
        return v2.createElement("Frame", {
            LayoutOrder = l_layoutOrder_0, 
            Size = if v88.shouldExpandTapTarget then l_size_0 + UDim2.new(0, 0, 0, v88.tapTargetExpansionSize) else l_size_0, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            ClipsDescendants = l_clipsDescendants_0, 
            SelectionGroup = true, 
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
            [v2.Event.InputBegan] = v88.onInputBegan, 
            [v2.Event.InputChanged] = v88.onInputChanged, 
            [v2.Event.InputEnded] = v88.onInputEnded, 
            [v2.Event.MouseWheelForward] = v88.onMouseWheelForward, 
            [v2.Event.MouseWheelBackward] = v88.onMouseWheelBackward
        }, {
            CenterPosition = if v88.shouldExpandTapTarget then v2.createElement("Frame", {
                Size = l_size_0, 
                AutomaticSize = Enum.AutomaticSize.X, 
                ClipsDescendants = true, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                CenterPosition = v2.createElement("Frame", {
                    Size = v100, 
                    Position = v101, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    AnimatedSlidingList = v2.createElement(v7.FitFrame, {
                        Size = v100, 
                        fitAxis = v97, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        [v2.Ref] = v88.scrollRef, 
                        [v2.Change.AbsolutePosition] = v88.onScrollPositionChanged
                    }, v102)
                })
            }) else v2.createElement("Frame", {
                Size = v100, 
                Position = v101, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                AnimatedSlidingList = v2.createElement(v7.FitFrame, {
                    Size = v100, 
                    fitAxis = v97, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    [v2.Ref] = v88.scrollRef, 
                    [v2.Change.AbsolutePosition] = v88.onScrollPositionChanged
                }, v102)
            })
        });
    end);
end;
return v16;