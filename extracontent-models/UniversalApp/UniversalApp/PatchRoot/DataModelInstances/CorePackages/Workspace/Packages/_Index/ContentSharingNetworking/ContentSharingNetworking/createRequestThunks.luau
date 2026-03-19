local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_networkRequests_0 = l_Parent_0.networkRequests;
local l_FFlagContentFeedEnableReactions_0 = require(l_Parent_1.SharedFlags).FFlagContentFeedEnableReactions;
local v4 = require(l_networkRequests_0.createAddReaction);
local v5 = require(l_networkRequests_0.createDeletePost);
local v6 = require(l_networkRequests_0.createGetPostsByCursor);
local v7 = require(l_networkRequests_0.createGetPostsByPostId);
local v8 = require(l_networkRequests_0.createGetPostsByUserId);
local v9 = require(l_networkRequests_0.createGetThumbnailByAssetId);
local v10 = require(l_networkRequests_0.createRemoveReaction);
return function(v11) --[[ Line: 15 ]]
    -- upvalues: l_FFlagContentFeedEnableReactions_0 (copy), v4 (copy), v5 (copy), l_networkRequests_0 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy)
    return {
        AddReaction = if l_FFlagContentFeedEnableReactions_0 then v4(v11) else nil, 
        DeletePost = v5(v11), 
        GetActiveCategories = require(l_networkRequests_0.createGetActiveCategories)(v11), 
        GetPostsByCursor = v6(v11), 
        GetPostsByPostId = v7(v11), 
        GetPostsByUserId = v8(v11), 
        GetThumbnailByAssetId = v9(v11), 
        RemoveReaction = if l_FFlagContentFeedEnableReactions_0 then v10(v11) else nil
    };
end;