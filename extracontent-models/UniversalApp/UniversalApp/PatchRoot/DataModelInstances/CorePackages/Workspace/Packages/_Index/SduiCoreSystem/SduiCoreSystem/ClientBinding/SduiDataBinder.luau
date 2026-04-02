local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.ServiceContractsProto);
local v3 = require(l_Parent_0.DataHydration);
local _ = require(l_Parent_0.Signals);
local v5 = require(l_Parent_0.Display);
local v6 = require(l_Parent_0.Responsive);
local l_SduiDataBindingResponsiveFieldName_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBindingFieldNames).SduiDataBindingResponsiveFieldName;
local v8 = require(l_script_FirstAncestor_0.ClientBinding.tryGetPathFromData);
local v9 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBindingContentType);
local v10 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBinderTransformUtils);
local v11 = require(l_Parent_0.SharedFlags);
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = v11.FFlagLuaAppSduiBadgeDetailsComponents;
local l_FFlagSduiAppPolicyBindings_0 = v11.FFlagSduiAppPolicyBindings;
local l_FFlagSduiExperienceDetailsSupport_0 = v11.FFlagSduiExperienceDetailsSupport;
local l_FFlagSduiEventDetailsSupport_0 = v11.FFlagSduiEventDetailsSupport;
local v16 = require(l_script_FirstAncestor_0.ClientBinding.getSduiPolicyStore);
local v17 = require(l_script_FirstAncestor_0.ClientBinding.resolveSduiPolicyField);
local l_protobufTimestampToLocalTimeString_0 = v10.protobufTimestampToLocalTimeString;
local function _(v19) --[[ Line: 39 ]] --[[ Name: updateBadgesInfoStore ]]
    -- upvalues: v3 (copy)
    v3.Badges.getBadgeInfoStore(false).updateBadges(v19);
end;
local function _(v21) --[[ Line: 43 ]] --[[ Name: updateCreatorInfoStore ]]
    -- upvalues: v3 (copy)
    v3.Creator.getCreatorInfoStore(false).updateCreatorInfos(v21);
end;
local function _(v23) --[[ Line: 47 ]] --[[ Name: updateGameInfos ]]
    -- upvalues: v3 (copy)
    v3.Game.getGameInfoStore(false).updateGameInfos(v23);
end;
local function _(v25) --[[ Line: 51 ]] --[[ Name: updateAgeRecommendations ]]
    -- upvalues: v3 (copy)
    v3.Game.getAgeRecommendationStore(false).updateAgeRecommendations(v25);
end;
local function _(v27) --[[ Line: 55 ]] --[[ Name: updateSocialLinkInfos ]]
    -- upvalues: v3 (copy)
    v3.SocialLink.getSocialLinkInfoStore(false).updateSocialLinkInfos(v27);
end;
local function _(v29) --[[ Line: 59 ]] --[[ Name: updateMediaAssetStore ]]
    -- upvalues: v3 (copy)
    v3.MediaAsset.getMediaAssetStore(false).updateMediaAssets(v29);
end;
local function _(v31) --[[ Line: 63 ]] --[[ Name: updateExperienceEventInfoStore ]]
    -- upvalues: v3 (copy)
    v3.ExperienceEvents.getExperienceEventInfoStore(false).updateExperienceEventInfos(v31);
end;
local function v39(v33, v34, _) --[[ Line: 75 ]] --[[ Name: calculateBadgeDerivedField ]]
    -- upvalues: l_protobufTimestampToLocalTimeString_0 (copy)
    if v33 == "created_time_formatted" then
        local v36 = v34 and (v34.created_time or v34.createdTime);
        return v36 and l_protobufTimestampToLocalTimeString_0(v36);
    elseif v33 == "updated_time_formatted" then
        local v37 = v34 and (v34.updated_time or v34.updatedTime);
        return v37 and l_protobufTimestampToLocalTimeString_0(v37);
    elseif v33 == "awarded_time_formatted" then
        local v38 = v34 and (v34.awarded_time or v34.awardedTime);
        return v38 and l_protobufTimestampToLocalTimeString_0(v38);
    else
        return nil;
    end;
end;
local function v47(v40, v41, _) --[[ Line: 98 ]] --[[ Name: calculateUniverseDerivedField ]]
    -- upvalues: v3 (copy)
    if v40 == "rating_text_formatted_brief" then
        local v43 = tonumber(v41.totalUpVotes) or 0;
        local v44 = tonumber(v41.totalDownVotes) or 0;
        local v45 = v3.Game.VotesUtils.calculateRating(v43, v44);
        local v46 = {
            upVotes = v43, 
            downVotes = v44, 
            rating = v45
        };
        return v3.Game.VotesUtils.getRatingDisplayText(v46);
    else
        return nil;
    end;
end;
local function v52(v48, v49, _) --[[ Line: 121 ]] --[[ Name: calculateAgeRecommendationDerivedField ]]
    -- upvalues: v3 (copy)
    if v48 == "content_rating_image" then
        local v51 = v49 and v49.igrsRating;
        return v51 and v3.Game.AgeRecommendationUtils.getIgrsImage(v51);
    else
        return nil;
    end;
