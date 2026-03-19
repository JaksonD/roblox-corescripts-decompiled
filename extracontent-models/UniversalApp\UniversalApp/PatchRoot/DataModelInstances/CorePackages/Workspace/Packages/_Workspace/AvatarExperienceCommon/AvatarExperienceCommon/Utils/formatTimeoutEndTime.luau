local l_LocalizationService_0 = game:GetService("LocalizationService");
return function(v1, v2) --[[ Line: 13 ]] --[[ Name: formatTimeoutEndTime ]]
    -- upvalues: l_LocalizationService_0 (copy)
    if not v1 or v1 == "" then
        return nil;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 18 ]]
            -- upvalues: v1 (copy)
            return DateTime.fromIsoDate(v1);
        end);
        if not l_status_0 or not l_result_0 then
            return nil;
        else
            return l_result_0:FormatLocalTime(v2 or "M/D, LT", l_LocalizationService_0.RobloxLocaleId);
        end;
    end;
end;