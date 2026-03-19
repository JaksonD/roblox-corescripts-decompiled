local l_Parent_0 = script:FindFirstAncestor("Impressions").Parent;
local v1 = require(l_Parent_0.React);
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local v3 = require(script.Parent.ImpressionsDetector);
local v4 = require(script.Parent.ImpressionDetectorWithoutNavigation);
local v5 = require(script.Parent.ImpressionsVisualizer);
return function(v6) --[[ Line: 28 ]]
    -- upvalues: v1 (copy), l_Signal_0 (copy), v5 (copy), v3 (copy), v4 (copy)
    local v7 = v1.useRef({});
    local v8 = v1.useRef(l_Signal_0.new());
    local v9 = nil;
    v9 = v1.useRef(nil);
    if v9.current == nil then
        v9.current = v5.new(v6.impressionsTag);
    end;
    assert(v9.current, "impressionsVisualizer should always be truthy; check needed for lint");
    local v10, v11 = v1.useState({});
    local v12, v13 = v1.useState(v6.dataUpdatedTimestamp);
    local v14 = v1.useRef(v6.impressionsTag);
    local l_viewPortBounds_0 = v6.viewPortBounds;
    v1.useEffect(function() --[[ Line: 43 ]]
        -- upvalues: v14 (copy), v6 (copy), v13 (copy), v7 (copy), v9 (ref)
        if v14.current ~= v6.impressionsTag then
            v14.current = v6.impressionsTag;
            v13(v6.dataUpdatedTimestamp);
            v7.current = {};
            v9.current:onClearAllImpressions();
            v9.current:setImpressionsTag(v6.impressionsTag);
        end;
    end, {
        v6.impressionsTag
    });
    v1.useEffect(function() --[[ Line: 53 ]]
        -- upvalues: v8 (copy), v6 (copy)
        v8.current:fire();
        local v16 = nil;
        if v6.scrollViewPositionChangedSignal then
            v16 = v6.scrollViewPositionChangedSignal:connect(function() --[[ Line: 57 ]]
                -- upvalues: v8 (ref)
                v8.current:fire();
            end);
        end;
        return function() --[[ Line: 62 ]]
            -- upvalues: v16 (ref)
            if v16 ~= nil then
                v16:disconnect();
            end;
        end;
    end, {
        v6.scrollViewPositionChangedSignal
    });
    v1.useEffect(function() --[[ Line: 70 ]]
        -- upvalues: v6 (copy), v8 (copy), v12 (copy), v13 (copy), v7 (copy), v9 (ref)
        if v6.pageContext and v6.routeName == v6.pageContext then
            v8.current:fire();
            if v6.dataUpdatedTimestamp ~= v12 then
                v13(v6.dataUpdatedTimestamp);
                v7.current = {};
                v9.current:onClearAllImpressions();
            end;
        end;
    end, {
        v6.routeName, 
        v6.pageContext, 
        v6.dataUpdatedTimestamp, 
        v12, 
        l_viewPortBounds_0
    });
    v1.useEffect(function() --[[ Line: 93 ]]
        -- upvalues: v10 (copy), v6 (copy), v9 (ref), v11 (copy)
        if v10 ~= nil and #v10 > 0 then
            v6.sendImpressions(v10);
            v9.current:onSendImpressions(v10);
            v11({});
        end;
    end, {
        v10
    });
    v1.useEffect(function() --[[ Line: 101 ]]
        -- upvalues: v9 (ref)
        return function() --[[ Line: 102 ]]
            -- upvalues: v9 (ref)
            v9.current:destroy();
        end;
    end, {});
    local v18 = v1.useCallback(function(v17) --[[ Line: 107 ]]
        -- upvalues: v7 (copy)
        if v7.current[v17] ~= nil then
            return false;
        else
            v7.current[v17] = true;
            return true;
        end;
    end, {});
    local v20 = v1.useCallback(function(v19) --[[ Line: 116 ]]
        -- upvalues: v11 (copy)
        if not v19 or #v19 == 0 then
            return;
        else
            v11(v19);
            return;
        end;
    end, {});
    local v21 = if v6.pageContext then v3 else v4;
    return v1.createElement(v21, {
        parentRef = v6.parentRef, 
        viewPortBounds = l_viewPortBounds_0, 
        onRequestImpressionsSignal = v8.current, 
        filterImpressionFunc = v18, 
        onImpressionsDetected = v20, 
        impressionsTag = v6.impressionsTag
    });
end;