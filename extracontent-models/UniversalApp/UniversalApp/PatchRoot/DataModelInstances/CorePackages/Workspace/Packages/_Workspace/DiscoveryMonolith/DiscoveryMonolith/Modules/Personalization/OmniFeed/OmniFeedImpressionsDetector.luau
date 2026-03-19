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
return function(v13) --[[ Line: 25 ]]
    -- upvalues: v2 (copy), l_Signal_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_usePrevious_0 (copy), v12 (copy), l_dependencyArray_0 (copy), l_ScreenSizeImpressionsDetector_0 (copy), v4 (copy)
    local v14 = v2.useRef({});
    local v15 = v2.useRef(l_Signal_0.new());
    local v16, v17 = v2.useState(nil);
    local v18 = l_useRoactService_0(l_AppEventIngestService_0);
    local v19 = l_usePrevious_0(v13.omniFeedItems);
    local l_eventContext_0 = v13.eventContext;
    v2.useEffect(function() --[[ Line: 33 ]]
        -- upvalues: v13 (copy), v15 (copy)
        local v21 = nil;
        if v13.onItemsUpdatedSignal then
            v21 = v13.onItemsUpdatedSignal:connect(function() --[[ Line: 36 ]]
                -- upvalues: v15 (ref)
                v15.current:fire();
            end);
        end;
        return function() --[[ Line: 40 ]]
            -- upvalues: v21 (ref)
            if v21 ~= nil then
                v21:disconnect();
            end;
        end;
    end, {
        v13.onItemsUpdatedSignal
    });
    local function v33(v22) --[[ Line: 47 ]]
        -- upvalues: v13 (copy), v18 (copy), v12 (ref), l_eventContext_0 (copy)
        local l_omniFeedItems_0 = v13.omniFeedItems;
        if not v18 then
            return;
        elseif not v22 or #v22 == 0 then
            return;
        else
            local v24 = {};
            local v25 = {};
            local v26 = {};
            for v27 = 1, #v22 do
                local v28 = v22[v27];
                local v29 = l_omniFeedItems_0[v28];
                local v30 = v29 and v29.treatmentType or "";
                local v31 = v12.getUniqueNameForAnalytics(v29);
                table.insert(v24, v28);
                table.insert(v25, v30);
                table.insert(v26, v31);
            end;
            local v32 = {
                feedItemPos = table.concat(v24, ","), 
                treatmentType = table.concat(v25, ","), 
                feedItemNameId = table.concat(v26, ",")
            };
            v18:sendEventDeferred(l_eventContext_0, "feedImpressions", v32);
            return;
        end;
    end;
    v2.useEffect(function() --[[ Line: 80 ]]
        -- upvalues: v19 (copy), v13 (copy), v14 (copy), v15 (copy)
        local v34 = false;
        if v19 == nil or v13.omniFeedItems == nil or #v19 > #v13.omniFeedItems then
            v34 = true;
        else
            local v35 = 1;
            while v35 <= #v19 do
                if v19[v35] ~= v13.omniFeedItems[v35] then
                    v34 = true;
                    break;
                else
                    v35 = v35 + 1;
                end;
            end;
        end;
        if v34 then
            v14.current = {};
            v15.current:fire();
        end;
    end, l_dependencyArray_0(v13.omniFeedItems, v19));
    v2.useEffect(function() --[[ Line: 103 ]]
        -- upvalues: v16 (copy), v33 (copy), v17 (copy)
        if v16 ~= nil then
            v33(v16);
            v17(nil);
        end;
    end, {
        v16
    });
    return v2.createElement(l_ScreenSizeImpressionsDetector_0, {
        onRequestImpressionsSignal = v15.current, 
        filterImpressionFunc = function(v36) --[[ Line: 112 ]] --[[ Name: filterImpressionFunc ]]
            -- upvalues: v14 (copy)
            if v14.current[v36] ~= nil then
                return false;
            else
                v14.current[v36] = true;
                return true;
            end;
        end, 
        onImpressionsDetected = function(v37) --[[ Line: 120 ]] --[[ Name: onImpressionsDetected ]]
            -- upvalues: v4 (ref), v17 (copy)
            v4.assert(v37 ~= nil);
            v4.assert(#v37 ~= 0);
            v17(v37);
        end, 
        impressionsTag = v13.impressionsTag, 
        skipZeroSizes = true
    });
end;