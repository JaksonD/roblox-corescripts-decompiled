local l_Parent_0 = script.Parent.Parent;
local l_inspect_0 = require(l_Parent_0.Collections).inspect;
return function() --[[ Line: 22 ]]
    -- upvalues: l_inspect_0 (copy)
    local v2 = {};
    local v3 = 0;
    local function _() --[[ Line: 26 ]] --[[ Name: indent ]]
        -- upvalues: v3 (ref)
        return string.rep("  ", v3);
    end;
    v2.log = function(v5, ...) --[[ Line: 30 ]] --[[ Name: log ]]
        -- upvalues: l_inspect_0 (ref), v3 (ref)
        local v6 = nil;
        v6 = if typeof(v5) == "string" then string.format(v5, ...) else l_inspect_0(v5);
        print(string.rep("  ", v3) .. v6);
    end;
    v2.debug = function(v7, ...) --[[ Line: 40 ]] --[[ Name: debug ]]
        -- upvalues: l_inspect_0 (ref), v3 (ref)
        local v8 = nil;
        v8 = if typeof(v7) == "string" then string.format(v7, ...) else l_inspect_0(v7);
        print(string.rep("  ", v3) .. v8);
    end;
    v2.info = function(v9, ...) --[[ Line: 50 ]] --[[ Name: info ]]
        -- upvalues: l_inspect_0 (ref), v3 (ref)
        local v10 = nil;
        v10 = if typeof(v9) == "string" then string.format(v9, ...) else l_inspect_0(v9);
        print(string.rep("  ", v3) .. v10);
    end;
    v2.warn = function(v11, ...) --[[ Line: 60 ]] --[[ Name: warn ]]
        -- upvalues: l_inspect_0 (ref), v3 (ref)
        local v12 = nil;
        v12 = if typeof(v11) == "string" then string.format(v11, ...) else l_inspect_0(v11);
        warn(string.rep("  ", v3) .. v12);
    end;
    v2.error = function(v13, ...) --[[ Line: 70 ]] --[[ Name: error ]]
        -- upvalues: l_inspect_0 (ref), v3 (ref)
        local v14 = nil;
        v14 = if typeof(v13) == "string" then string.format(v13, ...) else l_inspect_0(v13);
        warn(string.rep("  ", v3) .. v14);
    end;
    v2.group = function(v15, ...) --[[ Line: 82 ]] --[[ Name: group ]]
        -- upvalues: l_inspect_0 (ref), v3 (ref)
        local v16 = nil;
        v16 = if typeof(v15) == "string" then string.format(v15, ...) else l_inspect_0(v15);
        print(string.rep("  ", v3) .. v16);
        v3 = v3 + 1;
    end;
    v2.groupCollapsed = function(v17, ...) --[[ Line: 93 ]] --[[ Name: groupCollapsed ]]
        -- upvalues: l_inspect_0 (ref), v3 (ref)
        local v18 = nil;
        v18 = if typeof(v17) == "string" then string.format(v17, ...) else l_inspect_0(v17);
        print(string.rep("  ", v3) .. v18);
        v3 = v3 + 1;
    end;
    v2.groupEnd = function() --[[ Line: 105 ]] --[[ Name: groupEnd ]]
        -- upvalues: v3 (ref)
        if v3 > 0 then
            v3 = v3 - 1;
        end;
    end;
    return v2;
end;