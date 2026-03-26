local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.tutils);
local v4 = require(l_Parent_0.RoactUtils);
local v5 = require(l_Parent_0.CollectionViews);
local v6 = require(l_Parent_0.GameTile);
local l_GameTileLayoutType_0 = v6.GameTileTypes.GameTileLayoutType;
local l_TopicContentsReducer_0 = require(l_Parent_0.TopicContentsRodux).TopicContentsReducer;
local v9 = require(l_Parent_0.DiscoveryTypes);
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_getGameTileCollectionItemSize_0 = v6.getGameTileCollectionItemSize;
local l_OmniFeedTypes_0 = v9.OmniFeedTypes;
local l_OmniFeedConstants_0 = v9.OmniFeedConstants;
local v14 = require(l_script_FirstAncestor_0.DataStore.getSduiFeedStore);
local v15 = require(l_script_FirstAncestor_0.DataStore.ApportioningPreprocessingHelpers);
local l_FFlagLuaAppUseEffectInSignalPreprocessing_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUseEffectInSignalPreprocessing;
local l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddRequestIdToRfySignalApportioning;
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionAlways;
local l_getMainCollectionLayoutStore_0 = v5.getMainCollectionLayoutStore;
return function(v21, v22, v23) --[[ Line: 36 ]] --[[ Name: useApportioningPreprocessingFromOmniRecommendations ]]
    -- upvalues: l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_useSelector_0 (copy), v3 (copy), l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (copy), l_TopicContentsReducer_0 (copy), l_FFlagLuaAppUseEffectInSignalPreprocessing_0 (copy), v2 (copy), v14 (copy), l_getMainCollectionLayoutStore_0 (copy), l_OmniFeedTypes_0 (copy), l_GameTileLayoutType_0 (copy), l_OmniFeedConstants_0 (copy), l_getGameTileCollectionItemSize_0 (copy), v15 (copy)
    local v24 = l_FFlagLuaAppCompositionAlways_0 or l_FFlagLuaAppCompositionSupport_0 and v23;
    local v27 = l_useSelector_0(function(v25) --[[ Line: 44 ]]
        -- upvalues: v21 (copy)
        local v26 = v25.OmniRecommendations[v21];
        if v26 then
            return v26.sorts;
        else
            return {};
        end;
    end, v3.shallowEqual);
    local v28 = nil;
    if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then
        v28 = l_useSelector_0(function(v29) --[[ Line: 54 ]]
            -- upvalues: v21 (copy)
            local v30 = v29.OmniRecommendations[v21];
            if v30 then
                return v30.recommendationsId;
            else
                return nil;
            end;
        end);
    end;
    local v32 = l_useSelector_0(function(v31) --[[ Line: 63 ]]
        -- upvalues: l_TopicContentsReducer_0 (ref)
        return v31.Personalization[l_TopicContentsReducer_0.key];
    end);
    (if l_FFlagLuaAppUseEffectInSignalPreprocessing_0 then v2.useEffect else v2.useLayoutEffect)(function() --[[ Line: 71 ]]
        -- upvalues: v14 (ref), v21 (copy), v24 (copy), l_getMainCollectionLayoutStore_0 (ref), v27 (copy), l_OmniFeedTypes_0 (ref), l_GameTileLayoutType_0 (ref), l_OmniFeedConstants_0 (ref), l_getGameTileCollectionItemSize_0 (ref), v22 (copy), v15 (ref), v32 (copy), l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (ref), v28 (ref)
        local v33 = v14(v21);
        local v34 = {};
        local v35 = nil;
        if v24 then
            v35 = l_getMainCollectionLayoutStore_0(false).getNumItemsForAllCategories(false);
        end;
        for v36, v37 in v27 do
            local l_topicId_0 = v37.topicId;
            if l_topicId_0 and v37.treatmentType == l_OmniFeedTypes_0.HomeGameGrid then
                local l_Narrow_0 = l_GameTileLayoutType_0.Narrow;
                if v37.topicLayoutData then
                    local v40 = v37.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.ComponentType];
                    if v40 then
                        if v40 == l_OmniFeedConstants_0.ComponentTypeDataKeys.EventTile then
                            l_Narrow_0 = l_GameTileLayoutType_0.Event;
                        elseif v40 == l_OmniFeedConstants_0.ComponentTypeDataKeys.GridTile then
                            l_Narrow_0 = l_GameTileLayoutType_0.Wide;
                        end;
                    end;
                end;
                local v41 = l_getGameTileCollectionItemSize_0(l_Narrow_0);
                local v42 = nil;
                v42 = if v24 then v35[v41] else v22[v41](false).numColumns;
                local v43 = v37.numberOfRows or 99999;
                if v43 == -1 then
                    v43 = 99999;
                end;
                local v44 = v42 * v43;
                v15.addToApportioningData(v34, l_topicId_0, v44, v36);
            end;
        end;
        v15.populateStartingItemIndices(v34);
        for v45, v46 in v34 do
            local v47 = nil;
            if v45 then
                v47 = v32 and v32[v45] or nil;
            end;
            v46.items = v47 and v47.entries or {};
        end;
        v33.updateData({
            apportioningData = v34
        }, if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v28 else nil);
        return function() --[[ Line: 138 ]]

        end;
    end, {
        v27, 
        v32, 
        if not l_FFlagLuaAppCompositionAlways_0 then v22 else nil, 
        v21, 
        if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v28 else nil, 
        if l_FFlagLuaAppCompositionSupport_0 then v24 else nil
    });
end;