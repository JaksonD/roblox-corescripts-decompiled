local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Foundation);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_Modules_0.LuaApp.mutedError);
local l_Focusable_0 = v4.Focusable;
local l_withStyle_0 = v6.Style.withStyle;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_SystemSlider_0 = v6.App.Slider.SystemSlider;
local l_FFlagAXMigrateSystemSliderToFoundationSlider_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateSystemSliderToFoundationSlider;
local l_FFlagAXMakeSlidersSmoothWithGamepad_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMakeSlidersSmoothWithGamepad;
local v14 = v3.PureComponent:extend("SliderWithLabelAndIcons");
v14.validateProps = v5.strictInterface({
    layoutOrder = v5.number, 
    text = v5.string, 
    leftIcon = v5.table, 
    rightIcon = v5.table, 
    value = v5.number, 
    onSliderChanged = v5.callback, 
    min = v5.number, 
    max = v5.number, 
    baseRef = v5.table, 
    NextSelectionUp = v5.optional(v5.table), 
    NextSelectionDown = v5.optional(v5.table)
});
v14.init = function(v15) --[[ Line: 44 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_FFlagAXMigrateSystemSliderToFoundationSlider_0 (copy), v7 (copy)
    v15.sliderRef = v3.createRef();
    if l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then
        v15.convertPositionValueToSliderValue = function(v16, v17, v18) --[[ Line: 48 ]]
            -- upvalues: v7 (ref)
            if v18 <= v17 then
                v7("SliderWithLabelAndIcons.lua convertPositionValueToSliderValue argument error: posMaxVal must be greater than posMinVal.");
                return 0.5;
            else
                return (v16 - v17) / (v18 - v17);
            end;
        end;
        v15.convertSliderValueToPositionValue = function(v19, v20, v21) --[[ Line: 58 ]]
            return v19 * (v21 - v20) + v20;
        end;
    end;
end;
v14.render = function(v22) --[[ Line: 64 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_FFlagAXMigrateSystemSliderToFoundationSlider_0 (copy), v3 (copy), l_ImageSetLabel_0 (copy), v2 (copy), l_FFlagAXMakeSlidersSmoothWithGamepad_0 (copy), l_Focusable_0 (copy), l_SystemSlider_0 (copy)
    return l_withStyle_0(function(v23) --[[ Line: 65 ]]
        -- upvalues: l_FFlagAXMigrateSystemSliderToFoundationSlider_0 (ref), v3 (ref), v22 (copy), l_ImageSetLabel_0 (ref), v2 (ref), l_FFlagAXMakeSlidersSmoothWithGamepad_0 (ref), l_Focusable_0 (ref), l_SystemSlider_0 (ref)
        local l_Font_0 = v23.Font;
        local l_BaseSize_0 = l_Font_0.BaseSize;
        local v26 = l_Font_0.CaptionHeader.RelativeSize * l_BaseSize_0;
        local l_Font_1 = l_Font_0.CaptionHeader.Font;
        local v28 = 50 - v26;
        if l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then
            return v3.createElement("Frame", {
                Size = UDim2.new(0.9, 0, 0, 50), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                LayoutOrder = v22.props.layoutOrder
            }, {
                TopFrame = v3.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v26)
                }, {
                    SliderLabel = v3.createElement("TextLabel", {
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        Text = v22.props.text, 
                        Size = UDim2.new(1, -2 * v28, 1, 0), 
                        Position = UDim2.fromOffset(v28, 0), 
                        TextColor3 = v23.Theme.TextEmphasis.Color, 
                        Font = l_Font_1, 
                        TextSize = v26, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    })
                }), 
                BottomFrame = v3.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v28), 
                    Position = UDim2.fromOffset(0, v26)
                }, {
                    LeftIcon = v3.createElement(l_ImageSetLabel_0, {
                        BackgroundTransparency = 1, 
                        Image = v22.props.leftIcon, 
                        Size = UDim2.fromOffset(v28, v28), 
                        Position = UDim2.fromOffset(0, 0), 
                        ImageColor3 = v23.Theme.TextEmphasis.Color
                    }), 
                    SliderBar = v3.createElement(v2.Slider, {
                        range = NumberRange.new(0, 1), 
                        value = v22.convertPositionValueToSliderValue(v22.props.value, v22.props.min, v22.props.max), 
                        onValueChanged = function(v29) --[[ Line: 116 ]] --[[ Name: onValueChanged ]]
                            -- upvalues: v22 (ref)
                            local v30 = v22.convertSliderValueToPositionValue(v29, v22.props.min, v22.props.max);
                            v22.props.onSliderChanged(v30);
                        end, 
                        width = UDim.new(1, -2 * v28), 
                        Position = UDim2.new(0, v28, 0, 4), 
                        anchorPoint = Vector2.new(0, 0.5), 
                        NextSelectionUp = v22.props.NextSelectionUp, 
                        NextSelectionDown = v22.props.NextSelectionDown, 
                        [v3.Ref] = v22.props.baseRef, 
                        step = l_FFlagAXMakeSlidersSmoothWithGamepad_0 and 0.01 or nil
                    }), 
                    RightIcon = v3.createElement(l_ImageSetLabel_0, {
                        BackgroundTransparency = 1, 
                        Image = v22.props.rightIcon, 
                        AnchorPoint = Vector2.new(1, 0), 
                        Size = UDim2.fromOffset(v28, v28), 
                        Position = UDim2.fromScale(1, 0), 
                        ImageColor3 = v23.Theme.TextEmphasis.Color
                    })
                })
            });
        else
            return v3.createElement(l_Focusable_0.Frame, {
                Size = UDim2.new(0.9, 0, 0, 50), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                LayoutOrder = v22.props.layoutOrder, 
                defaultChild = v22.sliderRef, 
                [v3.Ref] = v22.props.baseRef
            }, {
                TopFrame = v3.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v26)
                }, {
                    SliderLabel = v3.createElement("TextLabel", {
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        Text = v22.props.text, 
                        Size = UDim2.new(1, -2 * v28, 1, 0), 
                        Position = UDim2.fromOffset(v28, 0), 
                        TextColor3 = v23.Theme.TextEmphasis.Color, 
                        Font = l_Font_1, 
                        TextSize = v26, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    })
                }), 
                BottomFrame = v3.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v28), 
                    Position = UDim2.fromOffset(0, v26)
                }, {
                    LeftIcon = v3.createElement(l_ImageSetLabel_0, {
                        BackgroundTransparency = 1, 
                        Image = v22.props.leftIcon, 
                        Size = UDim2.fromOffset(v28, v28), 
                        Position = UDim2.fromOffset(0, 0), 
                        ImageColor3 = v23.Theme.TextEmphasis.Color
                    }), 
                    SliderBar = v3.createElement(l_SystemSlider_0, {
                        min = v22.props.min, 
                        max = v22.props.max, 
                        stepInterval = 1, 
                        value = v22.props.value, 
                        onValueChanged = v22.props.onSliderChanged, 
                        width = UDim.new(1, -2 * v28), 
                        position = UDim2.new(0, v28, 0.5, 0), 
                        anchorPoint = Vector2.new(0, 0.5), 
                        NextSelectionUp = v22.props.NextSelectionUp, 
                        NextSelectionDown = v22.props.NextSelectionDown, 
                        [v3.Ref] = v22.sliderRef
                    }), 
                    RightIcon = v3.createElement(l_ImageSetLabel_0, {
                        BackgroundTransparency = 1, 
                        Image = v22.props.rightIcon, 
                        AnchorPoint = Vector2.new(1, 0), 
                        Size = UDim2.fromOffset(v28, v28), 
                        Position = UDim2.fromScale(1, 0), 
                        ImageColor3 = v23.Theme.TextEmphasis.Color
                    })
                })
            });
        end;
    end);
end;
return v14;