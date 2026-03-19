local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactGamepad);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_EmoteUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).EmoteUtility;
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v6.Style.withStyle;
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_SystemSlider_0 = v6.App.Slider.SystemSlider;
local v11 = require(script.Parent.EmoteThumbnailParameters);
local v12 = require(script.Parent.EmoteThumbnailView);
local v13 = {
    CurveAnimationTimeIncrements = 0.01
};
local v14 = {
    Rotation = {
        Precision = 0, 
        Range = NumberRange.new(0, 360), 
        Default = 0, 
        Increments = 361
    }
};
local v15 = v1.PureComponent:extend("EmoteThumbnailEditor");
v15.validateProps = v3.strictInterface({
    screenSize = v3.Vector2, 
    animationClip = v3.instanceIsA("AnimationClip"), 
    initialThumbnailParameters = v3.optional(v11.validate), 
    closePromptCallback = v3.callback, 
    updateThumbnailCallback = v3.callback
});
v15.init = function(v16) --[[ Line: 62 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy), v1 (copy)
    v16:setState({
        thumbnailParameters = v16.props.initialThumbnailParameters or v11.defaultParameters
    });
    v16.onCancelPressed = function() --[[ Line: 70 ]]
        -- upvalues: v16 (copy)
        v16.props.closePromptCallback();
    end;
    v16.onUpdatePressed = function() --[[ Line: 74 ]]
        -- upvalues: v16 (copy)
        local l_thumbnailParameters_0 = v16.state.thumbnailParameters;
        v16.props.updateThumbnailCallback(l_thumbnailParameters_0);
        v16.props.closePromptCallback();
    end;
    v16.onRotateChanged = function(v18) --[[ Line: 80 ]]
        -- upvalues: v16 (copy)
        local v19 = table.clone(v16.state.thumbnailParameters);
        v19.thumbnailCharacterRotation = v18;
        v16:updateThumbnailParameters(v19);
    end;
    v16.onKeyframeOrTimeChanged = function(v20) --[[ Line: 86 ]]
        -- upvalues: v16 (copy)
        local v21 = table.clone(v16.state.thumbnailParameters);
        v21.thumbnailTime = v20;
        v21.thumbnailKeyframe = v20;
        v16:updateThumbnailParameters(v21);
    end;
    v16.rotationSliderRef = v1.createRef();
    v16.timeSliderRef = v1.createRef();
    v16:updateSliderValuesForAnimationClip();
end;
v15.updateSliderValuesForAnimationClip = function(v22) --[[ Line: 100 ]] --[[ Name: updateSliderValuesForAnimationClip ]]
    -- upvalues: l_EmoteUtility_0 (copy), v13 (copy)
    local l_props_0 = v22.props;
    local v24 = nil;
    local v25 = nil;
    local v26 = nil;
    if l_props_0.animationClip:IsA("KeyframeSequence") then
        local l_Keyframes_0 = l_props_0.animationClip:GetKeyframes();
        v24 = 1;
        v25 = #l_Keyframes_0;
        v26 = 1;
    elseif l_props_0.animationClip:IsA("CurveAnimation") then
        local v28 = math.floor(l_EmoteUtility_0.GetCurveAnimationTimeLength(l_props_0.animationClip) / v13.CurveAnimationTimeIncrements);
        v24 = 0;
        v25 = v28 * v13.CurveAnimationTimeIncrements;
        v26 = v13.CurveAnimationTimeIncrements;
    else
        error("Unsupported animation type:", l_props_0.animationClip.ClassName);
    end;
    v22:setState({
        timeSliderMin = v24, 
        timeSliderMax = v25, 
        timeSliderStepInterval = v26
    });
end;
v15.updateThumbnailParameters = function(v29, v30) --[[ Line: 128 ]] --[[ Name: updateThumbnailParameters ]]
    v29:setState({
        thumbnailParameters = v30
    });
end;
v15.renderMiddle = function(v31, v32) --[[ Line: 134 ]] --[[ Name: renderMiddle ]]
    -- upvalues: l_withStyle_0 (copy), v1 (copy), v2 (copy), v12 (copy), l_SystemSlider_0 (copy), v14 (copy)
    return l_withStyle_0(function(v33) --[[ Line: 135 ]]
        -- upvalues: v31 (copy), v1 (ref), v2 (ref), v12 (ref), v32 (copy), l_SystemSlider_0 (ref), v14 (ref)
        local l_Font_0 = v33.Font;
        local l_Theme_0 = v33.Theme;
        local v36 = v31.props.screenSize.Y > 481;
        local v37 = {};
        if v36 then
            v37.contentSize = UDim2.new(1, 0, 0, 262);
            v37.thumbnailPosition = UDim2.new(0.5, 0, 0, 0);
            v37.thumbnailAnchorPoint = Vector2.new(0.5, 0);
            v37.leversPosition = UDim2.new(0, 0, 0, 160);
            v37.leversSize = UDim2.new(1, 0, 0, 102);
        else
            v37.contentSize = UDim2.new(1, 0, 0, 150);
            v37.thumbnailPosition = UDim2.new(0, 0, 0, 0);
            v37.thumbnailAnchorPoint = Vector2.new(0, 0);
            v37.leversPosition = UDim2.new(0, 160, 0, 0);
            v37.leversSize = UDim2.new(1, -160, 0, 102);
        end;
        local l_thumbnailParameters_1 = v31.state.thumbnailParameters;
        local l_thumbnailKeyframe_0 = l_thumbnailParameters_1.thumbnailKeyframe;
        local l_thumbnailCharacterRotation_0 = l_thumbnailParameters_1.thumbnailCharacterRotation;
        local function _(v41) --[[ Line: 161 ]] --[[ Name: getStepIntervalForOption ]]
            return (v41.Range.Max - v41.Range.Min) / (v41.Increments - 1);
        end;
        local l_createElement_0 = v1.createElement;
        local l_Frame_0 = v2.Focusable.Frame;
        local v45 = {
            Size = v37.contentSize, 
            BackgroundColor3 = Color3.new(1, 0, 1), 
            BackgroundTransparency = 1, 
            [v1.Ref] = v31.middleContentRef
        };
        local v46 = {};
        local l_createElement_1 = v1.createElement;
        local v48 = "Frame";
        local v49 = {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        };
        local v50 = {
            ThumbnailViewParent = v1.createElement("Frame", {
                LayoutOrder = 0, 
                Position = v37.thumbnailPosition, 
                AnchorPoint = v37.thumbnailAnchorPoint, 
                Size = UDim2.new(0, 150, 0, 150), 
                BackgroundColor3 = Color3.new(1, 1, 0), 
                BackgroundTransparency = 1
            }, {
                EmoteThumbnailView = v1.createElement(v12, {
                    position = UDim2.new(0.5, 0, 0.5, 0), 
                    anchorPoint = Vector2.new(0.5, 0.5), 
                    animationClip = v31.props.animationClip, 
                    thumbnailParameters = v31.state.thumbnailParameters
                })
            })
        };
        local l_createElement_2 = v1.createElement;
        local v52 = "Frame";
        local v53 = {
            LayoutOrder = 1, 
            Size = v37.leversSize, 
            AnchorPoint = Vector2.new(0, 0), 
            Position = v37.leversPosition, 
            BackgroundColor3 = Color3.new(1, 0, 0), 
            BackgroundTransparency = 1
        };
        local v54 = {
            ListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            FrameDescriptionLabel = v1.createElement("TextLabel", {
                LayoutOrder = 0, 
                Size = UDim2.new(1, 0, 0, 15), 
                Font = l_Font_0.Body.Font, 
                TextSize = 12, 
                Text = v32.timeLabelText, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            TimeSlider = v1.createElement(l_SystemSlider_0, {
                layoutOrder = 1, 
                min = v31.state.timeSliderMin, 
                max = v31.state.timeSliderMax, 
                stepInterval = v31.state.timeSliderStepInterval, 
                value = l_thumbnailKeyframe_0, 
                onValueChanged = v31.onKeyframeOrTimeChanged, 
                width = UDim.new(1, 0), 
                position = UDim2.new(0, 0, 0.5, 0), 
                anchorPoint = Vector2.new(0, 0.5), 
                NextSelectionDown = v31.rotationSliderRef, 
                [v1.Ref] = v31.timeSliderRef
            }), 
            RotationDescriptionLabel = v1.createElement("TextLabel", {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 15), 
                Font = l_Font_0.Body.Font, 
                TextSize = 12, 
                Text = v32.rotationLabelText, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        };
        local l_createElement_3 = v1.createElement;
        local l_l_SystemSlider_0_0 = l_SystemSlider_0;
        local v57 = {
            layoutOrder = 3, 
            min = v14.Rotation.Range.Min, 
            max = v14.Rotation.Range.Max
        };
        local l_Rotation_0 = v14.Rotation;
        v57.stepInterval = (l_Rotation_0.Range.Max - l_Rotation_0.Range.Min) / (l_Rotation_0.Increments - 1);
        v57.value = l_thumbnailCharacterRotation_0;
        v57.onValueChanged = v31.onRotateChanged;
        v57.width = UDim.new(1, 0);
        v57.position = UDim2.new(0, 0, 0.5, 0);
        v57.anchorPoint = Vector2.new(0, 0.5);
        v57.NextSelectionUp = v31.timeSliderRef;
        v57[v1.Ref] = v31.rotationSliderRef;
        v54.RotationSlider = l_createElement_3(l_l_SystemSlider_0_0, v57);
        v50.Levers = l_createElement_2(v52, v53, v54);
        v46.TopSection = l_createElement_1(v48, v49, v50);
        return l_createElement_0(l_Frame_0, v45, v46);
    end);
end;
v15.renderAlertLocalized = function(v59, v60) --[[ Line: 258 ]] --[[ Name: renderAlertLocalized ]]
    -- upvalues: v1 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    return v1.createElement(l_InteractiveAlert_0, {
        title = v60.titleText or "", 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v59.onCancelPressed, 
                        text = v60.cancelButtonText
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v59.onUpdatePressed, 
                        text = v60.updateButtonText
                    }, 
                    isDefaultChild = false
                }
            }
        }, 
        middleContent = function() --[[ Line: 280 ]] --[[ Name: middleContent ]]
            -- upvalues: v59 (copy), v60 (copy)
            return v59:renderMiddle(v60);
        end, 
        screenSize = v59.props.screenSize, 
        defaultChildRef = v59.props.defaultChildRef, 
        isMiddleContentFocusable = true
    });
end;
local function v61() --[[ Line: 289 ]] --[[ Name: GetLocalizedStrings ]]
    -- upvalues: v4 (copy)
    return {
        cancelButtonText = v4:FormatByKey("CoreScripts.EmoteThumbnailEditor.Action.Cancel"), 
        updateButtonText = v4:FormatByKey("CoreScripts.EmoteThumbnailEditor.Action.Update"), 
        titleText = v4:FormatByKey("CoreScripts.EmoteThumbnailEditor.Heading.EditThumbnail"), 
        rotationLabelText = v4:FormatByKey("CoreScripts.EmoteThumbnailEditor.Label.Rotation"), 
        timeLabelText = v4:FormatByKey("CoreScripts.EmoteThumbnailEditor.Label.Time")
    };
end;
v15.render = function(v62) --[[ Line: 301 ]] --[[ Name: render ]]
    -- upvalues: v61 (copy)
    return v62:renderAlertLocalized((v61()));
end;
return v15;