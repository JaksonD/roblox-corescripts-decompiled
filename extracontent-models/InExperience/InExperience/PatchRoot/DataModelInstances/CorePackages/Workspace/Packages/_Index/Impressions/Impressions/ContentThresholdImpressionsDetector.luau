local l_Parent_0 = script:FindFirstAncestor("Impressions").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.useViewportBounds);
return function(v3) --[[ Line: 24 ]] --[[ Name: ContentThresholdImpressionsDetector ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v4 = v2();
    local v5 = v1.useRef({});
    local v6 = v1.useRef(0);
    local v7 = v1.useRef(nil);
    local v8 = v1.useRef(v3.impressionsTag);
    local v18 = v1.useCallback(function() --[[ Line: 32 ]]
        -- upvalues: v3 (copy), v4 (copy), v6 (copy), v5 (copy)
        local l_current_0 = v3.containerRef.current;
        if not l_current_0 then
            return;
        else
            local v10 = math.floor(v3.fullContentHeight);
            if v10 <= 0 then
                return;
            elseif l_current_0.AbsoluteSize.Y == 0 then
                return;
            else
                local l_Y_0 = l_current_0.AbsolutePosition.Y;
                local v12 = l_Y_0 + l_current_0.AbsoluteSize.Y;
                local l_Y_1 = (if v3.viewportBoundsOffset then {
                    min = v4.min + v3.viewportBoundsOffset.min, 
                    max = v4.max + v3.viewportBoundsOffset.max
                } else v4).max.Y;
                if l_Y_1 <= 0 then
                    return;
                else
                    local v14 = math.clamp(math.min(v12, l_Y_1) - l_Y_0, 0, v10) / v10;
                    v6.current = math.max(v6.current, v14);
                    local v15 = {};
                    for v16, v17 in v3.thresholds do
                        if not v5.current[v16] and v17 <= v6.current then
                            v5.current[v16] = true;
                            table.insert(v15, v3.thresholds[v16]);
                        end;
                    end;
                    if #v15 > 0 then
                        v3.sendImpressions(v15);
                    end;
                    return;
                end;
            end;
        end;
    end, {
        v3.containerRef, 
        v3.fullContentHeight, 
        v3.thresholds, 
        v3.viewportBoundsOffset, 
        v3.sendImpressions, 
        v4
    });
    local v19 = v1.useCallback(function() --[[ Line: 89 ]]
        -- upvalues: v7 (copy), v18 (copy)
        if v7.current then
            task.cancel(v7.current);
        end;
        v7.current = task.delay(0.2, function() --[[ Line: 93 ]]
            -- upvalues: v7 (ref), v18 (ref)
            v7.current = nil;
            v18();
        end);
    end, {
        v18
    });
    v1.useEffect(function() --[[ Line: 99 ]]
        -- upvalues: v8 (copy), v3 (copy), v5 (copy), v6 (copy), v19 (copy)
        if v8.current ~= v3.impressionsTag then
            v8.current = v3.impressionsTag;
            v5.current = {};
            v6.current = 0;
            v19();
        end;
    end, {
        v3.impressionsTag, 
        v19
    });
    v1.useEffect(function() --[[ Line: 108 ]]
        -- upvalues: v3 (copy), v19 (copy), v7 (copy)
        local l_current_1 = v3.containerRef.current;
        if not l_current_1 then
            return nil;
        else
            v19();
            local v21 = l_current_1:GetPropertyChangedSignal("AbsolutePosition"):Connect(v19);
            local v22 = l_current_1:GetPropertyChangedSignal("AbsoluteSize"):Connect(v19);
            return function() --[[ Line: 118 ]]
                -- upvalues: v7 (ref), v21 (copy), v22 (copy)
                if v7.current then
                    task.cancel(v7.current);
                    v7.current = nil;
                end;
                v21:Disconnect();
                v22:Disconnect();
            end;
        end;
    end, {
        v3.containerRef, 
        v19
    });
    return nil;
end;