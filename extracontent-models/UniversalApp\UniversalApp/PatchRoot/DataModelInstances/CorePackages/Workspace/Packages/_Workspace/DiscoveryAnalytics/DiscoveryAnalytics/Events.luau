local l_Parent_0 = script:FindFirstAncestor("DiscoveryAnalytics").Parent;
local l_FFlagSduiExperienceDetailsSocialProof_0 = require(l_Parent_0.SharedFlags).FFlagSduiExperienceDetailsSocialProof;
return {
    gameDetailReferral = require(script.gameDetailReferral), 
    gameCopyExperienceLink = require(script.gameCopyExperienceLink), 
    gameDetailsSubpage = require(script.gameDetailsSubpage), 
    gameFavorite = require(script.gameFavorite), 
    gameFollow = require(script.gameFollow), 
    gamePlayIntent = require(script.gamePlayIntent), 
    gameShareExperienceLink = require(script.gameShareExperienceLink), 
    gameVote = require(script.gameVote), 
    unlockPlayIntent = require(script.unlockPlayIntent), 
    sortDeeplinkFailureCounter = require(script.sortDeeplinkFailureCounter), 
    gameConnectionsPlayedChipClicked = if l_FFlagSduiExperienceDetailsSocialProof_0 then require(script.gameConnectionsPlayedChipClicked) else nil, 
    gameTileOverflowMenuAction = require(script.gameTileOverflowMenuAction), 
    discoveryVideoEndEvent = require(script.Video.discoveryVideoEndEvent), 
    discoveryVideoLoadEvent = require(script.Video.discoveryVideoLoadEvent), 
    discoveryVideoLoopEvent = require(script.Video.discoveryVideoLoopEvent), 
    discoveryVideoPlayEvent = require(script.Video.discoveryVideoPlayEvent), 
    gameDetailsPeekViewEvents = require(script.gameDetailsPeekViewEvents), 
    reportGameAttributionError = require(script.reportGameAttributionError), 
    fireInExperienceDetailsPromptOpenedEvent = require(script.fireInExperienceDetailsPromptOpenedEvent), 
    fireInExperienceDetailsPromptPlayButtonClickedEvent = require(script.fireInExperienceDetailsPromptPlayButtonClickedEvent), 
    fireInExperienceDetailsPromptClosedEvent = require(script.fireInExperienceDetailsPromptClosedEvent), 
    fireInExperienceDetailsPromptLoadedEvent = require(script.fireInExperienceDetailsPromptLoadedEvent)
};