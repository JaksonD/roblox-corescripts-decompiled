local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local v1 = require(l_Parent_0.ArgCheck);
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local v3 = {};
local v4 = {};
v3[v4] = true;
v3.new = function(v5) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v6 = {
        Month = 1, 
        Day = 1, 
        Year = 1970
    };
    if v5 then
        v6.Month = v5.Month or v6.Month;
        v6.Day = v5.Day or v6.Day;
        v6.Year = v5.Year or v6.Year;
        v1.isNonNegativeNumber(v6.Month, "month in Birthday constructor");
        v1.isNonNegativeNumber(v6.Day, "day in Birthday constructor");
        v1.isNonNegativeNumber(v6.Year, "year in Birthday constructor");
    end;
    setmetatable(v6, v3);
    return v6;
end;
v3.IsUnder13 = function(v7) --[[ Line: 41 ]] --[[ Name: IsUnder13 ]]
    -- upvalues: v3 (copy), l_DateTime_0 (copy)
    local v8 = v3.new(l_DateTime_0.now():GetValues());
    if v8.Year - 13 < v7.Year then
        return true;
    elseif v8.Year - 13 > v7.Year then
        return false;
    else
        local v9 = true;
        if v8.Month >= v7.Month then
            v9 = false;
            if v8.Month == v7.Month then
                v9 = v8.Day < v7.Day;
            end;
        end;
        return v9;
    end;
end;
v3.GetAgeInYears = function(v10, v11) --[[ Line: 52 ]] --[[ Name: GetAgeInYears ]]
    -- upvalues: l_DateTime_0 (copy), v3 (copy)
    local v12 = v11 or l_DateTime_0.now():GetValues();
    local v13 = v3.new(v12);
    if v13.Month < v10.Month or v13.Month == v10.Month and v13.Day < v10.Day then
        return v13.Year - v10.Year - 1;
    else
        return v13.Year - v10.Year;
    end;
end;
v3.FormatForEndpoint = function(v14) --[[ Line: 63 ]] --[[ Name: FormatForEndpoint ]]
    return v14.Year .. "-" .. v14.Month .. "-" .. v14.Day .. "T12:00:00.000Z";
end;
v3.ToString = function(v15, v16) --[[ Line: 67 ]] --[[ Name: ToString ]]
    v16 = v16 or " ";
    return v15.Month .. v16 .. v15.Day .. v16 .. v15.Year;
end;
v3.is = function(v17) --[[ Line: 73 ]] --[[ Name: is ]]
    -- upvalues: v4 (copy)
    if type(v17) ~= "table" then
        return false;
    else
        return v17[v4] == true;
    end;
end;
v3.__index = v3;
return v3;