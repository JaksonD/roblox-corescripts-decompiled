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
local v15 = require(l_script_FirstAncestor_0.ClientBinding.getSduiPolicyStore);
local v16 = require(l_script_FirstAncestor_0.ClientBinding.resolveSduiPolicyField);
local l_protobufTimestampToLocalTimeString_0 = v10.protobufTimestampToLocalTimeString;
local function _(v18) --[[ Line: 36 ]] --[[ Name: updateBadgesInfoStore ]]
    -- upvalues: v3 (copy)
    v3.Badges.getBadgeInfoStore(false).updateBadges(v18);
end;
local function _(v20) --[[ Line: 40 ]] --[[ Name: updateCreatorInfoStore ]]
    -- upvalues: v3 (copy)
    v3.Creator.getCreatorInfoStore(false).updateCreatorInfos(v20);
end;
local function _(v22) --[[ Line: 44 ]] --[[ Name: updateGameInfos ]]
    -- upvalues: v3 (copy)
    v3.Game.getGameInfoStore(false).updateGameInfos(v22);
end;
local function _(v24) --[[ Line: 48 ]] --[[ Name: updateAgeRecommendations ]]
    -- upvalues: v3 (copy)
    v3.Game.getAgeRecommendationStore(false).updateAgeRecommendations(v24);
end;
local function _(v26) --[[ Line: 52 ]] --[[ Name: updateSocialLinkInfos ]]
    -- upvalues: v3 (copy)
    v3.SocialLink.getSocialLinkInfoStore(false).updateSocialLinkInfos(v26);
end;
local function v34(v28, v29, _) --[[ Line: 64 ]] --[[ Name: calculateBadgeDerivedField ]]
    -- upvalues: l_protobufTimestampToLocalTimeString_0 (copy)
    if v28 == "created_time_formatted" then
        local v31 = v29 and (v29.created_time or v29.createdTime);
        return v31 and l_protobufTimestampToLocalTimeString_0(v31);
    elseif v28 == "updated_time_formatted" then
        local v32 = v29 and (v29.updated_time or v29.updatedTime);
        return v32 and l_protobufTimestampToLocalTimeString_0(v32);
    elseif v28 == "awarded_time_formatted" then
        local v33 = v29 and (v29.awarded_time or v29.awardedTime);
        return v33 and l_protobufTimestampToLocalTimeString_0(v33);
    else
        return nil;
    end;
end;
local function v42(v35, v36, _) --[[ Line: 87 ]] --[[ Name: calculateUniverseDerivedField ]]
    -- upvalues: v3 (copy)
    if v35 == "rating_text_formatted_brief" then
        local v38 = tonumber(v36.totalUpVotes) or 0;
        local v39 = tonumber(v36.totalDownVotes) or 0;
        local v40 = v3.Game.VotesUtils.calculateRating(v38, v39);
        local v41 = {
            upVotes = v38, 
            downVotes = v39, 
            rating = v40
        };
        return v3.Game.VotesUtils.getRatingDisplayText(v41);
    else
        return nil;
    end;
end;
local function v47(v43, v44, _) --[[ Line: 110 ]] --[[ Name: calculateAgeRecommendationDerivedField ]]
    -- upvalues: v3 (copy)
    if v43 == "content_rating_image" then
        local v46 = v44 and v44.igrsRating;
        return v46 and v3.Game.AgeRecommendationUtils.getIgrsImage(v46);
    else
        return nil;
    end;
end;
local function v52(v48, _, v50, _) --[[ Line: 123 ]] --[[ Name: getDataObjectSignal ]]
    -- upvalues: v3 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy)
    if v48 == "badge" then
        return v3.Badges.getBadgeInfoStore(false).getBadgeInfo((tostring(v50)));
    else
        if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
            if v48 == "creator" then
                return v3.Creator.getCreatorInfoStore(false).getCreatorInfo(v50);
            elseif v48 == "universe" then
                return v3.Game.getGameInfoStore(false).getGameInfo(v50);
            end;
        end;
        if l_FFlagSduiExperienceDetailsSupport_0 then
            if v48 == "ageRecommendation" then
                return v3.Game.getAgeRecommendationStore(false).getAgeRecommendation(v50);
            elseif v48 == "socialLink" then
                return v3.SocialLink.getSocialLinkInfoStore(false).getSocialLinkInfo(v50);
            end;
        end;
        return nil;
    end;
