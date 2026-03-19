local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator("SET_CURRENT_PAGE", function(v1) --[[ Line: 5 ]]
    return {
        newPage = v1
    };
end);