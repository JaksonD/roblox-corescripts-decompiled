local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v1, v2, v3) --[[ Line: 10 ]]
    return {
        items = v1, 
        itemTypeId = v2, 
        recommendationsType = v3
    };
end);