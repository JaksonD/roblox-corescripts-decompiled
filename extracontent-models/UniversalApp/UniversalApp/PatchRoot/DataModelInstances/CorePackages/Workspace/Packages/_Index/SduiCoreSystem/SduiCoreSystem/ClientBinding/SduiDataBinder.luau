local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.ServiceContractsProto);
local v4 = require(l_Parent_0.DataHydration);
local _ = require(l_Parent_0.Signals);
local v6 = require(l_Parent_0.Display);
local v7 = require(l_Parent_0.Responsive);
local l_SduiDataBindingResponsiveFieldName_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBindingFieldNames).SduiDataBindingResponsiveFieldName;
local v9 = require(l_script_FirstAncestor_0.ClientBinding.tryGetPathFromData);
local v10 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBindingContentType);
local v11 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBinderTransformUtils);
local l_getZendeskUrl_0 = require(l_Parent_0.DiscoveryUtils).getZendeskUrl;
local v13 = require(l_Parent_0.SharedFlags);
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = v13.FFlagLuaAppSduiBadgeDetailsComponents;
local l_FFlagSduiAppPolicyBindings_0 = v13.FFlagSduiAppPolicyBindings;
local l_FFlagSduiExperienceDetailsSupport_0 = v13.FFlagSduiExperienceDetailsSupport;
local l_FFlagSduiEventDetailsSupport_0 = v13.FFlagSduiEventDetailsSupport;
local l_FFlagSduiMarketplaceCatalogCategorySupport_0 = v13.FFlagSduiMarketplaceCatalogCategorySupport;
local l_FFlagSduiMarketplaceCatalogSortSupport_0 = v13.FFlagSduiMarketplaceCatalogSortSupport;
local l_FFlagSduiAddMarketplaceEntityDataHydration_0 = v13.FFlagSduiAddMarketplaceEntityDataHydration;
local l_FFlagSduiSongHydrationSupport_0 = v13.FFlagSduiSongHydrationSupport;
local v22 = require(l_script_FirstAncestor_0.ClientBinding.getSduiPolicyStore);
local v23 = require(l_script_FirstAncestor_0.ClientBinding.resolveSduiPolicyField);
local l_protobufTimestampToLocalTimeString_0 = v11.protobufTimestampToLocalTimeString;
local function _(v25) --[[ Line: 50 ]] --[[ Name: updateBadgesInfoStore ]]
    -- upvalues: v4 (copy)
    v4.Badges.getBadgeInfoStore(false).updateBadges(v25);
end;
local function _(v27) --[[ Line: 54 ]] --[[ Name: updateCreatorInfoStore ]]
    -- upvalues: v4 (copy)
    v4.Creator.getCreatorInfoStore(false).updateCreatorInfos(v27);
end;
local function _(v29) --[[ Line: 58 ]] --[[ Name: updateGameInfos ]]
    -- upvalues: v4 (copy)
    v4.Game.getGameInfoStore(false).updateGameInfos(v29);
end;
local function _(v31) --[[ Line: 62 ]] --[[ Name: updateAgeRecommendations ]]
    -- upvalues: v4 (copy)
    v4.Game.getAgeRecommendationStore(false).updateAgeRecommendations(v31);
end;
local function _(v33) --[[ Line: 66 ]] --[[ Name: updateSocialLinkInfos ]]
    -- upvalues: v4 (copy)
    v4.SocialLink.getSocialLinkInfoStore(false).updateSocialLinkInfos(v33);
end;
local function _(v35) --[[ Line: 70 ]] --[[ Name: updateMediaAssetStore ]]
    -- upvalues: v4 (copy)
    v4.MediaAsset.getMediaAssetStore(false).updateMediaAssets(v35);
end;
local function _(v37) --[[ Line: 74 ]] --[[ Name: updateExperienceEventInfoStore ]]
    -- upvalues: v4 (copy)
    v4.ExperienceEvents.getExperienceEventInfoStore(false).updateExperienceEventInfos(v37);
end;
local function _(v39) --[[ Line: 78 ]] --[[ Name: updateMarketplaceCatalogCategoryStore ]]
    -- upvalues: v4 (copy)
    v4.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).updateMarketplaceCatalogCategories(v39);
end;
local function _(v41) --[[ Line: 84 ]] --[[ Name: updateMarketplaceCatalogSortStore ]]
    -- upvalues: v4 (copy)
    v4.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).updateMarketplaceCatalogSorts(v41);
