local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Dash);
return function(v2) --[[ Line: 26 ]] --[[ Name: wrapDispatchTable ]]
    -- upvalues: v1 (copy)
    return v1.map(v2, function(v3) --[[ Line: 27 ]]
        return function(...) --[[ Line: 28 ]]
            -- upvalues: v3 (copy)
            return v3(...);
        end;
    end);
end;