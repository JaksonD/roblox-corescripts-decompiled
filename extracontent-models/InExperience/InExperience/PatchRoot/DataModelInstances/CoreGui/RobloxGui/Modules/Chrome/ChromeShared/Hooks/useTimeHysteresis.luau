local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
return function(v2, v3, v4, v5, _) --[[ Line: 32 ]]
    -- upvalues: v1 (copy)
    if not v4 then
        v4 = v3;
    end;
    local v7, v8 = v1.useState(v5 or false);
    local v9, v10 = v1.useState(false);
    local v11 = v1.useRef(v5 or 0);
    local v12 = v1.useRef(false);
    v1.useEffect(function() --[[ Line: 48 ]]
        -- upvalues: v11 (copy), v10 (copy), v9 (copy), v7 (copy), v3 (copy), v2 (copy), v12 (copy), v4 (ref)
        local v13 = tick();
        local v14 = nil;
        local v15 = false;
        local function _(v16, v17, v18) --[[ Line: 53 ]]
            -- upvalues: v14 (ref), v15 (ref), v11 (ref), v10 (ref), v9 (ref)
            if v16 > 0 then
                v14 = task.delay(v16, function() --[[ Line: 55 ]]
                    -- upvalues: v15 (ref), v14 (ref), v11 (ref), v18 (copy), v10 (ref), v17 (copy)
                    v15 = true;
                    v14 = nil;
                    v11.current = v18;
                    v10(v17);
                end);
                return;
            else
                if v9 ~= v17 then
                    v15 = true;
                    v10(v17);
                end;
                return;
            end;
        end;
        if v7 then
            local v20 = v3 - v11.current;
            local l_v3_0 = v3;
            if v20 > 0 then
                local l_delay_0 = task.delay;
                local l_v20_0 = v20;
                local v24 = true;
                v14 = l_delay_0(l_v20_0, function() --[[ Line: 55 ]]
                    -- upvalues: v15 (ref), v14 (ref), v11 (ref), l_v3_0 (copy), v10 (ref), v24 (copy)
                    v15 = true;
                    v14 = nil;
                    v11.current = l_v3_0;
                    v10(v24);
                end);
            elseif v9 ~= true then
                v15 = true;
                v10(true);
            end;
        else
            local v25 = v11.current - v2;
            local l_v2_0 = v2;
            if v25 > 0 then
                local l_delay_1 = task.delay;
                local l_v25_0 = v25;
                local v29 = false;
                v14 = l_delay_1(l_v25_0, function() --[[ Line: 55 ]]
                    -- upvalues: v15 (ref), v14 (ref), v11 (ref), l_v2_0 (copy), v10 (ref), v29 (copy)
                    v15 = true;
                    v14 = nil;
                    v11.current = l_v2_0;
                    v10(v29);
                end);
            elseif v9 ~= false then
                v15 = true;
                v10(false);
            end;
        end;
        local l_v7_0 = v7;
        return function() --[[ Line: 74 ]]
            -- upvalues: v15 (ref), v14 (ref), v12 (ref), v13 (copy), l_v7_0 (copy), v11 (ref), v4 (ref)
            if not v15 then
                if v14 then
                    task.cancel(v14);
                end;
                if not v12.current then
                    local v31 = tick() - v13;
                    if not l_v7_0 then
                        v31 = v31 * -1;
                    end;
                    v11.current = math.clamp(v11.current + v31, 0, v4);
                end;
            end;
            v12.current = false;
        end;
    end, {
        v7, 
        v9, 
        v2, 
        v3, 
        v4
    });
    return v9, (v1.useCallback(function(v32, v33) --[[ Line: 91 ]]
        -- upvalues: v12 (copy), v11 (copy), v4 (ref), v8 (copy)
        v12.current = v33;
        if v33 then
            if v32 then
                v11.current = v4;
            else
                v11.current = 0;
            end;
        end;
        v8(v32);
    end, {
        v8
    }));
end;