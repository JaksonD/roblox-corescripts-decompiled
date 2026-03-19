local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_Sheet_0 = v3.Sheet;
local l_Button_0 = v3.Button;
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_FillBehavior_0 = v3.Enums.FillBehavior;
local l_useScaledValue_0 = v3.Hooks.useScaledValue;
local l_Enums_0 = v3.Enums;
local l_getIconRichText_0 = v3.Utility.getIconRichText;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v14 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local v15 = require(l_script_FirstAncestor_0.Actions.Send.processTransfer);
local v16 = require(l_script_FirstAncestor_0.Actions.Receive.acceptTransfer);
local v17 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v18 = require(l_script_FirstAncestor_0.Enums.TransferDirection);
local v19 = require(l_Parent_0.AmpUpsell);
local l_AccessResponseEnum_0 = v19.AmpEnums.AccessResponseEnum;
local l_InExpAmpWizardController_0 = v19.InExpAmpWizardController;
local v22 = require(l_script_FirstAncestor_0.Constants.AmpWizardTransferConstants);
return function(v23) --[[ Line: 47 ]] --[[ Name: TransferFAEBlockSheet ]]
    -- upvalues: l_useLocalization_0 (copy), v14 (copy), v18 (copy), v2 (copy), l_Sheet_0 (copy), l_useScaledValue_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_getIconRichText_0 (copy), l_Enums_0 (copy), l_Button_0 (copy), v17 (copy), l_InExpAmpWizardController_0 (copy), l_AccessResponseEnum_0 (copy), v16 (copy), v15 (copy), v22 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy)
    local v24 = l_useLocalization_0({
        RequireSenderFAE = "Features.Transfers.Transfer.Block.RequireSenderFAE", 
        RequireReceiverFAE = "Features.Transfers.Transfer.Block.RequireReceiverFAE", 
        RequireFAE = "Features.Transfers.Transfer.Body.RequireFAE", 
        Continue = "Features.Transfers.Action.Continue"
    });
    local v25 = v14();
    local l_direction_0 = v23.direction;
    local l_triggerOnClose_0 = v25.triggerOnClose;
    local v28 = v25.getSelectedAmount(false);
    local v29 = if l_direction_0 == v18.Send then v24.RequireSenderFAE else v24.RequireReceiverFAE;
    local l_RequireFAE_0 = v24.RequireFAE;
    return v2.createElement(l_Sheet_0.Root, {
        preferCenterSheet = true, 
        snapPoints = {
            l_useScaledValue_0(420), 
            0.5
        }, 
        onClose = l_triggerOnClose_0
    }, {
        Content = v2.createElement(l_Sheet_0.Content, {
            LayoutOrder = 1
        }, {
            SheetContentContainer = v2.createElement(l_View_0, {
                tag = "col gap-small auto-y size-full-0 align-x-center padding-top-xlarge padding-x-large"
            }, {
                IconsContainer = v2.createElement(l_View_0, {
                    tag = "auto-xy position-relative padding-bottom-large", 
                    Size = UDim2.fromOffset(300, 140), 
                    LayoutOrder = 1
                }, {
                    ShieldIconContainer = v2.createElement(l_View_0, {
                        tag = "radius-medium stroke-default bg-surface-100 align-x-center align-y-center position-absolute", 
                        Size = UDim2.fromOffset(100, 100), 
                        Position = UDim2.new(0.5, -40, 0.5, 10), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Rotation = -15, 
                        ZIndex = 2
                    }, {
                        ShieldIcon = v2.createElement(l_Text_0, {
                            Text = l_getIconRichText_0(l_Enums_0.IconName.ShieldCheck), 
                            tag = "content-emphasis text-align-x-center text-display-medium", 
                            RichText = true, 
                            Size = UDim2.fromOffset(72, 72), 
                            Position = UDim2.new(0.5, 0, 0.5, 0), 
                            AnchorPoint = Vector2.new(0.5, 0.5)
                        })
                    }), 
                    RobuxIconContainer = v2.createElement(l_View_0, {
                        tag = "radius-medium stroke-default bg-surface-100 align-x-center align-y-center position-absolute", 
                        Size = UDim2.fromOffset(100, 100), 
                        Position = UDim2.new(0.5, 55, 0.5, -10), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Rotation = 15, 
                        ZIndex = 1
                    }, {
                        RobuxIcon = v2.createElement(l_Text_0, {
                            Text = l_getIconRichText_0("robux"), 
                            tag = "content-emphasis text-align-x-center text-display-medium", 
                            RichText = true, 
                            Size = UDim2.fromOffset(72, 72), 
                            Position = UDim2.new(0.5, 0, 0.5, 0), 
                            AnchorPoint = Vector2.new(0.5, 0.5)
                        })
                    })
                }), 
                TitleText = v2.createElement(l_Text_0, {
                    Text = v29, 
                    tag = "text-heading-medium content-emphasis text-align-x-left text-wrap padding-top-xlarge", 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 2
                }), 
                BodyText = v2.createElement(l_Text_0, {
                    Text = l_RequireFAE_0, 
                    tag = "text-body-medium content-default text-align-x-left text-wrap", 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 3
                })
            })
        }), 
        Actions = v2.createElement(l_Sheet_0.Actions, {
            LayoutOrder = 2
        }, {
            v2.createElement(l_View_0, {
                tag = "col auto-y align-y-center align-x-center size-full-0 gap-small padding-x-medium padding-bottom-large"
            }, {
                v2.createElement(l_View_0, {
                    tag = "row auto-y size-full-0 gap-small"
                }, {
                    v2.createElement(l_Button_0, {
                        text = v24.Continue, 
                        onActivated = function() --[[ Line: 144 ]] --[[ Name: onActivated ]]
                            -- upvalues: v23 (copy), v25 (copy), v17 (ref), l_InExpAmpWizardController_0 (ref), l_AccessResponseEnum_0 (ref), l_direction_0 (copy), v18 (ref), v16 (ref), v15 (ref), v28 (copy), l_triggerOnClose_0 (copy), v22 (ref)
                            if v23.ampFeatureCheck then
                                local v31 = v25.getPromptState(false);
                                v25.setPreviousPromptState(v31);
                                v25.setPromptState(v17.Hidden);
                                l_InExpAmpWizardController_0.OpenAmpWizardContainerInExp(v23.ampFeatureCheck, function(v32, _) --[[ Line: 155 ]]
                                    -- upvalues: v25 (ref), l_AccessResponseEnum_0 (ref), l_direction_0 (ref), v18 (ref), v16 (ref), v15 (ref), v28 (ref), l_triggerOnClose_0 (ref)
                                    local v34 = v25.getPreviousPromptState(false);
                                    if v34 then
                                        v25.setPromptState(v34);
                                    end;
                                    if v32 == l_AccessResponseEnum_0.Granted then
                                        if l_direction_0 == v18.Receive then
                                            v16(v25);
                                            return;
                                        elseif l_direction_0 == v18.Send then
                                            v15(v25, v28 or 0);
                                            return;
                                        end;
                                    else
                                        l_triggerOnClose_0();
                                    end;
                                end, nil, v22.ENTRY_POINT_EVENT_CTX, v22.NAMESPACE_NAME);
                                return;
                            else
                                print("No ampFeatureCheck available");
                                l_triggerOnClose_0();
                                return;
                            end;
                        end, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        fillBehavior = l_FillBehavior_0.Fill
                    })
                })
            })
        })
    });
end;