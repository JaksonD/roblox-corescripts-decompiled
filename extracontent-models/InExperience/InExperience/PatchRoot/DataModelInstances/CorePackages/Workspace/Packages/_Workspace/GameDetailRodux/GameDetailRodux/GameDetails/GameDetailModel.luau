local l_Parent_0 = script:FindFirstAncestor("GameDetailRodux").Parent;
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local l_getZendeskUrl_0 = require(l_Parent_0.DiscoveryUtils).getZendeskUrl;
local v3 = {
    new = function() --[[ Line: 52 ]] --[[ Name: new ]]
        return {};
    end
};
v3.mock = function(v4, v5, v6) --[[ Line: 58 ]] --[[ Name: mock ]]
    -- upvalues: v3 (copy), l_DateTime_0 (copy)
    local v7 = v3.new();
    local v8 = l_DateTime_0.new();
    local v9 = l_DateTime_0.fromUnixTimestamp(v8:GetUnixTimestamp() + 60);
    v7.id = v4;
    v7.rootPlaceId = "370731277";
    v7.name = v5;
    v7.description = "This is MeepCity";
    v7.creator = {
        id = 123247, 
        name = "alexnewtron", 
        type = "User", 
        isRNVAccount = false, 
        hasVerifiedBadge = false
    };
    v7.price = nil;
    v7.isExperimental = false;
    v7.allowedGearGenres = {
        "TownAndCity"
    };
    v7.allowedGearCategories = {};
    v7.playing = 49252;
    v7.visits = 2358954901;
    v7.maxPlayers = v6 or 110;
    v7.created = v8:GetIsoDate();
    v7.updated = v9:GetIsoDate();
    v7.studioAccessToApisAllowed = true;
    v7.universeAvatarType = "MorphToR15";
    v7.genre = "Town and City";
    v7.genre_l1 = "Test Genre";
    v7.genre_l2 = "Test Subgenre";
    return v7;
end;
v3.fromJsonData = function(v10) --[[ Line: 92 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v3 (copy), l_getZendeskUrl_0 (copy)
    local v11 = v3.new();
    v11.id = tostring(v10.id);
    v11.rootPlaceId = tostring(v10.rootPlaceId);
    v11.name = v10.name;
    v11.description = v10.description;
    v11.creator = {
        id = v10.creator.id, 
        name = v10.creator.name, 
        type = v10.creator.type, 
        isRNVAccount = v10.creator.isRNVAccount, 
        hasVerifiedBadge = v10.creator.hasVerifiedBadge
    };
    v11.price = v10.price;
    v11.isExperimental = v10.isExperimental;
    v11.allowedGearGenres = v10.allowedGearGenres;
    v11.allowedGearCategories = v10.allowedGearCategories;
    v11.playing = v10.playing;
    v11.visits = v10.visits;
    v11.maxPlayers = v10.maxPlayers;
    v11.created = v10.created;
    v11.updated = v10.updated;
    v11.studioAccessToApisAllowed = v10.studioAccessToApisAllowed;
    v11.universeAvatarType = v10.universeAvatarType;
    v11.genre = v10.genre;
    v11.genre_l1 = v10.genre_l1;
    v11.genre_l2 = v10.genre_l2;
    v11.licenseDescription = v10.licenseDescription;
    v11.localizedFiatPrice = v10.localizedFiatPrice;
    v11.refundLink = v10.refundLink;
    if v10.refundPolicy then
        v11.refundPolicy = {
            policyText = v10.refundPolicy.policyText, 
            learnMoreUrl = l_getZendeskUrl_0(v10.refundPolicy.learnMoreBaseUrl, v10.refundPolicy.locale, v10.refundPolicy.articleId)
        };
    end;
    return v11;
end;
return v3;