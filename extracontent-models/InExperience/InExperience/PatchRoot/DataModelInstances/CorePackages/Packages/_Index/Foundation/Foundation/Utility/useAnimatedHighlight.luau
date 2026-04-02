local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Otter);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactOtter);
local v5 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v6 = require(l_script_FirstAncestor_0.Utility.Wrappers);
local l_Connection_0 = v6.Connection;
local l_Instance_0 = v6.Instance;
local l_Signal_0 = v6.Signal;
return function(v10, v11, v12, ...) --[[ Line: 19 ]] --[[ Name: useAnimatedHighlight ]]
    -- upvalues: v5 (copy), v3 (copy), v4 (copy), l_Signal_0 (copy), l_Instance_0 (copy), l_Connection_0 (copy)
    local v13 = v5();
    local v14 = v3.useMemo(function() --[[ Line: 26 ]]
        -- upvalues: v13 (copy)
        return {
            easingStyle = v13.Ease.StandardOut, 
            duration = v13.Time.Time_200
        };
    end, {
        v13
    });
    local v15 = v3.useRef(v10);
    local v16, v17 = v4.useAnimatedBinding(0);
    local v18, v19 = v4.useAnimatedBinding(0);
    local v20, v21 = v3.useBinding(0);
    local v26 = v3.useCallback(function(v22, v23) --[[ Line: 39 ]]
        -- upvalues: v11 (copy), v19 (copy), v4 (ref), v17 (copy), v14 (copy), v21 (copy)
        if v22.current and v11.current then
            local v24 = v22.current.AbsolutePosition.X - v11.current.AbsolutePosition.X;
            local l_X_0 = v22.current.AbsoluteSize.X;
            if v23 then
                v19((v4.instant(l_X_0)));
                v17((v4.instant(v24)));
            else
                v17(v4.ease(v24, v14));
                v19(v4.ease(l_X_0, v14));
            end;
            v21(v22.current.AbsoluteSize.Y);
        end;
    end, {
        v14, 
        v10
    });
    v3.useEffect(function() --[[ Line: 59 ]]
        -- upvalues: v10 (copy), v12 (copy), v15 (copy), v26 (copy), v11 (copy), l_Signal_0 (ref), l_Instance_0 (ref), l_Connection_0 (ref)
        if v10 then
            local v27 = v12[v10];
            local v28 = v10 == v15.current;
            local function v29() --[[ Line: 63 ]] --[[ Name: animateHighlight ]]
                -- upvalues: v27 (copy), v26 (ref), v28 (copy)
                if v27 then
                    v26(v27, v28);
                end;
            end;
            if v27 and v27.current and v11.current then
                local v30 = l_Signal_0.Connect(l_Instance_0.GetPropertyChangedSignal(v27.current, "AbsoluteSize"), v29);
                local v31 = l_Signal_0.Connect(l_Instance_0.GetPropertyChangedSignal(v27.current, "AbsolutePosition"), v29);
                local v32 = l_Signal_0.Connect(l_Instance_0.GetPropertyChangedSignal(v11.current, "AbsoluteSize"), v29);
                return function() --[[ Line: 83 ]]
                    -- upvalues: l_Connection_0 (ref), v30 (copy), v31 (copy), v32 (copy)
                    l_Connection_0.Disconnect(v30);
                    l_Connection_0.Disconnect(v31);
                    l_Connection_0.Disconnect(v32);
                end;
            end;
        end;
        return function() --[[ Line: 91 ]]

        end;
    end, {
        v10
    });
    v3.useEffect(function() --[[ Line: 94 ]]
        -- upvalues: v10 (copy), v12 (copy), v11 (copy), v26 (copy), v15 (copy)
        if v10 then
            local v33 = v12[v10];
            if v33 and v33.current and v11.current then
                v26(v33, v10 == v15.current);
            end;
            v15.current = v10;
        end;
    end, {
        v10, 
        ...
    });
    return {
        activeItemHeight = v20, 
        highlightPosition = v16, 
        highlightWidth = v18
    };
end;