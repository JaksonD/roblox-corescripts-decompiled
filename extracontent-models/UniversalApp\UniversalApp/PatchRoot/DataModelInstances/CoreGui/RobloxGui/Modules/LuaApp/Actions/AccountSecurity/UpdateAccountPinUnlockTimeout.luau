local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
return require(l_Modules_0.Common.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 5 ]]
    local v2 = true;
    if v1 ~= nil then
        v2 = typeof(v1) == "DateTime";
    end;
    assert(v2, "Expected the passed unlock time must be a valid `DateTime` or nil");
    return {
        accountPinUnlockedUntil = v1
    };
end);