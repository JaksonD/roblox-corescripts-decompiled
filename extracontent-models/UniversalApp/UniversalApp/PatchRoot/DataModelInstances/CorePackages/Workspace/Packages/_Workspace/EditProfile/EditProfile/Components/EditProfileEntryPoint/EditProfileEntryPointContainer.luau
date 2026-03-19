local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.NavigationRodux);
local l_NavigateToRoute_0 = v3.Thunks.NavigateToRoute;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.UserProfiles);
local v8 = require(l_Parent_0.RoactUtils);
local v9 = require(script.Parent.EditProfileEntryPoint);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useLocalRobuxBalance_0 = require(l_Parent_0.RobloxAppHooks).useLocalRobuxBalance;
local l_useSelector_0 = v8.Hooks.RoactRodux.useSelector;
local l_ProfileScreens_0 = require(l_script_FirstAncestor_0.Common.Constants).ProfileScreens;
local v14 = require(l_script_FirstAncestor_0.Networking.UsersNetworking);
local v15 = require(l_Parent_0.SocialLuaAnalytics);
local v16 = require(l_Parent_0.SocialStopwatch);
local l_useDispatch_0 = v8.Hooks.RoactRodux.useDispatch;
local l_useEffectOnMount_0 = v8.Hooks.useEffectOnMount;
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local l_useEffectOnce_0 = v8.Hooks.useEffectOnce;
local l_NavigateDown_0 = v3.Thunks.NavigateDown;
local v23 = require(l_script_FirstAncestor_0.Flags.SocialNetworksInEditProfileIXP);
local v24 = require(l_script_FirstAncestor_0.Networking.SocialLinksNetworking);
local v25 = require(l_Parent_0.SocialToast);
local v26 = require(l_script_FirstAncestor_0.Networking.PersonasNetworking);
local l_LoadingStages_0 = v15.Analytics.Enums.LoadingStages;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local v29 = require(l_script_FirstAncestor_0.Flags.FStringEditProfileToAvatarLayerName);
local v30 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileFixFocusNavigation);
local v31 = require(l_script_FirstAncestor_0.Utils.FocusNavigatorWrapper);
local v32 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileNavigateToAvatar);
local v33 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v33.EventNames;
local l_useAnalytics_0 = v33.useAnalytics;
local l_FFlagMoveInExperienceModeToEditProfile_0 = require(l_Parent_0.SharedFlags).FFlagMoveInExperienceModeToEditProfile;
local l_FFlagEditProfileBackgroundEnabled_0 = require(l_Parent_0.SharedFlags).FFlagEditProfileBackgroundEnabled;
local l_FFlagEditProfileInExperiencePersonasV2_0 = require(l_Parent_0.SharedFlags).FFlagEditProfileInExperiencePersonasV2;
return function(v39) --[[ Line: 60 ]] --[[ Name: EditProfileEntryPointContainer ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), l_ProfileScreens_0 (copy), v6 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_FFlagMoveInExperienceModeToEditProfile_0 (copy), v23 (copy), l_Players_0 (copy), l_useLocalRobuxBalance_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_useEffectOnMount_0 (copy), v14 (copy), l_useAnalytics_0 (copy), l_useUserExperiment_0 (copy), v29 (copy), l_EventNames_0 (copy), v24 (copy), v25 (copy), l_Images_0 (copy), l_NavigateToRoute_0 (copy), v7 (copy), v16 (copy), l_LoadingStages_0 (copy), l_useEffectOnce_0 (copy), l_FFlagEditProfileInExperiencePersonasV2_0 (copy), v26 (copy), v30 (copy), v31 (copy), v9 (copy), v32 (copy), l_FFlagEditProfileBackgroundEnabled_0 (copy)
    local v40 = l_useDispatch_0();
    local v41 = l_useLocalUserId_0();
    local v42 = "";
    local v43 = "";
    local v44 = true;
    local v45 = v39.navigation.getParam(l_ProfileScreens_0);
    local v46, v47 = v6.useState(false);
    local v49 = l_useSelector_0(function(v48) --[[ Line: 68 ]]
        -- upvalues: l_getDeepValue_0 (ref), v41 (copy)
        return l_getDeepValue_0(v48, (("Profile.AdditionalUserFields.%*.description"):format(v41)));
    end);
    local v51 = if l_FFlagMoveInExperienceModeToEditProfile_0 then l_useSelector_0(function(v50) --[[ Line: 72 ]]
        -- upvalues: l_getDeepValue_0 (ref), v41 (copy)
        return l_getDeepValue_0(v50, (("Profile.AdditionalUserFields.%*.userProfileSettings"):format(v41)));
    end) else nil;
    local v52 = nil;
    local v53 = nil;
    local v54 = nil;
    if l_FFlagMoveInExperienceModeToEditProfile_0 and v51 ~= nil then
        v52 = v51.isInExperienceNameEnabled;
        v53 = v51.inExperienceName;
        v54 = v51.inExperienceNameExpirationTime;
    end;
    local v55 = v23.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled();
    local v56 = v23.useGetExperimentVariant({
        isExposureEnabled = true
    });
    local v57 = v56 and v56 ~= v23.Variants.Control;
    local v59 = if v55 then l_useSelector_0(function(v58) --[[ Line: 90 ]]
        -- upvalues: l_getDeepValue_0 (ref)
        return l_getDeepValue_0(v58, "Profile.SocialLinks.selfSocialLinks") or {};
    end) else nil;
    local v60 = if v55 and v57 and l_Players_0.LocalPlayer then l_Players_0.LocalPlayer:GetUnder13() else false;
    v49 = "";
    local v61 = l_useLocalRobuxBalance_0();
    local v62 = v39.navigation.getParam("navigateToEditUsername");
    local function v63() --[[ Line: 104 ]]
        -- upvalues: v40 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v40(l_NavigateDown_0({
            {
                name = l_AppPage_0.PurchaseRobux
            }
        }));
    end;
    local v64, v65 = v6.useState(v49);
    l_useEffectOnMount_0(function() --[[ Line: 111 ]]
        -- upvalues: v40 (copy), v14 (ref), v41 (copy), v65 (copy)
        v40(v14.GetUserV2FromUserId.API(v41)):andThen(function(v66) --[[ Line: 113 ]]
            -- upvalues: v65 (ref)
            v65(v66.responseBody.description or "");
        end):catch(function() --[[ Line: 116 ]]
            -- upvalues: v65 (ref)
            v65("");
        end);
    end);
    local v67 = l_useAnalytics_0();
    local v68 = v39.navigation.getParam("onIdentityChange");
    local v70 = v6.useCallback(function(v69) --[[ Line: 124 ]]
        -- upvalues: v65 (copy), v68 (copy)
        v65(v69);
        if v68 then
            v68();
        end;
    end, {
        v65, 
        v68
    });
    local v72 = v6.useCallback(function(v71) --[[ Line: 131 ]]
        -- upvalues: v47 (copy), v68 (copy)
        v47(v71);
        if v68 then
            v68();
        end;
    end, {
        v47, 
        v68
    });
    local v74 = l_useUserExperiment_0({
        v29
    }, function(v73) --[[ Line: 138 ]]
        -- upvalues: v29 (ref)
        return (v73[v29] or {}).profile_picture_on;
    end);
    l_useEffectOnMount_0(function() --[[ Line: 143 ]]
        -- upvalues: v67 (copy), l_EventNames_0 (ref), v40 (copy), v14 (ref), v41 (copy), v47 (copy), v55 (copy), v57 (copy), v24 (ref)
        v67.fireAnalyticsEvent(l_EventNames_0.EditProfileOpened);
        v40(v14.GetDisplayNameValidation.API(v41, "Test")):andThen(function(_) --[[ Line: 148 ]]
            -- upvalues: v47 (ref)
            v47(true);
        end):catch(function(_) --[[ Line: 151 ]]

        end);
        if v55 and v57 then
            v40(v24.GetSelfSocialLinks.API({
                alwaysReturnUrls = false, 
                filterLink = false
            })):catch(function(_) --[[ Line: 155 ]]

            end);
        end;
    end);
    local v78 = v25.useOpenToast();
    local function v80(v79) --[[ Line: 162 ]] --[[ Name: showToast ]]
        -- upvalues: v78 (copy), l_Images_0 (ref)
        v78({
            toastTitle = v79, 
            iconImage = l_Images_0["icons/actions/accept"]
        });
    end;
    local v81 = v39.testProp_openEditProfilePicture or function() --[[ Line: 170 ]]
        -- upvalues: v67 (copy), l_EventNames_0 (ref), v40 (copy), l_NavigateToRoute_0 (ref), l_AppPage_0 (ref)
        v67.fireAnalyticsEvent(l_EventNames_0.OpenAvatarMarketplace);
        v40(l_NavigateToRoute_0({
            {
                name = l_AppPage_0.Catalog
            }
        }));
    end;
    local v82 = v7.Hooks.useUserProfilesFetch({
        userIds = {
            v41
        }, 
        query = v7.Queries.userProfilesDisplayNameAndUsernameByUserIds
    });
    if v82.data then
        v42 = v7.Selectors.getUsernameFromId(v82.data, v41);
        v43 = v7.Selectors.getDisplayNameFromId(v82.data, v41);
        v44 = false;
    end;
    v6.useEffect(function() --[[ Line: 189 ]]
        -- upvalues: v16 (ref), v67 (copy), l_EventNames_0 (ref), l_LoadingStages_0 (ref)
        local v83 = v16.Stopwatch.get(v16.Events.EditProfileOpened);
        v67.fireAnalyticsEvent(l_EventNames_0.EditProfileLoadingStage, {
            status = l_LoadingStages_0.Fetching, 
            statValue = v83 and v83.timeElapsed
        });
        return function() --[[ Line: 196 ]]
            -- upvalues: v16 (ref)
            v16.Stopwatch.stop(v16.Events.EditProfileOpened);
        end;
    end, {});
    l_useEffectOnce_0(function() --[[ Line: 201 ]]
        -- upvalues: v16 (ref), v67 (copy), l_EventNames_0 (ref), v82 (copy), l_LoadingStages_0 (ref)
        local v84 = v16.Stopwatch.get(v16.Events.EditProfileOpened);
        v67.fireAnalyticsEvent(l_EventNames_0.EditProfileLoadingStage, {
            status = if v82.data then l_LoadingStages_0.Done else l_LoadingStages_0.Failed, 
            statValue = v84 and v84.timeElapsed
        });
    end, v82.data or v82.error);
    local function v85() --[[ Line: 209 ]] --[[ Name: onClose ]]
        -- upvalues: v39 (copy)
        v39.navigation.pop();
    end;
    local function v86() --[[ Line: 213 ]] --[[ Name: openDisplayNameModal ]]
        -- upvalues: v67 (copy), l_EventNames_0 (ref), v46 (copy), v39 (copy), v45 (copy), v72 (copy), v43 (ref)
        if v67 then
            v67.fireAnalyticsEvent(l_EventNames_0.DisplayNameModalOpened);
        end;
        if v46 then
            v39.navigation.navigate(v45.EditDisplayNameModal, {
                setDisplayNameAvailable = v72, 
                displayName = v43
            });
            return;
        else
            v39.navigation.navigate(v45.EditDisplayNameErrorModal);
            return;
        end;
    end;
    local function v87() --[[ Line: 228 ]] --[[ Name: openEditUsername ]]
        -- upvalues: v67 (copy), l_EventNames_0 (ref), v61 (copy), v62 (copy), v80 (copy), v39 (copy), v45 (copy), v63 (copy)
        v67.fireAnalyticsEvent(l_EventNames_0.EditUsernameOpened);
        if v61 >= 1000 then
            v62(v80);
            return;
        else
            v39.navigation.navigate(v45.UsernameInsufficientFundsModal, {
                robux = 1000 - v61, 
                navigateDownToPurchaseRobux = v63
            });
            return;
        end;
    end;
    local function v88() --[[ Line: 242 ]] --[[ Name: openEditDescription ]]
        -- upvalues: v39 (copy), v45 (copy), v64 (copy), v70 (copy)
        v39.navigation.navigate(v45.EditDescriptionModal, {
            initialText = v64, 
            setDescription = v70
        });
    end;
    local function v90(v89) --[[ Line: 249 ]] --[[ Name: openEditSocialLinksModal ]]
        -- upvalues: v55 (copy), v40 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        if v55 then
            v40(l_NavigateDown_0({
                name = l_AppPage_0.EditSocialNetworks, 
                extraProps = {
                    focusOn = v89
                }
            }));
        end;
    end;
    local v91 = nil;
    local v92 = nil;
    local v93 = nil;
    local v94, v95 = v6.useState(-1);
    local v96, v97 = v6.useState("");
    local v98, v99 = v6.useState(false);
    if l_FFlagEditProfileInExperiencePersonasV2_0 then
        local function _() --[[ Line: 265 ]] --[[ Name: openPersonaNameModal ]]
            -- upvalues: v39 (copy), v45 (copy), v96 (copy), v97 (copy)
            v39.navigation.navigate(v45.EditPersonaNameModal, {
                navigation = v39.navigation, 
                initialName = v96, 
                setPersonaName = v97
            });
        end;
        v91 = function() --[[ Line: 273 ]]
            -- upvalues: v67 (copy), l_EventNames_0 (ref), v39 (copy), v45 (copy), v94 (copy), v95 (copy)
            v67.fireAnalyticsEvent(l_EventNames_0.OpenPersonaOutfitSelect);
            v39.navigation.navigate(v45.PersonaAvatarPage, {
                navigation = v39.navigation, 
                initialOutfit = v94, 
                setOutfit = v95
            });
        end;
        v92 = function() --[[ Line: 281 ]]
            -- upvalues: v67 (copy), l_EventNames_0 (ref), v39 (copy), v45 (copy), v96 (copy), v97 (copy)
            v67.fireAnalyticsEvent(l_EventNames_0.OpenPersonaNameModal);
            v39.navigation.navigate(v45.EditPersonaNameModal, {
                navigation = v39.navigation, 
                initialName = v96, 
                setPersonaName = v97
            });
        end;
        v93 = function(v101) --[[ Line: 285 ]]
            -- upvalues: v67 (copy), l_EventNames_0 (ref), v40 (copy), v26 (ref), v99 (copy)
            v67.fireAnalyticsEvent(l_EventNames_0.TogglePersona);
            v40(v26.SetStatus.API({
                status = v101
            })):catch(function(v102) --[[ Line: 287 ]]
                -- upvalues: v99 (ref), v101 (copy)
                if v102.HttpError == Enum.HttpError.OK then
                    v99(v101);
                end;
            end);
        end;
        l_useEffectOnMount_0(function() --[[ Line: 294 ]]
            -- upvalues: v40 (copy), v26 (ref), v95 (copy), v97 (copy), v99 (copy)
            v40(v26.GetPersona.API()):andThen(function(v103) --[[ Line: 296 ]]
                -- upvalues: v95 (ref), v97 (ref), v99 (ref)
                v95(v103.responseBody.outfitId or -1);
                v97(v103.responseBody.displayName or "");
                v99(v103.responseBody.status or false);
            end):catch(function() --[[ Line: 301 ]]

            end);
        end);
    end;
    if v30 then
        return (v31({
            onClose = v85
        }, {
            v6.createElement(v9, {
                shouldShimmerName = v44, 
                username = v42, 
                displayName = v43, 
                description = v64, 
                localUserId = v41, 
                onClose = v85, 
                openDisplayNameModal = v86, 
                navigateToEditUsername = v87, 
                openEditDescription = v88, 
                openEditProfilePicture = if not not v32 or v74 then v81 else nil, 
                socialInfo = if v55 and v57 then v59 else nil, 
                openEditSocialLinksModal = if v55 and v57 then v90 else nil, 
                isUnder13 = if v55 and v57 then v60 else nil, 
                canSeeInExperienceMode = if l_FFlagMoveInExperienceModeToEditProfile_0 then v51 ~= nil else false, 
                isInExperienceNameEnabled = if l_FFlagMoveInExperienceModeToEditProfile_0 then v52 else false, 
                inExperienceName = if l_FFlagMoveInExperienceModeToEditProfile_0 then v53 else nil, 
                inExperienceNameExpirationTime = if l_FFlagMoveInExperienceModeToEditProfile_0 then v54 else nil, 
                onToggleInExperienceMode = if l_FFlagMoveInExperienceModeToEditProfile_0 then v39.navigation.getParam("onToggleInExperienceMode") else nil, 
                profileScreens = if l_FFlagEditProfileBackgroundEnabled_0 then v45 else nil, 
                onPersonaChoose = if l_FFlagEditProfileInExperiencePersonasV2_0 then v91 else nil, 
                onPersonaNameEdit = if l_FFlagEditProfileInExperiencePersonasV2_0 then v92 else nil, 
                onPersonaToggle = if l_FFlagEditProfileInExperiencePersonasV2_0 then v93 else nil, 
                personaOutfit = if l_FFlagEditProfileInExperiencePersonasV2_0 then v94 else nil, 
                personaName = if l_FFlagEditProfileInExperiencePersonasV2_0 then v96 else nil, 
                personaStatus = if l_FFlagEditProfileInExperiencePersonasV2_0 then v98 else nil
            })
        }));
    else
        return v6.createElement(v9, {
            shouldShimmerName = v44, 
            username = v42, 
            displayName = v43, 
            description = v64, 
            localUserId = v41, 
            onClose = v85, 
            openDisplayNameModal = v86, 
            navigateToEditUsername = v87, 
            openEditDescription = v88, 
            openEditProfilePicture = if not not v32 or v74 then v81 else nil, 
            socialInfo = if v55 and v57 then v59 else nil, 
            openEditSocialLinksModal = if v55 and v57 then v90 else nil, 
            isUnder13 = if v55 and v57 then v60 else nil, 
            canSeeInExperienceMode = if l_FFlagMoveInExperienceModeToEditProfile_0 then v51 ~= nil else false, 
            isInExperienceNameEnabled = if l_FFlagMoveInExperienceModeToEditProfile_0 then v52 else false, 
            inExperienceName = if l_FFlagMoveInExperienceModeToEditProfile_0 then v53 else nil, 
            inExperienceNameExpirationTime = if l_FFlagMoveInExperienceModeToEditProfile_0 then v54 else nil, 
            onToggleInExperienceMode = if l_FFlagMoveInExperienceModeToEditProfile_0 then v39.navigation.getParam("onToggleInExperienceMode") else nil, 
            profileScreens = if l_FFlagEditProfileBackgroundEnabled_0 then v45 else nil, 
            onPersonaChoose = if l_FFlagEditProfileInExperiencePersonasV2_0 then v91 else nil, 
            onPersonaNameEdit = if l_FFlagEditProfileInExperiencePersonasV2_0 then v92 else nil, 
            onPersonaToggle = if l_FFlagEditProfileInExperiencePersonasV2_0 then v93 else nil, 
            personaOutfit = if l_FFlagEditProfileInExperiencePersonasV2_0 then v94 else nil, 
            personaName = if l_FFlagEditProfileInExperiencePersonasV2_0 then v96 else nil, 
            personaStatus = if l_FFlagEditProfileInExperiencePersonasV2_0 then v98 else nil
        });
    end;
end;