local l_Parent_0 = script.Parent.Parent.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
local v4 = l_Localization_0.new(l_RobloxLocaleId_0);
return function(v5, v6) --[[ Line: 15 ]]
    -- upvalues: v4 (copy), l_RobloxLocaleId_0 (copy)
    local v7 = v6 - v5;
    if v7 < 60000 then
        return v4:Format("Feature.ContentFeed.Timestamp.Now");
    elseif v7 < 3600000 then
        local v8 = math.floor(v7 / 60000);
        return v4:Format("Feature.ContentFeed.Timestamp.MinutesAgo", {
            numMinutes = v8
        });
    elseif v7 < 86400000 then
        local v9 = math.floor(v7 / 3600000);
        return v4:Format("Feature.ContentFeed.Timestamp.HoursAgo", {
            numHours = v9
        });
    elseif v7 < 604800000 then
        local v10 = math.floor(v7 / 86400000);
        return v4:Format("Feature.ContentFeed.Timestamp.DaysAgo", {
            numDays = v10
        });
    elseif v7 < 2419200000 then
        local v11 = math.floor(v7 / 604800000);
        return v4:Format("Feature.ContentFeed.Timestamp.WeeksAgo", {
            numWeeks = v11
        });
    else
        return (("%*"):format((DateTime.fromUnixTimestampMillis(v5):FormatLocalTime("L", l_RobloxLocaleId_0))));
    end;
end;