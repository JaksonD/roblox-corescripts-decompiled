local l_Parent_0 = script.Parent.Parent.Parent;
local l_inspect_0 = require(l_Parent_0.LuauPolyfill).util.inspect;
return function(...) --[[ Line: 19 ]] --[[ Name: devPrint ]]
    -- upvalues: l_inspect_0 (copy)
    local v2 = {};
    for v3 = 1, select("#", ...) do
        local v4 = select(v3, ...);
        v2[v3] = l_inspect_0(v4);
    end;
    print(table.unpack(v2));
end;