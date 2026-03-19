local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local v1 = require(l_Parent_0.React);
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local l_useRouteName_0 = require(l_Parent_0.Navigation).useRouteName;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.Impressions);
local l_ScreenSizeImpressionsDetector_0 = v6.ScreenSizeImpressionsDetector;
local l_ImpressionsVisualizer_0 = v6.ImpressionsVisualizer;
return function(v9) --[[ Line: 23 ]]
    -- upvalues: v1 (copy), l_Signal_0 (copy), l_ImpressionsVisualizer_0 (copy), l_useRouteName_0 (copy), l_useSelector_0 (copy), v5 (copy), l_ScreenSizeImpressionsDetector_0 (copy)
    local v10 = v1.useRef({});
    local v11 = v1.useRef(l_Signal_0.new());
    local v12 = nil;
    v12 = v1.useRef(nil);
    if v12.current == nil then
        v12.current = l_ImpressionsVisualizer_0.new(v9.impressionsTag);
    end;
    assert(v12.current, "impressionsVisualizer should always be truthy; check needed for lint");
    local v13, v14 = v1.useState({});
    local v15, v16 = v1.useState(v9.dataUpdatedTimestamp);
    local v17 = l_useRouteName_0();
    local v19 = l_useSelector_0(function(v18) --[[ Line: 36 ]]
        return v18.ScreenSize;
    end);
    local v20 = v1.useRef(v9.impressionsTag);
    v1.useEffect(function() --[[ Line: 42 ]]
        -- upvalues: v20 (copy), v9 (copy), v16 (copy), v10 (copy), v12 (ref)
        if v20.current ~= v9.impressionsTag then
            v20.current = v9.impressionsTag;
            v16(v9.dataUpdatedTimestamp);
            v10.current = {};
            v12.current:onClearAllImpressions();
            v12.current:setImpressionsTag(v9.impressionsTag);
        end;
    end, {
        v9.impressionsTag
    });
    v1.useEffect(function() --[[ Line: 52 ]]
        -- upvalues: v11 (copy), v9 (copy)
        v11.current:fire();
        local v21 = nil;
        if v9.scrollViewPositionChangedSignal then
            v21 = v9.scrollViewPositionChangedSignal:connect(function() --[[ Line: 59 ]]
                -- upvalues: v11 (ref)
                v11.current:fire();
            end);
        end;
        return function() --[[ Line: 64 ]]
            -- upvalues: v21 (ref)
            if v21 ~= nil then
                v21:disconnect();
            end;
        end;
    end, {
        v9.scrollViewPositionChangedSignal
    });
    v1.useEffect(function() --[[ Line: 71 ]]
        -- upvalues: v9 (copy), v5 (ref), v17 (copy), v11 (copy), v15 (copy), v16 (copy), v10 (copy), v12 (ref)
        local _ = false;
        if if type(v9.pageContext) == "table" then v5.List.find(v9.pageContext, v17) ~= nil else v17 == v9.pageContext then
            v11.current:fire();
            if v9.dataUpdatedTimestamp ~= v15 then
                v16(v9.dataUpdatedTimestamp);
                v10.current = {};
                v12.current:onClearAllImpressions();
            end;
        end;
    end, {
        v17, 
        v9.pageContext, 
        v9.dataUpdatedTimestamp, 
        v15, 
        v19
    });
    v1.useEffect(function() --[[ Line: 90 ]]
        -- upvalues: v13 (copy), v9 (copy), v12 (ref), v14 (copy)
        if v13 ~= nil and #v13 > 0 then
            v9.sendGameImpressions(v13);
            v12.current:onSendImpressions(v13);
            v14({});
        end;
    end, {
        v13
    });
    v1.useEffect(function() --[[ Line: 98 ]]
        -- upvalues: v12 (ref)
        return function() --[[ Line: 99 ]]
            -- upvalues: v12 (ref)
            v12.current:destroy();
        end;
    end, {});
    local v24 = v1.useCallback(function(v23) --[[ Line: 104 ]]
        -- upvalues: v10 (copy)
        if v10.current[v23] ~= nil then
            return false;
        else
            v10.current[v23] = true;
            return true;
        end;
    end, {});
    local v26 = v1.useCallback(function(v25) --[[ Line: 113 ]]
        -- upvalues: v14 (copy)
        if not v25 or #v25 == 0 then
            return;
        else
            v14(v25);
            return;
        end;
    end, {});
    return v1.createElement(l_ScreenSizeImpressionsDetector_0, {
        onRequestImpressionsSignal = v11.current, 
        parentRef = v9.parentRef, 
        filterImpressionFunc = v24, 
        onImpressionsDetected = v26, 
        impressionsTag = v9.impressionsTag
    });
end;