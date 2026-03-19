local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.API_URL);
return function(v2) --[[ Line: 17 ]]
    -- upvalues: v1 (copy)
    return v2.roduxNetworking.POST({
        Name = "SetSocialLinks"
    }, function(v3, v4) --[[ Line: 20 ]]
        -- upvalues: v1 (ref)
        return v3(v1):path("v1"):path("promotion-channels"):body({
            promotionChannelsVisibilityPrivacy = v4.promotionChannelsVisibilityPrivacy, 
            facebook = v4.facebook, 
            twitter = v4.twitter, 
            youtube = v4.youtube, 
            twitch = v4.twitch, 
            guilded = v4.guilded
        });
    end);
end;