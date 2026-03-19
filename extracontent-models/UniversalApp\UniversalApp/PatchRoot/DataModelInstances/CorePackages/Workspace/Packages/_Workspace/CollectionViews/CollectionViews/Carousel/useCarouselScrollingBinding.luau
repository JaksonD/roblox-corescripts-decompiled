local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script:FindFirstAncestor("CollectionViews").Parent;
local v2 = require(l_Parent_0.React);
return function(v3, v4) --[[ Line: 9 ]] --[[ Name: useCarouselScrollingBinding ]]
    -- upvalues: v2 (copy), l_RunService_0 (copy)
    local v5, v6 = v2.useBinding(false);
    v2.useEffect(function() --[[ Line: 15 ]]
        -- upvalues: v3 (copy), v4 (copy), v6 (copy), l_RunService_0 (ref)
        local l_current_0 = v3.current;
        if not v4 or not l_current_0 then
            return nil;
        else
            assert(l_current_0, "scrollingFrame must exist");
            local v8 = 0;
            local v9 = nil;
            local v10 = l_current_0:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 25 ]]
                -- upvalues: v8 (ref), v9 (ref), v6 (ref), l_RunService_0 (ref)
                v8 = os.clock() + 0.01;
                if not v9 then
                    v6(true);
                    v9 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 29 ]]
                        -- upvalues: v8 (ref), v6 (ref), v9 (ref)
                        if os.clock() >= v8 then
                            v6(false);
                            if v9 then
                                v9:Disconnect();
                                v9 = nil;
                            end;
                        end;
                    end);
                end;
            end);
            return function() --[[ Line: 41 ]]
                -- upvalues: v10 (copy), v9 (ref)
                v10:Disconnect();
                if v9 then
                    v9:Disconnect();
                end;
            end;
        end;
    end, {
        v3
    });
    return v5;
end;