local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Foundation);
local l_useTokens_0 = v2.Hooks.useTokens;
local l_InputSize_0 = v2.Enums.InputSize;
local l_Visibility_0 = v2.Enums.Visibility;
local l_SliderVariant_0 = v2.Enums.SliderVariant;
local v7 = require(l_CorePackages_0.Packages.Roact);
local v8 = require(l_CorePackages_0.Packages.RoactRodux);
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_CorePackages_0.Packages.React);
local v11 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v11.Core.Style.withStyle;
local l_SystemSlider_0 = v11.App.Slider.SystemSlider;
local v14 = require(l_CorePackages_0.Packages.Cryo);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v16 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.selectButtonSliderValue);
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetBodyColor3);
local v21 = require(l_Modules_0.AvatarExperience.Common.Context.useBodyDataCallbacksContext);
local v22 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectDefaultTryOnBodyColorsToggled);
local v23 = game:DefineFastFlag("ColorPickerVRFix2", false);
local l_FFlagAXMigrateSystemSliderToFoundationSlider_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateSystemSliderToFoundationSlider;
local l_FFlagAXMakeSlidersSmoothWithGamepad_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMakeSlidersSmoothWithGamepad;
local v26 = Color3.new(0.75, 0.75, 0.75);
local v27 = v7.PureComponent:extend("BodyColorsSliderFrame");
v27.validateProps = v9.strictInterface({
    sliderValue = v9.number, 
    rangeStruct = v9.optional(v9.table), 
    setBodyColor3 = v9.optional(v9.callback), 
    setBodyColors = v9.optional(v9.callback), 
    setAvatarScales = v9.optional(v9.callback), 
    NextSelectionUp = v9.optional(v9.table), 
    sliderRef = v9.optional(v9.table), 
    gridAndSidebarFrameSizeBinding = v9.union(v9.UDim2, v9.table), 
    rangeIdForSelectedBodyParts = v9.optional(v9.string), 
    defaultBodyColorRanges = v9.optional(v9.table), 
    disabled = v9.optional(v9.boolean), 
    tokens = if l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then v9.table else nil, 
    analytics = v9.table
});
v27.init = function(v28) --[[ Line: 64 ]] --[[ Name: init ]]
    -- upvalues: v17 (copy), v23 (copy), v7 (copy)
    v28.state = {
        sliderValue = v28.props.sliderValue
    };
    v28.onSliderChanged = function(v29) --[[ Line: 69 ]]
        -- upvalues: v17 (ref), v28 (copy)
        local v30 = v17.getColor3AtValueForRangeId(v28.props.rangeIdForSelectedBodyParts, v29, v28.props.defaultBodyColorRanges);
        v28:setState({
            sliderValue = v29
        });
        v28.props.setBodyColors(v30);
    end;
    v28.onDragEnd = function() --[[ Line: 81 ]]
        -- upvalues: v28 (copy), v17 (ref)
        if v28.isMounted then
            local l_sliderValue_0 = v28.state.sliderValue;
            local v32 = v17.getColor3AtValueForRangeId(v28.props.rangeIdForSelectedBodyParts, l_sliderValue_0, v28.props.defaultBodyColorRanges);
            v28.props.setBodyColors(nil);
            v28.props.setBodyColor3(v32, v28.props.rangeIdForSelectedBodyParts, l_sliderValue_0, v28.props.analytics);
        end;
    end;
    v28.containerRef = if v23 then nil else v7.createRef();
end;
v27.didMount = function(v33) --[[ Line: 100 ]] --[[ Name: didMount ]]
    v33:setState({
        sliderValue = v33.props.sliderValue
    });
    v33.isMounted = true;
end;
v27.didUpdate = function(v34, v35) --[[ Line: 107 ]] --[[ Name: didUpdate ]]
    if v35.sliderValue ~= v34.props.sliderValue then
        v34:setState({
            sliderValue = v34.props.sliderValue
        });
    end;
end;
v27.getCustomKnobColorLower = function(v36) --[[ Line: 115 ]] --[[ Name: getCustomKnobColorLower ]]
    -- upvalues: v17 (copy)
    local l_sliderValue_1 = v36.state.sliderValue;
    return (v17.getColor3AtValueForRangeId(v36.props.rangeIdForSelectedBodyParts, l_sliderValue_1, v36.props.defaultBodyColorRanges));
