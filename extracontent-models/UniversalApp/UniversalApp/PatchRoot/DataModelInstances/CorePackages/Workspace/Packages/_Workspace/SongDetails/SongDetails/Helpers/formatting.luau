local l_LocalizationService_0 = game:GetService("LocalizationService");
return {
    formatDate = function(v1, v2) --[[ Line: 26 ]]
        -- upvalues: l_LocalizationService_0 (copy)
        local v3 = DateTime.fromIsoDate(v1);
        return v3 and v3:FormatLocalTime(v2 or "ll", l_LocalizationService_0.RobloxLocaleId) or "";
    end, 
    formatDuration = function(v4) --[[ Line: 3 ]] --[[ Name: formatDuration ]]
        if v4 <= 0 then
            return "00:00";
        else
            local v5 = math.floor(v4 / 3600);
            local v6 = math.floor(v4 % 3600 / 60);
            local v7 = v4 % 60;
            local v8 = string.format("%02d", v5);
            local v9 = string.format("%02d", v6);
            local v10 = string.format("%02d", v7);
            local _ = "";
            if v5 > 0 then
                return v8 .. ":" .. v9 .. ":" .. v10;
            else
                return v9 .. ":" .. v10;
            end;
        end;
    end
};