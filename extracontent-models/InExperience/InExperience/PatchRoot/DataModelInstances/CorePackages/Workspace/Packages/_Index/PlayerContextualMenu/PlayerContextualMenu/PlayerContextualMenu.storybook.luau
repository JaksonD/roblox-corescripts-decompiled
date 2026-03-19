local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayerContextualMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.Dev.Roact);
local v4 = require(l_Parent_0.Dev.SocialTestHelpers);
local v5 = require(l_Parent_0.UIBlox);
local v6 = require(l_Parent_0.Dev.RobloxAppUIBloxConfig);
local l_mockLocale_0 = v4.StoryHelpers.mockLocale;
v5.init(v6);
local l_AppStyleProvider_0 = v5.App.Style.AppStyleProvider;
v3.setGlobalConfig({
    elementTracing = true
});
local v9 = {
    Default = {
        themeName = "Light", 
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
local v10 = {
    language = "en-us"
};
return {
    name = "PlayerContextualMenu", 
    storyRoot = l_script_FirstAncestor_0, 
    roact = v3, 
    mapDefinition = function(v11) --[[ Line: 47 ]] --[[ Name: mapDefinition ]]
        -- upvalues: v2 (copy), v10 (copy)
        local v12 = v2.join(v10, v11.controls);
        return v2.join(v11, {
            controls = v12
        });
    end, 
    mapStory = function(v13) --[[ Line: 51 ]] --[[ Name: mapStory ]]
        -- upvalues: v3 (copy), l_AppStyleProvider_0 (copy), v9 (copy), l_mockLocale_0 (copy)
        return function(v14) --[[ Line: 52 ]]
            -- upvalues: v3 (ref), l_AppStyleProvider_0 (ref), v9 (ref), l_mockLocale_0 (ref), v13 (copy)
            return v3.createElement(l_AppStyleProvider_0, {
                style = v14 and v9[v14.theme] or v9.Default
            }, {
                Child = l_mockLocale_0(v13, v14)
            });
        end;
    end
};