local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.UniversalAppPolicy);
local v2 = require(l_Parent_0.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v2.FFlagAppIaScrollAway;
local l_FFlagAppIaScrollAwayGuac_0 = v2.FFlagAppIaScrollAwayGuac;
local v5 = game:DefineFastFlag("EnableFlyoutWithScrollAway", false);
local l_FlyoutSidePanelIXP_0 = require(l_Parent_0.SharedExperimentDefinition).FlyoutSidePanelIXP;
local function _() --[[ Line: 12 ]] --[[ Name: getScrollAwayEnabled ]]
    -- upvalues: l_FFlagAppIaScrollAway_0 (copy), l_FFlagAppIaScrollAwayGuac_0 (copy), v1 (copy), v5 (copy), l_FlyoutSidePanelIXP_0 (copy)
    if not l_FFlagAppIaScrollAway_0 then
        return false;
    elseif l_FFlagAppIaScrollAwayGuac_0 and not v1.getAppFeaturePolicies().getAppIaScrollAwayEnabled() then
        return false;
    elseif v5 and l_FlyoutSidePanelIXP_0.isScrollAwayEnabled() then
        return true;
    else
        return false;
    end;
end;
local v8 = nil;
return function() --[[ Line: 29 ]]
    -- upvalues: v8 (ref), l_FFlagAppIaScrollAway_0 (copy), l_FFlagAppIaScrollAwayGuac_0 (copy), v1 (copy), v5 (copy), l_FlyoutSidePanelIXP_0 (copy)
    if v8 == nil then
        v8 = not not l_FFlagAppIaScrollAway_0 and if not l_FFlagAppIaScrollAwayGuac_0 or v1.getAppFeaturePolicies().getAppIaScrollAwayEnabled() then v5 and l_FlyoutSidePanelIXP_0.isScrollAwayEnabled() and true or false else false;
    end;
    return v8;
end;