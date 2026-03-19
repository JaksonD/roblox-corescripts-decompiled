local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UIBlox);
v2.init(require(l_Parent_0.Dev.RobloxAppUIBloxConfig));
local l_mockLocale_0 = require(l_Parent_0.Dev.SocialTestHelpers).StoryHelpers.mockLocale;
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.Dev.Roact);
local l_AppStyleProvider_0 = v2.App.Style.AppStyleProvider;
local v7 = {
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
local v8 = {
    language = "en-us"
};
return {
    name = "FriendsMenu", 
    storyRoot = l_script_FirstAncestor_0, 
    roact = v5, 
    mapDefinition = function(v9) --[[ Line: 39 ]] --[[ Name: mapDefinition ]]
        -- upvalues: v4 (copy), v8 (copy)
        local v10 = v4.Dictionary.join(v8, v9.controls or {});
        return v4.Dictionary.join(v9, {
            controls = v10
        });
    end, 
    mapStory = function(v11) --[[ Line: 43 ]] --[[ Name: mapStory ]]
        -- upvalues: v5 (copy), l_AppStyleProvider_0 (copy), v7 (copy), l_mockLocale_0 (copy)
        return function(v12) --[[ Line: 44 ]]
            -- upvalues: v5 (ref), l_AppStyleProvider_0 (ref), v7 (ref), l_mockLocale_0 (ref), v11 (copy)
            return v5.createElement(l_AppStyleProvider_0, {
                style = v12 and v7[v12.theme] or v7.Default
            }, {
                Child = l_mockLocale_0(v11, v12)
            });
        end;
    end
};