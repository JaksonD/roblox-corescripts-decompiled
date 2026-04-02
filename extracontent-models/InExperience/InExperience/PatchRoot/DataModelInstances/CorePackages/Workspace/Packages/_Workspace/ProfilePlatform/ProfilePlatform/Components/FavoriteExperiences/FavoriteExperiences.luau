local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_dependencyArray_0 = v5.Hooks.dependencyArray;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_Url_0 = require(l_Parent_0.Http).Url;
local v12 = require(l_script_FirstAncestor_0.Networking.NetworkingGames);
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local v14 = require(l_script_FirstAncestor_0.BaseComponents.CollectionGridViews.SquareCollectionGridView);
local v15 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v16 = require(l_script_FirstAncestor_0.Hooks.Tiles.useRenderExperienceTile);
local v17 = require(l_script_FirstAncestor_0.Hooks.Tiles.useRenderExperienceTile_DEPRECATED);
local v18 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v19 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v20 = require(l_script_FirstAncestor_0.Hooks.useSendItemImpressions);
local v21 = require(l_script_FirstAncestor_0.Hooks.useGenerateImpressionsTag);
local v22 = require(l_script_FirstAncestor_0.Hooks.formatExperienceDetailsForImpressions);
local v23 = require(l_script_FirstAncestor_0.Common.Enums);
local v24 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v25 = require(l_script_FirstAncestor_0.Common.TextKeys);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_ContentType_0 = require(l_Parent_0.UnifiedLogging).ContentType;
local l_RoactAnalyticsCommonGameEvents_0 = require(l_Parent_0.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v30 = require(l_Parent_0.SharedFlags);
local v31 = game:DefineFastFlag("ProfilePlatformFavoritesNavigateToWeb_V2", false);
local v32 = game:DefineFastFlag("ProfilePlatformFavoritesEnableProfilePlatformClickAnalytics", false);
local l_FFlagProfilePlatformFavoritesEnableGameDetailAnalytics_0 = v30.FFlagProfilePlatformFavoritesEnableGameDetailAnalytics;
local l_FFlagProfilePlatformEnableImpressions_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableImpressions;
local l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformImproveGameDetailsAnalytics;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v37 = {};
local function v39(v38) --[[ Line: 64 ]] --[[ Name: getSquareExperienceTileHeight ]]
    return v38 + 42;
end;
local function v53(_) --[[ Line: 68 ]] --[[ Name: useFavoriteExperiences ]]
    -- upvalues: l_useDispatch_0 (copy), v15 (copy), v23 (copy), v37 (copy), v2 (copy), v3 (copy), v12 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy)
    local v41 = l_useDispatch_0();
    local v42 = v15(v23.Components.FavoriteExperiences).experiences or v37;
    local v45 = v2.useMemo(function() --[[ Line: 74 ]]
        -- upvalues: v3 (ref), v42 (copy)
        return v3.List.map(v42, function(v43, _) --[[ Line: 75 ]]
            return (tostring(v43.universeId));
        end);
    end, {
        v42
    });
    v2.useEffect(function() --[[ Line: 80 ]]
        -- upvalues: v45 (copy), v3 (ref), v41 (copy), v12 (ref)
        if v45 ~= nil and not v3.isEmpty(v45) then
            v41(v12.GetExperiencesDetails.API(v45)):catch(function(_) --[[ Line: 82 ]]

            end);
        end;
    end, {
        v45
    });
    local v48 = l_useSelector_0(function(v47) --[[ Line: 88 ]]
        -- upvalues: l_getDeepValue_0 (ref), v37 (ref)
        return l_getDeepValue_0(v47, "ProfilePlatform.Games.byGameId") or v37;
    end);
    local v52 = v2.useMemo(function() --[[ Line: 92 ]]
        -- upvalues: v45 (copy), v48 (copy)
        local v49 = {};
        for _, v51 in v45 do
            if v48[v51] then
                table.insert(v49, v48[v51]);
            end;
        end;
        return v49;
    end, {
        v45, 
        v48
    });
    if not v42 or #v52 ~= #v45 then
        return v37;
    else
        return v52;
    end;
