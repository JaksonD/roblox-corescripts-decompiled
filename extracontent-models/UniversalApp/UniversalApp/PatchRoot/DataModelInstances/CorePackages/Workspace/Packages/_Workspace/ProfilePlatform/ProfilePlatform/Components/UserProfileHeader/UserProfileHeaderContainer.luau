local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UserLib);
local v4 = require(l_Parent_0.Navigation);
local v5 = require(l_Parent_0.RoactUtils);
local v6 = require(l_Parent_0.SetAlias);
local v7 = require(l_script_FirstAncestor_0.Networking.NetworkingUsers);
local l_useEffectOnce_0 = v5.Hooks.useEffectOnce;
local l_Constants_0 = v3.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v3.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_useNavigation_0 = v4.useNavigation;
local _ = require(l_script_FirstAncestor_0.Contexts.ProfileWrapperContext);
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_dependencyArray_0 = v5.Hooks.dependencyArray;
local v15 = require(l_Parent_0.SocialStopwatch);
local v16 = require(l_script_FirstAncestor_0.Common.Constants);
local v17 = require(l_script_FirstAncestor_0.Common.Enums);
local v18 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v19 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v20 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v21 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v22 = require(l_script_FirstAncestor_0.Components.UserProfileHeader.UserProfileHeader);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_FFlagFriendRequestNicknames_0 = require(l_Parent_0.SharedFlags).FFlagFriendRequestNicknames;
local l_FFlagMoveInExperienceModeToEditProfile_0 = require(l_Parent_0.SharedFlags).FFlagMoveInExperienceModeToEditProfile;
local v26 = require(l_Parent_0.EditProfile);
local l_Enums_0 = v26.Enums;
local l_FFlagEditProfileMigration_0 = v26.Flags.FFlagEditProfileMigration;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local function _(v30, v31, v32) --[[ Line: 71 ]]
    local v33 = v30.names.primaryName or "";
    if v31.profileUserNickname and v32 and v31.profileUserNickname ~= "" then
        return v31.profileUserNickname .. " (" .. v33 .. ")";
    else
        return v33;
    end;
