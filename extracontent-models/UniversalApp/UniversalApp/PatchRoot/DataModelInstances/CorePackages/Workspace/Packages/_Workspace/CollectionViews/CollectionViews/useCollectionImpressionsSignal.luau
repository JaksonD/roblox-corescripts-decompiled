local l_Parent_0 = script:FindFirstAncestor("CollectionViews").Parent;
local v1 = require(l_Parent_0.React);
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
return function(v3) --[[ Line: 18 ]] --[[ Name: useCollectionImpressionsSignal ]]
    -- upvalues: v1 (copy), l_Signal_0 (copy)
    local v4 = v1.useRef(nil);
    if v4.current == nil then
        v4.current = l_Signal_0.new();
    end;
    local l_current_0 = v4.current;
    v1.useEffect(function() --[[ Line: 25 ]]
        -- upvalues: l_current_0 (copy), v3 (copy)
        l_current_0:fire();
        local v6 = nil;
        if v3 then
            v6 = v3:connect(function() --[[ Line: 34 ]]
                -- upvalues: l_current_0 (ref)
                l_current_0:fire();
            end);
        end;
        return function() --[[ Line: 39 ]]
            -- upvalues: v6 (ref)
            if v6 then
                v6:disconnect();
            end;
        end;
    end, {
        v3, 
        l_current_0
    });
    return l_current_0, (v1.useCallback(function() --[[ Line: 46 ]]
        -- upvalues: l_current_0 (copy)
        l_current_0:fire();
    end, {
        l_current_0
    }));
end;