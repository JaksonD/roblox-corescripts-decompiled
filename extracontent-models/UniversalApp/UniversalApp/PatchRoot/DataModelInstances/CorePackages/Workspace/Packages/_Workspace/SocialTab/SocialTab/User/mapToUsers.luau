local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_llama_0 = v1.llama;
local l_t_0 = v1.t;
local l_RoduxPresence_0 = v1.RoduxPresence;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v1.getStandardSizeAvatarHeadShotRbxthumb;
return function(v6, _) --[[ Line: 8 ]]
    -- upvalues: l_t_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_llama_0 (copy), l_RoduxPresence_0 (copy)
    return function(v8) --[[ Line: 9 ]]
        -- upvalues: l_t_0 (ref), v6 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (ref), l_llama_0 (ref), l_RoduxPresence_0 (ref)
        assert(l_t_0.string(v8));
        if v6.SocialTab.Users.byUserId[v8] then
            local v9 = l_getStandardSizeAvatarHeadShotRbxthumb_0(v8);
            return l_llama_0.Dictionary.join(v6.SocialTab.Users.byUserId[v8], l_RoduxPresence_0.Selectors.getUserPresenceByUserId(v6, v8), {
                thumbnail = v9, 
                isPremium = v6.SocialTab.PremiumByUserId[v8] or false, 
                hasVerifiedBadge = if v6.VerifiedBadges and v6.VerifiedBadges.VerifiedUsers then v6.VerifiedBadges.VerifiedUsers[v8] or false else nil
            });
        else
            return nil;
        end;
    end;
end;