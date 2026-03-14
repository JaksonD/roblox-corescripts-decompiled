local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContentSharingRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Rodux);
local v4 = require(l_script_FirstAncestor_0.Utils.mergeSortPosts);
local l_FFlagContentFeedEnableReactions_0 = require(l_Parent_0.SharedFlags).FFlagContentFeedEnableReactions;
local v6 = {
    byUserId = {}
};
local function _(v7, v8) --[[ Line: 19 ]]
    if v7 == nil or v8 == nil then
        return nil;
    else
        return (math.max(v7, v8));
    end;
end;
local function _(v10, v11) --[[ Line: 27 ]]
    if v10 == nil or v11 == nil then
        return nil;
    else
        return (math.min(v10, v11));
    end;
end;
local function v20(v13) --[[ Line: 35 ]]
    local v14 = {};
    for _, v16 in v13 do
        local v17 = {};
        if v16.reactions then
            for _, v19 in v16.reactions do
                v17[v19.emoteId] = v19;
            end;
        end;
        v14[v16.postId] = v17;
    end;
    return v14;
end;
local function _(v21) --[[ Line: 50 ]]
    -- upvalues: l_FFlagContentFeedEnableReactions_0 (copy), v20 (copy)
    return {
        nextTimeCursor = v21.responseBody.nextTimeCursor, 
        posts = v21.responseBody.posts, 
        previousTimeCursor = v21.responseBody.previousTimeCursor, 
        reactionsByPostId = if l_FFlagContentFeedEnableReactions_0 then v20(v21.responseBody.posts) else nil
    };
end;
local function v30(v23, v24) --[[ Line: 61 ]]
    -- upvalues: v4 (copy), l_FFlagContentFeedEnableReactions_0 (copy), v2 (copy), v20 (copy)
    if #v24.responseBody.posts == 0 then
        return v23;
    else
        local v25 = tostring(v24.responseBody.posts[1].creatorUserId);
        local v26 = {};
        if v23.byUserId[v25] ~= nil then
            local v27 = {};
            local l_nextTimeCursor_0 = v23.byUserId[v25].nextTimeCursor;
            local l_nextTimeCursor_1 = v24.responseBody.nextTimeCursor;
            v27.nextTimeCursor = if not (l_nextTimeCursor_0 ~= nil) or l_nextTimeCursor_1 == nil then nil else math.max(l_nextTimeCursor_0, l_nextTimeCursor_1);
            v27.posts = v4(v23.byUserId[v25].posts or {}, v24.responseBody.posts);
            l_nextTimeCursor_0 = v23.byUserId[v25].previousTimeCursor;
            l_nextTimeCursor_1 = v24.responseBody.previousTimeCursor;
            v27.previousTimeCursor = if not (l_nextTimeCursor_0 ~= nil) or l_nextTimeCursor_1 == nil then nil else math.min(l_nextTimeCursor_0, l_nextTimeCursor_1);
            v27.reactionsByPostId = if l_FFlagContentFeedEnableReactions_0 then v2.Dictionary.join(v23.byUserId[v25].reactionsByPostId or {}, (v20(v24.responseBody.posts))) else nil;
            v26[v25] = v27;
        else
            v26[v25] = {
                nextTimeCursor = v24.responseBody.nextTimeCursor, 
                posts = v24.responseBody.posts, 
                previousTimeCursor = v24.responseBody.previousTimeCursor, 
                reactionsByPostId = if l_FFlagContentFeedEnableReactions_0 then v20(v24.responseBody.posts) else nil
            };
        end;
        return {
            byUserId = v2.Dictionary.join(v23.byUserId, v26)
        };
    end;
end;
local function v34(v31, v32) --[[ Line: 94 ]]
    -- upvalues: v2 (copy), l_FFlagContentFeedEnableReactions_0 (copy), v20 (copy)
    local v33 = tostring(v32.queryArgs.userId);
    return {
        byUserId = v2.Dictionary.join(v31.byUserId, {
            [v33] = {
                nextTimeCursor = v32.responseBody.nextTimeCursor, 
                posts = v32.responseBody.posts, 
                previousTimeCursor = v32.responseBody.previousTimeCursor, 
                reactionsByPostId = if l_FFlagContentFeedEnableReactions_0 then v20(v32.responseBody.posts) else nil
            }
        })
    };
end;
return function(v35) --[[ Line: 104 ]]
    -- upvalues: v3 (copy), v6 (copy), v34 (copy), v30 (copy)
    local l_ContentSharingNetworking_0 = v35.ContentSharingNetworking;
    return v3.createReducer(v6, {
        [l_ContentSharingNetworking_0.GetPostsByUserId.Succeeded.name] = v34, 
        [l_ContentSharingNetworking_0.GetPostsByPostId.Succeeded.name] = v34, 
        [l_ContentSharingNetworking_0.GetPostsByCursor.Succeeded.name] = v30
    });
end;