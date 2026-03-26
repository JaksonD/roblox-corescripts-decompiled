local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local v4 = require(l_Parent_0.ArgCheck);
local l_usePrevious_0 = require(l_Parent_0.RoactUtils).Hooks.usePrevious;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local _ = require(l_Parent_0.DiscoveryTypes);
local l_ScreenSizeImpressionsDetector_0 = require(l_Parent_0.Impressions).ScreenSizeImpressionsDetector;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v12 = require(l_Modules_0.Personalization.OmniFeed.DataStore.FeedItemModel);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v14) --[[ Line: 27 ]]
    -- upvalues: v2 (copy), l_Signal_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_usePrevious_0 (copy), v12 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_ScreenSizeImpressionsDetector_0 (copy), v4 (copy)
    local v15 = v2.useRef({});
    local v16 = v2.useRef(l_Signal_0.new());
    local v17, v18 = v2.useState(nil);
    local v19 = l_useRoactService_0(l_AppEventIngestService_0);
    local v20 = l_usePrevious_0(v14.omniFeedItems);
    local l_eventContext_0 = v14.eventContext;
    v2.useEffect(function() --[[ Line: 35 ]]
        -- upvalues: v14 (copy), v16 (copy)
        local v22 = nil;
        if v14.onItemsUpdatedSignal then
            v22 = v14.onItemsUpdatedSignal:connect(function() --[[ Line: 38 ]]
                -- upvalues: v16 (ref)
                v16.current:fire();
            end);
        end;
        return function() --[[ Line: 42 ]]
            -- upvalues: v22 (ref)
            if v22 ~= nil then
                v22:disconnect();
            end;
        end;
    end, {
        v14.onItemsUpdatedSignal
    });
    local function v34(v23) --[[ Line: 49 ]]
        -- upvalues: v14 (copy), v19 (copy), v12 (ref), l_eventContext_0 (copy)
        local l_omniFeedItems_0 = v14.omniFeedItems;
        if not v19 then
            return;
        elseif not v23 or #v23 == 0 then
            return;
        else
            local v25 = {};
            local v26 = {};
            local v27 = {};
            for v28 = 1, #v23 do
                local v29 = v23[v28];
                local v30 = l_omniFeedItems_0[v29];
                local v31 = v30 and v30.treatmentType or "";
                local v32 = v12.getUniqueNameForAnalytics(v30);
                table.insert(v25, v29);
                table.insert(v26, v31);
                table.insert(v27, v32);
            end;
            local v33 = {
                feedItemPos = table.concat(v25, ","), 
                treatmentType = table.concat(v26, ","), 
                feedItemNameId = table.concat(v27, ",")
            };
            v19:sendEventDeferred(l_eventContext_0, "feedImpressions", v33);
            return;
        end;
    end;
    v2.useEffect(function() --[[ Line: 83 ]]
        -- upvalues: v20 (copy), v14 (copy), v15 (copy), v16 (copy)
        local v35 = false;
        if v20 == nil or v14.omniFeedItems == nil or #v20 > #v14.omniFeedItems then
            v35 = true;
        else
            local v36 = 1;
            while v36 <= #v20 do
                if v20[v36] ~= v14.omniFeedItems[v36] then
                    v35 = true;
                    break;
                else
                    v36 = v36 + 1;
                end;
            end;
        end;
        if v35 then
            v15.current = {};
            v16.current:fire();
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v14.omniFeedItems, 
        v20
    } else l_dependencyArray_0(v14.omniFeedItems, v20));
    v2.useEffect(function() --[[ Line: 110 ]]
        -- upvalues: v17 (copy), v34 (copy), v18 (copy)
        if v17 ~= nil then
            v34(v17);
            v18(nil);
        end;
    end, {
        v17
    });
    return v2.createElement(l_ScreenSizeImpressionsDetector_0, {
        onRequestImpressionsSignal = v16.current, 
        filterImpressionFunc = function(v37) --[[ Line: 119 ]] --[[ Name: filterImpressionFunc ]]
            -- upvalues: v15 (copy)
            if v15.current[v37] ~= nil then
                return false;
            else
                v15.current[v37] = true;
                return true;
            end;
        end, 
        onImpressionsDetected = function(v38) --[[ Line: 127 ]] --[[ Name: onImpressionsDetected ]]
            -- upvalues: v4 (ref), v18 (copy)
            v4.assert(v38 ~= nil);
            v4.assert(#v38 ~= 0);
            v18(v38);
        end, 
        impressionsTag = v14.impressionsTag, 
        skipZeroSizes = true
    });
end;