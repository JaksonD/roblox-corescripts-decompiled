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
local v21 = require(l_script_FirstAncestor_0.Networking.UserProfileSettingsNetworking);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v23 = require(l_Parent_0.Foundation);
local l_Button_0 = v23.Button;
local l_ButtonSize_0 = v23.Enums.ButtonSize;
local l_useLastInputMode_0 = v5.useLastInputMode;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local l_FFlagEditProfileBackgroundEnabled_0 = require(l_Parent_0.SharedFlags).FFlagEditProfileBackgroundEnabled;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v30 = require(l_script_FirstAncestor_0.Components.EditProfileBackgroundViewport);
local v31 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileFixFocusNavigation);
local v32 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileNavigateToAvatar);
local v33 = require(l_script_FirstAncestor_0.Flags.FStringEditProfileToAvatarLayerName);
local v34 = require(l_script_FirstAncestor_0.Flags.SocialNetworksInEditProfileIXP);
local v35 = game:DefineFastFlag("EditProfileScrollable", false);
local l_FFlagMoveInExperienceModeToEditProfile_0 = require(l_Parent_0.SharedFlags).FFlagMoveInExperienceModeToEditProfile;
local l_FFlagAuthSecExclusions_0 = require(l_Parent_0.SharedFlags).FFlagAuthSecExclusions;
local v38 = require(l_Parent_0.UniversalAppPolicy);
local v39 = utf8.char(57346);
return function(v40) --[[ Line: 93 ]] --[[ Name: EditProfileEntryPoint ]]
    -- upvalues: l_FFlagEditProfileBackgroundEnabled_0 (copy), l_useNavigation_0 (copy), l_useLastInputMode_0 (copy), l_useFocusGuiObject_0 (copy), l_useUserExperiment_0 (copy), v33 (copy), v34 (copy), l_FFlagAuthSecExclusions_0 (copy), v38 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v14 (copy), l_FFlagMoveInExperienceModeToEditProfile_0 (copy), l_useDispatch_0 (copy), v39 (copy), v17 (copy), v2 (copy), v21 (copy), v16 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v31 (copy), v12 (copy), v35 (copy), v11 (copy), v32 (copy), v30 (copy), v23 (copy), l_Button_0 (copy), l_ButtonSize_0 (copy), l_LoadableImage_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_StyledTextLabel_0 (copy), l_VerticalScrollView_0 (copy)
    local v41 = if l_FFlagEditProfileBackgroundEnabled_0 then l_useNavigation_0() else nil;
    local v42 = l_useLastInputMode_0();
    local v43 = l_useFocusGuiObject_0();
    local v45 = l_useUserExperiment_0({
        v33
    }, function(v44) --[[ Line: 97 ]]
        -- upvalues: v33 (ref)
        return (v44[v33] or {}).profile_picture_on;
    end);
    local v46 = v34.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled();
    local v47 = v34.useGetExperimentVariant({
        isExposureEnabled = true
    });
    local v48 = v47 and v47 ~= v34.Variants.Control;
    local v50 = if l_FFlagAuthSecExclusions_0 then v38.useAppPolicy(function(v49) --[[ Line: 108 ]]
        return v49.getExcludeUsernameUpdateModeration();
    end) else nil;
    local v51 = l_useStyle_0();
    local l_Theme_0 = v51.Theme;
    local l_Font_0 = v51.Font;
    local v54 = l_useLocalization_0({
        thousand = v14.UsernamePrice
    });
    local v55 = if l_FFlagMoveInExperienceModeToEditProfile_0 then l_useDispatch_0() else nil;
    local v56 = l_useLocalization_0({
        About = v14.About, 
        AboutModalCaption = v14.AboutModalCaption, 
        AboutPlaceholder = v14.AboutPlaceholder, 
        Username = v14.Username, 
        UsernameCaption = {
            v14.UsernameDescription; 
            icon = v39, 
            price = v54.thousand
        }, 
        EditBackground = if l_FFlagEditProfileBackgroundEnabled_0 then v14.EditBackground else nil, 
        SocialNetworks = if v46 and v48 then v14.SocialNetworks else nil, 
        SocialNetworksCaption = if v46 and v48 and v40.socialInfo and v40.socialInfo.visibility then v14[v40.socialInfo.visibility] else nil
    });
    local v57 = v17();
    local v59 = if l_FFlagMoveInExperienceModeToEditProfile_0 then v2.useCallback(function() --[[ Line: 143 ]]
        -- upvalues: v55 (copy), v21 (ref), v40 (copy)
        v55(v21.SetUserProfileSettings.API({
            isInExperienceNameEnabled = not v40.isInExperienceNameEnabled
        })):andThen(function(v58) --[[ Line: 146 ]]
            -- upvalues: v40 (ref)
            if v58.responseBody.successfullyUpdated then
                v40.onToggleInExperienceMode();
            end;
        end);
    end, {
        v40.onToggleInExperienceMode, 
        v40.isInExperienceNameEnabled, 
        v21.SetUserProfileSettings
    }) else nil;
    local v60 = false;
    local v64 = if v46 then v2.useMemo(function() --[[ Line: 162 ]]
        -- upvalues: v40 (copy), v16 (ref), v2 (ref), l_Theme_0 (copy), l_ImageSetLabel_0 (ref), l_Images_0 (ref), v60 (ref)
        local v61 = {};
        if v40.socialInfo and v40.socialInfo.socialLinks then
            for v62, v63 in ipairs(v16.SocialMediaOrder) do
                v61[v63] = v2.createElement("ImageButton", {
                    LayoutOrder = v62, 
                    BackgroundTransparency = 0, 
                    Size = UDim2.new(0, 40, 0, 40), 
                    BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                    [v2.Event.Activated] = v40.openEditSocialLinksModal and function() --[[ Line: 172 ]]
                        -- upvalues: v40 (ref), v62 (copy)
                        v40.openEditSocialLinksModal(v62);
                    end or nil
                }, {
                    UICorner = v2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    }), 
                    Icon = v2.createElement(l_ImageSetLabel_0, {
                        Image = l_Images_0[v16.SocialMediaIcons[v63]], 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = v40.socialInfo.socialLinks[v63] and 0 or 0.5, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, 28, 0, 28), 
                        Position = UDim2.new(0, 6, 0, 6)
                    })
                });
                if v40.socialInfo.socialLinks[v63] then
                    v60 = true;
                end;
            end;
        end;
        return v61;
    end, {
        v40.socialInfo, 
        l_Theme_0, 
        v40.openEditSocialLinksModal
    }) else nil;
    local v65 = nil;
    if v31 then
        v65 = v2.useCallback(function(v66) --[[ Line: 201 ]]
            -- upvalues: v42 (copy), v43 (copy)
            if v66 and v42 == "Focus" then
                v43(v66);
            end;
        end, {});
    end;
    local v67 = if v50 then nil else v2.createElement(v12, {
        layoutOrder = 2, 
        shouldShimmerName = v40.shouldShimmerName, 
        title = v56.Username, 
        description = v56.UsernameCaption, 
        placeHolderText = "@" .. v40.username, 
        localUserId = v40.localUserId, 
        onActivated = v40.navigateToEditUsername, 
        expandSizing = false, 
        transparentText = false
    });
    local v68 = v2.createElement("Frame", {
        BackgroundColor3 = v51.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = v51.Theme.BackgroundDefault.Transparency, 
        Size = UDim2.new(1, 0, 1, 0), 
        AutomaticSize = if v35 then Enum.AutomaticSize.Y else nil, 
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
            onClose = v40.onClose
        }), 
        ProfilePicture = if not not v32 or v45 then if l_FFlagEditProfileBackgroundEnabled_0 then v2.createElement("Frame", {
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
                ProfileBackgroundBanner = v2.createElement(v30, {
                    height = 150
                }), 
                EditBackgroundButton = v2.createElement(v23.View, {
                    tag = "position-center-center anchor-center-center auto-xy", 
                    ZIndex = 2
                }, {
                    Button = v2.createElement(l_Button_0, {
                        text = v56.EditBackground, 
                        onActivated = function() --[[ Line: 273 ]] --[[ Name: onActivated ]]
                            -- upvalues: v41 (copy), v40 (copy)
                            v41.navigate(v40.profileScreens.EditProfileBackground);
                        end, 
                        variant = v23.Enums.ButtonVariant.SubEmphasis, 
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
                    [v2.Event.Activated] = v40.openEditProfilePicture
                }, {
                    UICorner = v2.createElement("UICorner", {
                        CornerRadius = UDim.new(0.5, 0)
                    }), 
                    UserAvatar = v2.createElement(l_LoadableImage_0, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        useShimmerAnimationWhileLoading = true, 
                        cornerRadius = UDim.new(0.5, 0), 
                        shouldHandleReloads = true, 
                        Image = l_getStandardSizeAvatarHeadShotRbxthumb_0(v40.localUserId), 
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
                        [v2.Event.Activated] = v40.openEditProfilePicture
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
                [v2.Event.Activated] = v40.openEditProfilePicture
            }, {
                UICorner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.5, 0)
                }), 
                UserAvatar = v2.createElement(l_LoadableImage_0, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    useShimmerAnimationWhileLoading = true, 
                    cornerRadius = UDim.new(0.5, 0), 
                    shouldHandleReloads = true, 
                    Image = l_getStandardSizeAvatarHeadShotRbxthumb_0(v40.localUserId), 
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
                [v2.Event.Activated] = v40.openEditProfilePicture
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
                shouldShimmerName = v40.shouldShimmerName, 
                title = v57.displayNameTitle, 
                description = v57.displayNameCaption, 
                placeHolderText = v40.displayName, 
                localUserId = v40.localUserId, 
                onActivated = v40.openDisplayNameModal, 
                expandSizing = false, 
                transparentText = false, 
                forwardRef = v65
            }), 
            UsernameButton = v67, 
            Divider = v2.createElement("Frame", {
                LayoutOrder = 3, 
                BackgroundColor3 = v51.Theme.Divider.Color, 
                BackgroundTransparency = v51.Theme.Divider.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 1)
            }), 
            AboutMeButton = v2.createElement(v12, {
                layoutOrder = 4, 
                title = v56.About, 
                description = v56.AboutModalCaption, 
                placeHolderText = if v40.description ~= nil and v40.description ~= "" then v40.description else v56.AboutPlaceholder, 
                shouldShimmerName = false, 
                localUserId = v40.localUserId, 
                expandSizing = true, 
                onActivated = v40.openEditDescription, 
                transparentText = not v40.description or v40.description == ""
            }), 
            Divider2 = if not (v46 and v48) or v40.isUnder13 then nil else v2.createElement("Frame", {
                LayoutOrder = l_FFlagMoveInExperienceModeToEditProfile_0 and 8 or 5, 
                BackgroundColor3 = v51.Theme.Divider.Color, 
                BackgroundTransparency = v51.Theme.Divider.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 1)
            }), 
            SocialNetworksButton = if not (v46 and v48 and v40.socialInfo and v40.socialInfo.socialLinks) or v40.isUnder13 then nil else v2.createElement("Frame", {
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
                    text = v56.SocialNetworks, 
                    fontStyle = l_Font_0.Header2, 
                    colorStyle = l_Theme_0.TextEmphasis
                }), 
                Description = if v60 then v2.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 2, 
                    text = v56.SocialNetworksCaption, 
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
                    SocialNetworks = v2.createElement(v2.Fragment, {}, v64), 
                    Padding = v2.createElement("Frame", {
                        LayoutOrder = 6, 
                        Size = UDim2.new(1, -318, 0, 40), 
                        BackgroundTransparency = 1
                    }), 
                    PencilIcon = v2.createElement("ImageButton", {
                        LayoutOrder = 7, 
                        BackgroundTransparency = 0, 
                        Size = UDim2.new(0, 40, 0, 40), 
                        BackgroundColor3 = v51.Theme.BackgroundDefault.Color, 
                        BorderSizePixel = 0, 
                        [v2.Event.Activated] = v40.openEditSocialLinksModal and function() --[[ Line: 509 ]]
                            -- upvalues: v40 (copy)
                            v40.openEditSocialLinksModal(-1);
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
            Divider3 = if l_FFlagMoveInExperienceModeToEditProfile_0 and v40.canSeeInExperienceMode then v2.createElement("Frame", {
                LayoutOrder = 5, 
                BackgroundColor3 = v51.Theme.Divider.Color, 
                BackgroundTransparency = v51.Theme.Divider.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 1)
            }) else nil, 
            InExperienceModeSection = if l_FFlagMoveInExperienceModeToEditProfile_0 and v40.canSeeInExperienceMode then v2.createElement("Frame", {
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
                        text = v40.isInExperienceNameEnabled and "Stop" or "Start", 
                        onActivated = v59, 
                        size = l_ButtonSize_0.XSmall
                    })
                }), 
                InExperienceModeButton = v2.createElement(v12, {
                    layoutOrder = 2, 
                    description = "When in-experience mode is on, this temporary Name will replace your Name in most experiences.", 
                    placeHolderText = v40.inExperienceName or "", 
                    localUserId = v40.localUserId, 
                    transparentText = true, 
                    expandSizing = true, 
                    shouldShimmerName = false
                }), 
                BottomPadding = v2.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 24)
                })
            }) else nil
        })
    });
    if v35 then
        return v2.createElement(l_VerticalScrollView_0, {
            useAutomaticCanvasSize = true, 
            canvasSizeY = UDim.new(), 
            elasticBehavior = Enum.ElasticBehavior.Never
        }, {
            v68
        });
    else
        return v68;
    end;
end;