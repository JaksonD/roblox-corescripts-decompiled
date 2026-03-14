local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v3 = require(l_CorePackages_0.Packages.Foundation);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_SoundManager_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager;
local l_Sounds_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).Sounds;
local l_SoundGroups_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundGroups;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v12 = require(l_Modules_0.LuaApp.Constants);
local v13 = require(l_Modules_0.LuaApp.Components.More.DeviceSettings.DeviceSettingsPageSetting);
local v14 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Slider_0 = v3.Slider;
local l_GetFFlagEnableVolumeSliderQOLFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableVolumeSliderQOLFix;
return (v14.connect(function(v17, _) --[[ Line: 141 ]]
    return {
        formFactor = v17.FormFactor
    };
end)(function(v19) --[[ Line: 33 ]] --[[ Name: MasterVolumeSetting ]]
    -- upvalues: v4 (copy), l_UserGameSettings_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), l_FormFactor_0 (copy), l_GetFFlagEnableVolumeSliderQOLFix_0 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy), l_SoundGroups_0 (copy), v13 (copy), v12 (copy), l_Slider_0 (copy), v3 (copy)
    local v20, v21 = v4.useState(l_UserGameSettings_0.MasterVolume);
    local v22 = l_useStyle_0();
    local v23 = l_useLocalization_0({
        volumeSliderDescription = "Application.Settings.VolumeSliderDescription", 
        volumeHeader = "CoreScripts.InGameMenu.GameSettings.Volume"
    });
    local v24 = v19.formFactor == l_FormFactor_0.WIDE;
    local v25 = v22.Font.BaseSize * v22.Font.CaptionBody.RelativeSize;
    local l_Font_0 = v22.Font.CaptionBody.Font;
    local v27 = v22.Tokens.Global.Stroke_100 * 310;
    local v29 = v4.useCallback(function(v28) --[[ Line: 48 ]]
        -- upvalues: l_UserGameSettings_0 (ref)
        l_UserGameSettings_0.MasterVolume = v28 / 10;
    end, {});
    local v30 = nil;
    if l_GetFFlagEnableVolumeSliderQOLFix_0 then
        v30 = v4.useCallback(function() --[[ Line: 55 ]]
            -- upvalues: l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref)
            l_SoundManager_0:PlaySound(l_Sounds_0.Select.Name, {}, l_SoundGroups_0.AppBackground);
        end, {});
    end;
    v4.useEffect(function() --[[ Line: 60 ]]
        -- upvalues: l_UserGameSettings_0 (ref), v21 (copy), l_GetFFlagEnableVolumeSliderQOLFix_0 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref)
        local v32 = l_UserGameSettings_0:GetPropertyChangedSignal("MasterVolume"):Connect(function() --[[ Line: 61 ]]
            -- upvalues: l_UserGameSettings_0 (ref), v21 (ref), l_GetFFlagEnableVolumeSliderQOLFix_0 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref)
            local l_MasterVolume_0 = l_UserGameSettings_0.MasterVolume;
            v21(l_MasterVolume_0);
            if not l_GetFFlagEnableVolumeSliderQOLFix_0() then
                l_SoundManager_0:PlaySound(l_Sounds_0.VolumeTest.Name, {}, l_SoundGroups_0.AppBackground);
            end;
        end);
        return function() --[[ Line: 68 ]]
            -- upvalues: v32 (copy)
            if v32 then
                v32:Disconnect();
            end;
        end;
    end);
    return v4.createElement(v13, {
        style = v22, 
        header = v23.volumeHeader, 
        description = v23.volumeSliderDescription, 
        layoutOrder = v19.layoutOrder, 
        topToBottom = not v24, 
        Control = v4.createElement("Frame", {
            Size = if v24 then UDim2.new(0, v27, 0, 0) else UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            Layout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.Name, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, v12.MORE_PAGE_SECTION_PADDING)
            }), 
            ContextualVolumeSlider = v4.createElement(l_Slider_0, {
                width = UDim.new(1, 0), 
                step = 1, 
                range = NumberRange.new(0, 10), 
                value = math.clamp(v20 * 10, 0, 10), 
                size = v3.Enums.InputSize.Large, 
                knobVisibility = v3.Enums.ScrollBarVisibility.Always, 
                variant = v3.Enums.SliderVariant.Emphasis, 
                onValueChanged = v29, 
                onDragEnded = v30
            }), 
            Frame = v4.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                UIPadding = v4.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, -10)
                }), 
                LeftText = v4.createElement("TextLabel", {
                    Size = UDim2.fromScale(1, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Text = tostring(0), 
                    Font = l_Font_0, 
                    TextSize = v25, 
                    TextColor3 = v22.Theme.TextMuted.Color, 
                    TextTransparency = v22.Theme.TextMuted.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LayoutOrder = 1
                }), 
                RightText = v4.createElement("TextLabel", {
                    Size = UDim2.fromScale(1, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Text = tostring(10), 
                    Font = l_Font_0, 
                    TextSize = v25, 
                    TextColor3 = v22.Theme.TextMuted.Color, 
                    TextTransparency = v22.Theme.TextMuted.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Right, 
                    LayoutOrder = 2
                })
            })
        })
    });
end));