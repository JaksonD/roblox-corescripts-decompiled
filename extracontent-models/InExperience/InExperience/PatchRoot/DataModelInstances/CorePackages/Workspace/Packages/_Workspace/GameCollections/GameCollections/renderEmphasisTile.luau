local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local l_GameCollectionItemTypes_0 = require(l_Parent_0.DiscoveryTypes).GameCollectionItemTypes;
local v2 = require(l_Parent_0.React);
local l_EmphasisGameTile_0 = require(l_Parent_0.GameTile).EmphasisGameTile;
local v5 = v2.memo(function(v4) --[[ Line: 38 ]]
    -- upvalues: v2 (copy), l_EmphasisGameTile_0 (copy)
    return v2.createElement(l_EmphasisGameTile_0, {
        size = v4.item.sizeOverride, 
        index = v4.index, 
        layoutOrder = v4.index, 
        selectionOrder = v4.selectionOrder, 
        isDisabled = v4.isDisabled, 
        onSelectionGained = v4.onHoldableFocused, 
        onSelectionLost = v4.onHoldableUnfocused, 
        entry = v4.item, 
        topicId = v4.topicId, 
        source = v4.source, 
        referralSource = v4.referralSource, 
        playerCountStyle = v4.playerCountStyle, 
        hideGameStats = v4.hideGameStats, 
        gameTileLayoutType = v4.gameTileLayoutType, 
        useHoverTile = v4.hoverTileEnabled, 
        isContained = v4.isContained, 
        reportGameDetailOpened = v4.reportGameDetailOpened, 
        reportExperienceLaunched = v4.reportExperienceLaunched, 
        launchExperienceEventContext = v4.launchExperienceEventContext, 
        onPeekViewClosed = v4.onPeekViewClosed, 
        navigateToGameDetails = v4.navigateToGameDetails, 
        impressionsTag = v4.impressionsTag, 
        textSizeOffset = v4.textSizeOffset, 
        showDescription = v4.item.showDescription, 
        zIndex = v4.zIndex
    });
end);
return function(v6) --[[ Line: 69 ]]
    -- upvalues: v2 (copy), v5 (copy), l_GameCollectionItemTypes_0 (copy)
    return v2.createElement(v5, v6), l_GameCollectionItemTypes_0.GameCollectionItemType.EmphasisTile;
end;