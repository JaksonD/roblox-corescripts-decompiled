local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local l_GameCollectionItemTypes_0 = require(l_Parent_0.DiscoveryTypes).GameCollectionItemTypes;
local l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone;
local v3 = require(l_Parent_0.React);
local l_EmphasisGameTile_0 = require(l_Parent_0.GameTile).EmphasisGameTile;
local v6 = v3.memo(function(v5) --[[ Line: 44 ]]
    -- upvalues: v3 (copy), l_EmphasisGameTile_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy)
    return v3.createElement(l_EmphasisGameTile_0, {
        size = v5.item.sizeOverride, 
        index = v5.index, 
        layoutOrder = v5.index, 
        selectionOrder = v5.selectionOrder, 
        isDisabled = v5.isDisabled, 
        onSelectionGained = v5.onHoldableFocused, 
        onSelectionLost = v5.onHoldableUnfocused, 
        entry = v5.item, 
        topicId = v5.topicId, 
        source = v5.source, 
        referralSource = v5.referralSource, 
        playerCountStyle = v5.playerCountStyle, 
        hideGameStats = v5.hideGameStats, 
        gameTileLayoutType = v5.gameTileLayoutType, 
        useHoverTile = v5.hoverTileEnabled, 
        isContained = v5.isContained, 
        reportGameDetailOpened = v5.reportGameDetailOpened, 
        reportExperienceLaunched = v5.reportExperienceLaunched, 
        launchExperienceEventContext = v5.launchExperienceEventContext, 
        onPeekViewClosed = v5.onPeekViewClosed, 
        navigateToGameDetails = v5.navigateToGameDetails, 
        impressionsTag = v5.impressionsTag, 
        textSizeOffset = v5.textSizeOffset, 
        showDescription = v5.item.showDescription, 
        zIndex = v5.zIndex, 
        onTileImageLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v5.onTileImageLoaded else nil
    });
end);
return function(v7) --[[ Line: 76 ]]
    -- upvalues: v3 (copy), v6 (copy), l_GameCollectionItemTypes_0 (copy)
    return v3.createElement(v6, v7), l_GameCollectionItemTypes_0.GameCollectionItemType.EmphasisTile;
end;