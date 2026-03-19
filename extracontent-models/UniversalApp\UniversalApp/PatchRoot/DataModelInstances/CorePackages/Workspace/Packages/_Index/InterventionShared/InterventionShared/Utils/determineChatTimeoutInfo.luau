local l_Parent_0 = script:FindFirstAncestor("InterventionShared").Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v2 = require(l_Parent_0.RobloxAppLocales).Localization.new(l_LocalizationService_0.RobloxLocaleId);
local v6 = {
    {
        threshold = 86400, 
        headingPlural = "Feature.InExperienceIntervention.Heading.ChatSuspension.Plural", 
        headingSingle = "Feature.InExperienceIntervention.Heading.ChatSuspension.1Day", 
        descriptionActive = "Feature.InExperienceIntervention.Description.ChatSuspension.Days", 
        descriptionActiveFormatFunction = function(v3) --[[ Line: 20 ]] --[[ Name: descriptionActiveFormatFunction ]]
            return (tostring((math.ceil(v3 / 86400))));
        end, 
        descriptionExpired = "Feature.InExperienceIntervention.Description.ChatSuspension.Day.Expired", 
        unitInSeconds = 86400
    }, 
    {
        threshold = 3600, 
        headingPlural = "Feature.InExperienceIntervention.Heading.ChatSuspension.MultiHour", 
        headingSingle = "Feature.InExperienceIntervention.Heading.ChatSuspension.1Hour", 
        descriptionActive = "Feature.InExperienceIntervention.Description.ChatSuspension.Hours", 
        descriptionActiveFormatFunction = function(v4) --[[ Line: 31 ]] --[[ Name: descriptionActiveFormatFunction ]]
            -- upvalues: l_LocalizationService_0 (copy)
            return DateTime.fromUnixTimestamp(v4):FormatUniversalTime("HH:mm", l_LocalizationService_0.RobloxLocaleId);
        end, 
        descriptionExpired = "Feature.InExperienceIntervention.Description.ChatSuspension.Hour.Expired", 
        unitInSeconds = 3600
    }, 
    {
        threshold = 1, 
        headingPlural = "Feature.InExperienceIntervention.Heading.ChatSuspension.MultiMinute", 
        headingSingle = "Feature.InExperienceIntervention.Heading.ChatSuspension.1Minute", 
        descriptionActive = "Feature.InExperienceIntervention.Description.ChatSuspension.Minutes", 
        descriptionActiveFormatFunction = function(v5) --[[ Line: 45 ]] --[[ Name: descriptionActiveFormatFunction ]]
            -- upvalues: l_LocalizationService_0 (copy)
            return DateTime.fromUnixTimestamp(v5):FormatUniversalTime("mm:ss", l_LocalizationService_0.RobloxLocaleId);
        end, 
        descriptionExpired = "Feature.InExperienceIntervention.Description.ChatSuspension.Minute.Expired", 
        unitInSeconds = 60
    }
};
local function v13(v7, v8) --[[ Line: 58 ]]
    -- upvalues: v2 (copy), v6 (copy)
    if v8 then
        return v2:Format("Feature.InExperienceIntervention.Heading.ChatSuspension.Expired");
    else
        local v9 = "";
        for _, v11 in v6 do
            if v7 == v11.unitInSeconds then
                return (v2:Format(v11.headingSingle));
            elseif v11.threshold < v7 then
                local v12 = math.ceil(v7 / v11.unitInSeconds);
                return (v2:Format(v11.headingPlural, {
                    number = v12
                }));
            end;
        end;
        return v9;
    end;
end;
return function(v14, v15) --[[ Line: 83 ]]
    -- upvalues: v13 (copy), v6 (copy), v2 (copy)
    if v14 == nil or v15 == nil then
        return 0, "", "";
    else
        local v16 = DateTime.now();
        local v17 = math.max(v14.UnixTimestamp - v16.UnixTimestamp, 0);
        local v18 = v15 / 1000000000;
        local v19 = v17 <= 0;
        local v20 = "";
        local v21 = v13(v18, v19);
        for _, v23 in v6 do
            if v19 then
                if v23.threshold <= v18 then
                    v20 = v2:Format(v23.descriptionExpired, {
                        number = math.ceil(v18 / v23.unitInSeconds)
                    });
                    break;
                end;
            elseif v23.threshold <= v17 then
                v20 = v2:Format(v23.descriptionActive, {
                    number = v23.descriptionActiveFormatFunction(v17)
                });
                break;
            end;
        end;
        return v17, v21, v20;
    end;
end;