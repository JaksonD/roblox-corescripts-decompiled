local l_Parent_0 = script:FindFirstAncestor("CollectionViews").Parent;
local v1 = require(l_Parent_0.React);
return function(v2, v3, v4, v5) --[[ Line: 6 ]] --[[ Name: useHorizontalScrolledToEndThreshold ]]
    -- upvalues: v1 (copy)
    local v6 = v1.useRef(false);
    v1.useEffect(function() --[[ Line: 21 ]]
        -- upvalues: v5 (copy), v2 (copy), v4 (copy), v3 (copy), v6 (copy)
        if not v5 then
            return nil;
        else
            local v7 = {};
            if v2.current ~= nil and v4 ~= nil and v3 ~= nil then
                local l_current_0 = v2.current;
                local function _() --[[ Line: 30 ]] --[[ Name: checkThreshold ]]
                    -- upvalues: l_current_0 (copy), v3 (ref), v6 (ref), v4 (ref)
                    local v9 = l_current_0.AbsoluteCanvasSize.X - l_current_0.AbsoluteWindowSize.X - v3;
                    local l_X_0 = l_current_0.CanvasPosition.X;
                    if l_X_0 < v9 and v6.current then
                        v6.current = false;
                        return;
                    else
                        if v9 < l_X_0 and not v6.current then
                            v6.current = true;
                            v4();
                        end;
                        return;
                    end;
                end;
                table.insert(v7, l_current_0:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ Line: 44 ]]
                    -- upvalues: l_current_0 (copy), v3 (ref), v6 (ref), v4 (ref)
                    local v12 = l_current_0.AbsoluteCanvasSize.X - l_current_0.AbsoluteWindowSize.X - v3;
                    local l_X_1 = l_current_0.CanvasPosition.X;
                    if l_X_1 < v12 and v6.current then
                        v6.current = false;
                        return;
                    else
                        if v12 < l_X_1 and not v6.current then
                            v6.current = true;
                            v4();
                        end;
                        return;
                    end;
                end));
                table.insert(v7, l_current_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function() --[[ Line: 51 ]]
                    -- upvalues: l_current_0 (copy), v3 (ref), v6 (ref), v4 (ref)
                    local v14 = l_current_0.AbsoluteCanvasSize.X - l_current_0.AbsoluteWindowSize.X - v3;
                    local l_X_2 = l_current_0.CanvasPosition.X;
                    if l_X_2 < v14 and v6.current then
                        v6.current = false;
                        return;
                    else
                        if v14 < l_X_2 and not v6.current then
                            v6.current = true;
                            v4();
                        end;
                        return;
                    end;
                end));
                table.insert(v7, l_current_0:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 57 ]]
                    -- upvalues: l_current_0 (copy), v3 (ref), v6 (ref), v4 (ref)
                    local v16 = l_current_0.AbsoluteCanvasSize.X - l_current_0.AbsoluteWindowSize.X - v3;
                    local l_X_3 = l_current_0.CanvasPosition.X;
                    if l_X_3 < v16 and v6.current then
                        v6.current = false;
                        return;
                    else
                        if v16 < l_X_3 and not v6.current then
                            v6.current = true;
                            v4();
                        end;
                        return;
                    end;
                end));
            end;
            return function() --[[ Line: 62 ]]
                -- upvalues: v7 (copy)
                for _, v19 in v7 do
                    v19:Disconnect();
                end;
            end;
        end;
    end, {
        v2, 
        v5, 
        v3, 
        v4
    });
end;