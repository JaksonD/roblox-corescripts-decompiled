local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v1, v2, v3) --[[ Line: 11 ]]
    return {
        rangeId = v1, 
        color3 = v2, 
        sliderValue = v3
    };
end);