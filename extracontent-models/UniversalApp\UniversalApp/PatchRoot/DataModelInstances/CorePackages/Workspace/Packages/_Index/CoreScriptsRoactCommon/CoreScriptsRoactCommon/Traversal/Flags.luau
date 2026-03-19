local v0 = game:DefineFastFlag("UseLocalTraversalHistory699v1", false);
local v1 = game:DefineFastFlag("UseTeleportTraversalHistory699v1", false);
local v2 = v0 or v1;
return {
    FFlagAddTraversalBackButton = game:DefineFastFlag("AddTraversalBackButton699v1", false) and v2, 
    FFlagAddTraversalBackButtonAnimation = game:DefineFastFlag("AddTraversalBackButtonAnimation699v1", false) and v2, 
    FFlagAddTraversalHistory = game:DefineFastFlag("AddTraversalHistory699v1", false) and v2, 
    FFlagUseLocalTraversalHistory = v0, 
    FFlagUseTeleportTraversalHistory = v1, 
    FIntMaximumTraversalHistoryItemsFetch = game:DefineFastInt("MaximumTraversalHistoryItemsFetch", 20), 
    FFlagUseHistoryItemsWaitForGameLoad = game:DefineFastFlag("UseHistoryItemsWaitForGameLoad", false), 
    FFlagTraversalExpCardFontSizeFix = game:DefineFastFlag("TraversalExpCardFontSizeFix", false), 
    FFlagTraversalLeaveArrowDown = game:DefineFastFlag("TraversalLeaveArrowDown", false), 
    FFlagTraversalExpPagePaddingFixes = game:DefineFastFlag("TraversalExpPagePaddingFixes709", false), 
    FFlagTraversalHistoryMenuFocusNavFix = game:DefineFastFlag("TraversalHistoryMenuFocusNavFix709", false), 
    FFlagTraversalPerfFixes = game:DefineFastFlag("TraversalPerfFixes4", false), 
    FFlagTraversalRemoveLastInput = game:DefineFastFlag("TraversalRemoveLastInput", false)
};