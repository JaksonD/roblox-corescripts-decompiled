local l_CorePackages_0 = game:GetService("CorePackages");
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local v3 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local l_ApiFetchGameDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local l_useGameProductInfoSelector_0 = require(l_CorePackages_0.Workspace.Packages.GameProductInfoRodux).useGameProductInfoSelector;
local l_GameMediaImageType_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).GameMediaImageType;
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local v9 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = v9.UiMode;
local v12 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux);
local l_GameIconReducer_0 = v12.GameIcons.GameIconReducer;
local l_useGameIconSelector_0 = v12.GameIcons.useGameIconSelector;
local l_BigGameIconReducer_0 = v12.BigGameIcons.BigGameIconReducer;
local l_useGameInfosSelector_0 = require(l_CorePackages_0.Workspace.Packages.GameInfosRodux).useGameInfosSelector;
local l_ApiFetchGameMedia_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Thunks.Games.ApiFetchGameMedia;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v19 = require(l_Modules_0.LuaApp.Thunks.ApiFetchExperienceDetailsPage);
local v20 = require(l_Modules_0.LuaApp.Flags.GetFFlagRemoveVerifiedBadgeReducer);
local v21 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppLaunchConnectorFix);
local v22 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableBigGameIconInDetailsPage);
local l_FFlagLuaAppEdpFixDefaultBanner_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpFixDefaultBanner;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local function _(v26) --[[ Line: 39 ]] --[[ Name: generateDefaultEntry ]]
    -- upvalues: l_GameMediaImageType_0 (copy), l_Url_0 (copy)
    return {
        mediaType = l_GameMediaImageType_0.Image, 
        imageId = l_Url_0:getPlaceDefaultThumbnailUrl(v26, 768, 432)
    };
