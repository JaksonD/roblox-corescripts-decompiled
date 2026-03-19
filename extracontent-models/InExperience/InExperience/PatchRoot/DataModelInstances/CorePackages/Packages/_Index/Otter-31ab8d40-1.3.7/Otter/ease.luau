local _ = require(script.Parent.types);
local function v3(v1, _) --[[ Line: 24 ]] --[[ Name: linear ]]
    return v1;
end;
local function v6(v4, _) --[[ Line: 28 ]] --[[ Name: quad ]]
    return v4 * v4;
end;
local function v9(v7, _) --[[ Line: 32 ]] --[[ Name: cubic ]]
    return v7 * v7 * v7;
end;
local function v12(v10, _) --[[ Line: 36 ]] --[[ Name: quart ]]
    return v10 * v10 * v10 * v10;
end;
local function v15(v13, _) --[[ Line: 40 ]] --[[ Name: quint ]]
    return v13 * v13 * v13 * v13 * v13;
end;
local function v18(v16, _) --[[ Line: 44 ]] --[[ Name: exponential ]]
    if v16 == 0 then
        return 0;
    else
        return (math.pow(2, (v16 - 1) * 10));
    end;
end;
local function v21(v19, _) --[[ Line: 48 ]] --[[ Name: sine ]]
    return 1 - math.cos(v19 * 3.141592653589793 / 2);
end;
local function v24(v22, _) --[[ Line: 52 ]] --[[ Name: elastic ]]
    if v22 == 0 then
        return 0;
    elseif v22 == 1 then
        return 1;
    else
        return -math.pow(2, v22 * 10 - 10) * math.sin((v22 * 10 - 10.75) * 2.0943951023931953);
    end;
end;
local function v27(v25, _) --[[ Line: 56 ]] --[[ Name: back ]]
    return v25 * 2.70158 * v25 * v25 - v25 * 1.70158 * v25;
end;
local function _(v28) --[[ Line: 62 ]] --[[ Name: easeOutBounce ]]
    if v28 < 0.36363636363636365 then
        return v28 * 7.5625 * v28;
    elseif v28 < 0.7272727272727273 then
        return (v28 - 0.5454545454545454) * 7.5625 * (v28 - 0.5454545454545454) + 0.75;
    elseif v28 < 0.9090909090909091 then
        return (v28 - 0.8181818181818182) * 7.5625 * (v28 - 0.8181818181818182) + 0.9375;
    else
        return (v28 - 0.9545454545454546) * 7.5625 * (v28 - 0.9545454545454546) + 0.984375;
    end;
end;
local function v33(v30, _) --[[ Line: 77 ]] --[[ Name: bounce ]]
    local v32 = 1 - v30;
    return 1 - if v32 < 0.36363636363636365 then v32 * 7.5625 * v32 else if v32 < 0.7272727272727273 then (v32 - 0.5454545454545454) * 7.5625 * (v32 - 0.5454545454545454) + 0.75 else if v32 < 0.9090909090909091 then (v32 - 0.8181818181818182) * 7.5625 * (v32 - 0.8181818181818182) + 0.9375 else (v32 - 0.9545454545454546) * 7.5625 * (v32 - 0.9545454545454546) + 0.984375;
end;
local function v36(v34, _) --[[ Line: 81 ]] --[[ Name: circular ]]
    return -(math.sqrt(1 - v34 * v34) - 1);
end;
local function _(v37, v38, v39) --[[ Line: 86 ]] --[[ Name: evaluateBezier ]]
    local v40 = 1 - v37;
    local v41 = v40 * v40;
    local v42 = v37 * v37;
    return v41 * 3 * v37 * v38 + v40 * 3 * v42 * v39 + v37 * v42;
end;
local function v65(v44, v45) --[[ Line: 95 ]] --[[ Name: cubicBezier ]]
    assert(typeof(v45) == "table", "Expected values to be a table");
    assert(#v45 == 4, "Expected values to have 4 elements");
    local v46, v47, v48, v49 = table.unpack(v45);
    local v50 = false;
    if v46 >= 0 then
        v50 = v46 <= 1;
    end;
    assert(v50, "x1 must be between 0 and 1");
    v50 = false;
    if v48 >= 0 then
        v50 = v48 <= 1;
    end;
    assert(v50, "x2 must be between 0 and 1");
    if v44 <= 0 then
        return 0;
    elseif v44 >= 1 then
        return 1;
    else
        local v51 = 0;
        v50 = 1;
        local v52 = 0;
        local _ = nil;
        for _ = 1, 10 do
            v52 = v52 + 1;
            local v55 = (v51 + v50) / 2;
            local v56 = 1 - v55;
            local v57 = v56 * v56;
            local v58 = v55 * v55;
            local v59 = v57 * 3 * v55 * v46 + v56 * 3 * v58 * v48 + v55 * v58;
            if math.abs(v59 - v44) < 1.0E-4 then
                v57 = 1 - v55;
                v58 = v57 * v57;
                local v60 = v55 * v55;
                return v58 * 3 * v55 * v47 + v57 * 3 * v60 * v49 + v55 * v60;
            elseif v59 < v44 then
                v51 = v55;
            else
                v50 = v55;
            end;
        end;
        local v61 = (v51 + v50) / 2;
        local v62 = 1 - v61;
        local v63 = v62 * v62;
        local v64 = v61 * v61;
        return v63 * 3 * v61 * v47 + v62 * 3 * v64 * v49 + v61 * v64;
    end;
end;
local v66 = {
    [Enum.EasingStyle.Linear] = v3, 
    [Enum.EasingStyle.Quad] = v6, 
    [Enum.EasingStyle.Cubic] = v9, 
    [Enum.EasingStyle.Quart] = v12, 
    [Enum.EasingStyle.Quint] = v15, 
    [Enum.EasingStyle.Exponential] = v18, 
    [Enum.EasingStyle.Sine] = v21, 
    [Enum.EasingStyle.Back] = v27, 
    [Enum.EasingStyle.Bounce] = v33, 
    [Enum.EasingStyle.Elastic] = v24, 
    [Enum.EasingStyle.Circular] = v36
};
return function(v67, v68) --[[ Line: 158 ]] --[[ Name: ease ]]
    -- upvalues: v66 (copy), v65 (copy)
    local v69 = if v68 and v68.duration then v68.duration else 1;
    local v70 = if v68 and v68.easingStyle then v68.easingStyle else Enum.EasingStyle.Linear;
    local v71 = if not (typeof(v70) ~= "EnumItem") or typeof(v70) == "string" then v66[v70] else v65;
    return {
        step = function(v72, v73) --[[ Line: 169 ]] --[[ Name: step ]]
            -- upvalues: v67 (copy), v69 (copy), v71 (copy), v70 (copy)
            local v74 = if v72.initialValue ~= nil then v72.initialValue else v72.value or 0;
            local v75 = (v72.elapsed or 0) + v73;
            if v72.goal and v67 ~= v72.goal then
                v74 = v72.value;
                v75 = 0;
            end;
            local v76 = math.min(v75 / v69, 1);
            local v77 = v71(v76, v70);
            local v78 = v74 + (v67 - v74) * v77;
            local v79 = true;
            if v69 > v75 then
                v79 = v74 == v67;
            end;
            if v79 then
                v78 = v67;
                v74 = v67;
                v75 = 0;
            end;
            return {
                initialValue = v74, 
                goal = v67, 
                value = v78, 
                elapsed = v75, 
                complete = v79
            };
        end, 
        startingValue = if v68 then v68.startingValue else nil
    };
end;