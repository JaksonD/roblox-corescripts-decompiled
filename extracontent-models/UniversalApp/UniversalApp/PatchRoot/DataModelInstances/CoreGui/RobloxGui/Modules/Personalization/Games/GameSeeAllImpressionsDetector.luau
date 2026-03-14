local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_dependencyArray_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.dependencyArray;
local l_TopicContentsReducer_0 = require(l_CorePackages_0.Workspace.Packages.TopicContentsRodux).TopicContentsReducer;
local l_ScreenSizeImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ScreenSizeImpressionsDetector;
local l_ImpressionsVisualizer_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ImpressionsVisualizer;
return function(v8) --[[ Line: 29 ]]
    -- upvalues: v1 (copy), l_Signal_0 (copy), l_ImpressionsVisualizer_0 (copy), l_useSelector_0 (copy), l_TopicContentsReducer_0 (copy), l_dependencyArray_0 (copy), l_ScreenSizeImpressionsDetector_0 (copy)
    local v9 = v1.useRef({});
    local v10 = v1.useRef(l_Signal_0.new());
    local v12 = v1.useCallback(function(v11) --[[ Line: 34 ]]
        -- upvalues: v8 (copy)
        return v8.gameSortId .. "_" .. v11;
    end, {
        v8.gameSortId
    });
    local v13 = nil;
    v13 = v1.useRef(nil);
    if v13.current == nil then
        v13.current = l_ImpressionsVisualizer_0.new(v8.impressionsTag, v12);
    end;
    assert(v13.current);
    local v16 = l_useSelector_0(function(v14) --[[ Line: 44 ]]
        -- upvalues: l_TopicContentsReducer_0 (ref), v8 (copy)
        local v15 = v14.Personalization[l_TopicContentsReducer_0.key][v8.gameSortId];
        return v15 and v15.updatedTimestamp or nil;
    end);
    v1.useEffect(function() --[[ Line: 49 ]]
        -- upvalues: v13 (ref), v12 (copy), v10 (copy)
        v13.current:setCustomKeyMapper(v12);
        v10.current:fire();
    end, {
        v12
    });
    v1.useEffect(function() --[[ Line: 54 ]]
        -- upvalues: v9 (copy), v8 (copy), v16 (copy), v13 (ref), v10 (copy)
        local v17 = v9.current[v8.gameSortId] or {};
        if v17.lastUpdatedTimestamp ~= nil and v16 ~= v17.lastUpdatedTimestamp then
            local l_impressionsSeen_0 = v17.impressionsSeen;
            if l_impressionsSeen_0 then
                local v19 = {};
                for v20, v21 in pairs(l_impressionsSeen_0) do
                    if v21 then
                        table.insert(v19, v20);
                    end;
                end;
                if #v19 > 0 then
                    v13.current:onClearImpressions(v19);
                end;
            end;
            v17.impressionsSeen = {};
        end;
        v17.lastUpdatedTimestamp = v16;
        v9.current[v8.gameSortId] = v17;
        v10.current:fire();
    end, l_dependencyArray_0(v8.gameSortId, v16));
    v1.useEffect(function() --[[ Line: 82 ]]
        -- upvalues: v10 (copy), v8 (copy)
        v10.current:fire();
        local v22 = nil;
        if v8.scrollViewPositionChangedSignal then
            v22 = v8.scrollViewPositionChangedSignal:connect(function() --[[ Line: 90 ]]
                -- upvalues: v10 (ref)
                v10.current:fire();
            end);
        end;
        return function() --[[ Line: 95 ]]
            -- upvalues: v22 (ref)
            if v22 ~= nil then
                v22:disconnect();
            end;
        end;
    end, {
        v8.scrollViewPositionChangedSignal
    });
    v1.useEffect(function() --[[ Line: 102 ]]
        -- upvalues: v13 (ref)
        return function() --[[ Line: 103 ]]
            -- upvalues: v13 (ref)
            v13.current:destroy();
        end;
    end, {});
    local v25 = v1.useCallback(function(v23) --[[ Line: 108 ]]
        -- upvalues: v9 (copy), v8 (copy), v16 (copy)
        if v9.current[v8.gameSortId] == nil then
            v9.current[v8.gameSortId] = {
                impressionsSeen = {}, 
                lastUpdatedTimestamp = v16
            };
        end;
        local v24 = v9.current[v8.gameSortId];
        v24.impressionsSeen = v24.impressionsSeen or {};
        if v24.impressionsSeen[v23] ~= nil then
            return false;
        else
            v24.impressionsSeen[v23] = true;
            return true;
        end;
    end, {
        v8.gameSortId
    });
    local v27 = v1.useCallback(function(v26) --[[ Line: 126 ]]
        -- upvalues: v8 (copy), v13 (ref)
        if not v26 or #v26 == 0 then
            return;
        else
            v8.sendGameImpressions(v26);
            v13.current:onSendImpressions(v26);
            return;
        end;
    end, {
        v8.sendGameImpressions
    });
    return v1.createElement(l_ScreenSizeImpressionsDetector_0, {
        onRequestImpressionsSignal = v10.current, 
        parentRef = v8.parentRef, 
        filterImpressionFunc = v25, 
        onImpressionsDetected = v27, 
        impressionsTag = v8.impressionsTag
    });
end;