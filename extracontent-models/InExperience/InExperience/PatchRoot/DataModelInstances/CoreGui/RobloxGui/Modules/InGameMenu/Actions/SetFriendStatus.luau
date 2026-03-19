local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator("SET_FRIEND_STATUS", function(v1, v2) --[[ Line: 5 ]]
    return {
        userId = v1, 
        friendStatus = v2
    };
end);