end;
local function _(v43) --[[ Line: 88 ]] --[[ Name: updateMarketplaceAssetInfoStore ]]
    -- upvalues: v4 (copy)
    v4.MarketplaceAsset.getMarketplaceAssetStore(false).updateMarketplaceAssetInfos(v43);
end;
local function _(v45) --[[ Line: 92 ]] --[[ Name: updateMarketplaceBundleInfoStore ]]
    -- upvalues: v4 (copy)
    v4.MarketplaceBundle.getMarketplaceBundleStore(false).updateMarketplaceBundleInfos(v45);
end;
local function _(v47) --[[ Line: 96 ]] --[[ Name: updateMarketplaceLookInfoStore ]]
    -- upvalues: v4 (copy)
    v4.MarketplaceLook.getMarketplaceLookStore(false).updateMarketplaceLookInfos(v47);
end;
local function _(v49) --[[ Line: 100 ]] --[[ Name: updateGamePassStore ]]
    -- upvalues: v4 (copy)
    v4.Game.getGamePassStore(false).updateGamePassInfos(v49);
end;
local function v57(v51, v52, _) --[[ Line: 112 ]] --[[ Name: calculateBadgeDerivedField ]]
    -- upvalues: l_protobufTimestampToLocalTimeString_0 (copy)
    if v51 == "created_time_formatted" then
        local v54 = v52 and (v52.created_time or v52.createdTime);
        return v54 and l_protobufTimestampToLocalTimeString_0(v54);
    elseif v51 == "updated_time_formatted" then
        local v55 = v52 and (v52.updated_time or v52.updatedTime);
        return v55 and l_protobufTimestampToLocalTimeString_0(v55);
    elseif v51 == "awarded_time_formatted" then
        local v56 = v52 and (v52.awarded_time or v52.awardedTime);
        return v56 and l_protobufTimestampToLocalTimeString_0(v56);
    else
        return nil;
    end;
end;
local function v66(v58, v59, _) --[[ Line: 135 ]] --[[ Name: calculateUniverseDerivedField ]]
    -- upvalues: v4 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy), l_LocalizationService_0 (copy), l_getZendeskUrl_0 (copy)
    if v58 == "rating_text_formatted_brief" then
        local v61 = tonumber(v59.totalUpVotes) or 0;
        local v62 = tonumber(v59.totalDownVotes) or 0;
        local v63 = v4.Game.VotesUtils.calculateRating(v61, v62);
        local v64 = {
            upVotes = v61, 
            downVotes = v62, 
            rating = v63
        };
        return v4.Game.VotesUtils.getRatingDisplayText(v64);
    elseif l_FFlagSduiExperienceDetailsSupport_0 and v58 == "refund_policy_learn_more_url" then
        local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
        return l_getZendeskUrl_0(nil, l_RobloxLocaleId_0, v59 and v59.refund_article_id);
    else
        return nil;
    end;
end;
local function v71(v67, v68, _) --[[ Line: 164 ]] --[[ Name: calculateAgeRecommendationDerivedField ]]
    -- upvalues: v4 (copy)
    if v67 == "content_rating_image" then
        local v70 = v68 and v68.igrsRating;
        return v70 and v4.Game.AgeRecommendationUtils.getIgrsImage(v70);
    else
        return nil;
    end;
