local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator("RECEIVED_USER_INVITE_STATUS", function(v1, v2) --[[ Line: 5 ]]
    return {
        userId = tostring(v1), 
        inviteStatus = v2
    };
end);