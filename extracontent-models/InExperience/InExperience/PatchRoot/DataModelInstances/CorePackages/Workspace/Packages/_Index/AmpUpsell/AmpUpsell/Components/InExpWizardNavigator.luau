local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactNavigation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Components.WizardContainer);
local l_ActionTypeEnum_0 = require(l_script_FirstAncestor_0.Common.Enums).ActionTypeEnum;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_createLazyComponent_0 = require(l_Parent_0.RoactUtils).Components.createLazyComponent;
local v8 = require(l_script_FirstAncestor_0.Components.Upsells.FacialAgeEstimation.FAEUpsellContainer);
local v9 = require(l_Parent_0.Cryo);
local v10 = require(l_script_FirstAncestor_0.Common.AppScreens);
local v11 = require(l_script_FirstAncestor_0.Components.WebViewServiceWrapper);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v13 = require(l_script_FirstAncestor_0.Components.Upsells.AccountSettingsUpsell);
local v14 = require(l_Parent_0.RobloxSubscriptionPurchaseApp);
local l_RobloxSubscriptionFlowCompleteReason_0 = v14.RobloxSubscriptionFlowCompleteReason;
local l_SurfaceName_0 = v14.SurfaceName;
local v17 = {
    Wizard = "Wizard", 
    FAEUpsell = "FAEUpsell", 
    AccountSettingsUpsell = "AccountSettingsUpsell", 
    SubscriptionUpsell = "SubscriptionUpsell"
};
local function v29(v18) --[[ Line: 39 ]]
    -- upvalues: l_useNavigation_0 (copy), v3 (copy), v10 (copy), l_UrlBuilder_0 (copy), v9 (copy), v17 (copy), l_ActionTypeEnum_0 (copy), v4 (copy)
    local v19 = l_useNavigation_0();
    local v24 = v3.useCallback(function(v20) --[[ Line: 42 ]]
        -- upvalues: v19 (copy), v10 (ref), l_UrlBuilder_0 (ref), v9 (ref), v17 (ref)
        local function v22(v21) --[[ Line: 43 ]]
            -- upvalues: v19 (ref), v10 (ref), l_UrlBuilder_0 (ref)
            v19.push(v10.GenericWebPage, {
                detail = l_UrlBuilder_0.static.settings.account(), 
                extraProps = {
                    title = v21
                }
            });
        end;
        local v23 = v9.Dictionary.join(v20 or {}, {
            openAccountSettings = v22
        });
        v19.push(v17.AccountSettingsUpsell, {
            extraProps = v23
        });
    end, {
        v19
    });
    local v27 = {
        [l_ActionTypeEnum_0.AgeEstimation] = v3.useCallback(function(v25) --[[ Line: 57 ]]
            -- upvalues: v19 (copy), v17 (ref)
            v19.push(v17.FAEUpsell, {
                extraProps = v25
            });
        end, {
            v19
        }), 
        [l_ActionTypeEnum_0.Subscription] = v3.useCallback(function(v26) --[[ Line: 60 ]]
            -- upvalues: v19 (copy), v17 (ref)
            v19.push(v17.SubscriptionUpsell, {
                extraProps = v26
            });
        end, {
            v19
        })
    };
    local v28 = v9.Dictionary.join(v18 or {}, {
        openUpsells = v27, 
        openAccountSettingsUpsell = v24
    });
    return v3.createElement(v4, v28);
end;
local v40 = v2.createRobloxStackNavigator({
    {
        [v17.Wizard] = {
            screen = function(v30) --[[ Line: 76 ]] --[[ Name: screen ]]
                -- upvalues: l_useNavigation_0 (copy), v3 (copy), v29 (copy)
                local v31 = l_useNavigation_0().getParam("extraProps") or v30 and v30.screenProps and v30.screenProps.extraProps;
                return v3.createElement(v29, v31);
            end, 
            navigationOptions = {
                transparent = true, 
                overlayEnabled = true
            }
        }
    }, 
    {
        [v17.FAEUpsell] = {
            screen = l_createLazyComponent_0(function() --[[ Line: 93 ]]
                -- upvalues: v8 (copy)
                return v8;
            end), 
            navigationOptions = {
                transparent = true, 
                overlayEnabled = true
            }
        }
    }, 
    {
        [v17.SubscriptionUpsell] = {
            screen = function(v32) --[[ Line: 104 ]] --[[ Name: screen ]]
                -- upvalues: v3 (copy), v14 (copy), l_RobloxSubscriptionFlowCompleteReason_0 (copy), l_SurfaceName_0 (copy)
                local v33 = v32.navigation.getParam("extraProps") or {};
                v3.useEffect(function() --[[ Line: 117 ]]
                    -- upvalues: v14 (ref), v33 (copy), l_RobloxSubscriptionFlowCompleteReason_0 (ref), l_SurfaceName_0 (ref)
                    local v35 = v14.initiateRobloxSubscriptionPurchase(v33.purchaseUIOptions, {
                        onFlowComplete = function(v34) --[[ Line: 121 ]] --[[ Name: onFlowComplete ]]
                            -- upvalues: l_RobloxSubscriptionFlowCompleteReason_0 (ref), v33 (ref)
                            if v34 == l_RobloxSubscriptionFlowCompleteReason_0.NativePurchaseCompleted then
                                if v33.onSuccess then
                                    v33.onSuccess();
                                    return;
                                end;
                            elseif v33.onCancel then
                                v33.onCancel();
                            end;
                        end
                    }, nil, v33.surfaceName or l_SurfaceName_0.Unspecified, v33.surfaceContext or v14.SurfaceContext.Unspecified);
                    return function() --[[ Line: 141 ]]
                        -- upvalues: v35 (copy)
                        if v35 then
                            v35();
                        end;
                    end;
                end, {});
                return v3.createElement(v3.Fragment, {});
            end, 
            navigationOptions = {
                transparent = true, 
                overlayEnabled = false
            }
        }
    }, 
    {
        [v17.AccountSettingsUpsell] = {
            screen = l_createLazyComponent_0(function() --[[ Line: 159 ]]
                -- upvalues: l_useNavigation_0 (copy), v3 (copy), v13 (copy)
                return function() --[[ Line: 160 ]]
                    -- upvalues: l_useNavigation_0 (ref), v3 (ref), v13 (ref)
                    local v36 = l_useNavigation_0().getParam("extraProps");
                    return v3.createElement(v13, v36);
                end;
            end), 
            navigationOptions = {
                transparent = true, 
                overlayEnabled = true
            }
        }
    }, 
    {
        [v10.GenericWebPage] = {
            screen = function() --[[ Line: 175 ]] --[[ Name: screen ]]
                -- upvalues: l_useNavigation_0 (copy), v11 (copy)
                local v37 = l_useNavigation_0();
                local v38 = v37.getParam("detail");
                local v39 = v37.getParam("extraProps");
                v11.new({
                    url = v38, 
                    title = v39.title or "", 
                    closeCallback = function() --[[ Line: 182 ]] --[[ Name: closeCallback ]]
                        -- upvalues: v37 (copy), v39 (copy)
                        v37.pop();
                        if v39.onClose then
                            v39.onClose();
                        end;
                    end
                }):open();
            end, 
            navigationOptions = {
                transparent = true, 
                overlayEnabled = true
            }
        }
    }
}, {
    initialRouteName = "Wizard", 
    transitionConfig = function() --[[ Line: 202 ]] --[[ Name: transitionConfig ]]
        return {
            transitionSpec = {
                frequency = 100000, 
                dampingRatio = 1
            }
        };
    end
});
return (v2.createAppContainer(v40));