return function(v0) --[[ Line: 1 ]]
    return {
        profile = v0.fromString("www:users/{userId}/profile?friendshipSourceType={sourceType|}"), 
        group = v0.fromString("www:communities/{groupId}/{groupName|}#!/about"), 
        forumComment = v0.fromString("www:communities/{groupId}#!/forums/{categoryId}/post/{postId}/comment/{commentId}"), 
        friends = v0.fromString("www:users/{userId}/friends"), 
        inventory = v0.fromString("www:users/{userId}/inventory"), 
        search = v0.fromString("www:search/users?{keyword}"), 
        profileWithFriendshipSourceType = v0.fromString("www:users/{userId}/profile?friendshipSourceType={sourceType}"), 
        followers = v0.fromString("www:users/{userId}/friends#!/followers"), 
        following = v0.fromString("www:users/{userId}/friends#!/following"), 
        report = function(v1) --[[ Line: 15 ]] --[[ Name: report ]]
            -- upvalues: v0 (copy)
            return v0.fromString("www:abusereport/embedded/chat?id={userId}&{actionName}&{conversationId}&{redirecturl}")({
                userId = v1.userId, 
                conversationId = v1.conversationId, 
                actionName = "chat", 
                redirecturl = v0.fromString("www:home")()
            });
        end, 
        appsflyer = function(v2) --[[ Line: 28 ]] --[[ Name: appsflyer ]]
            -- upvalues: v0 (copy)
            local v3 = v0.fromString("mobilenav:profile?userId={userId}&friendshipSourceType={sourceType}")(v2);
            local v4 = v0.fromString("www:users/{userId}/profile?friendshipSourceType={sourceType}")(v2);
            return v0.fromString("appsflyer:Ebh5?pid=share&is_retargeting=true&af_dp={mobileUrl}&af_web_dp={webUrl}")({
                mobileUrl = v3, 
                webUrl = v4
            });
        end
    };
end;