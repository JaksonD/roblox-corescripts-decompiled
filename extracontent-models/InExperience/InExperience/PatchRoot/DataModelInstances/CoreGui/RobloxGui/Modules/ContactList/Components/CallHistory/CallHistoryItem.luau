local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.Packages.React);
local l_Sounds_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).Sounds;
local l_SoundGroups_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundGroups;
local l_SoundManager_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager;
local v8 = require(l_CorePackages_0.Workspace.Packages.UserProfiles);
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local v10 = require(l_ContactList_0.dependencies);
local l_useDispatch_0 = v10.Hooks.useDispatch;
local l_UIBlox_0 = v10.UIBlox;
local l_dependencyArray_0 = v10.Hooks.dependencyArray;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v10.getStandardSizeAvatarHeadShotRbxthumb;
local l_useLocalization_0 = v10.Hooks.useLocalization;
local l_useSelector_0 = v10.Hooks.useSelector;
local l_ControlState_0 = l_UIBlox_0.Core.Control.Enum.ControlState;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = l_UIBlox_0.Core.Control.Interactable;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v21 = require(l_ContactList_0.Enums.CallState);
local v22 = Random.new();
local v23 = require(l_ContactList_0.Actions.OpenOrUpdateCFM);
local v24 = require(l_ContactList_0.Analytics.useAnalytics);
local v25 = require(l_ContactList_0.Analytics.EventNamesEnum);
local v26 = require(l_ContactList_0.Enums.Pages);
local v27 = require(l_ContactList_0.Hooks.useStartCallCallback);
local v28 = Vector2.new(24, 12);
local function _(v29, v30) --[[ Line: 68 ]] --[[ Name: getIsMissedCall ]]
    -- upvalues: v21 (copy)
    local v31 = false;
    if v29.callerId ~= v30 then
        v31 = v29.status ~= v21.Finished;
    end;
    return v31;
end;
local function _(v33, v34) --[[ Line: 72 ]] --[[ Name: getCallStatusText ]]
    -- upvalues: v21 (copy)
    local v35 = false;
    if v33.callerId ~= v34 then
        v35 = v33.status ~= v21.Finished;
    end;
    if v35 then
        return "Feature.Call.Label.Missed";
    elseif v33.callerId == v34 then
        return "Feature.Call.Label.Outgoing";
    else
        return "Feature.Call.Label.Incoming";
    end;
end;
local function _(v37, v38) --[[ Line: 82 ]] --[[ Name: getCallContextImage ]]
    -- upvalues: v21 (copy)
    local v39 = false;
    if v37.callerId ~= v38 then
        v39 = v37.status ~= v21.Finished;
    end;
    if v39 then
        return "rbxassetid://15239344406";
    elseif v37.callerId == v38 then
        return "rbxassetid://15239341275";
    else
        return "rbxassetid://15239341959";
    end;
end;
local function v51(v41, v42, v43) --[[ Line: 93 ]] --[[ Name: getAbsoluteDiffDays ]]
    local v44 = tonumber(v41:FormatLocalTime("YYYY", v43));
    local v45 = tonumber(v42:FormatLocalTime("YYYY", v43));
    local v46 = tonumber(v41:FormatLocalTime("DDD", v43));
    local v47 = tonumber(v42:FormatLocalTime("DDD", v43));
    local v48 = 0;
    for v49 = v45, v44 - 1 do
        local v50 = 365;
        if v49 % 4 == 0 and (v49 % 100 ~= 0 or v49 % 400 == 0) then
            v50 = 366;
        end;
        v48 = v48 + v50;
    end;
    return v48 + v46 - v47;
end;
local function v58(v52, v53) --[[ Line: 114 ]] --[[ Name: getTimestampText ]]
    -- upvalues: l_LocalizationService_0 (copy), v51 (copy)
    local v54 = DateTime.now();
    local v55 = DateTime.fromUnixTimestampMillis(v52);
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v57 = v51(v54, v55, l_RobloxLocaleId_0);
    if v57 == 0 then
        return v55:FormatLocalTime("LT", l_RobloxLocaleId_0);
    elseif v57 == 1 then
        return v53;
    elseif v57 < 7 then
        return v55:FormatLocalTime("dddd", l_RobloxLocaleId_0);
    else
        return v55:FormatLocalTime("L", l_RobloxLocaleId_0);
    end;
