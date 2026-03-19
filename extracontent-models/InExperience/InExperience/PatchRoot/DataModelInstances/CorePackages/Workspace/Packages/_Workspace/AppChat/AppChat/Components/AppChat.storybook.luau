local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Logger);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Dev.RobloxAppUIBloxConfig);
v3.init(v4);
local v5 = require(l_Parent_0.Roact);
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_script_FirstAncestor_0.Components.MockProviders);
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
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
l_Logger_0:addSink({
    maxLevel = l_Logger_0.Levels.fromString("trace"), 
    log = function(_, v11, _) --[[ Line: 38 ]] --[[ Name: log ]]
        print(v11);
    end
});
v2:setParent(l_Logger_0);
return {
    roact = v5, 
    mapStory = function(v13) --[[ Line: 47 ]] --[[ Name: mapStory ]]
        -- upvalues: v8 (copy), v5 (copy), v7 (copy), v6 (copy)
        return function(v14) --[[ Line: 48 ]]
            -- upvalues: v8 (ref), v5 (ref), v7 (ref), v13 (copy), v6 (ref)
            local v15 = v14 and v14.definition and v14.definition.props or {};
            local v16 = v14 and v8[v14.theme] or v8.Default;
            return v5.createElement(v7, {
                rodux = v15.rodux, 
                themeName = v16.themeName
            }, {
                story = v5.createElement(v13, v6.Dictionary.union(v15, v14))
            });
        end;
    end
};