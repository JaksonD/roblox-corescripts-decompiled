local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
return require(l_Modules_0.Common.Action)(script.Name, function(v1, v2) --[[ Line: 9 ]]
    assert(type(v1) == "string", "SetGamePrivateServersEnabled: universeId must be a string");
    assert(type(v2) == "boolean", "SetGamePrivateServersEnabled: isFavorited must be a boolean");
    return {
        universeId = v1, 
        privateServersEnabled = v2
    };
end);