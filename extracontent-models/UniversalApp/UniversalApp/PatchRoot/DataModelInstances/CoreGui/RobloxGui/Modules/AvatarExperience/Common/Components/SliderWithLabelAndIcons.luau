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
local v13 = v3.PureComponent:extend("SliderWithLabelAndIcons");
v13.validateProps = v5.strictInterface({
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
v13.init = function(v14) --[[ Line: 42 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_FFlagAXMigrateSystemSliderToFoundationSlider_0 (copy), v7 (copy)
    v14.sliderRef = v3.createRef();
    if l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then
        v14.convertPositionValueToSliderValue = function(v15, v16, v17) --[[ Line: 46 ]]
            -- upvalues: v7 (ref)
            if v17 <= v16 then
                v7("SliderWithLabelAndIcons.lua convertPositionValueToSliderValue argument error: posMaxVal must be greater than posMinVal.");
                return 0.5;
            else
                return (v15 - v16) / (v17 - v16);
            end;
        end;
        v14.convertSliderValueToPositionValue = function(v18, v19, v20) --[[ Line: 56 ]]
            return v18 * (v20 - v19) + v19;
        end;
    end;
end;
v13.render = function(v21) --[[ Line: 62 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_FFlagAXMigrateSystemSliderToFoundationSlider_0 (copy), v3 (copy), l_ImageSetLabel_0 (copy), v2 (copy), l_Focusable_0 (copy), l_SystemSlider_0 (copy)
    return l_withStyle_0(function(v22) --[[ Line: 63 ]]
        -- upvalues: l_FFlagAXMigrateSystemSliderToFoundationSlider_0 (ref), v3 (ref), v21 (copy), l_ImageSetLabel_0 (ref), v2 (ref), l_Focusable_0 (ref), l_SystemSlider_0 (ref)
        local l_Font_0 = v22.Font;
        local l_BaseSize_0 = l_Font_0.BaseSize;
        local v25 = l_Font_0.CaptionHeader.RelativeSize * l_BaseSize_0;
        local l_Font_1 = l_Font_0.CaptionHeader.Font;
        local v27 = 50 - v25;
        if l_FFlagAXMigrateSystemSliderToFoundationSlider_0 then
            return v3.createElement("Frame", {
                Size = UDim2.new(0.9, 0, 0, 50), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                LayoutOrder = v21.props.layoutOrder
            }, {
                TopFrame = v3.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v25)
                }, {
                    SliderLabel = v3.createElement("TextLabel", {
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        Text = v21.props.text, 
                        Size = UDim2.new(1, -2 * v27, 1, 0), 
                        Position = UDim2.fromOffset(v27, 0), 
                        TextColor3 = v22.Theme.TextEmphasis.Color, 
                        Font = l_Font_1, 
                        TextSize = v25, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    })
                }), 
                BottomFrame = v3.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v27), 
                    Position = UDim2.fromOffset(0, v25)
                }, {
                    LeftIcon = v3.createElement(l_ImageSetLabel_0, {
                        BackgroundTransparency = 1, 
                        Image = v21.props.leftIcon, 
                        Size = UDim2.fromOffset(v27, v27), 
                        Position = UDim2.fromOffset(0, 0), 
                        ImageColor3 = v22.Theme.TextEmphasis.Color
                    }), 
                    SliderBar = v3.createElement(v2.Slider, {
                        range = NumberRange.new(0, 1), 
                        value = v21.convertPositionValueToSliderValue(v21.props.value, v21.props.min, v21.props.max), 
                        onValueChanged = function(v28) --[[ Line: 114 ]] --[[ Name: onValueChanged ]]
                            -- upvalues: v21 (ref)
                            local v29 = v21.convertSliderValueToPositionValue(v28, v21.props.min, v21.props.max);
                            v21.props.onSliderChanged(v29);
                        end, 
                        width = UDim.new(1, -2 * v27), 
                        Position = UDim2.new(0, v27, 0, 4), 
                        anchorPoint = Vector2.new(0, 0.5), 
                        NextSelectionUp = v21.props.NextSelectionUp, 
                        NextSelectionDown = v21.props.NextSelectionDown, 
                        [v3.Ref] = v21.props.baseRef
                    }), 
                    RightIcon = v3.createElement(l_ImageSetLabel_0, {
                        BackgroundTransparency = 1, 
                        Image = v21.props.rightIcon, 
                        AnchorPoint = Vector2.new(1, 0), 
                        Size = UDim2.fromOffset(v27, v27), 
                        Position = UDim2.fromScale(1, 0), 
                        ImageColor3 = v22.Theme.TextEmphasis.Color
                    })
                })
            });
        else
            return v3.createElement(l_Focusable_0.Frame, {
                Size = UDim2.new(0.9, 0, 0, 50), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                LayoutOrder = v21.props.layoutOrder, 
                defaultChild = v21.sliderRef, 
                [v3.Ref] = v21.props.baseRef
            }, {
                TopFrame = v3.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v25)
                }, {
                    SliderLabel = v3.createElement("TextLabel", {
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        Text = v21.props.text, 
                        Size = UDim2.new(1, -2 * v27, 1, 0), 
                        Position = UDim2.fromOffset(v27, 0), 
                        TextColor3 = v22.Theme.TextEmphasis.Color, 
                        Font = l_Font_1, 
                        TextSize = v25, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    })
                }), 
                BottomFrame = v3.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v27), 
                    Position = UDim2.fromOffset(0, v25)
                }, {
                    LeftIcon = v3.createElement(l_ImageSetLabel_0, {
                        BackgroundTransparency = 1, 
                        Image = v21.props.leftIcon, 
                        Size = UDim2.fromOffset(v27, v27), 
                        Position = UDim2.fromOffset(0, 0), 
                        ImageColor3 = v22.Theme.TextEmphasis.Color
                    }), 
                    SliderBar = v3.createElement(l_SystemSlider_0, {
                        min = v21.props.min, 
                        max = v21.props.max, 
                        stepInterval = 1, 
                        value = v21.props.value, 
                        onValueChanged = v21.props.onSliderChanged, 
                        width = UDim.new(1, -2 * v27), 
                        position = UDim2.new(0, v27, 0.5, 0), 
                        anchorPoint = Vector2.new(0, 0.5), 
                        NextSelectionUp = v21.props.NextSelectionUp, 
                        NextSelectionDown = v21.props.NextSelectionDown, 
                        [v3.Ref] = v21.sliderRef
                    }), 
                    RightIcon = v3.createElement(l_ImageSetLabel_0, {
                        BackgroundTransparency = 1, 
                        Image = v21.props.rightIcon, 
                        AnchorPoint = Vector2.new(1, 0), 
                        Size = UDim2.fromOffset(v27, v27), 
                        Position = UDim2.fromScale(1, 0), 
                        ImageColor3 = v22.Theme.TextEmphasis.Color
                    })
                })
            });
        end;
    end);
end;
return v13;