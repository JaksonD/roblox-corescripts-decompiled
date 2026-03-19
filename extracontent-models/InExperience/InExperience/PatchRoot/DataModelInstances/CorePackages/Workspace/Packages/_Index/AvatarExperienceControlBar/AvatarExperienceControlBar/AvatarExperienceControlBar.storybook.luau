local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceControlBar").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_FoundationProvider_0 = v2.FoundationProvider;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_Localization_0 = require(l_Parent_0.Dev.AppLocales).Localization;
local l_Theme_0 = v2.Enums.Theme;
local l_Device_0 = v2.Enums.Device;
local v8 = require(l_Parent_0.Dev.ReactRoblox);
local v9 = {
    Light = l_Theme_0.Light, 
    Dark = l_Theme_0.Dark
};
local v10 = {
    Console = l_Device_0.Console, 
    Desktop = l_Device_0.Desktop
};
local v11 = {
    Default = {
        themeName = "Dark", 
        fontName = "Gotham"
    }, 
    Light = {
        themeName = "Light", 
        fontName = "Gotham"
    }, 
    Dark = {
        themeName = "Dark", 
        fontName = "Gotham"
    }
};
return {
    name = "AvatarExperienceControlBar", 
    roact = v1, 
    reactRoblox = v8, 
    mapStory = function(v12) --[[ Line: 38 ]] --[[ Name: mapStory ]]
        -- upvalues: v9 (copy), v1 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_FoundationProvider_0 (copy), v11 (copy), v10 (copy)
        return function(v13) --[[ Line: 39 ]]
            -- upvalues: v9 (ref), v1 (ref), l_LocalizationProvider_0 (ref), l_Localization_0 (ref), l_FoundationProvider_0 (ref), v11 (ref), v10 (ref), v12 (copy)
            local v14 = v9[v13.theme];
            return v1.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                BackgroundTransparency = 1
            }, {
                UIPadding = v1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 10), 
                    PaddingBottom = UDim.new(0, 10), 
                    PaddingLeft = UDim.new(0, 10), 
                    PaddingRight = UDim.new(0, 10)
                }), 
                LocalizationProvider = v1.createElement(l_LocalizationProvider_0, {
                    localization = l_Localization_0.new("en-us")
                }, {
                    FoundationProvider = v1.createElement(l_FoundationProvider_0, {
                        styleTable = v11, 
                        theme = v14, 
                        device = v10[v13.platform], 
                        preferences = v13.settings, 
                        DONOTUSE_colorUpdate = true
                    }, {
                        Child = v1.createElement(v12, v13)
                    })
                })
            });
        end;
    end
};