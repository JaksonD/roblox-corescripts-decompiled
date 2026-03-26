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
local function _(v29, v30, v31) --[[ Line: 69 ]]
    local v32 = v29.names.primaryName or "";
    if v30.profileUserNickname and v31 and v30.profileUserNickname ~= "" then
        return v30.profileUserNickname .. " (" .. v32 .. ")";
    else
        return v32;
    end;
end;
return function(v34) --[[ Line: 86 ]] --[[ Name: UserProfileHeaderContainer ]]
    -- upvalues: v21 (copy), l_useNavigation_0 (copy), l_useDispatch_0 (copy), v2 (copy), v18 (copy), l_FFlagFriendRequestNicknames_0 (copy), l_useAppPolicy_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy), v16 (copy), v20 (copy), v17 (copy), v19 (copy), l_FFlagEditProfileMigration_0 (copy), l_Enums_0 (copy), v15 (copy), v6 (copy), l_dependencyArray_0 (copy), l_useEffectOnce_0 (copy), v7 (copy), l_FFlagMoveInExperienceModeToEditProfile_0 (copy), v22 (copy)
    local v35 = v21();
    local v36 = l_useNavigation_0();
    local v37 = l_useDispatch_0();
    local v38 = v2.useRef(false);
    local v39 = v18();
    local l_profileId_0 = v35.profileId;
    local v42 = if l_FFlagFriendRequestNicknames_0 then l_useAppPolicy_0(function(v41) --[[ Line: 96 ]]
        return v41.getFriendRequestNicknamesEnabled();
    end) else false;
    local v43 = l_getRbxthumbWithTypeSizeAndOptions_0(l_profileId_0, l_Constants_0.RbxthumbTypes.Avatar, v16.AVATAR_THUMBNAIL_SIZE);
    local v44 = v20(v17.Components.UserProfileHeader);
    local v46 = v2.useCallback(function() --[[ Line: 109 ]]
        -- upvalues: v44 (copy), v17 (ref), v39 (copy), v19 (ref), v38 (copy), l_FFlagEditProfileMigration_0 (ref), v36 (copy), l_Enums_0 (ref), v15 (ref), l_profileId_0 (copy), v6 (ref)
        if not v44.editName then
            return;
        elseif v44.editName.field == v17.NameTypes.DisplayName then
            v39.fireAnalyticsEvent(v19.EditDisplayNameButton, {
                canSetDisplayName = v38.current
            });
            if v38.current then
                if l_FFlagEditProfileMigration_0 then
                    v36.navigate(l_Enums_0.Screens.EditProfileSubScreen, {
                        screen = l_Enums_0.Screens.EditDisplayName, 
                        initialDisplayName = v44.names.primaryName
                    });
                    return;
                else
                    v36.navigate(v17.Screens.EditDisplayNameModal, {
                        showToast = function() --[[ Line: 127 ]] --[[ Name: showToast ]]

                        end, 
                        setDisplayNameAvailable = function(v45) --[[ Line: 130 ]] --[[ Name: setDisplayNameAvailable ]]
                            -- upvalues: v38 (ref)
                            v38.current = v45;
                        end, 
                        displayName = v44.names.primaryName
                    });
                    return;
                end;
            else
                v36.navigate(v17.Screens.EditDisplayNameErrorModal);
                return;
            end;
        else
            v15.Stopwatch.start(v15.Events.CustomizeNameOpened);
            v39.fireAnalyticsEvent(v19.SetAliasButton);
            v36.navigate(v17.Screens.SetAliasModal, {
                profileUserId = l_profileId_0, 
                origin = v6.Analytics.EntryPoints.ProfileCardName
            });
            return;
        end;
    end, l_dependencyArray_0(v36, v44.editName, v44.names));
    l_useEffectOnce_0(function() --[[ Line: 149 ]]
        -- upvalues: v37 (copy), v7 (ref), l_profileId_0 (copy), v38 (copy)
        local function _() --[[ Line: 150 ]]
            -- upvalues: v37 (ref), v7 (ref), l_profileId_0 (ref)
            return v37(v7.GetDisplayNameValidation.API(l_profileId_0, "testName"));
        end;
        v37(v7.GetDisplayNameValidation.API(l_profileId_0, "testName")):andThen(function() --[[ Line: 155 ]]
            -- upvalues: v38 (ref)
            v38.current = true;
        end):catch(function() --[[ Line: 158 ]]
            -- upvalues: v38 (ref)
            v38.current = false;
        end);
    end, v44.editName and v44.editName.field == v17.NameTypes.DisplayName);
    local v48 = v44.counts ~= nil;
    local v49 = nil;
    local v50 = nil;
    if not l_FFlagMoveInExperienceModeToEditProfile_0 then
        v49 = v44.userProfileSettings ~= nil;
        if v49 then
            v50 = v44.userProfileSettings.isInExperienceNameEnabled;
        end;
    end;
    local l_createElement_0 = v2.createElement;
    local l_v22_0 = v22;
    local v53 = {
        userThumbnail = v43, 
        layoutOrder = v34.layoutOrder, 
        userId = tonumber(l_profileId_0), 
        openEditName = if v44.editName then v46 else nil
    };
    local v54 = v44.names.primaryName or "";
    v53.primaryName = if v35.profileUserNickname and v42 and v35.profileUserNickname ~= "" then v35.profileUserNickname .. " (" .. v54 .. ")" else v54;
    v53.username = v44.names.username;
    v53.isPremium = v44.isPremium;
    v53.isVerified = v44.isVerified;
    v53.isRobloxAdmin = v44.isRobloxAdmin;
    v53.isEdited = v44.editName and v44.editName.isEdited;
    v53.shouldDisplayUserProfileSettings = if l_FFlagMoveInExperienceModeToEditProfile_0 then nil else v49;
    v53.isInExperienceNameEnabled = if l_FFlagMoveInExperienceModeToEditProfile_0 then nil else v50;
    v53.shouldDisplayCounts = v48;
    return l_createElement_0(l_v22_0, v53);
end;