end;
local v34 = l_memoize_0(function(v28, v29, v30) --[[ Line: 46 ]]
    -- upvalues: l_GameMediaImageType_0 (copy), l_FFlagLuaAppEdpFixDefaultBanner_0 (copy), l_RetrievalStatus_0 (copy), l_Url_0 (copy)
    local v31 = nil;
    if v28 then
        for _, v33 in pairs(v28) do
            if v33.assetTypeId == l_GameMediaImageType_0.Image then
                v31 = v33;
                break;
            end;
        end;
    end;
    if not l_FFlagLuaAppEdpFixDefaultBanner_0 and v31 == nil then
        if v30 == l_RetrievalStatus_0.Done then
            return {
                mediaType = l_GameMediaImageType_0.Image, 
                imageId = l_Url_0:getPlaceDefaultThumbnailUrl(v29, 768, 432)
            };
        else
            return nil;
        end;
    else
        return v31;
    end;
end);
return function(v35, v36) --[[ Line: 72 ]] --[[ Name: useExperienceDetailsRoduxState ]]
    -- upvalues: v22 (copy), v21 (copy), l_useUiModeInfo_0 (copy), l_useSelector_0 (copy), l_UiMode_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_BigGameIconReducer_0 (copy), l_GameIconReducer_0 (copy), l_useGameIconSelector_0 (copy), l_FFlagLuaAppEdpFixDefaultBanner_0 (copy), v19 (copy), l_ApiFetchGameMedia_0 (copy), v34 (copy), l_useGameInfosSelector_0 (copy), l_RetrievalStatus_0 (copy), l_Url_0 (copy), v20 (copy), v3 (copy), l_ApiFetchGameDetails_0 (copy), l_useGameProductInfoSelector_0 (copy)
    local v37 = nil;
    if v22() and v21() then
        local v38 = l_useUiModeInfo_0();
        local l_v38_0 = v38 --[[ copy: 3 -> 16 ]];
        v37 = l_useSelector_0(function(v40) --[[ Line: 76 ]]
            -- upvalues: l_v38_0 (copy), l_UiMode_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v36 (copy), l_BigGameIconReducer_0 (ref), v35 (copy), l_GameIconReducer_0 (ref)
            if l_v38_0 and l_v38_0.uiMode == l_UiMode_0.TenFoot then
                if l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v36 then
                    local v41 = v40[l_BigGameIconReducer_0.key][v35.universeId];
                    if v41 == nil then
                        return {
                            url = string.format("rbxthumb://type=GameIcon&id=%s&w=512&h=512", v35.universeId), 
                            imageSize = "512x512"
                        };
                    else
                        return v41;
                    end;
                else
                    return v40[l_BigGameIconReducer_0.key][v35.universeId] or v40[l_GameIconReducer_0.key][v35.universeId];
                end;
            elseif l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v36 then
                local v42 = v40[l_GameIconReducer_0.key][v35.universeId];
                if v42 == nil then
                    return {
                        url = string.format("rbxthumb://type=GameIcon&id=%s&w=150&h=150", v35.universeId), 
                        imageSize = "150x150"
                    };
                else
                    return v42;
                end;
            else
                return v40[l_GameIconReducer_0.key][v35.universeId];
            end;
        end);
    elseif l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 then
        local v43 = l_useGameIconSelector_0(v35.universeId);
        v37 = if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v36 then if v43 == nil then {
            url = string.format("rbxthumb://type=GameIcon&id=%s&w=150&h=150", v35.universeId), 
            imageSize = "150x150"
        } else v43 else v43;
    else
        v37 = l_useGameIconSelector_0(v35.universeId);
    end;
    local v44 = nil;
    if not l_FFlagLuaAppEdpFixDefaultBanner_0 then
        v44 = l_useSelector_0(function(v45) --[[ Line: 140 ]]
            -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v36 (copy), v19 (ref), v35 (copy), l_ApiFetchGameMedia_0 (ref), v34 (ref)
            local v46 = if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v36 then v19.GetFetchingStatus(v45, v35.universeId) else l_ApiFetchGameMedia_0.GetFetchingStatus(v45, v35.universeId);
            local v47 = v34(v45.GameMedia[v35.universeId], v35.placeId, v46);
            if v47 then
                return v47.imageId;
            else
                return nil;
            end;
        end);
    end;
    local v48 = l_useGameInfosSelector_0(v35.universeId);
    local v50 = l_useSelector_0(function(v49) --[[ Line: 153 ]]
        -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v36 (copy), v35 (copy)
        if l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v36 then
            return v49.GameDetailsV2[v35.universeId];
        else
            return v49.GameDetails[v35.universeId];
        end;
    end);
    local v52 = l_useSelector_0(function(v51) --[[ Line: 164 ]]
        -- upvalues: v35 (copy)
        return v51.GameDetailErrors[v35.universeId];
    end);
    local v53 = nil;
    if l_FFlagLuaAppEdpFixDefaultBanner_0 then
        v44 = l_useSelector_0(function(v54) --[[ Line: 170 ]]
            -- upvalues: v34 (ref), v35 (copy)
            local v55 = v34(v54.GameMedia[v35.universeId]);
            if v55 then
                return v55.imageId;
            else
                return nil;
            end;
        end);
        v53 = l_useSelector_0(function(v56) --[[ Line: 175 ]]
            -- upvalues: v50 (copy), v48 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v36 (copy), v19 (ref), v35 (copy), l_ApiFetchGameMedia_0 (ref), v44 (ref), l_RetrievalStatus_0 (ref), l_Url_0 (ref)
            local v57 = v50 and v50.rootPlaceId or v48 and v48.placeId or nil;
            local v58 = if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v36 then v19.GetFetchingStatus(v56, v35.universeId) else l_ApiFetchGameMedia_0.GetFetchingStatus(v56, v35.universeId);
            if v44 == nil and v57 then
                if v58 == l_RetrievalStatus_0.Done then
                    return l_Url_0:getPlaceDefaultThumbnailUrl(v57, 768, 432);
                else
                    return nil;
                end;
            else
                return nil;
            end;
        end);
    end;
    local v60 = l_useSelector_0(function(v59) --[[ Line: 196 ]]
        -- upvalues: v20 (ref), v3 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v36 (copy), v35 (copy)
        if v20() then
            return nil;
        else
            return (v3.isCreatorOfGameVerified(v59, if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v36 then {
                universeId = v35.universeId, 
                shouldUseV2GameDetails = true
            } else v35));
        end;
    end);
    local v62 = l_useSelector_0(function(v61) --[[ Line: 212 ]]
        -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v36 (copy), v19 (ref), v35 (copy), l_ApiFetchGameDetails_0 (ref)
        if l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v36 then
            return v19.GetFetchingStatus(v61, v35.universeId);
        else
            return l_ApiFetchGameDetails_0.GetFetchingStatus(v61, v35.universeId);
        end;
    end);
    local v63 = l_useGameProductInfoSelector_0(v35.universeId);
    local v66 = l_useSelector_0(function(v64) --[[ Line: 225 ]]
        -- upvalues: v35 (copy)
        local v65 = v64.GameSocialLinks[v35.universeId];
        if v65 then
            return v65.externalLinks;
        else
            return nil;
        end;
    end);
    local v68 = l_useSelector_0(function(v67) --[[ Line: 230 ]]
        -- upvalues: v35 (copy)
        return v67.AgeRecommendations[v35.universeId];
    end);
    local v70 = l_useSelector_0(function(v69) --[[ Line: 234 ]]
        -- upvalues: v35 (copy)
        return v69.CommunityLinks.ExperienceCommunityLinks[v35.universeId] or nil;
    end);
    local v72 = l_useSelector_0(function(v71) --[[ Line: 239 ]]
        -- upvalues: v35 (copy)
        return v71.GameFollowings[v35.universeId];
    end);
    local v74 = l_useSelector_0(function(v73) --[[ Line: 243 ]]
        return v73.ExperienceNotificationsEnabled;
    end);
    return {
        thumbnail = v37, 
        bannerImageId = v44, 
        defaultBannerUrl = if l_FFlagLuaAppEdpFixDefaultBanner_0 then v53 else nil, 
        gameInfo = v48, 
        gameDetail = v50, 
        gameDetailError = v52, 
        creatorVerified = v60, 
        gameDetailsPageDataStatus = v62, 
        gameProductInfo = v63, 
        socialLinks = v66, 
        ageRecommendations = v68, 
        communityLink = v70, 
        gameFollowings = v72, 
        notificationsEnabled = v74
    };
end;