local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.UserLib);
local v5 = require(l_Parent_0.FocusNavigationUtils);
local l_useFocusGuiObject_0 = require(l_Parent_0.ReactFocusNavigation).useFocusGuiObject;
local l_LoadableImage_0 = v3.App.Loading.LoadableImage;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v11 = require(l_script_FirstAncestor_0.Components.EditProfileTopBar);
local v12 = require(l_script_FirstAncestor_0.Components.EditTextButton);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v14 = require(l_script_FirstAncestor_0.Common.TextKeys);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v16 = require(l_script_FirstAncestor_0.Common.Constants);
local v17 = require(l_script_FirstAncestor_0.Hooks.useDisplayNameText);
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v4.Utils.getStandardSizeAvatarHeadShotRbxthumb;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_VerticalScrollView_0 = v3.App.Container.VerticalScrollView;
local l_withHoverTooltip_0 = v3.App.Dialog.TooltipV2.withHoverTooltip;
local l_TooltipOrientation_0 = v3.App.Dialog.Enum.TooltipOrientation;
local l_Interactable_0 = v3.Core.Control.Interactable;
local v24 = require(l_script_FirstAncestor_0.Networking.UserProfileSettingsNetworking);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v26 = require(l_Parent_0.Foundation);
local l_Button_0 = v26.Button;
local l_ButtonSize_0 = v26.Enums.ButtonSize;
local l_useLastInputMode_0 = v5.useLastInputMode;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local l_FFlagEditProfileBackgroundEnabled_0 = require(l_Parent_0.SharedFlags).FFlagEditProfileBackgroundEnabled;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v33 = require(l_script_FirstAncestor_0.Components.EditProfileBackgroundViewport);
local v34 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileFixFocusNavigation);
local v35 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileNavigateToAvatar);
local v36 = require(l_script_FirstAncestor_0.Flags.FStringEditProfileToAvatarLayerName);
local v37 = require(l_script_FirstAncestor_0.Flags.SocialNetworksInEditProfileIXP);
local v38 = game:DefineFastFlag("EditProfileScrollable", false);
local l_FFlagMoveInExperienceModeToEditProfile_0 = require(l_Parent_0.SharedFlags).FFlagMoveInExperienceModeToEditProfile;
local l_FFlagEditProfileInExperiencePersonasV2_0 = require(l_Parent_0.SharedFlags).FFlagEditProfileInExperiencePersonasV2;
local l_FFlagAuthSecExclusions_0 = require(l_Parent_0.SharedFlags).FFlagAuthSecExclusions;
local v42 = require(l_Parent_0.UniversalAppPolicy);
local l_Toggle_0 = v26.Toggle;
local l_ToggleSize_0 = v26.Enums.ToggleSize;
local v45 = require(l_script_FirstAncestor_0.Components.PersonaDetailBar);
local v46 = utf8.char(57346);
return function(v47) --[[ Line: 109 ]] --[[ Name: EditProfileEntryPoint ]]
    -- upvalues: l_FFlagEditProfileBackgroundEnabled_0 (copy), l_useNavigation_0 (copy), l_useLastInputMode_0 (copy), l_useFocusGuiObject_0 (copy), l_useUserExperiment_0 (copy), v36 (copy), v37 (copy), l_FFlagAuthSecExclusions_0 (copy), v42 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v14 (copy), l_FFlagMoveInExperienceModeToEditProfile_0 (copy), l_useDispatch_0 (copy), v46 (copy), l_FFlagEditProfileInExperiencePersonasV2_0 (copy), v17 (copy), v2 (copy), v24 (copy), v16 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v34 (copy), l_TooltipOrientation_0 (copy), v12 (copy), v38 (copy), v11 (copy), v35 (copy), v33 (copy), v26 (copy), l_Button_0 (copy), l_ButtonSize_0 (copy), l_LoadableImage_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_StyledTextLabel_0 (copy), l_withHoverTooltip_0 (copy), l_Toggle_0 (copy), l_ToggleSize_0 (copy), l_Interactable_0 (copy), v45 (copy), l_VerticalScrollView_0 (copy)
    local v48 = if l_FFlagEditProfileBackgroundEnabled_0 then l_useNavigation_0() else nil;
    local v49 = l_useLastInputMode_0();
    local v50 = l_useFocusGuiObject_0();
    local v52 = l_useUserExperiment_0({
        v36
    }, function(v51) --[[ Line: 113 ]]
        -- upvalues: v36 (ref)
        return (v51[v36] or {}).profile_picture_on;
    end);
    local v53 = v37.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled();
    local v54 = v37.useGetExperimentVariant({
        isExposureEnabled = true
    });
    local v55 = v54 and v54 ~= v37.Variants.Control;
    local v57 = if l_FFlagAuthSecExclusions_0 then v42.useAppPolicy(function(v56) --[[ Line: 124 ]]
        return v56.getExcludeUsernameUpdateModeration();
    end) else nil;
    local v58 = l_useStyle_0();
    local l_Theme_0 = v58.Theme;
    local l_Font_0 = v58.Font;
    local v61 = l_useLocalization_0({
        thousand = v14.UsernamePrice
    });
    local v62 = if l_FFlagMoveInExperienceModeToEditProfile_0 then l_useDispatch_0() else nil;
    local v63 = l_useLocalization_0({
        About = v14.About, 
        AboutModalCaption = v14.AboutModalCaption, 
        AboutPlaceholder = v14.AboutPlaceholder, 
        Username = v14.Username, 
        UsernameCaption = {
            v14.UsernameDescription; 
            icon = v46, 
            price = v61.thousand
        }, 
        EditBackground = if l_FFlagEditProfileBackgroundEnabled_0 then v14.EditBackground else nil, 
        SocialNetworks = if v53 and v55 then v14.SocialNetworks else nil, 
        SocialNetworksCaption = if v53 and v55 and v47.socialInfo and v47.socialInfo.visibility then v14[v47.socialInfo.visibility] else nil, 
        TopBarTitle = if l_FFlagEditProfileInExperiencePersonasV2_0 then v14.Title else nil, 
        PersonaTitle = if l_FFlagEditProfileInExperiencePersonasV2_0 then v14.PersonaTitle else nil, 
        PersonaDescription = if l_FFlagEditProfileInExperiencePersonasV2_0 then v14.PersonaDescription else nil, 
        PersonaEnable = if l_FFlagEditProfileInExperiencePersonasV2_0 then v14.PersonaEnable else nil, 
        PersonaStepsToEnableHint = if l_FFlagEditProfileInExperiencePersonasV2_0 then v14.PersonaStepsToEnableHint else nil
    });
    local v64 = v17();
    local v66 = if l_FFlagMoveInExperienceModeToEditProfile_0 then v2.useCallback(function() --[[ Line: 166 ]]
        -- upvalues: v62 (copy), v24 (ref), v47 (copy)
        v62(v24.SetUserProfileSettings.API({
            isInExperienceNameEnabled = not v47.isInExperienceNameEnabled
        })):andThen(function(v65) --[[ Line: 169 ]]
            -- upvalues: v47 (ref)
            if v65.responseBody.successfullyUpdated then
                v47.onToggleInExperienceMode();
            end;
        end);
    end, {
        v47.onToggleInExperienceMode, 
        v47.isInExperienceNameEnabled, 
        v24.SetUserProfileSettings
    }) else nil;
    local v67 = false;
    local v71 = if v53 then v2.useMemo(function() --[[ Line: 185 ]]
        -- upvalues: v47 (copy), v16 (ref), v2 (ref), l_Theme_0 (copy), l_ImageSetLabel_0 (ref), l_Images_0 (ref), v67 (ref)
        local v68 = {};
        if v47.socialInfo and v47.socialInfo.socialLinks then
            for v69, v70 in ipairs(v16.SocialMediaOrder) do
                v68[v70] = v2.createElement("ImageButton", {
                    LayoutOrder = v69, 
                    BackgroundTransparency = 0, 
                    Size = UDim2.new(0, 40, 0, 40), 
                    BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                    [v2.Event.Activated] = v47.openEditSocialLinksModal and function() --[[ Line: 195 ]]
                        -- upvalues: v47 (ref), v69 (copy)
                        v47.openEditSocialLinksModal(v69);
                    end or nil
                }, {
                    UICorner = v2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    }), 
                    Icon = v2.createElement(l_ImageSetLabel_0, {
                        Image = l_Images_0[v16.SocialMediaIcons[v70]], 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = v47.socialInfo.socialLinks[v70] and 0 or 0.5, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, 28, 0, 28), 
                        Position = UDim2.new(0, 6, 0, 6)
                    })
                });
                if v47.socialInfo.socialLinks[v70] then
                    v67 = true;
                end;
            end;
        end;
        return v68;
    end, {
        v47.socialInfo, 
        l_Theme_0, 
        v47.openEditSocialLinksModal
    }) else nil;
    local v72 = nil;
    if v34 then
        v72 = v2.useCallback(function(v73) --[[ Line: 224 ]]
            -- upvalues: v49 (copy), v50 (copy)
            if v73 and v49 == "Focus" then
                v50(v73);
            end;
        end, {});
    end;
    local v74 = nil;
    local v75 = nil;
    local v76 = nil;
    if l_FFlagEditProfileInExperiencePersonasV2_0 then
        v74 = function() --[[ Line: 234 ]]
            -- upvalues: v47 (copy)
            local v77 = false;
            if v47.personaName ~= "" then
                v77 = v47.personaOutfit ~= -1;
            end;
            return v77;
        end;
        v75 = {
            bodyText = v63.PersonaStepsToEnableHint, 
            useLargeDropShadow = true
        };
        v76 = {
            preferredOrientation = l_TooltipOrientation_0.Bottom, 
            guiTarget = game:GetService("CoreGui"), 
            DisplayOrder = 10, 
            delayTime = 0, 
            triggerPointName = "PersonaToggle", 
            disabled = v74()
        };
    end;
    local v78 = if v57 then nil else v2.createElement(v12, {
        layoutOrder = 2, 
        shouldShimmerName = v47.shouldShimmerName, 
        title = v63.Username, 
        description = v63.UsernameCaption, 
        placeHolderText = "@" .. v47.username, 
        localUserId = v47.localUserId, 
        onActivated = v47.navigateToEditUsername, 
        expandSizing = false, 
        transparentText = false
    });
    local v81 = v2.createElement("Frame", {
        BackgroundColor3 = v58.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = v58.Theme.BackgroundDefault.Transparency, 
        Size = UDim2.new(1, 0, 1, 0), 
        AutomaticSize = if v38 then Enum.AutomaticSize.Y else nil, 
        Position = UDim2.fromScale(1, 0), 
        AnchorPoint = Vector2.new(1, 0)
    }, {
        SizeConstraint = v2.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(640, 1e999)
        }), 
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 24)
        }), 
        TopPadding = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 20), 
            BackgroundTransparency = 1
        }), 
        TopBar = v2.createElement(v11, {
            layoutOrder = 1, 
            onClose = v47.onClose, 
            title = l_FFlagEditProfileInExperiencePersonasV2_0 and v63.TopBarTitle or nil
        }), 
        ProfilePicture = if not not v35 or v52 then if l_FFlagEditProfileBackgroundEnabled_0 then v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.X, 
            Size = UDim2.new(1, 0, 0, 200), 
            LayoutOrder = 2, 
            BackgroundTransparency = 1
        }, {
            Bar = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 150), 
                LayoutOrder = 1, 
                ZIndex = 1, 
                BackgroundTransparency = 1
            }, {
                ProfileBackgroundBanner = v2.createElement(v33, {
                    height = 150
                }), 
                EditBackgroundButton = v2.createElement(v26.View, {
                    tag = "position-center-center anchor-center-center auto-xy", 
                    ZIndex = 2
                }, {
                    Button = v2.createElement(l_Button_0, {
                        text = v63.EditBackground, 
                        onActivated = function() --[[ Line: 318 ]] --[[ Name: onActivated ]]
                            -- upvalues: v48 (copy), v47 (copy)
                            v48.navigate(v47.profileScreens.EditProfileBackground);
                        end, 
                        variant = v26.Enums.ButtonVariant.SubEmphasis, 
                        size = l_ButtonSize_0.Small
                    })
                }), 
                Picture = v2.createElement("ImageButton", {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Position = UDim2.new(0, 24, 1, 0), 
                    Size = UDim2.new(0, 100, 0, 100), 
                    BackgroundTransparency = 0, 
                    BorderSizePixel = 10, 
                    ZIndex = 2, 
                    [v2.Event.Activated] = v47.openEditProfilePicture
                }, {
                    UICorner = v2.createElement("UICorner", {
                        CornerRadius = UDim.new(0.5, 0)
                    }), 
                    UserAvatar = v2.createElement(l_LoadableImage_0, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        useShimmerAnimationWhileLoading = true, 
                        cornerRadius = UDim.new(0.5, 0), 
                        shouldHandleReloads = true, 
                        Image = l_getStandardSizeAvatarHeadShotRbxthumb_0(v47.localUserId), 
                        BackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
                        BackgroundTransparency = l_Theme_0.PlaceHolder.Transparency, 
                        ZIndex = 2
                    }), 
                    Button = v2.createElement("ImageButton", {
                        Size = UDim2.new(0, 32, 0, 32), 
                        AnchorPoint = Vector2.new(0.5, 1), 
                        Position = UDim2.new(0.5, 35, 1, 0), 
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                        ZIndex = 3, 
                        [v2.Event.Activated] = v47.openEditProfilePicture
                    }, {
                        UICorner = v2.createElement("UICorner", {
                            CornerRadius = UDim.new(0.5, 0)
                        }), 
                        Icon = v2.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Image = l_Images_0["icons/actions/edit/edit"], 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(0, 22, 0, 22), 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            ZIndex = 3
                        })
                    })
                })
            })
        }) else v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.X, 
            Size = UDim2.new(1, 0, 0, 100), 
            LayoutOrder = 2, 
            BackgroundTransparency = 1
        }, {
            Picture = v2.createElement("ImageButton", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                LayoutOrder = 1, 
                Size = UDim2.new(0, 100, 0, 100), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 10, 
                [v2.Event.Activated] = v47.openEditProfilePicture
            }, {
                UICorner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.5, 0)
                }), 
                UserAvatar = v2.createElement(l_LoadableImage_0, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    useShimmerAnimationWhileLoading = true, 
                    cornerRadius = UDim.new(0.5, 0), 
                    shouldHandleReloads = true, 
                    Image = l_getStandardSizeAvatarHeadShotRbxthumb_0(v47.localUserId), 
                    BackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
                    BackgroundTransparency = l_Theme_0.PlaceHolder.Transparency
                })
            }), 
            Button = v2.createElement("ImageButton", {
                Size = UDim2.new(0, 36, 0, 36), 
                AnchorPoint = Vector2.new(0.5, 1), 
                Position = UDim2.new(0.5, 80, 1, 0), 
                BackgroundTransparency = l_Theme_0.UIMuted.Transparency, 
                BackgroundColor3 = l_Theme_0.UIMuted.Color, 
                [v2.Event.Activated] = v47.openEditProfilePicture
            }, {
                UICorner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 4)
                }), 
                Icon = v2.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Image = l_Images_0["icons/menu/profilepicture_large"], 
                    ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, 28, 0, 28), 
                    Position = UDim2.fromScale(0.5, 0.5)
                })
            })
        }) else nil, 
        Content = v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -48, 0, 0), 
            BorderSizePixel = 0, 
            LayoutOrder = 3
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 24)
            }), 
            DisplayNameButton = v2.createElement(v12, {
                layoutOrder = 1, 
                shouldShimmerName = v47.shouldShimmerName, 
                title = v64.displayNameTitle, 
                description = v64.displayNameCaption, 
                placeHolderText = v47.displayName, 
                localUserId = v47.localUserId, 
                onActivated = v47.openDisplayNameModal, 
                expandSizing = false, 
                transparentText = false, 
                forwardRef = v72
            }), 
            UsernameButton = v78, 
            Divider = v2.createElement("Frame", {
                LayoutOrder = 3, 
                BackgroundColor3 = v58.Theme.Divider.Color, 
                BackgroundTransparency = v58.Theme.Divider.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 1)
            }), 
            AboutMeButton = v2.createElement(v12, {
                layoutOrder = 4, 
                title = v63.About, 
                description = v63.AboutModalCaption, 
                placeHolderText = if v47.description ~= nil and v47.description ~= "" then v47.description else v63.AboutPlaceholder, 
                shouldShimmerName = false, 
                localUserId = v47.localUserId, 
                expandSizing = true, 
                onActivated = v47.openEditDescription, 
                transparentText = not v47.description or v47.description == ""
            }), 
            Divider2 = if not (v53 and v55) or v47.isUnder13 then nil else v2.createElement("Frame", {
                LayoutOrder = l_FFlagMoveInExperienceModeToEditProfile_0 and 8 or 5, 
                BackgroundColor3 = v58.Theme.Divider.Color, 
                BackgroundTransparency = v58.Theme.Divider.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 1)
            }), 
            SocialNetworksButton = if not (v53 and v55 and v47.socialInfo and v47.socialInfo.socialLinks) or v47.isUnder13 then nil else v2.createElement("Frame", {
                LayoutOrder = l_FFlagMoveInExperienceModeToEditProfile_0 and 9 or 6, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                BorderSizePixel = 0
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 12)
                }), 
                UIPadding = v2.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 20)
                }), 
                Title = v2.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 1, 
                    text = v63.SocialNetworks, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis
                }), 
                Description = if v67 then v2.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 2, 
                    text = v63.SocialNetworksCaption, 
                    fontStyle = l_Font_0.CaptionBody, 
                    colorStyle = l_Theme_0.TextDefault, 
                    automaticSize = Enum.AutomaticSize.Y, 
                    size = UDim2.new(1, 0, 0, 0), 
                    lineHeight = 1
                }) else nil, 
                NetworkIcons = v2.createElement("Frame", {
                    LayoutOrder = 3, 
                    Size = UDim2.new(1, 0, 0, 40), 
                    BackgroundTransparency = 1
                }, {
                    Layout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 12)
                    }), 
                    SocialNetworks = v2.createElement(v2.Fragment, {}, v71), 
                    Padding = v2.createElement("Frame", {
                        LayoutOrder = 6, 
                        Size = UDim2.new(1, -318, 0, 40), 
                        BackgroundTransparency = 1
                    }), 
                    PencilIcon = v2.createElement("ImageButton", {
                        LayoutOrder = 7, 
                        BackgroundTransparency = 0, 
                        Size = UDim2.new(0, 40, 0, 40), 
                        BackgroundColor3 = v58.Theme.BackgroundDefault.Color, 
                        BorderSizePixel = 0, 
                        [v2.Event.Activated] = v47.openEditSocialLinksModal and function() --[[ Line: 554 ]]
                            -- upvalues: v47 (copy)
                            v47.openEditSocialLinksModal(-1);
                        end or nil
                    }, {
                        UICorner = v2.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 8)
                        }), 
                        Icon = v2.createElement(l_ImageSetLabel_0, {
                            Image = l_Images_0["icons/actions/edit/edit"], 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(0, 28, 0, 28), 
                            Position = UDim2.new(0, 6, 0, 6)
                        })
                    })
                })
            }), 
            Divider3 = if l_FFlagMoveInExperienceModeToEditProfile_0 and v47.canSeeInExperienceMode then v2.createElement("Frame", {
                LayoutOrder = 5, 
                BackgroundColor3 = v58.Theme.Divider.Color, 
                BackgroundTransparency = v58.Theme.Divider.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 1)
            }) else nil, 
            InExperienceModeSection = if l_FFlagMoveInExperienceModeToEditProfile_0 and v47.canSeeInExperienceMode then v2.createElement("Frame", {
                LayoutOrder = 6, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                BorderSizePixel = 0
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 20)
                }), 
                v2.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    LayoutOrder = 1
                }, {
                    Layout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Title = v2.createElement("TextLabel", {
                        Size = UDim2.fromOffset(0, 0), 
                        BackgroundTransparency = 1, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        Text = "In-Experience Mode", 
                        Font = l_Font_0.Header2.Font, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color
                    }), 
                    InExperienceNameToggleButton = v2.createElement(l_Button_0, {
                        LayoutOrder = 2, 
                        text = v47.isInExperienceNameEnabled and "Stop" or "Start", 
                        onActivated = v66, 
                        size = l_ButtonSize_0.XSmall
                    })
                }), 
                InExperienceModeButton = v2.createElement(v12, {
                    layoutOrder = 2, 
                    description = "When in-experience mode is on, this temporary Name will replace your Name in most experiences.", 
                    placeHolderText = v47.inExperienceName or "", 
                    localUserId = v47.localUserId, 
                    transparentText = true, 
                    expandSizing = true, 
                    shouldShimmerName = false
                }), 
                BottomPadding = v2.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 24)
                })
            }) else nil, 
            Divider4 = if l_FFlagEditProfileInExperiencePersonasV2_0 then v2.createElement("Frame", {
                LayoutOrder = 5, 
                BackgroundColor3 = v58.Theme.Divider.Color, 
                BackgroundTransparency = v58.Theme.Divider.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 1)
            }) else nil, 
            InExperiencePersonasSection = if l_FFlagEditProfileInExperiencePersonasV2_0 then v2.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 6, 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 20)
                }), 
                TitleBar = v2.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1
                }, {
                    Layout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    TitleText = v2.createElement(l_StyledTextLabel_0, {
                        layoutOrder = 1, 
                        text = v63.PersonaTitle, 
                        fontStyle = l_Font_0.Header2, 
                        colorStyle = l_Theme_0.TextEmphasis, 
                        size = UDim2.new(0.5, 0, 0, 0), 
                        automaticSize = Enum.AutomaticSize.Y
                    }), 
                    Toggle = l_withHoverTooltip_0(v75, v76, function(v79, v80) --[[ Line: 697 ]]
                        -- upvalues: v2 (ref), l_Toggle_0 (ref), v63 (copy), v74 (ref), v47 (copy), l_ToggleSize_0 (ref), l_Interactable_0 (ref)
                        return v2.createElement("Frame", {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(0, 0, 0, 0), 
                            LayoutOrder = 2, 
                            [v2.Change.AbsoluteSize] = v79, 
                            [v2.Change.AbsolutePosition] = v79
                        }, {
                            Toggle = v2.createElement(l_Toggle_0, {
                                label = v63.PersonaEnable, 
                                isDisabled = not v74(), 
                                isChecked = v47.personaStatus and v74(), 
                                onActivated = v47.onPersonaToggle, 
                                size = l_ToggleSize_0.Medium
                            }), 
                            HoverHitbox = v2.createElement(l_Interactable_0, {
                                Size = UDim2.new(1, 0, 1, 0), 
                                onStateChanged = v80, 
                                BackgroundTransparency = 1
                            })
                        });
                    end)
                }), 
                DescriptionText = v2.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 2, 
                    text = v63.PersonaDescription, 
                    fontStyle = l_Font_0.CaptionBody, 
                    colorStyle = l_Theme_0.TextDefault, 
                    size = UDim2.new(1, 0, 0, 0), 
                    automaticSize = Enum.AutomaticSize.Y, 
                    lineHeight = 1
                }), 
                DetailBar = v2.createElement(v45, {
                    layoutOrder = 3, 
                    onChooseActivated = v47.onPersonaChoose, 
                    onNameActivated = v47.onPersonaNameEdit, 
                    visible = true, 
                    personaName = v47.personaName or "", 
                    personaOutfit = v47.personaOutfit or -1
                }), 
                BottomPadding = v2.createElement("Frame", {
                    LayoutOrder = 4, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 20)
                })
            }) else nil
        })
    });
    if v38 then
        return v2.createElement(l_VerticalScrollView_0, {
            useAutomaticCanvasSize = true, 
            canvasSizeY = UDim.new(), 
            elasticBehavior = Enum.ElasticBehavior.Never
        }, {
            v81
        });
    else
        return v81;
    end;
end;