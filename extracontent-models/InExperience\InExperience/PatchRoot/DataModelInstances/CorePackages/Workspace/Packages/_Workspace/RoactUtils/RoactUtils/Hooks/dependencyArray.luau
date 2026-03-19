local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v1 = require(l_Parent_0.AppCommonLib).Symbol.named("NilDependency");
return function(...) --[[ Line: 22 ]] --[[ Name: dependencyArray ]]
    -- upvalues: v1 (copy)
    local v2 = {};
    for v3 = 1, select("#", ...) do
        local v4 = select(v3, ...);
        if v4 == nil then
            v4 = v1;
        end;
        v2[v3] = v4;
    end;
    return v2;
end;