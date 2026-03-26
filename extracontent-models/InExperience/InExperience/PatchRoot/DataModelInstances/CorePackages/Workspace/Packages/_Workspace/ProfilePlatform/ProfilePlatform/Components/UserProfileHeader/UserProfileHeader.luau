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
local l_FFlagMoveInExperienceModeToEditProfile_0 = require(l_Parent_0.SharedFlags).FFlagMoveInExperienceModeToEditProfile;
local v14 = game:DefineFastFlag("DisableStreamerModeToggle", false);
local l_FFlagProfilePlatformNewProfileHeader_0 = v3.FFlagProfilePlatformNewProfileHeader;
local l_FFlagSwitchProfileWidthHookToSocialCommon_0 = v3.FFlagSwitchProfileWidthHookToSocialCommon;
local v17 = require(l_script_FirstAncestor_0.Contexts.ProfileScrollContext.useProfileScrollContext);
local v18 = require(l_script_FirstAncestor_0.Hooks.useProfileFormFactor);
local v19 = require(l_script_FirstAncestor_0.Hooks.useProfileCardWidth);
local l_useProfileCardWidth_0 = require(l_Parent_0.ProfilePlatformCommon).Hooks.useProfileCardWidth;
local v21 = require(l_script_FirstAncestor_0.Hooks.useShouldShowContextualInformation);
local v22 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v23 = require(l_script_FirstAncestor_0.Rodux.Presence);
local v24 = require(l_script_FirstAncestor_0.Utils.convertPresenceEnum);
local v25 = require(l_Parent_0.RoactUtils);
local l_useSelector_0 = v25.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v25.Hooks.RoactRodux.useDispatch;
local l_useEffectOnMount_0 = v25.Hooks.useEffectOnMount;
local v29 = require(l_script_FirstAncestor_0.Networking.NetworkingPresence);
local function _(v30) --[[ Line: 40 ]] --[[ Name: easeInOutCubic ]]
    v30 = math.max(0, (math.min(1, v30)));
    return v30 * 3 * v30 - v30 * 2 * v30 * v30;
end;
return function(v32) --[[ Line: 62 ]] --[[ Name: UserProfileHeader ]]
    -- upvalues: l_FFlagProfilePlatformNewProfileHeader_0 (copy), v17 (copy), v18 (copy), v6 (copy), l_FFlagSwitchProfileWidthHookToSocialCommon_0 (copy), l_useProfileCardWidth_0 (copy), v19 (copy), v22 (copy), l_useDispatch_0 (copy), l_useEffectOnMount_0 (copy), v29 (copy), l_useSelector_0 (copy), v23 (copy), v24 (copy), v21 (copy), v2 (copy), l_View_0 (copy), v10 (copy), v12 (copy), v8 (copy), l_SocialChipCountsRowContainer_0 (copy), v5 (copy), v7 (copy), l_FFlagMoveInExperienceModeToEditProfile_0 (copy), v14 (copy), v11 (copy)
    local l_userThumbnail_0 = v32.userThumbnail;
    local v34 = nil;
    local v35 = nil;
    local v36 = false;
    local v37 = nil;
    if l_FFlagProfilePlatformNewProfileHeader_0 then
        local v38 = v17();
        local v39 = v38 and v38.peekViewOpenPercent or 0;
        v34 = v18().formFactor == v6.ProfileFormFactor.PeekView;
        local v40 = v18().formFactor == v6.ProfileFormFactor.Wide;
        local v41 = if l_FFlagSwitchProfileWidthHookToSocialCommon_0 then l_useProfileCardWidth_0() else v19(v40);
        local l_profileId_0 = v22().profileId;
        local v43 = l_useDispatch_0();
        l_useEffectOnMount_0(function() --[[ Line: 85 ]]
            -- upvalues: v43 (copy), v29 (ref), l_profileId_0 (copy)
            v43(v29.GetPresencesFromUserIds.API({
                l_profileId_0
            })):catch(function(_) --[[ Line: 86 ]]

            end);
        end);
        local v46 = l_useSelector_0(function(v45) --[[ Line: 89 ]]
            -- upvalues: v23 (ref), l_profileId_0 (copy)
            return v23.Selectors.getUserPresenceByUserId(v45, l_profileId_0) or {
                userPresenceType = v23.Enums.PresenceType.Offline, 
                lastLocation = ""
            };
        end);
        v37 = v24(v46.userPresenceType, v46.universeId);
        v36 = v21(v37);
        local v47 = v41 * 0.75;
        local v48 = math.max(0, (math.min(1, v39)));
        local v49 = v48 * 3 * v48 - v48 * 2 * v48 * v48;
        v35 = if v40 then v41 else v47 + (v41 - v47) * v49;
    end;
    if l_FFlagProfilePlatformNewProfileHeader_0 then
        return v2.createElement(l_View_0, {
            tag = "size-full-0 auto-y col gap-large", 
            BackgroundTransparency = 1, 
            LayoutOrder = v32.layoutOrder
        }, {
            UserProfileAvatar = v2.createElement(v10, {
                userThumbnail = l_userThumbnail_0, 
                userId = v32.userId, 
                isPeekView = v34, 
                height = v35, 
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
                    userId = tostring(v32.userId), 
                    primaryName = v32.primaryName, 
                    username = v32.username, 
                    userPresenceType = v37, 
                    isPremium = v32.isPremium, 
                    isVerified = v32.isVerified, 
                    isRobloxAdmin = v32.isRobloxAdmin
                })
            }), 
            ContextualInformation = if v36 then v2.createElement(v8, {
                size = UDim2.fromScale(1, 0), 
                layoutOrder = 3
            }) else nil, 
            SocialCountsRow = if v32.shouldDisplayCounts then v2.createElement(l_SocialChipCountsRowContainer_0, {
                size = UDim2.fromScale(1, 0), 
                layoutOrder = 4
            }) else nil
        });
    else
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v5.USER_PROFILE_HEADER_HEIGHT), 
            BackgroundTransparency = 1, 
            LayoutOrder = v32.layoutOrder
        }, {
            UserProfileAvatar = v2.createElement(v10, {
                userThumbnail = l_userThumbnail_0, 
                userId = v32.userId
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
                    primaryName = v32.primaryName, 
                    username = v32.username, 
                    isPremium = v32.isPremium, 
                    isVerified = v32.isVerified, 
                    isRobloxAdmin = v32.isRobloxAdmin, 
                    isEdited = v32.isEdited, 
                    openEditName = v32.openEditName
                }), 
                UserProfileSettingsToggle = if not (not not l_FFlagMoveInExperienceModeToEditProfile_0 or v14) and v32.shouldDisplayUserProfileSettings then v2.createElement(v11, {
                    size = UDim2.new(1, 0, 0, 30), 
                    layoutOrder = 2, 
                    isInExperienceNameEnabled = v32.isInExperienceNameEnabled
                }) else nil, 
                ContextualInformation = v2.createElement(v8, {
                    size = UDim2.fromScale(1, 0), 
                    layoutOrder = l_FFlagMoveInExperienceModeToEditProfile_0 and 2 or 3
                }), 
                SocialCountsRow = if v32.shouldDisplayCounts then v2.createElement(l_SocialChipCountsRowContainer_0, {
                    size = UDim2.fromScale(1, 0), 
                    layoutOrder = l_FFlagMoveInExperienceModeToEditProfile_0 and 3 or 4
                }) else nil
            })
        });
    end;
end;