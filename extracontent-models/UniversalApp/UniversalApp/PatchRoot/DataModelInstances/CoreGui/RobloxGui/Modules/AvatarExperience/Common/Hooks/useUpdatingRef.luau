local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
return function(v2) --[[ Line: 13 ]] --[[ Name: useUpdatingRef ]]
    -- upvalues: v1 (copy)
    local v3 = v1.useRef(v2);
    v3.current = v2;
    return v3;
end;