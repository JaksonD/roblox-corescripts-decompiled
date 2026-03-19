local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local v1 = require(l_script_FirstAncestor_0.Components.ResultsList.WidgetListBreakPointEnum);
local v2 = require(l_script_FirstAncestor_0.Components.ResultsList.WidgetListBreakPointThresholds);
return function(v3, v4) --[[ Line: 14 ]] --[[ Name: getBreakpointFromRowWidth ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v5 = v4 or 1;
    if not v3 then
        return v1.Default;
    elseif v3 <= v2.XSmall * v5 then
        return v1.XSmall;
    elseif v3 <= v2.Small * v5 then
        return v1.Small;
    elseif v3 <= v2.Medium * v5 then
        return v1.Medium;
    elseif v3 <= v2.Large * v5 then
        return v1.Large;
    elseif v3 <= v2.XLarge * v5 then
        return v1.XLarge;
    else
        return v1.X2Large;
    end;
end;