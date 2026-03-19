local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script:FindFirstAncestor("ToastNotification").Parent;
local v3 = require(l_Parent_0.React);
return function(v4, v5, v6, v7, v8) --[[ Line: 14 ]] --[[ Name: useKeyCodeHold ]]
    -- upvalues: v3 (copy), l_UserInputService_0 (copy), l_RunService_0 (copy)
    local v9, v10 = v3.useState(false);
    local v11, v12 = v3.useBinding(0);
    local v13 = v3.useRef(nil);
    v3.useEffect(function() --[[ Line: 25 ]]
        -- upvalues: v8 (copy), l_UserInputService_0 (ref), v4 (copy), v10 (copy)
        if v8 then
            return;
        else
            local v16 = l_UserInputService_0.InputBegan:Connect(function(v14, v15) --[[ Line: 30 ]]
                -- upvalues: v4 (ref), v10 (ref)
                if v15 then
                    return;
                else
                    if v14.KeyCode == v4 then
                        v10(true);
                    end;
                    return;
                end;
            end);
            local v18 = l_UserInputService_0.InputEnded:Connect(function(v17) --[[ Line: 40 ]]
                -- upvalues: v4 (ref), v10 (ref)
                if v17.KeyCode == v4 then
                    v10(false);
                end;
            end);
            return function() --[[ Line: 46 ]]
                -- upvalues: v16 (copy), v18 (copy), v10 (ref)
                v16:Disconnect();
                v18:Disconnect();
                v10(false);
            end;
        end;
    end, {
        v8, 
        v4
    });
    v3.useEffect(function() --[[ Line: 53 ]]
        -- upvalues: v9 (copy), v13 (copy), l_RunService_0 (ref), v5 (copy), v6 (copy), v7 (copy), v12 (copy)
        if not v9 then
            return;
        else
            local function _() --[[ Line: 58 ]] --[[ Name: disconnect ]]
                -- upvalues: v13 (ref)
                if v13.current then
                    v13.current:Disconnect();
                    v13.current = nil;
                end;
            end;
            local v20 = 0;
            v13.current = l_RunService_0.Heartbeat:Connect(function(v21) --[[ Line: 66 ]]
                -- upvalues: v20 (ref), v5 (ref), v6 (ref), v13 (ref), v7 (ref), v12 (ref)
                v20 = v20 + v21;
                if v20 < v5 then
                    return;
                elseif v6 == 0 then
                    if v13.current then
                        v13.current:Disconnect();
                        v13.current = nil;
                    end;
                    v7();
                    return;
                else
                    local v22 = math.clamp((v20 - v5) / v6, 0, 1);
                    v12(v22);
                    if v22 >= 1 then
                        if v13.current then
                            v13.current:Disconnect();
                            v13.current = nil;
                        end;
                        v7();
                    end;
                    return;
                end;
            end);
            return function() --[[ Line: 89 ]]
                -- upvalues: v13 (ref), v12 (ref)
                if v13.current then
                    v13.current:Disconnect();
                    v13.current = nil;
                end;
                v12(0);
            end;
        end;
    end, {
        v9, 
        v7, 
        v5, 
        v6
    });
    return {
        holding = v9, 
        holdProgress = v11
    };
end;