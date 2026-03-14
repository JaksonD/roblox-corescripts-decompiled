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
local v26 = require(l_script_FirstAncestor_0.Flags.FFlagPPVBackgroundEnabled);
local l_FFlagProfilePlatformNewProfileHeader_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformNewProfileHeader;
local v28 = require(l_Parent_0.EditProfile);
local l_Enums_0 = v28.Enums;
local l_FFlagEditProfileMigration_0 = v28.Flags.FFlagEditProfileMigration;
local function _(v31, v32, v33) --[[ Line: 71 ]]
    local v34 = v31.names.primaryName or "";
    if v32.profileUserNickname and v33 and v32.profileUserNickname ~= "" then
        return v32.profileUserNickname .. " (" .. v34 .. ")";
    else
        return v34;
    end;
end;
return function(v36) --[[ Line: 88 ]] --[[ Name: UserProfileHeaderContainer ]]
    -- upvalues: v21 (copy), l_useNavigation_0 (copy), l_useDispatch_0 (copy), v2 (copy), v18 (copy), l_FFlagFriendRequestNicknames_0 (copy), l_useAppPolicy_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy), v16 (copy), v20 (copy), v17 (copy), v19 (copy), l_FFlagEditProfileMigration_0 (copy), l_Enums_0 (copy), v15 (copy), v6 (copy), l_dependencyArray_0 (copy), l_useEffectOnce_0 (copy), v7 (copy), l_FFlagMoveInExperienceModeToEditProfile_0 (copy), v22 (copy), v26 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy)
    local v37 = v21();
    local v38 = l_useNavigation_0();
    local v39 = l_useDispatch_0();
    local v40 = v2.useRef(false);
    local v41 = v18();
    local l_profileId_0 = v37.profileId;
    local v44 = if l_FFlagFriendRequestNicknames_0 then l_useAppPolicy_0(function(v43) --[[ Line: 98 ]]
        return v43.getFriendRequestNicknamesEnabled();
    end) else false;
    local v45 = l_getRbxthumbWithTypeSizeAndOptions_0(l_profileId_0, l_Constants_0.RbxthumbTypes.Avatar, v16.AVATAR_THUMBNAIL_SIZE);
    local v46 = v20(v17.Components.UserProfileHeader);
    local v48 = v2.useCallback(function() --[[ Line: 111 ]]
        -- upvalues: v46 (copy), v17 (ref), v41 (copy), v19 (ref), v40 (copy), l_FFlagEditProfileMigration_0 (ref), v38 (copy), l_Enums_0 (ref), v15 (ref), l_profileId_0 (copy), v6 (ref)
        if not v46.editName then
            return;
        elseif v46.editName.field == v17.NameTypes.DisplayName then
            v41.fireAnalyticsEvent(v19.EditDisplayNameButton, {
                canSetDisplayName = v40.current
            });
            if v40.current then
                if l_FFlagEditProfileMigration_0 then
                    v38.navigate(l_Enums_0.Screens.EditProfileSubScreen, {
                        screen = l_Enums_0.Screens.EditDisplayName, 
                        initialDisplayName = v46.names.primaryName
                    });
                    return;
                else
                    v38.navigate(v17.Screens.EditDisplayNameModal, {
                        showToast = function() --[[ Line: 129 ]] --[[ Name: showToast ]]

                        end, 
                        setDisplayNameAvailable = function(v47) --[[ Line: 132 ]] --[[ Name: setDisplayNameAvailable ]]
                            -- upvalues: v40 (ref)
                            v40.current = v47;
                        end, 
                        displayName = v46.names.primaryName
                    });
                    return;
                end;
            else
                v38.navigate(v17.Screens.EditDisplayNameErrorModal);
                return;
            end;
        else
            v15.Stopwatch.start(v15.Events.CustomizeNameOpened);
            v41.fireAnalyticsEvent(v19.SetAliasButton);
            v38.navigate(v17.Screens.SetAliasModal, {
                profileUserId = l_profileId_0, 
                origin = v6.Analytics.EntryPoints.ProfileCardName
            });
            return;
        end;
    end, l_dependencyArray_0(v38, v46.editName, v46.names));
    l_useEffectOnce_0(function() --[[ Line: 151 ]]
        -- upvalues: v39 (copy), v7 (ref), l_profileId_0 (copy), v40 (copy)
        local function _() --[[ Line: 152 ]]
            -- upvalues: v39 (ref), v7 (ref), l_profileId_0 (ref)
            return v39(v7.GetDisplayNameValidation.API(l_profileId_0, "testName"));
        end;
        v39(v7.GetDisplayNameValidation.API(l_profileId_0, "testName")):andThen(function() --[[ Line: 157 ]]
            -- upvalues: v40 (ref)
            v40.current = true;
        end):catch(function() --[[ Line: 160 ]]
            -- upvalues: v40 (ref)
            v40.current = false;
        end);
    end, v46.editName and v46.editName.field == v17.NameTypes.DisplayName);
    local v50 = v46.counts ~= nil;
    local v51 = nil;
    local v52 = nil;
    if not l_FFlagMoveInExperienceModeToEditProfile_0 then
        v51 = v46.userProfileSettings ~= nil;
        if v51 then
            v52 = v46.userProfileSettings.isInExperienceNameEnabled;
        end;
    end;
    local l_createElement_0 = v2.createElement;
    local l_v22_0 = v22;
    local v55 = {
        userThumbnail = v45, 
        layoutOrder = v36.layoutOrder, 
        userId = if not not v26 or l_FFlagProfilePlatformNewProfileHeader_0 then tonumber(l_profileId_0) else nil, 
        openEditName = if v46.editName then v48 else nil
    };
    local v56 = v46.names.primaryName or "";
    v55.primaryName = if v37.profileUserNickname and v44 and v37.profileUserNickname ~= "" then v37.profileUserNickname .. " (" .. v56 .. ")" else v56;
    v55.username = v46.names.username;
    v55.isPremium = v46.isPremium;
    v55.isVerified = v46.isVerified;
    v55.isRobloxAdmin = v46.isRobloxAdmin;
    v55.isEdited = v46.editName and v46.editName.isEdited;
    v55.shouldDisplayUserProfileSettings = if l_FFlagMoveInExperienceModeToEditProfile_0 then nil else v51;
    v55.isInExperienceNameEnabled = if l_FFlagMoveInExperienceModeToEditProfile_0 then nil else v52;
    v55.shouldDisplayCounts = v50;
    return l_createElement_0(l_v22_0, v55);
end;