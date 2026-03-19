local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.React);
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local v3 = require(l_Parent_0.UIBlox);
local l_PartialPageModal_0 = v3.App.Dialog.Modal.PartialPageModal;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
UpsellModal = function(v8) --[[ Line: 25 ]] --[[ Name: UpsellModal ]]
    -- upvalues: l_useTokens_0 (copy), l_useScreenSize_0 (copy), v1 (copy), l_PartialPageModal_0 (copy), l_ButtonType_0 (copy), l_StyledTextLabel_0 (copy)
    local v9 = l_useTokens_0();
    local v10 = l_useScreenSize_0();
    local v11 = v1.createElement(l_PartialPageModal_0, {
        title = v8.titleText, 
        screenSize = v10, 
        onCloseClicked = v8.onCloseModal, 
        buttonStackProps = {
            forcedFillDirection = Enum.FillDirection.Horizontal, 
            buttonHeight = v9.Size.Size_1200, 
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        isDisabled = false, 
                        onActivated = v8.onCancelButtonClick, 
                        text = v8.cancelButtonText
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        isDisabled = false, 
                        onActivated = v8.onActionButtonClick, 
                        text = v8.actionButtonText
                    }
                }
            }
        }
    }, {
        ViewFrame = v1.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }, {
            UIPadding = v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v9.Padding.XXLarge), 
                PaddingBottom = UDim.new(0, v9.Padding.XXLarge)
            }), 
            Text = v1.createElement(l_StyledTextLabel_0, {
                fontStyle = v9.Typography.BodyLarge, 
                colorStyle = v9.Color.Content.Emphasis, 
                size = UDim2.new(1, 0, 0, 0), 
                fluidSizing = false, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Center, 
                automaticSize = Enum.AutomaticSize.Y, 
                text = v8.bodyText
            })
        })
    });
    return v1.createElement("ImageButton", {
        AutoButtonColor = false, 
        Size = UDim2.new(1, 0, 1, 0), 
        ImageTransparency = 1, 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        Content = v11
    });
end;
return UpsellModal;