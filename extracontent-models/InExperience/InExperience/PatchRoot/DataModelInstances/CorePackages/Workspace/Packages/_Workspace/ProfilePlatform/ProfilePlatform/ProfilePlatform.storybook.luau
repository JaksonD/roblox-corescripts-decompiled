local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dev.Roact);
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(l_Parent_0.Rodux);
local v5 = require(l_Parent_0.UIBlox);
local v6 = require(l_Parent_0.Cryo);
local l_mockLocale_0 = require(l_Parent_0.Dev.SocialTestHelpers).StoryHelpers.mockLocale;
local v8 = require(l_Parent_0.Dev.RobloxAppUIBloxConfig);
v5.init(v8);
local l_AppStyleProvider_0 = v5.App.Style.AppStyleProvider;
v2.setGlobalConfig({
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
local function v13(v12) --[[ Line: 41 ]]
    -- upvalues: v4 (copy), v6 (copy)
    return v4.Store.new(function() --[[ Line: 42 ]]
        -- upvalues: v6 (ref), v12 (copy)
        return v6.Dictionary.join(v12, {
            ScreenSize = Vector2.new(600, 600)
        });
    end, {}, {
        v4.thunkMiddleware
    });
end;
return {
    name = "ProfilePlatform", 
    storyRoot = l_script_FirstAncestor_0, 
    roact = v2, 
    roactRodux = v3, 
    mapDefinition = function(v14) --[[ Line: 54 ]] --[[ Name: mapDefinition ]]
        -- upvalues: v6 (copy), v11 (copy)
        local v15 = v6.Dictionary.join(v11, v14.controls or {});
        return v6.Dictionary.join(v14, {
            controls = v15
        });
    end, 
    mapStory = function(v16) --[[ Line: 58 ]] --[[ Name: mapStory ]]
        -- upvalues: v2 (copy), l_AppStyleProvider_0 (copy), v10 (copy), v3 (copy), v13 (copy), l_mockLocale_0 (copy)
        return function(v17) --[[ Line: 59 ]]
            -- upvalues: v2 (ref), l_AppStyleProvider_0 (ref), v10 (ref), v3 (ref), v13 (ref), l_mockLocale_0 (ref), v16 (copy)
            local v18 = v17.definition.state or {};
            return v2.createElement(l_AppStyleProvider_0, {
                style = v17 and v10[v17.theme] or v10.Default
            }, {
                storeProvider = v2.createElement(v3.StoreProvider, {
                    store = v13(v18)
                }, {
                    Child = l_mockLocale_0(v16, v17)
                })
            });
        end;
    end
};