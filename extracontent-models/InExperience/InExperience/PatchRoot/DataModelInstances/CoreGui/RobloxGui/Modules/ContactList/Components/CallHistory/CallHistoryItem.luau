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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v29 = Vector2.new(24, 12);
local function _(v30, v31) --[[ Line: 71 ]] --[[ Name: getIsMissedCall ]]
    -- upvalues: v21 (copy)
    local v32 = false;
    if v30.callerId ~= v31 then
        v32 = v30.status ~= v21.Finished;
    end;
    return v32;
end;
local function _(v34, v35) --[[ Line: 75 ]] --[[ Name: getCallStatusText ]]
    -- upvalues: v21 (copy)
    local v36 = false;
    if v34.callerId ~= v35 then
        v36 = v34.status ~= v21.Finished;
    end;
    if v36 then
        return "Feature.Call.Label.Missed";
    elseif v34.callerId == v35 then
        return "Feature.Call.Label.Outgoing";
    else
        return "Feature.Call.Label.Incoming";
    end;
end;
local function _(v38, v39) --[[ Line: 85 ]] --[[ Name: getCallContextImage ]]
    -- upvalues: v21 (copy)
    local v40 = false;
    if v38.callerId ~= v39 then
        v40 = v38.status ~= v21.Finished;
    end;
    if v40 then
        return "rbxassetid://15239344406";
    elseif v38.callerId == v39 then
        return "rbxassetid://15239341275";
    else
        return "rbxassetid://15239341959";
    end;
end;
local function v52(v42, v43, v44) --[[ Line: 96 ]] --[[ Name: getAbsoluteDiffDays ]]
    local v45 = tonumber(v42:FormatLocalTime("YYYY", v44));
    local v46 = tonumber(v43:FormatLocalTime("YYYY", v44));
    local v47 = tonumber(v42:FormatLocalTime("DDD", v44));
    local v48 = tonumber(v43:FormatLocalTime("DDD", v44));
    local v49 = 0;
    for v50 = v46, v45 - 1 do
        local v51 = 365;
        if v50 % 4 == 0 and (v50 % 100 ~= 0 or v50 % 400 == 0) then
            v51 = 366;
        end;
        v49 = v49 + v51;
    end;
    return v49 + v47 - v48;
end;
local function v59(v53, v54) --[[ Line: 117 ]] --[[ Name: getTimestampText ]]
    -- upvalues: l_LocalizationService_0 (copy), v52 (copy)
    local v55 = DateTime.now();
    local v56 = DateTime.fromUnixTimestampMillis(v53);
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v58 = v52(v55, v56, l_RobloxLocaleId_0);
    if v58 == 0 then
        return v56:FormatLocalTime("LT", l_RobloxLocaleId_0);
    elseif v58 == 1 then
        return v54;
    elseif v58 < 7 then
        return v56:FormatLocalTime("dddd", l_RobloxLocaleId_0);
    else
        return v56:FormatLocalTime("L", l_RobloxLocaleId_0);
    end;
