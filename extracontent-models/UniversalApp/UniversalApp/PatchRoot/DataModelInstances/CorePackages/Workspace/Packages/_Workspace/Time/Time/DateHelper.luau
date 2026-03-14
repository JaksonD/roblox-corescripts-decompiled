local l_Parent_0 = script:FindFirstAncestor("Time").Parent;
local v1 = require(l_Parent_0.ArgCheck);
local v2 = require(script.Parent.TimeUnit);
local v3 = require(script.Parent.DateTime);
local v6 = {
    ReasonDateInvalid = {
        IsFutureDate = "IsFutureDate", 
        IsInvalidDayOfMonth = "IsInvalidDayOfMonth"
    }, 
    MonthsLocalizationKeys = {
        "CommonUI.Controls.Label.January", 
        "CommonUI.Controls.Label.February", 
        "CommonUI.Controls.Label.March", 
        "CommonUI.Controls.Label.April", 
        "CommonUI.Controls.Label.May", 
        "CommonUI.Controls.Label.June", 
        "CommonUI.Controls.Label.July", 
        "CommonUI.Controls.Label.August", 
        "CommonUI.Controls.Label.September", 
        "CommonUI.Controls.Label.October", 
        "CommonUI.Controls.Label.November", 
        "CommonUI.Controls.Label.December"
    }, 
    DateTypeOrder = setmetatable({
        ["en-us"] = {
            [v2.Months] = 1, 
            [v2.Days] = 2, 
            [v2.Years] = 3
        }, 
        ["es-es"] = {
            [v2.Days] = 1, 
            [v2.Months] = 2, 
            [v2.Years] = 3
        }, 
        ["fr-fr"] = {
            [v2.Days] = 1, 
            [v2.Months] = 2, 
            [v2.Years] = 3
        }, 
        ["de-de"] = {
            [v2.Days] = 1, 
            [v2.Months] = 2, 
            [v2.Years] = 3
        }, 
        ["pt-br"] = {
            [v2.Days] = 1, 
            [v2.Months] = 2, 
            [v2.Years] = 3
        }, 
        ["zh-cn"] = {
            [v2.Years] = 1, 
            [v2.Months] = 2, 
            [v2.Days] = 3
        }, 
        ["zh-cjv"] = {
            [v2.Years] = 1, 
            [v2.Months] = 2, 
            [v2.Days] = 3
        }, 
        ["zh-tw"] = {
            [v2.Years] = 1, 
            [v2.Months] = 2, 
            [v2.Days] = 3
        }, 
        ["ko-kr"] = {
            [v2.Years] = 1, 
            [v2.Months] = 2, 
            [v2.Days] = 3
        }, 
        ["ja-jp"] = {
            [v2.Years] = 1, 
            [v2.Months] = 2, 
            [v2.Days] = 3
        }, 
        ["it-it"] = {
            [v2.Days] = 1, 
            [v2.Months] = 2, 
            [v2.Years] = 3
        }, 
        ["ru-ru"] = {
            [v2.Days] = 1, 
            [v2.Months] = 2, 
            [v2.Years] = 3
        }, 
        ["id-id"] = {
            [v2.Days] = 1, 
            [v2.Months] = 2, 
            [v2.Years] = 3
        }, 
        ["vi-vn"] = {
            [v2.Days] = 1, 
            [v2.Months] = 2, 
            [v2.Years] = 3
        }, 
        ["th-th"] = {
            [v2.Days] = 1, 
            [v2.Months] = 2, 
            [v2.Years] = 3
        }, 
        ["tr-tr"] = {
            [v2.Days] = 1, 
            [v2.Months] = 2, 
            [v2.Years] = 3
        }
    }, {
        __index = function(_, _) --[[ Line: 115 ]] --[[ Name: __index ]]
            -- upvalues: v2 (copy)
            return {
                [v2.Years] = 1, 
                [v2.Months] = 2, 
                [v2.Days] = 3
            };
        end
    })
};
local v7 = {
    Prefix = "Prefix", 
    Suffix = "Suffix", 
    None = "None"
};
v6.DayAffixLocalizationKey = "CommonUI.Controls.Label.Day";
v6.DayAffixType = setmetatable({
    ["zh-cn"] = v7.Suffix, 
    ["zh-tw"] = v7.Suffix, 
    ["ko-kr"] = v7.Suffix, 
    ["ja-jp"] = v7.Suffix
}, {
    __index = function(_, _) --[[ Line: 137 ]] --[[ Name: __index ]]
        -- upvalues: v7 (copy)
        return v7.None;
    end
});
v6.YearAffixLocalizationKey = "CommonUI.Controls.Label.Year";
v6.YearAffixType = setmetatable({
    ["zh-cn"] = v7.Suffix, 
    ["zh-tw"] = v7.Suffix, 
    ["ko-kr"] = v7.Suffix, 
    ["ja-jp"] = v7.Suffix
}, {
    __index = function(_, _) --[[ Line: 149 ]] --[[ Name: __index ]]
        -- upvalues: v7 (copy)
        return v7.None;
    end
});
v6.GetFormattedDayString = function(v12, v13, v14, v15) --[[ Line: 154 ]] --[[ Name: GetFormattedDayString ]]
    -- upvalues: v2 (copy)
    return v12:GetFormattedString(v2.Days, v13, v14, v15);