end;
local function v76(v72, _, v74, _) --[[ Line: 177 ]] --[[ Name: getDataObjectSignal ]]
    -- upvalues: v4 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy), l_FFlagSduiEventDetailsSupport_0 (copy), l_FFlagSduiMarketplaceCatalogCategorySupport_0 (copy), l_FFlagSduiMarketplaceCatalogSortSupport_0 (copy), l_FFlagSduiSongHydrationSupport_0 (copy), l_FFlagSduiAddMarketplaceEntityDataHydration_0 (copy)
    if v72 == "badge" then
        return v4.Badges.getBadgeInfoStore(false).getBadgeInfo((tostring(v74)));
    else
        if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
            if v72 == "creator" then
                return v4.Creator.getCreatorInfoStore(false).getCreatorInfo(v74);
            elseif v72 == "universe" then
                return v4.Game.getGameInfoStore(false).getGameInfo(v74);
            end;
        end;
        if l_FFlagSduiExperienceDetailsSupport_0 then
            if v72 == "ageRecommendation" then
                return v4.Game.getAgeRecommendationStore(false).getAgeRecommendation(v74);
            elseif v72 == "socialLink" then
                return v4.SocialLink.getSocialLinkInfoStore(false).getSocialLinkInfo(v74);
            elseif v72 == "mediaAsset" then
                return v4.MediaAsset.getMediaAssetStore(false).getMediaAsset(v74);
            elseif v72 == "gamePass" then
                return v4.Game.getGamePassStore(false).getGamePassInfo((tostring(v74)));
            end;
        end;
        if (l_FFlagSduiEventDetailsSupport_0 or l_FFlagSduiExperienceDetailsSupport_0) and v72 == "event" then
            return v4.ExperienceEvents.getExperienceEventInfoStore(false).getExperienceEventInfo(v74);
        elseif l_FFlagSduiMarketplaceCatalogCategorySupport_0 and v72 == "marketplaceCatalogCategory" then
            return v4.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).getMarketplaceCatalogCategory(v74);
        elseif l_FFlagSduiMarketplaceCatalogSortSupport_0 and v72 == "marketplaceCatalogSort" then
            return v4.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).getMarketplaceCatalogSort(v74);
        elseif l_FFlagSduiSongHydrationSupport_0 and v72 == "song" then
            return v4.Song.getSongInfoStore(false).getSongInfo((tostring(v74)));
        else
            if l_FFlagSduiAddMarketplaceEntityDataHydration_0 then
                if v72 == "marketplaceAsset" then
                    return v4.MarketplaceAsset.getMarketplaceAssetStore(false).getMarketplaceAssetInfo(v74);
                elseif v72 == "marketplaceBundle" then
                    return v4.MarketplaceBundle.getMarketplaceBundleStore(false).getMarketplaceBundleInfo(v74);
                elseif v72 == "marketplaceLook" then
                    return v4.MarketplaceLook.getMarketplaceLookStore(false).getMarketplaceLookInfo(v74);
                end;
            end;
            return nil;
        end;
    end;
end;
local v77 = {
    responsive = true, 
    policy = l_FFlagSduiAppPolicyBindings_0 and true or nil
};
local function v79(v78) --[[ Line: 244 ]] --[[ Name: isClientContentType ]]
    -- upvalues: v77 (copy)
    return v77[v78] or false;
end;
local function v95(v80, v81, v82) --[[ Line: 248 ]] --[[ Name: getFieldValueForClientContentType ]]
    -- upvalues: v10 (copy), l_SduiDataBindingResponsiveFieldName_0 (copy), v6 (copy), v7 (copy), l_FFlagSduiAppPolicyBindings_0 (copy), v22 (copy), v23 (copy), v9 (copy)
    if v80 == v10.responsive then
        if #v81 ~= 2 then
            return nil;
        else
            local v83 = v81[2];
            if v83 == l_SduiDataBindingResponsiveFieldName_0.screenWidth then
                return v6.GetDisplayStore(v82).getViewportSize(v82).X;
            elseif v83 == l_SduiDataBindingResponsiveFieldName_0.screenHeight then
                return v6.GetDisplayStore(v82).getViewportSize(v82).Y;
            elseif v83 == l_SduiDataBindingResponsiveFieldName_0.isPortrait then
                local v84 = v6.GetDisplayStore(v82).getViewportSize(v82);
                return v84.X < v84.Y;
            elseif v83 == l_SduiDataBindingResponsiveFieldName_0.isSpatial then
                return v6.GetDisplayStore(v82).getIsSpatial(v82);
            elseif v83 == l_SduiDataBindingResponsiveFieldName_0.lastInput then
                return v7.GetInputModeStore(v82).getLastInputType(v82);
            elseif v83 == l_SduiDataBindingResponsiveFieldName_0.preferredInput then
                return v7.GetInputModeStore(v82).getPreferredInputType(v82);
            end;
        end;
    end;
    if l_FFlagSduiAppPolicyBindings_0 and v80 == v10.policy then
        if #v81 < 2 then
            return nil;
        else
            local v85 = v22().getAppPolicy(v82);
            if v85 == nil then
                local v86 = table.concat(v81, ".");
                error((("Failed to find policy table when binding value %*"):format(v86)));
            end;
            local v87 = v81[2];
            local v88, v89 = v23(v85, v87);
            if v88 then
                return v89;
            else
                local v90 = v85.getRawPolicy();
                if v90 then
                    local v91, v92 = v9(v90, v81, 2);
                    if v91 then
                        return v92;
                    else
                        local v93 = table.concat(v81, ".");
                        error((("Failed to find policy value for '%*'"):format(v93)));
                    end;
                else
                    local v94 = table.concat(v81, ".");
                    error((("Failed to find rawPolicy table when binding value %*"):format(v94)));
                end;
            end;
        end;
    end;
    return nil;
