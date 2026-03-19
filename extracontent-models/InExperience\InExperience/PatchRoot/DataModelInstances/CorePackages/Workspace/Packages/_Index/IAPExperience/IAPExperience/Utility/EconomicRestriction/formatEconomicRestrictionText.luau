local l_script_FirstAncestor_0 = script:FindFirstAncestor("IAPExperience");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utility.EconomicRestriction.getEconomicRestrictionLocalizedLabel);
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local l_EconomicRestrictionsPromptShownCounter_0 = require(l_script_FirstAncestor_0.Generic.Events.PurchaseErrorPromptCounter).EconomicRestrictionsPromptShownCounter;
local v5 = require(l_script_FirstAncestor_0.Utility.logger);
local v6 = require(l_script_FirstAncestor_0.Utility.getAppContext);
return function(v7, v8, v9) --[[ Line: 14 ]]
    -- upvalues: l_default_0 (copy), l_EconomicRestrictionsPromptShownCounter_0 (copy), v6 (copy), v5 (copy), v2 (copy)
    local v10 = v8.timeoutMinutes or v8.expirationTimeInMinutes or v8.ExpirationTimeInMinutes;
    local v11 = v8.violationType or v8.failureReason or v8.FailureReason;
    l_default_0:logRobloxTelemetryCounter(l_EconomicRestrictionsPromptShownCounter_0, 1, {
        violationType = tostring(v11), 
        appContext = v6()
    });
    if not v10 or not v11 then
        v5.error({
            error = "Timeout and violationType is required for economic restriction text. Showing unknown error.", 
            timeoutMinutes = v10, 
            violationType = v11
        });
        return v7.unknownText;
    else
        local v12 = v2(v7, v11);
        local v13 = math.ceil(v10 / 60);
        if v13 >= 24 then
            local v14 = math.ceil(v13 / 24);
            return (if v9 then v7.economicRestrictionBaseTextDaysGeneral else v7.economicRestrictionBaseTextDays):gsub("{day}", (tostring(v14))):gsub("{violation}", v12);
        else
            return (if v9 then v7.economicRestrictionBaseTextHoursGeneral else v7.economicRestrictionBaseTextHours):gsub("{hour}", (tostring(v13))):gsub("{violation}", v12);
        end;
    end;
end;