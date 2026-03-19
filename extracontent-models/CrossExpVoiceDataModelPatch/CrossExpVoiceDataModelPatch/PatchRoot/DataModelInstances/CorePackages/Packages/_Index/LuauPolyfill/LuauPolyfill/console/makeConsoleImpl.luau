local l_inspect_0 = require(script.Parent.Parent.util).inspect;
return function() --[[ Line: 5 ]]
    -- upvalues: l_inspect_0 (copy)
    local v1 = {};
    local v2 = 0;
    local function _() --[[ Line: 9 ]] --[[ Name: indent ]]
        -- upvalues: v2 (ref)
        return string.rep("  ", v2);
    end;
    v1.log = function(v4, ...) --[[ Line: 13 ]] --[[ Name: log ]]
        -- upvalues: l_inspect_0 (ref), v2 (ref)
        local v5 = nil;
        v5 = if typeof(v4) == "string" then string.format(v4, ...) else l_inspect_0(v4);
        print(string.rep("  ", v2) .. v5);
    end;
    v1.debug = function(v6, ...) --[[ Line: 23 ]] --[[ Name: debug ]]
        -- upvalues: l_inspect_0 (ref), v2 (ref)
        local v7 = nil;
        v7 = if typeof(v6) == "string" then string.format(v6, ...) else l_inspect_0(v6);
        print(string.rep("  ", v2) .. v7);
    end;
    v1.info = function(v8, ...) --[[ Line: 33 ]] --[[ Name: info ]]
        -- upvalues: l_inspect_0 (ref), v2 (ref)
        local v9 = nil;
        v9 = if typeof(v8) == "string" then string.format(v8, ...) else l_inspect_0(v8);
        print(string.rep("  ", v2) .. v9);
    end;
    v1.warn = function(v10, ...) --[[ Line: 43 ]] --[[ Name: warn ]]
        -- upvalues: l_inspect_0 (ref), v2 (ref)
        local v11 = nil;
        v11 = if typeof(v10) == "string" then string.format(v10, ...) else l_inspect_0(v10);
        warn(string.rep("  ", v2) .. v11);
    end;
    v1.error = function(v12, ...) --[[ Line: 53 ]] --[[ Name: error ]]
        -- upvalues: l_inspect_0 (ref), v2 (ref)
        local v13 = nil;
        v13 = if typeof(v12) == "string" then string.format(v12, ...) else l_inspect_0(v12);
        warn(string.rep("  ", v2) .. v13);
    end;
    v1.group = function(v14, ...) --[[ Line: 65 ]] --[[ Name: group ]]
        -- upvalues: l_inspect_0 (ref), v2 (ref)
        local v15 = nil;
        v15 = if typeof(v14) == "string" then string.format(v14, ...) else l_inspect_0(v14);
        print(string.rep("  ", v2) .. v15);
        v2 = v2 + 1;
    end;
    v1.groupCollapsed = function(v16, ...) --[[ Line: 76 ]] --[[ Name: groupCollapsed ]]
        -- upvalues: l_inspect_0 (ref), v2 (ref)
        local v17 = nil;
        v17 = if typeof(v16) == "string" then string.format(v16, ...) else l_inspect_0(v16);
        print(string.rep("  ", v2) .. v17);
        v2 = v2 + 1;
    end;
    v1.groupEnd = function() --[[ Line: 88 ]] --[[ Name: groupEnd ]]
        -- upvalues: v2 (ref)
        if v2 > 0 then
            v2 = v2 - 1;
        end;
    end;
    return v1;
end;