end;
return function(v59) --[[ Line: 132 ]] --[[ Name: CallHistoryItem ]]
    -- upvalues: v8 (copy), l_useLocalization_0 (copy), v21 (copy), v24 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), v4 (copy), l_ControlState_0 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy), v22 (copy), l_SoundGroups_0 (copy), l_useSelector_0 (copy), v27 (copy), v25 (copy), v26 (copy), v23 (copy), l_dependencyArray_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_Interactable_0 (copy), v28 (copy), l_ImageSetLabel_0 (copy), v58 (copy)
    local l_callRecord_0 = v59.callRecord;
    local l_localUserId_0 = v59.localUserId;
    assert(#l_callRecord_0.participants == 2, "Expect a local user and single other participant in call.");
    local l_userId_0 = l_callRecord_0.participants[1].userId;
    if l_userId_0 == l_localUserId_0 then
        l_userId_0 = l_callRecord_0.participants[2].userId;
    end;
    local v63 = "";
    local v64 = "";
    local v65 = nil;
    local v66 = v8.Hooks.useUserProfilesFetch({
        userIds = {
            (tostring(l_userId_0))
        }, 
        query = v8.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    if v66.data then
        v63 = v8.Selectors.getCombinedNameFromId(v66.data, l_userId_0);
        v64 = v8.Selectors.getUsernameFromId(v66.data, l_userId_0);
        v65 = {
            userId = l_userId_0, 
            userName = v64, 
            combinedName = v63
        };
        v64 = v8.Formatters.formatUsername(v64);
    end;
    local l_l_useLocalization_0_0 = l_useLocalization_0;
    local v68 = {};
    local v69 = false;
    if l_callRecord_0.callerId ~= l_localUserId_0 then
        v69 = l_callRecord_0.status ~= v21.Finished;
    end;
    v68.callStatusLabel = v69 and "Feature.Call.Label.Missed" or l_callRecord_0.callerId == l_localUserId_0 and "Feature.Call.Label.Outgoing" or "Feature.Call.Label.Incoming";
    v68.yesterdayLabel = "Feature.Call.Label.Yesterday";
    l_l_useLocalization_0_0 = l_l_useLocalization_0_0(v68);
    v68 = l_l_useLocalization_0_0.callStatusLabel;
    local l_yesterdayLabel_0 = l_l_useLocalization_0_0.yesterdayLabel;
    v69 = v24();
    local v71 = l_useStyle_0();
    local l_Theme_0 = v71.Theme;
    local l_Font_0 = v71.Font;
    local v74 = l_useDispatch_0();
    local v75, v76 = v4.useState("BackgroundDefault");
    local v79 = v4.useCallback(function(_, v78) --[[ Line: 179 ]]
        -- upvalues: l_ControlState_0 (ref), v76 (copy), l_SoundManager_0 (ref), l_Sounds_0 (ref), v22 (ref), l_SoundGroups_0 (ref)
        if v78 == l_ControlState_0.Pressed then
            v76("BackgroundOnPress");
            return;
        elseif v78 == l_ControlState_0.Hover then
            v76("BackgroundOnHover");
            l_SoundManager_0:PlaySound(l_Sounds_0.Hover.Name, {
                Volume = 0.5 + v22:NextNumber(-0.25, 0.25), 
                PlaybackSpeed = 1 + v22:NextNumber(-0.5, 0.5)
            }, l_SoundGroups_0.Iris);
            return;
        else
            v76("BackgroundDefault");
            return;
        end;
    end, {});
    local v81 = v4.useCallback(function(v80) --[[ Line: 193 ]]
        return v80.Navigation.currentTag;
    end, {});
    local v82 = l_useSelector_0(v81);
    local v84 = v4.useCallback(function(v83) --[[ Line: 198 ]]
        return v83.Navigation.currentPage;
    end, {});
    local v85 = l_useSelector_0(v84);
    local v86 = {
        searchQueryString = "", 
        itemListIndex = v59.layoutOrder, 
        isSuggestedUser = false, 
        page = v85
    };
    local v87 = v27(v82, l_userId_0, v63, v59.dismissCallback, v86);
    local v88 = v4.useCallback(function() --[[ Line: 211 ]]
        -- upvalues: v69 (copy), v25 (ref), l_userId_0 (ref), v59 (copy), v26 (ref), v74 (copy), v23 (ref), v65 (ref)
        v69.fireEvent(v25.PhoneBookPlayerMenuOpened, {
            eventTimestampMs = os.time() * 1000, 
            friendUserId = l_userId_0, 
            searchQueryString = nil, 
            itemListIndex = v59.layoutOrder, 
            isSuggestedUser = false, 
            page = v26.CallHistory
        });
        v74(v23(v65));
    end, l_dependencyArray_0(l_userId_0, v59.layoutOrder));
    local v89 = l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(l_userId_0)));
    local v90 = false;
    if l_callRecord_0.callerId ~= l_localUserId_0 then
        v90 = l_callRecord_0.status ~= v21.Finished;
    end;
    local l_createElement_0 = v4.createElement;
    local l_l_Interactable_0_0 = l_Interactable_0;
    local v93 = {
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.new(1, 0, 0, 68 + v28.Y * 2), 
        BackgroundColor3 = l_Theme_0[v75].Color, 
        BackgroundTransparency = l_Theme_0[v75].Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v59.layoutOrder, 
        onStateChanged = v79, 
        AutoButtonColor = false, 
        [v4.Event.Activated] = v87
    };
    local v94 = {
        UIPadding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v28.X), 
            PaddingTop = UDim.new(0, v28.Y)
        }), 
        ProfileImage = v4.createElement("ImageButton", {
            Size = UDim2.fromOffset(68, 68), 
            Image = v89, 
            [v4.Event.MouseButton2Up] = v88, 
            [v4.Event.TouchTap] = v88, 
            AutoButtonColor = false
        }, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        })
    };
    local l_createElement_1 = v4.createElement;
    local v96 = "Frame";
    local v97 = {
        Position = UDim2.new(0, 80, 0, 0), 
        Size = UDim2.new(1, -(104 + v28.X), 1, -v28.Y), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    };
    local v98 = {
        NameContent = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 1
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 4), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            DisplayName = v4.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 20), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Font = l_Font_0.Header2.Font, 
                LayoutOrder = 1, 
                Text = v63, 
                TextColor3 = if v90 then l_Theme_0.Alert.Color else l_Theme_0.TextEmphasis.Color, 
                TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
                TextTransparency = if v90 then l_Theme_0.Alert.Transparency else l_Theme_0.TextEmphasis.Transparency, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            Username = v4.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 14), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Font = l_Font_0.CaptionBody.Font, 
                LayoutOrder = 2, 
                Text = v64, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        })
    };
    local l_createElement_2 = v4.createElement;
    local v100 = "Frame";
    local v101 = {
        Position = UDim2.new(0, 0, 1, -16), 
        Size = UDim2.new(1, 0, 0, 16), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = 2
    };
    local v102 = {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 4)
        })
    };
    local l_createElement_3 = v4.createElement;
    local l_l_ImageSetLabel_0_0 = l_ImageSetLabel_0;
    local v105 = {
        Size = UDim2.fromOffset(16, 16), 
        BackgroundTransparency = 1, 
        ImageColor3 = l_Theme_0.TextDefault.Color, 
        ImageTransparency = l_Theme_0.TextDefault.Transparency
    };
    local v106 = false;
    if l_callRecord_0.callerId ~= l_localUserId_0 then
        v106 = l_callRecord_0.status ~= v21.Finished;
    end;
    v105.Image = v106 and "rbxassetid://15239344406" or l_callRecord_0.callerId == l_localUserId_0 and "rbxassetid://15239341275" or "rbxassetid://15239341959";
    v102.CallContextImage = l_createElement_3(l_l_ImageSetLabel_0_0, v105);
    v102.DetailsText = v4.createElement("TextLabel", {
        Size = UDim2.fromOffset(0, 14), 
        AutomaticSize = Enum.AutomaticSize.X, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Font = l_Font_0.CaptionBody.Font, 
        Text = v68 .. " \226\128\162 " .. v58(l_callRecord_0.endUtc, l_yesterdayLabel_0), 
        TextColor3 = l_Theme_0.TextDefault.Color, 
        TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
        TextTransparency = l_Theme_0.TextDefault.Transparency, 
        TextTruncate = Enum.TextTruncate.AtEnd, 
        TextYAlignment = Enum.TextYAlignment.Center
    });
    v98.Details = l_createElement_2(v100, v101, v102);
    v94.Content = l_createElement_1(v96, v97, v98);
    v94.CallIcon = v4.createElement(l_ImageSetLabel_0, {
        Position = UDim2.new(1, -v28.X - 4, 0.5, -v28.Y / 2), 
        Size = UDim2.fromOffset(24, 24), 
        AnchorPoint = Vector2.new(1, 0.5), 
        BackgroundTransparency = 1, 
        Image = "rbxassetid://15239343417", 
        ImageColor3 = l_Theme_0.ContextualPrimaryDefault.Color, 
        ImageTransparency = l_Theme_0.ContextualPrimaryDefault.Transparency
    });
    v94.Divider = v59.showDivider and v4.createElement("Frame", {
        Position = UDim2.new(0, 0, 1, -1), 
        Size = UDim2.new(1, 0, 0, 1), 
        BackgroundColor3 = l_Theme_0.Divider.Color, 
        BackgroundTransparency = l_Theme_0.Divider.Transparency, 
        BorderSizePixel = 0
    }) or nil;
    return l_createElement_0(l_l_Interactable_0_0, v93, v94);
end;