local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSave").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_FoundationProvider_0 = v2.FoundationProvider;
local l_Theme_0 = v2.Enums.Theme;
local l_Device_0 = v2.Enums.Device;
local v6 = require(l_Parent_0.Dev.ReactRoblox);
local v7 = {
    Light = l_Theme_0.Light, 
    Dark = l_Theme_0.Dark
};
local v8 = {
    Console = l_Device_0.Console, 
    Desktop = l_Device_0.Desktop
};
local v9 = {
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
    name = "AvatarExperienceSave", 
    roact = v1, 
    reactRoblox = v6, 
    mapStory = function(v10) --[[ Line: 36 ]] --[[ Name: mapStory ]]
        -- upvalues: v7 (copy), v1 (copy), l_FoundationProvider_0 (copy), v9 (copy), v8 (copy)
        return function(v11) --[[ Line: 37 ]]
            -- upvalues: v7 (ref), v1 (ref), l_FoundationProvider_0 (ref), v9 (ref), v8 (ref), v10 (copy)
            local v12 = v7[v11.theme];
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
                FoundationProvider = v1.createElement(l_FoundationProvider_0, {
                    styleTable = v9, 
                    theme = v12, 
                    device = v8[v11.platform], 
                    DONOTUSE_colorUpdate = true
                }, {
                    Child = v1.createElement(v10, v11)
                })
            });
        end;
    end
};