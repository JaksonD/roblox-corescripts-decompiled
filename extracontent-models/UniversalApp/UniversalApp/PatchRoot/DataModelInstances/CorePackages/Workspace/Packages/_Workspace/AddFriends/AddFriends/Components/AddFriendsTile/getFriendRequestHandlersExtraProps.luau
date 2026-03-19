return function(v0) --[[ Line: 25 ]]
    return {
        absolutePosition = v0.position, 
        requestedId = v0.playerId, 
        isRecommendation = not v0.isFriendRequest, 
        recommendationRank = if not v0.isFriendRequest then v0.rank else nil, 
        isContact = v0.isContact, 
        contextualInfoType = v0.contextualInfoType
    };
end;