end;
return function(v35) --[[ Line: 88 ]] --[[ Name: UserProfileHeaderContainer ]]
    -- upvalues: v21 (copy), l_useNavigation_0 (copy), l_useDispatch_0 (copy), v2 (copy), v18 (copy), l_FFlagFriendRequestNicknames_0 (copy), l_useAppPolicy_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy), v16 (copy), v20 (copy), v17 (copy), v19 (copy), l_FFlagEditProfileMigration_0 (copy), l_Enums_0 (copy), v15 (copy), v6 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useEffectOnce_0 (copy), v7 (copy), l_FFlagMoveInExperienceModeToEditProfile_0 (copy), v22 (copy)
    local v36 = v21();
    local v37 = l_useNavigation_0();
    local v38 = l_useDispatch_0();
    local v39 = v2.useRef(false);
    local v40 = v18();
    local l_profileId_0 = v36.profileId;
    local v43 = if l_FFlagFriendRequestNicknames_0 then l_useAppPolicy_0(function(v42) --[[ Line: 98 ]]
        return v42.getFriendRequestNicknamesEnabled();
    end) else false;
    local v44 = l_getRbxthumbWithTypeSizeAndOptions_0(l_profileId_0, l_Constants_0.RbxthumbTypes.Avatar, v16.AVATAR_THUMBNAIL_SIZE);
    local v45 = v20(v17.Components.UserProfileHeader);
    local v47 = v2.useCallback(function() --[[ Line: 112 ]]
        -- upvalues: v45 (copy), v17 (ref), v40 (copy), v19 (ref), v39 (copy), l_FFlagEditProfileMigration_0 (ref), v37 (copy), l_Enums_0 (ref), v15 (ref), l_profileId_0 (copy), v6 (ref)
        if not v45.editName then
            return;
        elseif v45.editName.field == v17.NameTypes.DisplayName then
            v40.fireAnalyticsEvent(v19.EditDisplayNameButton, {
                canSetDisplayName = v39.current
            });
            if v39.current then
                if l_FFlagEditProfileMigration_0 then
                    v37.navigate(l_Enums_0.Screens.EditProfileSubScreen, {
                        screen = l_Enums_0.Screens.EditDisplayName, 
                        initialDisplayName = v45.names.primaryName
                    });
                    return;
                else
                    v37.navigate(v17.Screens.EditDisplayNameModal, {
                        showToast = function() --[[ Line: 130 ]] --[[ Name: showToast ]]

                        end, 
                        setDisplayNameAvailable = function(v46) --[[ Line: 133 ]] --[[ Name: setDisplayNameAvailable ]]
                            -- upvalues: v39 (ref)
                            v39.current = v46;
                        end, 
                        displayName = v45.names.primaryName
                    });
                    return;
                end;
            else
                v37.navigate(v17.Screens.EditDisplayNameErrorModal);
                return;
            end;
        else
            v15.Stopwatch.start(v15.Events.CustomizeNameOpened);
            v40.fireAnalyticsEvent(v19.SetAliasButton);
            v37.navigate(v17.Screens.SetAliasModal, {
                profileUserId = l_profileId_0, 
                origin = v6.Analytics.EntryPoints.ProfileCardName
            });
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v37, 
        v45.editName, 
        v45.names
    } else l_dependencyArray_0(v37, v45.editName, v45.names));
    l_useEffectOnce_0(function() --[[ Line: 156 ]]
        -- upvalues: v38 (copy), v7 (ref), l_profileId_0 (copy), v39 (copy)
        local function _() --[[ Line: 157 ]]
            -- upvalues: v38 (ref), v7 (ref), l_profileId_0 (ref)
            return v38(v7.GetDisplayNameValidation.API(l_profileId_0, "testName"));
        end;
        v38(v7.GetDisplayNameValidation.API(l_profileId_0, "testName")):andThen(function() --[[ Line: 162 ]]
            -- upvalues: v39 (ref)
            v39.current = true;
        end):catch(function() --[[ Line: 165 ]]
            -- upvalues: v39 (ref)
            v39.current = false;
        end);
    end, v45.editName and v45.editName.field == v17.NameTypes.DisplayName);
    local v49 = v45.counts ~= nil;
    local v50 = nil;
    local v51 = nil;
    if not l_FFlagMoveInExperienceModeToEditProfile_0 then
        v50 = v45.userProfileSettings ~= nil;
        if v50 then
            v51 = v45.userProfileSettings.isInExperienceNameEnabled;
        end;
    end;
    local l_createElement_0 = v2.createElement;
    local l_v22_0 = v22;
    local v54 = {
        userThumbnail = v44, 
        layoutOrder = v35.layoutOrder, 
        userId = tonumber(l_profileId_0), 
        openEditName = if v45.editName then v47 else nil
    };
    local v55 = v45.names.primaryName or "";
    v54.primaryName = if v36.profileUserNickname and v43 and v36.profileUserNickname ~= "" then v36.profileUserNickname .. " (" .. v55 .. ")" else v55;
    v54.username = v45.names.username;
    v54.isPremium = v45.isPremium;
    v54.isVerified = v45.isVerified;
    v54.isRobloxAdmin = v45.isRobloxAdmin;
    v54.isEdited = v45.editName and v45.editName.isEdited;
    v54.shouldDisplayUserProfileSettings = if l_FFlagMoveInExperienceModeToEditProfile_0 then nil else v50;
    v54.isInExperienceNameEnabled = if l_FFlagMoveInExperienceModeToEditProfile_0 then nil else v51;
    v54.shouldDisplayCounts = v49;
    return l_createElement_0(l_v22_0, v54);
end;