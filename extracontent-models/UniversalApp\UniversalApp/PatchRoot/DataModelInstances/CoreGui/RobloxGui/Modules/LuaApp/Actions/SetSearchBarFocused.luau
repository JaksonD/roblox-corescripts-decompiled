local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator("SetSearchBarFocused", function(v1) --[[ Line: 4 ]]
    return {
        focused = v1
    };
end);