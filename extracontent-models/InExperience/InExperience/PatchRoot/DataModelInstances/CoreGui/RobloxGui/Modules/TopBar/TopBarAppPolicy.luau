local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.PolicyProvider);
local v2 = v1.GetPolicyImplementations.MemStorageService("app-policy");
local v3 = v1.withGetPolicyImplementation(v2);
v3.Mapper = function(v4) --[[ Line: 7 ]]
    return {
        getDisplayVoiceBetaBadge = function() --[[ Line: 9 ]] --[[ Name: getDisplayVoiceBetaBadge ]]
            -- upvalues: v4 (copy)
            return v4.DisplayVoiceBetaBadge or false;
        end, 
        showBadgeOver12 = function() --[[ Line: 12 ]] --[[ Name: showBadgeOver12 ]]
            -- upvalues: v4 (copy)
            return v4.ShowBadgeOver12 or false;
        end
    };
end;
return v3;