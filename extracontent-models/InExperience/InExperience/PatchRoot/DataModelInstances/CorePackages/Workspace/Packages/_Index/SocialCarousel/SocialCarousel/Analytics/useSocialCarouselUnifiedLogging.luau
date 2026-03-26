local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.RoactUtils);
local v5 = require(l_Parent_0.CollectionViews);
local v6 = require(l_Parent_0.UnifiedLogging);
local v7 = require(l_Parent_0.Impressions);
local v8 = require(l_Parent_0.SharedFlags);
local l_Tile_0 = require(l_script_FirstAncestor_0.Common.Enums).Tile;
local l_TopicContentsReducer_0 = require(l_Parent_0.TopicContentsRodux).TopicContentsReducer;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useCollectionImpressionsSignal_0 = v5.useCollectionImpressionsSignal;
local l_ScreenSizeImpressionsTracker_0 = v7.ScreenSizeImpressionsTracker;
local l_FrameBoundsImpressionsTracker_0 = v7.FrameBoundsImpressionsTracker;
local l_ImpressionsTagUtility_0 = v7.ImpressionsTagUtility;
local l_SendItemImpressions_0 = v6.SendItemImpressions;
local l_FFlagLuaAppUseFrameBoundsImpressions_0 = v8.FFlagLuaAppUseFrameBoundsImpressions;
return function(v18, v19, v20, v21, v22) --[[ Line: 29 ]]
    -- upvalues: l_useCollectionImpressionsSignal_0 (copy), v2 (copy), v3 (copy), l_Tile_0 (copy), l_SendItemImpressions_0 (copy), l_useSelector_0 (copy), l_TopicContentsReducer_0 (copy), l_ImpressionsTagUtility_0 (copy), l_FFlagLuaAppUseFrameBoundsImpressions_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy)
    if not v21 or not v21.tiles or not v20 then
        return nil;
    else
        local v23, v24 = l_useCollectionImpressionsSignal_0(v20.scrollViewPositionChangedSignal);
        local v28 = v2.useCallback(function(v25) --[[ Line: 44 ]]
            -- upvalues: v3 (ref), v21 (copy), l_Tile_0 (ref), l_SendItemImpressions_0 (ref), v19 (copy), v18 (copy), v20 (copy)
            local v27 = v3.Dictionary.map(v21.tiles, function(v26) --[[ Line: 45 ]]
                -- upvalues: v3 (ref), l_Tile_0 (ref)
                return v3.Dictionary.join(v26, {
                    isFriend = v26.tileType == l_Tile_0.Friend
                });
            end);
            l_SendItemImpressions_0.sendFromFriendsCarousel(v19, v18, v25, v27, v20.appPage, v20.sortIndex, v20.sortId, v20.impressionTag);
        end, {
            v19, 
            v18, 
            v21.tiles, 
            v20.appPage, 
            v20.sortIndex, 
            v20.sortId, 
            v20.impressionTag
        });
        local v30 = l_useSelector_0(function(v29) --[[ Line: 71 ]]
            -- upvalues: v20 (copy), l_TopicContentsReducer_0 (ref)
            if v20.sortId then
                return v29.Personalization and v29.Personalization[l_TopicContentsReducer_0.key] and v29.Personalization[l_TopicContentsReducer_0.key][v20.sortId] and v29.Personalization[l_TopicContentsReducer_0.key][v20.sortId].updatedTimestamp;
            else
                return nil;
            end;
        end);
        v2.useEffect(function() --[[ Line: 82 ]]
            -- upvalues: v30 (copy), v22 (copy)
            if v30 then
                v22.current = v30;
            end;
        end, {
            v30
        });
        local v33 = v2.useCallback(function(v31, v32) --[[ Line: 88 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v20 (copy)
            l_ImpressionsTagUtility_0.AddTag(v31, v20.impressionTag, v32);
            return function() --[[ Line: 91 ]]
                -- upvalues: l_ImpressionsTagUtility_0 (ref), v31 (copy), v20 (ref), v32 (copy)
                l_ImpressionsTagUtility_0.RemoveTag(v31, v20.impressionTag, v32);
            end;
        end, {
            v20.impressionTag
        });
        local v35 = v2.useCallback(function(v34) --[[ Line: 99 ]]
            -- upvalues: v2 (ref), l_FFlagLuaAppUseFrameBoundsImpressions_0 (ref), l_FrameBoundsImpressionsTracker_0 (ref), l_ScreenSizeImpressionsTracker_0 (ref), v20 (copy), v23 (copy), v28 (copy), v22 (copy)
            return v2.createElement(if l_FFlagLuaAppUseFrameBoundsImpressions_0 then l_FrameBoundsImpressionsTracker_0 else l_ScreenSizeImpressionsTracker_0, {
                pageContext = v20.appPage, 
                parentRef = v34, 
                impressionsTag = v20.impressionTag, 
                scrollViewPositionChangedSignal = v23, 
                sendImpressions = v28, 
                dataUpdatedTimestamp = v22.current
            });
        end, {
            v20.impressionTag, 
            v23, 
            v20.appPage, 
            v28
        });
        return {
            onCollectionViewabilityChanged = v24, 
            tagTileForImpressions = v33, 
            renderImpressionsTrackerComponent = v35
        };
    end;
end;