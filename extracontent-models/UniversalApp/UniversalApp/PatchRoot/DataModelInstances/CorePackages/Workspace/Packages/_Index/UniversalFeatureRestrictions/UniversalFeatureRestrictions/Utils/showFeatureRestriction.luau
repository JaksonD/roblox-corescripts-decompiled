local l_script_FirstAncestor_0 = script:FindFirstAncestor("UniversalFeatureRestrictions");
local v1 = require(l_script_FirstAncestor_0.Signals.featureRestrictionDisplaySignal);
local _ = require(l_script_FirstAncestor_0.Common.AbuseVector);
return function(v3, v4) --[[ Line: 17 ]] --[[ Name: showFeatureRestriction ]]
    -- upvalues: v1 (copy)
    v1:fire({
        abuseVector = v3, 
        options = v4
    });
end;