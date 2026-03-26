local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.dependencies);
local v3 = require(l_Parent_0.Common.TextKeys);
local v4 = require(l_Parent_0.Analytics);
local l_EventNames_0 = v4.EventNames;
local l_useAnalytics_0 = v4.useAnalytics;
local l_React_0 = v2.React;
local l_UIBlox_0 = v2.UIBlox;
local l_Foundation_0 = v2.Foundation;
local l_Radius_0 = l_Foundation_0.Enums.Radius;
local l_Skeleton_0 = l_Foundation_0.Skeleton;
local l_RoactFitComponents_0 = v2.RoactFitComponents;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_SocialLibraries_0 = v2.SocialLibraries;
local v15 = require(l_Parent_1.RoactUtils);
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_IconSize_0 = l_UIBlox_0.App.Constant.IconSize;
local l_useEffectOnce_0 = v15.Hooks.useEffectOnce;
local l_CallbackInputBox_0 = l_SocialLibraries_0.Components.CallbackInputBox;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_1.SharedFlags).FFlagConnectionsToFriendsRename;
return function(v27) --[[ Line: 55 ]]
    -- upvalues: l_React_0 (copy), l_useEffectOnce_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v3 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_useAnalytics_0 (copy), l_EventNames_0 (copy), l_InteractiveAlert_0 (copy), l_FitFrameVertical_0 (copy), l_FitTextLabel_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_CallbackInputBox_0 (copy), l_IconSize_0 (copy), l_ButtonType_0 (copy)
    local v28 = l_React_0.useRef(nil);
    local v29, v30 = l_React_0.useState(Vector2.new(0, 0));
    local v31, v32 = l_React_0.useState(v27.alias);
    local v33 = if v27.alias then utf8.len(v27.alias) or 0 else 0;
    local v34, v35 = l_React_0.useState(v33);
    l_useEffectOnce_0(function() --[[ Line: 62 ]]
        -- upvalues: v32 (copy), v27 (copy), v35 (copy), v33 (copy)
        v32(v27.alias);
        v35(v33);
    end, v27.isLoading == false);
    local v36 = l_useStyle_0();
    local l_Font_0 = v36.Font;
    local l_Theme_0 = v36.Theme;
    local v39 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v40 = l_useLocalization_0({
        titleText = v3.CUSTOMIZE_NAME_MODAL_TITLE, 
        cancelButtonText = v3.CANCEL_BUTTON, 
        saveButtonText = v3.SAVE_BUTTON, 
        descriptionText = if v27.displayName then {
            v3.SET_CUSTOM_NAME_DESCRIPTION; 
            displayName = v27.displayName
        } else v3.SET_CUSTOM_NAME_NO_DISPLAY_NAME_DESCRIPTION, 
        recognizeFriendsByCustomNameText = if l_FFlagConnectionsToFriendsRename_0 then v3.RECOGNIZE_FRIENDS_BY_CUSTOM_NAME_DESCRIPTION else v3.RECOGNIZE_CONNECTIONS_BY_CUSTOM_NAME_DESCRIPTION, 
        customNamePlaceholderText = v3.CUSTOM_NAME_PLACEHOLDER, 
        invalidAliasErrorText = v3.INVALID_ALIAS_ERROR
    });
    local v41 = l_useAnalytics_0();
    local v42 = l_React_0.useRef(false);
    local v43 = not v27.hasSaveAliasError;
    local v45 = l_React_0.useCallback(function(v44) --[[ Line: 92 ]]
        -- upvalues: v29 (copy), v30 (copy)
        if v29.X ~= v44.AbsoluteSize.X then
            v30(v44.AbsoluteSize);
        end;
    end, {
        v29
    });
    local function v46() --[[ Line: 98 ]]
        -- upvalues: v27 (copy), v31 (copy)
        v27.saveOnActivated(v31);
    end;
    local function v47() --[[ Line: 102 ]]
        -- upvalues: v41 (copy), l_EventNames_0 (ref), v27 (copy)
        if v41 then
            v41.fireAnalyticsEvent(l_EventNames_0.CustomizeNameModalClosed);
        end;
        v27.cancelOnActivated();
    end;
    local function v51(v48) --[[ Line: 109 ]]
        -- upvalues: v34 (copy), v31 (copy), v28 (copy), v35 (copy), v32 (copy), v27 (copy), v41 (copy), l_EventNames_0 (ref), v42 (copy)
        local v49 = utf8.len(v48);
        if v49 == nil then
            return;
        else
            local l_v49_0 = v49;
            if l_v49_0 > 20 then
                v48 = if v34 == 20 then v31 else string.sub(v48, 1, utf8.offset(v48, 21) - 1);
                l_v49_0 = 20;
                if v28 and v28.current then
                    v28.current.Text = v48;
                end;
            end;
            v35(l_v49_0);
            v32(v48);
            if v27.onTextChanged then
                v27.onTextChanged();
            end;
            if l_v49_0 == 0 and v41 then
                v41.fireAnalyticsEvent(l_EventNames_0.CustomizeNameClearedInput);
            end;
            if l_v49_0 == 20 and v41 and not v42.current then
                v42.current = true;
                v41.fireAnalyticsEvent(l_EventNames_0.CustomizeNameMaximumCharLimitTyped, {
                    alias = v48
                });
            end;
            return;
        end;
    end;
    return l_React_0.createElement(l_InteractiveAlert_0, {
        title = v40.titleText, 
        screenSize = v27.screenSize, 
        anchorPoint = Vector2.new(0.5, 0), 
        position = UDim2.new(0.5, 0, 0, v29.Y), 
        middleContent = function() --[[ Line: 163 ]] --[[ Name: middleContent ]]
            -- upvalues: l_React_0 (ref), l_FitFrameVertical_0 (ref), v45 (copy), l_FitTextLabel_0 (ref), v29 (copy), l_Font_0 (copy), v40 (copy), l_Theme_0 (copy), v27 (copy), l_Skeleton_0 (ref), v39 (copy), l_Radius_0 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), l_CallbackInputBox_0 (ref), l_IconSize_0 (ref), v51 (copy), v28 (copy), v34 (copy)
            return l_React_0.createElement(l_FitFrameVertical_0, {
                BackgroundTransparency = 1, 
                width = UDim.new(1, 0), 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                contentPadding = UDim.new(0, 16), 
                [l_React_0.Change.AbsoluteSize] = v45
            }, {
                InputGroup = l_React_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 1
                }, {
                    UIListLayout = l_React_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Description = l_React_0.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        TextWrapped = true, 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        maximumWidth = v29.X, 
                        Font = l_Font_0.Body.Font, 
                        Text = v40.descriptionText, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        RichText = true
                    }), 
                    RecognizeFriendsByCustomNameContainer = l_React_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromScale(1, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 2
                    }, {
                        UIPadding = l_React_0.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 2), 
                            PaddingBottom = UDim.new(0, 24)
                        }), 
                        RecognizeFriendsByCustomName = l_React_0.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            TextWrapped = true, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            maximumWidth = v29.X, 
                            Font = l_Font_0.CaptionBody.Font, 
                            Text = v40.recognizeFriendsByCustomNameText, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                            TextColor3 = l_Theme_0.TextDefault.Color
                        })
                    }), 
                    LoadingShimmer = if v27.isLoading then l_React_0.createElement(l_Skeleton_0, {
                        Size = UDim2.new(1, 0, 0, v39 + 20), 
                        LayoutOrder = 3, 
                        radius = l_Radius_0.Medium
                    }) else nil, 
                    InputBackground = if not v27.isLoading then l_React_0.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(1, 0, 0, v39 + 20), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 3, 
                        Image = l_Images_0["component_assets/circle_21"], 
                        ImageColor3 = l_Theme_0.UIMuted.Color, 
                        ImageTransparency = l_Theme_0.UIMuted.Transparency, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(8, 8, 9, 9)
                    }, {
                        InputBorder = l_React_0.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.new(1, 0, 0, v39 + 20), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 1, 
                            Image = l_Images_0["component_assets/circle_21_stroke_1"], 
                            ImageColor3 = if v27.hasSaveAliasError then l_Theme_0.Alert.Color else l_Theme_0.Divider.Color, 
                            ScaleType = Enum.ScaleType.Slice, 
                            SliceCenter = Rect.new(8, 8, 9, 9)
                        }, {
                            Padding = l_React_0.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, 12), 
                                PaddingRight = UDim.new(0, 12)
                            }), 
                            Textbox = l_React_0.createElement(l_CallbackInputBox_0, {
                                inputTextXAlignment = Enum.TextXAlignment.Left, 
                                inputTextColor3 = l_Theme_0.TextDefault.Color, 
                                inputTextTransparency = l_Theme_0.TextDefault.Transparency, 
                                inputTextSize = v39, 
                                initialInputText = v27.alias, 
                                placeholderText = v40.customNamePlaceholderText, 
                                placeholderTextColor3 = l_Theme_0.TextDefault.Color, 
                                captureFocusOnMount = true, 
                                clearIcon = l_Images_0["icons/actions/edit/clear_small"], 
                                clearIconColor3 = l_Theme_0.IconEmphasis.Color, 
                                clearIconTransparency = l_Theme_0.IconEmphasis.Transparency, 
                                clearButtonSize = l_IconSize_0.Small, 
                                clearButtonDisabled = false, 
                                textChangedCallback = v51, 
                                inputBoxRef = v28
                            })
                        })
                    }) else nil
                }), 
                Counter = l_React_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 2
                }, {
                    l_React_0.createElement(l_FitTextLabel_0, {
                        BackgroundTransparency = 1, 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        maximumWidth = v29.X, 
                        Font = l_Font_0.CaptionBody.Font, 
                        Text = if v27.hasSaveAliasError then v40.invalidAliasErrorText else string.format("%d/%d", v34, 20), 
                        TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                        TextColor3 = if not (v34 ~= 20) or v27.hasSaveAliasError then l_Theme_0.Alert.Color else l_Theme_0.TextMuted.Color, 
                        TextTransparency = if not (v34 ~= 20) or v27.hasSaveAliasError then l_Theme_0.Alert.Transparency else l_Theme_0.TextMuted.Transparency, 
                        AnchorPoint = if v27.hasSaveAliasError then Vector2.new(0, 0.5) else Vector2.new(1, 0.5), 
                        Position = if v27.hasSaveAliasError then nil else UDim2.fromScale(1, 0)
                    }, {
                        UISizeConstraint = l_React_0.createElement("UISizeConstraint", {
                            MaxSize = Vector2.new(1e999, l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize * 2)
                        })
                    })
                })
            });
        end, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = v47, 
                        text = v40.cancelButtonText
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v46, 
                        text = v40.saveButtonText, 
                        isDisabled = not v43
                    }
                }
            }, 
            buttonHeight = 48, 
            marginBetween = 6, 
            forcedFillDirection = Enum.FillDirection.Horizontal
        }
    });
end;