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
local v36 = {};
local function v38(v37) --[[ Line: 62 ]] --[[ Name: getSquareExperienceTileHeight ]]
    return v37 + 42;
end;
local function v52(_) --[[ Line: 66 ]] --[[ Name: useFavoriteExperiences ]]
    -- upvalues: l_useDispatch_0 (copy), v15 (copy), v23 (copy), v36 (copy), v2 (copy), v3 (copy), v12 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy)
    local v40 = l_useDispatch_0();
    local v41 = v15(v23.Components.FavoriteExperiences).experiences or v36;
    local v44 = v2.useMemo(function() --[[ Line: 72 ]]
        -- upvalues: v3 (ref), v41 (copy)
        return v3.List.map(v41, function(v42, _) --[[ Line: 73 ]]
            return (tostring(v42.universeId));
        end);
    end, {
        v41
    });
    v2.useEffect(function() --[[ Line: 78 ]]
        -- upvalues: v44 (copy), v3 (ref), v40 (copy), v12 (ref)
        if v44 ~= nil and not v3.isEmpty(v44) then
            v40(v12.GetExperiencesDetails.API(v44)):catch(function(_) --[[ Line: 80 ]]

            end);
        end;
    end, {
        v44
    });
    local v47 = l_useSelector_0(function(v46) --[[ Line: 86 ]]
        -- upvalues: l_getDeepValue_0 (ref), v36 (ref)
        return l_getDeepValue_0(v46, "ProfilePlatform.Games.byGameId") or v36;
    end);
    local v51 = v2.useMemo(function() --[[ Line: 90 ]]
        -- upvalues: v44 (copy), v47 (copy)
        local v48 = {};
        for _, v50 in v44 do
            if v47[v50] then
                table.insert(v48, v47[v50]);
            end;
        end;
        return v48;
    end, {
        v44, 
        v47
    });
    if not v41 or #v51 ~= #v44 then
        return v36;
    else
        return v51;
    end;
end;
return function(v53) --[[ Line: 111 ]] --[[ Name: FavoriteExperiences ]]
    -- upvalues: l_useDispatch_0 (copy), v18 (copy), v32 (copy), v19 (copy), l_FFlagProfilePlatformEnableImpressions_0 (copy), v21 (copy), v23 (copy), l_useLocalization_0 (copy), v25 (copy), v2 (copy), v24 (copy), v31 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_Url_0 (copy), l_dependencyArray_0 (copy), v38 (copy), v52 (copy), l_FFlagProfilePlatformFavoritesEnableGameDetailAnalytics_0 (copy), l_useRoactService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (copy), v16 (copy), v17 (copy), v22 (copy), v20 (copy), l_ContentType_0 (copy), v3 (copy), v14 (copy)
    local v54 = l_useDispatch_0();
    local v55 = v18();
    local v56 = if v32 then v19() else nil;
    local v57 = if l_FFlagProfilePlatformEnableImpressions_0 then v21(v23.Components.FavoriteExperiences) else nil;
    local l_profileId_0 = v55.profileId;
    local v59 = l_useLocalization_0({
        title = v25.Favorites
    });
    local v60 = v2.useCallback(function() --[[ Line: 128 ]]
        -- upvalues: v32 (ref), v56 (copy), v24 (ref), v31 (ref), v54 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_Url_0 (ref), l_profileId_0 (copy), v25 (ref)
        if v32 and v56 then
            v56.fireAnalyticsEvent(v24.FavoriteExperienceSeeAll);
        end;
        if v31 then
            v54(l_NavigateDown_0({
                name = l_AppPage_0.GenericWebPage, 
                detail = string.format("%susers/%s/favorites#!/places", l_Url_0.BASE_URL, l_profileId_0), 
                extraProps = {
                    titleKey = v25.Favorites
                }
            }, nil));
        end;
    end, if v32 then l_dependencyArray_0(l_profileId_0, v56) else nil);
    local v61 = not v31;
    local l_v38_0 = v38;
    local v63 = v52(l_profileId_0);
    local v64 = if l_FFlagProfilePlatformFavoritesEnableGameDetailAnalytics_0 then l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0) else nil;
    local v69 = v2.useCallback(function(v65, v66, v67) --[[ Line: 157 ]]
        -- upvalues: v32 (ref), v56 (copy), v24 (ref), l_FFlagProfilePlatformFavoritesEnableGameDetailAnalytics_0 (ref), v63 (copy), v64 (copy), l_AppPage_0 (ref), v53 (copy), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref), l_profileId_0 (copy)
        if v32 then
            v56.fireAnalyticsEvent(v24.FavoriteExperienceOpened, {
                experienceId = v65.experienceId, 
                positionInComponent = v66
            });
        end;
        if l_FFlagProfilePlatformFavoritesEnableGameDetailAnalytics_0 then
            local v68 = 0;
            if v63 then
                v68 = #v63;
            end;
            v64.reportOpenGameDetailFromProfile(v65.rootPlaceId, v66, v68, v65.experienceId, l_AppPage_0.ProfilePlatform, v53.layoutOrder, v67 or 1, if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then l_profileId_0 else nil);
        end;
    end, if l_FFlagProfilePlatformFavoritesEnableGameDetailAnalytics_0 then l_dependencyArray_0(v56, v63, v64, v53.layoutOrder) else l_dependencyArray_0(v56));
    local v70 = if l_FFlagProfilePlatformEnableImpressions_0 then v16(v57, "ProfileFavoriteExperienceTile", v69) else v17("ProfileFavoriteExperienceTile", v69);
    local v71 = if l_FFlagProfilePlatformEnableImpressions_0 then v2.useMemo(function() --[[ Line: 190 ]]
        -- upvalues: v22 (ref), v63 (copy)
        return v22(v63);
    end, {
        v63
    }) else nil;
    local v72 = if l_FFlagProfilePlatformEnableImpressions_0 then v20(v71, 3, l_ContentType_0.Game, v53.layoutOrder, v23.Components.FavoriteExperiences) else nil;
    if not v3.isEmpty(v63) then
        return (v2.createElement(v14, {
            getItemHeight = l_v38_0, 
            hideHeaderButton = v61, 
            items = v63, 
            layoutOrder = v53.layoutOrder, 
            onActivateHeader = v60, 
            renderItem = v70, 
            title = v59.title, 
            impressionsTag = if l_FFlagProfilePlatformEnableImpressions_0 then v57 else nil, 
            sendImpressions = if l_FFlagProfilePlatformEnableImpressions_0 then v72 else nil, 
            overrides = {
                numColumns = 3
            }
        }));
    else
        return nil;
    end;
end;