local l_Parent_0 = script:FindFirstAncestor("AdPlayer").Parent;
local l_AdsDisplayOrder_0 = require(l_Parent_0.AdGuiInteractivity).AdsDisplayOrder;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local l_View_0 = v4.View;
local l_Text_0 = v4.Text;
local l_Button_0 = v4.Button;
local l_ButtonVariant_0 = v4.Enums.ButtonVariant;
local l_FillBehavior_0 = v4.Enums.FillBehavior;
local l_StateLayerAffordance_0 = v4.Enums.StateLayerAffordance;
local v11 = {
    confirmationText = "CoreScripts.Ads.Label.RewardedVideoExitConfirmation"
};
return function(v12) --[[ Line: 24 ]] --[[ Name: ExitConfirmationModalComponent ]]
    -- upvalues: l_useLocalization_0 (copy), v11 (copy), v3 (copy), l_AdsDisplayOrder_0 (copy), l_View_0 (copy), l_StateLayerAffordance_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_FillBehavior_0 (copy), l_ButtonVariant_0 (copy)
    local v13 = l_useLocalization_0(v11);
    return v3.createElement("ScreenGui", {
        DisplayOrder = l_AdsDisplayOrder_0.Modal, 
        IgnoreGuiInset = true, 
        Enabled = v12.Enabled
    }, {
        modal = v3.createElement(l_View_0, {
            tag = "anchor-center-center position-center-center bg-over-media-0 radius-medium padding-x-xxlarge padding-y-xxlarge", 
            Size = UDim2.fromOffset(440, 164), 
            onActivated = function() --[[ Line: 35 ]] --[[ Name: onActivated ]]

            end, 
            stateLayer = {
                affordance = l_StateLayerAffordance_0.None
            }
        }, {
            v3.createElement(l_Text_0, {
                tag = "size-full-1100 position-top-center anchor-top-center text-align-x-left", 
                Text = v13.confirmationText, 
                TextScaled = true
            }); 
            buttonContainer = v3.createElement(l_View_0, {
                tag = "size-full-1200 anchor-bottom-center position-bottom-center row gap-medium flex-fill"
            }, {
                cancelExitButton = v3.createElement(l_Button_0, {
                    text = "Continue", 
                    fillBehavior = l_FillBehavior_0.Fill, 
                    width = UDim.new(1, 0), 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = v12.onCancel
                }), 
                confirmExitButton = v3.createElement(l_Button_0, {
                    text = "Exit", 
                    fillBehavior = l_FillBehavior_0.Fill, 
                    width = UDim.new(1, 0), 
                    variant = l_ButtonVariant_0.Standard, 
                    onActivated = v12.onConfirm, 
                    LayoutOrder = 2
                })
            })
        })
    });
end;