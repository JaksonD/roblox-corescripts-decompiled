local l_script_FirstAncestor_0 = script:FindFirstAncestor("SystemTheme");
return function() --[[ Line: 3 ]]
    -- upvalues: l_script_FirstAncestor_0 (copy)
    return game:GetService("SystemThemeService") and game:GetService("SystemThemeService"):isSystemThemeAvailable() and require(l_script_FirstAncestor_0.Enum.SystemThemeEnum) or nil;
end;