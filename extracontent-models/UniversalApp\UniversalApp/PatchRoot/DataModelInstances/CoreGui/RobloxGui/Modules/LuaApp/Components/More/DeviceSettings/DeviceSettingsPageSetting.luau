local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = v1.PureComponent:extend("DeviceSettingsPageSetting");
local v5 = require(l_Modules_0.LuaApp.Flags.FFlagEnableDevicePreferenceLayoutUpdate);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
v4.defaultProps = {
    topToBottom = false
};
v4.validateProps = v2.strictInterface({
    topToBottom = v2.optional(v2.boolean), 
    style = v2.table, 
    layoutOrder = v2.number, 
    header = v2.string, 
    description = v2.string, 
    Control = v2.table, 
    zIndex = v2.optional(v2.number)
});
local function v15(v7) --[[ Line: 31 ]] --[[ Name: WithHooksComponent ]]
    -- upvalues: l_useDesignTokens_0 (copy), v1 (copy), v5 (copy)
    local l_style_0 = v7.style;
    local l_BaseSize_0 = l_style_0.Font.BaseSize;
    local v10 = l_BaseSize_0 * l_style_0.Font.Header2.RelativeSize;
    local v11 = l_BaseSize_0 * l_style_0.Font.CaptionBody.RelativeSize;
    local l_Font_0 = l_style_0.Font.Header2.Font;
    local l_Font_1 = l_style_0.Font.CaptionBody.Font;
    local v14 = l_useDesignTokens_0();
    return v1.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        LayoutOrder = v7.layoutOrder, 
        ZIndex = v7.zIndex
    }, {
        Layout = if v7.topToBottom then v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }) else nil, 
        SettingInfoFrame = v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 1
        }, {
            Layout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, if v5 then v14.Global.Space_50 else 6)
            }), 
            SettingHeaderText = v1.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, v10), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = v7.header, 
                Font = l_Font_0, 
                TextSize = v10, 
                TextWrapped = true, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextColor3 = l_style_0.Theme.TextDefault.Color, 
                TextTransparency = l_style_0.Theme.TextDefault.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 1
            }), 
            SettingDescriptionText = v1.createElement("TextLabel", {
                Size = if v7.topToBottom then UDim2.new(1, 0, 0, 0) else UDim2.fromScale(0.65, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = v7.description, 
                Font = l_Font_1, 
                TextSize = v11, 
                TextColor3 = l_style_0.Theme.TextMuted.Color, 
                TextTransparency = l_style_0.Theme.TextMuted.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                LayoutOrder = 2
            })
        }), 
        SettingControlFrame = v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2
        }, {
            Layout = v1.createElement("UIListLayout", {
                HorizontalAlignment = if v7.topToBottom then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            UIPadding = if v7.topToBottom then v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, if v5 then v14.Global.Space_150 else 10), 
                PaddingBottom = UDim.new(0, if v5 then v14.Global.Space_50 else 10)
            }) else nil, 
            Control = v7.Control
        })
    });
end;
v4.render = function(v16) --[[ Line: 132 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v15 (copy)
    return v1.createElement(v15, v16.props);
end;
return v4;