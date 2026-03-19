local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
return function(v2, v3) --[[ Line: 5 ]] --[[ Name: useRefImpression ]]
    -- upvalues: v1 (copy)
    local v4 = v1.useRef(false);
    local v7 = v1.useCallback(function(v5, v6) --[[ Line: 8 ]]
        -- upvalues: v4 (copy), v3 (copy)
        if v5.AbsolutePosition.Y <= v6.AbsoluteSize.Y then
            v4.current = true;
            v3();
        end;
    end, {
        v3
    });
    v1.useEffect(function() --[[ Line: 15 ]]
        -- upvalues: v4 (copy), v2 (copy), v7 (copy)
        if v4.current then
            return;
        else
            local l_current_0 = v2.current;
            local v9 = nil;
            if l_current_0 then
                local l_l_current_0_FirstAncestorWhichIsA_0 = l_current_0:FindFirstAncestorWhichIsA("ScreenGui");
                if l_l_current_0_FirstAncestorWhichIsA_0 then
                    v7(l_current_0, l_l_current_0_FirstAncestorWhichIsA_0);
                    v9 = l_current_0:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ Line: 29 ]]
                        -- upvalues: v4 (ref), v7 (ref), l_current_0 (copy), l_l_current_0_FirstAncestorWhichIsA_0 (copy)
                        if v4.current then
                            return;
                        else
                            v7(l_current_0, l_l_current_0_FirstAncestorWhichIsA_0);
                            return;
                        end;
                    end);
                end;
            end;
            return function() --[[ Line: 39 ]]
                -- upvalues: v9 (ref)
                if v9 then
                    v9:Disconnect();
                end;
            end;
        end;
    end);
end;