end;
local function _(v96, v97, v98, v99) --[[ Line: 310 ]] --[[ Name: calculateDerivedFieldValue ]]
    -- upvalues: v57 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy), v66 (copy), v4 (copy)
    if v96 == "badge" then
        return (v57(v97, v98, v99));
    else
        if l_FFlagSduiExperienceDetailsSupport_0 then
            if v96 == "universe" then
                return v66(v97, v98, v99);
            elseif v96 == "ageRecommendation" then
                local v100;
                if v97 == "content_rating_image" then
                    local v101 = v98 and v98.igrsRating;
                    v100 = v101;
                    if v100 then
                        return (v4.Game.AgeRecommendationUtils.getIgrsImage(v101));
                    end;
                else
                    v100 = nil;
                end;
                return v100;
            end;
        end;
        return nil;
    end;
end;
local function v118(v103, v104, v105, v106, v107) --[[ Line: 341 ]] --[[ Name: getDataHydrationField ]]
    -- upvalues: v76 (copy), v9 (copy), v57 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy), v66 (copy), v4 (copy)
    local v108 = false;
    if #v104 < 2 then
        return nil, nil;
    else
        local v109 = v76(v103, v104, v105, v107);
        if not v109 then
            local v110 = table.concat(v104, ".");
            error((("No available data object for %* %* for id: %*"):format(v103, v110, v105)));
        end;
        local v111 = v109.data(v106);
        local v112 = v109.status(v106);
        if not v111 then
            return nil, v112;
        else
            local v113, v114 = v9(v111, v104, 2);
            if v113 then
                return v114, v112;
            elseif #v104 == 2 then
                local v115 = v104[2];
                local v116;
                if v103 == "badge" then
                    v116 = v57(v115, v111, v106);
                else
                    if l_FFlagSduiExperienceDetailsSupport_0 then
                        if v103 == "universe" then
                            v116 = v66(v115, v111, v106);
                            v108 = true;
                        elseif v103 == "ageRecommendation" then
                            if v115 == "content_rating_image" then
                                local v117 = v111 and v111.igrsRating;
                                v116 = v117 and v4.Game.AgeRecommendationUtils.getIgrsImage(v117);
                                v108 = true;
                            else
                                v116 = nil;
                                v108 = true;
                            end;
                        end;
                    end;
                    if not v108 then
                        if not v108 then
                            if not v108 then
                                v116 = nil;
                            end;
                        end;
                    end;
                end;
                v108 = false;
                return v116, v112;
            else
                return nil, v112;
            end;
        end;
    end;
