local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCards");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Dev.ReactRoblox);
local l_AppStyleProvider_0 = require(l_Parent_0.Dev.UIBlox).App.Style.AppStyleProvider;
local v6 = {
    Default = v2.Enums.Theme.Dark, 
    Light = v2.Enums.Theme.Light, 
    Dark = v2.Enums.Theme.Dark
};
local v7 = {
    Default = "Desktop", 
    Desktop = "Desktop", 
    Console = "Console"
};
return {
    name = l_script_FirstAncestor_0.Name, 
    roact = v3, 
    reactRoblox = v4, 
    storyRoot = l_script_FirstAncestor_0, 
    mapStory = function(v8) --[[ Line: 29 ]] --[[ Name: mapStory ]]
        -- upvalues: v6 (copy), v3 (copy), v2 (copy), v7 (copy), l_AppStyleProvider_0 (copy)
        return function(v9) --[[ Line: 30 ]]
            -- upvalues: v6 (ref), v3 (ref), v2 (ref), v7 (ref), l_AppStyleProvider_0 (ref), v8 (copy)
            local v10 = v9 and v6[v9.theme] or v6.Default;
            return v3.createElement(v2.FoundationProvider, {
                theme = v10, 
                device = v9 and v7[v9.platform] or v7.Default
            }, {
                AppStyleProvider = v3.createElement(l_AppStyleProvider_0, {
                    style = {
                        themeName = v10.themeName, 
                        fontName = "Gotham"
                    }
                }, {
                    Child = v3.createElement(v8, v9)
                })
            });
        end;
    end
};