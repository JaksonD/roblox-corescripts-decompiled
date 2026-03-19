local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v2 = {
    50, 
    128, 
    150, 
    256, 
    512
};
return function(v3) --[[ Line: 15 ]]
    -- upvalues: v1 (copy), v2 (copy)
    v1.isNonNegativeNumber(v3, "Game Icon Size");
    local v4 = #v2;
    for _, v6 in ipairs(v2) do
        if v3 <= v6 then
            return v6;
        end;
    end;
    return v2[v4];
end;