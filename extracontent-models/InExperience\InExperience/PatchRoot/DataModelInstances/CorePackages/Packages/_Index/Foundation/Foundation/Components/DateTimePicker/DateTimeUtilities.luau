local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Utility.Flags);
local l_LocalizationService_0 = require(l_script_FirstAncestor_0.Utility.Wrappers).Services.LocalizationService;
local v3 = require(l_script_FirstAncestor_0.Utility.Localization.Translator);
local l_FFlagFoundationDateTimePickerDSTFix_0 = v1.FFlagFoundationDateTimePickerDSTFix;
local v5 = {
    [1] = v3:FormatByKey("CommonUI.Controls.Label.January"), 
    [2] = v3:FormatByKey("CommonUI.Controls.Label.February"), 
    [3] = v3:FormatByKey("CommonUI.Controls.Label.March"), 
    [4] = v3:FormatByKey("CommonUI.Controls.Label.April"), 
    [5] = v3:FormatByKey("CommonUI.Controls.Label.May"), 
    [6] = v3:FormatByKey("CommonUI.Controls.Label.June"), 
    [7] = v3:FormatByKey("CommonUI.Controls.Label.July"), 
    [8] = v3:FormatByKey("CommonUI.Controls.Label.August"), 
    [9] = v3:FormatByKey("CommonUI.Controls.Label.September"), 
    [10] = v3:FormatByKey("CommonUI.Controls.Label.October"), 
    [11] = v3:FormatByKey("CommonUI.Controls.Label.November"), 
    [12] = v3:FormatByKey("CommonUI.Controls.Label.December")
};
local v6 = {
    [1] = v3:FormatByKey("CommonUI.Controls.Label.SundayAbbreviated"), 
    [2] = v3:FormatByKey("CommonUI.Controls.Label.MondayAbbreviated"), 
    [3] = v3:FormatByKey("CommonUI.Controls.Label.TuesdayAbbreviated"), 
    [4] = v3:FormatByKey("CommonUI.Controls.Label.WednesdayAbbreviated"), 
    [5] = v3:FormatByKey("CommonUI.Controls.Label.ThursdayAbbreviated"), 
    [6] = v3:FormatByKey("CommonUI.Controls.Label.FridayAbbreviated"), 
    [7] = v3:FormatByKey("CommonUI.Controls.Label.SaturdayAbbreviated")
};
local function v10(v7, v8) --[[ Line: 36 ]] --[[ Name: getDaysInMonth ]]
    local v9 = {
        31, 
        28, 
        31, 
        30, 
        31, 
        30, 
        31, 
        31, 
        30, 
        31, 
        30, 
        31
    };
    if v7 == 2 and (v8 % 4 == 0 and v8 % 100 ~= 0 or v8 % 400 == 0) then
        return 29;
    else
        return v9[v7];
    end;
end;
local function v14(v11, v12) --[[ Line: 50 ]] --[[ Name: getFirstDayOfWeek ]]
    local v13 = DateTime.fromLocalTime(v12, v11, 1);
    if v13 then
        return tonumber((v13:FormatLocalTime("d", "en-us"))) or 0;
    else
        return 0;
    end;
end;
local function v18(v15, v16) --[[ Line: 62 ]] --[[ Name: getLastDayOfWeek ]]
    -- upvalues: v10 (copy)
    local v17 = DateTime.fromLocalTime(v16, v15, (v10(v15, v16)));
    if v17 then
        return tonumber((v17:FormatLocalTime("d", "en-us"))) or 0;
    else
        return 0;
    end;
end;
local function v21(v19) --[[ Line: 74 ]] --[[ Name: roundToStartOfDay ]]
    local v20 = v19:ToLocalTime();
    return DateTime.fromLocalTime(v20.Year, v20.Month, v20.Day).UnixTimestamp;
end;
local function v24(v22) --[[ Line: 80 ]] --[[ Name: roundDownToNearestMinute ]]
    local v23 = v22:ToLocalTime();
    return DateTime.fromLocalTime(v23.Year, v23.Month, v23.Day, v23.Hour, v23.Minute, 0);
end;
local function v31(v25, v26) --[[ Line: 86 ]] --[[ Name: isDateWithinRange ]]
    local v27 = v26.startDate:ToLocalTime();
    local l_UnixTimestamp_0 = DateTime.fromLocalTime(v27.Year, v27.Month, v27.Day).UnixTimestamp;
    local v29 = v26.endDate:ToLocalTime();
    local l_UnixTimestamp_1 = DateTime.fromLocalTime(v29.Year, v29.Month, v29.Day).UnixTimestamp;
    v29 = v25:ToLocalTime();
    v27 = DateTime.fromLocalTime(v29.Year, v29.Month, v29.Day).UnixTimestamp;
    v29 = false;
    if l_UnixTimestamp_0 <= v27 then
        v29 = v27 <= l_UnixTimestamp_1;
    end;
    return v29;
