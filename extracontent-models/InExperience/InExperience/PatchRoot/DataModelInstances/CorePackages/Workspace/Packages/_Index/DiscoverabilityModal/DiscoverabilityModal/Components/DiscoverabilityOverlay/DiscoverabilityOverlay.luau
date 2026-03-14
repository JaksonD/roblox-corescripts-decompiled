local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Common.TextKeys);
local v3 = require(l_Parent_0.dependencies);
local l_Analytics_0 = l_Parent_0.Analytics;
local v5 = require(l_Analytics_0.Enums.EventNames);
local l_React_0 = v3.React;
local l_UIBlox_0 = v3.UIBlox;
local l_useLocalization_0 = v3.Hooks.useLocalization;
local v9 = require(l_Parent_0.Flags.DiscoverabilityUpsellNonPrefillDiscoverableUserIdsWhitelist);
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_PartialPageModal_0 = l_UIBlox_0.App.Dialog.Modal.PartialPageModal;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_Checkbox_0 = l_UIBlox_0.App.InputButton.Checkbox;
local l_RadioButtonList_0 = l_UIBlox_0.App.InputButton.RadioButtonList;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = l_UIBlox_0.App.Constant.IconSize;
local v19 = {
    ["1"] = "Discoverable", 
    ["2"] = "NotDiscoverable", 
    ["nil"] = "Unset"
};
return function(v20) --[[ Line: 52 ]]
    -- upvalues: l_Players_0 (copy), v9 (copy), l_React_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v2 (copy), v5 (copy), v19 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_IconSize_0 (copy), l_Checkbox_0 (copy), l_StyledTextLabel_0 (copy), l_RadioButtonList_0 (copy), l_PartialPageModal_0 (copy), l_ButtonType_0 (copy)
    local l_prefillDiscoverabilitySetting_0 = v20.prefillDiscoverabilitySetting;
    if l_Players_0.LocalPlayer and v9.isWhitelistedUserId(l_Players_0.LocalPlayer.UserId) then
        l_prefillDiscoverabilitySetting_0 = false;
    end;
    local v22, v23 = l_React_0.useState(l_prefillDiscoverabilitySetting_0 and 1 or nil);
    local v24 = l_useStyle_0();
    local l_Font_0 = v24.Font;
    local l_Theme_0 = v24.Theme;
    local v27 = l_useLocalization_0({
        optInText = v2.DISCOVERABILITY_OPT_IN, 
        infoText = v2.DISCOVERABILITY_INFO, 
        learnMoreText = v2.LEARN_MORE, 
        continueText = v2.CONTINUE, 
        yesText = v2.YES_OPT_IN, 
        noText = v2.NO_OPT_OUT, 
        titleText = v2.DISCOVERABILITY_TITLE, 
        titleTextPrefillDiscoverable = v2.DISCOVERABILITY_TITLE_PREFILL_DISCOVERABLE, 
        optInTextPrefillDiscoverable = v2.DISCOVERABILITY_OPT_IN_PREFILL_DISCOVERABLE, 
        infoTextPrefillDiscoverable = v2.DISCOVERABILITY_INFO_PREFILL_DISCOVERABLE
    });
    local function v29(v28) --[[ Line: 80 ]]
        -- upvalues: v20 (copy), v5 (ref), v19 (ref), v23 (copy)
        v20.analytics.fireAnalyticsEvent(v5.DiscoverabilityModalRadioButtonClick, {
            selected = v19[tostring(v28)]
        });
        v23(v28);
    end;
    local function v30() --[[ Line: 87 ]]
        -- upvalues: v20 (copy), v19 (ref), v22 (copy)
        v20.onActivated(v19[tostring(v22)]);
    end;
    local v31 = nil;
    local v32 = nil;
    local v33 = nil;
    local v34 = nil;
    local v35 = nil;
    local v36 = nil;
    if l_prefillDiscoverabilitySetting_0 then
        local function v38() --[[ Line: 93 ]]
            -- upvalues: v22 (copy), v20 (copy), v5 (ref), v19 (ref), v23 (copy)
            local v37 = v22 == 1 and 2 or 1;
            v20.analytics.fireAnalyticsEvent(v5.DiscoverabilityModalRadioButtonClick, {
                selected = v19[tostring(v37)]
            });
            v23(v37);
        end;
        v31 = v27.titleTextPrefillDiscoverable;
        v32 = 12;
        v33 = l_React_0.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/graphic/findfriends_xlarge"], 
            ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
            Size = UDim2.fromOffset(l_IconSize_0.XLarge, l_IconSize_0.XLarge), 
            Position = UDim2.fromScale(0.5, 0.5), 
            LayoutOrder = 1
        });
        v34 = l_React_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            UIListLayout = l_React_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, 8), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            UIPadding = l_React_0.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 24)
            }), 
            Checkbox = l_React_0.createElement(l_Checkbox_0, {
                text = "", 
                onActivated = v38, 
                isSelected = v22 == 1, 
                layoutOrder = 1
            }), 
            CheckboxLabel = l_React_0.createElement("TextButton", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Font = l_Font_0.Body.Font, 
                Size = UDim2.fromScale(1, 0), 
                Text = v27.optInTextPrefillDiscoverable, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextSize = l_Font_0.Body.RelativeSize * l_Font_0.BaseSize, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                LayoutOrder = 2, 
                [l_React_0.Event.Activated] = v38
            })
        });
        v35 = v27.infoTextPrefillDiscoverable;
        v36 = l_Theme_0.TextLink.Color;
    else
        v31 = v27.titleText;
        v32 = 24;
        v33 = l_React_0.createElement(l_StyledTextLabel_0, {
            text = v27.optInText, 
            fontStyle = l_Font_0.Body, 
            colorStyle = l_Theme_0.TextDefault, 
            size = UDim2.fromScale(1, 0), 
            automaticSize = Enum.AutomaticSize.Y, 
            textTruncate = Enum.TextTruncate.AtEnd, 
            textXAlignment = Enum.TextXAlignment.Left, 
            textYAlignment = Enum.TextYAlignment.Top, 
            layoutOrder = 1
        });
        v34 = l_React_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            RadioButtonList = l_React_0.createElement(l_RadioButtonList_0, {
                radioButtons = {
                    {
                        label = v27.yesText
                    }, 
                    {
                        label = v27.noText
                    }
                }, 
                elementSize = UDim2.new(1, 0, 0, 50), 
                onActivated = v29, 
                initialValue = v22, 
                padding = UDim.new(0, 0), 
                layoutOrder = 1
            })
        });
        v35 = v27.infoText;
        v36 = l_Theme_0.TextEmphasis.Color;
    end;
    return l_React_0.createElement(l_PartialPageModal_0, {
        title = v31, 
        screenSize = v20.screenSize, 
        onCloseClicked = function() --[[ Line: 187 ]] --[[ Name: onCloseClicked ]]
            -- upvalues: v20 (copy), v19 (ref), v22 (copy)
            v20.onCloseClicked(v19[tostring(v22)]);
        end, 
        buttonStackProps = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v30, 
                        text = v27.continueText
                    }
                }
            }, 
            buttonHeight = 48, 
            marginBetween = 6, 
            forcedFillDirection = Enum.FillDirection.Vertical
        }
    }, {
        ViewContainer = l_React_0.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1
        }, {
            UIListLayout = l_React_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 12), 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            UIPadding = l_React_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v32), 
                PaddingBottom = UDim.new(0, 36)
            }), 
            Header = v33, 
            Selector = v34, 
            Description = l_React_0.createElement(l_StyledTextLabel_0, {
                text = v35, 
                fontStyle = l_Font_0.CaptionBody, 
                colorStyle = l_Theme_0.TextDefault, 
                size = UDim2.fromScale(1, 0), 
                automaticSize = Enum.AutomaticSize.Y, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Top, 
                layoutOrder = 3
            }), 
            LearnMore = l_React_0.createElement("TextButton", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Font = l_Font_0.CaptionBody.Font, 
                Size = UDim2.fromScale(1, 0), 
                Text = v27.learnMoreText, 
                TextColor3 = v36, 
                TextSize = l_Font_0.CaptionBody.RelativeSize * l_Font_0.BaseSize, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                LayoutOrder = 4, 
                [l_React_0.Event.Activated] = v20.onLearnMoreClick
            })
        })
    });
end;