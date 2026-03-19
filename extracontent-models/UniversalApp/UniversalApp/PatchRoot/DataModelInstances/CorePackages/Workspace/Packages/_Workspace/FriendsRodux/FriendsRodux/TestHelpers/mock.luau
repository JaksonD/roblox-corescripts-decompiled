local l_Parent_0 = script:FindFirstAncestor("FriendsRodux").Parent;
local v1 = require(l_Parent_0.Rodux);
local v5 = v1.makeActionCreator("GET_FRIENDS_SUCCEEDED_ACTION", function(v2, v3, v4) --[[ Line: 8 ]]
    return {
        responseBody = {
            data = v3
        }, 
        namedIds = {
            users = v2
        }, 
        queryArgs = {
            userSort = v4
        }
    };
end);
local v8 = v1.makeActionCreator("GET_FRIENDS_COUNT_SUCCEEDED_ACTION", function(v6, v7) --[[ Line: 20 ]]
    return {
        responseBody = {
            count = v7
        }, 
        namedIds = {
            users = v6
        }
    };
end);
local v10 = v1.makeActionCreator("GET_REQUEST_COUNT", function(v9) --[[ Line: 29 ]]
    return {
        responseBody = {
            count = v9
        }
    };
end);
local v12 = v1.makeActionCreator("GET_NEW_FRIEND_REQUEST_COUNT", function(v11) --[[ Line: 38 ]]
    return {
        responseBody = {
            count = v11
        }
    };
end);
local v14 = v1.makeActionCreator("GET_NEW_FRIEND_REQUEST_COUNT", function(v13) --[[ Line: 47 ]]
    return {
        responseBody = {
            status = v13
        }
    };
end);
local v16 = v1.makeActionCreator("UNFRIEND_TARGET_USER_ID", function(v15) --[[ Line: 56 ]]
    return {
        namedIds = {
            users = v15.targetUserId
        }, 
        additionalData = {
            currentUserId = v15.currentUserId
        }
    };
end);
local v18 = v1.makeActionCreator("ACCEPT_REQUEST_FROM_USER_ID", function(v17) --[[ Line: 66 ]]
    return {
        ids = v17.ids, 
        additionalData = {
            currentUserId = v17.currentUserId
        }
    };
end);
local v20 = v1.makeActionCreator("REQUEST_FRIENDSHIP_FROM_USER_ID", function(v19) --[[ Line: 75 ]]
    return {
        namedIds = {
            users = v19.users
        }, 
        additionalData = {
            currentUserId = v19.currentUserId
        }
    };
end);
local v22 = v1.makeActionCreator("REQUEST_FRIENDSHIP_FROM_CONTACT_ID", function(v21) --[[ Line: 85 ]]
    return {
        namedIds = {
            contacts = v21.contacts
        }, 
        additionalData = {
            currentUserId = v21.currentUserId
        }
    };
end);
local v24 = v1.makeActionCreator("DECLINE_REQUEST_FROM_USER_ID", function(v23) --[[ Line: 96 ]]
    return {
        ids = v23.ids
    };
end);
local v26 = v1.makeActionCreator("GET_FRIEND_REQUESTS", function(v25) --[[ Line: 104 ]]
    return {
        responseBody = v25 and v25.data or {
            previousPageCursor = nil, 
            nextPageCursor = "637699238608300000-46587081730_1_986dd841c63787446d580a8055b3fa73", 
            data = {
                {
                    friendRequest = {
                        sentAt = "2021-10-22T23:20:18.163Z", 
                        senderId = 123, 
                        sourceUniverseId = nil, 
                        contactName = "Name", 
                        senderNickname = "nickname"
                    }, 
                    mutualFriendsList = nil, 
                    description = "me dan robux :) gracias", 
                    created = "2021-01-19T02:01:21.997Z", 
                    isBanned = false, 
                    externalAppDisplayName = nil, 
                    id = 123, 
                    name = "TestUser_1", 
                    displayName = "TestUser_1"
                }, 
                {
                    friendRequest = {
                        sentAt = "2021-10-22T23:20:18.163Z", 
                        senderId = 456, 
                        sourceUniverseId = 2092410051, 
                        contactName = nil, 
                        senderNickname = nil, 
                        originSourceType = "qrCode"
                    }, 
                    mutualFriendsList = {
                        123, 
                        345
                    }, 
                    description = "me dan robux :) gracias", 
                    created = "2021-01-19T02:01:21.997Z", 
                    isBanned = false, 
                    externalAppDisplayName = nil, 
                    id = 456, 
                    name = "TestUser_2", 
                    displayName = "TestUser_2"
                }
            }
        }, 
        additionalData = {
            currentUserId = v25 and v25.currentUserId or nil
        }
    };
end);
local v28 = v1.makeActionCreator("DECLINE_ALL_FRIEND_REQUESTS", function(v27) --[[ Line: 152 ]]
    return {
        ids = v27.ids
    };
end);
local v31 = v1.makeActionCreator("GET_FRIEND_RECOMMENDATIONS_FROM_USER_ID", function(v29, v30) --[[ Line: 161 ]]
    return {
        responseBody = {
            data = v30 or {
                {
                    friendRequest = nil, 
                    rank = 2, 
                    mutualFriendsList = {
                        "1", 
                        "2"
                    }, 
                    description = "string", 
                    created = "2022-02-25T21:22:29.217Z", 
                    isBanned = true, 
                    externalAppDisplayName = "string", 
                    id = 89, 
                    name = "red", 
                    displayName = "coolDisplayName"
                }, 
                {
                    friendRequest = nil, 
                    rank = 4, 
                    mutualFriendsList = {}, 
                    description = "string", 
                    created = "2022-02-25T21:22:29.217Z", 
                    isBanned = true, 
                    externalAppDisplayName = "string", 
                    id = 19, 
                    name = "reputation", 
                    contextType = "MutualFriends", 
                    displayName = "anotherCoolName"
                }, 
                {
                    rank = 3, 
                    mutualFriendsList = {}, 
                    description = "string", 
                    created = "2022-02-25T21:22:29.217Z", 
                    isBanned = true, 
                    externalAppDisplayName = "string", 
                    id = 25, 
                    name = "reputation", 
                    contextType = "MutualFriends", 
                    displayName = "anotherCoolName", 
                    friendRequest = {
                        sentAt = "2021-10-22T23:20:18.163Z", 
                        senderId = 123, 
                        sourceUniverseId = nil, 
                        contactName = nil
                    }
                }, 
                {
                    rank = 1, 
                    mutualFriendsList = {}, 
                    description = "string", 
                    created = "2022-02-25T21:22:29.217Z", 
                    isBanned = true, 
                    externalAppDisplayName = "string", 
                    id = 0, 
                    contactId = "contactId", 
                    thumbnailEntities = {
                        avatarImageUrl = "avatarImageUrl", 
                        headshotImageUrl = "headshotImageUrl"
                    }, 
                    name = "reputation", 
                    contextType = "Contacts", 
                    displayName = "Contact Name"
                }
            }
        }, 
        namedIds = {
            users = v29 or 678
        }
    };
end);
local v33 = v1.makeActionCreator("GET_FRIENDSHIP_STATUS", function(_) --[[ Line: 236 ]]
    return {
        responseBody = {
            data = {
                {
                    id = 123, 
                    status = "NotFriends"
                }, 
                {
                    id = 355, 
                    status = "Friends"
                }
            }
        }
    };
end);
local v35 = v1.makeActionCreator("GET_FRIENDSHIP_STATUSES", function(_) --[[ Line: 254 ]]
    return {
        responseBody = {
            data = {
                {
                    id = 123, 
                    status = "NotFriends"
                }, 
                {
                    id = 355, 
                    status = "Friends"
                }
            }
        }
    };
end);
local v38 = v1.makeActionCreator("GET_EXTENDED_FRIENDSHIP_STATUS", function(v36, v37) --[[ Line: 274 ]]
    return {
        responseBody = v37, 
        ids = {
            v36
        }
    };
end);
local v41 = v1.makeActionCreator("BLOCK_USER_BY_ID", function(v39, v40) --[[ Line: 283 ]]
    return {
        responseBody = v40, 
        namedIds = {
            users = v39.userId
        }, 
        additionalData = {
            currentUserId = v39.currentUserId
        }
    };
end);
local v44 = v1.makeActionCreator("GET_FOLLOWING_EXISTS", function(_, _) --[[ Line: 292 ]]
    return {
        responseBody = {
            followings = {
                {
                    userId = 123, 
                    isFollowing = true, 
                    isFollowed = true
                }, 
                {
                    userId = 355, 
                    isFollowing = false, 
                    isFollowed = true
                }
            }
        }
    };
end);
local v45 = {
    GetFriendshipStatus = {
        Succeeded = {
            name = "GET_FRIENDSHIP_STATUS"
        }
    }, 
    GetFriendshipStatuses = {
        Succeeded = {
            name = "GET_FRIENDSHIP_STATUSES"
        }
    }, 
    GetFriendsFromUserId = {
        Succeeded = {
            name = "GET_FRIENDS_SUCCEEDED_ACTION"
        }
    }, 
    GetFriendsCountFromUserId = {
        Succeeded = {
            name = "GET_FRIENDS_COUNT_SUCCEEDED_ACTION"
        }
    }, 
    UnfriendTargetUserId = {
        Succeeded = {
            name = "UNFRIEND_TARGET_USER_ID"
        }
    }, 
    GetFriendRequestsCount = {
        Succeeded = {
            name = "GET_REQUEST_COUNT"
        }
    }, 
    GetNewFriendRequestsCount = {
        Succeeded = {
            name = "GET_NEW_FRIEND_REQUEST_COUNT"
        }
    }, 
    ClearNewFriendRequests = {
        Succeeded = {
            name = "CLEAR_NEW_FRIEND_REQUEST_COUNT"
        }
    }, 
    AcceptFriendRequestFromUserId = {
        Succeeded = {
            name = "ACCEPT_REQUEST_FROM_USER_ID"
        }
    }, 
    DeclineFriendRequestFromUserId = {
        Succeeded = {
            name = "DECLINE_REQUEST_FROM_USER_ID"
        }
    }, 
    GetFriendRequests = {
        Succeeded = {
            name = "GET_FRIEND_REQUESTS"
        }
    }, 
    DeclineAllFriendRequests = {
        Succeeded = {
            name = "DECLINE_ALL_FRIEND_REQUESTS"
        }
    }, 
    GetFriendRecommendationsFromUserId = {
        Succeeded = {
            name = "GET_FRIEND_RECOMMENDATIONS_FROM_USER_ID"
        }
    }, 
    RequestFriendshipFromUserId = {
        Succeeded = {
            name = "REQUEST_FRIENDSHIP_FROM_USER_ID"
        }
    }, 
    RequestFriendshipFromContactId = {
        Succeeded = {
            name = "REQUEST_FRIENDSHIP_FROM_CONTACT_ID"
        }
    }, 
    GetExtendedFriendshipStatus = {
        Succeeded = {
            name = "GET_EXTENDED_FRIENDSHIP_STATUS"
        }
    }, 
    GetFollowingExists = {
        Succeeded = {
            name = "GET_FOLLOWING_EXISTS"
        }
    }
};
local v46 = {
    BlockUserById = {
        Succeeded = {
            name = "BLOCK_USER_BY_ID"
        }
    }
};
local v47 = {
    BlockUserById = {
        Succeeded = {
            name = "BLOCK_USER_BY_ID"
        }
    }
};
return {
    mockGetFriendsFromUserId = "GET_FRIENDS_SUCCEEDED_ACTION", 
    mockGetFriendsFromUserIdAction = v5, 
    mockGetFriendsCountFromUserId = "GET_FRIENDS_COUNT_SUCCEEDED_ACTION", 
    mockGetFriendsCountFromUserIdAction = v8, 
    mockRequestCount = "GET_REQUEST_COUNT", 
    mockRequestCountAction = v10, 
    mockGetNewRequestsCount = "GET_NEW_FRIEND_REQUEST_COUNT", 
    mockNewFriendRequestsCountAction = v12, 
    mockClearNewFriendRequests = "CLEAR_NEW_FRIEND_REQUEST_COUNT", 
    mockClearNewFriendRequestsAction = v14, 
    mockUnfriendTargetUserId = "UNFRIEND_TARGET_USER_ID", 
    mockUnfriendTargetUserIdAction = v16, 
    mockAcceptFriendRequestFromUserId = "ACCEPT_REQUEST_FROM_USER_ID", 
    mockAcceptFriendRequestFromUserIdAction = v18, 
    mockRequestFriendshipFromUserId = "REQUEST_FRIENDSHIP_FROM_USER_ID", 
    mockRequestFriendshipFromUserIdAction = v20, 
    mockRequestFriendshipFromContactId = "REQUEST_FRIENDSHIP_FROM_CONTACT_ID", 
    mockRequestFriendshipFromContactIdAction = v22, 
    mockDeclineFriendRequestFromUserId = "DECLINE_REQUEST_FROM_USER_ID", 
    mockDeclineFriendRequestFromUserIdAction = v24, 
    mockGetFriendRequests = "GET_FRIEND_REQUESTS", 
    mockGetFriendRequestsAction = v26, 
    mockDeclineAllFriendRequests = "DECLINE_ALL_FRIEND_REQUESTS", 
    mockDeclineAllFriendRequestsAction = v28, 
    mockGetFriendRecommendationsFromUserId = "GET_FRIEND_RECOMMENDATIONS_FROM_USER_ID", 
    mockGetFriendRecommendationsFromUserIdAction = v31, 
    mockGetFriendshipStatus = "GET_FRIENDSHIP_STATUS", 
    mockGetFriendshipStatusAction = v33, 
    mockGetFriendshipStatuses = "GET_FRIENDSHIP_STATUSES", 
    mockGetFriendshipStatusesAction = v35, 
    mockGetUserExtendedFriendshipStatus = "GET_EXTENDED_FRIENDSHIP_STATUS", 
    mockGetUserExtendedFriendshipStatusAction = v38, 
    mockGetFollowingExists = "GET_FOLLOWING_EXISTS", 
    mockGetFollowingExistsAction = v44, 
    mockBlockUserById = "BLOCK_USER_BY_ID", 
    mockBlockUserByIdAction = v41, 
    friendsNetworkingMock = v45, 
    networkingBlockingMock = v46, 
    userBlockingNetworkingMock = v47
};