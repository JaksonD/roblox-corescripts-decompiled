local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.t);
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local _ = function(v3, v4) --[[ Line: 28 ]] --[[ Name: hasValue ]]
    for _, v6 in v3 do
        if v6 == v4 then
            return true;
        end;
    end;
    return false;
end;
local _ = function(v8, v9) --[[ Line: 37 ]] --[[ Name: matches ]]
    if v8 and v9 then
        if typeof(v9) == "table" then
            for _, v11 in v9 do
                if v11 == v8 then
                    return true;
                end;
            end;
            return false;
        else
            return v9 == v8;
        end;
    else
        return true;
    end;
end;
local function v13(v14, v15, v16, v17, v18) --[[ Line: 48 ]] --[[ Name: readValue ]]
    -- upvalues: l_Array_0 (copy), v13 (copy)
    local v19 = v14[v17];
    local v20 = if v19 ~= nil then v18 else -1;
    l_Array_0.forEach(v14, function(v21) --[[ Line: 51 ]]
        -- upvalues: v15 (copy), v16 (copy), v13 (ref), v17 (copy), v18 (copy), v20 (ref), v19 (ref)
        local v22 = false;
        local v23 = false;
        local l_v15_0 = v15;
        local l_breakpoint_0 = v21.breakpoint;
        local v26;
        if l_v15_0 and l_breakpoint_0 then
            if typeof(l_breakpoint_0) == "table" then
                for _, v28 in l_breakpoint_0 do
                    if v28 == l_v15_0 then
                        v26 = true;
                        v22 = true;
                    end;
                    if v22 then
                        break;
                    end;
                end;
                if not v22 then
                    v26 = false;
                end;
            else
                v26 = l_breakpoint_0 == l_v15_0;
            end;
        else
            v26 = true;
        end;
        v22 = false;
        if v26 then
            l_v15_0 = v16;
            l_breakpoint_0 = v21.kind;
            if l_v15_0 and l_breakpoint_0 then
                if typeof(l_breakpoint_0) == "table" then
                    for _, v30 in l_breakpoint_0 do
                        if v30 == l_v15_0 then
                            v26 = true;
                            v23 = true;
                        end;
                        if v23 then
                            break;
                        end;
                    end;
                    if not v23 then
                        v26 = false;
                    end;
                else
                    v26 = l_breakpoint_0 == l_v15_0;
                end;
            else
                v26 = true;
            end;
            v23 = false;
            if v26 then
                v26, l_v15_0 = v13(v21, v15, v16, v17, v18 + 1);
                if v20 < l_v15_0 then
                    v19 = v26;
                    v20 = l_v15_0;
                end;
            end;
        end;
    end);
    return v19, v20;
end;
local v31 = {
    name = "_default", 
    min = 1e999, 
    max = 0
};
local function v37(v32, v33) --[[ Line: 69 ]] --[[ Name: findBreakpoint ]]
    -- upvalues: l_Array_0 (copy), v31 (copy)
    local v36 = l_Array_0.find(v32, function(v34) --[[ Line: 70 ]]
        -- upvalues: v33 (copy)
        local v35 = false;
        if type(v34) == "table" then
            v35 = false;
            if type(v34.breakpoint) == "string" then
                v35 = false;
                if v33 <= (v34.max or 1e999) then
                    v35 = v33 >= (v34.min or 0);
                end;
            end;
        end;
        return v35;
    end);
    if v36 then
        return {
            name = v36.breakpoint, 
            min = v36.min or 0, 
            max = v36.max or 1e999
        };
    else
        return v31;
    end;
end;
local v39 = {
    [v1.strictInterface({
        Scale = v1.number, 
        Offset = v1.number
    })] = function(v38) --[[ Line: 89 ]]
        return UDim.new(v38.Scale, v38.Offset);
    end
};
return {
    getValue = function(v40, v41) --[[ Line: 95 ]] --[[ Name: getValue ]]
        -- upvalues: l_Array_0 (copy), v13 (copy), v39 (copy)
        local l_config_0 = v40.config;
        local l_breakpoint_1 = v40.breakpoint;
        local l_kind_0 = v40.kind;
        local v45 = l_config_0[v41];
        local v46 = v45 ~= nil and 0 or -1;
        local l_forEach_0 = l_Array_0.forEach;
        local l_l_config_0_0 = l_config_0;
        local v49 = 0;
        local v50;
        do
            local l_v45_0, l_v46_0 = v45, v46;
            l_forEach_0(l_l_config_0_0, function(v53) --[[ Line: 51 ]]
                -- upvalues: l_breakpoint_1 (copy), l_kind_0 (copy), v13 (ref), v41 (copy), v49 (copy), l_v46_0 (ref), l_v45_0 (ref)
                local v54 = false;
                local v55 = false;
                local l_l_breakpoint_1_0 = l_breakpoint_1;
                local l_breakpoint_2 = v53.breakpoint;
                local v58;
                if l_l_breakpoint_1_0 and l_breakpoint_2 then
                    if typeof(l_breakpoint_2) == "table" then
                        for _, v60 in l_breakpoint_2 do
                            if v60 == l_l_breakpoint_1_0 then
                                v58 = true;
                                v54 = true;
                            end;
                            if v54 then
                                break;
                            end;
                        end;
                        if not v54 then
                            v58 = false;
                        end;
                    else
                        v58 = l_breakpoint_2 == l_l_breakpoint_1_0;
                    end;
                else
                    v58 = true;
                end;
                v54 = false;
                if v58 then
                    l_l_breakpoint_1_0 = l_kind_0;
                    l_breakpoint_2 = v53.kind;
                    if l_l_breakpoint_1_0 and l_breakpoint_2 then
                        if typeof(l_breakpoint_2) == "table" then
                            for _, v62 in l_breakpoint_2 do
                                if v62 == l_l_breakpoint_1_0 then
                                    v58 = true;
                                    v55 = true;
                                end;
                                if v55 then
                                    break;
                                end;
                            end;
                            if not v55 then
                                v58 = false;
                            end;
                        else
                            v58 = l_breakpoint_2 == l_l_breakpoint_1_0;
                        end;
                    else
                        v58 = true;
                    end;
                    v55 = false;
                    if v58 then
                        v58, l_l_breakpoint_1_0 = v13(v53, l_breakpoint_1, l_kind_0, v41, v49 + 1);
                        if l_v46_0 < l_l_breakpoint_1_0 then
                            l_v45_0 = v58;
                            l_v46_0 = l_l_breakpoint_1_0;
                        end;
                    end;
                end;
            end);
            v50 = l_v45_0;
            local _ = l_v46_0;
        end;
        for v64, v65 in v39 do
            if v64(v50) then
                return v65(v50);
            end;
        end;
        return v50;
    end, 
    findBreakpoint = v37
};