local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Otter);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactOtter);
local l_useRefCache_0 = require(l_Parent_0.ReactUtils).useRefCache;
local v6 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v7 = require(l_script_FirstAncestor_0.Utility.Wrappers);
local l_Connection_0 = v7.Connection;
local l_Instance_0 = v7.Instance;
local l_Signal_0 = v7.Signal;
return function(v11, v12, ...) --[[ Line: 21 ]] --[[ Name: useAnimatedHighlight ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy), l_useRefCache_0 (copy), l_Signal_0 (copy), l_Instance_0 (copy), l_Connection_0 (copy)
    local v13 = v6();
    local v14 = v3.useMemo(function() --[[ Line: 23 ]]
        -- upvalues: v13 (copy)
        return {
            easingStyle = v13.Ease.StandardOut, 
            duration = v13.Time.Time_200
        };
    end, {
        v13
    });
    local v15 = v3.useRef(v11);
    local v16, v17 = v4.useAnimatedBinding(0);
    local v18, v19 = v4.useAnimatedBinding(0);
    local v20, v21 = v3.useBinding(0);
    local v22 = l_useRefCache_0();
    local v27 = v3.useCallback(function(v23, v24) --[[ Line: 37 ]]
        -- upvalues: v12 (copy), v19 (copy), v4 (ref), v17 (copy), v14 (copy), v21 (copy)
        if v23.current and v12.current then
            local v25 = v23.current.AbsolutePosition.X - v12.current.AbsolutePosition.X;
            local l_X_0 = v23.current.AbsoluteSize.X;
            if v24 then
                v19((v4.instant(l_X_0)));
                v17((v4.instant(v25)));
            else
                v17(v4.ease(v25, v14));
                v19(v4.ease(l_X_0, v14));
            end;
            v21(v23.current.AbsoluteSize.Y);
        end;
    end, {
        v14, 
        v11
    });
    v3.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v11 (copy), v22 (copy), v15 (copy), v27 (copy), v12 (copy), l_Signal_0 (ref), l_Instance_0 (ref), l_Connection_0 (ref)
        if v11 then
            local v28 = v22[v11];
            local v29 = v11 == v15.current;
            local function v30() --[[ Line: 61 ]] --[[ Name: animateHighlight ]]
                -- upvalues: v27 (ref), v28 (copy), v29 (copy)
                v27(v28, v29);
            end;
            if v28.current and v12.current then
                local v31 = l_Signal_0.Connect(l_Instance_0.GetPropertyChangedSignal(v28.current, "AbsoluteSize"), v30);
                local v32 = l_Signal_0.Connect(l_Instance_0.GetPropertyChangedSignal(v28.current, "AbsolutePosition"), v30);
                local v33 = l_Signal_0.Connect(l_Instance_0.GetPropertyChangedSignal(v12.current, "AbsoluteSize"), v30);
                return function() --[[ Line: 79 ]]
                    -- upvalues: l_Connection_0 (ref), v31 (copy), v32 (copy), v33 (copy)
                    l_Connection_0.Disconnect(v31);
                    l_Connection_0.Disconnect(v32);
                    l_Connection_0.Disconnect(v33);
                end;
            end;
        end;
        return function() --[[ Line: 87 ]]

        end;
    end, {
        v11
    });
    v3.useEffect(function() --[[ Line: 90 ]]
        -- upvalues: v11 (copy), v22 (copy), v12 (copy), v27 (copy), v15 (copy)
        if v11 then
            local v34 = v22[v11];
            if v34.current and v12.current then
                v27(v34, v11 == v15.current);
            end;
            v15.current = v11;
        end;
    end, {
        v11, 
        ...
    });
    return {
        activeItemHeight = v20, 
        itemRefs = v22, 
        highlightPosition = v16, 
        highlightWidth = v18
    };
end;