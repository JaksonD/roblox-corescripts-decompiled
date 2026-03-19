local l_Parent_0 = script.Parent.Parent;
local l_assign_0 = require(l_Parent_0.Collections).Object.assign;
local _ = require(script.Parent.types);
local l_abs_0 = math.abs;
local l_exp_0 = math.exp;
local l_sin_0 = math.sin;
local l_cos_0 = math.cos;
local l_sqrt_0 = math.sqrt;
local function _(v8, v9, v10) --[[ Line: 54 ]] --[[ Name: translateParameters ]]
    -- upvalues: l_sqrt_0 (copy)
    return v8 / (l_sqrt_0(v10 * v9) * 2), l_sqrt_0(v9 / v10) / 2 / 3.141592653589793;
end;
return function(v12, v13) --[[ Line: 60 ]] --[[ Name: spring ]]
    -- upvalues: l_assign_0 (copy), l_sqrt_0 (copy), l_exp_0 (copy), l_cos_0 (copy), l_sin_0 (copy), l_abs_0 (copy)
    local v14 = {
        dampingRatio = 1, 
        frequency = 1, 
        restingVelocityLimit = 0.001, 
        restingPositionLimit = 0.01
    };
    if v13 ~= nil then
        l_assign_0(v14, v13);
    end;
    local v15 = nil;
    local v16 = nil;
    local l_restingVelocityLimit_0 = v14.restingVelocityLimit;
    local l_restingPositionLimit_0 = v14.restingPositionLimit;
    local l_damping_0 = v14.damping;
    local l_stiffness_0 = v14.stiffness;
    local l_mass_0 = v14.mass;
    if typeof(l_damping_0) == "number" and typeof(l_stiffness_0) == "number" and typeof(l_mass_0) == "number" then
        local v22 = l_damping_0 / (l_sqrt_0(l_mass_0 * l_stiffness_0) * 2);
        local v23 = l_sqrt_0(l_stiffness_0 / l_mass_0) / 2 / 3.141592653589793;
        local l_v22_0 = v22;
        local l_v23_0 = v23;
        v15 = l_v22_0;
        v16 = l_v23_0;
    else
        v15 = v14.dampingRatio;
        v16 = v14.frequency;
    end;
    local l_v15_0 = v15;
    local v27 = v16 * 2 * 3.141592653589793;
    assert(l_restingVelocityLimit_0 >= 0, "Expected restingVelocityLimit >= 0");
    assert(l_restingPositionLimit_0 >= 0, "Expected restingPositionLimit >= 0");
    return {
        step = function(v28, v29) --[[ Line: 97 ]] --[[ Name: step ]]
            -- upvalues: v12 (copy), l_v15_0 (copy), v27 (copy), l_exp_0 (ref), l_sqrt_0 (ref), l_cos_0 (ref), l_sin_0 (ref), v12 (copy), l_abs_0 (ref), l_restingVelocityLimit_0 (copy), l_restingPositionLimit_0 (copy)
            local l_value_0 = v28.value;
            local v31 = v28.velocity or 0;
            local v32 = l_value_0 - v12;
            local v33 = l_exp_0(-v29 * l_v15_0 * v27);
            local v34 = nil;
            local v35 = nil;
            if l_v15_0 == 1 then
                v34 = (v31 * v29 + v32 * (v27 * v29 + 1)) * v33 + v12;
                v35 = (v31 - v27 * v29 * (v32 * v27 + v31)) * v33;
            elseif l_v15_0 < 1 then
                local v36 = l_sqrt_0(1 - l_v15_0 * l_v15_0);
                local v37 = l_cos_0(v27 * v36 * v29);
                local v38 = l_sin_0(v27 * v36 * v29);
                local v39 = nil;
                if v36 > 1.0E-4 then
                    v39 = v38 / v36;
                else
                    local v40 = v29 * v27;
                    v39 = v40 + (v40 * v40 * (v36 * v36) * (v36 * v36) / 20 - v36 * v36) * (v40 * v40 * v40) / 6;
                end;
                local v41 = nil;
                if v27 * v36 > 1.0E-4 then
                    v41 = v38 / (v27 * v36);
                else
                    local v42 = v27 * v36;
                    v41 = v29 + (v29 * v29 * (v42 * v42) * (v42 * v42) / 20 - v42 * v42) * (v29 * v29 * v29) / 6;
                end;
                v34 = (v32 * (v37 + l_v15_0 * v39) + v31 * v41) * v33 + v12;
                v35 = (v31 * (v37 - v39 * l_v15_0) - v32 * (v39 * v27)) * v33;
            else
                local v43 = l_sqrt_0(l_v15_0 * l_v15_0 - 1);
                local v44 = -v27 * (l_v15_0 - v43);
                local v45 = -v27 * (l_v15_0 + v43);
                local v46 = (v31 - v44 * v32) / (2 * v27 * v43);
                local v47 = (v32 - v46) * l_exp_0(v44 * v29);
                local v48 = v46 * l_exp_0(v45 * v29);
                v34 = v47 + v48 + v12;
                v35 = v44 * v47 + v45 * v48;
            end;
            local v49 = l_abs_0(v34 - v12);
            local v50 = l_abs_0(v35);
            local v51 = false;
            if v50 < l_restingVelocityLimit_0 then
                v51 = v49 < l_restingPositionLimit_0;
            end;
            if v51 then
                v34 = v12;
                v35 = 0;
            end;
            return {
                value = v34, 
                velocity = v35, 
                complete = v51
            };
        end, 
        startingValue = if v13 then v13.startingValue else nil
    };
end;