end;
local v53 = {
    responsive = true, 
    policy = l_FFlagSduiAppPolicyBindings_0 and true or nil
};
local function v55(v54) --[[ Line: 159 ]] --[[ Name: isClientContentType ]]
    -- upvalues: v53 (copy)
    return v53[v54] or false;
end;
local function v71(v56, v57, v58) --[[ Line: 163 ]] --[[ Name: getFieldValueForClientContentType ]]
    -- upvalues: v9 (copy), l_SduiDataBindingResponsiveFieldName_0 (copy), v5 (copy), v6 (copy), l_FFlagSduiAppPolicyBindings_0 (copy), v15 (copy), v16 (copy), v8 (copy)
    if v56 == v9.responsive then
        if #v57 ~= 2 then
            return nil;
        else
            local v59 = v57[2];
            if v59 == l_SduiDataBindingResponsiveFieldName_0.screenWidth then
                return v5.GetDisplayStore(v58).getViewportSize(v58).X;
            elseif v59 == l_SduiDataBindingResponsiveFieldName_0.screenHeight then
                return v5.GetDisplayStore(v58).getViewportSize(v58).Y;
            elseif v59 == l_SduiDataBindingResponsiveFieldName_0.isPortrait then
                local v60 = v5.GetDisplayStore(v58).getViewportSize(v58);
                return v60.X < v60.Y;
            elseif v59 == l_SduiDataBindingResponsiveFieldName_0.isSpatial then
                return v5.GetDisplayStore(v58).getIsSpatial(v58);
            elseif v59 == l_SduiDataBindingResponsiveFieldName_0.lastInput then
                return v6.GetInputModeStore(v58).getLastInputType(v58);
            elseif v59 == l_SduiDataBindingResponsiveFieldName_0.preferredInput then
                return v6.GetInputModeStore(v58).getPreferredInputType(v58);
            end;
        end;
    end;
    if l_FFlagSduiAppPolicyBindings_0 and v56 == v9.policy then
        if #v57 < 2 then
            return nil;
        else
            local v61 = v15().getAppPolicy(v58);
            if v61 == nil then
                local v62 = table.concat(v57, ".");
                error((("Failed to find policy table when binding value %*"):format(v62)));
            end;
            local v63 = v57[2];
            local v64, v65 = v16(v61, v63);
            if v64 then
                return v65;
            else
                local v66 = v61.getRawPolicy();
                if v66 then
                    local v67, v68 = v8(v66, v57, 2);
                    if v67 then
                        return v68;
                    else
                        local v69 = table.concat(v57, ".");
                        error((("Failed to find policy value for '%*'"):format(v69)));
                    end;
                else
                    local v70 = table.concat(v57, ".");
                    error((("Failed to find rawPolicy table when binding value %*"):format(v70)));
                end;
            end;
        end;
    end;
    return nil;
end;
local function _(v72, v73, v74, v75) --[[ Line: 225 ]] --[[ Name: calculateDerivedFieldValue ]]
    -- upvalues: v34 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy), v42 (copy), v3 (copy)
    if v72 == "badge" then
        return (v34(v73, v74, v75));
    else
        if l_FFlagSduiExperienceDetailsSupport_0 then
            if v72 == "universe" then
                return v42(v73, v74, v75);
            elseif v72 == "ageRecommendation" then
                local v76;
                if v73 == "content_rating_image" then
                    local v77 = v74 and v74.igrsRating;
                    v76 = v77;
                    if v76 then
                        return (v3.Game.AgeRecommendationUtils.getIgrsImage(v77));
                    end;
                else
                    v76 = nil;
                end;
                return v76;
            end;
        end;
        return nil;
    end;
