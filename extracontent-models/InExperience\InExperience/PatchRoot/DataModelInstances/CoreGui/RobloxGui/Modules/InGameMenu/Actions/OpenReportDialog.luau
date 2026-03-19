local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator("OPEN_REPORT_DIALOG", function(v1, v2) --[[ Line: 5 ]]
    return {
        userId = v1, 
        userName = v2
    };
end);