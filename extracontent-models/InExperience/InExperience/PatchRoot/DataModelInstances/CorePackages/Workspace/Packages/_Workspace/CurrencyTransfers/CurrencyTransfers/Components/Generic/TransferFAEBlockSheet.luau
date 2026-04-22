local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SharedFlags);
local v4 = require(l_script_FirstAncestor_0.Localization.TransferLocalizationKeys);
local v5 = require(l_Parent_0.Foundation);
local l_ButtonVariant_0 = v5.Enums.ButtonVariant;
local l_Sheet_0 = v5.Sheet;
local l_Button_0 = v5.Button;
local l_View_0 = v5.View;
local l_Text_0 = v5.Text;
local l_FillBehavior_0 = v5.Enums.FillBehavior;
local l_useScaledValue_0 = v5.Hooks.useScaledValue;
local l_Enums_0 = v5.Enums;
local l_getIconRichText_0 = v5.Utility.getIconRichText;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v16 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local v17 = require(l_script_FirstAncestor_0.Actions.Send.processTransfer);
local v18 = require(l_script_FirstAncestor_0.Actions.Receive.acceptTransfer);
local v19 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v20 = require(l_script_FirstAncestor_0.Enums.TransferDirection);
local v21 = require(l_Parent_0.AmpUpsell);
local l_AccessResponseEnum_0 = v21.AmpEnums.AccessResponseEnum;
local l_InExpAmpWizardController_0 = v21.InExpAmpWizardController;
local v24 = require(l_script_FirstAncestor_0.Constants.AmpWizardTransferConstants);
local v25 = require(l_script_FirstAncestor_0.Utils.getCounterUserId);
local v26 = require(l_script_FirstAncestor_0.Events.CurrencyTransferTelemetry);
local v27 = require(l_script_FirstAncestor_0.Enums.RobuxTransferFlowEventName);
local v28 = require(l_script_FirstAncestor_0.Utils.logCurrencyTransferCounter);
local v29 = require(l_script_FirstAncestor_0.Utils.logRobuxTransferFlowEvent);
return function(v30) --[[ Line: 54 ]] --[[ Name: TransferFAEBlockSheet ]]
    -- upvalues: l_useLocalization_0 (copy), v4 (copy), v16 (copy), l_useScaledValue_0 (copy), v2 (copy), v28 (copy), v26 (copy), v3 (copy), v29 (copy), v27 (copy), v20 (copy), l_Sheet_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_getIconRichText_0 (copy), l_Enums_0 (copy), l_Button_0 (copy), v19 (copy), v25 (copy), l_InExpAmpWizardController_0 (copy), l_AccessResponseEnum_0 (copy), v18 (copy), v17 (copy), v24 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy)
    local v31 = l_useLocalization_0(v4.Presets.TransferFAEBlockSheet);
    local v32 = v16();
    local l_direction_0 = v30.direction;
    local l_triggerOnClose_0 = v32.triggerOnClose;
    local v35 = v32.getSelectedAmount(false);
    local v36 = l_useScaledValue_0(420);
    v2.useEffect(function() --[[ Line: 63 ]]
        -- upvalues: v28 (ref), v32 (copy), v26 (ref), v3 (ref), v29 (ref), v27 (ref)
        v28(v32, v26.CurrencyTransferFAEBlockSheetShownCounter, {
            recourseSurface = "fae"
        });
        if v3.FFlagEnableRobuxTransferFlowEventIngest then
            v29(v32, v27.fae_block_shown);
        end;
        return nil;
    end, {
        v32
    });
    local v37 = if l_direction_0 == v20.Send then v31.RequireSenderFAE else v31.RequireReceiverFAE;
    local l_RequireFAE_0 = v31.RequireFAE;
    return v2.createElement(l_Sheet_0.Root, {
        preferCenterSheet = true, 
        snapPoints = {
            v36, 
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
                    Text = v37, 
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
                        text = v31.Continue, 
                        onActivated = function() --[[ Line: 157 ]] --[[ Name: onActivated ]]
                            -- upvalues: v28 (ref), v32 (copy), v26 (ref), v3 (ref), v29 (ref), v27 (ref), v30 (copy), v19 (ref), v25 (ref), l_direction_0 (copy), l_InExpAmpWizardController_0 (ref), l_AccessResponseEnum_0 (ref), v20 (ref), v18 (ref), v17 (ref), v35 (copy), l_triggerOnClose_0 (copy), v24 (ref)
                            v28(v32, v26.CurrencyTransferFAEBlockContinueClickedCounter, {
                                recourseSurface = "fae"
                            });
                            if v3.FFlagEnableRobuxTransferFlowEventIngest then
                                v29(v32, v27.fae_continue_clicked);
                            end;
                            if v30.ampFeatureCheck then
                                local v39 = v32.getPromptState(false);
                                v32.setPreviousPromptState(v39);
                                v32.setPromptState(v19.Hidden);
                                local v40 = v25(v32, l_direction_0);
                                local v41 = nil;
                                if v40 then
                                    v41 = {
                                        {
                                            name = "targetUser", 
                                            value = tostring(v40), 
                                            type = "UserId"
                                        }
                                    };
                                end;
                                l_InExpAmpWizardController_0.OpenAmpWizardContainerInExp(v30.ampFeatureCheck, function(v42, _) --[[ Line: 185 ]]
                                    -- upvalues: v32 (ref), l_AccessResponseEnum_0 (ref), v3 (ref), v29 (ref), v27 (ref), l_direction_0 (ref), v20 (ref), v18 (ref), v17 (ref), v35 (ref), l_triggerOnClose_0 (ref)
                                    local v44 = v32.getPreviousPromptState(false);
                                    if v44 then
                                        v32.setPromptState(v44);
                                    end;
                                    if v42 == l_AccessResponseEnum_0.Granted then
                                        if v3.FFlagEnableRobuxTransferFlowEventIngest then
                                            v29(v32, v27.age_verification_completed);
                                        end;
                                        if l_direction_0 == v20.Receive then
                                            v18(v32);
                                            return;
                                        elseif l_direction_0 == v20.Send then
                                            v17(v32, v35 or 0);
                                            return;
                                        end;
                                    else
                                        l_triggerOnClose_0();
                                    end;
                                end, nil, v24.ENTRY_POINT_EVENT_CTX, v41, v24.NAMESPACE_NAME);
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