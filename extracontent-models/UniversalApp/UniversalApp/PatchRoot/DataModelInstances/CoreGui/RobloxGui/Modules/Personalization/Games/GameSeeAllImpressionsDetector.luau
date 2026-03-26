local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_Signal_0 = v2.Signal;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_dependencyArray_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.dependencyArray;
local l_TopicContentsReducer_0 = require(l_CorePackages_0.Workspace.Packages.TopicContentsRodux).TopicContentsReducer;
local l_ScreenSizeImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ScreenSizeImpressionsDetector;
local l_ImpressionsVisualizer_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ImpressionsVisualizer;
return function(v10) --[[ Line: 32 ]]
    -- upvalues: v1 (copy), l_Signal_0 (copy), l_ImpressionsVisualizer_0 (copy), l_useSelector_0 (copy), l_TopicContentsReducer_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_ScreenSizeImpressionsDetector_0 (copy)
    local v11 = v1.useRef({});
    local v12 = v1.useRef(l_Signal_0.new());
    local v14 = v1.useCallback(function(v13) --[[ Line: 37 ]]
        -- upvalues: v10 (copy)
        return v10.gameSortId .. "_" .. v13;
    end, {
        v10.gameSortId
    });
    local v15 = nil;
    v15 = v1.useRef(nil);
    if v15.current == nil then
        v15.current = l_ImpressionsVisualizer_0.new(v10.impressionsTag, v14);
    end;
    assert(v15.current);
    local v18 = l_useSelector_0(function(v16) --[[ Line: 47 ]]
        -- upvalues: l_TopicContentsReducer_0 (ref), v10 (copy)
        local v17 = v16.Personalization[l_TopicContentsReducer_0.key][v10.gameSortId];
        return v17 and v17.updatedTimestamp or nil;
    end);
    v1.useEffect(function() --[[ Line: 52 ]]
        -- upvalues: v15 (ref), v14 (copy), v12 (copy)
        v15.current:setCustomKeyMapper(v14);
        v12.current:fire();
    end, {
        v14
    });
    v1.useEffect(function() --[[ Line: 58 ]]
        -- upvalues: v11 (copy), v10 (copy), v18 (copy), v15 (ref), v12 (copy)
        local v19 = v11.current[v10.gameSortId] or {};
        if v19.lastUpdatedTimestamp ~= nil and v18 ~= v19.lastUpdatedTimestamp then
            local l_impressionsSeen_0 = v19.impressionsSeen;
            if l_impressionsSeen_0 then
                local v21 = {};
                for v22, v23 in pairs(l_impressionsSeen_0) do
                    if v23 then
                        table.insert(v21, v22);
                    end;
                end;
                if #v21 > 0 then
                    v15.current:onClearImpressions(v21);
                end;
            end;
            v19.impressionsSeen = {};
        end;
        v19.lastUpdatedTimestamp = v18;
        v11.current[v10.gameSortId] = v19;
        v12.current:fire();
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v10.gameSortId, 
        v18
    } else l_dependencyArray_0(v10.gameSortId, v18));
    v1.useEffect(function() --[[ Line: 90 ]]
        -- upvalues: v12 (copy), v10 (copy)
        v12.current:fire();
        local v24 = nil;
        if v10.scrollViewPositionChangedSignal then
            v24 = v10.scrollViewPositionChangedSignal:connect(function() --[[ Line: 98 ]]
                -- upvalues: v12 (ref)
                v12.current:fire();
            end);
        end;
        return function() --[[ Line: 103 ]]
            -- upvalues: v24 (ref)
            if v24 ~= nil then
                v24:disconnect();
            end;
        end;
    end, {
        v10.scrollViewPositionChangedSignal
    });
    v1.useEffect(function() --[[ Line: 110 ]]
        -- upvalues: v15 (ref)
        return function() --[[ Line: 111 ]]
            -- upvalues: v15 (ref)
            v15.current:destroy();
        end;
    end, {});
    local v27 = v1.useCallback(function(v25) --[[ Line: 116 ]]
        -- upvalues: v11 (copy), v10 (copy), v18 (copy)
        if v11.current[v10.gameSortId] == nil then
            v11.current[v10.gameSortId] = {
                impressionsSeen = {}, 
                lastUpdatedTimestamp = v18
            };
        end;
        local v26 = v11.current[v10.gameSortId];
        v26.impressionsSeen = v26.impressionsSeen or {};
        if v26.impressionsSeen[v25] ~= nil then
            return false;
        else
            v26.impressionsSeen[v25] = true;
            return true;
        end;
    end, {
        v10.gameSortId
    });
    local v29 = v1.useCallback(function(v28) --[[ Line: 134 ]]
        -- upvalues: v10 (copy), v15 (ref)
        if not v28 or #v28 == 0 then
            return;
        else
            v10.sendGameImpressions(v28);
            v15.current:onSendImpressions(v28);
            return;
        end;
    end, {
        v10.sendGameImpressions
    });
    return v1.createElement(l_ScreenSizeImpressionsDetector_0, {
        onRequestImpressionsSignal = v12.current, 
        parentRef = v10.parentRef, 
        filterImpressionFunc = v27, 
        onImpressionsDetected = v29, 
        impressionsTag = v10.impressionsTag
    });
end;