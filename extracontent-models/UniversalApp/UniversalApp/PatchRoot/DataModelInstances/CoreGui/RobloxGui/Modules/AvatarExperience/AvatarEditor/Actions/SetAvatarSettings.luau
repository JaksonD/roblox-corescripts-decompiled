local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v1, v2, v3, v4, v5) --[[ Line: 6 ]]
    return {
        minimumDeltaEBodyColorDifference = v1, 
        scalesRules = v2, 
        accessoryRefinementTypes = v3, 
        accessoryRefinementLowerBounds = v4, 
        accessoryRefinementUpperBounds = v5
    };
end);