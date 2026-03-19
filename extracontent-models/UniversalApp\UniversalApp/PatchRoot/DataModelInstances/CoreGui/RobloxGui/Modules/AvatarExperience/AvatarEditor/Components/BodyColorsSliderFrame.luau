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
local v25 = Color3.new(0.75, 0.75, 0.75);
local v26 = v7.PureComponent:extend("BodyColorsSliderFrame");
v26.validateProps = v9.strictInterface({
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
v26.init = function(v27) --[[ Line: 62 ]] --[[ Name: init ]]
    -- upvalues: v17 (copy), v23 (copy), v7 (copy)
    v27.state = {
        sliderValue = v27.props.sliderValue
    };
    v27.onSliderChanged = function(v28) --[[ Line: 67 ]]
        -- upvalues: v17 (ref), v27 (copy)
        local v29 = v17.getColor3AtValueForRangeId(v27.props.rangeIdForSelectedBodyParts, v28, v27.props.defaultBodyColorRanges);
        v27:setState({
            sliderValue = v28
        });
        v27.props.setBodyColors(v29);
    end;
    v27.onDragEnd = function() --[[ Line: 79 ]]
        -- upvalues: v27 (copy), v17 (ref)
        if v27.isMounted then
            local l_sliderValue_0 = v27.state.sliderValue;
            local v31 = v17.getColor3AtValueForRangeId(v27.props.rangeIdForSelectedBodyParts, l_sliderValue_0, v27.props.defaultBodyColorRanges);
            v27.props.setBodyColors(nil);
            v27.props.setBodyColor3(v31, v27.props.rangeIdForSelectedBodyParts, l_sliderValue_0, v27.props.analytics);
        end;
    end;
    v27.containerRef = if v23 then nil else v7.createRef();
end;
v26.didMount = function(v32) --[[ Line: 98 ]] --[[ Name: didMount ]]
    v32:setState({
        sliderValue = v32.props.sliderValue
    });
    v32.isMounted = true;
end;
v26.didUpdate = function(v33, v34) --[[ Line: 105 ]] --[[ Name: didUpdate ]]
    if v34.sliderValue ~= v33.props.sliderValue then
        v33:setState({
            sliderValue = v33.props.sliderValue
        });
    end;
end;
v26.getCustomKnobColorLower = function(v35) --[[ Line: 113 ]] --[[ Name: getCustomKnobColorLower ]]
    -- upvalues: v17 (copy)
    local l_sliderValue_1 = v35.state.sliderValue;
    return (v17.getColor3AtValueForRangeId(v35.props.rangeIdForSelectedBodyParts, l_sliderValue_1, v35.props.defaultBodyColorRanges));
end;
if not l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then
    v26.renderTrack = function(v37) --[[ Line: 124 ]] --[[ Name: renderTrack ]]
        -- upvalues: v7 (copy), v16 (copy), v25 (copy)
        local l_rangeStruct_0 = v37.props.rangeStruct;
        if not l_rangeStruct_0 then
            return nil;
        else
            local v39 = {};
            for v40, v41 in l_rangeStruct_0.range do
                local v42 = (v40 - 1) / (#l_rangeStruct_0.range - 1);
                table.insert(v39, (ColorSequenceKeypoint.new(v42, v41)));
            end;
            local v43 = ColorSequence.new(v39);
            return v7.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.new(1, 0, 0, v16.BodyColorsSliderTrackHeight), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundColor3 = v25
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
                        Color = v43
                    })
                })
            });
        end;
    end;
end;
v26.render = function(v44) --[[ Line: 170 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v45) --[[ Line: 171 ]]
        -- upvalues: v44 (copy)
        return v44:renderWithProviders(v45);
    end);
