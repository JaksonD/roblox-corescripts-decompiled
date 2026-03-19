local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local v5 = require(l_script_FirstAncestor_0.Components.EditSocialNetworksItem);
local l_DropdownMenu_0 = v3.App.Menu.DropdownMenu;
local l_VerticalScrollView_0 = v3.App.Container.VerticalScrollView;
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v11 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useNavigationProps_0 = require(l_Parent_0.RobloxAppNavigation).useNavigationProps;
local v14 = require(l_script_FirstAncestor_0.Common.Constants);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v16 = require(l_script_FirstAncestor_0.Flags.SocialNetworksInEditProfileIXP);
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileFixFocusNavigation);
local v18 = require(l_script_FirstAncestor_0.Utils.FocusNavigatorWrapper);
return function(v19) --[[ Line: 41 ]]
    -- upvalues: v2 (copy), v14 (copy), l_useLocalization_0 (copy), v11 (copy), l_useNavigationProps_0 (copy), v16 (copy), l_useStyle_0 (copy), l_useScreenSize_0 (copy), v17 (copy), v18 (copy), l_VerticalScrollView_0 (copy), l_InteractiveAlert_0 (copy), v5 (copy), l_DropdownMenu_0 (copy), l_ButtonType_0 (copy)
    local v20, v21 = v2.useState(v19.socialNetworks.facebook);
    local v22, v23 = v2.useState(v19.socialNetworks.twitter);
    local v24, v25 = v2.useState(v19.socialNetworks.youtube);
    local v26, v27 = v2.useState(v19.socialNetworks.twitch);
    local v28, v29 = v2.useState(v19.socialNetworks.guilded);
    local v30, v31 = v2.useState(v19.socialNetworksVisbility);
    local v32, v33 = v2.useState(0);
    local v34 = v30 == v14.VisibilitySettings.NoOne;
    local v35 = l_useLocalization_0({
        cancelButtonText = v11.CancelButtonText, 
        saveButtonText = v11.SaveButtonText, 
        socialNetworks = v11.SocialNetworks, 
        Facebook = v11.Facebook, 
        X = v11.X, 
        YouTube = v11.YouTube, 
        Twitch = v11.Twitch, 
        Guilded = v11.Guilded, 
        FacebookExample = v11.FacebookExample, 
        TwitterExample = v11.TwitterExample, 
        YouTubeExample = v11.YouTubeExample, 
        TwitchExample = v11.TwitchExample, 
        GuildedExample = v11.GuildedExample, 
        AllUsers = v11.AllUsersDropDown, 
        Friends = v11.FriendsDropDown, 
        NoOne = v11.NoOneDropDown, 
        FriendsFollowingAndFollowers = v11.FriendsFollowingAndFollowersDropDown, 
        FriendsAndFollowing = v11.FriendsAndFollowingDropDown, 
        VisibleTo = v11.VisibleTo
    });
    local v38 = l_useNavigationProps_0(function(_, v37) --[[ Line: 71 ]]
        return {
            focusOn = v37.focusOn
        };
    end);
    local v39 = v16.useGetExperimentVariant({
        isExposureEnabled = true
    });
    local v40 = l_useStyle_0();
    local l_Font_0 = v40.Font;
    local l_Theme_0 = v40.Theme;
    local v43 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v44 = l_useScreenSize_0();
    local function v45() --[[ Line: 85 ]] --[[ Name: onSave ]]
        -- upvalues: v19 (copy), v30 (copy), v20 (copy), v22 (copy), v24 (copy), v26 (copy), v28 (copy)
        v19.saveOnActivated(v30, v20, v22, v24, v26, v28);
    end;
    local v47 = v2.useCallback(function(v46) --[[ Line: 89 ]]
        -- upvalues: v31 (copy)
        v31(v46);
    end, {});
    if v17 then
        return v18({
            onClose = v19.cancelOnActivated
        }, {
            v2.createElement(l_VerticalScrollView_0, {
                useAutomaticCanvasSize = true, 
                canvasSizeY = UDim.new(), 
                elasticBehavior = Enum.ElasticBehavior.Never
            }, {
                v2.createElement(l_InteractiveAlert_0, {
                    title = v35.socialNetworks, 
                    screenSize = v44, 
                    anchorPoint = Vector2.new(0.5, 0), 
                    position = UDim2.new(0.5, 0, 0, 30 + v32), 
                    middleContent = function() --[[ Line: 107 ]] --[[ Name: middleContent ]]
                        -- upvalues: v2 (ref), v5 (ref), v21 (copy), v35 (copy), v20 (copy), v39 (copy), v16 (ref), v38 (copy), v34 (copy), v33 (copy), v23 (copy), v22 (copy), v25 (copy), v24 (copy), v27 (copy), v26 (copy), v29 (copy), v28 (copy), l_Font_0 (copy), v43 (copy), l_Theme_0 (copy), l_DropdownMenu_0 (ref), v30 (copy), v47 (copy), v44 (copy), v14 (ref)
                        return v2.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            AutomaticSize = Enum.AutomaticSize.XY
                        }, {
                            UIListLayout = v2.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                VerticalAlignment = Enum.VerticalAlignment.Center, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                                SortOrder = Enum.SortOrder.LayoutOrder
                            }), 
                            Facebook = v2.createElement(v5, {
                                textChanged = v21, 
                                networkTitle = v35.Facebook, 
                                initialText = v20, 
                                placeholderText = v35.FacebookExample, 
                                layoutOrder = v39 == v16.Variants.VisibilityLast and 1 or 2, 
                                focusOn = v38.focusOn == 1, 
                                isVisibilityNoOne = v34, 
                                setKeyboardOffset = v33
                            }), 
                            Twitter = v2.createElement(v5, {
                                textChanged = v23, 
                                networkTitle = v35.X, 
                                initialText = v22, 
                                placeholderText = v35.TwitterExample, 
                                layoutOrder = v39 == v16.Variants.VisibilityLast and 2 or 3, 
                                focusOn = v38.focusOn == 2, 
                                isVisibilityNoOne = v34, 
                                setKeyboardOffset = v33
                            }), 
                            YouTube = v2.createElement(v5, {
                                textChanged = v25, 
                                networkTitle = v35.YouTube, 
                                initialText = v24, 
                                placeholderText = v35.YouTubeExample, 
                                layoutOrder = v39 == v16.Variants.VisibilityLast and 3 or 4, 
                                focusOn = v38.focusOn == 3, 
                                isVisibilityNoOne = v34, 
                                setKeyboardOffset = v33
                            }), 
                            Twitch = v2.createElement(v5, {
                                textChanged = v27, 
                                networkTitle = v35.Twitch, 
                                initialText = v26, 
                                placeholderText = v35.TwitchExample, 
                                layoutOrder = v39 == v16.Variants.VisibilityLast and 4 or 5, 
                                focusOn = v38.focusOn == 4, 
                                isVisibilityNoOne = v34, 
                                setKeyboardOffset = v33
                            }), 
                            Guilded = v2.createElement(v5, {
                                textChanged = v29, 
                                networkTitle = v35.Guilded, 
                                initialText = v28, 
                                placeholderText = v35.GuildedExample, 
                                layoutOrder = v39 == v16.Variants.VisibilityLast and 5 or 6, 
                                focusOn = v38.focusOn == 5, 
                                isVisibilityNoOne = v34, 
                                setKeyboardOffset = v33
                            }), 
                            Visibility = v2.createElement("Frame", {
                                BackgroundTransparency = 1, 
                                Size = UDim2.new(1, 0, 0, 0), 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                LayoutOrder = v39 == v16.Variants.VisibilityLast and 6 or 1, 
                                ZIndex = 2
                            }, {
                                UIListLayout = v2.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Vertical, 
                                    SortOrder = Enum.SortOrder.LayoutOrder, 
                                    Padding = UDim.new(0, 12)
                                }), 
                                NetworkLabel = v2.createElement("TextLabel", {
                                    LayoutOrder = -1, 
                                    BackgroundTransparency = 1, 
                                    Font = l_Font_0.Body.Font, 
                                    Text = v35.VisibleTo, 
                                    TextSize = v43, 
                                    TextColor3 = l_Theme_0.TextDefault.Color, 
                                    AutomaticSize = Enum.AutomaticSize.XY, 
                                    RichText = true, 
                                    ZIndex = 0
                                }), 
                                Dropdown = v2.createElement(l_DropdownMenu_0, {
                                    placeholder = v35[v30], 
                                    onChange = v47, 
                                    screenSize = Vector2.new(math.clamp(v44.X - 48, 272, 400) - 48, 640), 
                                    height = UDim.new(0, v43 + 20), 
                                    dropdownMenuListPositionFixed = true, 
                                    cellDatas = {
                                        {
                                            text = v35.AllUsers, 
                                            key = v14.VisibilitySettings.AllUsers
                                        }, 
                                        {
                                            text = v35.FriendsFollowingAndFollowers, 
                                            key = v14.VisibilitySettings.FriendsFollowingAndFollowers
                                        }, 
                                        {
                                            text = v35.FriendsAndFollowing, 
                                            key = v14.VisibilitySettings.FriendsAndFollowing
                                        }, 
                                        {
                                            text = v35.Friends, 
                                            key = v14.VisibilitySettings.Friends
                                        }, 
                                        {
                                            text = v35.NoOne, 
                                            key = v14.VisibilitySettings.NoOne
                                        }
                                    }, 
                                    showDropShadow = true, 
                                    defaultKey = v30
                                })
                            })
                        });
                    end, 
                    buttonStackInfo = {
                        buttons = {
                            {
                                buttonType = l_ButtonType_0.Secondary, 
                                props = {
                                    onActivated = v19.cancelOnActivated, 
                                    text = v35.cancelButtonText
                                }
                            }, 
                            {
                                buttonType = l_ButtonType_0.PrimarySystem, 
                                props = {
                                    onActivated = v45, 
                                    text = v35.saveButtonText
                                }
                            }
                        }, 
                        buttonHeight = 48, 
                        marginBetween = 6, 
                        forcedFillDirection = Enum.FillDirection.Horizontal
                    }
                })
            })
        });
    else
        return v2.createElement(l_VerticalScrollView_0, {
            useAutomaticCanvasSize = true, 
            canvasSizeY = UDim.new(), 
            elasticBehavior = Enum.ElasticBehavior.Never
        }, {
            v2.createElement(l_InteractiveAlert_0, {
                title = v35.socialNetworks, 
                screenSize = v44, 
                anchorPoint = Vector2.new(0.5, 0), 
                position = UDim2.new(0.5, 0, 0, 30 + v32), 
                middleContent = function() --[[ Line: 290 ]] --[[ Name: middleContent ]]
                    -- upvalues: v2 (ref), v5 (ref), v21 (copy), v35 (copy), v20 (copy), v39 (copy), v16 (ref), v38 (copy), v34 (copy), v33 (copy), v23 (copy), v22 (copy), v25 (copy), v24 (copy), v27 (copy), v26 (copy), v29 (copy), v28 (copy), l_Font_0 (copy), v43 (copy), l_Theme_0 (copy), l_DropdownMenu_0 (ref), v30 (copy), v47 (copy), v44 (copy), v14 (ref)
                    return v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        AutomaticSize = Enum.AutomaticSize.XY
                    }, {
                        UIListLayout = v2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        Facebook = v2.createElement(v5, {
                            textChanged = v21, 
                            networkTitle = v35.Facebook, 
                            initialText = v20, 
                            placeholderText = v35.FacebookExample, 
                            layoutOrder = v39 == v16.Variants.VisibilityLast and 1 or 2, 
                            focusOn = v38.focusOn == 1, 
                            isVisibilityNoOne = v34, 
                            setKeyboardOffset = v33
                        }), 
                        Twitter = v2.createElement(v5, {
                            textChanged = v23, 
                            networkTitle = v35.X, 
                            initialText = v22, 
                            placeholderText = v35.TwitterExample, 
                            layoutOrder = v39 == v16.Variants.VisibilityLast and 2 or 3, 
                            focusOn = v38.focusOn == 2, 
                            isVisibilityNoOne = v34, 
                            setKeyboardOffset = v33
                        }), 
                        YouTube = v2.createElement(v5, {
                            textChanged = v25, 
                            networkTitle = v35.YouTube, 
                            initialText = v24, 
                            placeholderText = v35.YouTubeExample, 
                            layoutOrder = v39 == v16.Variants.VisibilityLast and 3 or 4, 
                            focusOn = v38.focusOn == 3, 
                            isVisibilityNoOne = v34, 
                            setKeyboardOffset = v33
                        }), 
                        Twitch = v2.createElement(v5, {
                            textChanged = v27, 
                            networkTitle = v35.Twitch, 
                            initialText = v26, 
                            placeholderText = v35.TwitchExample, 
                            layoutOrder = v39 == v16.Variants.VisibilityLast and 4 or 5, 
                            focusOn = v38.focusOn == 4, 
                            isVisibilityNoOne = v34, 
                            setKeyboardOffset = v33
                        }), 
                        Guilded = v2.createElement(v5, {
                            textChanged = v29, 
                            networkTitle = v35.Guilded, 
                            initialText = v28, 
                            placeholderText = v35.GuildedExample, 
                            layoutOrder = v39 == v16.Variants.VisibilityLast and 5 or 6, 
                            focusOn = v38.focusOn == 5, 
                            isVisibilityNoOne = v34, 
                            setKeyboardOffset = v33
                        }), 
                        Visibility = v2.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            LayoutOrder = v39 == v16.Variants.VisibilityLast and 6 or 1, 
                            ZIndex = 2
                        }, {
                            UIListLayout = v2.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                Padding = UDim.new(0, 12)
                            }), 
                            NetworkLabel = v2.createElement("TextLabel", {
                                LayoutOrder = -1, 
                                BackgroundTransparency = 1, 
                                Font = l_Font_0.Body.Font, 
                                Text = v35.VisibleTo, 
                                TextSize = v43, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                RichText = true, 
                                ZIndex = 0
                            }), 
                            Dropdown = v2.createElement(l_DropdownMenu_0, {
                                placeholder = v35[v30], 
                                onChange = v47, 
                                screenSize = Vector2.new(math.clamp(v44.X - 48, 272, 400) - 48, 640), 
                                height = UDim.new(0, v43 + 20), 
                                dropdownMenuListPositionFixed = true, 
                                cellDatas = {
                                    {
                                        text = v35.AllUsers, 
                                        key = v14.VisibilitySettings.AllUsers
                                    }, 
                                    {
                                        text = v35.FriendsFollowingAndFollowers, 
                                        key = v14.VisibilitySettings.FriendsFollowingAndFollowers
                                    }, 
                                    {
                                        text = v35.FriendsAndFollowing, 
                                        key = v14.VisibilitySettings.FriendsAndFollowing
                                    }, 
                                    {
                                        text = v35.Friends, 
                                        key = v14.VisibilitySettings.Friends
                                    }, 
                                    {
                                        text = v35.NoOne, 
                                        key = v14.VisibilitySettings.NoOne
                                    }
                                }, 
                                showDropShadow = true, 
                                defaultKey = v30
                            })
                        })
                    });
                end, 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.Secondary, 
                            props = {
                                onActivated = v19.cancelOnActivated, 
                                text = v35.cancelButtonText
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = v45, 
                                text = v35.saveButtonText
                            }
                        }
                    }, 
                    buttonHeight = 48, 
                    marginBetween = 6, 
                    forcedFillDirection = Enum.FillDirection.Horizontal
                }
            })
        });
    end;
end;