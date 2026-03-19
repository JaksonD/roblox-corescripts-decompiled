local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Packages.React);
local l_Sounds_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).Sounds;
local l_SoundGroups_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundGroups;
local l_SoundManager_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager;
local v7 = require(l_CorePackages_0.Workspace.Packages.UserProfiles);
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local v9 = require(l_ContactList_0.dependencies);
local l_dependencyArray_0 = v9.Hooks.dependencyArray;
local l_useDispatch_0 = v9.Hooks.useDispatch;
local l_useSelector_0 = v9.Hooks.useSelector;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v9.getStandardSizeAvatarHeadShotRbxthumb;
local l_GetPresencesFromUserIds_0 = v9.NetworkingPresence.GetPresencesFromUserIds;
local l_useLocalization_0 = v9.Hooks.useLocalization;
local l_PresenceType_0 = v9.RoduxPresence.Enums.PresenceType;
local l_UIBlox_0 = v9.UIBlox;
local l_ControlState_0 = l_UIBlox_0.Core.Control.Enum.ControlState;
local l_PlayerContext_0 = l_UIBlox_0.App.Indicator.PlayerContext;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_Interactable_0 = l_UIBlox_0.Core.Control.Interactable;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v24 = require(l_ContactList_0.Actions.OpenOrUpdateCFM);
local v25 = require(l_ContactList_0.Analytics.useAnalytics);
local v26 = require(l_ContactList_0.Analytics.EventNamesEnum);
local v27 = require(l_ContactList_0.Hooks.useStartCallCallback);
local v28 = require(l_ContactList_0.Enums.Pages);
local v29 = Random.new();
local v30 = Vector2.new(24, 12);
return function(v31) --[[ Line: 62 ]] --[[ Name: FriendListItem ]]
    -- upvalues: v25 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), v3 (copy), l_GetPresencesFromUserIds_0 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), l_ControlState_0 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy), v29 (copy), l_SoundGroups_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), v27 (copy), l_Images_0 (copy), l_PresenceType_0 (copy), l_PlayerContext_0 (copy), v26 (copy), v28 (copy), v24 (copy), l_Interactable_0 (copy), v30 (copy), v7 (copy), l_ImageSetLabel_0 (copy)
    local v32 = v25();
    local v33 = l_useStyle_0();
    local l_Theme_0 = v33.Theme;
    local l_Font_0 = v33.Font;
    local v36 = l_useDispatch_0();
    local v37 = {
        userId = v31.userId, 
        userName = v31.userName, 
        combinedName = v31.combinedName
    };
    local v38 = l_useLocalization_0({
        offlineStatusLabel = "InGame.Presence.Label.Offline", 
        onlineStatusLabel = "InGame.Presence.Label.Online", 
        studioStatusLabel = "InGame.Presence.Label.RobloxStudio"
    });
    v3.useEffect(function() --[[ Line: 82 ]]
        -- upvalues: v31 (copy), v36 (copy), l_GetPresencesFromUserIds_0 (ref)
        if v31.userPresenceType == nil then
            v36(l_GetPresencesFromUserIds_0.API({
                v31.userId
            }));
        end;
    end, l_dependencyArray_0(v31.userId, v31.userPresenceType));
    local v40 = v3.useCallback(function(v39) --[[ Line: 88 ]]
        -- upvalues: v31 (copy)
        return v39.Presence.byUserId[tostring(v31.userId)];
    end, {
        v31.userId
    });
    local v41 = l_useSelector_0(v40);
    local v43 = v3.useCallback(function(v42) --[[ Line: 93 ]]
        return v42.Navigation.currentTag;
    end, {});
    local v44 = l_useSelector_0(v43);
    local v46 = v3.useCallback(function(v45) --[[ Line: 98 ]]
        return v45.Navigation.currentPage;
    end, {});
    local v47 = l_useSelector_0(v46);
    local v48, v49 = v3.useState("BackgroundDefault");
    local v52 = v3.useCallback(function(_, v51) --[[ Line: 104 ]]
        -- upvalues: l_ControlState_0 (ref), v49 (copy), l_SoundManager_0 (ref), l_Sounds_0 (ref), v29 (ref), l_SoundGroups_0 (ref)
        if v51 == l_ControlState_0.Pressed then
            v49("BackgroundOnPress");
            return;
        elseif v51 == l_ControlState_0.Hover then
            v49("BackgroundOnHover");
            l_SoundManager_0:PlaySound(l_Sounds_0.Hover.Name, {
                Volume = 0.5 + v29:NextNumber(-0.25, 0.25), 
                PlaybackSpeed = 1 + v29:NextNumber(-0.5, 0.5)
            }, l_SoundGroups_0.Iris);
            return;
        else
            v49("BackgroundDefault");
            return;
        end;
    end, {});
    local v53 = l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v31.userId)));
    local v54 = {
        searchQueryString = v31.searchQueryString, 
        itemListIndex = v31.itemListIndex, 
        isSuggestedUser = v31.isSuggestedUser, 
        page = v47
    };
    local v55 = v27(v44, v31.userId, v31.combinedName, v31.dismissCallback, v54);
    local v64 = v3.useMemo(function() --[[ Line: 128 ]]
        -- upvalues: l_Images_0 (ref), v33 (copy), v38 (copy), v41 (copy), v31 (copy), l_PresenceType_0 (ref), l_Theme_0 (copy), v3 (ref), l_PlayerContext_0 (ref), v55 (copy)
        local v56 = l_Images_0["component_assets/circle_26_stroke_3"];
        local l_Color_0 = v33.Theme.OfflineStatus.Color;
        local l_Transparency_0 = v33.Theme.OfflineStatus.Transparency;
        local v59 = 12;
        local l_offlineStatusLabel_0 = v38.offlineStatusLabel;
        local l_TextMuted_0 = v33.Theme.TextMuted;
        local v62 = nil;
        local v63 = nil;
        if v41 then
            v62 = v41.userPresenceType;
            v63 = v41.lastLocation;
        else
            v62 = if v31.userPresenceType then l_PresenceType_0[v31.userPresenceType] else l_PresenceType_0.Offline;
            v63 = v31.lastLocation or "";
        end;
        if v62 == l_PresenceType_0.Online then
            v56 = l_Images_0["component_assets/circle_16"];
            l_Color_0 = v33.Theme.OnlineStatus.Color;
            l_Transparency_0 = v33.Theme.OnlineStatus.Transparency;
            l_offlineStatusLabel_0 = v38.onlineStatusLabel;
            l_TextMuted_0 = v33.Theme.TextMuted;
            v59 = 12;
        elseif v62 == l_PresenceType_0.InGame then
            v56 = l_Images_0["icons/menu/games_small"];
            l_Color_0 = v33.Theme.IconEmphasis.Color;
            l_Transparency_0 = v33.Theme.IconEmphasis.Transparency;
            l_offlineStatusLabel_0 = v63;
            l_TextMuted_0 = l_Theme_0.TextEmphasis;
            v59 = 16;
        elseif v62 == l_PresenceType_0.InStudio then
            v56 = l_Images_0["icons/logo/studiologo_small"];
            l_Color_0 = v33.Theme.TextDefault.Color;
            l_Transparency_0 = v33.Theme.TextDefault.Transparency;
            l_offlineStatusLabel_0 = v38.studioStatusLabel;
            l_TextMuted_0 = v33.Theme.TextMuted;
            v59 = 16;
        end;
        return v3.createElement(l_PlayerContext_0, {
            fontStyle = v33.Font.CaptionBody, 
            icon = v56, 
            iconColor = l_Color_0, 
            iconSize = UDim2.fromOffset(v59, v59), 
            iconTransparency = l_Transparency_0, 
            layoutOrder = 2, 
            onActivated = v55, 
            text = l_offlineStatusLabel_0, 
            textColorStyle = l_TextMuted_0, 
            textHeight = 24
        });
    end, {
        v41, 
        v33, 
        v38.offlineStatusLabel, 
        v38.onlineStatusLabel, 
        v38.studioStatusLabel
    });
    local v65 = v3.useCallback(function() --[[ Line: 185 ]]
        -- upvalues: v32 (copy), v26 (ref), v37 (copy), v31 (copy), v28 (ref), v36 (copy), v24 (ref)
        v32.fireEvent(v26.PhoneBookPlayerMenuOpened, {
            eventTimestampMs = os.time() * 1000, 
            friendUserId = v37.userId, 
            searchQueryString = v31.searchQueryString, 
            itemListIndex = v31.itemListIndex, 
            isSuggestedUser = v31.isSuggestedUser, 
            page = v28.FriendList
        });
        v36(v24(v37));
    end, l_dependencyArray_0(v37.userId, v31.searchQueryString, v31.itemListIndex, v31.isSuggestedUser));
    return v3.createElement(l_Interactable_0, {
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.new(1, 0, 0, 68 + v30.Y * 2), 
        BackgroundColor3 = l_Theme_0[v48].Color, 
        BackgroundTransparency = l_Theme_0[v48].Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v31.layoutOrder, 
        onStateChanged = v52, 
        AutoButtonColor = false, 
        [v3.Event.Activated] = v55
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v30.X), 
            PaddingTop = UDim.new(0, v30.Y)
        }), 
        ProfileImage = v3.createElement("ImageButton", {
            Size = UDim2.fromOffset(68, 68), 
            Image = v53, 
            [v3.Event.MouseButton2Up] = v65, 
            [v3.Event.TouchTap] = v65, 
            AutoButtonColor = false
        }, {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        }), 
        Content = v3.createElement("Frame", {
            Position = UDim2.new(0, 80, 0, 0), 
            Size = UDim2.new(1, -(116 + v30.X), 1, -v30.Y), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            NameContent = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 1
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, 4), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                UIPadding = v3.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 6)
                }), 
                CombinedName = v3.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 20), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Font = l_Font_0.Header2.Font, 
                    LayoutOrder = 1, 
                    Text = v31.combinedName, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
                    TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                Username = v3.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 14), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Font = l_Font_0.CaptionBody.Font, 
                    LayoutOrder = 2, 
                    Text = v7.Formatters.formatUsername(v31.userName), 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }), 
            PlayerContext = v64
        }), 
        CallIcon = v3.createElement(l_ImageSetLabel_0, {
            Position = UDim2.new(1, -v30.X - 4, 0.5, -v30.Y / 2), 
            Size = UDim2.fromOffset(24, 24), 
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundTransparency = 1, 
            Image = "rbxassetid://15239343417", 
            ImageColor3 = l_Theme_0.ContextualPrimaryDefault.Color, 
            ImageTransparency = l_Theme_0.ContextualPrimaryDefault.Transparency
        }), 
        Divider = v31.showDivider and v3.createElement("Frame", {
            Position = UDim2.new(0, 0, 1, -1), 
            Size = UDim2.new(1, 0, 0, 1), 
            BackgroundColor3 = l_Theme_0.Divider.Color, 
            BackgroundTransparency = l_Theme_0.Divider.Transparency, 
            BorderSizePixel = 0
        }) or nil
    });
end;