end;
if not l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then
    v27.renderTrack = function(v38) --[[ Line: 126 ]] --[[ Name: renderTrack ]]
        -- upvalues: v7 (copy), v16 (copy), v26 (copy)
        local l_rangeStruct_0 = v38.props.rangeStruct;
        if not l_rangeStruct_0 then
            return nil;
        else
            local v40 = {};
            for v41, v42 in l_rangeStruct_0.range do
                local v43 = (v41 - 1) / (#l_rangeStruct_0.range - 1);
                table.insert(v40, (ColorSequenceKeypoint.new(v43, v42)));
            end;
            local v44 = ColorSequence.new(v40);
            return v7.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.new(1, 0, 0, v16.BodyColorsSliderTrackHeight), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundColor3 = v26
            }, {
                UICorner = v7.createElement("UICorner", {
                    CornerRadius = UDim.new(0.5, 0)
                }), 
                TrackContent = v7.createElement("Frame", {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Size = UDim2.new(1, -2, 0, v16.BodyColorsSliderTrackHeight - 2), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    BackgroundColor3 = Color3.new(1, 1, 1)
                }, {
                    UICorner = v7.createElement("UICorner", {
                        CornerRadius = UDim.new(0.5, 0)
                    }), 
                    UIGradient = v7.createElement("UIGradient", {
                        Color = v44
                    })
                })
            });
        end;
    end;
end;
v27.render = function(v45) --[[ Line: 172 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v46) --[[ Line: 173 ]]
        -- upvalues: v45 (copy)
        return v45:renderWithProviders(v46);
    end);
end;
v27.renderWithProviders = function(v47, v48) --[[ Line: 178 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_FFlagAXMigrateSystemSliderToFoundationSlider_0 (copy), v7 (copy), v16 (copy), v23 (copy), v10 (copy), v2 (copy), l_InputSize_0 (copy), l_SliderVariant_0 (copy), l_Visibility_0 (copy), l_FFlagAXMakeSlidersSmoothWithGamepad_0 (copy), l_SystemSlider_0 (copy), v26 (copy)
    local l_Theme_0 = v48.Theme;
    local l_sliderValue_2 = v47.state.sliderValue;
    if l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then
        local l_tokens_0 = v47.props.tokens;
        local l_rangeStruct_1 = v47.props.rangeStruct;
        if not l_rangeStruct_1 then
            return nil;
        else
            local v53 = {};
            for v54, v55 in l_rangeStruct_1.range do
                local v56 = (v54 - 1) / (#l_rangeStruct_1.range - 1);
                table.insert(v53, (ColorSequenceKeypoint.new(v56, v55)));
            end;
            local v57 = ColorSequence.new(v53);
            local v58 = {
                Color3 = v47:getCustomKnobColorLower(), 
                Transparency = 0.5
            };
            return v7.createElement("Frame", {
                Size = v47.props.gridAndSidebarFrameSizeBinding:map(function(v59) --[[ Line: 204 ]]
                    -- upvalues: v16 (ref)
                    return UDim2.new(1, -2 * v16.SkinColorSliderPadding, 0, -v59.Y.Offset);
                end), 
                Position = v47.props.gridAndSidebarFrameSizeBinding:map(function(v60) --[[ Line: 207 ]]
                    -- upvalues: v16 (ref)
                    return UDim2.new(0, v16.SkinColorSliderPadding, 1, v60.Y.Offset);
                end), 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                [v7.Ref] = if v23 then nil else v47.containerRef
            }, {
                Divider1 = v7.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    BackgroundColor3 = l_Theme_0.Divider.Color, 
                    BackgroundTransparency = l_Theme_0.Divider.Transparency
                }), 
                SliderBar = v10.createElement(v2.View, {
                    tag = "auto-y size-full-0 radius-circle stroke-standard stroke-emphasis", 
                    backgroundStyle = l_tokens_0.Color.Extended.White.White_100, 
                    Position = UDim2.new(0, 0, 0, v16.BodyColorsSliderFrameHeight / 2), 
                    containerRef = if v23 then nil else v47.containerRef
                }, {
                    Gradient = v10.createElement("UIGradient", {
                        Color = v57
                    }), 
                    ColorSlider = v10.createElement(v2.Slider, {
                        value = l_sliderValue_2, 
                        range = NumberRange.new(0, 1), 
                        size = l_InputSize_0.Medium, 
                        variant = l_SliderVariant_0.Utility, 
                        isContained = true, 
                        isDisabled = v47.props.disabled, 
                        knob = v10.createElement(v2.Knob, {
                            size = l_InputSize_0.Medium, 
                            style = v58, 
                            stroke = {
                                Color = l_tokens_0.Color.System.Neutral.Color3, 
                                Transparency = l_tokens_0.Color.System.Neutral.Transparency, 
                                Thickness = l_tokens_0.Stroke.Thick
                            }, 
                            hasShadow = true
                        }), 
                        knobVisibility = l_Visibility_0.Always, 
                        onValueChanged = v47.onSliderChanged, 
                        width = UDim.new(1, 0), 
                        onDragEnded = v47.onDragEnd, 
                        ref = v47.props.sliderRef, 
                        NextSelectionUp = v47.props.NextSelectionUp, 
                        step = l_FFlagAXMakeSlidersSmoothWithGamepad_0 and 0.01 or nil
                    })
                })
            });
        end;
    else
        return v7.createElement("Frame", {
            Size = v47.props.gridAndSidebarFrameSizeBinding:map(function(v61) --[[ Line: 260 ]]
                -- upvalues: v16 (ref)
                return UDim2.new(1, -2 * v16.SkinColorSliderPadding, 0, -v61.Y.Offset);
            end), 
            Position = v47.props.gridAndSidebarFrameSizeBinding:map(function(v62) --[[ Line: 263 ]]
                -- upvalues: v16 (ref)
                return UDim2.new(0, v16.SkinColorSliderPadding, 1, v62.Y.Offset);
            end), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            [v7.Ref] = if v23 then nil else v47.containerRef
        }, {
            Divider1 = v7.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                BackgroundColor3 = l_Theme_0.Divider.Color, 
                BackgroundTransparency = l_Theme_0.Divider.Transparency
            }), 
            SliderBar = v7.createElement(l_SystemSlider_0, {
                min = 0, 
                max = 1, 
                stepInterval = 0.01, 
                value = l_sliderValue_2, 
                isDisabled = v47.props.disabled, 
                onValueChanged = v47.onSliderChanged, 
                onDragEnd = v47.onDragEnd, 
                width = UDim.new(1, 0), 
                position = UDim2.new(0.5, 0, 0, v16.BodyColorsSliderFrameHeight / 2), 
                anchorPoint = Vector2.new(0.5, 0.5), 
                customTrack = v47:renderTrack(), 
                customKnobColorLower = v47:getCustomKnobColorLower(), 
                customPressedKnobShadowTransparencyLower = 0.5, 
                customKnobBorderSize = 1, 
                customKnobBorderColor = v26, 
                [v7.Ref] = v47.props.sliderRef, 
                NextSelectionUp = v47.props.NextSelectionUp, 
                containerRef = if v23 then nil else v47.containerRef
            })
        });
    end;
