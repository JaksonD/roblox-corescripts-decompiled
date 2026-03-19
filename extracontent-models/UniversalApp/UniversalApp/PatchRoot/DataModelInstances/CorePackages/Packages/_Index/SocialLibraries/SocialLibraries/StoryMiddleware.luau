local v0 = require(script.Parent.dependencies);
local l_Roact_0 = v0.Roact;
local l_AppStyleProvider_0 = v0.UIBlox.App.Style.AppStyleProvider;
local v3 = {
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
return function(v4) --[[ Line: 21 ]] --[[ Name: StoryMiddleware ]]
    -- upvalues: l_Roact_0 (copy), l_AppStyleProvider_0 (copy), v3 (copy)
    return function(v5) --[[ Line: 22 ]]
        -- upvalues: l_Roact_0 (ref), l_AppStyleProvider_0 (ref), v3 (ref), v4 (copy)
        return l_Roact_0.createElement(l_AppStyleProvider_0, {
            style = v5 and v3[v5.theme] or v3.Default
        }, {
            Child = l_Roact_0.createElement(v4, v5)
        });
    end;
end;