end;
v6.GetFormattedYearString = function(v16, v17, v18, v19) --[[ Line: 158 ]] --[[ Name: GetFormattedYearString ]]
    -- upvalues: v2 (copy)
    return v16:GetFormattedString(v2.Years, v17, v18, v19);
end;
v6.GetFormattedString = function(v20, v21, v22, v23, v24) --[[ Line: 162 ]] --[[ Name: GetFormattedString ]]
    -- upvalues: v1 (copy), v2 (copy), v7 (copy)
    v1.isNotNil(v21, "timeUnit passed into DateHelper:GetFormattedString");
    v1.isNotNil(v23, "affix passed into DateHelper:GetFormattedString");
    v22 = v1.isType(tostring(v22), "string", "dateValue passed into DateHelper:GetFormattedString");
    local v25 = nil;
    if v21 == v2.Days then
        v25 = v20.DayAffixType[v24];
    elseif v21 == v2.Years then
        v25 = v20.YearAffixType[v24];
    end;
    if v25 == v7.Prefix then
        return v23 .. v22;
    elseif v25 == v7.Suffix then
        return v22 .. v23;
    else
        return v22;
    end;
end;
v6.GetFormattedFullString = function(v26, v27, v28, v29, v30, v31, v32, v33) --[[ Line: 183 ]] --[[ Name: GetFormattedFullString ]]
    -- upvalues: v1 (copy), v2 (copy)
    v27 = v1.isType(v27, "string", "localizedMonthString passed into DateHelper:GetFormattedFullString");
    v32 = v1.isType(v32, "string", "divider passed into DateHelper:GetFormattedFullString");
    v33 = v1.isType(v33, "string", "localeKey passed into DateHelper:GetFormattedFullString");
    local v34 = v26.DateTypeOrder[v33];
    local l_v26_FormattedDayString_0 = v26:GetFormattedDayString(v28, v29, v33);
    local l_v26_FormattedYearString_0 = v26:GetFormattedYearString(v30, v31, v33);
    local v37 = "";
    local v38 = {
        [v34[v2.Months]] = v27, 
        [v34[v2.Days]] = l_v26_FormattedDayString_0, 
        [v34[v2.Years]] = l_v26_FormattedYearString_0
    };
    for v39, v40 in ipairs(v38) do
        v37 = v37 .. v40;
        if v39 < #v38 then
            v37 = v37 .. v32;
        end;
    end;
    return v37;
end;
local function v42() --[[ Line: 214 ]] --[[ Name: getCurrentDate ]]
    -- upvalues: v3 (copy), v2 (copy), v1 (copy)
    local l_Values_0 = v3.now():GetValues();
    return {
        [v2.Months] = v1.isNonNegativeNumber(l_Values_0.Month, "current month in BirthdayPicker"), 
        [v2.Days] = v1.isNonNegativeNumber(l_Values_0.Day, "current day in BirthdayPicker"), 
        [v2.Years] = v1.isNonNegativeNumber(l_Values_0.Year, "current year in BirthdayPicker")
    };
end;
v6.getCurrentDate = function(_) --[[ Line: 224 ]] --[[ Name: getCurrentDate ]]
    -- upvalues: v42 (copy)
    return (v42());
