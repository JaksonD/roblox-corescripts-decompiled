local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(script.Parent.RetryWithOverridableWait);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = v1.Dictionary.join(v3, {
        waitImpl = wait
    });
    return v2(v4);
end;