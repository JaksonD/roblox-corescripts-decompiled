local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Result);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v4 = require(l_Modules_0.LuaApp.Flags.GetFFlagShowCreatorNameOnEmphasisSearchTileIXP);
local l_FFlagLuaAppEnableCustomSpawnSearch_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableCustomSpawnSearch;
local v6 = {
    new = function() --[[ Line: 27 ]] --[[ Name: new ]]
        return {};
    end
};
v6.mock = function(v7, v8) --[[ Line: 33 ]] --[[ Name: mock ]]
    -- upvalues: v6 (copy), l_FFlagLuaAppEnableCustomSpawnSearch_0 (copy)
    local v9 = v6.new();
    v9.name = "test name";
    v9.universeId = v7 or "149757";
    v9.placeId = v8 or "384314";
    v9.isSponsored = false;
    v9.isShowSponsoredLabel = v9.isSponsored;
    v9.adId = nil;
    v9.playerCount = 150;
    v9.creatorName = "test name";
    v9.creatorHasVerifiedBadge = false;
    v9.topicId = "test_topic";
    v9.placeIdOverride = l_FFlagLuaAppEnableCustomSpawnSearch_0 and "123" or nil;
    v9.launchDataOverride = l_FFlagLuaAppEnableCustomSpawnSearch_0 and "test" or nil;
    return v9;
end;
v6.fromJsonData = function(v10, v11) --[[ Line: 50 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v2 (copy), v6 (copy), v4 (copy), l_FFlagLuaAppEnableCustomSpawnSearch_0 (copy)
    if v11 and type(v10.universeId) ~= "number" and type(v10.universeId) ~= "string" then
        return v2.error("GameSearchEntry.fromJsonData expects universeId to be a number or a string for game contents");
    elseif v11 and type(v10.placeId) ~= "number" and type(v10.placeId) ~= "string" then
        return v2.error("GameSearchEntry.fromJsonData expects placeId to be a number or a string for game contents");
    else
        local v12 = v6.new();
        v12.name = v10.name;
        v12.topicId = v10.topicId;
        if v11 then
            v12.universeId = tostring(v10.universeId);
            v12.placeId = tostring(v10.placeId);
            v12.isSponsored = v10.isSponsored;
            v12.isShowSponsoredLabel = nil;
            if v10.isShowSponsoredLabel == nil then
                v12.isShowSponsoredLabel = true;
            else
                v12.isShowSponsoredLabel = v10.isShowSponsoredLabel;
            end;
            v12.adId = v10.nativeAdData;
            v12.playerCount = v10.playerCount;
            if v4() then
                v12.creatorName = v10.creatorName;
                v12.creatorHasVerifiedBadge = v10.creatorHasVerifiedBadge;
            end;
            if l_FFlagLuaAppEnableCustomSpawnSearch_0 then
                local l_contentMetadata_0 = v10.contentMetadata;
                if l_contentMetadata_0 then
                    v12.placeIdOverride = if l_contentMetadata_0.PlaceIdOverride then tostring(l_contentMetadata_0.PlaceIdOverride) else nil;
                    v12.launchDataOverride = l_contentMetadata_0.LaunchDataOverride;
                end;
            end;
        end;
        return v2.success(v12);
    end;
end;
return v6;