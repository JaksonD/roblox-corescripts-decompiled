local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_script_FirstAncestor_0.Components.AXPartialPageModal.AXPartialPageModal);
local v6 = require(l_Parent_0.Foundation);
local l_View_0 = v6.View;
local l_Text_0 = v6.Text;
local l_ButtonVariant_0 = v6.Enums.ButtonVariant;
local l_InputSize_0 = v6.Enums.InputSize;
local v11 = require(l_Parent_0.ReactFocusNavigation);
local v12 = require(l_Parent_0.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v14 = require(l_script_FirstAncestor_0.Hooks.useFocusOnMountEffect);
local l_FFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss;
local v16 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
return function(v17) --[[ Line: 32 ]] --[[ Name: EnhancedAvatarHeadsFtuxPrompt ]]
    -- upvalues: l_useNavigation_0 (copy), l_useLocalization_0 (copy), v2 (copy), l_FFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss_0 (copy), v11 (copy), v16 (copy), l_FocusNavigationEventNameEnum_0 (copy), v12 (copy), v14 (copy), l_View_0 (copy), l_Text_0 (copy), v5 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    local v18 = l_useNavigation_0();
    local v19 = l_useLocalization_0({
        confirmButtonText = "Feature.Avatar.Action.GotIt", 
        enhancedAvatarHeadsTitle = "Feature.Avatar.Title.EnhancedAvatarHeads", 
        enhancedAvatarHeadsMessage = "Feature.Avatar.Message.EnhancedAvatarHeads"
    });
    local v20 = v18.state.params or {};
    local v21 = v17.onConfirm or v20.onConfirm;
    local v22 = v2.useCallback(function() --[[ Line: 43 ]]
        -- upvalues: v18 (copy)
        v18.goBack();
    end, {
        v18
    });
    local v23 = v2.useCallback(function() --[[ Line: 47 ]]
        -- upvalues: v22 (copy), v21 (copy)
        v22();
        if v21 then
            v21();
        end;
    end, {
        v21, 
        v22
    });
    local v24, v25 = v2.useState(false);
    local v26 = nil;
    if l_FFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss_0 then
        v26 = v2.useRef(nil);
    end;
    if l_FFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss_0 then
        local v27 = v11.useEventMap(v16, v26);
        local v29 = v2.useMemo(function() --[[ Line: 62 ]]
            -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v12 (ref), v23 (copy)
            return {
                [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                    handler = v12.onRelease(function(v28) --[[ Line: 65 ]]
                        -- upvalues: v23 (ref)
                        v28.cancelled = true;
                        v23();
                    end)
                }
            };
        end, {
            v23
        });
        v11.useEventHandlerMap(v29, v27);
    end;
    v2.useEffect(function() --[[ Line: 75 ]]
        -- upvalues: v25 (copy)
        v25(true);
    end, {});
    if l_FFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss_0 then
        v14(v26, 0.15);
    end;
    local function v30() --[[ Line: 86 ]]
        -- upvalues: v2 (ref), l_View_0 (ref), l_Text_0 (ref), v19 (copy)
        return {
            ViewFrame = v2.createElement(l_View_0, {
                tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
            }, {
                PromptBodyTitle = v2.createElement(l_Text_0, {
                    tag = "auto-xy padding-bottom-small padding-top-medium text-align-x-left text-heading-small text-wrap", 
                    Text = v19.enhancedAvatarHeadsTitle, 
                    LayoutOrder = 1
                }), 
                PromptBodyText = v2.createElement(l_Text_0, {
                    tag = "auto-xy text-align-x-left text-body-large text-wrap", 
                    Text = v19.enhancedAvatarHeadsMessage, 
                    LayoutOrder = 2
                })
            })
        };
    end;
    if l_FFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss_0 then
        return v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            ref = v26, 
            SelectionGroup = true, 
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorRight = Enum.SelectionBehavior.Stop
        }, {
            Modal = v2.createElement(v5, {
                visible = v24, 
                onBackgroundPress = v23, 
                buttonStackProps = {
                    rowLayout = false, 
                    buttons = {
                        {
                            props = {
                                onActivated = v23, 
                                text = v19.confirmButtonText, 
                                variant = l_ButtonVariant_0.Emphasis, 
                                size = l_InputSize_0.Medium
                            }
                        }
                    }
                }
            }, (v30()))
        });
    else
        return (v2.createElement(v5, {
            visible = v24, 
            onBackgroundPress = v23, 
            buttonStackProps = {
                rowLayout = false, 
                buttons = {
                    {
                        props = {
                            onActivated = v23, 
                            text = v19.confirmButtonText, 
                            variant = l_ButtonVariant_0.Emphasis, 
                            size = l_InputSize_0.Medium
                        }
                    }
                }
            }
        }, (v30())));
    end;
end;