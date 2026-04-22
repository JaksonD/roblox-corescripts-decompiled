local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.Localization);
local v4 = require(l_Parent_0.UIBlox);
local l_useLocalization_0 = v3.Hooks.useLocalization;
local l_ModalWindow_0 = v4.App.Dialog.Modal.ModalWindow;
local l_View_0 = v2.View;
local l_Text_0 = v2.Text;
local l_Icon_0 = v2.Icon;
local l_Button_0 = v2.Button;
local l_InputSize_0 = v2.Enums.InputSize;
local l_IconName_0 = v2.Enums.IconName;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
return function(v15) --[[ Line: 26 ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), l_useSelector_0 (copy), v1 (copy), l_ModalWindow_0 (copy), l_View_0 (copy), l_Icon_0 (copy), l_IconName_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_InputSize_0 (copy)
    local v16 = l_useTokens_0();
    local v17 = l_useLocalization_0({
        modalTitle = "Feature.Durables.InfoModal.Title", 
        modalDescription = "Feature.Durables.InfoModal.Description", 
        actionOK = "CommonUI.Messages.Action.OK"
    });
    local v19 = l_useSelector_0(function(v18) --[[ Line: 35 ]]
        return v18.ScreenSize;
    end);
    return v1.createElement(l_ModalWindow_0, {
        screenSize = v19, 
        isFullHeight = false
    }, {
        Body = v1.createElement(l_View_0, {
            tag = "size-full-0 auto-y padding-large col gap-large", 
            BackgroundTransparency = 1
        }, {
            IconContainer = v1.createElement(l_View_0, {
                tag = "size-full-0 auto-y align-x-center margin-top-medium margin-bottom-medium", 
                LayoutOrder = 0
            }, {
                InnerContainer = v1.createElement(l_View_0, {
                    tag = "size-2000-2000 auto-xy", 
                    BackgroundTransparency = 1
                }, {
                    RotatedSquare = v1.createElement(l_View_0, {
                        tag = "size-full radius-small stroke-default stroke-thicker", 
                        BackgroundTransparency = 1, 
                        Rotation = 25, 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        AnchorPoint = Vector2.new(0.5, 0.5)
                    }, {
                        IconWrapper = v1.createElement(l_View_0, {
                            tag = "size-full", 
                            BackgroundTransparency = 1
                        }, {
                            ClockIcon = v1.createElement(l_Icon_0, {
                                name = l_IconName_0.Clock, 
                                Rotation = -25, 
                                Position = UDim2.fromScale(0.5, 0.5), 
                                AnchorPoint = Vector2.new(0.5, 0.5), 
                                size = v16.Size.Size_600
                            })
                        })
                    })
                })
            }), 
            Title = v1.createElement(l_Text_0, {
                tag = "size-full-0 auto-y text-align-x-left text-heading-medium", 
                Text = v17.modalTitle, 
                LayoutOrder = 1
            }), 
            Description = v1.createElement(l_Text_0, {
                tag = "size-full-0 auto-y text-wrap text-truncate-none text-align-x-left text-body-medium", 
                Text = v17.modalDescription, 
                RichText = true, 
                LayoutOrder = 2
            }), 
            CloseButton = v1.createElement(l_Button_0, {
                LayoutOrder = 5, 
                tag = "size-full-0 auto-y", 
                text = v17.actionOK, 
                size = l_InputSize_0.Medium, 
                width = UDim.new(1, 0), 
                onActivated = v15.onClose, 
                testId = "theCloseButton"
            })
        })
    });
end;