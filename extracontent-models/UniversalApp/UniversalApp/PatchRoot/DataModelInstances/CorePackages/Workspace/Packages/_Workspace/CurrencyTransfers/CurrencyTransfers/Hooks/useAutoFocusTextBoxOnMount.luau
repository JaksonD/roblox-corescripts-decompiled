local l_Parent_0 = script:FindFirstAncestor("CurrencyTransfers").Parent;
local v1 = require(l_Parent_0.React);
return function(v2, v3) --[[ Line: 7 ]] --[[ Name: useAutoFocusTextBoxOnMount ]]
    -- upvalues: v1 (copy)
    local v4 = v1.useRef(false);
    return v1.useCallback(function(v5) --[[ Line: 10 ]]
        -- upvalues: v2 (copy), v4 (copy), v3 (copy)
        if v2 then
            v2(v5);
        end;
        if v5 and not v4.current then
            v4.current = true;
            task.spawn(function() --[[ Line: 17 ]]
                -- upvalues: v3 (ref), v5 (copy)
                task.wait(v3 or 0.05);
                if v5 and v5.Parent then
                    v5:CaptureFocus();
                end;
            end);
        end;
    end, {
        v2, 
        v3
    });
end;