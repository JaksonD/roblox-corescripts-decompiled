local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Otter);
return function(v2) --[[ Line: 5 ]] --[[ Name: getSizeSpringFromSettings ]]
    -- upvalues: v1 (copy)
    local l_SizeAnimation_0 = v2.SizeAnimation;
    if not l_SizeAnimation_0.Enabled then
        return v1.instant;
    else
        local v4 = {
            dampingRatio = l_SizeAnimation_0.SpringDampingRatio, 
            frequency = l_SizeAnimation_0.SpringFrequency
        };
        return function(v5) --[[ Line: 15 ]]
            -- upvalues: v1 (ref), v4 (copy)
            return v1.spring(v5, v4);
        end;
    end;
end;