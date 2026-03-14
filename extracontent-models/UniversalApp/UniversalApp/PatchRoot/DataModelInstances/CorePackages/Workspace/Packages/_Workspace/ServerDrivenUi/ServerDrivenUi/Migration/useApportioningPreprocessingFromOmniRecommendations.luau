local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.tutils);
local v4 = require(l_Parent_0.RoactUtils);
local _ = require(l_Parent_0.CollectionViews);
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
return function(v18, v19) --[[ Line: 32 ]] --[[ Name: useApportioningPreprocessingFromOmniRecommendations ]]
    -- upvalues: l_useSelector_0 (copy), v3 (copy), l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (copy), l_TopicContentsReducer_0 (copy), l_FFlagLuaAppUseEffectInSignalPreprocessing_0 (copy), v2 (copy), v14 (copy), l_OmniFeedTypes_0 (copy), l_GameTileLayoutType_0 (copy), l_OmniFeedConstants_0 (copy), l_getGameTileCollectionItemSize_0 (copy), v15 (copy)
    local v22 = l_useSelector_0(function(v20) --[[ Line: 36 ]]
        -- upvalues: v18 (copy)
        local v21 = v20.OmniRecommendations[v18];
        if v21 then
            return v21.sorts;
        else
            return {};
        end;
    end, v3.shallowEqual);
    local v23 = nil;
    if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then
        v23 = l_useSelector_0(function(v24) --[[ Line: 46 ]]
            -- upvalues: v18 (copy)
            local v25 = v24.OmniRecommendations[v18];
            if v25 then
                return v25.recommendationsId;
            else
                return nil;
            end;
        end);
    end;
    local v27 = l_useSelector_0(function(v26) --[[ Line: 55 ]]
        -- upvalues: l_TopicContentsReducer_0 (ref)
        return v26.Personalization[l_TopicContentsReducer_0.key];
    end);
    (if l_FFlagLuaAppUseEffectInSignalPreprocessing_0 then v2.useEffect else v2.useLayoutEffect)(function() --[[ Line: 63 ]]
        -- upvalues: v14 (ref), v18 (copy), v22 (copy), l_OmniFeedTypes_0 (ref), l_GameTileLayoutType_0 (ref), l_OmniFeedConstants_0 (ref), l_getGameTileCollectionItemSize_0 (ref), v19 (copy), v15 (ref), v27 (copy), l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (ref), v23 (ref)
        local v28 = v14(v18);
        local v29 = {};
        for v30, v31 in v22 do
            local l_topicId_0 = v31.topicId;
            if l_topicId_0 and v31.treatmentType == l_OmniFeedTypes_0.HomeGameGrid then
                local l_Narrow_0 = l_GameTileLayoutType_0.Narrow;
                if v31.topicLayoutData then
                    local v34 = v31.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.ComponentType];
                    if v34 then
                        if v34 == l_OmniFeedConstants_0.ComponentTypeDataKeys.EventTile then
                            l_Narrow_0 = l_GameTileLayoutType_0.Event;
                        elseif v34 == l_OmniFeedConstants_0.ComponentTypeDataKeys.GridTile then
                            l_Narrow_0 = l_GameTileLayoutType_0.Wide;
                        end;
                    end;
                end;
                local l_numColumns_0 = v19[l_getGameTileCollectionItemSize_0(l_Narrow_0)](false).numColumns;
                local v36 = v31.numberOfRows or 99999;
                if v36 == -1 then
                    v36 = 99999;
                end;
                local v37 = l_numColumns_0 * v36;
                v15.addToApportioningData(v29, l_topicId_0, v37, v30);
            end;
        end;
        v15.populateStartingItemIndices(v29);
        for v38, v39 in v29 do
            local v40 = nil;
            if v38 then
                v40 = v27 and v27[v38] or nil;
            end;
            v39.items = v40 and v40.entries or {};
        end;
        v28.updateData({
            apportioningData = v29
        }, if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v23 else nil);
        return function() --[[ Line: 119 ]]

        end;
    end, {
        v22, 
        v27, 
        v19, 
        v18, 
        if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v23 else nil
    });
end;