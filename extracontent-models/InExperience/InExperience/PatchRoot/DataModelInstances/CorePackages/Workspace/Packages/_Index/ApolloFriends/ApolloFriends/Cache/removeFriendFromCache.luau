return function(v0, v1) --[[ Line: 6 ]] --[[ Name: removeFriendFromCache ]]
    local v2 = v0.cache:identify({
        __typename = "Friend", 
        id = v1.userId, 
        targetUserId = v1.targetUserId
    });
    v0.cache:evict({
        id = v2
    });
    v0.cache:gc();
end;