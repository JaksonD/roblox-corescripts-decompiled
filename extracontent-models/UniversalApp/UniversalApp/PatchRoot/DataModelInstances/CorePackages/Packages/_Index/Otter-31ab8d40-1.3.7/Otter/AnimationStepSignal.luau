local l_RunService_0 = game:GetService("RunService");
local v1 = {};
local v8 = {
    Connect = function(_, v3) --[[ Line: 8 ]] --[[ Name: Connect ]]
        -- upvalues: v1 (copy)
        v1[v3] = true;
        return {
            Disconnect = function() --[[ Line: 11 ]] --[[ Name: Disconnect ]]
                -- upvalues: v1 (ref), v3 (copy)
                v1[v3] = nil;
            end
        };
    end, 
    Fire = function(_, v5) --[[ Line: 16 ]] --[[ Name: Fire ]]
        -- upvalues: v1 (copy)
        for v6, _ in v1 do
            v6(v5);
        end;
    end
};
return {
    Connect = function(_, v10) --[[ Line: 24 ]] --[[ Name: Connect ]]
        -- upvalues: v8 (copy), l_RunService_0 (copy)
        if _G.__OTTER_MOCK_ANIMATION_STEP_SIGNAL__ then
            return v8:Connect(v10);
        else
            return l_RunService_0.RenderStepped:Connect(v10);
        end;
    end, 
    Fire = function(_, v12) --[[ Line: 31 ]] --[[ Name: Fire ]]
        -- upvalues: v8 (copy)
        if _G.__OTTER_MOCK_ANIMATION_STEP_SIGNAL__ then
            v8:Fire(v12 or 0.016666666666666666);
            return;
        else
            error("Cannot manually fire real animation step signal");
            return;
        end;
    end
};