local l_LocalizationService_0 = game:GetService("LocalizationService");
return function(v1, v2) --[[ Line: 3 ]] --[[ Name: formatDate ]]
    -- upvalues: l_LocalizationService_0 (copy)
    local v3 = DateTime.now();
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local _ = nil;
    return v1:gsub("{date}", v2:FormatLocalTime(v2:ToLocalTime().Year > v3:ToLocalTime().Year and "ll" or "ddd, MMM DD", l_RobloxLocaleId_0)):gsub("{time}", v2:FormatLocalTime("LT", l_RobloxLocaleId_0));
end;