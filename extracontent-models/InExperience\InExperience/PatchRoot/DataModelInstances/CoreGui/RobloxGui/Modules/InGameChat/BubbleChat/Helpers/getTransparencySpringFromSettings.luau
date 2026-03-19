local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Otter);
return function(v2) --[[ Line: 5 ]] --[[ Name: getTransparencySpringFromSettings ]]
    -- upvalues: v1 (copy)
    local l_TransparencyAnimation_0 = v2.TransparencyAnimation;
    if not l_TransparencyAnimation_0.Enabled then
        return v1.instant;
    else
        local v4 = {
            dampingRatio = l_TransparencyAnimation_0.SpringDampingRatio, 
            frequency = l_TransparencyAnimation_0.SpringFrequency
        };
        return function(v5) --[[ Line: 15 ]]
            -- upvalues: v1 (ref), v4 (copy)
            return v1.spring(v5, v4);
        end;
    end;
end;