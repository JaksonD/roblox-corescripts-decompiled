local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Constants);
local v3 = require(l_Parent_1.Validator.validateTheme);
local v4 = {
    [v2.ThemeName.Dark:lower()] = require(l_Parent_0.DarkTheme), 
    [v2.ThemeName.Light:lower()] = require(l_Parent_0.LightTheme)
};
return function(v5) --[[ Line: 15 ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    local v6 = nil;
    if v5 ~= nil and #v5 > 0 then
        v6 = v4[v5:lower()];
    end;
    if v6 == nil then
        v6 = v4[v2.DefaultThemeName:lower()];
    end;
    assert(v3(v6));
    return v6;
end;