end;
return function(v54) --[[ Line: 113 ]] --[[ Name: FavoriteExperiences ]]
    -- upvalues: l_useDispatch_0 (copy), v18 (copy), v32 (copy), v19 (copy), l_FFlagProfilePlatformEnableImpressions_0 (copy), v21 (copy), v23 (copy), l_useLocalization_0 (copy), v25 (copy), v2 (copy), v24 (copy), v31 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_Url_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v39 (copy), v53 (copy), l_FFlagProfilePlatformFavoritesEnableGameDetailAnalytics_0 (copy), l_useRoactService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (copy), v16 (copy), v17 (copy), v22 (copy), v20 (copy), l_ContentType_0 (copy), v3 (copy), v14 (copy)
    local v55 = l_useDispatch_0();
    local v56 = v18();
    local v57 = if v32 then v19() else nil;
    local v58 = if l_FFlagProfilePlatformEnableImpressions_0 then v21(v23.Components.FavoriteExperiences) else nil;
    local l_profileId_0 = v56.profileId;
    local v60 = l_useLocalization_0({
        title = v25.Favorites
    });
    local v61 = v2.useCallback(function() --[[ Line: 130 ]]
        -- upvalues: v32 (ref), v57 (copy), v24 (ref), v31 (ref), v55 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_Url_0 (ref), l_profileId_0 (copy), v25 (ref)
        if v32 and v57 then
            v57.fireAnalyticsEvent(v24.FavoriteExperienceSeeAll);
        end;
        if v31 then
            v55(l_NavigateDown_0({
                name = l_AppPage_0.GenericWebPage, 
                detail = string.format("%susers/%s/favorites#!/places", l_Url_0.BASE_URL, l_profileId_0), 
                extraProps = {
                    titleKey = v25.Favorites
                }
            }, nil));
        end;
    end, if v32 then if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        l_profileId_0, 
        v57
    } else l_dependencyArray_0(l_profileId_0, v57) else nil);
    local v62 = not v31;
    local l_v39_0 = v39;
    local v64 = v53(l_profileId_0);
    local v65 = if l_FFlagProfilePlatformFavoritesEnableGameDetailAnalytics_0 then l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0) else nil;
    local v70 = v2.useCallback(function(v66, v67, v68) --[[ Line: 161 ]]
        -- upvalues: v32 (ref), v57 (copy), v24 (ref), l_FFlagProfilePlatformFavoritesEnableGameDetailAnalytics_0 (ref), v64 (copy), v65 (copy), l_AppPage_0 (ref), v54 (copy), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref), l_profileId_0 (copy)
        if v32 then
            v57.fireAnalyticsEvent(v24.FavoriteExperienceOpened, {
                experienceId = v66.experienceId, 
                positionInComponent = v67
            });
        end;
        if l_FFlagProfilePlatformFavoritesEnableGameDetailAnalytics_0 then
            local v69 = 0;
            if v64 then
                v69 = #v64;
            end;
            v65.reportOpenGameDetailFromProfile(v66.rootPlaceId, v67, v69, v66.experienceId, l_AppPage_0.ProfilePlatform, v54.layoutOrder, v68 or 1, if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then l_profileId_0 else nil);
        end;
    end, if l_FFlagProfilePlatformFavoritesEnableGameDetailAnalytics_0 then if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v57, 
        v64, 
        v65, 
        v54.layoutOrder
    } else l_dependencyArray_0(v57, v64, v65, v54.layoutOrder) else if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v57
    } else l_dependencyArray_0(v57));
    local v71 = if l_FFlagProfilePlatformEnableImpressions_0 then v16(v58, "ProfileFavoriteExperienceTile", v70) else v17("ProfileFavoriteExperienceTile", v70);
    local v72 = if l_FFlagProfilePlatformEnableImpressions_0 then v2.useMemo(function() --[[ Line: 196 ]]
        -- upvalues: v22 (ref), v64 (copy)
        return v22(v64);
    end, {
        v64
    }) else nil;
    local v73 = if l_FFlagProfilePlatformEnableImpressions_0 then v20(v72, 3, l_ContentType_0.Game, v54.layoutOrder, v23.Components.FavoriteExperiences) else nil;
    if not v3.isEmpty(v64) then
        return (v2.createElement(v14, {
            getItemHeight = l_v39_0, 
            hideHeaderButton = v62, 
            items = v64, 
            layoutOrder = v54.layoutOrder, 
            onActivateHeader = v61, 
            renderItem = v71, 
            title = v60.title, 
            impressionsTag = if l_FFlagProfilePlatformEnableImpressions_0 then v58 else nil, 
            sendImpressions = if l_FFlagProfilePlatformEnableImpressions_0 then v73 else nil, 
            overrides = {
                numColumns = 3
            }
        }));
    else
        return nil;
    end;
end;