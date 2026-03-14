local l_Parent_0 = script:FindFirstAncestor("ContentSharingRodux").Parent;
local v1 = require(l_Parent_0.Rodux);
local l_FFlagContentFeedEnableReactions_0 = require(l_Parent_0.SharedFlags).FFlagContentFeedEnableReactions;
local v3 = v1.makeActionCreator("GET_POSTS_BY_ID_SUCCEEDED", function() --[[ Line: 8 ]]
    -- upvalues: l_FFlagContentFeedEnableReactions_0 (copy)
    return {
        responseBody = {
            nextTimeCursor = 1715815334691, 
            posts = {
                [1] = {
                    creatorUserId = 11112295953, 
                    postId = "b01b7782-4619-49df-85ae-cd15ca868991", 
                    contentLinkId = "3b156f3794f9a7b3a34d12a61c88dd0159628a25a84e6272ee969c06e71322da", 
                    type = 1, 
                    experienceContext = {
                        experienceId = 123, 
                        placeId = 123123
                    }, 
                    caption = "mock post text", 
                    uploadedAtTimestamp = 1715815334691, 
                    reactions = if l_FFlagContentFeedEnableReactions_0 then {
                        {
                            emoteId = "like", 
                            count = 12, 
                            hasUserReacted = false, 
                            reactionsPage = {}
                        }, 
                        {
                            emoteId = "love", 
                            count = 40, 
                            hasUserReacted = true, 
                            reactionsPage = {}
                        }
                    } else nil
                }
            }, 
            previousTimeCursor = 1715815334691
        }
    };
end);
return {
    mockGetPostsByUserId = "GET_POSTS_BY_ID_SUCCEEDED", 
    mockGetPostsByUserIdAction = v3
};