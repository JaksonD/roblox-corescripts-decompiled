local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_PartialPageModal_0 = v3.App.Dialog.Modal.PartialPageModal;
local l_getPartialPageModalMiddleContentWidth_0 = v3.App.Dialog.Modal.getPartialPageModalMiddleContentWidth;
local v9 = require(l_script_FirstAncestor_0.Utils.mergeProps);
local function v10() --[[ Line: 31 ]] --[[ Name: noOp ]]

end;
local v11 = {
    onClose = v10, 
    isButtonDisabled = false, 
    onExtraButtonClick = v10, 
    isExtraButtonDisabled = false
};
local function v19(v12, v13, v14, v15, v16, v17) --[[ Line: 40 ]] --[[ Name: getButtonStackProps ]]
    -- upvalues: l_ButtonType_0 (copy)
    local v18 = {
        {
            buttonType = l_ButtonType_0.PrimarySystem, 
            props = {
                onActivated = v13, 
                text = v12, 
                isDisabled = v14
            }
        }
    };
    if v15 and v15 ~= "" then
        table.insert(v18, 1, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                onActivated = v16, 
                text = v15, 
                isDisabled = v17
            }
        });
    end;
    return {
        buttonHeight = 48, 
        forcedFillDirection = Enum.FillDirection.Vertical, 
        buttons = v18
    };
end;
return function(v20) --[[ Line: 76 ]] --[[ Name: EntryView ]]
    -- upvalues: v9 (copy), v11 (copy), l_getPartialPageModalMiddleContentWidth_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v2 (copy), l_PartialPageModal_0 (copy), v19 (copy)
    local v21 = v9(v11, v20);
    local v22 = l_getPartialPageModalMiddleContentWidth_0(v21.screenSize.X);
    local v23 = {
        titleKey = v21.titleKey, 
        descriptionKey = v21.descriptionKey, 
        buttonKey = v21.buttonKey
    };
    if v21.extraButtonKey and v21.extraButtonKey ~= "" then
        v23.extraButtonKey = v21.extraButtonKey;
    end;
    local v24 = l_useStyle_0();
    local v25 = l_useLocalization_0(v23);
    v25 = {
        titleKey = "Before you leave", 
        descriptionKey = "This experience would be even more exciting with Voice Chat turned on. Unlock now before your next session.", 
        buttonKey = "Unlock voice chat", 
        extraButtonKey = "Leave experience"
    };
    local l_BaseSize_0 = v24.Font.BaseSize;
    return v2.createElement(l_PartialPageModal_0, {
        title = v25.titleKey, 
        screenSize = v21.screenSize, 
        buttonStackProps = v19(v25.buttonKey, v21.onButtonClick, v21.isButtonDisabled, v25.extraButtonKey, v21.onExtraButtonClick, v21.isExtraButtonDisabled), 
        onCloseClicked = v21.onClose
    }, {
        Middle = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            ContentPadding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12), 
                PaddingBottom = UDim.new(0, 24)
            }), 
            ListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 6)
            }), 
            BodyText = v2.createElement("TextLabel", {
                LayoutOrder = 0, 
                BackgroundTransparency = 1, 
                Text = v25.descriptionKey, 
                TextSize = l_BaseSize_0, 
                TextColor3 = v24.Theme.TextDefault.Color, 
                TextTransparency = v24.Theme.TextDefault.Transparency, 
                Font = v24.Font.Body.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                Size = UDim2.new(0, v22, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                RichText = true
            })
        })
    });
end;