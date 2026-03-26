local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local _ = require(l_Parent_0.Time).DateTime;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
local v5 = l_Localization_0.new(l_RobloxLocaleId_0);
return function(v6) --[[ Line: 20 ]]
    -- upvalues: v5 (copy)
    local v7 = DateTime.now().UnixTimestamp - v6.dateTime.UnixTimestamp;
    if v7 < 60 then
        return v5:Format("Feature.Chat.Label.TimestampNow");
    elseif v7 < 3600 then
        local v8 = math.floor(v7 / 60);
        if v8 == 1 then
            return v5:Format("Feature.Chat.Label.TimestampOneMinuteAbbreviated");
        else
            return v5:Format("Feature.Chat.Label.TimestampMinutesAbbreviatedPlural", {
                num_minutes = v8
            });
        end;
    elseif v7 < 86400 then
        local v9 = math.floor(v7 / 3600);
        if v9 == 1 then
            return v5:Format("Feature.Chat.Label.TimestampOneHourAbbreviated");
        else
            return v5:Format("Feature.Chat.Label.TimestampHoursAbbreviatedPlural", {
                num_hours = v9
            });
        end;
    elseif v7 < 604800 then
        local v10 = math.floor(v7 / 86400);
        if v10 == 1 then
            return v5:Format("Feature.Chat.Label.TimestampOneDayAbbreviated");
        else
            return v5:Format("Feature.Chat.Label.TimestampDaysAbbreviatedPlural", {
                num_days = v10
            });
        end;
    elseif v7 < 2592000 then
        local v11 = math.floor(v7 / 604800);
        if v11 == 1 then
            return v5:Format("Feature.Chat.Label.TimestampOneWeekAbbreviated");
        else
            return v5:Format("Feature.Chat.Label.TimestampWeeksAbbreviatedPlural", {
                num_weeks = v11
            });
        end;
    else
        return v6:Format("ll");
    end;
end;