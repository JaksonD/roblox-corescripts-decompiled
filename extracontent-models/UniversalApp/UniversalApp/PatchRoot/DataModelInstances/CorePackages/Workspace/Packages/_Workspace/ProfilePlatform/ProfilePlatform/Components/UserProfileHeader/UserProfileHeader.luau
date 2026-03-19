local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SharedFlags);
local l_View_0 = require(l_Parent_0.Foundation).View;
local v5 = require(l_script_FirstAncestor_0.Common.Constants);
local v6 = require(l_script_FirstAncestor_0.Common.Enums);
local v7 = require(l_script_FirstAncestor_0.Components.UserProfileHeader.SocialIdentityContainer);
local v8 = require(l_script_FirstAncestor_0.Components.UserProfileHeader.ContextualInformation);
local l_SocialChipCountsRowContainer_0 = require(l_script_FirstAncestor_0.Components.UserProfileHeader.SocialChipCountsRow).SocialChipCountsRowContainer;
local v10 = require(l_script_FirstAncestor_0.Components.UserProfileHeader.UserProfileAvatar);
local v11 = require(l_script_FirstAncestor_0.Components.UserProfileHeader.UserProfileSettingsToggle);
local v12 = require(l_script_FirstAncestor_0.Components.UserProfileHeader.AvatarHeadshotComponent);
local v13 = require(l_script_FirstAncestor_0.Flags.FFlagPPVBackgroundEnabled);
local l_FFlagMoveInExperienceModeToEditProfile_0 = require(l_Parent_0.SharedFlags).FFlagMoveInExperienceModeToEditProfile;
local v15 = game:DefineFastFlag("DisableStreamerModeToggle", false);
local l_FFlagProfilePlatformNewProfileHeader_0 = v3.FFlagProfilePlatformNewProfileHeader;
local l_FFlagSwitchProfileWidthHookToSocialCommon_0 = v3.FFlagSwitchProfileWidthHookToSocialCommon;
local v18 = require(l_script_FirstAncestor_0.Contexts.ProfileScrollContext.useProfileScrollContext);
local v19 = require(l_script_FirstAncestor_0.Hooks.useProfileFormFactor);
local v20 = require(l_script_FirstAncestor_0.Hooks.useProfileCardWidth);
local l_useProfileCardWidth_0 = require(l_Parent_0.ProfilePlatformCommon).Hooks.useProfileCardWidth;
local v22 = require(l_script_FirstAncestor_0.Hooks.useShouldShowContextualInformation);
local v23 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v24 = require(l_script_FirstAncestor_0.Rodux.Presence);
local v25 = require(l_script_FirstAncestor_0.Utils.convertPresenceEnum);
local v26 = require(l_Parent_0.RoactUtils);
local l_useSelector_0 = v26.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v26.Hooks.RoactRodux.useDispatch;
local l_useEffectOnMount_0 = v26.Hooks.useEffectOnMount;
local v30 = require(l_script_FirstAncestor_0.Networking.NetworkingPresence);
local function _(v31) --[[ Line: 41 ]] --[[ Name: easeInOutCubic ]]
    v31 = math.max(0, (math.min(1, v31)));
    return v31 * 3 * v31 - v31 * 2 * v31 * v31;
