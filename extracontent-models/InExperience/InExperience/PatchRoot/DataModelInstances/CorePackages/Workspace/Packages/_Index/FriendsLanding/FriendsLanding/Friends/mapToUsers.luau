local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_llama_0 = v1.llama;
local l_t_0 = v1.t;
local l_RoduxPresence_0 = v1.RoduxPresence;
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v1.getRbxthumbWithTypeSizeAndOptions;
local l_UserLibConstants_0 = v1.UserLibConstants;
return function(v8) --[[ Line: 11 ]]
    -- upvalues: l_t_0 (copy), l_getDeepValue_0 (copy), l_llama_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_UserLibConstants_0 (copy), l_RoduxPresence_0 (copy)
    return function(v9) --[[ Line: 12 ]]
        -- upvalues: l_t_0 (ref), l_getDeepValue_0 (ref), v8 (copy), l_llama_0 (ref), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_UserLibConstants_0 (ref), l_RoduxPresence_0 (ref)
        assert(l_t_0.string(v9));
        local v10 = l_getDeepValue_0(v8, string.format("FriendsLanding.Friends.byUserId.%s", v9)) or {};
        local v11 = v8.FriendsLanding.DeletedUsers or nil;
        local l_VerifiedUsers_0 = v8.FriendsLanding.VerifiedUsers;
        return l_llama_0.Dictionary.map(v10, function(v13) --[[ Line: 18 ]]
            -- upvalues: v8 (ref), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_UserLibConstants_0 (ref), l_llama_0 (ref), l_getDeepValue_0 (ref), l_RoduxPresence_0 (ref), v11 (copy), l_VerifiedUsers_0 (copy)
            local v14 = nil;
            v14 = v8.isTest and "" or l_getRbxthumbWithTypeSizeAndOptions_0(v13, l_UserLibConstants_0.RbxthumbTypes.Avatar, 352);
            return l_llama_0.Dictionary.join(l_getDeepValue_0(v8, string.format("FriendsLanding.Users.byUserId.%s", v13)), l_RoduxPresence_0.Selectors.getUserPresenceByUserId(v8, v13), {
                thumbnail = v14
            }, {
                isDeleted = v11 and v11[v13]
            }, {
                hasVerifiedBadge = l_VerifiedUsers_0 and l_VerifiedUsers_0[v13]
            }, {
                isInactiveFriend = l_getDeepValue_0(v8, (("FriendsLanding.InactiveFriends.%*"):format(v13)))
            }, {
                friendRank = l_getDeepValue_0(v8, (("FriendsLanding.Friends.friendsRankByUserId.%*.%*"):format(v8.LocalUserId, v13)))
            });
        end);
    end;
end;