end;
local function v57(v53, _, v55, _) --[[ Line: 134 ]] --[[ Name: getDataObjectSignal ]]
    -- upvalues: v3 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy), l_FFlagSduiEventDetailsSupport_0 (copy)
    if v53 == "badge" then
        return v3.Badges.getBadgeInfoStore(false).getBadgeInfo((tostring(v55)));
    else
        if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
            if v53 == "creator" then
                return v3.Creator.getCreatorInfoStore(false).getCreatorInfo(v55);
            elseif v53 == "universe" then
                return v3.Game.getGameInfoStore(false).getGameInfo(v55);
            end;
        end;
        if l_FFlagSduiExperienceDetailsSupport_0 then
            if v53 == "ageRecommendation" then
                return v3.Game.getAgeRecommendationStore(false).getAgeRecommendation(v55);
            elseif v53 == "socialLink" then
                return v3.SocialLink.getSocialLinkInfoStore(false).getSocialLinkInfo(v55);
            elseif v53 == "mediaAsset" then
                return v3.MediaAsset.getMediaAssetStore(false).getMediaAsset(v55);
            end;
        end;
        if (l_FFlagSduiEventDetailsSupport_0 or l_FFlagSduiExperienceDetailsSupport_0) and v53 == "event" then
            return v3.ExperienceEvents.getExperienceEventInfoStore(false).getExperienceEventInfo(v55);
        else
            return nil;
        end;
    end;
end;
local v58 = {
    responsive = true, 
    policy = l_FFlagSduiAppPolicyBindings_0 and true or nil
};
local function v60(v59) --[[ Line: 176 ]] --[[ Name: isClientContentType ]]
    -- upvalues: v58 (copy)
    return v58[v59] or false;
end;
local function v76(v61, v62, v63) --[[ Line: 180 ]] --[[ Name: getFieldValueForClientContentType ]]
    -- upvalues: v9 (copy), l_SduiDataBindingResponsiveFieldName_0 (copy), v5 (copy), v6 (copy), l_FFlagSduiAppPolicyBindings_0 (copy), v16 (copy), v17 (copy), v8 (copy)
    if v61 == v9.responsive then
        if #v62 ~= 2 then
            return nil;
        else
            local v64 = v62[2];
            if v64 == l_SduiDataBindingResponsiveFieldName_0.screenWidth then
                return v5.GetDisplayStore(v63).getViewportSize(v63).X;
            elseif v64 == l_SduiDataBindingResponsiveFieldName_0.screenHeight then
                return v5.GetDisplayStore(v63).getViewportSize(v63).Y;
            elseif v64 == l_SduiDataBindingResponsiveFieldName_0.isPortrait then
                local v65 = v5.GetDisplayStore(v63).getViewportSize(v63);
                return v65.X < v65.Y;
            elseif v64 == l_SduiDataBindingResponsiveFieldName_0.isSpatial then
                return v5.GetDisplayStore(v63).getIsSpatial(v63);
            elseif v64 == l_SduiDataBindingResponsiveFieldName_0.lastInput then
                return v6.GetInputModeStore(v63).getLastInputType(v63);
            elseif v64 == l_SduiDataBindingResponsiveFieldName_0.preferredInput then
                return v6.GetInputModeStore(v63).getPreferredInputType(v63);
            end;
        end;
    end;
    if l_FFlagSduiAppPolicyBindings_0 and v61 == v9.policy then
        if #v62 < 2 then
            return nil;
        else
            local v66 = v16().getAppPolicy(v63);
            if v66 == nil then
                local v67 = table.concat(v62, ".");
                error((("Failed to find policy table when binding value %*"):format(v67)));
            end;
            local v68 = v62[2];
            local v69, v70 = v17(v66, v68);
            if v69 then
                return v70;
            else
                local v71 = v66.getRawPolicy();
                if v71 then
                    local v72, v73 = v8(v71, v62, 2);
                    if v72 then
                        return v73;
                    else
                        local v74 = table.concat(v62, ".");
                        error((("Failed to find policy value for '%*'"):format(v74)));
                    end;
                else
                    local v75 = table.concat(v62, ".");
                    error((("Failed to find rawPolicy table when binding value %*"):format(v75)));
                end;
            end;
        end;
    end;
    return nil;
end;
local function _(v77, v78, v79, v80) --[[ Line: 242 ]] --[[ Name: calculateDerivedFieldValue ]]
    -- upvalues: v39 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy), v47 (copy), v3 (copy)
    if v77 == "badge" then
        return (v39(v78, v79, v80));
    else
        if l_FFlagSduiExperienceDetailsSupport_0 then
            if v77 == "universe" then
                return v47(v78, v79, v80);
            elseif v77 == "ageRecommendation" then
                local v81;
                if v78 == "content_rating_image" then
                    local v82 = v79 and v79.igrsRating;
                    v81 = v82;
                    if v81 then
                        return (v3.Game.AgeRecommendationUtils.getIgrsImage(v82));
                    end;
                else
                    v81 = nil;
                end;
                return v81;
            end;
        end;
        return nil;
    end;