end;
return function(v60) --[[ Line: 135 ]] --[[ Name: CallHistoryItem ]]
    -- upvalues: v8 (copy), l_useLocalization_0 (copy), v21 (copy), v24 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), v4 (copy), l_ControlState_0 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy), v22 (copy), l_SoundGroups_0 (copy), l_useSelector_0 (copy), v27 (copy), v25 (copy), v26 (copy), v23 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_Interactable_0 (copy), v29 (copy), l_ImageSetLabel_0 (copy), v59 (copy)
    local l_callRecord_0 = v60.callRecord;
    local l_localUserId_0 = v60.localUserId;
    assert(#l_callRecord_0.participants == 2, "Expect a local user and single other participant in call.");
    local l_userId_0 = l_callRecord_0.participants[1].userId;
    if l_userId_0 == l_localUserId_0 then
        l_userId_0 = l_callRecord_0.participants[2].userId;
    end;
    local v64 = "";
    local v65 = "";
    local v66 = nil;
    local v67 = v8.Hooks.useUserProfilesFetch({
        userIds = {
            (tostring(l_userId_0))
        }, 
        query = v8.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    if v67.data then
        v64 = v8.Selectors.getCombinedNameFromId(v67.data, l_userId_0);
        v65 = v8.Selectors.getUsernameFromId(v67.data, l_userId_0);
        v66 = {
            userId = l_userId_0, 
            userName = v65, 
            combinedName = v64
        };
        v65 = v8.Formatters.formatUsername(v65);
    end;
    local l_l_useLocalization_0_0 = l_useLocalization_0;
    local v69 = {};
    local v70 = false;
    if l_callRecord_0.callerId ~= l_localUserId_0 then
        v70 = l_callRecord_0.status ~= v21.Finished;
    end;
    v69.callStatusLabel = v70 and "Feature.Call.Label.Missed" or l_callRecord_0.callerId == l_localUserId_0 and "Feature.Call.Label.Outgoing" or "Feature.Call.Label.Incoming";
    v69.yesterdayLabel = "Feature.Call.Label.Yesterday";
    l_l_useLocalization_0_0 = l_l_useLocalization_0_0(v69);
    v69 = l_l_useLocalization_0_0.callStatusLabel;
    local l_yesterdayLabel_0 = l_l_useLocalization_0_0.yesterdayLabel;
    v70 = v24();
    local v72 = l_useStyle_0();
    local l_Theme_0 = v72.Theme;
    local l_Font_0 = v72.Font;
    local v75 = l_useDispatch_0();
    local v76, v77 = v4.useState("BackgroundDefault");
    local v80 = v4.useCallback(function(_, v79) --[[ Line: 182 ]]
        -- upvalues: l_ControlState_0 (ref), v77 (copy), l_SoundManager_0 (ref), l_Sounds_0 (ref), v22 (ref), l_SoundGroups_0 (ref)
        if v79 == l_ControlState_0.Pressed then
            v77("BackgroundOnPress");
            return;
        elseif v79 == l_ControlState_0.Hover then
            v77("BackgroundOnHover");
            l_SoundManager_0:PlaySound(l_Sounds_0.Hover.Name, {
                Volume = 0.5 + v22:NextNumber(-0.25, 0.25), 
                PlaybackSpeed = 1 + v22:NextNumber(-0.5, 0.5)
            }, l_SoundGroups_0.Iris);
            return;
        else
            v77("BackgroundDefault");
            return;
        end;
    end, {});
    local v82 = v4.useCallback(function(v81) --[[ Line: 196 ]]
        return v81.Navigation.currentTag;
    end, {});
    local v83 = l_useSelector_0(v82);
    local v85 = v4.useCallback(function(v84) --[[ Line: 201 ]]
        return v84.Navigation.currentPage;
    end, {});
    local v86 = l_useSelector_0(v85);
    local v87 = {
        searchQueryString = "", 
        itemListIndex = v60.layoutOrder, 
        isSuggestedUser = false, 
        page = v86
    };
    local v88 = v27(v83, l_userId_0, v64, v60.dismissCallback, v87);
    local v89 = v4.useCallback(function() --[[ Line: 215 ]]
        -- upvalues: v70 (copy), v25 (ref), l_userId_0 (ref), v60 (copy), v26 (ref), v75 (copy), v23 (ref), v66 (ref)
        v70.fireEvent(v25.PhoneBookPlayerMenuOpened, {
            eventTimestampMs = os.time() * 1000, 
            friendUserId = l_userId_0, 
            searchQueryString = nil, 
            itemListIndex = v60.layoutOrder, 
            isSuggestedUser = false, 
            page = v26.CallHistory
        });
        v75(v23(v66));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        l_userId_0, 
        v60.layoutOrder
    } else l_dependencyArray_0(l_userId_0, v60.layoutOrder));
    local v90 = l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(l_userId_0)));
    local v91 = false;
    if l_callRecord_0.callerId ~= l_localUserId_0 then
        v91 = l_callRecord_0.status ~= v21.Finished;
    end;
    local l_createElement_0 = v4.createElement;
    local l_l_Interactable_0_0 = l_Interactable_0;
    local v94 = {
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.new(1, 0, 0, 68 + v29.Y * 2), 
        BackgroundColor3 = l_Theme_0[v76].Color, 
        BackgroundTransparency = l_Theme_0[v76].Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v60.layoutOrder, 
        onStateChanged = v80, 
        AutoButtonColor = false, 
        [v4.Event.Activated] = v88
    };
    local v95 = {
        UIPadding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v29.X), 
            PaddingTop = UDim.new(0, v29.Y)
        }), 
        ProfileImage = v4.createElement("ImageButton", {
            Size = UDim2.fromOffset(68, 68), 
            Image = v90, 
            [v4.Event.MouseButton2Up] = v89, 
            [v4.Event.TouchTap] = v89, 
            AutoButtonColor = false
        }, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        })
    };
    local l_createElement_1 = v4.createElement;
    local v97 = "Frame";
    local v98 = {
        Position = UDim2.new(0, 80, 0, 0), 
        Size = UDim2.new(1, -(104 + v29.X), 1, -v29.Y), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    };
    local v99 = {
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
                Text = v64, 
                TextColor3 = if v91 then l_Theme_0.Alert.Color else l_Theme_0.TextEmphasis.Color, 
                TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
                TextTransparency = if v91 then l_Theme_0.Alert.Transparency else l_Theme_0.TextEmphasis.Transparency, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            Username = v4.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 14), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Font = l_Font_0.CaptionBody.Font, 
                LayoutOrder = 2, 
                Text = v65, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        })
    };
    local l_createElement_2 = v4.createElement;
    local v101 = "Frame";
    local v102 = {
        Position = UDim2.new(0, 0, 1, -16), 
        Size = UDim2.new(1, 0, 0, 16), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = 2
    };
    local v103 = {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 4)
        })
    };
    local l_createElement_3 = v4.createElement;
    local l_l_ImageSetLabel_0_0 = l_ImageSetLabel_0;
    local v106 = {
        Size = UDim2.fromOffset(16, 16), 
        BackgroundTransparency = 1, 
        ImageColor3 = l_Theme_0.TextDefault.Color, 
        ImageTransparency = l_Theme_0.TextDefault.Transparency
    };
    local v107 = false;
    if l_callRecord_0.callerId ~= l_localUserId_0 then
        v107 = l_callRecord_0.status ~= v21.Finished;
    end;
    v106.Image = v107 and "rbxassetid://15239344406" or l_callRecord_0.callerId == l_localUserId_0 and "rbxassetid://15239341275" or "rbxassetid://15239341959";
    v103.CallContextImage = l_createElement_3(l_l_ImageSetLabel_0_0, v106);
    v103.DetailsText = v4.createElement("TextLabel", {
        Size = UDim2.fromOffset(0, 14), 
        AutomaticSize = Enum.AutomaticSize.X, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Font = l_Font_0.CaptionBody.Font, 
        Text = v69 .. " \226\128\162 " .. v59(l_callRecord_0.endUtc, l_yesterdayLabel_0), 
        TextColor3 = l_Theme_0.TextDefault.Color, 
        TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
        TextTransparency = l_Theme_0.TextDefault.Transparency, 
        TextTruncate = Enum.TextTruncate.AtEnd, 
        TextYAlignment = Enum.TextYAlignment.Center
    });
    v99.Details = l_createElement_2(v101, v102, v103);
    v95.Content = l_createElement_1(v97, v98, v99);
    v95.CallIcon = v4.createElement(l_ImageSetLabel_0, {
        Position = UDim2.new(1, -v29.X - 4, 0.5, -v29.Y / 2), 
        Size = UDim2.fromOffset(24, 24), 
        AnchorPoint = Vector2.new(1, 0.5), 
        BackgroundTransparency = 1, 
        Image = "rbxassetid://15239343417", 
        ImageColor3 = l_Theme_0.ContextualPrimaryDefault.Color, 
        ImageTransparency = l_Theme_0.ContextualPrimaryDefault.Transparency
    });
    v95.Divider = v60.showDivider and v4.createElement("Frame", {
        Position = UDim2.new(0, 0, 1, -1), 
        Size = UDim2.new(1, 0, 0, 1), 
        BackgroundColor3 = l_Theme_0.Divider.Color, 
        BackgroundTransparency = l_Theme_0.Divider.Transparency, 
        BorderSizePixel = 0
    }) or nil;
    return l_createElement_0(l_l_Interactable_0_0, v94, v95);
end;