end;
local v119 = {
    badge = v118, 
    creator = v118, 
    universe = v118, 
    ageRecommendation = if l_FFlagSduiExperienceDetailsSupport_0 then v118 else nil, 
    mediaAsset = if l_FFlagSduiExperienceDetailsSupport_0 then v118 else nil, 
    socialLink = if l_FFlagSduiExperienceDetailsSupport_0 then v118 else nil, 
    event = if not not l_FFlagSduiExperienceDetailsSupport_0 or l_FFlagSduiEventDetailsSupport_0 then v118 else nil, 
    marketplaceCatalogCategory = if l_FFlagSduiMarketplaceCatalogCategorySupport_0 then v118 else nil, 
    marketplaceCatalogSort = if l_FFlagSduiMarketplaceCatalogSortSupport_0 then v118 else nil, 
    marketplaceAsset = if l_FFlagSduiAddMarketplaceEntityDataHydration_0 then v118 else nil, 
    marketplaceBundle = if l_FFlagSduiAddMarketplaceEntityDataHydration_0 then v118 else nil, 
    marketplaceLook = if l_FFlagSduiAddMarketplaceEntityDataHydration_0 then v118 else nil, 
    song = if l_FFlagSduiSongHydrationSupport_0 then v118 else nil, 
    gamePass = if l_FFlagSduiExperienceDetailsSupport_0 then v118 else nil
};
return {
    updateDataStores = function(v120) --[[ Line: 431 ]] --[[ Name: updateDataStores ]]
        -- upvalues: v4 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy), l_FFlagSduiEventDetailsSupport_0 (copy), l_FFlagSduiMarketplaceCatalogCategorySupport_0 (copy), l_FFlagSduiMarketplaceCatalogSortSupport_0 (copy), l_FFlagSduiSongHydrationSupport_0 (copy), l_FFlagSduiAddMarketplaceEntityDataHydration_0 (copy)
        if v120.badge then
            local l_badge_0 = v120.badge;
            v4.Badges.getBadgeInfoStore(false).updateBadges(l_badge_0);
        end;
        if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
            if v120.creator then
                local l_creator_0 = v120.creator;
                v4.Creator.getCreatorInfoStore(false).updateCreatorInfos(l_creator_0);
            end;
            if v120.universe then
                local l_universe_0 = v120.universe;
                v4.Game.getGameInfoStore(false).updateGameInfos(l_universe_0);
            end;
        end;
        if l_FFlagSduiExperienceDetailsSupport_0 then
            if v120.ageRecommendation then
                local l_ageRecommendation_0 = v120.ageRecommendation;
                v4.Game.getAgeRecommendationStore(false).updateAgeRecommendations(l_ageRecommendation_0);
            end;
            if v120.socialLink then
                local l_socialLink_0 = v120.socialLink;
                v4.SocialLink.getSocialLinkInfoStore(false).updateSocialLinkInfos(l_socialLink_0);
            end;
            if v120.mediaAsset then
                local l_mediaAsset_0 = v120.mediaAsset;
                v4.MediaAsset.getMediaAssetStore(false).updateMediaAssets(l_mediaAsset_0);
            end;
            if v120.gamePass then
                local l_gamePass_0 = v120.gamePass;
                v4.Game.getGamePassStore(false).updateGamePassInfos(l_gamePass_0);
            end;
        end;
        if (l_FFlagSduiExperienceDetailsSupport_0 or l_FFlagSduiEventDetailsSupport_0) and v120.event then
            local l_event_0 = v120.event;
            v4.ExperienceEvents.getExperienceEventInfoStore(false).updateExperienceEventInfos(l_event_0);
        end;
        if l_FFlagSduiMarketplaceCatalogCategorySupport_0 and v120.marketplaceCatalogCategory then
            local l_marketplaceCatalogCategory_0 = v120.marketplaceCatalogCategory;
            v4.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).updateMarketplaceCatalogCategories(l_marketplaceCatalogCategory_0);
        end;
        if l_FFlagSduiMarketplaceCatalogSortSupport_0 and v120.catalogSort then
            local l_catalogSort_0 = v120.catalogSort;
            v4.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).updateMarketplaceCatalogSorts(l_catalogSort_0);
        end;
        if l_FFlagSduiSongHydrationSupport_0 and v120.song then
            v4.Song.getSongInfoStore(false).updateSongs(v120.song);
        end;
        if l_FFlagSduiAddMarketplaceEntityDataHydration_0 then
            if v120.marketplaceAsset then
                local l_marketplaceAsset_0 = v120.marketplaceAsset;
                v4.MarketplaceAsset.getMarketplaceAssetStore(false).updateMarketplaceAssetInfos(l_marketplaceAsset_0);
            end;
            if v120.marketplaceBundle then
                local l_marketplaceBundle_0 = v120.marketplaceBundle;
                v4.MarketplaceBundle.getMarketplaceBundleStore(false).updateMarketplaceBundleInfos(l_marketplaceBundle_0);
            end;
            if v120.marketplaceLook then
                local l_marketplaceLook_0 = v120.marketplaceLook;
                v4.MarketplaceLook.getMarketplaceLookStore(false).updateMarketplaceLookInfos(l_marketplaceLook_0);
            end;
        end;
    end, 
    getDataObjectSignal = v76, 
    getFieldValue = function(v134, v135, v136, v137, v138) --[[ Line: 408 ]] --[[ Name: getFieldValue ]]
        -- upvalues: v119 (copy)
        if #v135 < 2 then
            return nil, nil;
        else
            local v139 = v119[v134];
            if v139 == nil then
                return nil, nil;
            else
                return v139(v134, v135, v136, v137, v138);
            end;
        end;
    end, 
    calculateBadgeDerivedField = v57, 
    calculateUniverseDerivedField = v66, 
    isClientContentType = v79, 
    getFieldValueForClientContentType = v95, 
    calculateAgeRecommendationDerivedField = v71
};