end;
local function v46(v44) --[[ Line: 228 ]] --[[ Name: getCurrentDateWithOffset ]]
    -- upvalues: v3 (copy), v2 (copy), v1 (copy)
    local l_Values_1 = v3.fromUnixTimestamp(v3.now():GetUnixTimestamp() + v44):GetValues();
    return {
        [v2.Months] = v1.isNonNegativeNumber(l_Values_1.Month, "current month in BirthdayPicker"), 
        [v2.Days] = v1.isNonNegativeNumber(l_Values_1.Day, "current day in BirthdayPicker"), 
        [v2.Years] = v1.isNonNegativeNumber(l_Values_1.Year, "current year in BirthdayPicker")
    };
end;
v6.isLeapYear = function(_, v48) --[[ Line: 239 ]] --[[ Name: isLeapYear ]]
    local v49 = false;
    if v48 % 4 == 0 then
        v49 = true;
        if v48 % 100 == 0 then
            v49 = v48 % 400 == 0;
        end;
    end;
    return v49;
end;
local v50 = {};
v6._isFutureDate = function(_, v52, v53, v54, v55) --[[ Line: 245 ]] --[[ Name: _isFutureDate ]]
    -- upvalues: v2 (copy)
    if v52[v2.Years] < v55 then
        return true;
    elseif v55 == v52[v2.Years] and v52[v2.Months] < v53 then
        return true;
    elseif v55 == v52[v2.Years] and v53 == v52[v2.Months] and v52[v2.Days] < v54 then
        return true;
    else
        return false;
    end;
end;
v6.isFutureDate = function(v56, v57, v58, v59) --[[ Line: 261 ]] --[[ Name: isFutureDate ]]
    -- upvalues: v42 (copy)
    return v56:_isFutureDate(v42(), v57, v58, v59);
end;
v6.isRecentOrFutureDate = function(v60, v61, v62, v63) --[[ Line: 267 ]] --[[ Name: isRecentOrFutureDate ]]
    -- upvalues: v46 (copy)
    return v60:_isFutureDate(v46(-172800), v61, v62, v63);
end;
v6.getLastDayOfTheMonthInYear = function(v64, v65, v66) --[[ Line: 272 ]] --[[ Name: getLastDayOfTheMonthInYear ]]
    -- upvalues: v50 (copy)
    if v50[v65] and v50[v65][v66] then
        return v50[v65][v66];
    else
        local v67 = nil;
        v67 = if v65 == 2 then v64:isLeapYear(v66) and 29 or 28 else (not (not (v65 % 2 == 0) or v65 >= 7) or v65 % 2 == 1 and v65 > 7) and 30 or 31;
        if not v50[v65] then
            v50[v65] = {};
        end;
        v50[v65][v66] = v67;
        return v67;
    end;
end;
v6.isInvalidDayOfTheMonth = function(v68, v69, v70, v71) --[[ Line: 294 ]] --[[ Name: isInvalidDayOfTheMonth ]]
    return v68:getLastDayOfTheMonthInYear(v69, v71) < v70;
end;
v6.isValidDate = function(v72, v73, v74, v75) --[[ Line: 306 ]] --[[ Name: isValidDate ]]
    if v72:isRecentOrFutureDate(v73, v74, v75) then
        return false, v72.ReasonDateInvalid.IsFutureDate;
    elseif v72:isInvalidDayOfTheMonth(v73, v74, v75) then
        return false, v72.ReasonDateInvalid.IsInvalidDayOfMonth;
    else
        return true, nil;
    end;
end;
local function v81(v76, v77, v78) --[[ Line: 316 ]] --[[ Name: generateCellDatas ]]
    local v79 = {};
    for v80 = v76, v77, v78 or 1 do
        table.insert(v79, {
            text = tostring(v80), 
            value = v80
        });
    end;
    return v79;
end;
v6.generateMonthCellDatas = function(_) --[[ Line: 328 ]] --[[ Name: generateMonthCellDatas ]]
    -- upvalues: v81 (copy)
    return (v81(1, 12));
end;
v6.generateDayCellDatas = function(_) --[[ Line: 332 ]] --[[ Name: generateDayCellDatas ]]
    -- upvalues: v81 (copy)
    return (v81(1, 31));
end;
v6.generateYearCellDatas = function(_, v85, v86) --[[ Line: 336 ]] --[[ Name: generateYearCellDatas ]]
    -- upvalues: v42 (copy), v2 (copy), v81 (copy)
    local v87 = v42();
    local v88 = v86 or v87[v2.Years];
    local v89 = v85 or v86 - 100;
    return (v81(v88, v89, -1));
end;
return v6;