local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.UIBlox);
local v5 = require(l_Parent_1.SocialLibraries).SocialLibraries.config({});
local v6 = require(l_Parent_1.Localization);
local _ = require(l_Parent_1.LuauPolyfill);
local l_Analytics_0 = require(l_Parent_0.Analytics).Analytics;
local v9 = require(l_Parent_0.Analytics.EventNames);
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_DropdownMenu_0 = v4.App.Menu.DropdownMenu;
local l_IconSize_0 = v4.App.Constant.IconSize;
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_StyledTextLabel_0 = v4.App.Text.StyledTextLabel;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_UtilityActionIcon_0 = v4.App.Button.UtilityActionIcon;
local l_CallbackInputBox_0 = v5.Components.CallbackInputBox;
local l_getDeepValue_0 = v5.Dictionary.getDeepValue;
local l_useLocalization_0 = v6.Hooks.useLocalization;
local v22 = require(l_Parent_0.Common.TextKeys);
local v23 = game:DefineFastInt("FriendRequestNicknameMinChars", 2);
local v24 = game:DefineFastInt("FriendRequestNicknameMaxChars", 20);
local v25 = game:DefineFastInt("FriendRequestNicknameMaxHistory", 3);
local v26 = game:DefineFastFlag("FriendRequestNicknamesUIBugFixes", false);
local v27 = {
    Invalid = "Invalid", 
    Valid = "Valid", 
    TooShort = "TooShort", 
    TooLong = "TooLong", 
    InvalidCharacters = "InvalidCharacters", 
    Moderated = "Moderated", 
    ModeratedDisplayName = "ModeratedDisplayNameWithNickname", 
    UpdateThrottled = "UpdateThrottled"
};
local v28 = {
    TEXTBOX_VERTICAL_PADDING = 8, 
    TEXTBOX_HORIZONTAL_PADDING = 12, 
    CONTENT_PADDING = 10, 
    DROPDOWN_FRAME_HEIGHT_CLOSED = 50, 
    DROPDOWN_FRAME_HEIGHT_OPEN_1NICK = 180, 
    DROPDOWN_FRAME_HEIGHT_OPEN_2NICKS = 240, 
    DROPDOWN_FRAME_HEIGHT_OPEN_3NICKS = 300, 
    DROPDOWN_FRAME_POSITION = 300, 
    DROPDOWN_HEIGHT = 50, 
    MODAL_POSITION = 0.4
};
return function(v29) --[[ Line: 77 ]]
    -- upvalues: l_useLocalization_0 (copy), v22 (copy), v27 (copy), v23 (copy), v24 (copy), l_useStyle_0 (copy), l_Analytics_0 (copy), l_AppStorageService_0 (copy), v25 (copy), v3 (copy), v28 (copy), v26 (copy), v9 (copy), l_getDeepValue_0 (copy), l_Images_0 (copy), l_InteractiveAlert_0 (copy), l_StyledTextLabel_0 (copy), l_ImageSetLabel_0 (copy), l_CallbackInputBox_0 (copy), l_IconSize_0 (copy), l_DropdownMenu_0 (copy), l_UtilityActionIcon_0 (copy), l_ButtonType_0 (copy)
    local v30 = l_useLocalization_0({
        titleText = v22.TitleText, 
        bodyText = if v29.recipientDisplayName then {
            v22.BodyText; 
            displayName = "<font weight=\"medium\">" .. v29.recipientDisplayName .. "</font>"
        } else {
            v22.BodyTextNoDisplayName
        }, 
        privacyText = if v29.recipientDisplayName then {
            v22.PrivacyText; 
            displayName = v29.recipientDisplayName
        } else {
            v22.PrivacyTextNoDisplayName
        }, 
        skipButtonText = v22.Skip, 
        addNicknameText = v22.AddNickname, 
        dropdownEntryText = v22.NicknameDropdownLabel, 
        errorInvalidText = v22.ErrorMessageInvalid, 
        errorTooShortText = v22.ErrorTooShort, 
        errorTooLongText = v22.ErrorTooLong, 
        errorInvalidCharactersText = v22.ErrorInvalidCharacters, 
        errorModeratedText = v22.ErrorModerated, 
        errorThrottledText = v22.ErrorMessageThrottled, 
        dropdownPlaceholder = v22.DropdownPlaceholder, 
        textboxPlaceholder = v22.TextboxPlaceholder
    });
    local function v32(v31) --[[ Line: 102 ]]
        -- upvalues: v27 (ref), v30 (copy)
        if v31 == v27.Invalid then
            return v30.errorInvalidText;
        elseif v31 == v27.TooShort then
            return v30.errorTooShortText;
        elseif v31 == v27.TooLong then
            return v30.errorTooLongText;
        elseif v31 == v27.InvalidCharacters then
            return v30.errorInvalidCharactersText;
        elseif v31 == v27.Moderated then
            return v30.errorModeratedText;
        elseif v31 == v27.ModeratedDisplayName then
            return v30.errorModeratedText;
        elseif v31 == v27.UpdateThrottled then
            return v30.errorThrottledText;
        else
            return "";
        end;
    end;
    local l_v23_0 = v23;
    local l_v24_0 = v24;
    local v35 = l_useStyle_0();
    local v36 = l_Analytics_0();
    local l_Theme_0 = v35.Theme;
    local l_Font_0 = v35.Font;
    local v39 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v40 = "";
    if game:GetEngineFeature("FriendRequestNicknameHistoryStorageKey") then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 132 ]]
            -- upvalues: l_AppStorageService_0 (ref)
            return {
                nicknames = l_AppStorageService_0:GetItem("FriendRequestNicknameHistory")
            };
        end);
        v40 = if l_status_0 and l_result_0 and l_result_0.nicknames ~= "" then l_result_0.nicknames else "";
    end;
    if v29.nicknameHistory then
        v40 = v29.nicknameHistory;
    end;
    local v43 = nil;
    v43 = if v40 == "" then {} else string.split(v40, ",");
    while #v43 > v25 do
        table.remove(v43, 1);
    end;
    local v44 = #v43;
    if v40 == "" then
        v29.setOnTextInput(true);
    end;
    local v45, v46 = v3.useState("");
    local v47, v48 = v3.useState("");
    local v49, v50 = v3.useState(0);
    local v51, v52 = v3.useState(v28.DROPDOWN_FRAME_HEIGHT_CLOSED);
    if v26 then
        if v29.onTextInput then
            if v29.screenSize.X > v29.screenSize.Y then
                v28.MODAL_POSITION = 0.28;
            else
                v28.MODAL_POSITION = 0.4;
            end;
        else
            v28.MODAL_POSITION = 0.5;
        end;
    elseif v29.screenSize.X > v29.screenSize.Y then
        v28.MODAL_POSITION = 0.3;
    else
        v28.MODAL_POSITION = 0.4;
    end;
    local v53 = v3.useRef(nil);
    local function v58(v54) --[[ Line: 190 ]]
        -- upvalues: v43 (ref), v25 (ref), l_AppStorageService_0 (ref)
        if game:GetEngineFeature("FriendRequestNicknameHistoryStorageKey") then
            if v54 == "" then
                return;
            else
                for v55, v56 in ipairs(v43) do
                    if v56 == v54 then
                        table.remove(v43, v55);
                        break;
                    end;
                end;
                table.insert(v43, v54);
                while #v43 > v25 do
                    table.remove(v43, 1);
                end;
                local v57 = nil;
                v57 = if #v43 == 0 then v54 else table.concat(v43, ",");
                l_AppStorageService_0:SetItem("FriendRequestNicknameHistory", v57);
                l_AppStorageService_0:Flush();
            end;
        end;
    end;
    local function _(v59) --[[ Line: 223 ]]
        -- upvalues: v52 (copy), v28 (ref), v44 (copy)
        if not v59 then
            v52(v28.DROPDOWN_FRAME_HEIGHT_CLOSED);
            return;
        elseif v44 == 3 then
            v52(v28.DROPDOWN_FRAME_HEIGHT_OPEN_3NICKS);
            return;
        elseif v44 == 2 then
            v52(v28.DROPDOWN_FRAME_HEIGHT_OPEN_2NICKS);
            return;
        elseif v44 == 1 then
            v52(v28.DROPDOWN_FRAME_HEIGHT_OPEN_1NICK);
            return;
        else
            v52(v28.DROPDOWN_FRAME_HEIGHT_CLOSED);
            return;
        end;
    end;
    local function v62() --[[ Line: 240 ]]
        -- upvalues: v29 (copy), v45 (copy), v36 (copy), v9 (ref), v40 (ref), v58 (copy), v48 (copy), v32 (copy), v27 (ref)
        v29.sendFriendRequestWithNickname(v45):andThen(function(_) --[[ Line: 243 ]]
            -- upvalues: v36 (ref), v9 (ref), v29 (ref), v40 (ref), v45 (ref), v58 (ref)
            v36.fireAnalyticsEvent(v9.SetNicknameAddNameClicked, {
                friendshipOriginSourceType = v29.friendRequestSource, 
                previousNicknames = v40, 
                submittedNickname = v45
            });
            v58(v45);
            v29.navigateBack();
        end):catch(function() --[[ Line: 252 ]]
            -- upvalues: v48 (ref), v32 (ref), v27 (ref)
            v48((v32(v27.Invalid)));
        end);
    end;
    local v63 = v3.useCallback(function() --[[ Line: 257 ]]
        -- upvalues: v29 (copy), v36 (copy), v9 (ref), v40 (ref)
        v29.sendFriendRequest();
        v36.fireAnalyticsEvent(v9.SetNicknameSkipClicked, {
            friendshipOriginSourceType = v29.friendRequestSource, 
            previousNicknames = v40
        });
        v29.navigateBack();
    end, {
        v29.sendFriendRequest, 
        v29.navigateBack
    });
    v3.useEffect(function() --[[ Line: 266 ]]
        -- upvalues: v36 (copy), v9 (ref), v29 (copy), v40 (ref)
        v36.fireAnalyticsEvent(v9.SetNicknameModalOpened, {
            friendshipOriginSourceType = v29.friendRequestSource, 
            previousNicknames = v40
        });
    end, {});
    local function v70(v64) --[[ Line: 273 ]]
        -- upvalues: v29 (copy), l_v23_0 (copy), v50 (copy), v48 (copy), v30 (copy), l_v24_0 (copy), v49 (copy), v45 (copy), v53 (copy), l_getDeepValue_0 (ref), v27 (ref), v32 (copy), v46 (copy)
        v29.setSaveButtonEnabled(false);
        local v65 = utf8.len(v64);
        if v65 == nil then
            return;
        else
            local l_v65_0 = v65;
            if l_v65_0 < l_v23_0 then
                v50(l_v65_0);
                v48(v30.errorTooShortText);
                return;
            else
                if l_v24_0 < l_v65_0 then
                    v64 = if v49 == l_v24_0 then v45 else string.sub(v64, 1, utf8.offset(v64, l_v24_0 + 1) - 1);
                    l_v65_0 = l_v24_0;
                    if v53 and v53.current then
                        v53.current.Text = v64;
                    end;
                end;
                v29.validateNickname(v64):andThen(function(v67) --[[ Line: 313 ]]
                    -- upvalues: l_getDeepValue_0 (ref), v27 (ref), v48 (ref), v32 (ref), v29 (ref), v46 (ref), v64 (ref)
                    local v68 = l_getDeepValue_0(v67, "responseBody.status");
                    if v68 ~= v27.Valid then
                        v48((v32(v68)));
                        v29.setSaveButtonEnabled(false);
                        return;
                    else
                        v48("");
                        v29.setSaveButtonEnabled(true);
                        v46(v64);
                        return;
                    end;
                end):catch(function(_) --[[ Line: 325 ]]
                    -- upvalues: v48 (ref), v30 (ref), v29 (ref)
                    v48(v30.errorInvalidText);
                    v29.setSaveButtonEnabled(false);
                end);
                v50(l_v65_0);
                v46(v64);
                return;
            end;
        end;
    end;
    local function v74() --[[ Line: 335 ]]
        -- upvalues: l_Images_0 (ref), v30 (copy), v40 (ref), v43 (ref)
        local v71 = {
            {
                key = "item0", 
                icon = l_Images_0["icons/actions/edit/edit"], 
                text = v30.dropdownEntryText
            }
        };
        if v40 ~= "" then
            for v72 = #v43, 1, -1 do
                local v73 = v43[v72];
                table.insert(v71, {
                    key = "item" .. v72, 
                    text = v73
                });
            end;
        end;
        return v71;
    end;
    return v3.createElement(l_InteractiveAlert_0, {
        title = v30.titleText, 
        titleIcon = l_Images_0["icons/status/success_large"], 
        position = UDim2.new(0.5, 0, v28.MODAL_POSITION, 0), 
        screenSize = v29.screenSize, 
        middleContent = function() --[[ Line: 362 ]] --[[ Name: middleContent ]]
            -- upvalues: v3 (ref), v28 (ref), l_StyledTextLabel_0 (ref), v30 (copy), l_Font_0 (copy), l_Theme_0 (copy), v29 (copy), l_ImageSetLabel_0 (ref), v39 (copy), l_Images_0 (ref), v47 (copy), l_CallbackInputBox_0 (ref), v45 (copy), l_IconSize_0 (ref), v70 (copy), v53 (copy), v40 (ref), v51 (copy), l_DropdownMenu_0 (ref), v46 (copy), v43 (ref), v44 (copy), v52 (copy), v74 (copy), l_UtilityActionIcon_0 (ref), v49 (copy), l_v24_0 (copy)
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                Position = UDim2.new(0.5, 0, 0, v28.DROPDOWN_FRAME_POSITION), 
                LayoutOrder = 1, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    Padding = UDim.new(0, v28.CONTENT_PADDING), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Description = v3.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 1, 
                    text = v30.bodyText, 
                    size = UDim2.new(1, 0, 0, 0), 
                    fontStyle = l_Font_0.Body, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    textWrapped = true, 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    automaticSize = Enum.AutomaticSize.Y, 
                    lineHeight = 1, 
                    fluidSizing = false
                }), 
                Notice = v3.createElement(l_StyledTextLabel_0, {
                    text = v30.privacyText, 
                    layoutOrder = 3, 
                    size = UDim2.new(1, 0, 0, 0), 
                    fontStyle = l_Font_0.CaptionBody, 
                    colorStyle = l_Theme_0.TextMuted, 
                    textWrapped = true, 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    automaticSize = Enum.AutomaticSize.Y, 
                    lineHeight = 1, 
                    fluidSizing = false
                }), 
                InputBackground = if v29.onTextInput then v3.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(1, 0, 0, v39 + v28.TEXTBOX_VERTICAL_PADDING * 2), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 6, 
                    Image = l_Images_0["component_assets/circle_21"], 
                    ImageTransparency = l_Theme_0.UIMuted.Transparency, 
                    ScaleType = Enum.ScaleType.Slice, 
                    ImageColor3 = l_Theme_0.UIMuted.Color, 
                    SliceCenter = Rect.new(8, 8, 9, 9)
                }, {
                    InputBorder = v3.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(1, 0, 0, v39 + v28.TEXTBOX_VERTICAL_PADDING * 2), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        Image = l_Images_0["component_assets/circle_21_stroke_1"], 
                        ScaleType = Enum.ScaleType.Slice, 
                        ImageColor3 = if v47 ~= "" then l_Theme_0.Alert.Color else l_Theme_0.Divider.Color, 
                        SliceCenter = Rect.new(8, 8, 9, 9)
                    }, {
                        Padding = v3.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, v28.TEXTBOX_HORIZONTAL_PADDING), 
                            PaddingRight = UDim.new(0, v28.TEXTBOX_HORIZONTAL_PADDING)
                        }), 
                        InputTextbox = v3.createElement(l_CallbackInputBox_0, {
                            inputTextColor3 = l_Theme_0.TextDefault.Color, 
                            inputTextXAlignment = Enum.TextXAlignment.Left, 
                            inputTextTransparency = l_Theme_0.TextDefault.Transparency, 
                            inputTextSize = v39, 
                            initialInputText = v45, 
                            placeholderText = v30.textboxPlaceholder, 
                            placeholderTextColor3 = l_Theme_0.TextDefault.Color, 
                            captureFocusOnMount = true, 
                            clearIcon = l_Images_0["icons/actions/edit/clear_small"], 
                            clearIconColor3 = l_Theme_0.IconEmphasis.Color, 
                            clearButtonSize = l_IconSize_0.Small, 
                            clearButtonDisabled = false, 
                            textChangedCallback = v70, 
                            inputBoxRef = v53
                        })
                    })
                }) else nil, 
                Dropdown = if not v29.onTextInput and v40 ~= "" then v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v51), 
                    LayoutOrder = 5
                }, {
                    DropdownMenu = v3.createElement(l_DropdownMenu_0, {
                        placeholder = v30.dropdownPlaceholder, 
                        height = UDim.new(0, v28.DROPDOWN_HEIGHT), 
                        onChange = function(v75) --[[ Line: 456 ]] --[[ Name: onChange ]]
                            -- upvalues: v29 (ref), v46 (ref), v43 (ref)
                            local v76 = tonumber(string.gsub(v75, "%D", ""));
                            if v76 then
                                if v76 == 0 then
                                    v29.setOnTextInput(true);
                                    return;
                                else
                                    v46(v43[v76]);
                                    v29.setSaveButtonEnabled(true);
                                end;
                            end;
                        end, 
                        onMenuOpenChange = function(v77) --[[ Line: 470 ]] --[[ Name: onMenuOpenChange ]]
                            -- upvalues: v44 (ref), v52 (ref), v28 (ref)
                            if v77 then
                                if v44 == 3 then
                                    v52(v28.DROPDOWN_FRAME_HEIGHT_OPEN_3NICKS);
                                    return;
                                elseif v44 == 2 then
                                    v52(v28.DROPDOWN_FRAME_HEIGHT_OPEN_2NICKS);
                                    return;
                                elseif v44 == 1 then
                                    v52(v28.DROPDOWN_FRAME_HEIGHT_OPEN_1NICK);
                                    return;
                                else
                                    v52(v28.DROPDOWN_FRAME_HEIGHT_CLOSED);
                                    return;
                                end;
                            else
                                v52(v28.DROPDOWN_FRAME_HEIGHT_CLOSED);
                                return;
                            end;
                        end, 
                        screenSize = v29.screenSize, 
                        errorState = false, 
                        showDropShadow = true, 
                        cellDatas = v74(), 
                        dropdownMenuListPositionFixed = true
                    })
                }) else if v40 ~= "" then v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 30), 
                    LayoutOrder = 5
                }, {
                    TextFrame = v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 30), 
                        LayoutOrder = 5
                    }, {
                        Layout = v3.createElement("UIListLayout", {
                            Padding = UDim.new(0, v28.CONTENT_PADDING), 
                            FillDirection = Enum.FillDirection.Horizontal, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        Padding = v3.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, v28.TEXTBOX_HORIZONTAL_PADDING)
                        }), 
                        Text = v3.createElement(l_StyledTextLabel_0, {
                            layoutOrder = 5, 
                            text = v30.dropdownEntryText, 
                            fontStyle = l_Font_0.Header2, 
                            colorStyle = l_Theme_0.TextMuted, 
                            textWrapped = true, 
                            textTruncate = Enum.TextTruncate.AtEnd, 
                            textXAlignment = Enum.TextXAlignment.Left, 
                            textYAlignment = Enum.TextYAlignment.Center, 
                            lineHeight = 1, 
                            fluidSizing = false
                        })
                    }), 
                    CancelFrame = v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 30), 
                        LayoutOrder = 5
                    }, {
                        Layout = v3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        Cancel = v3.createElement(l_UtilityActionIcon_0, {
                            layoutOrder = 6, 
                            iconSize = l_IconSize_0.Small, 
                            icon = l_Images_0["icons/actions/edit/clear"], 
                            onActivated = function() --[[ Line: 532 ]] --[[ Name: onActivated ]]
                                -- upvalues: v29 (ref), v52 (ref), v28 (ref), v44 (ref)
                                v29.setOnTextInput(false);
                                v52(v28.DROPDOWN_FRAME_HEIGHT_CLOSED);
                            end
                        })
                    })
                }) else v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 10), 
                    LayoutOrder = 5
                }, {
                    Layout = v3.createElement("UIListLayout", {
                        Padding = UDim.new(0, v28.CONTENT_PADDING), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    PlaceholderElement = v3.createElement(l_StyledTextLabel_0, {
                        layoutOrder = 5, 
                        text = "", 
                        fontStyle = l_Font_0.Header2, 
                        colorStyle = l_Theme_0.TextMuted, 
                        textWrapped = true, 
                        textTruncate = Enum.TextTruncate.AtEnd, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Center, 
                        lineHeight = 1, 
                        fluidSizing = false
                    })
                }), 
                Counter = if v29.onTextInput then v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 7
                }, {
                    UIListLayout = v3.createElement("UIListLayout", {
                        Padding = UDim.new(0, v28.CONTENT_PADDING / 2), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    CountText = v3.createElement(l_StyledTextLabel_0, {
                        layoutOrder = 1, 
                        fontStyle = l_Font_0.CaptionBody, 
                        text = string.format("%d/%d", v49, l_v24_0), 
                        colorStyle = if v49 == l_v24_0 then l_Theme_0.Alert else l_Theme_0.TextMuted, 
                        textXAlignment = Enum.TextXAlignment.Center, 
                        textYAlignment = Enum.TextYAlignment.Top
                    }), 
                    ErrorText = if v47 ~= "" then v3.createElement(l_StyledTextLabel_0, {
                        layoutOrder = 2, 
                        fontStyle = l_Font_0.CaptionBody, 
                        text = v47, 
                        colorStyle = l_Theme_0.Alert, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Top
                    }) else nil
                }) else nil
            });
        end, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = v63, 
                        text = v30.skipButtonText
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v62, 
                        text = v30.addNicknameText, 
                        isDisabled = not v29.isSaveButtonEnabled
                    }
                }
            }
        }
    });
end;