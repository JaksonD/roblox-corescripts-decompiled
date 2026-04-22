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
local l_LoadingStages_0 = v15.Analytics.Enums.LoadingStages;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local v28 = require(l_script_FirstAncestor_0.Flags.FStringEditProfileToAvatarLayerName);
local v29 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileFixFocusNavigation);
local v30 = require(l_script_FirstAncestor_0.Utils.FocusNavigatorWrapper);
local v31 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileNavigateToAvatar);
local v32 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v32.EventNames;
local l_useAnalytics_0 = v32.useAnalytics;
local l_FFlagMoveInExperienceModeToEditProfile_0 = require(l_Parent_0.SharedFlags).FFlagMoveInExperienceModeToEditProfile;
local l_FFlagEditProfileBackgroundEnabled_0 = require(l_Parent_0.SharedFlags).FFlagEditProfileBackgroundEnabled;
return function(v37) --[[ Line: 58 ]] --[[ Name: EditProfileEntryPointContainer ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), l_ProfileScreens_0 (copy), v6 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_FFlagMoveInExperienceModeToEditProfile_0 (copy), v23 (copy), l_Players_0 (copy), l_useLocalRobuxBalance_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_useEffectOnMount_0 (copy), v14 (copy), l_useAnalytics_0 (copy), l_useUserExperiment_0 (copy), v28 (copy), l_EventNames_0 (copy), v24 (copy), v25 (copy), l_Images_0 (copy), l_NavigateToRoute_0 (copy), v7 (copy), v16 (copy), l_LoadingStages_0 (copy), l_useEffectOnce_0 (copy), v29 (copy), v30 (copy), v9 (copy), v31 (copy), l_FFlagEditProfileBackgroundEnabled_0 (copy)
    local v38 = l_useDispatch_0();
    local v39 = l_useLocalUserId_0();
    local v40 = "";
    local v41 = "";
    local v42 = true;
    local v43 = v37.navigation.getParam(l_ProfileScreens_0);
    local v44, v45 = v6.useState(false);
    local v47 = l_useSelector_0(function(v46) --[[ Line: 66 ]]
        -- upvalues: l_getDeepValue_0 (ref), v39 (copy)
        return l_getDeepValue_0(v46, (("Profile.AdditionalUserFields.%*.description"):format(v39)));
    end);
    local v49 = if l_FFlagMoveInExperienceModeToEditProfile_0 then l_useSelector_0(function(v48) --[[ Line: 70 ]]
        -- upvalues: l_getDeepValue_0 (ref), v39 (copy)
        return l_getDeepValue_0(v48, (("Profile.AdditionalUserFields.%*.userProfileSettings"):format(v39)));
    end) else nil;
    local v50 = nil;
    local v51 = nil;
    local v52 = nil;
    if l_FFlagMoveInExperienceModeToEditProfile_0 and v49 ~= nil then
        v50 = v49.isInExperienceNameEnabled;
        v51 = v49.inExperienceName;
        v52 = v49.inExperienceNameExpirationTime;
    end;
    local v53 = v23.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled();
    local v54 = v23.useGetExperimentVariant({
        isExposureEnabled = true
    });
    local v55 = v54 and v54 ~= v23.Variants.Control;
    local v57 = if v53 then l_useSelector_0(function(v56) --[[ Line: 88 ]]
        -- upvalues: l_getDeepValue_0 (ref)
        return l_getDeepValue_0(v56, "Profile.SocialLinks.selfSocialLinks") or {};
    end) else nil;
    local v58 = if v53 and v55 and l_Players_0.LocalPlayer then l_Players_0.LocalPlayer:GetUnder13() else false;
    v47 = "";
    local v59 = l_useLocalRobuxBalance_0();
    local v60 = v37.navigation.getParam("navigateToEditUsername");
    local function v61() --[[ Line: 102 ]]
        -- upvalues: v38 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v38(l_NavigateDown_0({
            {
                name = l_AppPage_0.PurchaseRobux
            }
        }));
    end;
    local v62, v63 = v6.useState(v47);
    l_useEffectOnMount_0(function() --[[ Line: 109 ]]
        -- upvalues: v38 (copy), v14 (ref), v39 (copy), v63 (copy)
        v38(v14.GetUserV2FromUserId.API(v39)):andThen(function(v64) --[[ Line: 111 ]]
            -- upvalues: v63 (ref)
            v63(v64.responseBody.description or "");
        end):catch(function() --[[ Line: 114 ]]
            -- upvalues: v63 (ref)
            v63("");
        end);
    end);
    local v65 = l_useAnalytics_0();
    local v66 = v37.navigation.getParam("onIdentityChange");
    local v68 = v6.useCallback(function(v67) --[[ Line: 122 ]]
        -- upvalues: v63 (copy), v66 (copy)
        v63(v67);
        if v66 then
            v66();
        end;
    end, {
        v63, 
        v66
    });
    local v70 = v6.useCallback(function(v69) --[[ Line: 129 ]]
        -- upvalues: v45 (copy), v66 (copy)
        v45(v69);
        if v66 then
            v66();
        end;
    end, {
        v45, 
        v66
    });
    local v72 = l_useUserExperiment_0({
        v28
    }, function(v71) --[[ Line: 136 ]]
        -- upvalues: v28 (ref)
        return (v71[v28] or {}).profile_picture_on;
    end);
    l_useEffectOnMount_0(function() --[[ Line: 141 ]]
        -- upvalues: v65 (copy), l_EventNames_0 (ref), v38 (copy), v14 (ref), v39 (copy), v45 (copy), v53 (copy), v55 (copy), v24 (ref)
        v65.fireAnalyticsEvent(l_EventNames_0.EditProfileOpened);
        v38(v14.GetDisplayNameValidation.API(v39, "Test")):andThen(function(_) --[[ Line: 146 ]]
            -- upvalues: v45 (ref)
            v45(true);
        end):catch(function(_) --[[ Line: 149 ]]

        end);
        if v53 and v55 then
            v38(v24.GetSelfSocialLinks.API({
                alwaysReturnUrls = false, 
                filterLink = false
            })):catch(function(_) --[[ Line: 153 ]]

            end);
        end;
    end);
    local v76 = v25.useOpenToast();
    local function v78(v77) --[[ Line: 160 ]] --[[ Name: showToast ]]
        -- upvalues: v76 (copy), l_Images_0 (ref)
        v76({
            toastTitle = v77, 
            iconImage = l_Images_0["icons/actions/accept"]
        });
    end;
    local v79 = v37.testProp_openEditProfilePicture or function() --[[ Line: 168 ]]
        -- upvalues: v65 (copy), l_EventNames_0 (ref), v38 (copy), l_NavigateToRoute_0 (ref), l_AppPage_0 (ref)
        v65.fireAnalyticsEvent(l_EventNames_0.OpenAvatarMarketplace);
        v38(l_NavigateToRoute_0({
            {
                name = l_AppPage_0.Catalog
            }
        }));
    end;
    local v80 = v7.Hooks.useUserProfilesFetch({
        userIds = {
            v39
        }, 
        query = v7.Queries.userProfilesDisplayNameAndUsernameByUserIds
    });
    if v80.data then
        v40 = v7.Selectors.getUsernameFromId(v80.data, v39);
        v41 = v7.Selectors.getDisplayNameFromId(v80.data, v39);
        v42 = false;
    end;
    v6.useEffect(function() --[[ Line: 187 ]]
        -- upvalues: v16 (ref), v65 (copy), l_EventNames_0 (ref), l_LoadingStages_0 (ref)
        local v81 = v16.Stopwatch.get(v16.Events.EditProfileOpened);
        v65.fireAnalyticsEvent(l_EventNames_0.EditProfileLoadingStage, {
            status = l_LoadingStages_0.Fetching, 
            statValue = v81 and v81.timeElapsed
        });
        return function() --[[ Line: 194 ]]
            -- upvalues: v16 (ref)
            v16.Stopwatch.stop(v16.Events.EditProfileOpened);
        end;
    end, {});
    l_useEffectOnce_0(function() --[[ Line: 199 ]]
        -- upvalues: v16 (ref), v65 (copy), l_EventNames_0 (ref), v80 (copy), l_LoadingStages_0 (ref)
        local v82 = v16.Stopwatch.get(v16.Events.EditProfileOpened);
        v65.fireAnalyticsEvent(l_EventNames_0.EditProfileLoadingStage, {
            status = if v80.data then l_LoadingStages_0.Done else l_LoadingStages_0.Failed, 
            statValue = v82 and v82.timeElapsed
        });
    end, v80.data or v80.error);
    local function v83() --[[ Line: 207 ]] --[[ Name: onClose ]]
        -- upvalues: v37 (copy)
        v37.navigation.pop();
    end;
    local function v84() --[[ Line: 211 ]] --[[ Name: openDisplayNameModal ]]
        -- upvalues: v65 (copy), l_EventNames_0 (ref), v44 (copy), v37 (copy), v43 (copy), v70 (copy), v41 (ref)
        if v65 then
            v65.fireAnalyticsEvent(l_EventNames_0.DisplayNameModalOpened);
        end;
        if v44 then
            v37.navigation.navigate(v43.EditDisplayNameModal, {
                setDisplayNameAvailable = v70, 
                displayName = v41
            });
            return;
        else
            v37.navigation.navigate(v43.EditDisplayNameErrorModal);
            return;
        end;
    end;
    local function v85() --[[ Line: 226 ]] --[[ Name: openEditUsername ]]
        -- upvalues: v65 (copy), l_EventNames_0 (ref), v59 (copy), v60 (copy), v78 (copy), v37 (copy), v43 (copy), v61 (copy)
        v65.fireAnalyticsEvent(l_EventNames_0.EditUsernameOpened);
        if v59 >= 1000 then
            v60(v78);
            return;
        else
            v37.navigation.navigate(v43.UsernameInsufficientFundsModal, {
                robux = 1000 - v59, 
                navigateDownToPurchaseRobux = v61
            });
            return;
        end;
    end;
    local function v86() --[[ Line: 240 ]] --[[ Name: openEditDescription ]]
        -- upvalues: v37 (copy), v43 (copy), v62 (copy), v68 (copy)
        v37.navigation.navigate(v43.EditDescriptionModal, {
            initialText = v62, 
            setDescription = v68
        });
    end;
    local function v88(v87) --[[ Line: 247 ]] --[[ Name: openEditSocialLinksModal ]]
        -- upvalues: v53 (copy), v38 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        if v53 then
            v38(l_NavigateDown_0({
                name = l_AppPage_0.EditSocialNetworks, 
                extraProps = {
                    focusOn = v87
                }
            }));
        end;
    end;
    if v29 then
        return (v30({
            onClose = v83
        }, {
            v6.createElement(v9, {
                shouldShimmerName = v42, 
                username = v40, 
                displayName = v41, 
                description = v62, 
                localUserId = v39, 
                onClose = v83, 
                openDisplayNameModal = v84, 
                navigateToEditUsername = v85, 
                openEditDescription = v86, 
                openEditProfilePicture = if not not v31 or v72 then v79 else nil, 
                socialInfo = if v53 and v55 then v57 else nil, 
                openEditSocialLinksModal = if v53 and v55 then v88 else nil, 
                isUnder13 = if v53 and v55 then v58 else nil, 
                canSeeInExperienceMode = if l_FFlagMoveInExperienceModeToEditProfile_0 then v49 ~= nil else false, 
                isInExperienceNameEnabled = if l_FFlagMoveInExperienceModeToEditProfile_0 then v50 else false, 
                inExperienceName = if l_FFlagMoveInExperienceModeToEditProfile_0 then v51 else nil, 
                inExperienceNameExpirationTime = if l_FFlagMoveInExperienceModeToEditProfile_0 then v52 else nil, 
                onToggleInExperienceMode = if l_FFlagMoveInExperienceModeToEditProfile_0 then v37.navigation.getParam("onToggleInExperienceMode") else nil, 
                profileScreens = if l_FFlagEditProfileBackgroundEnabled_0 then v43 else nil
            })
        }));
    else
        return v6.createElement(v9, {
            shouldShimmerName = v42, 
            username = v40, 
            displayName = v41, 
            description = v62, 
            localUserId = v39, 
            onClose = v83, 
            openDisplayNameModal = v84, 
            navigateToEditUsername = v85, 
            openEditDescription = v86, 
            openEditProfilePicture = if not not v31 or v72 then v79 else nil, 
            socialInfo = if v53 and v55 then v57 else nil, 
            openEditSocialLinksModal = if v53 and v55 then v88 else nil, 
            isUnder13 = if v53 and v55 then v58 else nil, 
            canSeeInExperienceMode = if l_FFlagMoveInExperienceModeToEditProfile_0 then v49 ~= nil else false, 
            isInExperienceNameEnabled = if l_FFlagMoveInExperienceModeToEditProfile_0 then v50 else false, 
            inExperienceName = if l_FFlagMoveInExperienceModeToEditProfile_0 then v51 else nil, 
            inExperienceNameExpirationTime = if l_FFlagMoveInExperienceModeToEditProfile_0 then v52 else nil, 
            onToggleInExperienceMode = if l_FFlagMoveInExperienceModeToEditProfile_0 then v37.navigation.getParam("onToggleInExperienceMode") else nil, 
            profileScreens = if l_FFlagEditProfileBackgroundEnabled_0 then v43 else nil
        });
    end;
end;