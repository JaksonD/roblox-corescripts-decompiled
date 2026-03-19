local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v1, v2, v3, v4) --[[ Line: 4 ]]
    return {
        screenName = v1, 
        screenHeightPix = v2, 
        topYPix = v3, 
        viewportSizePix = v4
    };
end);