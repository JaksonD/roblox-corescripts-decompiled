local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
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
return {
    name = "SduiSharedContent", 
    roact = v1, 
    reactRoblox = v6, 
    mapStory = function(v8) --[[ Line: 15 ]] --[[ Name: mapStory ]]
        -- upvalues: v1 (copy), l_FoundationProvider_0 (copy), v7 (copy), l_Device_0 (copy)
        return function(v9) --[[ Line: 16 ]]
            -- upvalues: v1 (ref), l_FoundationProvider_0 (ref), v7 (ref), l_Device_0 (ref), v8 (copy)
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
                FoundationContext = v1.createElement(l_FoundationProvider_0, {
                    theme = v7[v9.theme], 
                    device = l_Device_0[v9.platform], 
                    preferences = v9.settings, 
                    scale = v9.settings and v9.settings.scale
                }, {
                    Child = v1.createElement(v8, v9)
                })
            });
        end;
    end
};