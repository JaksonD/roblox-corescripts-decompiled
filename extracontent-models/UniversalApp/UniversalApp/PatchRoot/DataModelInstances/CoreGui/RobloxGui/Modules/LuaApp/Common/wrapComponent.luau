local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Packages.React);
return function(v2) --[[ Line: 25 ]]
    return function(v3) --[[ Line: 26 ]]
        -- upvalues: v2 (copy)
        return function(v4) --[[ Line: 27 ]]
            -- upvalues: v2 (ref), v3 (copy)
            return v2(v3, v4);
        end;
    end;
end;