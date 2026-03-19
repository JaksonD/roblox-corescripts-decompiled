local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local v4 = require(l_Parent_0.useAnimatedValue);
local _ = require(l_Parent_1.Types);
local v6 = require(l_Parent_0.TimingConfigs);
local v7 = require(l_Parent_1.Enums.TransitionPreset);
return function(v8) --[[ Line: 20 ]] --[[ Name: useMotion ]]
    -- upvalues: v3 (copy), v4 (copy), v7 (copy), v6 (copy)
    local v9 = {};
    local v10 = {};
    local v11 = v3.useRef({});
    for v12, v13 in v8 do
        if type(v13) ~= "table" or v12 ~= "transition" then
            local v14, v15 = v4(v13);
            v9[v12] = v14;
            v10[v12] = v15;
        end;
    end;
    return v9, function(v16, v17) --[[ Line: 40 ]] --[[ Name: animate ]]
        -- upvalues: v10 (copy), v11 (copy), v7 (ref), v6 (ref)
        if not v16 then
            return;
        else
            local v18 = 0;
            local v19 = {};
            for v20 in v10 do
                if v20 ~= "transition" and v16[v20] ~= nil then
                    v18 = v18 + 1;
                end;
            end;
            local v21 = 0;
            local function _(v22) --[[ Line: 57 ]] --[[ Name: propertyOnComplete ]]
                -- upvalues: v19 (copy), v16 (copy), v21 (ref), v17 (copy), v18 (ref)
                v19[v22] = v16[v22];
                v21 = v21 + 1;
                if v17 and v17.onAnimationComplete then
                    v17.onAnimationComplete(v22);
                end;
                if v21 == v18 and v17 and v17.onAnimationComplete then
                    v17.onAnimationComplete(true);
                end;
            end;
            for v24, v25 in v10 do
                if v24 ~= "transition" and v16[v24] ~= nil then
                    if v11.current[v24] then
                        local v26 = v11.current[v24];
                        if v26 then
                            task.cancel(v26);
                        end;
                        v11.current[v24] = nil;
                    end;
                    local v27 = v16.transition or {
                        [v7.Default] = v6.getDefaultTransition()
                    };
                    local v28 = v27[v24] or v27[v7.Default] or v6.getDefaultTransition();
                    local v29 = table.clone(v28);
                    v29.onComplete = function() --[[ Line: 94 ]]
                        -- upvalues: v24 (copy), v19 (copy), v16 (copy), v21 (ref), v17 (copy), v18 (ref)
                        local l_v24_0 = v24;
                        v19[l_v24_0] = v16[l_v24_0];
                        v21 = v21 + 1;
                        if v17 and v17.onAnimationComplete then
                            v17.onAnimationComplete(l_v24_0);
                        end;
                        if v21 == v18 and v17 and v17.onAnimationComplete then
                            v17.onAnimationComplete(true);
                        end;
                    end;
                    local v31 = v29.delay or 0;
                    if v31 > 0 then
                        local v32 = task.delay(v31, function() --[[ Line: 103 ]]
                            -- upvalues: v11 (ref), v24 (copy), v25 (copy), v16 (copy), v29 (copy)
                            v11.current[v24] = nil;
                            v25(v16[v24], v29);
                        end);
                        v11.current[v24] = v32;
                    else
                        v25(v16[v24], v29);
                    end;
                end;
            end;
            return;
        end;
    end;
end;