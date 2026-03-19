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
return function(v26) --[[ Line: 53 ]]
    -- upvalues: l_React_0 (copy), l_useEffectOnce_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v3 (copy), l_useAnalytics_0 (copy), l_EventNames_0 (copy), l_InteractiveAlert_0 (copy), l_FitFrameVertical_0 (copy), l_FitTextLabel_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_CallbackInputBox_0 (copy), l_IconSize_0 (copy), l_ButtonType_0 (copy)
    local v27 = l_React_0.useRef(nil);
    local v28, v29 = l_React_0.useState(Vector2.new(0, 0));
    local v30, v31 = l_React_0.useState(v26.alias);
    local v32 = if v26.alias then utf8.len(v26.alias) or 0 else 0;
    local v33, v34 = l_React_0.useState(v32);
    l_useEffectOnce_0(function() --[[ Line: 60 ]]
        -- upvalues: v31 (copy), v26 (copy), v34 (copy), v32 (copy)
        v31(v26.alias);
        v34(v32);
    end, v26.isLoading == false);
    local v35 = l_useStyle_0();
    local l_Font_0 = v35.Font;
    local l_Theme_0 = v35.Theme;
    local v38 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v39 = l_useLocalization_0({
        titleText = v3.CUSTOMIZE_NAME_MODAL_TITLE, 
        cancelButtonText = v3.CANCEL_BUTTON, 
        saveButtonText = v3.SAVE_BUTTON, 
        descriptionText = if v26.displayName then {
            v3.SET_CUSTOM_NAME_DESCRIPTION; 
            displayName = v26.displayName
        } else v3.SET_CUSTOM_NAME_NO_DISPLAY_NAME_DESCRIPTION, 
        recognizeFriendsByCustomNameText = v3.RECOGNIZE_CONNECTIONS_BY_CUSTOM_NAME_DESCRIPTION, 
        customNamePlaceholderText = v3.CUSTOM_NAME_PLACEHOLDER, 
        invalidAliasErrorText = v3.INVALID_ALIAS_ERROR
    });
    local v40 = l_useAnalytics_0();
    local v41 = l_React_0.useRef(false);
    local v42 = not v26.hasSaveAliasError;
    local v44 = l_React_0.useCallback(function(v43) --[[ Line: 88 ]]
        -- upvalues: v28 (copy), v29 (copy)
        if v28.X ~= v43.AbsoluteSize.X then
            v29(v43.AbsoluteSize);
        end;
    end, {
        v28
    });
    local function v45() --[[ Line: 94 ]]
        -- upvalues: v26 (copy), v30 (copy)
        v26.saveOnActivated(v30);
    end;
    local function v46() --[[ Line: 98 ]]
        -- upvalues: v40 (copy), l_EventNames_0 (ref), v26 (copy)
        if v40 then
            v40.fireAnalyticsEvent(l_EventNames_0.CustomizeNameModalClosed);
        end;
        v26.cancelOnActivated();
    end;
    local function v50(v47) --[[ Line: 105 ]]
        -- upvalues: v33 (copy), v30 (copy), v27 (copy), v34 (copy), v31 (copy), v26 (copy), v40 (copy), l_EventNames_0 (ref), v41 (copy)
        local v48 = utf8.len(v47);
        if v48 == nil then
            return;
        else
            local l_v48_0 = v48;
            if l_v48_0 > 20 then
                v47 = if v33 == 20 then v30 else string.sub(v47, 1, utf8.offset(v47, 21) - 1);
                l_v48_0 = 20;
                if v27 and v27.current then
                    v27.current.Text = v47;
                end;
            end;
            v34(l_v48_0);
            v31(v47);
            if v26.onTextChanged then
                v26.onTextChanged();
            end;
            if l_v48_0 == 0 and v40 then
                v40.fireAnalyticsEvent(l_EventNames_0.CustomizeNameClearedInput);
            end;
            if l_v48_0 == 20 and v40 and not v41.current then
                v41.current = true;
                v40.fireAnalyticsEvent(l_EventNames_0.CustomizeNameMaximumCharLimitTyped, {
                    alias = v47
                });
            end;
            return;
        end;
    end;
    return l_React_0.createElement(l_InteractiveAlert_0, {
        title = v39.titleText, 
        screenSize = v26.screenSize, 
        anchorPoint = Vector2.new(0.5, 0), 
        position = UDim2.new(0.5, 0, 0, v28.Y), 
        middleContent = function() --[[ Line: 159 ]] --[[ Name: middleContent ]]
            -- upvalues: l_React_0 (ref), l_FitFrameVertical_0 (ref), v44 (copy), l_FitTextLabel_0 (ref), v28 (copy), l_Font_0 (copy), v39 (copy), l_Theme_0 (copy), v26 (copy), l_Skeleton_0 (ref), v38 (copy), l_Radius_0 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), l_CallbackInputBox_0 (ref), l_IconSize_0 (ref), v50 (copy), v27 (copy), v33 (copy)
            return l_React_0.createElement(l_FitFrameVertical_0, {
                BackgroundTransparency = 1, 
                width = UDim.new(1, 0), 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                contentPadding = UDim.new(0, 16), 
                [l_React_0.Change.AbsoluteSize] = v44
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
                        maximumWidth = v28.X, 
                        Font = l_Font_0.Body.Font, 
                        Text = v39.descriptionText, 
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
                            maximumWidth = v28.X, 
                            Font = l_Font_0.CaptionBody.Font, 
                            Text = v39.recognizeFriendsByCustomNameText, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                            TextColor3 = l_Theme_0.TextDefault.Color
                        })
                    }), 
                    LoadingShimmer = if v26.isLoading then l_React_0.createElement(l_Skeleton_0, {
                        Size = UDim2.new(1, 0, 0, v38 + 20), 
                        LayoutOrder = 3, 
                        radius = l_Radius_0.Medium
                    }) else nil, 
                    InputBackground = if not v26.isLoading then l_React_0.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(1, 0, 0, v38 + 20), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 3, 
                        Image = l_Images_0["component_assets/circle_21"], 
                        ImageColor3 = l_Theme_0.UIMuted.Color, 
                        ImageTransparency = l_Theme_0.UIMuted.Transparency, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(8, 8, 9, 9)
                    }, {
                        InputBorder = l_React_0.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.new(1, 0, 0, v38 + 20), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 1, 
                            Image = l_Images_0["component_assets/circle_21_stroke_1"], 
                            ImageColor3 = if v26.hasSaveAliasError then l_Theme_0.Alert.Color else l_Theme_0.Divider.Color, 
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
                                inputTextSize = v38, 
                                initialInputText = v26.alias, 
                                placeholderText = v39.customNamePlaceholderText, 
                                placeholderTextColor3 = l_Theme_0.TextDefault.Color, 
                                captureFocusOnMount = true, 
                                clearIcon = l_Images_0["icons/actions/edit/clear_small"], 
                                clearIconColor3 = l_Theme_0.IconEmphasis.Color, 
                                clearIconTransparency = l_Theme_0.IconEmphasis.Transparency, 
                                clearButtonSize = l_IconSize_0.Small, 
                                clearButtonDisabled = false, 
                                textChangedCallback = v50, 
                                inputBoxRef = v27
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
                        maximumWidth = v28.X, 
                        Font = l_Font_0.CaptionBody.Font, 
                        Text = if v26.hasSaveAliasError then v39.invalidAliasErrorText else string.format("%d/%d", v33, 20), 
                        TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                        TextColor3 = if not (v33 ~= 20) or v26.hasSaveAliasError then l_Theme_0.Alert.Color else l_Theme_0.TextMuted.Color, 
                        TextTransparency = if not (v33 ~= 20) or v26.hasSaveAliasError then l_Theme_0.Alert.Transparency else l_Theme_0.TextMuted.Transparency, 
                        AnchorPoint = if v26.hasSaveAliasError then Vector2.new(0, 0.5) else Vector2.new(1, 0.5), 
                        Position = if v26.hasSaveAliasError then nil else UDim2.fromScale(1, 0)
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
                        onActivated = v46, 
                        text = v39.cancelButtonText
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v45, 
                        text = v39.saveButtonText, 
                        isDisabled = not v42
                    }
                }
            }, 
            buttonHeight = 48, 
            marginBetween = 6, 
            forcedFillDirection = Enum.FillDirection.Horizontal
        }
    });
end;