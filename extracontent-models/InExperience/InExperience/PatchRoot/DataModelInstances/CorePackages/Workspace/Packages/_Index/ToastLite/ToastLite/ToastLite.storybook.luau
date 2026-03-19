local l_script_FirstAncestor_0 = script:FindFirstAncestor("ToastLite");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Dev.ReactRoblox);
local v5 = require(l_Parent_0.Dev.RobloxAppUIBloxConfig);
v3.init(v5);
local l_AppStyleProvider_0 = v3.App.Style.AppStyleProvider;
local v7 = {
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
    name = "ToastLite", 
    storyRoot = l_script_FirstAncestor_0, 
    roact = v2, 
    reactRoblox = v4, 
    mapStory = function(v8) --[[ Line: 34 ]] --[[ Name: mapStory ]]
        -- upvalues: v2 (copy), l_AppStyleProvider_0 (copy), v7 (copy)
        return function(v9) --[[ Line: 35 ]]
            -- upvalues: v2 (ref), l_AppStyleProvider_0 (ref), v7 (ref), v8 (copy)
            return v2.createElement(l_AppStyleProvider_0, {
                style = v9 and v7[v9.theme] or v7.Default
            }, {
                Child = v2.createElement(v8, v9)
            });
        end;
    end
};