end;
local function v94(v79, v80, v81, v82, v83) --[[ Line: 256 ]] --[[ Name: getDataHydrationField ]]
    -- upvalues: v52 (copy), v8 (copy), v34 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy), v42 (copy), v3 (copy)
    local v84 = false;
    if #v80 < 2 then
        return nil, nil;
    else
        local v85 = v52(v79, v80, v81, v83);
        if not v85 then
            local v86 = table.concat(v80, ".");
            error((("No available data object for %* %* for id: %*"):format(v79, v86, v81)));
        end;
        local v87 = v85.data(v82);
        local v88 = v85.status(v82);
        if not v87 then
            return nil, v88;
        else
            local v89, v90 = v8(v87, v80, 2);
            if v89 then
                return v90, v88;
            elseif #v80 == 2 then
                local v91 = v80[2];
                local v92;
                if v79 == "badge" then
                    v92 = v34(v91, v87, v82);
                else
                    if l_FFlagSduiExperienceDetailsSupport_0 then
                        if v79 == "universe" then
                            v92 = v42(v91, v87, v82);
                            v84 = true;
                        elseif v79 == "ageRecommendation" then
                            if v91 == "content_rating_image" then
                                local v93 = v87 and v87.igrsRating;
                                v92 = v93 and v3.Game.AgeRecommendationUtils.getIgrsImage(v93);
                                v84 = true;
                            else
                                v92 = nil;
                                v84 = true;
                            end;
                        end;
                    end;
                    if not v84 then
                        if not v84 then
                            if not v84 then
                                v92 = nil;
                            end;
                        end;
                    end;
                end;
                v84 = false;
                return v92, v88;
            else
                return nil, v88;
            end;
        end;
    end;
end;
local v95 = {
    badge = v94, 
    creator = v94, 
    universe = v94, 
    ageRecommendation = if l_FFlagSduiExperienceDetailsSupport_0 then v94 else nil, 
    socialLink = if l_FFlagSduiExperienceDetailsSupport_0 then v94 else nil
};
return {
    updateDataStores = function(v96) --[[ Line: 333 ]] --[[ Name: updateDataStores ]]
        -- upvalues: v3 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy)
        if v96.badge then
            local l_badge_0 = v96.badge;
            v3.Badges.getBadgeInfoStore(false).updateBadges(l_badge_0);
        end;
        if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
            if v96.creator then
                local l_creator_0 = v96.creator;
                v3.Creator.getCreatorInfoStore(false).updateCreatorInfos(l_creator_0);
            end;
            if v96.universe then
                local l_universe_0 = v96.universe;
                v3.Game.getGameInfoStore(false).updateGameInfos(l_universe_0);
            end;
        end;
        if l_FFlagSduiExperienceDetailsSupport_0 and v96.ageRecommendation then
            local l_ageRecommendation_0 = v96.ageRecommendation;
            v3.Game.getAgeRecommendationStore(false).updateAgeRecommendations(l_ageRecommendation_0);
        end;
        if l_FFlagSduiExperienceDetailsSupport_0 and v96.socialLink then
            local l_socialLink_0 = v96.socialLink;
            v3.SocialLink.getSocialLinkInfoStore(false).updateSocialLinkInfos(l_socialLink_0);
        end;
    end, 
    getDataObjectSignal = v52, 
    getFieldValue = function(v102, v103, v104, v105, v106) --[[ Line: 310 ]] --[[ Name: getFieldValue ]]
        -- upvalues: v95 (copy)
        if #v103 < 2 then
            return nil, nil;
        else
            local v107 = v95[v102];
            if v107 == nil then
                return nil, nil;
            else
                return v107(v102, v103, v104, v105, v106);
            end;
        end;
    end, 
    calculateBadgeDerivedField = v34, 
    calculateUniverseDerivedField = v42, 
    isClientContentType = v55, 
    getFieldValueForClientContentType = v71, 
    calculateAgeRecommendationDerivedField = v47
};