local l_Parent_0 = script:FindFirstAncestor("SocialCarousel").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local l_useLoadingTimers_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Timing.useLoadingTimers;
return function(v4) --[[ Line: 10 ]]
    -- upvalues: l_useLoadingTimers_0 (copy), v1 (copy), v2 (copy)
    local v5 = l_useLoadingTimers_0({});
    local v6 = v1.useRef({});
    local v9 = v1.useCallback(function(v7) --[[ Line: 16 ]]
        -- upvalues: v6 (copy), v2 (ref), v5 (copy), v4 (copy)
        if v6.current[v7] then
            return;
        else
            v6.current = v2.Dictionary.join(v6.current, {
                [v7] = true
            });
            local v8 = v5.getTime("carouselLoadingTime");
            v4(v7, v8);
            return;
        end;
    end, {});
    v1.useEffect(function() --[[ Line: 29 ]]
        -- upvalues: v5 (copy)
        v5.start("carouselLoadingTime");
    end, {});
    return {
        onSuccessfulRender = v9
    };
end;