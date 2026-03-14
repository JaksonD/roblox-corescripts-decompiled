local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineRichText");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.Dev.RobloxAppUIBloxConfig);
v2.init(v3);
local v4 = require(l_Parent_0.Dev.Roact);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_script_FirstAncestor_0.MockProviders);
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
return {
    roact = v4, 
    mapStory = function(v8) --[[ Line: 35 ]] --[[ Name: mapStory ]]
        -- upvalues: v7 (copy), v4 (copy), v6 (copy), v5 (copy)
        return function(v9) --[[ Line: 36 ]]
            -- upvalues: v7 (ref), v4 (ref), v6 (ref), v8 (copy), v5 (ref)
            local v10 = v9 and v9.definition and v9.definition.props or {};
            local v11 = v9 and v7[v9.theme] or v7.Default;
            return v4.createElement(v6, {
                themeName = v11.themeName
            }, {
                story = v4.createElement(v8, v5.Dictionary.union(v10, v9))
            });
        end;
    end
};