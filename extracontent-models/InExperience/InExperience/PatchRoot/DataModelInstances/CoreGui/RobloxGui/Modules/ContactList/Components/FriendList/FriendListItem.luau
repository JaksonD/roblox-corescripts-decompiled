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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v30 = Random.new();
local v31 = Vector2.new(24, 12);
return function(v32) --[[ Line: 65 ]] --[[ Name: FriendListItem ]]
    -- upvalues: v25 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), v3 (copy), l_GetPresencesFromUserIds_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), l_ControlState_0 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy), v30 (copy), l_SoundGroups_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), v27 (copy), l_Images_0 (copy), l_PresenceType_0 (copy), l_PlayerContext_0 (copy), v26 (copy), v28 (copy), v24 (copy), l_Interactable_0 (copy), v31 (copy), v7 (copy), l_ImageSetLabel_0 (copy)
    local v33 = v25();
    local v34 = l_useStyle_0();
    local l_Theme_0 = v34.Theme;
    local l_Font_0 = v34.Font;
    local v37 = l_useDispatch_0();
    local v38 = {
        userId = v32.userId, 
        userName = v32.userName, 
        combinedName = v32.combinedName
    };
    local v39 = l_useLocalization_0({
        offlineStatusLabel = "InGame.Presence.Label.Offline", 
        onlineStatusLabel = "InGame.Presence.Label.Online", 
        studioStatusLabel = "InGame.Presence.Label.RobloxStudio"
    });
    v3.useEffect(function() --[[ Line: 86 ]]
        -- upvalues: v32 (copy), v37 (copy), l_GetPresencesFromUserIds_0 (ref)
        if v32.userPresenceType == nil then
            v37(l_GetPresencesFromUserIds_0.API({
                v32.userId
            }));
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v32.userId, 
        v32.userPresenceType
    } else l_dependencyArray_0(v32.userId, v32.userPresenceType));
    local v41 = v3.useCallback(function(v40) --[[ Line: 96 ]]
        -- upvalues: v32 (copy)
        return v40.Presence.byUserId[tostring(v32.userId)];
    end, {
        v32.userId
    });
    local v42 = l_useSelector_0(v41);
    local v44 = v3.useCallback(function(v43) --[[ Line: 101 ]]
        return v43.Navigation.currentTag;
    end, {});
    local v45 = l_useSelector_0(v44);
    local v47 = v3.useCallback(function(v46) --[[ Line: 106 ]]
        return v46.Navigation.currentPage;
    end, {});
    local v48 = l_useSelector_0(v47);
    local v49, v50 = v3.useState("BackgroundDefault");
    local v53 = v3.useCallback(function(_, v52) --[[ Line: 112 ]]
        -- upvalues: l_ControlState_0 (ref), v50 (copy), l_SoundManager_0 (ref), l_Sounds_0 (ref), v30 (ref), l_SoundGroups_0 (ref)
        if v52 == l_ControlState_0.Pressed then
            v50("BackgroundOnPress");
            return;
        elseif v52 == l_ControlState_0.Hover then
            v50("BackgroundOnHover");
            l_SoundManager_0:PlaySound(l_Sounds_0.Hover.Name, {
                Volume = 0.5 + v30:NextNumber(-0.25, 0.25), 
                PlaybackSpeed = 1 + v30:NextNumber(-0.5, 0.5)
            }, l_SoundGroups_0.Iris);
            return;
        else
            v50("BackgroundDefault");
            return;
        end;
    end, {});
    local v54 = l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v32.userId)));
    local v55 = {
        searchQueryString = v32.searchQueryString, 
        itemListIndex = v32.itemListIndex, 
        isSuggestedUser = v32.isSuggestedUser, 
        page = v48
    };
    local v56 = v27(v45, v32.userId, v32.combinedName, v32.dismissCallback, v55);
    local v65 = v3.useMemo(function() --[[ Line: 136 ]]
        -- upvalues: l_Images_0 (ref), v34 (copy), v39 (copy), v42 (copy), v32 (copy), l_PresenceType_0 (ref), l_Theme_0 (copy), v3 (ref), l_PlayerContext_0 (ref), v56 (copy)
        local v57 = l_Images_0["component_assets/circle_26_stroke_3"];
        local l_Color_0 = v34.Theme.OfflineStatus.Color;
        local l_Transparency_0 = v34.Theme.OfflineStatus.Transparency;
        local v60 = 12;
        local l_offlineStatusLabel_0 = v39.offlineStatusLabel;
        local l_TextMuted_0 = v34.Theme.TextMuted;
        local v63 = nil;
        local v64 = nil;
        if v42 then
            v63 = v42.userPresenceType;
            v64 = v42.lastLocation;
        else
            v63 = if v32.userPresenceType then l_PresenceType_0[v32.userPresenceType] else l_PresenceType_0.Offline;
            v64 = v32.lastLocation or "";
        end;
        if v63 == l_PresenceType_0.Online then
            v57 = l_Images_0["component_assets/circle_16"];
            l_Color_0 = v34.Theme.OnlineStatus.Color;
            l_Transparency_0 = v34.Theme.OnlineStatus.Transparency;
            l_offlineStatusLabel_0 = v39.onlineStatusLabel;
            l_TextMuted_0 = v34.Theme.TextMuted;
            v60 = 12;
        elseif v63 == l_PresenceType_0.InGame then
            v57 = l_Images_0["icons/menu/games_small"];
            l_Color_0 = v34.Theme.IconEmphasis.Color;
            l_Transparency_0 = v34.Theme.IconEmphasis.Transparency;
            l_offlineStatusLabel_0 = v64;
            l_TextMuted_0 = l_Theme_0.TextEmphasis;
            v60 = 16;
        elseif v63 == l_PresenceType_0.InStudio then
            v57 = l_Images_0["icons/logo/studiologo_small"];
            l_Color_0 = v34.Theme.TextDefault.Color;
            l_Transparency_0 = v34.Theme.TextDefault.Transparency;
            l_offlineStatusLabel_0 = v39.studioStatusLabel;
            l_TextMuted_0 = v34.Theme.TextMuted;
            v60 = 16;
        end;
        return v3.createElement(l_PlayerContext_0, {
            fontStyle = v34.Font.CaptionBody, 
            icon = v57, 
            iconColor = l_Color_0, 
            iconSize = UDim2.fromOffset(v60, v60), 
            iconTransparency = l_Transparency_0, 
            layoutOrder = 2, 
            onActivated = v56, 
            text = l_offlineStatusLabel_0, 
            textColorStyle = l_TextMuted_0, 
            textHeight = 24
        });
    end, {
        v42, 
        v34, 
        v39.offlineStatusLabel, 
        v39.onlineStatusLabel, 
        v39.studioStatusLabel
    });
    local v66 = v3.useCallback(function() --[[ Line: 194 ]]
        -- upvalues: v33 (copy), v26 (ref), v38 (copy), v32 (copy), v28 (ref), v37 (copy), v24 (ref)
        v33.fireEvent(v26.PhoneBookPlayerMenuOpened, {
            eventTimestampMs = os.time() * 1000, 
            friendUserId = v38.userId, 
            searchQueryString = v32.searchQueryString, 
            itemListIndex = v32.itemListIndex, 
            isSuggestedUser = v32.isSuggestedUser, 
            page = v28.FriendList
        });
        v37(v24(v38));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v38.userId, 
        v32.searchQueryString, 
        v32.itemListIndex, 
        v32.isSuggestedUser
    } else l_dependencyArray_0(v38.userId, v32.searchQueryString, v32.itemListIndex, v32.isSuggestedUser));
    return v3.createElement(l_Interactable_0, {
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.new(1, 0, 0, 68 + v31.Y * 2), 
        BackgroundColor3 = l_Theme_0[v49].Color, 
        BackgroundTransparency = l_Theme_0[v49].Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v32.layoutOrder, 
        onStateChanged = v53, 
        AutoButtonColor = false, 
        [v3.Event.Activated] = v56
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v31.X), 
            PaddingTop = UDim.new(0, v31.Y)
        }), 
        ProfileImage = v3.createElement("ImageButton", {
            Size = UDim2.fromOffset(68, 68), 
            Image = v54, 
            [v3.Event.MouseButton2Up] = v66, 
            [v3.Event.TouchTap] = v66, 
            AutoButtonColor = false
        }, {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        }), 
        Content = v3.createElement("Frame", {
            Position = UDim2.new(0, 80, 0, 0), 
            Size = UDim2.new(1, -(116 + v31.X), 1, -v31.Y), 
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
                    Text = v32.combinedName, 
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
                    Text = v7.Formatters.formatUsername(v32.userName), 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }), 
            PlayerContext = v65
        }), 
        CallIcon = v3.createElement(l_ImageSetLabel_0, {
            Position = UDim2.new(1, -v31.X - 4, 0.5, -v31.Y / 2), 
            Size = UDim2.fromOffset(24, 24), 
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundTransparency = 1, 
            Image = "rbxassetid://15239343417", 
            ImageColor3 = l_Theme_0.ContextualPrimaryDefault.Color, 
            ImageTransparency = l_Theme_0.ContextualPrimaryDefault.Transparency
        }), 
        Divider = v32.showDivider and v3.createElement("Frame", {
            Position = UDim2.new(0, 0, 1, -1), 
            Size = UDim2.new(1, 0, 0, 1), 
            BackgroundColor3 = l_Theme_0.Divider.Color, 
            BackgroundTransparency = l_Theme_0.Divider.Transparency, 
            BorderSizePixel = 0
        }) or nil
    });
end;