local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
return require(l_Modules_0.Common.Action)(script.Name, function(v1, v2, v3) --[[ Line: 10 ]]
    assert(type(v1) == "string", "SetGameFollowingStatus: universeId must be a string");
    assert(type(v2) == "boolean", "SetGameFollowingStatus: canFollow must be a boolean");
    assert(type(v3) == "boolean", "SetGameFollowingStatus: isFollowed must be a boolean");
    return {
        universeId = v1, 
        canFollow = v2, 
        isFollowed = v3
    };
end);