local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local l_FFlagSduiGetItemCollectionKeys_0 = require(l_Parent_0.SharedFlags).FFlagSduiGetItemCollectionKeys;
return {
    FFlagSduiTileDisableLegacyHover = game:DefineFastFlag("SduiTileDisableLegacyHover", false), 
    FFlagSduiGetItemCollectionKeys = l_FFlagSduiGetItemCollectionKeys_0, 
    FFlagSduiEnableHeroUnitBottomRow = game:DefineFastFlag("SduiEnableHeroUnitBottomRow", false)
};