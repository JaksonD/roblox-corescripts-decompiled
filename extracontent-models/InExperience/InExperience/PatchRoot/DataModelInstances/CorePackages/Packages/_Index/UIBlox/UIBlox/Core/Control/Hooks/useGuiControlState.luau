local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local l_useForwardRef_0 = require(l_Parent_1.ReactUtils).useForwardRef;
local v4 = require(l_Parent_0.Core.Control.Enum.ControlState);
local v5 = require(l_Parent_0.Core.Control.Enum.ControlStateEvent);
local v6 = require(l_Parent_0.Core.Control.createGuiControlStateTable);
return function(v7, v8, v9) --[[ Line: 20 ]] --[[ Name: useGuiControlState ]]
    -- upvalues: v2 (copy), v4 (copy), v6 (copy), v5 (copy), l_useForwardRef_0 (copy)
    local v10 = v2.useRef(v4.Initialize);
    local v11 = v2.useRef(v9);
    local v12 = v2.useRef(false);
    local v15 = v2.useCallback(function(v13, v14) --[[ Line: 35 ]]
        -- upvalues: v10 (copy), v8 (copy)
        v10.current = v14;
        v8(v13, v14);
    end, {
        v8
    });
    local v16 = v2.useMemo(function() --[[ Line: 40 ]]
        -- upvalues: v6 (ref), v15 (copy)
        return v6(v15);
    end, {});
    v2.useEffect(function() --[[ Line: 44 ]]
        -- upvalues: v16 (copy), v15 (copy)
        v16:onStateChange(v15);
    end, {
        v15
    });
    local v23 = v2.useCallback(function(v17) --[[ Line: 48 ]]
        -- upvalues: v11 (copy), v16 (copy), v5 (ref), v12 (copy)
        local v18 = {};
        if v17 then
            table.insert(v18, v17.InputBegan:Connect(function(v19) --[[ Line: 66 ]]
                -- upvalues: v11 (ref), v16 (ref), v5 (ref)
                if not v11.current then
                    return nil;
                else
                    if v19.UserInputType == Enum.UserInputType.MouseButton1 or v19.UserInputType == Enum.UserInputType.Touch or v19.KeyCode == Enum.KeyCode.ButtonA or v19.KeyCode == Enum.KeyCode.Return then
                        v16.events[v5.PrimaryPressed]();
                    end;
                    return;
                end;
            end));
            table.insert(v18, v17.InputEnded:Connect(function(v20) --[[ Line: 82 ]]
                -- upvalues: v11 (ref), v16 (ref), v5 (ref)
                if not v11.current then
                    return nil;
                elseif v20.UserInputType == Enum.UserInputType.MouseButton1 then
                    v16.events[v5.PrimaryReleasedHover]();
                    return;
                else
                    if v20.UserInputType == Enum.UserInputType.Touch or v20.KeyCode == Enum.KeyCode.ButtonA or v20.KeyCode == Enum.KeyCode.Return then
                        v16.events[v5.PrimaryReleased]();
                    end;
                    return;
                end;
            end));
            table.insert(v18, v17.SelectionGained:Connect(function() --[[ Line: 101 ]]
                -- upvalues: v11 (ref), v16 (ref), v5 (ref)
                if not v11.current then
                    return nil;
                else
                    v16.events[v5.SelectionGained]();
                    return;
                end;
            end));
            table.insert(v18, v17.SelectionLost:Connect(function() --[[ Line: 110 ]]
                -- upvalues: v11 (ref), v16 (ref), v5 (ref)
                if not v11.current then
                    return nil;
                else
                    v16.events[v5.SelectionLost]();
                    return;
                end;
            end));
            table.insert(v18, v17.MouseEnter:Connect(function() --[[ Line: 121 ]]
                -- upvalues: v11 (ref), v12 (ref), v16 (ref), v5 (ref)
                if not v11.current then
                    return nil;
                else
                    v12.current = true;
                    v16.events[v5.PointerHover]();
                    return;
                end;
            end));
            table.insert(v18, v17.MouseLeave:Connect(function() --[[ Line: 131 ]]
                -- upvalues: v11 (ref), v12 (ref), v16 (ref), v5 (ref)
                if not v11.current then
                    return nil;
                else
                    v12.current = false;
                    v16.events[v5.PointerHoverEnd]();
                    return;
                end;
            end));
        end;
        return function() --[[ Line: 141 ]]
            -- upvalues: v18 (copy)
            for _, v22 in ipairs(v18) do
                v22:Disconnect();
            end;
        end;
    end, {
        v16, 
        v12
    });
    v2.useEffect(function() --[[ Line: 148 ]]
        -- upvalues: v11 (copy), v9 (copy)
        v11.current = v9;
    end, {
        v9
    });
    return l_useForwardRef_0(v7, v23), v16;
end;