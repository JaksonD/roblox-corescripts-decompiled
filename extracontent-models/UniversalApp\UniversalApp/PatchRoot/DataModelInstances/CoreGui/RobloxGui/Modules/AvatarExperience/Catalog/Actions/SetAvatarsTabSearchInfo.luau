local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v1, v2) --[[ Line: 4 ]]
    return {
        searchUuid = v1, 
        keyword = v2
    };
end);