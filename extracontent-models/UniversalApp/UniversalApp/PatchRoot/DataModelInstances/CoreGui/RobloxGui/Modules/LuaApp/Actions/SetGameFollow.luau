local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
return require(l_Modules_0.Common.Action)(script.Name, function(v1, v2) --[[ Line: 9 ]]
    assert(type(v1) == "string", "SetGameFollow: universeId must be a string");
    assert(type(v2) == "boolean", "SetGameFollow: isFollowed must be a boolean");
    return {
        universeId = v1, 
        isFollowed = v2
    };
end);