end;
v27.willUnmount = function(v63) --[[ Line: 300 ]] --[[ Name: willUnmount ]]
    v63.isMounted = false;
end;
v27 = l_RoactServices_0.connect({
    analytics = v18
})(v27);
v27 = v8.connect(function(v64, v65) --[[ Line: 308 ]]
    -- upvalues: v17 (copy), v22 (copy), v19 (copy)
    local l_AvatarExperience_0 = v64.AvatarExperience;
    local l_defaultBodyColorRanges_0 = v65.defaultBodyColorRanges;
    local l_rangeIdForSelectedBodyParts_0 = v65.rangeIdForSelectedBodyParts;
    assert(l_rangeIdForSelectedBodyParts_0, "rangeIdForSelectedBodyParts ~= nil.");
    local v69 = v17.getRangeStructForRangeId(l_rangeIdForSelectedBodyParts_0, l_defaultBodyColorRanges_0);
    assert(v69, "rangeStruct ~= nil.");
    local v70 = v22(v64);
    local v71 = v70 and 0.5 or v19(l_AvatarExperience_0, l_rangeIdForSelectedBodyParts_0);
    return {
        rangeStruct = v69, 
        sliderValue = v71, 
        disabled = v70
    };
end, function(v72) --[[ Line: 333 ]]
    -- upvalues: v20 (copy)
    return {
        setBodyColor3 = function(v73, v74, v75, v76) --[[ Line: 335 ]] --[[ Name: setBodyColor3 ]]
            -- upvalues: v72 (copy), v20 (ref)
            v72(v20(v73, v74, v75, v76));
        end
    };
end)(v27);
return function(v77) --[[ Line: 343 ]]
    -- upvalues: v21 (copy), v14 (copy), l_FFlagAXMigrateSystemSliderToFoundationSlider_0 (copy), l_useTokens_0 (copy), v10 (copy), v27 (ref)
    local v78 = v21();
    local v79 = v14.Dictionary.join(v78, v77);
    if l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then
        local v80 = l_useTokens_0();
        v79 = v14.Dictionary.join({
            tokens = v80
        }, v79);
    end;
    return v10.createElement(v27, v79);
end;