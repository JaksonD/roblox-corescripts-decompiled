local _ = require(script.Parent.Types);
local v1 = require(script.Parent.Enums.TransitionPreset);
local l_presets_0 = require(script.Parent.Utility.TimingConfigs).presets;
local v3 = l_presets_0[v1.Default];
local v4 = {};
local function _(v5) --[[ Line: 12 ]] --[[ Name: getTransition ]]
    -- upvalues: v3 (copy)
    return v5.transition or {
        default = v3
    };
end;
v4.createState = function(v7, v8) --[[ Line: 18 ]] --[[ Name: createState ]]
    -- upvalues: v3 (copy)
    local v9 = {
        transition = {
            default = v8 and v8.default or v3
        }
    };
    for v10, v11 in v7 do
        v9[v10] = v11;
        if v8 and v8[v10] then
            (v9.transition or {
                default = v3
            })[v10] = v8[v10];
        end;
    end;
    return v9;
end;
v4.transition = function(v12, v13) --[[ Line: 40 ]] --[[ Name: transition ]]
    -- upvalues: l_presets_0 (copy), v3 (copy)
    local v14 = if type(v12) == "string" then l_presets_0[v12] or v3 else v12;
    local v15 = {
        duration = v14 and v14.duration or v3.duration, 
        easingStyle = v14 and v14.easingStyle or v3.easingStyle, 
        delay = v14 and v14.delay or v3.delay
    };
    if v13 then
        if v13.duration then
            v15.duration = v13.duration;
        end;
        if v13.easingStyle then
            v15.easingStyle = v13.easingStyle;
        end;
        if v13.delay then
            v15.delay = v13.delay;
        end;
    end;
    return v15;
end;
v4.animate = function(v16, v17) --[[ Line: 69 ]] --[[ Name: animate ]]
    -- upvalues: v3 (copy)
    if not v16 then
        return;
    else
        local v18 = v16.transition or {
            default = v3
        };
        for v19, v20 in v17 do
            local v21 = v18[v19];
            local v22 = if v21 ~= nil then v21 else v18.default;
            if v22.delay and v22.delay > 0 then
                local v23 = table.clone(v22);
                task.delay(v22.delay, function() --[[ Line: 88 ]]
                    -- upvalues: v20 (copy), v16 (copy), v19 (copy), v23 (copy)
                    v20(v16[v19], v23);
                end);
            else
                v20(v16[v19], v22);
            end;
        end;
        return;
    end;
end;
return v4;