local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v1, v2, v3) --[[ Line: 5 ]]
    return {
        title = v1, 
        bodyText = v2, 
        dismissCallback = v3
    };
end);