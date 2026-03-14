local l_TweenService_0 = game:GetService("TweenService");
local l_Parent_0 = script:FindFirstAncestor("PasskeyUpsell").Parent;
local v2 = require(l_Parent_0.React);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v4 = require(script.Parent.PasskeyUpsellHeaderContainer);
local v5 = require(script.Parent.PasskeyUpsellButtonContainer);
local v6 = require(l_Parent_0.Foundation);
local l_Text_0 = v6.Text;
local l_View_0 = v6.View;
local v9 = require(l_Parent_0.AuthAnalytics);
local l_authPageload_0 = v9.Events.authPageload;
local l_EventStreamConstants_0 = v9.EventStreamConstants;
return function(v12) --[[ Line: 24 ]]
    -- upvalues: v2 (copy), l_authPageload_0 (copy), l_EventStreamConstants_0 (copy), v4 (copy), l_Text_0 (copy), l_View_0 (copy), l_TweenService_0 (copy), l_withLocalization_0 (copy), v5 (copy)
    local v13 = v2.useRef(nil);
    l_authPageload_0(l_EventStreamConstants_0.Context.PasskeyUpsellSuccessScreen);
    local function v18(v14) --[[ Line: 35 ]] --[[ Name: createContent ]]
        -- upvalues: v2 (ref), v4 (ref), v12 (copy), l_EventStreamConstants_0 (ref), v13 (copy), l_Text_0 (ref), l_View_0 (ref)
        local v15 = v2.createElement(v4, {
            localizedTitleText = v14.titleText, 
            onCancelButtonPressed = function() --[[ Line: 38 ]] --[[ Name: onCancelButtonPressed ]]
                -- upvalues: v12 (ref), l_EventStreamConstants_0 (ref)
                v12.onCancelButtonPressed(l_EventStreamConstants_0.Context.PasskeyUpsellSuccessScreen, l_EventStreamConstants_0.Button.DismissCornerX);
            end, 
            shouldRenderGraphic = v12.shouldRenderGraphic
        });
        local v16 = {
            ref = v13, 
            Text = v14.successDescription, 
            tag = "text-body-large text-align-x-left auto-xy text-wrap", 
            LayoutOrder = 2
        };
        if not v12.shouldRenderGraphic then
            v16.Position = UDim2.new(0.75, 0, 0, 0);
            v16.Size = UDim2.new(1, 0, 1, 0);
        end;
        local v17 = v2.createElement(l_Text_0, v16);
        if v12.shouldRenderGraphic then
            return v2.createElement(l_View_0, {
                tag = "auto-xy col"
            }, {
                PasskeyUpsellHeaderContainer = v15, 
                BodyText = v17
            });
        else
            return v2.createElement(v2.Fragment, {}, {
                PasskeyUpsellHeaderContainer = v15, 
                BodyText = v17
            });
        end;
    end;
    local function v22(v19) --[[ Line: 77 ]] --[[ Name: animateSlideIn ]]
        -- upvalues: l_TweenService_0 (ref)
        if not v19 then
            return;
        else
            local v20 = UDim2.new(0, 0, 0, 0);
            local v21 = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
            l_TweenService_0:Create(v19, v21, {
                Position = v20
            }):Play();
            return;
        end;
    end;
    v2.useEffect(function() --[[ Line: 96 ]]
        -- upvalues: v13 (copy), v22 (copy)
        if v13.current then
            v22(v13.current);
        end;
    end, {});
    return l_withLocalization_0({
        titleText = "Authentication.Passkey.Label.UpsellToastPageTitle", 
        successDescription = "Authentication.Passkey.Description.UpsellRegistrationSuccess", 
        continueText = "Authentication.Passkey.Action.Continue"
    })(function(v23) --[[ Line: 106 ]]
        -- upvalues: v2 (ref), v18 (copy), v5 (ref), v12 (copy), l_EventStreamConstants_0 (ref)
        return v2.createElement(v2.Fragment, {}, {
            ContentContainer = v18(v23), 
            PasskeyUpsellButtonContainer = v2.createElement(v5, {
                localizedContinueText = v23.continueText, 
                onContinueButtonPressed = function() --[[ Line: 111 ]] --[[ Name: onContinueButtonPressed ]]
                    -- upvalues: v12 (ref), l_EventStreamConstants_0 (ref)
                    v12.onCancelButtonPressed(l_EventStreamConstants_0.Context.PasskeyUpsellSuccessScreen, l_EventStreamConstants_0.Button.Continue);
                end, 
                layoutOrder = 3
            })
        });
    end);
end;