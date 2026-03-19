local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.assign);
return function(v2, v3, v4) --[[ Line: 30 ]] --[[ Name: debounce ]]
    -- upvalues: v1 (copy)
    local v5 = {
        leading = false, 
        trailing = true
    };
    local v6 = v1(v5, v4);
    local v7 = 0;
    local v8 = nil;
    local v9 = false;
    local function v10() --[[ Line: 41 ]]

    end;
    if v6.trailing then
        v10 = function(v11, v12, ...) --[[ Line: 44 ]]
            -- upvalues: v7 (ref), v9 (ref), v2 (copy)
            if v7 == v11 then
                v9 = false;
                if not v12 then
                    v2(...);
                end;
            end;
        end;
    elseif v6.leading then
        v10 = function(v13) --[[ Line: 56 ]]
            -- upvalues: v7 (ref), v9 (ref)
            if v7 == v13 then
                v9 = false;
            end;
        end;
    end;
    return function(...) --[[ Line: 63 ]]
        -- upvalues: v7 (ref), v6 (copy), v9 (ref), v8 (ref), v2 (copy), v3 (copy), v10 (ref)
        v7 = v7 + 1;
        local l_v7_0 = v7;
        local v15 = v6.leading and not v9;
        if v8 then
            task.cancel(v8);
            v8 = nil;
        end;
        if v15 then
            v9 = true;
            v2(...);
        end;
        v8 = task.delay(v3, v10, l_v7_0, v15, ...);
    end;
end;