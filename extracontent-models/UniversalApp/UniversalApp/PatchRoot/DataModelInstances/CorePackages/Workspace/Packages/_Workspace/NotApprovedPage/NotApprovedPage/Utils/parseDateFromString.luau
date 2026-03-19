local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_RobloxLocaleIdKey_0 = require(l_Parent_0.Localization).RobloxLocaleIdKey;
local _ = require(l_script_FirstAncestor_0.Common.Types);
return function(v4, v5) --[[ Line: 12 ]] --[[ Name: parseDateFromString ]]
    -- upvalues: l_RobloxLocaleIdKey_0 (copy)
    local v6 = DateTime.fromIsoDate(v4);
    if not v6 then
        return v4;
    else
        return v6:FormatLocalTime("LLL", v5[l_RobloxLocaleIdKey_0]);
    end;
end;