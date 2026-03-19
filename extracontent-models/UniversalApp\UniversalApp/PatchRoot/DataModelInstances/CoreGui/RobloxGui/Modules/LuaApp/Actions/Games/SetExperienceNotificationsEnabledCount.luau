local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
return require(l_Modules_0.Common.Action)(script.Name, function(v1) --[[ Line: 8 ]]
    assert(type(v1) == "number", "SetCanTurnOnExperienceNotificationsCount: count must be a number");
    return {
        count = v1
    };
end);