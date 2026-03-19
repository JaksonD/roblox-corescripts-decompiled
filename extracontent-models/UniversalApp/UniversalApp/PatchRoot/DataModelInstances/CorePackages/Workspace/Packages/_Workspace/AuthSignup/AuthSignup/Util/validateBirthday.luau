local l_Parent_0 = script:FindFirstAncestor("AuthSignup").Parent;
local l_Birthday_0 = require(l_Parent_0.AuthCommon).Models.Birthday;
local l_DateHelper_0 = require(l_Parent_0.Time).DateHelper;
return function(v3, v4, v5, v6) --[[ Line: 8 ]]
    -- upvalues: l_DateHelper_0 (copy), l_Birthday_0 (copy)
    local v7, _ = l_DateHelper_0:isValidDate(v3, v4, v5);
    if l_Birthday_0.new({
        Month = v3, 
        Day = v4, 
        Year = v5
    }):GetAgeInYears() < v6 then
        v7 = false;
    end;
    return v7;
end;