local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.UnifiedLogging);
local l_SduiCollectionAnalyticsBuilder_0 = require(l_Parent_0.SduiCoreSystem).SduiCollectionAnalyticsBuilder;
local v5 = {};
return function(v6, v7, v8, v9, v10, v11, v12) --[[ Line: 20 ]] --[[ Name: useCollectionAnalyticsContext ]]
    -- upvalues: v1 (copy), l_SduiCollectionAnalyticsBuilder_0 (copy), v2 (copy), v5 (copy)
    local v13 = v1.useRef(nil);
    v13.current = v1.useMemo(function() --[[ Line: 36 ]]
        -- upvalues: v7 (copy), l_SduiCollectionAnalyticsBuilder_0 (ref), v10 (copy), v6 (copy), v8 (copy), v9 (copy), v11 (copy)
        local l_v7_0 = v7;
        return l_SduiCollectionAnalyticsBuilder_0.buildAndValidateCollectionAnalyticsData(v10, v6.ancestorAnalyticsData, v6.analyticsData, v7, v8, v9, nil, l_v7_0, v11);
    end, {
        v10, 
        v6, 
        v8, 
        v9, 
        v7, 
        v11
    });
    return v1.useMemo(function() --[[ Line: 62 ]]
        -- upvalues: v13 (copy), v6 (copy), v12 (copy), v2 (ref), v5 (ref)
        local function v15() --[[ Line: 63 ]]
            -- upvalues: v13 (ref)
            return v13.current;
        end;
        if v6 and v12 then
            v6.getCollectionData = v15;
        end;
        return v2.Dictionary.join(v6 or v5, {
            getCollectionData = v15
        });
    end, {
        v13, 
        v6, 
        v12
    }), v13;
end;