end;
local function v99(v84, v85, v86, v87, v88) --[[ Line: 273 ]] --[[ Name: getDataHydrationField ]]
    -- upvalues: v57 (copy), v8 (copy), v39 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy), v47 (copy), v3 (copy)
    local v89 = false;
    if #v85 < 2 then
        return nil, nil;
    else
        local v90 = v57(v84, v85, v86, v88);
        if not v90 then
            local v91 = table.concat(v85, ".");
            error((("No available data object for %* %* for id: %*"):format(v84, v91, v86)));
        end;
        local v92 = v90.data(v87);
        local v93 = v90.status(v87);
        if not v92 then
            return nil, v93;
        else
            local v94, v95 = v8(v92, v85, 2);
            if v94 then
                return v95, v93;
            elseif #v85 == 2 then
                local v96 = v85[2];
                local v97;
                if v84 == "badge" then
                    v97 = v39(v96, v92, v87);
                else
                    if l_FFlagSduiExperienceDetailsSupport_0 then
                        if v84 == "universe" then
                            v97 = v47(v96, v92, v87);
                            v89 = true;
                        elseif v84 == "ageRecommendation" then
                            if v96 == "content_rating_image" then
                                local v98 = v92 and v92.igrsRating;
                                v97 = v98 and v3.Game.AgeRecommendationUtils.getIgrsImage(v98);
                                v89 = true;
                            else
                                v97 = nil;
                                v89 = true;
                            end;
                        end;
                    end;
                    if not v89 then
                        if not v89 then
                            if not v89 then
                                v97 = nil;
                            end;
                        end;
                    end;
                end;
                v89 = false;
                return v97, v93;
            else
                return nil, v93;
            end;
        end;
    end;
end;
local v100 = {
    badge = v99, 
    creator = v99, 
    universe = v99, 
    ageRecommendation = if l_FFlagSduiExperienceDetailsSupport_0 then v99 else nil, 
    mediaAsset = if l_FFlagSduiExperienceDetailsSupport_0 then v99 else nil, 
    socialLink = if l_FFlagSduiExperienceDetailsSupport_0 then v99 else nil, 
    event = if not not l_FFlagSduiExperienceDetailsSupport_0 or l_FFlagSduiEventDetailsSupport_0 then v99 else nil
};
return {
    updateDataStores = function(v101) --[[ Line: 354 ]] --[[ Name: updateDataStores ]]
        -- upvalues: v3 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy), l_FFlagSduiEventDetailsSupport_0 (copy)
        if v101.badge then
            local l_badge_0 = v101.badge;
            v3.Badges.getBadgeInfoStore(false).updateBadges(l_badge_0);
        end;
        if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
            if v101.creator then
                local l_creator_0 = v101.creator;
                v3.Creator.getCreatorInfoStore(false).updateCreatorInfos(l_creator_0);
            end;
            if v101.universe then
                local l_universe_0 = v101.universe;
                v3.Game.getGameInfoStore(false).updateGameInfos(l_universe_0);
            end;
        end;
        if l_FFlagSduiExperienceDetailsSupport_0 then
            if v101.ageRecommendation then
                local l_ageRecommendation_0 = v101.ageRecommendation;
                v3.Game.getAgeRecommendationStore(false).updateAgeRecommendations(l_ageRecommendation_0);
            end;
            if v101.socialLink then
                local l_socialLink_0 = v101.socialLink;
                v3.SocialLink.getSocialLinkInfoStore(false).updateSocialLinkInfos(l_socialLink_0);
            end;
            if v101.mediaAsset then
                local l_mediaAsset_0 = v101.mediaAsset;
                v3.MediaAsset.getMediaAssetStore(false).updateMediaAssets(l_mediaAsset_0);
            end;
        end;
        if (l_FFlagSduiExperienceDetailsSupport_0 or l_FFlagSduiEventDetailsSupport_0) and v101.event then
            local l_event_0 = v101.event;
            v3.ExperienceEvents.getExperienceEventInfoStore(false).updateExperienceEventInfos(l_event_0);
        end;
    end, 
    getDataObjectSignal = v57, 
    getFieldValue = function(v109, v110, v111, v112, v113) --[[ Line: 331 ]] --[[ Name: getFieldValue ]]
        -- upvalues: v100 (copy)
        if #v110 < 2 then
            return nil, nil;
        else
            local v114 = v100[v109];
            if v114 == nil then
                return nil, nil;
            else
                return v114(v109, v110, v111, v112, v113);
            end;
        end;
    end, 
    calculateBadgeDerivedField = v39, 
    calculateUniverseDerivedField = v47, 
    isClientContentType = v60, 
    getFieldValueForClientContentType = v76, 
    calculateAgeRecommendationDerivedField = v52
};