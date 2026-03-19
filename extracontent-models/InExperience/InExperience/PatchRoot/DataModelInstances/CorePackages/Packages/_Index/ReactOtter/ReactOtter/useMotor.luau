local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Otter);
return function(v3, v4, v5) --[[ Line: 13 ]] --[[ Name: useMotor ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v6 = v1.useRef(nil);
    local v7 = v1.useRef(nil);
    if not v6.current then
        local v8 = nil;
        v8 = if typeof(v3) == "number" then v2.createSingleMotor(v3) else v2.createGroupMotor(v3);
        do
            local l_v8_0 = v8;
            v7.current = function(v10) --[[ Line: 26 ]]
                -- upvalues: l_v8_0 (ref)
                l_v8_0:setGoal(v10);
            end;
            v6.current = l_v8_0;
        end;
    end;
    v1.useEffect(function() --[[ Line: 34 ]]
        -- upvalues: v6 (copy), v5 (copy), v4 (copy)
        local v11 = nil;
        local v12 = nil;
        if v6.current then
            if v5 then
                v11 = v6.current:onComplete(v5);
            end;
            v12 = v6.current:onStep(v4);
        end;
        return function() --[[ Line: 43 ]]
            -- upvalues: v11 (ref), v12 (ref)
            if v11 then
                v11();
            end;
            if v12 then
                v12();
            end;
        end;
    end, {
        v4, 
        v5
    });
    v1.useEffect(function() --[[ Line: 54 ]]
        -- upvalues: v6 (copy)
        return function() --[[ Line: 55 ]]
            -- upvalues: v6 (ref)
            if v6.current then
                v6.current:destroy();
                v6.current = nil;
            end;
        end;
    end, {
        v6.current
    });
    return v7.current;
end;