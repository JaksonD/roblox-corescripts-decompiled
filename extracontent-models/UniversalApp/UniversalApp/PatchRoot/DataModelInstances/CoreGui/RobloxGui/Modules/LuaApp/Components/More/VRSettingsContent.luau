local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Roact);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v8.Core.Style.useStyle;
local v10 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_LinkButton_0 = v8.App.Button.LinkButton;
local v12 = require(l_Modules_0.LuaApp.Components.More.HapticsToggleSetting);
local v13 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert);
local v14 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v15 = require(l_Modules_0.LuaApp.Components.More.MasterVolumeSetting);
local v16 = require(l_Modules_0.LuaApp.Components.More.DeviceSettings.DeviceSettingsPageContent);
local l_FFlagVRUseStandardDeviceSettingPageContent_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagVRUseStandardDeviceSettingPageContent;
local function v20(v18) --[[ Line: 25 ]] --[[ Name: Divider ]]
    -- upvalues: v3 (copy)
    local l_style_0 = v18.style;
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 1), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_style_0.Theme.Divider.Color, 
        BackgroundTransparency = l_style_0.Theme.Divider.Transparency, 
        LayoutOrder = v18.layoutOrder
    });
end;
local v32 = v7.connect(nil, function(v21) --[[ Line: 210 ]]
    -- upvalues: v13 (copy), v14 (copy)
    return {
        openLeaveRobloxAlertUIBlox = function(v22) --[[ Line: 212 ]] --[[ Name: openLeaveRobloxAlertUIBlox ]]
            -- upvalues: v21 (copy), v13 (ref)
            v21(v13(v22));
        end, 
        closeAlert = function() --[[ Line: 215 ]] --[[ Name: closeAlert ]]
            -- upvalues: v21 (copy), v14 (ref)
            v21(v14());
        end
    };
end)(function(v23) --[[ Line: 36 ]] --[[ Name: VRSettingsContent ]]
    -- upvalues: v4 (copy), l_useStyle_0 (copy), v10 (copy), v3 (copy), l_LinkButton_0 (copy), v20 (copy), l_FFlagVRUseStandardDeviceSettingPageContent_0 (copy), v16 (copy), v15 (copy), v12 (copy)
    local v24 = v4.createRef();
    local v25 = l_useStyle_0();
    local v26 = v10({
        accountSettings = "Application.Settings.AccountSettingsTitle", 
        accountSettingsSubtitle = "Application.Settings.VRAccountSettingsSubtitle", 
        accountSettingsExplanation = "Application.Settings.VRAccountSettingsExplanation", 
        appSettingsTitle = "Application.Settings.AppSettingsTitle", 
        volumeSliderDescription = "Application.Settings.VolumeSliderDescription"
    });
    local l_BaseSize_0 = v25.Font.BaseSize;
    local v28 = l_BaseSize_0 * v25.Font.Title.RelativeSize;
    local v29 = l_BaseSize_0 * v25.Font.Header2.RelativeSize;
    local v31 = v3.useCallback(function() --[[ Line: 51 ]]
        -- upvalues: v23 (copy)
        v23.linking:openURL("https://www.roblox.com/my/account#!/info"):andThen(function(v30) --[[ Line: 52 ]]
            -- upvalues: v23 (ref)
            if v30 == false then
                v23.linking:openURL("https://www.roblox.com/my/account#!/info");
            end;
        end);
        v23.closeAlert();
    end, {
        v23.linking, 
        v23.closeAlert
    });
    return v3.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        LayoutOrder = 0, 
        [v4.Ref] = v24
    }, {
        Layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, 30)
        }), 
        AccountSettings = v3.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 0
        }, {
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 8)
            }), 
            AccountSettingsTitle = v3.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                Text = v26.accountSettings, 
                Font = v25.Font.Title.Font, 
                TextSize = v28, 
                TextColor3 = v25.Theme.TextDefault.Color, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 0
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 10)
                })
            }), 
            AccountSettingsSubTitle = v3.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                Text = v26.accountSettingsSubtitle, 
                Font = v25.Font.Header2.Font, 
                TextSize = v29, 
                TextColor3 = v25.Theme.TextEmphasis.Color, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 1
            }), 
            AccessExplanation = v3.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                Text = v26.accountSettingsExplanation, 
                Font = v25.Font.Title.Font, 
                TextSize = l_BaseSize_0 * v25.Font.Body.RelativeSize, 
                TextColor3 = v25.Theme.TextDefault.Color, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 2
            }), 
            Link = v3.createElement("Frame", {
                LayoutOrder = 3, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1
            }, v3.createElement(l_LinkButton_0, {
                text = "https://www.roblox.com/my/account#!/info", 
                minPaddingX = 0, 
                minPaddingY = 0, 
                onActivated = function() --[[ Line: 133 ]] --[[ Name: onActivated ]]
                    -- upvalues: v23 (copy), v31 (copy)
                    v23.openLeaveRobloxAlertUIBlox(v31);
                end
            }))
        }), 
        Divider1 = v20({
            style = v25, 
            layoutOrder = 2
        }), 
        AppSettings = v3.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, if l_FFlagVRUseStandardDeviceSettingPageContent_0 then {
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 8)
            }), 
            AppSettingsTitle = v3.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                Text = v26.appSettingsTitle, 
                Font = v25.Font.Title.Font, 
                TextSize = v28, 
                TextColor3 = v25.Theme.TextDefault.Color, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 0
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 10)
                })
            }), 
            DeviceSettings = v3.createElement(v16)
        } else {
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 8)
            }), 
            AppSettingsTitle = v3.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                Text = v26.appSettingsTitle, 
                Font = v25.Font.Title.Font, 
                TextSize = v28, 
                TextColor3 = v25.Theme.TextDefault.Color, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 0
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 10)
                })
            }), 
            MasterVolumeSetting = v3.createElement(v15, {
                sliderGuiObjectRef = v24, 
                layoutOrder = 1
            }), 
            Divider1 = v20({
                style = v25, 
                layoutOrder = 2
            }), 
            HapticsToggle = v3.createElement(v12, {
                layoutOrder = 3
            })
        })
    });
end);
return l_RoactServices_0.connect({
    roactAnalytics = v6, 
    linking = l_AppLinking_0
})(v32);