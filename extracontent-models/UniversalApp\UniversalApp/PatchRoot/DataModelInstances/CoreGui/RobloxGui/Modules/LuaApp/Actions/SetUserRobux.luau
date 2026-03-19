local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
return require(l_Modules_0.Common.Action)(script.Name, function(v1, v2) --[[ Line: 9 ]]
    assert(type(v1) == "string", "SetUserRobux: universeId must be a string");
    assert(type(v2) == "number", "SetUserRobux: robux must be a number");
    return {
        userId = v1, 
        robux = v2
    };
end);