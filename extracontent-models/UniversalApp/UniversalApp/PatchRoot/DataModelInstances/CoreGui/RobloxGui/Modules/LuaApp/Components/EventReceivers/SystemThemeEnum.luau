game:DefineFastFlag("SystemThemeLuaEnabled10", false);
local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.t);
local v2 = {
    Light = Enum.SystemThemeValue.light, 
    Dark = Enum.SystemThemeValue.dark, 
    SystemLight = Enum.SystemThemeValue.systemLight, 
    SystemDark = Enum.SystemThemeValue.systemDark, 
    Error = Enum.SystemThemeValue.error
};
v2.getSystemThemeEnum = function(v3) --[[ Line: 27 ]] --[[ Name: getSystemThemeEnum ]]
    -- upvalues: v2 (copy), v1 (copy)
    for _, v5 in pairs(v2) do
        if v1.userdata(v5) and (v5.Name == v3 or v5.Value == v3) then
            return v5;
        end;
    end;
    return v2.Error;
end;
v2.isLightTheme = function(v6) --[[ Line: 36 ]] --[[ Name: isLightTheme ]]
    -- upvalues: v2 (copy)
    local v7 = true;
    if v6 ~= v2.Light then
        v7 = v6 == v2.SystemLight;
    end;
    return v7;
end;
v2.isDarkTheme = function(v8) --[[ Line: 40 ]] --[[ Name: isDarkTheme ]]
    -- upvalues: v2 (copy)
    local v9 = true;
    if v8 ~= v2.Dark then
        v9 = v8 == v2.SystemDark;
    end;
    return v9;
end;
v2.isSystemTheme = function(v10) --[[ Line: 44 ]] --[[ Name: isSystemTheme ]]
    -- upvalues: v2 (copy)
    local v11 = true;
    if v10 ~= v2.SystemLight then
        v11 = v10 == v2.SystemDark;
    end;
    return v11;
end;
if game:GetFastFlag("SystemThemeLuaEnabled10") then
    return require(l_CorePackages_0.Workspace.Packages.SystemTheme).Enum.SystemThemeEnum;
else
    return v2;
end;