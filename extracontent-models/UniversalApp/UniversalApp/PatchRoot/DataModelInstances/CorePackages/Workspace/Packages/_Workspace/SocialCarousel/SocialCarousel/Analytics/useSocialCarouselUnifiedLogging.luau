local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.RoactUtils);
local v5 = require(l_Parent_0.CollectionViews);
local v6 = require(l_Parent_0.UnifiedLogging);
local v7 = require(l_Parent_0.Impressions);
local l_Tile_0 = require(l_script_FirstAncestor_0.Common.Enums).Tile;
local l_TopicContentsReducer_0 = require(l_Parent_0.TopicContentsRodux).TopicContentsReducer;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useCollectionImpressionsSignal_0 = v5.useCollectionImpressionsSignal;
local l_ScreenSizeImpressionsTracker_0 = v7.ScreenSizeImpressionsTracker;
local l_ImpressionsTagUtility_0 = v7.ImpressionsTagUtility;
local l_SendItemImpressions_0 = v6.SendItemImpressions;
return function(v15, v16, v17, v18, v19) --[[ Line: 25 ]]
    -- upvalues: l_useCollectionImpressionsSignal_0 (copy), v2 (copy), v3 (copy), l_Tile_0 (copy), l_SendItemImpressions_0 (copy), l_useSelector_0 (copy), l_TopicContentsReducer_0 (copy), l_ImpressionsTagUtility_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy)
    if not v18 or not v18.tiles or not v17 then
        return nil;
    else
        local v20, v21 = l_useCollectionImpressionsSignal_0(v17.scrollViewPositionChangedSignal);
        local v25 = v2.useCallback(function(v22) --[[ Line: 40 ]]
            -- upvalues: v3 (ref), v18 (copy), l_Tile_0 (ref), l_SendItemImpressions_0 (ref), v16 (copy), v15 (copy), v17 (copy)
            local v24 = v3.Dictionary.map(v18.tiles, function(v23) --[[ Line: 41 ]]
                -- upvalues: v3 (ref), l_Tile_0 (ref)
                return v3.Dictionary.join(v23, {
                    isFriend = v23.tileType == l_Tile_0.Friend
                });
            end);
            l_SendItemImpressions_0.sendFromFriendsCarousel(v16, v15, v22, v24, v17.appPage, v17.sortIndex, v17.sortId, v17.impressionTag);
        end, {
            v16, 
            v15, 
            v18.tiles, 
            v17.appPage, 
            v17.sortIndex, 
            v17.sortId, 
            v17.impressionTag
        });
        local v27 = l_useSelector_0(function(v26) --[[ Line: 67 ]]
            -- upvalues: v17 (copy), l_TopicContentsReducer_0 (ref)
            if v17.sortId then
                return v26.Personalization and v26.Personalization[l_TopicContentsReducer_0.key] and v26.Personalization[l_TopicContentsReducer_0.key][v17.sortId] and v26.Personalization[l_TopicContentsReducer_0.key][v17.sortId].updatedTimestamp;
            else
                return nil;
            end;
        end);
        v2.useEffect(function() --[[ Line: 78 ]]
            -- upvalues: v27 (copy), v19 (copy)
            if v27 then
                v19.current = v27;
            end;
        end, {
            v27
        });
        local v30 = v2.useCallback(function(v28, v29) --[[ Line: 84 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v17 (copy)
            l_ImpressionsTagUtility_0.AddTag(v28, v17.impressionTag, v29);
            return function() --[[ Line: 87 ]]
                -- upvalues: l_ImpressionsTagUtility_0 (ref), v28 (copy), v17 (ref), v29 (copy)
                l_ImpressionsTagUtility_0.RemoveTag(v28, v17.impressionTag, v29);
            end;
        end, {
            v17.impressionTag
        });
        local v32 = v2.useCallback(function(v31) --[[ Line: 95 ]]
            -- upvalues: v2 (ref), l_ScreenSizeImpressionsTracker_0 (ref), v17 (copy), v20 (copy), v25 (copy), v19 (copy)
            return v2.createElement(l_ScreenSizeImpressionsTracker_0, {
                pageContext = v17.appPage, 
                parentRef = v31, 
                impressionsTag = v17.impressionTag, 
                scrollViewPositionChangedSignal = v20, 
                sendImpressions = v25, 
                dataUpdatedTimestamp = v19.current
            });
        end, {
            v17.impressionTag, 
            v20, 
            v17.appPage, 
            v25
        });
        return {
            onCollectionViewabilityChanged = v21, 
            tagTileForImpressions = v30, 
            renderImpressionsTrackerComponent = v32
        };
    end;
end;