end;
v26.renderWithProviders = function(v46, v47) --[[ Line: 176 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_FFlagAXMigrateSystemSliderToFoundationSlider_0 (copy), v7 (copy), v16 (copy), v23 (copy), v10 (copy), v2 (copy), l_InputSize_0 (copy), l_SliderVariant_0 (copy), l_Visibility_0 (copy), l_SystemSlider_0 (copy), v25 (copy)
    local l_Theme_0 = v47.Theme;
    local l_sliderValue_2 = v46.state.sliderValue;
    if l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then
        local l_tokens_0 = v46.props.tokens;
        local l_rangeStruct_1 = v46.props.rangeStruct;
        if not l_rangeStruct_1 then
            return nil;
        else
            local v52 = {};
            for v53, v54 in l_rangeStruct_1.range do
                local v55 = (v53 - 1) / (#l_rangeStruct_1.range - 1);
                table.insert(v52, (ColorSequenceKeypoint.new(v55, v54)));
            end;
            local v56 = ColorSequence.new(v52);
            local v57 = {
                Color3 = v46:getCustomKnobColorLower(), 
                Transparency = 0.5
            };
            return v7.createElement("Frame", {
                Size = v46.props.gridAndSidebarFrameSizeBinding:map(function(v58) --[[ Line: 202 ]]
                    -- upvalues: v16 (ref)
                    return UDim2.new(1, -2 * v16.SkinColorSliderPadding, 0, -v58.Y.Offset);
                end), 
                Position = v46.props.gridAndSidebarFrameSizeBinding:map(function(v59) --[[ Line: 205 ]]
                    -- upvalues: v16 (ref)
                    return UDim2.new(0, v16.SkinColorSliderPadding, 1, v59.Y.Offset);
                end), 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                [v7.Ref] = if v23 then nil else v46.containerRef
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
                    containerRef = if v23 then nil else v46.containerRef
                }, {
                    Gradient = v10.createElement("UIGradient", {
                        Color = v56
                    }), 
                    ColorSlider = v10.createElement(v2.Slider, {
                        value = l_sliderValue_2, 
                        range = NumberRange.new(0, 1), 
                        size = l_InputSize_0.Medium, 
                        variant = l_SliderVariant_0.Utility, 
                        isContained = true, 
                        isDisabled = v46.props.disabled, 
                        knob = v10.createElement(v2.Knob, {
                            size = l_InputSize_0.Medium, 
                            style = v57, 
                            stroke = {
                                Color = l_tokens_0.Color.System.Neutral.Color3, 
                                Transparency = l_tokens_0.Color.System.Neutral.Transparency, 
                                Thickness = l_tokens_0.Stroke.Thick
                            }, 
                            hasShadow = true
                        }), 
                        knobVisibility = l_Visibility_0.Always, 
                        onValueChanged = v46.onSliderChanged, 
                        width = UDim.new(1, 0), 
                        onDragEnded = v46.onDragEnd, 
                        ref = v46.props.sliderRef, 
                        NextSelectionUp = v46.props.NextSelectionUp
                    })
                })
            });
        end;
    else
        return v7.createElement("Frame", {
            Size = v46.props.gridAndSidebarFrameSizeBinding:map(function(v60) --[[ Line: 257 ]]
                -- upvalues: v16 (ref)
                return UDim2.new(1, -2 * v16.SkinColorSliderPadding, 0, -v60.Y.Offset);
            end), 
            Position = v46.props.gridAndSidebarFrameSizeBinding:map(function(v61) --[[ Line: 260 ]]
                -- upvalues: v16 (ref)
                return UDim2.new(0, v16.SkinColorSliderPadding, 1, v61.Y.Offset);
            end), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            [v7.Ref] = if v23 then nil else v46.containerRef
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
                isDisabled = v46.props.disabled, 
                onValueChanged = v46.onSliderChanged, 
                onDragEnd = v46.onDragEnd, 
                width = UDim.new(1, 0), 
                position = UDim2.new(0.5, 0, 0, v16.BodyColorsSliderFrameHeight / 2), 
                anchorPoint = Vector2.new(0.5, 0.5), 
                customTrack = v46:renderTrack(), 
                customKnobColorLower = v46:getCustomKnobColorLower(), 
                customPressedKnobShadowTransparencyLower = 0.5, 
                customKnobBorderSize = 1, 
                customKnobBorderColor = v25, 
                [v7.Ref] = v46.props.sliderRef, 
                NextSelectionUp = v46.props.NextSelectionUp, 
                containerRef = if v23 then nil else v46.containerRef
            })
        });
    end;
end;
v26.willUnmount = function(v62) --[[ Line: 297 ]] --[[ Name: willUnmount ]]
    v62.isMounted = false;
end;
v26 = l_RoactServices_0.connect({
    analytics = v18
})(v26);
v26 = v8.connect(function(v63, v64) --[[ Line: 305 ]]
    -- upvalues: v17 (copy), v22 (copy), v19 (copy)
    local l_AvatarExperience_0 = v63.AvatarExperience;
    local l_defaultBodyColorRanges_0 = v64.defaultBodyColorRanges;
    local l_rangeIdForSelectedBodyParts_0 = v64.rangeIdForSelectedBodyParts;
    assert(l_rangeIdForSelectedBodyParts_0, "rangeIdForSelectedBodyParts ~= nil.");
    local v68 = v17.getRangeStructForRangeId(l_rangeIdForSelectedBodyParts_0, l_defaultBodyColorRanges_0);
    assert(v68, "rangeStruct ~= nil.");
    local v69 = v22(v63);
    local v70 = v69 and 0.5 or v19(l_AvatarExperience_0, l_rangeIdForSelectedBodyParts_0);
    return {
        rangeStruct = v68, 
        sliderValue = v70, 
        disabled = v69
    };
end, function(v71) --[[ Line: 330 ]]
    -- upvalues: v20 (copy)
    return {
        setBodyColor3 = function(v72, v73, v74, v75) --[[ Line: 332 ]] --[[ Name: setBodyColor3 ]]
            -- upvalues: v71 (copy), v20 (ref)
            v71(v20(v72, v73, v74, v75));
        end
    };
end)(v26);
return function(v76) --[[ Line: 340 ]]
    -- upvalues: v21 (copy), v14 (copy), l_FFlagAXMigrateSystemSliderToFoundationSlider_0 (copy), l_useTokens_0 (copy), v10 (copy), v26 (ref)
    local v77 = v21();
    local v78 = v14.Dictionary.join(v77, v76);
    if l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then
        local v79 = l_useTokens_0();
        v78 = v14.Dictionary.join({
            tokens = v79
        }, v78);
    end;
    return v10.createElement(v26, v78);
end;