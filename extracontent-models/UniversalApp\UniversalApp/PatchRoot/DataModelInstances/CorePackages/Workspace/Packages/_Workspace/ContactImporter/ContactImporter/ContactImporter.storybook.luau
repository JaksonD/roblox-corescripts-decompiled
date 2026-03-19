local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.UIBlox);
v2.init(require(l_Parent_1.Dev.RobloxAppUIBloxConfig));
local v3 = require(l_Parent_0.dependencies);
local l_Roact_0 = v3.Roact;
local l_llama_0 = v3.llama;
local l_mockLocale_0 = require(l_Parent_1.Dev.SocialTestHelpers).StoryHelpers.mockLocale;
local l_AppStyleProvider_0 = v2.App.Style.AppStyleProvider;
l_Roact_0.setGlobalConfig({
    propValidation = true, 
    elementTracing = true
});
local v8 = {
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
local v9 = {
    language = "en-us"
};
return {
    name = "ContactImporter", 
    storyRoot = l_Parent_0, 
    roact = l_Roact_0, 
    mapDefinition = function(v10) --[[ Line: 44 ]] --[[ Name: mapDefinition ]]
        -- upvalues: l_llama_0 (copy), v9 (copy)
        local v11 = l_llama_0.Dictionary.join(v9, v10.controls or {});
        return l_llama_0.Dictionary.join(v10, {
            controls = v11
        });
    end, 
    mapStory = function(v12) --[[ Line: 48 ]] --[[ Name: mapStory ]]
        -- upvalues: l_Roact_0 (copy), l_AppStyleProvider_0 (copy), v8 (copy), l_mockLocale_0 (copy)
        return function(v13) --[[ Line: 49 ]]
            -- upvalues: l_Roact_0 (ref), l_AppStyleProvider_0 (ref), v8 (ref), l_mockLocale_0 (ref), v12 (copy)
            return l_Roact_0.createElement(l_AppStyleProvider_0, {
                style = v13 and v8[v13.theme] or v8.Default
            }, {
                Child = l_mockLocale_0(v12, v13)
            });
        end;
    end
};