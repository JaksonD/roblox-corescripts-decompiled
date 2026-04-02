local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SignalsReact);
local v5 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local v6 = require(l_script_FirstAncestor_0.Enums.ErrorReason);
local v7 = require(l_script_FirstAncestor_0.Hooks.usePlaceholderLocalization);
local v8 = require(l_script_FirstAncestor_0.Actions.completeRobloxSubscriptionUpsellFlow);
local l_Sheet_0 = v2.Sheet;
local l_View_0 = v2.View;
local l_Text_0 = v2.Text;
local l_Icon_0 = v2.Icon;
local l_Button_0 = v2.Button;
local l_IconName_0 = v2.Enums.IconName;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_FillBehavior_0 = v2.Enums.FillBehavior;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local function v21(v18, v19) --[[ Line: 32 ]] --[[ Name: mapErrorReasonToCopy ]]
    -- upvalues: v6 (copy)
    local v20 = ({
        [v6.GenericError] = {
            v19.GenericErrorTitle, 
            v19.GenericErrorBody
        }, 
        [v6.AlreadySubscribed] = {
            v19.AlreadySubscribedTitle, 
            v19.AlreadySubscribedBody
        }, 
        [v6.UnsupportedPlatform] = {
            v19.UnsupportedPlatformTitle, 
            v19.UnsupportedPlatformBody
        }
    })[v18];
    if v20 then
        return {
            title = v20[1], 
            body = v20[2]
        };
    else
        return {
            title = v19.GenericErrorTitle, 
            body = v19.GenericErrorBody
        };
    end;
end;
return function() --[[ Line: 59 ]] --[[ Name: useErrorSheetSlots ]]
    -- upvalues: v5 (copy), v4 (copy), l_useTokens_0 (copy), v7 (copy), v3 (copy), v21 (copy), v8 (copy), l_Sheet_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_Icon_0 (copy), l_IconName_0 (copy), l_Button_0 (copy), l_FillBehavior_0 (copy), l_ButtonVariant_0 (copy)
    local v22 = v5.get();
    local v23 = v4.useSignalState(v22.getErrorReason);
    local v24 = l_useTokens_0();
    local v25 = v7({
        okButton = "Feature.RobloxSubscription.Action.Ok", 
        GenericErrorTitle = "Feature.RobloxSubscription.Title.GenericError", 
        GenericErrorBody = "Feature.RobloxSubscription.Body.GenericError", 
        AlreadySubscribedTitle = "Feature.RobloxSubscription.Title.AlreadySubscribed", 
        AlreadySubscribedBody = "Feature.RobloxSubscription.Body.AlreadySubscribed", 
        UnsupportedPlatformTitle = "Feature.RobloxSubscription.Title.UnsupportedPlatform", 
        UnsupportedPlatformBody = "Feature.RobloxSubscription.Body.UnsupportedPlatform"
    });
    local v26 = v3.useMemo(function() --[[ Line: 73 ]]
        -- upvalues: v21 (ref), v23 (copy), v25 (copy)
        return (v21(v23, v25));
    end, {
        v23, 
        v25
    });
    local v27 = v3.useCallback(function() --[[ Line: 77 ]]
        -- upvalues: v8 (ref)
        v8();
    end, {});
    return v3.useMemo(function() --[[ Line: 81 ]]
        -- upvalues: v3 (ref), l_Sheet_0 (ref), l_View_0 (ref), l_Text_0 (ref), v26 (copy), l_Icon_0 (ref), l_IconName_0 (ref), v24 (copy), l_Button_0 (ref), v25 (copy), v27 (copy), l_FillBehavior_0 (ref), l_ButtonVariant_0 (ref)
        return {
            Header = v3.createElement(l_Sheet_0.Header, {
                hasCloseAffordance = true
            }, {
                TitleRow = v3.createElement(l_View_0, {
                    LayoutOrder = 1, 
                    tag = "auto-xy gap-small row"
                }, {
                    Title = v3.createElement(l_Text_0, {
                        Text = v26.title, 
                        tag = "auto-xy text-heading-small content-emphasis text-align-x-center"
                    })
                })
            }), 
            Content = v3.createElement(l_Sheet_0.Content, {
                LayoutOrder = 2
            }, {
                Body = v3.createElement(l_View_0, {
                    tag = "col size-full-0 auto-y align-x-center gap-medium padding-x-large"
                }, {
                    CenterIcon = v3.createElement(l_Icon_0, {
                        LayoutOrder = 1, 
                        name = l_IconName_0.TriangleExclamation, 
                        size = v24.Size.Size_1200
                    }), 
                    BodyText = v3.createElement(l_Text_0, {
                        LayoutOrder = 2, 
                        Text = v26.body, 
                        tag = "size-full-0 auto-y text-body-medium content-default text-align-x-center text-wrap"
                    })
                })
            }), 
            Actions = v3.createElement(l_Sheet_0.Actions, {
                LayoutOrder = 3
            }, {
                v3.createElement(l_View_0, {
                    LayoutOrder = 1, 
                    tag = "row wrap auto-xy align-y-center align-x-center size-full-0 gap-medium"
                }, {
                    v3.createElement(l_Button_0, {
                        LayoutOrder = 1, 
                        text = v25.okButton, 
                        onActivated = v27, 
                        fillBehavior = l_FillBehavior_0.Fill, 
                        variant = l_ButtonVariant_0.Emphasis
                    })
                })
            })
        };
    end, {
        v26, 
        v25.okButton, 
        v27
    });
end;