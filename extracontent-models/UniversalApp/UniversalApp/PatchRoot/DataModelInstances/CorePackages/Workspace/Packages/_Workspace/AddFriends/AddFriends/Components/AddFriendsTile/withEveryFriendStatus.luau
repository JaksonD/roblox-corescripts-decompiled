local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = require(l_Parent_0.llama);
local l_FriendshipOriginSourceType_0 = require(l_Parent_0.FriendsNetworking).Enums.FriendshipOriginSourceType;
local v4 = require(l_Parent_0.AddFriendsState);
local l_RoduxFriends_0 = v4.RoduxFriends;
local l_RoduxUsers_0 = v4.RoduxUsers;
local l_PresenceType_0 = v4.RoduxPresence.Enums.PresenceType;
local l_RecommendationContextType_0 = l_RoduxFriends_0.Enums.RecommendationContextType;
local l_User_0 = l_RoduxUsers_0.Models.User;
local v10 = {
    ["36"] = Enum.FriendStatus.NotFriend, 
    ["37"] = Enum.FriendStatus.FriendRequestSent, 
    ["38"] = Enum.FriendStatus.FriendRequestReceived, 
    ["39"] = Enum.FriendStatus.Friend, 
    ["40"] = Enum.FriendStatus.FriendRequestReceived, 
    ["41"] = Enum.FriendStatus.FriendRequestReceived
};
local v11 = v1.Store.new(function() --[[ Line: 30 ]]
    -- upvalues: v10 (copy), l_FriendshipOriginSourceType_0 (copy)
    return {
        LocalUserId = "0", 
        FriendStatuses = v10, 
        ScreenSize = Vector2.new(500, 500), 
        AddFriends = {
            RequestsFromOriginSourceType = {
                ["41"] = l_FriendshipOriginSourceType_0.QrCode.rawValue()
            }, 
            IsUserFollowing = {
                ["36"] = {
                    isFollowing = false, 
                    isFollowed = false
                }, 
                ["37"] = {
                    isFollowing = false, 
                    isFollowed = true
                }, 
                ["38"] = {
                    isFollowing = true, 
                    isFollowed = false
                }, 
                ["39"] = {
                    isFollowing = true, 
                    isFollowed = true
                }, 
                ["40"] = {
                    isFollowing = false, 
                    isFollowed = false
                }, 
                ["41"] = {
                    isFollowing = false, 
                    isFollowed = false
                }
            }, 
            Friends = {
                requests = {
                    sourceUniverseIds = {
                        ["36"] = 0, 
                        ["37"] = 0, 
                        ["38"] = 0, 
                        ["39"] = 0, 
                        ["40"] = 1, 
                        ["41"] = 0
                    }, 
                    mutualFriends = {
                        ["36"] = {
                            1, 
                            2, 
                            4, 
                            4
                        }, 
                        ["37"] = {}, 
                        ["38"] = {}, 
                        ["39"] = {}, 
                        ["40"] = {}, 
                        ["41"] = {}
                    }
                }
            }, 
            Games = {
                byGameId = {
                    ["1"] = {
                        name = "someGameName"
                    }
                }
            }, 
            NetworkStatus = {}
        }
    };
end, {}, {
    v1.thunkMiddleware
});
local function v15(v12, v13) --[[ Line: 97 ]]
    -- upvalues: v2 (copy), v10 (copy), l_User_0 (copy)
    local v14 = v2.Dictionary.flip(v10)[v12];
    return v2.Dictionary.join(l_User_0.mock({
        id = v14
    }), v13);
end;
local v16 = {
    tileProps = {
        sentFromExperienceName = "TestSentFrom", 
        amIFollowingUser = true, 
        isUserFollowingMe = true
    }, 
    userProps = {
        mutualFriends = {
            {}, 
            {}, 
            {}
        }, 
        userPresenceType = l_PresenceType_0.InGame, 
        lastLocation = "TestLastLocation"
    }
};
return {
    localUserId = "0", 
    friendWithContextInfo = {
        FriendWithFullContextInfo = v2.Dictionary.joinDeep(v16, {
            userProps = {
                username = "FriendRequestReceived", 
                displayName = "WithFullContextInfo"
            }
        }), 
        FriendWithMutualFriends = {
            tileProps = {}, 
            userProps = {
                username = "FriendRequestReceived", 
                displayName = "WithMutualFriends", 
                mutualFriends = v16.userProps.mutualFriends
            }
        }, 
        Contact = {
            tileProps = {}, 
            userProps = {
                entityDisplayName = "entityDisplayName", 
                thumbnailEntities = {
                    avatarImageUrl = "avatarImageUrl"
                }, 
                contextType = l_RecommendationContextType_0.Contacts
            }
        }, 
        FriendWithSentFrom = {
            tileProps = {
                sentFromExperienceName = v16.tileProps.sentFromExperienceName
            }, 
            userProps = {
                username = "FriendRequestReceived", 
                displayName = "WithSentContext", 
                id = "40"
            }
        }, 
        FriendYouAreFollowing = {
            tileProps = {
                amIFollowingUser = v16.tileProps.amIFollowingUser
            }, 
            userProps = {
                username = "FriendRequestReceived", 
                displayName = "WithYouAreFollowing", 
                id = "38"
            }
        }, 
        FriendFollowingMe = {
            tileProps = {
                isUserFollowingMe = v16.tileProps.isUserFollowingMe
            }, 
            userProps = {
                username = "FriendRequestReceived", 
                displayName = "WithFollowingMe", 
                followers = {}, 
                id = "37"
            }
        }, 
        FriendViaQRCode = {
            tileProps = {
                originSourceType = l_FriendshipOriginSourceType_0.QrCode.rawValue()
            }, 
            userProps = {
                username = "FriendRequestReceived", 
                displayName = "WithQRCode", 
                id = "41"
            }
        }, 
        FriendNoFriend = {
            tileProps = {}, 
            userProps = {
                username = "NotFriend", 
                displayName = "Friend to add"
            }
        }, 
        FriendNoFriendWithNickname = {
            tileProps = {}, 
            userProps = {
                username = "NotFriend", 
                displayName = "Friend to add", 
                senderNickname = "SenderNickname"
            }
        }, 
        FriendPending = {
            tileProps = {}, 
            userProps = {
                username = "FriendRequestSent", 
                displayName = "Friend pending"
            }
        }
    }, 
    fullContextInfo = v16, 
    userForStatus = v15, 
    baseStore = v11
};