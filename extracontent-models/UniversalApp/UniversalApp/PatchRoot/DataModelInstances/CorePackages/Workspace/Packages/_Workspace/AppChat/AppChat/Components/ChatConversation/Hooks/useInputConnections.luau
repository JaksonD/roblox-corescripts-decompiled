local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
return function(v2) --[[ Line: 13 ]] --[[ Name: useInputConnections ]]
    -- upvalues: v1 (copy)
    local v3 = v1.useRef(false);
    local v4 = v1.useRef(nil);
    local v5 = v1.useRef(nil);
    local v6 = v1.useCallback(function() --[[ Line: 18 ]]
        -- upvalues: v4 (copy), v5 (copy), v3 (copy)
        if v4.current then
            v4.current:Disconnect();
            v4.current = nil;
        end;
        if v5.current then
            v5.current:Disconnect();
            v5.current = nil;
        end;
        v3.current = false;
    end, {});
    local v8 = v1.useCallback(function(v7) --[[ Line: 32 ]]
        -- upvalues: v3 (copy), v4 (copy), v2 (copy), v5 (copy), v6 (copy)
        if v7 and not v3.current then
            v4.current = v2.userInputService.InputBegan:Connect(v2.onInputBegan);
            v5.current = v2.userInputService.InputEnded:Connect(v2.onInputEnded);
            v3.current = true;
            return;
        else
            if not v7 and v3.current then
                v6();
                if v2.onFocusLost then
                    v2.onFocusLost();
                end;
            end;
            return;
        end;
    end, {
        v2.onInputBegan, 
        v2.onInputEnded, 
        v6, 
        v2.onFocusLost
    });
    v1.useEffect(function() --[[ Line: 53 ]]
        -- upvalues: v3 (copy), v6 (copy)
        return function() --[[ Line: 54 ]]
            -- upvalues: v3 (ref), v6 (ref)
            if v3.current then
                v6();
            end;
        end;
    end, {
        v6
    });
    return {
        focusChanged = v8, 
        disconnectInputConnection = v6
    };
end;