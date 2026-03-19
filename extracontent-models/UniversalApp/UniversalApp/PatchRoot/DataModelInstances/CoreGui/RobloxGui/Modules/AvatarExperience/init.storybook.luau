local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperience");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.ReactRoblox);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local l_FoundationProvider_0 = v4.FoundationProvider;
local l_Theme_0 = v4.Enums.Theme;
local l_Device_0 = v4.Enums.Device;
local v8 = {
    Light = l_Theme_0.Light, 
    Dark = l_Theme_0.Dark
};
local v9 = {
    Console = l_Device_0.Console, 
    Desktop = l_Device_0.Desktop
};
return {
    name = l_script_FirstAncestor_0.Name, 
    roact = v2, 
    reactRoblox = v3, 
    storyRoots = {
        l_script_FirstAncestor_0
    }, 
    mapStory = function(v10) --[[ Line: 22 ]] --[[ Name: mapStory ]]
        -- upvalues: v8 (copy), v2 (copy), l_FoundationProvider_0 (copy), v9 (copy)
        return function(v11) --[[ Line: 23 ]]
            -- upvalues: v8 (ref), v2 (ref), l_FoundationProvider_0 (ref), v9 (ref), v10 (copy)
            local v12 = v8[v11.theme];
            return v2.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                BackgroundTransparency = 1
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 10), 
                    PaddingBottom = UDim.new(0, 10), 
                    PaddingLeft = UDim.new(0, 10), 
                    PaddingRight = UDim.new(0, 10)
                }), 
                FoundationContext = v2.createElement(l_FoundationProvider_0, {
                    theme = v12, 
                    device = v9[v11.platform], 
                    preferences = v11.settings
                }, {
                    Child = v2.createElement(v10, v11)
                })
            });
        end;
    end
};