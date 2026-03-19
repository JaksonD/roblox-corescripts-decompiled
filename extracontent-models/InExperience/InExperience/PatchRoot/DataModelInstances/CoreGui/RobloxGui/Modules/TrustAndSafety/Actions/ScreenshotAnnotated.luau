local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v1, v2, v3) --[[ Line: 8 ]]
    return {
        reportCategory = v1, 
        reportType = v2, 
        annotationPoints = v3
    };
end);