end;
return function(v33) --[[ Line: 63 ]] --[[ Name: UserProfileHeader ]]
    -- upvalues: l_FFlagProfilePlatformNewProfileHeader_0 (copy), v18 (copy), v19 (copy), v6 (copy), l_FFlagSwitchProfileWidthHookToSocialCommon_0 (copy), l_useProfileCardWidth_0 (copy), v20 (copy), v23 (copy), l_useDispatch_0 (copy), l_useEffectOnMount_0 (copy), v30 (copy), l_useSelector_0 (copy), v24 (copy), v25 (copy), v22 (copy), v2 (copy), l_View_0 (copy), v10 (copy), v13 (copy), v12 (copy), v8 (copy), l_SocialChipCountsRowContainer_0 (copy), v5 (copy), v7 (copy), l_FFlagMoveInExperienceModeToEditProfile_0 (copy), v15 (copy), v11 (copy)
    local l_userThumbnail_0 = v33.userThumbnail;
    local v35 = nil;
    local v36 = nil;
    local v37 = false;
    local v38 = nil;
    if l_FFlagProfilePlatformNewProfileHeader_0 then
        local v39 = v18();
        local v40 = v39 and v39.peekViewOpenPercent or 0;
        v35 = v19().formFactor == v6.ProfileFormFactor.PeekView;
        local v41 = v19().formFactor == v6.ProfileFormFactor.Wide;
        local v42 = if l_FFlagSwitchProfileWidthHookToSocialCommon_0 then l_useProfileCardWidth_0() else v20(v41);
        local l_profileId_0 = v23().profileId;
        local v44 = l_useDispatch_0();
        l_useEffectOnMount_0(function() --[[ Line: 86 ]]
            -- upvalues: v44 (copy), v30 (ref), l_profileId_0 (copy)
            v44(v30.GetPresencesFromUserIds.API({
                l_profileId_0
            })):catch(function(_) --[[ Line: 87 ]]

            end);
        end);
        local v47 = l_useSelector_0(function(v46) --[[ Line: 90 ]]
            -- upvalues: v24 (ref), l_profileId_0 (copy)
            return v24.Selectors.getUserPresenceByUserId(v46, l_profileId_0) or {
                userPresenceType = v24.Enums.PresenceType.Offline, 
                lastLocation = ""
            };
        end);
        v38 = v25(v47.userPresenceType, v47.universeId);
        v37 = v22(v38);
        local v48 = v42 * 0.75;
        local v49 = math.max(0, (math.min(1, v40)));
        local v50 = v49 * 3 * v49 - v49 * 2 * v49 * v49;
        v36 = if v41 then v42 else v48 + (v42 - v48) * v50;
    end;
    if l_FFlagProfilePlatformNewProfileHeader_0 then
        return v2.createElement(l_View_0, {
            tag = "size-full-0 auto-y col gap-large", 
            BackgroundTransparency = 1, 
            LayoutOrder = v33.layoutOrder
        }, {
            UserProfileAvatar = v2.createElement(v10, {
                userThumbnail = l_userThumbnail_0, 
                userId = if v13 then v33.userId else nil, 
                isPeekView = v35, 
                height = v36, 
                layoutOrder = 1
            }), 
            AvatarHeadshotContainer = v2.createElement(l_View_0, {
                tag = {
                    ["size-full-0 auto-y"] = true
                }, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                AvatarHeadshotComponent = v2.createElement(v12, {
                    layoutOrder = 1, 
                    userId = tostring(v33.userId), 
                    primaryName = v33.primaryName, 
                    username = v33.username, 
                    userPresenceType = v38, 
                    isPremium = v33.isPremium, 
                    isVerified = v33.isVerified, 
                    isRobloxAdmin = v33.isRobloxAdmin
                })
            }), 
            ContextualInformation = if v37 then v2.createElement(v8, {
                size = UDim2.fromScale(1, 0), 
                layoutOrder = 3
            }) else nil, 
            SocialCountsRow = if v33.shouldDisplayCounts then v2.createElement(l_SocialChipCountsRowContainer_0, {
                size = UDim2.fromScale(1, 0), 
                layoutOrder = 4
            }) else nil
        });
    else
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v5.USER_PROFILE_HEADER_HEIGHT), 
            BackgroundTransparency = 1, 
            LayoutOrder = v33.layoutOrder
        }, {
            UserProfileAvatar = v2.createElement(v10, {
                userThumbnail = l_userThumbnail_0, 
                userId = if v13 then v33.userId else nil
            }), 
            ProfileTextFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Position = UDim2.new(0, 0, 1, 0), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = 1, 
                ZIndex = 10
            }, {
                UIListLayoutOrder = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, 8)
                }), 
                SocialIdentity = v2.createElement(v7, {
                    size = UDim2.fromScale(1, 0), 
                    layoutOrder = 1, 
                    primaryName = v33.primaryName, 
                    username = v33.username, 
                    isPremium = v33.isPremium, 
                    isVerified = v33.isVerified, 
                    isRobloxAdmin = v33.isRobloxAdmin, 
                    isEdited = v33.isEdited, 
                    openEditName = v33.openEditName
                }), 
                UserProfileSettingsToggle = if not (not not l_FFlagMoveInExperienceModeToEditProfile_0 or v15) and v33.shouldDisplayUserProfileSettings then v2.createElement(v11, {
                    size = UDim2.new(1, 0, 0, 30), 
                    layoutOrder = 2, 
                    isInExperienceNameEnabled = v33.isInExperienceNameEnabled
                }) else nil, 
                ContextualInformation = v2.createElement(v8, {
                    size = UDim2.fromScale(1, 0), 
                    layoutOrder = l_FFlagMoveInExperienceModeToEditProfile_0 and 2 or 3
                }), 
                SocialCountsRow = if v33.shouldDisplayCounts then v2.createElement(l_SocialChipCountsRowContainer_0, {
                    size = UDim2.fromScale(1, 0), 
                    layoutOrder = l_FFlagMoveInExperienceModeToEditProfile_0 and 3 or 4
                }) else nil
            })
        });
    end;
end;