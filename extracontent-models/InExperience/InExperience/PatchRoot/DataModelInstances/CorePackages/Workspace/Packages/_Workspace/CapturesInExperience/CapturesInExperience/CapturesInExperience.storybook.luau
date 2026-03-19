local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Dash);
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_1.Dev.SocialTestHelpers);
local v5 = require(l_Parent_1.UIBlox);
local v6 = require(l_Parent_1.Dev.RobloxAppUIBloxConfig);
local v7 = require(l_Parent_0.Context.CapturesContext);
local l_mockLocale_0 = v4.StoryHelpers.mockLocale;
v5.init(v6);
local l_AppStyleProvider_0 = v5.App.Style.AppStyleProvider;
v3.setGlobalConfig({
    elementTracing = true
});
local v10 = {
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
local v11 = {
    language = "en-us"
};
return {
    name = "CapturesInExperience", 
    storyRoot = l_Parent_0, 
    roact = v3, 
    mapDefinition = function(v12) --[[ Line: 45 ]] --[[ Name: mapDefinition ]]
        -- upvalues: v2 (copy), v11 (copy)
        local v13 = v2.join(v11, v12.controls);
        return v2.join(v12, {
            controls = v13
        });
    end, 
    mapStory = function(v14) --[[ Line: 49 ]] --[[ Name: mapStory ]]
        -- upvalues: v3 (copy), v7 (copy), v2 (copy), l_AppStyleProvider_0 (copy), v10 (copy), l_mockLocale_0 (copy)
        return function(v15) --[[ Line: 50 ]]
            -- upvalues: v3 (ref), v7 (ref), v2 (ref), l_AppStyleProvider_0 (ref), v10 (ref), l_mockLocale_0 (ref), v14 (copy)
            return v3.createElement(v7.Provider, {
                value = {
                    fireAnalyticsEvent = v2.noop
                }
            }, {
                Element = v3.createElement(l_AppStyleProvider_0, {
                    style = v15 and v10[v15.theme] or v10.Default
                }, {
                    Child = l_mockLocale_0(v14, v15)
                })
            });
        end;
    end
};