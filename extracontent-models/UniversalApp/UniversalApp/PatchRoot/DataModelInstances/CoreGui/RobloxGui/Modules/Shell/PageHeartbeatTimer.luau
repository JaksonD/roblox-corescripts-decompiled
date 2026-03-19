local v0 = require(script.Parent.Analytics);
local v1 = {
    2, 
    10
};
local v2 = {};
local v3 = {};
local function _(v4, v5, v6) --[[ Line: 11 ]] --[[ Name: createDelayedTask ]]
    local v7 = false;
    task.delay(v4, function() --[[ Line: 14 ]]
        -- upvalues: v7 (ref), v6 (copy), v5 (copy)
        if not v7 then
            v6(v5);
        end;
    end);
    return function() --[[ Line: 19 ]]
        -- upvalues: v7 (ref)
        v7 = true;
    end;
end;
local function v11() --[[ Line: 24 ]] --[[ Name: cancelTasks ]]
    -- upvalues: v2 (ref)
    for _, v10 in ipairs(v2) do
        if v10 ~= nil then
            v10();
        end;
    end;
    v2 = {};
end;
v3.onPageChanged = function(v12) --[[ Line: 33 ]] --[[ Name: onPageChanged ]]
    -- upvalues: v11 (copy), v1 (copy), v2 (ref), v0 (copy)
    v11();
    for v13, v14 in ipairs(v1) do
        local l_v2_0 = v2;
        local function v17(v16) --[[ Line: 39 ]]
            -- upvalues: v0 (ref), v12 (copy)
            v0.reportPageHeartbeat(v16, v12);
        end;
        local v18 = false;
        local v19;
        do
            local l_v18_0 = v18;
            task.delay(v14, function() --[[ Line: 14 ]]
                -- upvalues: l_v18_0 (ref), v17 (copy), v13 (copy)
                if not l_v18_0 then
                    v17(v13);
                end;
            end);
            v19 = function() --[[ Line: 19 ]]
                -- upvalues: l_v18_0 (ref)
                l_v18_0 = true;
            end;
        end;
        l_v2_0[v13] = v19;
    end;
end;
return v3;