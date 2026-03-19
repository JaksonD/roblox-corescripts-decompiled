local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameDetailRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local v3 = require(l_script_FirstAncestor_0.GameDetails.getZendeskUrl);
local v4 = {
    new = function() --[[ Line: 52 ]] --[[ Name: new ]]
        return {};
    end
};
v4.mock = function(v5, v6, v7) --[[ Line: 58 ]] --[[ Name: mock ]]
    -- upvalues: v4 (copy), l_DateTime_0 (copy)
    local v8 = v4.new();
    local v9 = l_DateTime_0.new();
    local v10 = l_DateTime_0.fromUnixTimestamp(v9:GetUnixTimestamp() + 60);
    v8.id = v5;
    v8.rootPlaceId = "370731277";
    v8.name = v6;
    v8.description = "This is MeepCity";
    v8.creator = {
        id = 123247, 
        name = "alexnewtron", 
        type = "User", 
        isRNVAccount = false, 
        hasVerifiedBadge = false
    };
    v8.price = nil;
    v8.isExperimental = false;
    v8.allowedGearGenres = {
        "TownAndCity"
    };
    v8.allowedGearCategories = {};
    v8.playing = 49252;
    v8.visits = 2358954901;
    v8.maxPlayers = v7 or 110;
    v8.created = v9:GetIsoDate();
    v8.updated = v10:GetIsoDate();
    v8.studioAccessToApisAllowed = true;
    v8.universeAvatarType = "MorphToR15";
    v8.genre = "Town and City";
    v8.genre_l1 = "Test Genre";
    v8.genre_l2 = "Test Subgenre";
    return v8;
end;
v4.fromJsonData = function(v11) --[[ Line: 92 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v4 (copy), v3 (copy)
    local v12 = v4.new();
    v12.id = tostring(v11.id);
    v12.rootPlaceId = tostring(v11.rootPlaceId);
    v12.name = v11.name;
    v12.description = v11.description;
    v12.creator = {
        id = v11.creator.id, 
        name = v11.creator.name, 
        type = v11.creator.type, 
        isRNVAccount = v11.creator.isRNVAccount, 
        hasVerifiedBadge = v11.creator.hasVerifiedBadge
    };
    v12.price = v11.price;
    v12.isExperimental = v11.isExperimental;
    v12.allowedGearGenres = v11.allowedGearGenres;
    v12.allowedGearCategories = v11.allowedGearCategories;
    v12.playing = v11.playing;
    v12.visits = v11.visits;
    v12.maxPlayers = v11.maxPlayers;
    v12.created = v11.created;
    v12.updated = v11.updated;
    v12.studioAccessToApisAllowed = v11.studioAccessToApisAllowed;
    v12.universeAvatarType = v11.universeAvatarType;
    v12.genre = v11.genre;
    v12.genre_l1 = v11.genre_l1;
    v12.genre_l2 = v11.genre_l2;
    v12.licenseDescription = v11.licenseDescription;
    v12.localizedFiatPrice = v11.localizedFiatPrice;
    v12.refundLink = v11.refundLink;
    if v11.refundPolicy then
        v12.refundPolicy = {
            policyText = v11.refundPolicy.policyText, 
            learnMoreUrl = v3(v11.refundPolicy.learnMoreBaseUrl, v11.refundPolicy.locale, v11.refundPolicy.articleId)
        };
    end;
    return v12;
end;
return v4;