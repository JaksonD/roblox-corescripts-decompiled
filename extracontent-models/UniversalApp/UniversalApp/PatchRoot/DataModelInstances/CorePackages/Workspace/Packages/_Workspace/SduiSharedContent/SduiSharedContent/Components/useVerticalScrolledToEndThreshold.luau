local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
return function(v2, v3, v4) --[[ Line: 6 ]] --[[ Name: useVerticalScrolledToEndThreshold ]]
    -- upvalues: v1 (copy)
    local v5 = v1.useRef(false);
    v1.useEffect(function() --[[ Line: 18 ]]
        -- upvalues: v4 (copy), v3 (copy), v2 (copy), v5 (copy)
        if v4 == nil or v3 == nil or v2.current == nil then
            return nil;
        else
            local v6 = {};
            local l_current_0 = v2.current;
            local function v10() --[[ Line: 26 ]] --[[ Name: checkThreshold ]]
                -- upvalues: l_current_0 (copy), v3 (ref), v5 (ref), v4 (ref)
                local v8 = l_current_0.AbsoluteCanvasSize.Y - l_current_0.AbsoluteWindowSize.Y - v3;
                local l_Y_0 = l_current_0.CanvasPosition.Y;
                if l_Y_0 < v8 and v5.current then
                    v5.current = false;
                    return;
                else
                    if v8 < l_Y_0 and not v5.current then
                        v5.current = true;
                        v4();
                    end;
                    return;
                end;
            end;
            table.insert(v6, l_current_0:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(v10));
            table.insert(v6, l_current_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(v10));
            table.insert(v6, l_current_0:GetPropertyChangedSignal("CanvasPosition"):Connect(v10));
            return function() --[[ Line: 49 ]]
                -- upvalues: v6 (copy)
                for _, v12 in v6 do
                    v12:Disconnect();
                end;
            end;
        end;
    end, {
        v2, 
        v3, 
        v4
    });
end;