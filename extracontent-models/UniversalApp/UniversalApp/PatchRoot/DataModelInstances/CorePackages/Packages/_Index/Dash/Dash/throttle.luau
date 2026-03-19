local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.assign);
return function(v2, v3, v4) --[[ Line: 43 ]] --[[ Name: throttle ]]
    -- upvalues: v1 (copy)
    local v5 = {
        leading = true, 
        trailing = true
    };
    local v6 = v1(v5, v4);
    local v7 = math.max(0, v3);
    local l_leading_0 = v6.leading;
    local l_trailing_0 = v6.trailing;
    local v10 = -1e999;
    local v11 = nil;
    local v12 = {};
    local function _() --[[ Line: 59 ]] --[[ Name: clearScheduled ]]
        -- upvalues: v11 (ref)
        if v11 then
            task.cancel(v11);
            v11 = nil;
        end;
    end;
    local function v14() --[[ Line: 66 ]] --[[ Name: invoke ]]
        -- upvalues: v10 (ref), v11 (ref), v2 (copy), v12 (ref)
        v10 = os.clock();
        v11 = nil;
        v2(table.unpack(v12));
    end;
    return function(...) --[[ Line: 73 ]]
        -- upvalues: v12 (ref), v10 (ref), l_leading_0 (copy), v7 (copy), v11 (ref), v2 (copy), l_trailing_0 (copy), v14 (copy)
        local v15 = os.clock();
        v12 = {
            ...
        };
        local v16 = v15 - v10;
        if l_leading_0 and v7 <= v16 then
            if v11 then
                task.cancel(v11);
                v11 = nil;
            end;
            v10 = os.clock();
            v11 = nil;
            v2(table.unpack(v12));
            return;
        else
            if l_trailing_0 and not v11 then
                local v17 = v10 == -1e999 and v15 or v10;
                local v18 = v7 - (v15 - v17);
                if v18 < 0 then
                    v18 = 0;
                end;
                v11 = task.delay(v18, v14);
            end;
            return;
        end;
    end;
end;