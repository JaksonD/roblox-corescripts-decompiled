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
local v14 = require(l_script_FirstAncestor_0.Components.Upsells.ParentalRequest.VPCUpsellContainer);
local v15 = require(l_Parent_0.RobloxSubscriptionPurchaseApp);
local l_RobloxSubscriptionFlowCompleteReason_0 = v15.RobloxSubscriptionFlowCompleteReason;
local l_SurfaceName_0 = v15.SurfaceName;
local v18 = {
    Wizard = "Wizard", 
    FAEUpsell = "FAEUpsell", 
    AccountSettingsUpsell = "AccountSettingsUpsell", 
    SubscriptionUpsell = "SubscriptionUpsell", 
    VPCUpsell = "VPCUpsell"
};
local function v32(v19) --[[ Line: 41 ]]
    -- upvalues: l_useNavigation_0 (copy), v3 (copy), v10 (copy), l_UrlBuilder_0 (copy), v9 (copy), v18 (copy), l_ActionTypeEnum_0 (copy), v4 (copy)
    local v20 = l_useNavigation_0();
    local v25 = v3.useCallback(function(v21) --[[ Line: 44 ]]
        -- upvalues: v20 (copy), v10 (ref), l_UrlBuilder_0 (ref), v9 (ref), v18 (ref)
        local function v23(v22) --[[ Line: 45 ]]
            -- upvalues: v20 (ref), v10 (ref), l_UrlBuilder_0 (ref)
            v20.push(v10.GenericWebPage, {
                detail = l_UrlBuilder_0.static.settings.account(), 
                extraProps = {
                    title = v22
                }
            });
        end;
        local v24 = v9.Dictionary.join(v21 or {}, {
            openAccountSettings = v23
        });
        v20.push(v18.AccountSettingsUpsell, {
            extraProps = v24
        });
    end, {
        v20
    });
    local v30 = {
        [l_ActionTypeEnum_0.AgeEstimation] = v3.useCallback(function(v26) --[[ Line: 59 ]]
            -- upvalues: v20 (copy), v18 (ref)
            v20.push(v18.FAEUpsell, {
                extraProps = v26
            });
        end, {
            v20
        }), 
        [l_ActionTypeEnum_0.Subscription] = v3.useCallback(function(v27) --[[ Line: 62 ]]
            -- upvalues: v20 (copy), v18 (ref)
            v20.push(v18.SubscriptionUpsell, {
                extraProps = v27
            });
        end, {
            v20
        }), 
        [l_ActionTypeEnum_0.ParentConsent] = v3.useCallback(function(v28) --[[ Line: 65 ]]
            -- upvalues: v20 (copy), v18 (ref)
            v20.push(v18.VPCUpsell, {
                extraProps = v28
            });
        end, {
            v20
        }), 
        [l_ActionTypeEnum_0.ParentLink] = v3.useCallback(function(v29) --[[ Line: 68 ]]
            -- upvalues: v20 (copy), v18 (ref)
            v20.push(v18.VPCUpsell, {
                extraProps = v29
            });
        end, {
            v20
        })
    };
    local v31 = v9.Dictionary.join(v19 or {}, {
        openUpsells = v30, 
        openAccountSettingsUpsell = v25
    });
    return v3.createElement(v4, v31);
end;
local v44 = v2.createRobloxStackNavigator({
    {
        [v18.Wizard] = {
            screen = function(v33) --[[ Line: 84 ]] --[[ Name: screen ]]
                -- upvalues: l_useNavigation_0 (copy), v3 (copy), v32 (copy)
                local v34 = l_useNavigation_0().getParam("extraProps") or v33 and v33.screenProps and v33.screenProps.extraProps;
                return v3.createElement(v32, v34);
            end, 
            navigationOptions = {
                transparent = true, 
                overlayEnabled = true
            }
        }
    }, 
    {
        [v18.FAEUpsell] = {
            screen = l_createLazyComponent_0(function() --[[ Line: 101 ]]
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
        [v18.SubscriptionUpsell] = {
            screen = function(v35) --[[ Line: 112 ]] --[[ Name: screen ]]
                -- upvalues: v3 (copy), v15 (copy), l_RobloxSubscriptionFlowCompleteReason_0 (copy), l_SurfaceName_0 (copy)
                local v36 = v35.navigation.getParam("extraProps") or {};
                v3.useEffect(function() --[[ Line: 125 ]]
                    -- upvalues: v15 (ref), v36 (copy), l_RobloxSubscriptionFlowCompleteReason_0 (ref), l_SurfaceName_0 (ref)
                    local v38 = v15.initiateRobloxSubscriptionPurchase(v36.purchaseUIOptions, {
                        onFlowComplete = function(v37) --[[ Line: 129 ]] --[[ Name: onFlowComplete ]]
                            -- upvalues: l_RobloxSubscriptionFlowCompleteReason_0 (ref), v36 (ref)
                            if v37 == l_RobloxSubscriptionFlowCompleteReason_0.NativePurchaseCompleted then
                                if v36.onSuccess then
                                    v36.onSuccess();
                                    return;
                                end;
                            elseif v36.onCancel then
                                v36.onCancel();
                            end;
                        end
                    }, nil, v36.surfaceName or l_SurfaceName_0.Unspecified, v36.surfaceContext or v15.SurfaceContext.Unspecified);
                    return function() --[[ Line: 149 ]]
                        -- upvalues: v38 (copy)
                        if v38 then
                            v38();
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
        [v18.AccountSettingsUpsell] = {
            screen = l_createLazyComponent_0(function() --[[ Line: 167 ]]
                -- upvalues: l_useNavigation_0 (copy), v3 (copy), v13 (copy)
                return function() --[[ Line: 168 ]]
                    -- upvalues: l_useNavigation_0 (ref), v3 (ref), v13 (ref)
                    local v39 = l_useNavigation_0().getParam("extraProps");
                    return v3.createElement(v13, v39);
                end;
            end), 
            navigationOptions = {
                transparent = true, 
                overlayEnabled = true
            }
        }
    }, 
    {
        [v18.VPCUpsell] = {
            screen = l_createLazyComponent_0(function() --[[ Line: 182 ]]
                -- upvalues: l_useNavigation_0 (copy), v3 (copy), v14 (copy)
                return function() --[[ Line: 183 ]]
                    -- upvalues: l_useNavigation_0 (ref), v3 (ref), v14 (ref)
                    local v40 = l_useNavigation_0().getParam("extraProps");
                    return v3.createElement(v14, v40);
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
            screen = function() --[[ Line: 198 ]] --[[ Name: screen ]]
                -- upvalues: l_useNavigation_0 (copy), v11 (copy)
                local v41 = l_useNavigation_0();
                local v42 = v41.getParam("detail");
                local v43 = v41.getParam("extraProps");
                v11.new({
                    url = v42, 
                    title = v43.title or "", 
                    closeCallback = function() --[[ Line: 205 ]] --[[ Name: closeCallback ]]
                        -- upvalues: v41 (copy), v43 (copy)
                        v41.pop();
                        if v43.onClose then
                            v43.onClose();
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
    transitionConfig = function() --[[ Line: 225 ]] --[[ Name: transitionConfig ]]
        return {
            transitionSpec = {
                frequency = 100000, 
                dampingRatio = 1
            }
        };
    end
});
return (v2.createAppContainer(v44));