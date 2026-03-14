local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.UIBlox);
local l_HorizontalPageMargin_0 = v3.App.Container.HorizontalPageMargin;
local v5 = require(l_Parent_0.React);
local l_useStyle_0 = v3.Core.Style.useStyle;
local v7 = require(l_Parent_0.UserLib);
local l_Constants_0 = v7.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v7.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_View_0 = require(l_Parent_0.Foundation).View;
local v11 = require(l_Parent_0.SharedFlags);
local v12 = require(l_script_FirstAncestor_0.Common.Constants);
local v13 = require(l_script_FirstAncestor_0.Common.Enums);
local v14 = require(l_script_FirstAncestor_0.Components.UserProfileHeader.UserProfileAvatar);
local v15 = require(l_script_FirstAncestor_0.Components.ProfileActionBar.ProfileActionBar);
local v16 = require(l_script_FirstAncestor_0.Components.UserProfileHeader.ContextualInformation.ContextualPresence);
local v17 = require(l_script_FirstAncestor_0.Hooks.useProfileActions);
local v18 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v19 = require(l_script_FirstAncestor_0.Utils.getPeekViewOpenHeightByProfileType);
local v20 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformImproveLoadingPage);
local v21 = require(l_script_FirstAncestor_0.Flags.FFlagPPVBackgroundEnabled);
local l_FFlagProfilePlatformNewProfileHeader_0 = v11.FFlagProfilePlatformNewProfileHeader;
local v23 = require(l_script_FirstAncestor_0.Hooks.useProfileFormFactor);
local v24 = require(l_script_FirstAncestor_0.Hooks.useProfileCardWidth);
local l_useProfileCardWidth_0 = require(l_Parent_0.ProfilePlatformCommon).Hooks.useProfileCardWidth;
local l_FFlagSwitchProfileWidthHookToSocialCommon_0 = v11.FFlagSwitchProfileWidthHookToSocialCommon;
return function() --[[ Line: 37 ]] --[[ Name: ProfilePlatformLoadingPage ]]
    -- upvalues: l_useStyle_0 (copy), v18 (copy), v17 (copy), v13 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy), v23 (copy), l_FFlagSwitchProfileWidthHookToSocialCommon_0 (copy), l_useProfileCardWidth_0 (copy), v24 (copy), v5 (copy), v20 (copy), v2 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy), v12 (copy), v19 (copy), l_View_0 (copy), v14 (copy), v21 (copy), l_HorizontalPageMargin_0 (copy), v16 (copy), v15 (copy)
    local v27 = l_useStyle_0();
    local v28 = v18();
    local l_profileType_0 = v28.profileType;
    local l_profileId_0 = v28.profileId;
    local v31 = v17(v13.ButtonSurface.Actions);
    local v32 = nil;
    local v33 = nil;
    if l_FFlagProfilePlatformNewProfileHeader_0 then
        v33 = v23().formFactor == v13.ProfileFormFactor.Wide;
        local v34 = if l_FFlagSwitchProfileWidthHookToSocialCommon_0 then l_useProfileCardWidth_0() else v24(v33);
        v32 = if v33 then v34 else 334;
    end;
    local v35 = v5.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v20 (ref), v2 (ref), v31 (copy), v13 (ref)
        if v20 then
            return {
                primary = {
                    (v2.Dictionary.union(v31[v13.ProfileActions.JoinExperience], {
                        isDisabled = false
                    }))
                }
            };
        else
            return {
                primary = v31[v13.ProfileActions.JoinExperience]
            };
        end;
    end, {
        v31
    });
    local v36 = l_getRbxthumbWithTypeSizeAndOptions_0(l_profileId_0, l_Constants_0.RbxthumbTypes.Avatar, v12.AVATAR_THUMBNAIL_SIZE);
    return v5.createElement("Frame", {
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 0, v19(l_profileType_0)), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BorderSizePixel = 0, 
        BackgroundTransparency = v27.Theme.BackgroundDefault.Transparency, 
        BackgroundColor3 = v27.Theme.BackgroundDefault.Color
    }, {
        Layout = v5.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, v12.PAGE_PADDING)
        }), 
        UserProfileHeaderLoading = if l_FFlagProfilePlatformNewProfileHeader_0 then v5.createElement(l_View_0, {
            tag = "size-full-0 auto-y col", 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            UserProfileAvatar = v5.createElement(v14, {
                userThumbnail = v36, 
                userId = if v21 then tonumber(l_profileId_0) else nil, 
                isPeekView = not v33, 
                height = v32, 
                layoutOrder = 1
            }), 
            AvatarHeadshotComponent = v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v12.AVATAR_HEADSHOT_HEIGHT), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }), 
            SocialCountsRow = v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v12.SOCIAL_ROW_HEIGHT), 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            })
        }) else v5.createElement("Frame", {
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, v12.USER_PROFILE_HEADER_HEIGHT), 
            BackgroundTransparency = 1
        }, {
            UserProfileAvatar = v5.createElement(v14, {
                userId = if v21 then tonumber(l_profileId_0) else nil, 
                userThumbnail = v36
            }), 
            ProfileTextFrame = v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Position = UDim2.new(0, 0, 1, 0), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = 1, 
                ZIndex = 10
            }, {
                Padding = v5.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, v12.FOLLOWERS_ROW_HEIGHT)
                }), 
                ContextualInformation = v5.createElement(l_HorizontalPageMargin_0, {
                    size = UDim2.new(1, 0, 0, v12.CONTEXTUAL_INFORMATION_HEIGHT), 
                    backgroundTransparency = 1, 
                    zIndex = 3, 
                    LayoutOrder = 4
                }, {
                    ContextualPresence = v5.createElement(v16, {
                        presenceInfoOverride = v28.initialPresence
                    })
                })
            })
        }), 
        Actions = v5.createElement(v15, {
            layoutOrder = 2, 
            profileActions = v35, 
            isContextualMenuOpen = false
        })
    });
end;