local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v4 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v8 = require(l_Modules_0.LuaApp.Constants);
local v9 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v10 = require(l_Modules_0.LuaApp.Components.More.MorePageScrollingFrame);
local v11 = require(script.Parent.DeviceSettingsPageContent);
local v12 = require(l_Modules_0.LuaApp.Components.More.withMorePagePaddings);
local v13 = require(l_Modules_0.LuaApp.Flags.FFlagEnableDevicePreferenceLayoutUpdate);
local v14 = require(l_Modules_0.LuaApp.Flags.FFlagPreventNavBarOverlapOverDevicePreferencePage);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v16 = v2.PureComponent:extend("DeviceSettingsPage");
v16.validateProps = v5.strictInterface({
    formFactor = v5.string, 
    platform = v5.EnumItem, 
    paddings = v5.optional(v5.strictInterface({
        paddingHorizontal = v5.number, 
        paddingVertical = v5.number, 
        contentMaxWidth = v5.number
    })), 
    roactAnalytics = v5.union(v5.Instance, v5.table)
});
local function v25(v17) --[[ Line: 55 ]] --[[ Name: WithHooksComponent ]]
    -- upvalues: l_useDesignTokens_0 (copy), v2 (copy), v10 (copy), v13 (copy), v8 (copy), v11 (copy), v9 (copy), v14 (copy)
    local v18 = nil;
    local v19 = nil;
    local v20 = nil;
    local l_paddings_0 = v17.paddings;
    local l_backgroundStyle_0 = v17.backgroundStyle;
    assert(l_paddings_0, "paddings must not be nil");
    v18 = l_paddings_0.paddingHorizontal;
    v19 = l_paddings_0.paddingVertical;
    v20 = l_paddings_0.contentMaxWidth;
    local v23 = l_useDesignTokens_0();
    local v24 = v2.createElement(v10, {
        Position = UDim2.fromScale(0, 0), 
        Size = UDim2.fromScale(1, 1), 
        maxWidth = v20
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, if v13 then v23.Global.Space_300 else v8.MORE_PAGE_SECTION_PADDING)
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v18), 
            PaddingRight = UDim.new(0, v18), 
            PaddingTop = UDim.new(0, v19), 
            PaddingBottom = UDim.new(0, v19)
        }), 
        Content = v2.createElement(v11)
    });
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_backgroundStyle_0.Color, 
        BackgroundTransparency = l_backgroundStyle_0.Transparency
    }, {
        TopBar = v2.createElement(v9.Container, {
            leftItem = v9.BackButton
        }), 
        PageContent = v2.createElement(v9.PageContent, {}, {
            UIPadding = if v14 then v2.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, v23.Global.Size_500)
            }) else nil, 
            Scroller = v24
        })
    });
end;
v16.render = function(v26) --[[ Line: 108 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v2 (copy), v25 (copy)
    return l_withStyle_0(function(v27) --[[ Line: 109 ]]
        -- upvalues: v2 (ref), v25 (ref), v26 (copy)
        return v2.createElement(v25, {
            paddings = v26.props.paddings, 
            backgroundStyle = v27.Theme.BackgroundDefault
        });
    end);
end;
v16.willUnmount = function(_) --[[ Line: 117 ]] --[[ Name: willUnmount ]]
    if game:GetEngineFeature("GlobalBasicSettingsSaveStateReflection") then
        task.spawn(function() --[[ Line: 119 ]]
            UserSettings():SaveState();
        end);
    end;
end;
v16 = v6.connect(function(v29, _) --[[ Line: 125 ]]
    return {
        formFactor = v29.FormFactor, 
        platform = v29.Platform
    };
end)(v16);
return v12((l_RoactServices_0.connect({
    roactAnalytics = v4
})(v16)));