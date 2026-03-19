local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator("SET_MORE_MENU_OPEN", function(v1) --[[ Line: 5 ]]
    return {
        isMainPageMoreMenuOpen = v1
    };
end);