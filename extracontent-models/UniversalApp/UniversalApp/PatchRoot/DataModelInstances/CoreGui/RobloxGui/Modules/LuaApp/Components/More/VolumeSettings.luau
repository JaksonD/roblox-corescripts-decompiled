local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v7 = require(l_Modules_0.LuaApp.Constants);
local v8 = require(l_Modules_0.LuaApp.Components.More.DeviceSettings.DeviceSettingsPageSetting);
local v9 = require(l_CorePackages_0.Packages.RoactRodux);
local l_ContextualSlider_0 = v3.App.Slider.ContextualSlider;
return (v9.connect(function(v11, _) --[[ Line: 110 ]]
    return {
        formFactor = v11.FormFactor
    };
end)(function(v13) --[[ Line: 30 ]] --[[ Name: VolumeSettings ]]
    -- upvalues: l_useStyle_0 (copy), l_useLocalization_0 (copy), l_FormFactor_0 (copy), v2 (copy), v8 (copy), v7 (copy), l_ContextualSlider_0 (copy)
    local v14 = l_useStyle_0();
    local v15 = l_useLocalization_0({
        volumeSliderDescription = v13.volumeSliderDescriptionKey, 
        volumeHeader = v13.volumeHeaderKey
    });
    local v16 = v13.formFactor == l_FormFactor_0.WIDE;
    local v17 = v14.Font.BaseSize * v14.Font.CaptionBody.RelativeSize;
    local l_Font_0 = v14.Font.CaptionBody.Font;
    local v19 = v14.Tokens.Global.Stroke_100 * 310;
    return v2.createElement(v8, {
        style = v14, 
        header = v15.volumeHeader, 
        description = v15.volumeSliderDescription, 
        layoutOrder = v13.layoutOrder, 
        topToBottom = not v16, 
        Control = v2.createElement("Frame", {
            Size = if v16 then UDim2.new(0, v19, 0, 0) else UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.Name, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, v7.MORE_PAGE_SECTION_PADDING)
            }), 
            ContextualSlider = if v13.value ~= nil then v2.createElement(l_ContextualSlider_0, {
                width = UDim.new(1, 0), 
                stepInterval = 1, 
                min = 0, 
                max = 10, 
                containerRef = v13.sliderGuiObjectRef, 
                value = math.clamp(v13.value * 10, 0, 10), 
                onValueChanged = v13.onValueChanged
            }) else nil, 
            Frame = v2.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, -10)
                }), 
                LeftText = v2.createElement("TextLabel", {
                    Size = UDim2.fromScale(1, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Text = tostring(0), 
                    Font = l_Font_0, 
                    TextSize = v17, 
                    TextColor3 = v14.Theme.TextMuted.Color, 
                    TextTransparency = v14.Theme.TextMuted.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LayoutOrder = 1
                }), 
                RightText = v2.createElement("TextLabel", {
                    Size = UDim2.fromScale(1, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Text = tostring(10), 
                    Font = l_Font_0, 
                    TextSize = v17, 
                    TextColor3 = v14.Theme.TextMuted.Color, 
                    TextTransparency = v14.Theme.TextMuted.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Right, 
                    LayoutOrder = 2
                })
            })
        })
    });
end));