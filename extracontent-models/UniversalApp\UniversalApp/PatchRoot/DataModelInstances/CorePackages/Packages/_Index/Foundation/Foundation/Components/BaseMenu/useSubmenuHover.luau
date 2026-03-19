local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local function _(v5, v6) --[[ Line: 36 ]] --[[ Name: truncatePath ]]
    local v7 = {};
    for v8 = 1, v6 do
        if v5[v8] then
            v7[v8] = v5[v8];
        end;
    end;
    return v7;
end;
local function _(v10, v11, v12) --[[ Line: 46 ]] --[[ Name: buildPath ]]
    local v13 = v11 - 1;
    local v14 = {};
    for v15 = 1, v13 do
        if v10[v15] then
            v14[v15] = v10[v15];
        end;
    end;
    local l_v14_0 = v14;
    l_v14_0[v11] = v12;
    return l_v14_0;
end;
return function() --[[ Line: 52 ]] --[[ Name: useSubmenuHover ]]
    -- upvalues: v4 (copy), v2 (copy)
    local v18 = v4();
    local l_Time_100_0 = v18.Time.Time_100;
    local l_Time_300_0 = v18.Time.Time_300;
    local v21, v22 = v2.useState({});
    local v23 = v2.useRef({});
    local v24 = v2.useRef(nil);
    local v25 = v2.useRef(nil);
    v23.current = v21;
    local v26 = v2.useCallback(function() --[[ Line: 64 ]]
        -- upvalues: v24 (copy), v25 (copy)
        if v24.current then
            task.cancel(v24.current);
            v24.current = nil;
        end;
        if v25.current then
            task.cancel(v25.current);
            v25.current = nil;
        end;
    end, {});
    local v44 = v2.useCallback(function(v27, v28, v29) --[[ Line: 75 ]]
        -- upvalues: v26 (copy), v23 (copy), v22 (copy), v24 (copy), l_Time_100_0 (copy)
        v26();
        if v23.current[v27] == v28 then
            return;
        elseif v29 then
            v22(function(v30) --[[ Line: 83 ]]
                -- upvalues: v27 (copy), v28 (copy)
                local l_v27_0 = v27;
                local l_v28_0 = v28;
                local v33 = l_v27_0 - 1;
                local v34 = {};
                for v35 = 1, v33 do
                    if v30[v35] then
                        v34[v35] = v30[v35];
                    end;
                end;
                local l_v34_0 = v34;
                l_v34_0[l_v27_0] = l_v28_0;
                return l_v34_0;
            end);
            return;
        else
            v24.current = task.delay(l_Time_100_0, function() --[[ Line: 89 ]]
                -- upvalues: v22 (ref), v27 (copy), v28 (copy), v24 (ref)
                v22(function(v37) --[[ Line: 90 ]]
                    -- upvalues: v27 (ref), v28 (ref)
                    local l_v27_1 = v27;
                    local l_v28_1 = v28;
                    local v40 = l_v27_1 - 1;
                    local v41 = {};
                    for v42 = 1, v40 do
                        if v37[v42] then
                            v41[v42] = v37[v42];
                        end;
                    end;
                    local l_v41_0 = v41;
                    l_v41_0[l_v27_1] = l_v28_1;
                    return l_v41_0;
                end);
                v24.current = nil;
            end);
            return;
        end;
    end, {
        v26, 
        l_Time_100_0
    });
    local v50 = v2.useCallback(function(v45) --[[ Line: 97 ]]
        -- upvalues: v26 (copy), v23 (copy), v25 (copy), l_Time_300_0 (copy), v22 (copy)
        v26();
        if #v23.current < v45 then
            return;
        else
            v25.current = task.delay(l_Time_300_0, function() --[[ Line: 104 ]]
                -- upvalues: v22 (ref), v45 (copy), v25 (ref)
                v22(function(v46) --[[ Line: 105 ]]
                    -- upvalues: v45 (ref)
                    if #v46 < v45 then
                        return v46;
                    else
                        local v47 = v45 - 1;
                        local v48 = {};
                        for v49 = 1, v47 do
                            if v46[v49] then
                                v48[v49] = v46[v49];
                            end;
                        end;
                        return v48;
                    end;
                end);
                v25.current = nil;
            end);
            return;
        end;
    end, {
        v26, 
        l_Time_300_0
    });
    local v51 = v2.useCallback(function() --[[ Line: 117 ]]
        -- upvalues: v26 (copy), v22 (copy)
        v26();
        v22({});
    end, {
        v26
    });
    v2.useEffect(function() --[[ Line: 123 ]]
        -- upvalues: v24 (copy), v25 (copy)
        return function() --[[ Line: 124 ]]
            -- upvalues: v24 (ref), v25 (ref)
            if v24.current then
                task.cancel(v24.current);
            end;
            if v25.current then
                task.cancel(v25.current);
            end;
        end;
    end, {});
    return {
        openPath = v21, 
        openAtDepth = v44, 
        closeAtDepth = v50, 
        reset = v51
    };
end;