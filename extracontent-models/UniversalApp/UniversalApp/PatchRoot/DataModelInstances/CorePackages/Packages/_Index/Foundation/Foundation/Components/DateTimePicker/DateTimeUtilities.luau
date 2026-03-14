local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_LocalizationService_0 = require(l_script_FirstAncestor_0.Utility.Wrappers).Services.LocalizationService;
local v2 = require(l_script_FirstAncestor_0.Utility.Localization.Translator);
local v3 = {
    [1] = v2:FormatByKey("CommonUI.Controls.Label.January"), 
    [2] = v2:FormatByKey("CommonUI.Controls.Label.February"), 
    [3] = v2:FormatByKey("CommonUI.Controls.Label.March"), 
    [4] = v2:FormatByKey("CommonUI.Controls.Label.April"), 
    [5] = v2:FormatByKey("CommonUI.Controls.Label.May"), 
    [6] = v2:FormatByKey("CommonUI.Controls.Label.June"), 
    [7] = v2:FormatByKey("CommonUI.Controls.Label.July"), 
    [8] = v2:FormatByKey("CommonUI.Controls.Label.August"), 
    [9] = v2:FormatByKey("CommonUI.Controls.Label.September"), 
    [10] = v2:FormatByKey("CommonUI.Controls.Label.October"), 
    [11] = v2:FormatByKey("CommonUI.Controls.Label.November"), 
    [12] = v2:FormatByKey("CommonUI.Controls.Label.December")
};
local v4 = {
    [1] = v2:FormatByKey("CommonUI.Controls.Label.SundayAbbreviated"), 
    [2] = v2:FormatByKey("CommonUI.Controls.Label.MondayAbbreviated"), 
    [3] = v2:FormatByKey("CommonUI.Controls.Label.TuesdayAbbreviated"), 
    [4] = v2:FormatByKey("CommonUI.Controls.Label.WednesdayAbbreviated"), 
    [5] = v2:FormatByKey("CommonUI.Controls.Label.ThursdayAbbreviated"), 
    [6] = v2:FormatByKey("CommonUI.Controls.Label.FridayAbbreviated"), 
    [7] = v2:FormatByKey("CommonUI.Controls.Label.SaturdayAbbreviated")
};
local function v8(v5, v6) --[[ Line: 34 ]] --[[ Name: getDaysInMonth ]]
    local v7 = {
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
    if v5 == 2 and (v6 % 4 == 0 and v6 % 100 ~= 0 or v6 % 400 == 0) then
        return 29;
    else
        return v7[v5];
    end;
end;
local function v12(v9, v10) --[[ Line: 48 ]] --[[ Name: getFirstDayOfWeek ]]
    local v11 = DateTime.fromLocalTime(v10, v9, 1);
    if v11 then
        return tonumber((v11:FormatLocalTime("d", "en-us"))) or 0;
    else
        return 0;
    end;
end;
local function v16(v13, v14) --[[ Line: 60 ]] --[[ Name: getLastDayOfWeek ]]
    -- upvalues: v8 (copy)
    local v15 = DateTime.fromLocalTime(v14, v13, (v8(v13, v14)));
    if v15 then
        return tonumber((v15:FormatLocalTime("d", "en-us"))) or 0;
    else
        return 0;
    end;
end;
local function v19(v17) --[[ Line: 72 ]] --[[ Name: roundToStartOfDay ]]
    local v18 = v17:ToLocalTime();
    return DateTime.fromLocalTime(v18.Year, v18.Month, v18.Day).UnixTimestamp;
end;
local function v22(v20) --[[ Line: 78 ]] --[[ Name: roundDownToNearestMinute ]]
    local v21 = v20:ToLocalTime();
    return DateTime.fromLocalTime(v21.Year, v21.Month, v21.Day, v21.Hour, v21.Minute, 0);
end;
local function v29(v23, v24) --[[ Line: 84 ]] --[[ Name: isDateWithinRange ]]
    local v25 = v24.startDate:ToLocalTime();
    local l_UnixTimestamp_0 = DateTime.fromLocalTime(v25.Year, v25.Month, v25.Day).UnixTimestamp;
    local v27 = v24.endDate:ToLocalTime();
    local l_UnixTimestamp_1 = DateTime.fromLocalTime(v27.Year, v27.Month, v27.Day).UnixTimestamp;
    v27 = v23:ToLocalTime();
    v25 = DateTime.fromLocalTime(v27.Year, v27.Month, v27.Day).UnixTimestamp;
    v27 = false;
    if l_UnixTimestamp_0 <= v25 then
        v27 = v25 <= l_UnixTimestamp_1;
    end;
    return v27;
end;
local function v41(v30) --[[ Line: 104 ]] --[[ Name: getHoursAndMinutesFromString ]]
    local v31 = v30:gsub("%s+", "");
    local v32 = string.match(v31, "^%d%d:%d%d$");
    local v33 = string.match(v31, "^%d%d?:%d%d[AP]M$");
    if not v32 and not v33 then
        return nil;
    else
        local v34 = nil;
        local v35 = nil;
        if v33 then
            local v36, v37 = string.match(v31, "^(%d%d?):(%d%d)[AP]M$");
            local v38 = tonumber(v36);
            v35 = tonumber(v37);
            if not v38 or not v35 or v38 < 1 or v38 > 12 or v35 < 0 or v35 > 59 then
                return nil;
            elseif string.sub(v31, -2) == "PM" and v38 ~= 12 then
                return v38 + 12, v35;
            elseif string.sub(v31, -2) == "AM" and v38 == 12 then
                return 0, v35;
            else
                return v38, v35;
            end;
        else
            local v39, v40 = string.match(v31, "^(%d%d?):(%d%d)$");
            v34 = tonumber(v39);
            v35 = tonumber(v40);
            if not v34 or not v35 or v34 < 0 or v34 > 23 or v35 < 0 or v35 > 59 then
                return nil;
            else
                return v34, v35;
            end;
        end;
    end;
end;
return {
    DATE_COMPOSITE_TOKEN = "L", 
    TIME_COMPOSITE_TOKEN = "LT", 
    formatLocalTime = function(v42, v43) --[[ Line: 220 ]] --[[ Name: formatLocalTime ]]
        -- upvalues: l_LocalizationService_0 (copy)
        local v44 = v42:FormatLocalTime("L", l_LocalizationService_0.RobloxLocaleId);
        if v43 then
            v44 = v44 .. ", " .. v42:FormatLocalTime("LT", l_LocalizationService_0.RobloxLocaleId);
        end;
        return v44;
    end, 
    getDaysInMonth = v8, 
    getFirstDayOfWeek = v12, 
    getLastDayOfWeek = v16, 
    getNextMonthInfo = function(v45, v46) --[[ Line: 213 ]] --[[ Name: getNextMonthInfo ]]
        if v45 == 12 then
            return 1, v46 + 1;
        else
            return v45 + 1, v46;
        end;
    end, 
    getPrevMonthInfo = function(v47, v48) --[[ Line: 206 ]] --[[ Name: getPrevMonthInfo ]]
        if v47 == 1 then
            return 12, v48 - 1;
        else
            return v47 - 1, v48;
        end;
    end, 
    isDateWithinRange = v29, 
    getDateTimeFromText = function(v49) --[[ Line: 159 ]] --[[ Name: getDateTimeFromText ]]
        -- upvalues: v41 (copy)
        local v50 = nil;
        local v51 = nil;
        if string.find(v49, ",") then
            local v52, v53 = v49:match("^([^,]+),%s*(.+)$");
            v50 = v52;
            v51 = v53;
        else
            v50 = v49;
            v51 = "00:00";
        end;
        if not v50 or not v51 then
            return nil;
        else
            local v54 = v50:gsub("%s+", "");
            local v55, v56 = v41(v51);
            if v50 then
                local v57 = v54:find("[/%.%-]");
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 183 ]]
                    -- upvalues: v57 (copy), v54 (copy), v55 (copy), v56 (copy)
                    if v57 == 3 then
                        local v58, v59, v60 = v54:match("^(%d%d)[/%.%-](%d%d)[/%.%-](%d%d%d%d)$");
                        return DateTime.fromLocalTime(tonumber(v60), tonumber(v58), tonumber(v59), v55, v56, 0);
                    elseif v57 == 5 then
                        local v61, v62, v63 = v54:match("^(%d%d%d%d)[/%.%-](%d%d)[/%.%-](%d%d)$");
                        return DateTime.fromLocalTime(tonumber(v61), tonumber(v62), tonumber(v63), v55, v56, 0);
                    else
                        error("Invalid date format: " .. v54);
                        return;
                    end;
                end);
                if l_status_0 and l_result_0 then
                    return l_result_0;
                end;
            end;
            return nil;
        end;
    end, 
    monthMap = v3, 
    roundDownToNearestMinute = v22, 
    roundToStartOfDay = v19, 
    weekdays = v4
};