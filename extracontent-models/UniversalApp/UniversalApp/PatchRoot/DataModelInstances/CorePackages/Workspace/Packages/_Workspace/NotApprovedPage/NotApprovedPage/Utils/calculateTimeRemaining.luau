local l_Parent_0 = script:FindFirstAncestor("NotApprovedPage").Parent;
local v1 = require(l_Parent_0.MockableProxyServices);
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v4 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
return function(v5) --[[ Line: 21 ]] --[[ Name: calculateDaysRemaining ]]
    -- upvalues: v4 (copy), v1 (copy)
    local v6 = DateTime.fromIsoDate(v5);
    if not v6 then
        return v4:Format("Feature.NotApproved.Label.Hours", {
            hours = string.format("%02d", 0), 
            minutes = string.format("%02d", 0)
        });
    else
        local v7 = v1.Workspace:GetServerTimeNow() * 1000;
        local v8 = v6.UnixTimestampMillis - v7;
        if v8 < 0 then
            v8 = 0;
        end;
        if v8 > 86400000 then
            local v9 = math.ceil(v8 / 86400000);
            return v4:Format("Feature.NotApproved.Label.Days", {
                number = v9
            });
        else
            local v10 = math.floor(v8 / 3600000);
            local v11 = math.floor(v8 % 3600000 / 60000);
            if v8 > 0 and v8 < 60000 then
                v11 = 1;
            end;
            return v4:Format("Feature.NotApproved.Label.Hours", {
                hours = string.format("%02d", v10), 
                minutes = string.format("%02d", v11)
            });
        end;
    end;
end;