local l_Parent_0 = script:FindFirstAncestor("SocialLuaAnalytics").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.useLoadingTimers);
return function(v3) --[[ Line: 26 ]] --[[ Name: useFetchTimeLogging ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v4 = v2({});
    local v5 = v1.useRef("");
    local l_loading_0 = v3.loading;
    local l_error_0 = v3.error;
    v1.useEffect(function() --[[ Line: 33 ]]
        -- upvalues: l_loading_0 (copy), v5 (copy), v4 (copy), v3 (copy), l_error_0 (copy)
        if l_loading_0 then
            v5.current = v4.start(v3.timerKey);
        end;
        if not l_loading_0 and v5.current == v3.timerKey then
            local v8 = v4.stop(v3.timerKey);
            v5.current = "";
            if l_error_0 then
                v3.onError(v8, v3.timerKey);
                return;
            else
                v3.onSuccess(v8, v3.timerKey);
            end;
        end;
    end, {
        v3.timerKey, 
        l_loading_0, 
        l_error_0
    });
end;