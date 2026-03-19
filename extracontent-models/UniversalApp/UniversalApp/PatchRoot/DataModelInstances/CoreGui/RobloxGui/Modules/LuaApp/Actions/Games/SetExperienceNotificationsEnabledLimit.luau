local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
return require(l_Modules_0.Common.Action)(script.Name, function(v1) --[[ Line: 8 ]]
    assert(type(v1) == "number", "SetCanTurnOnExperienceNotificationsLimit: limit must be a number");
    return {
        limit = v1
    };
end);