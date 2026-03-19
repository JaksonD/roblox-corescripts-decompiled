local _ = require(script.Parent.types);
local function _(v1) --[[ Line: 5 ]] --[[ Name: once ]]
    local v2 = false;
    return function() --[[ Line: 7 ]] --[[ Name: notAgain ]]
        -- upvalues: v2 (ref), v1 (copy)
        if not v2 then
            v2 = true;
            v1();
        end;
    end;
end;
local function v10(v4) --[[ Line: 16 ]] --[[ Name: disposeChildren ]]
    local v5 = {};
    for v6 = #v4, 1, -1 do
        local v7 = v4[v6];
        local l_status_0, l_result_0 = pcall(v7);
        if not l_status_0 then
            table.insert(v5, l_result_0);
        end;
    end;
    if #v5 > 0 then
        error(table.concat(v5, "\n"));
    end;
end;
return function(v11) --[[ Line: 32 ]] --[[ Name: createResource ]]
    -- upvalues: v10 (copy)
    local v12 = false;
    local v13 = {};
    local function v15() --[[ Line: 37 ]] --[[ Name: dispose ]]
        -- upvalues: v12 (ref), v13 (ref), v10 (ref)
        if not v12 then
            v12 = true;
            local l_v13_0 = v13;
            v13 = {};
            v10(l_v13_0);
        end;
    end;
    local function _(v16) --[[ Line: 46 ]] --[[ Name: capture ]]
        -- upvalues: v12 (ref), v13 (ref)
        if not v12 then
            table.insert(v13, v16);
            return;
        else
            error("attempted to track a child after the resource has been disposed");
            return;
        end;
    end;
    local function v19(v18, ...) --[[ Line: 54 ]] --[[ Name: own ]]
        -- upvalues: v12 (ref), v13 (ref)
        if not v12 then
            table.insert(v13, v18);
        else
            error("attempted to track a child after the resource has been disposed");
        end;
        return ...;
    end;
    local function v22(v20, ...) --[[ Line: 59 ]] --[[ Name: handleError ]]
        -- upvalues: v12 (ref), v13 (ref), v10 (ref)
        if not v20 then
            if not v12 then
                v12 = true;
                local l_v13_1 = v13;
                v13 = {};
                v10(l_v13_1);
            end;
            error((select(1, ...)));
        end;
        return ...;
    end;
    local v23 = false;
    local v24;
    do
        local l_v23_0 = v23;
        v24 = function() --[[ Line: 7 ]] --[[ Name: notAgain ]]
            -- upvalues: l_v23_0 (ref), v15 (copy)
            if not l_v23_0 then
                l_v23_0 = true;
                v15();
            end;
        end;
    end;
    return v24, v22(pcall(v11, v19));
end;