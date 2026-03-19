local l_Parent_0 = script:FindFirstAncestor("InterventionShared").Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v2 = require(l_Parent_0.RobloxAppLocales).Localization.new(l_LocalizationService_0.RobloxLocaleId);
local v3 = {
    {
        threshold = 1380, 
        unit = 1440, 
        headingPlural = "Feature.InExperienceIntervention.Description.CannotSendDays", 
        headingSingle = "Feature.InExperienceIntervention.Description.CannotSend1Day"
    }, 
    {
        threshold = 59, 
        unit = 60, 
        headingPlural = "Feature.InExperienceIntervention.Description.CannotSendHours", 
        headingSingle = "Feature.InExperienceIntervention.Description.CannotSend1Hour"
    }, 
    {
        threshold = 1, 
        unit = 1, 
        headingPlural = "Feature.InExperienceIntervention.Description.CannotSend", 
        headingSingle = "Feature.InExperienceIntervention.Description.CannotSend1Min"
    }
};
return function(v4) --[[ Line: 39 ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v5 = "";
    for _, v7 in v3 do
        if v7.threshold <= v4 then
            local v8 = math.ceil(v4 / v7.unit);
            if v8 == 1 then
                return (v2:Format(v7.headingSingle));
            else
                return (v2:Format(v7.headingPlural, {
                    number = v8
                }));
            end;
        end;
    end;
    return v5;
end;