local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoverabilityModal");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_Dash_0 = v2.Dash;
local l_UIBlox_0 = v2.UIBlox;
local v6 = require(l_Parent_0.Dev.RobloxAppUIBloxConfig);
local l_mockLocale_0 = require(l_Parent_0.Dev.SocialTestHelpers).StoryHelpers.mockLocale;
l_UIBlox_0.init(v6);
local l_AppStyleProvider_0 = l_UIBlox_0.App.Style.AppStyleProvider;
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
    name = "DiscoverabilityModal", 
    storyRoot = l_script_FirstAncestor_0, 
    roact = l_Roact_0, 
    mapDefinition = function(v11) --[[ Line: 39 ]] --[[ Name: mapDefinition ]]
        -- upvalues: l_Dash_0 (copy), v10 (copy)
        local v12 = l_Dash_0.join(v10, v11.controls or {});
        return l_Dash_0.join(v11, {
            controls = v12
        });
    end, 
    mapStory = function(v13) --[[ Line: 43 ]] --[[ Name: mapStory ]]
        -- upvalues: l_Roact_0 (copy), l_AppStyleProvider_0 (copy), v9 (copy), l_mockLocale_0 (copy)
        return function(v14) --[[ Line: 44 ]]
            -- upvalues: l_Roact_0 (ref), l_AppStyleProvider_0 (ref), v9 (ref), l_mockLocale_0 (ref), v13 (copy)
            return l_Roact_0.createElement(l_AppStyleProvider_0, {
                style = v14 and v9[v14.theme] or v9.Default
            }, {
                Child = l_mockLocale_0(v13, v14)
            });
        end;
    end
};