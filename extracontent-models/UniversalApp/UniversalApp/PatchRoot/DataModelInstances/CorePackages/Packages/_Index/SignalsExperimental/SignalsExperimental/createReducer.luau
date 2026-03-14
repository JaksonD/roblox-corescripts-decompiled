local l_Parent_0 = script.Parent.Parent;
local l_createComputed_0 = require(l_Parent_0.Signals).createComputed;
return function(v2, v3) --[[ Line: 8 ]] --[[ Name: createReducer ]]
    -- upvalues: l_createComputed_0 (copy)
    local v4 = false;
    local v5 = nil;
    local function _() --[[ Line: 12 ]] --[[ Name: ensureInitialized ]]
        -- upvalues: v4 (ref), v5 (ref), v3 (copy)
        if not v4 then
            v4 = true;
            v5 = if typeof(v3) == "function" then v3() else v3;
        end;
    end;
    return l_createComputed_0(function(v7) --[[ Line: 19 ]]
        -- upvalues: v4 (ref), v5 (ref), v3 (copy), v2 (copy)
        if not v4 then
            v4 = true;
            v5 = if typeof(v3) == "function" then v3() else v3;
        end;
        v5 = v2(v7, v5);
        return v5;
    end);
end;