end;
local function v43(v32) --[[ Line: 106 ]] --[[ Name: getHoursAndMinutesFromString ]]
    local v33 = v32:gsub("%s+", "");
    local v34 = string.match(v33, "^%d%d:%d%d$");
    local v35 = string.match(v33, "^%d%d?:%d%d[AP]M$");
    if not v34 and not v35 then
        return nil;
    else
        local v36 = nil;
        local v37 = nil;
        if v35 then
            local v38, v39 = string.match(v33, "^(%d%d?):(%d%d)[AP]M$");
            local v40 = tonumber(v38);
            v37 = tonumber(v39);
            if not v40 or not v37 or v40 < 1 or v40 > 12 or v37 < 0 or v37 > 59 then
                return nil;
            elseif string.sub(v33, -2) == "PM" and v40 ~= 12 then
                return v40 + 12, v37;
            elseif string.sub(v33, -2) == "AM" and v40 == 12 then
                return 0, v37;
            else
                return v40, v37;
            end;
        else
            local v41, v42 = string.match(v33, "^(%d%d?):(%d%d)$");
            v36 = tonumber(v41);
            v37 = tonumber(v42);
            if not v36 or not v37 or v36 < 0 or v36 > 23 or v37 < 0 or v37 > 59 then
                return nil;
            else
                return v36, v37;
            end;
        end;
    end;
end;
return {
    DATE_COMPOSITE_TOKEN = "L", 
    TIME_COMPOSITE_TOKEN = "LT", 
    formatLocalTime = function(v44, v45) --[[ Line: 233 ]] --[[ Name: formatLocalTime ]]
        -- upvalues: l_LocalizationService_0 (copy)
        local v46 = v44:FormatLocalTime("L", l_LocalizationService_0.RobloxLocaleId);
        if v45 then
            v46 = v46 .. ", " .. v44:FormatLocalTime("LT", l_LocalizationService_0.RobloxLocaleId);
        end;
        return v46;
    end, 
    getDaysInMonth = v10, 
    getFirstDayOfWeek = v14, 
    getLastDayOfWeek = v18, 
    getNextMonthInfo = function(v47, v48) --[[ Line: 226 ]] --[[ Name: getNextMonthInfo ]]
        if v47 == 12 then
            return 1, v48 + 1;
        else
            return v47 + 1, v48;
        end;
    end, 
    getPrevMonthInfo = function(v49, v50) --[[ Line: 219 ]] --[[ Name: getPrevMonthInfo ]]
        if v49 == 1 then
            return 12, v50 - 1;
        else
            return v49 - 1, v50;
        end;
    end, 
    isDateWithinRange = v31, 
    getDateTimeFromText = function(v51) --[[ Line: 161 ]] --[[ Name: getDateTimeFromText ]]
        -- upvalues: v43 (copy), l_FFlagFoundationDateTimePickerDSTFix_0 (copy)
        local v52 = nil;
        local v53 = nil;
        if string.find(v51, ",") then
            local v54, v55 = v51:match("^([^,]+),%s*(.+)$");
            v52 = v54;
            v53 = v55;
        else
            v52 = v51;
            v53 = "00:00";
        end;
        if not v52 or not v53 then
            return nil;
        else
            local v56 = v52:gsub("%s+", "");
            local v57, v58 = v43(v53);
            if v52 then
                local v59 = v56:find("[/%.%-]");
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 185 ]]
                    -- upvalues: v59 (copy), v56 (copy), v57 (copy), v58 (copy)
                    if v59 == 3 then
                        local v60, v61, v62 = v56:match("^(%d%d)[/%.%-](%d%d)[/%.%-](%d%d%d%d)$");
                        return DateTime.fromLocalTime(tonumber(v62), tonumber(v60), tonumber(v61), v57, v58, 0);
                    elseif v59 == 5 then
                        local v63, v64, v65 = v56:match("^(%d%d%d%d)[/%.%-](%d%d)[/%.%-](%d%d)$");
                        return DateTime.fromLocalTime(tonumber(v63), tonumber(v64), tonumber(v65), v57, v58, 0);
                    else
                        error("Invalid date format: " .. v56);
                        return;
                    end;
                end);
                if l_status_0 and l_result_0 then
                    if l_FFlagFoundationDateTimePickerDSTFix_0 and os.date("*t", l_result_0.UnixTimestamp).isdst then
                        local l_UnixTimestamp_2 = l_result_0.UnixTimestamp;
                        l_result_0 = DateTime.fromUnixTimestamp(l_UnixTimestamp_2 - 3600);
                    end;
                    return l_result_0;
                end;
            end;
            return nil;
        end;
    end, 
    monthMap = v5, 
    roundDownToNearestMinute = v24, 
    roundToStartOfDay = v21, 
    weekdays = v6
};