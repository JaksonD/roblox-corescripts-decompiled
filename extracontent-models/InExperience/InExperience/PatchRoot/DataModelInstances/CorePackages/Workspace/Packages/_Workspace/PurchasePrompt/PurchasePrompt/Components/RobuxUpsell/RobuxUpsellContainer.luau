local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Roact_0 = require(l_Parent_0.PurchasePromptDeps).Roact;
local v4 = require(l_Parent_0.React);
local _ = require(l_Parent_0.IAPExperience);
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CoreScriptsRootProvider_0 = require(l_Parent_0.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v8 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusRoot_0 = v8.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v8.FocusNavigableSurfaceIdentifierEnum;
local v11 = require(l_Parent_0.Navigation);
local v12 = require(l_Parent_0.Cryo);
local v13 = require(l_script_FirstAncestor_0.Selectors.selectPrice);
local v14 = require(l_script_FirstAncestor_0.Actions.PromptNativeUpsellSuggestions);
local v15 = require(l_script_FirstAncestor_0.Enums.PurchaseFlow);
local _ = require(l_script_FirstAncestor_0.Models.RobuxUpsell);
local v17 = require(l_script_FirstAncestor_0.Thunks.completeRequest);
local v18 = require(l_script_FirstAncestor_0.Thunks.purchaseItem);
local v19 = require(l_script_FirstAncestor_0.Thunks.launchRobuxUpsell);
local v20 = require(l_script_FirstAncestor_0.Thunks.openRobuxStore);
local v21 = require(l_script_FirstAncestor_0.Thunks.openSecuritySettings);
local v22 = require(l_script_FirstAncestor_0.Thunks.openTermsOfUse);
local _ = require(l_script_FirstAncestor_0.Thunks.initiatePurchasePrecheck);
local v24 = require(l_script_FirstAncestor_0.Thunks.initiateUserPurchaseSettingsPrecheck);
local v25 = require(l_script_FirstAncestor_0.Thunks.sendEvent);
local v26 = require(l_script_FirstAncestor_0.Utils.isMockingPurchases);
local v27 = require(l_script_FirstAncestor_0.Utils.getPlayerPrice);
local v28 = require(l_script_FirstAncestor_0.Utils.isLinksAllowed);
local v29 = require(l_script_FirstAncestor_0.Utils.SelectedRobuxPackage);
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_Parent_0.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local v31 = require(l_script_FirstAncestor_0.connectToStore);
local v32 = require(l_script_FirstAncestor_0.Components.Connection.ExternalEventConnection);
local v33 = require(l_script_FirstAncestor_0.Flags.GetFFLagUseCoreScriptsRootProviderForUpsellModal);
local l_UpsellSuggestionsAPIMaxPackages_0 = require(l_Parent_0.SharedFlags).UpsellSuggestionsAPIMaxPackages;
local v35 = require(script.Parent.RobuxUpsellOverlay);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 = require(l_Parent_0.SharedFlags).FFlagEnableDiscountInfoInUnifiedPurchaseModal;
local v38 = l_Roact_0.Component:extend(script.Name);
v38.init = function(v39) --[[ Line: 56 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_AppPage_0 (copy)
    v39.state = {
        screenSize = Vector2.new(0, 0)
    };
    v39.changeScreenSize = function(v40) --[[ Line: 61 ]]
        -- upvalues: v39 (copy)
        if v39.state.screenSize ~= v40.AbsoluteSize then
            v39:setState({
                screenSize = v40.AbsoluteSize
            });
        end;
    end;
    if l_FFlagEnableUnifiedProductPurchaseFlow_0 then
        v39.navigateToBuyRobux = function() --[[ Line: 70 ]]
            -- upvalues: v39 (copy), l_AppPage_0 (ref)
            v39.props.navigation.navigate(l_AppPage_0.PurchaseRobux);
        end;
        v39.navigateToTermsOfUse = function() --[[ Line: 74 ]]
            -- upvalues: v39 (copy)
            v39.props.openTermsOfUse(v39.props.navigation);
        end;
    end;
end;
v38.createElement = function(v41) --[[ Line: 80 ]] --[[ Name: createElement ]]
    -- upvalues: v15 (copy), v28 (copy), l_Roact_0 (copy), v35 (copy), l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 (copy), l_UpsellSuggestionsAPIMaxPackages_0 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v27 (copy), v32 (copy), l_GuiService_0 (copy)
    local l_props_0 = v41.props;
    local l_state_0 = v41.state;
    if l_props_0.purchaseFlow ~= v15.RobuxUpsellV2 and l_props_0.purchaseFlow ~= v15.LargeRobuxUpsell then
        return nil;
    else
        local v44 = v28();
        local l_imageUrl_0 = l_props_0.productInfo.imageUrl;
        if string.find(l_props_0.productInfo.imageUrl, "assetid=0") then
            l_imageUrl_0 = nil;
        end;
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            [l_Roact_0.Change.AbsoluteSize] = v41.changeScreenSize, 
            BackgroundTransparency = 1
        }, {
            Prompt = l_Roact_0.createElement(v35, {
                screenSize = l_state_0.screenSize, 
                virtualItemPrice = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then l_props_0.virtualItemPrice else nil, 
                requestType = l_props_0.requestType, 
                promptState = l_props_0.promptState, 
                purchaseFlow = l_props_0.purchaseFlow, 
                purchaseError = l_props_0.purchaseError, 
                economicRestrictionError = l_props_0.economicRestrictionError, 
                useUpsellSuggestions = l_UpsellSuggestionsAPIMaxPackages_0 > 1, 
                upsellSuggestions = l_props_0.robuxSuggestions, 
                selectedUpsellIndex = l_props_0.robuxPackageSelection, 
                virtualItemBadgeType = l_props_0.virtualItemBadgeType, 
                onUpsellSuggestionsSelected = function(v46) --[[ Line: 116 ]] --[[ Name: onUpsellSuggestionsSelected ]]
                    -- upvalues: l_props_0 (copy)
                    l_props_0.onUpsellSuggestionsSelected(l_props_0.robuxSuggestions, v46, l_props_0.virtualItemBadgeType);
                end, 
                useUnifiedProductPurchaseModal = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v41.props.isUserEligibleForUnifiedPurchaseFlow else nil, 
                purchaseAnalyticsMetadata = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v41.props.purchaseAnalyticsMetadata else nil, 
                robuxProviderId = l_props_0.robuxProductId, 
                robuxProductId = l_props_0.productId, 
                itemIcon = l_imageUrl_0, 
                itemProductId = l_props_0.productInfo.productId, 
                itemName = l_props_0.productInfo.name, 
                itemRobuxCost = v27(l_props_0.productInfo, l_props_0.accountInfo.membershipType == 4, l_props_0.expectedPrice), 
                iapRobuxAmount = l_props_0.robuxPurchaseAmount or 0, 
                iapCostStr = l_props_0.price, 
                beforeRobuxBalance = l_props_0.accountInfo.balance, 
                isTestPurchase = l_props_0.isTestPurchase, 
                isGamepadEnabled = l_props_0.isGamepadEnabled, 
                purchaseItem = l_props_0.purchaseItem, 
                promptRobuxPurchase = l_props_0.promptRobuxPurchase, 
                openRobuxStore = if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v41.props.isUserEligibleForUnifiedPurchaseFlow then v41.navigateToBuyRobux else l_props_0.openRobuxStore, 
                openTermsOfUse = v44 and (if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v41.navigateToTermsOfUse else l_props_0.openTermsOfUse) or nil, 
                openSecuritySettings = v44 and l_props_0.openSecuritySettings or nil, 
                dispatchFetchPurchaseWarning = l_props_0.dispatchFetchPurchaseWarning, 
                endPurchase = l_props_0.completeRequest, 
                onAnalyticEvent = l_props_0.onAnalyticEvent, 
                humanoidModel = l_props_0.humanoidModel
            }), 
            ModalFix = l_Roact_0.createElement("ImageButton", {
                BackgroundTransparency = 0, 
                Modal = true, 
                Size = UDim2.new(0, 0, 0, 0)
            }), 
            OnCoreGuiMenuOpened = l_Roact_0.createElement(v32, {
                event = l_GuiService_0.MenuOpened, 
                callback = function() --[[ Line: 171 ]] --[[ Name: callback ]]
                    -- upvalues: l_props_0 (copy)
                    l_props_0.completeRequest();
                end
            })
        });
    end;
end;
v38.render = function(v47) --[[ Line: 178 ]] --[[ Name: render ]]
    -- upvalues: v33 (copy), l_Roact_0 (copy), l_CoreScriptsRootProvider_0 (copy), v4 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    if v33() then
        return l_Roact_0.createElement(l_CoreScriptsRootProvider_0, {}, {
            FocusNavigationCoreScriptsWrapper = v4.createElement(l_FocusRoot_0, {
                surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, 
                isIsolated = true, 
                isAutoFocusRoot = true
            }, {
                RobuxUpsellContainer = v47:createElement()
            })
        });
    else
        return v47:createElement();
    end;
end;
if l_FFlagEnableUnifiedProductPurchaseFlow_0 then
    local l_v38_0 = v38;
    v38 = function(v49) --[[ Line: 196 ]]
        -- upvalues: v11 (copy), l_Roact_0 (copy), l_v38_0 (copy), v12 (copy)
        local v50 = v11.useNavigation();
        return l_Roact_0.createElement(l_v38_0, v12.Dictionary.join(v49, {
            navigation = v50
        }));
    end;
end;
return (v31(function(v51) --[[ Line: 209 ]]
    -- upvalues: v26 (copy), v29 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 (copy), v13 (copy)
    local v52 = v26(v51.promptRequest.requestType);
    return {
        purchaseFlow = v51.purchaseFlow, 
        requestType = v51.promptRequest.requestType, 
        expectedPrice = v51.promptRequest.expectedPrice, 
        promptState = v51.promptState, 
        purchaseError = v51.purchaseError, 
        economicRestrictionError = v51.economicRestrictionError, 
        productInfo = v51.productInfo, 
        accountInfo = v51.accountInfo, 
        robuxSuggestions = v51.robuxUpsellSuggestions.products, 
        robuxPackageSelection = v51.robuxUpsellSuggestions.selection, 
        virtualItemBadgeType = v51.robuxUpsellSuggestions.virtualItemBadgeType, 
        robuxProductId = v29.getRobuxProductId(v51), 
        productId = v29.getProductId(v51), 
        robuxPurchaseAmount = v29.getRobuxPurchaseAmount(v51), 
        robuxAmountBeforeBonus = v29.getRobuxAmountBeforeBonus(v51), 
        price = v29.getPrice(v51), 
        isTestPurchase = v52, 
        isGamepadEnabled = v51.gamepadEnabled, 
        humanoidModel = v51.promptRequest.humanoidModel, 
        isUserEligibleForUnifiedPurchaseFlow = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v51.isUserEligibleForUnifiedPurchaseFlow else nil, 
        purchaseAnalyticsMetadata = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v51.purchaseAnalyticsMetadata else nil, 
        virtualItemPrice = if l_FFlagEnableDiscountInfoInUnifiedPurchaseModal_0 then v13(v51) else nil
    };
end, function(v53) --[[ Line: 248 ]]
    -- upvalues: v18 (copy), v19 (copy), v20 (copy), v21 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v22 (copy), v24 (copy), l_GuiService_0 (copy), v17 (copy), v14 (copy), v25 (copy)
    return {
        purchaseItem = function() --[[ Line: 250 ]] --[[ Name: purchaseItem ]]
            -- upvalues: v53 (copy), v18 (ref)
            return v53(v18());
        end, 
        promptRobuxPurchase = function() --[[ Line: 253 ]] --[[ Name: promptRobuxPurchase ]]
            -- upvalues: v53 (copy), v19 (ref)
            return v53(v19());
        end, 
        openRobuxStore = function() --[[ Line: 256 ]] --[[ Name: openRobuxStore ]]
            -- upvalues: v53 (copy), v20 (ref)
            return v53(v20());
        end, 
        openSecuritySettings = function() --[[ Line: 259 ]] --[[ Name: openSecuritySettings ]]
            -- upvalues: v53 (copy), v21 (ref)
            return v53(v21());
        end, 
        openTermsOfUse = function(v54) --[[ Line: 262 ]] --[[ Name: openTermsOfUse ]]
            -- upvalues: l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v53 (copy), v22 (ref)
            if l_FFlagEnableUnifiedProductPurchaseFlow_0 then
                return v53(v22(v54));
            else
                return v53(v22());
            end;
        end, 
        dispatchFetchPurchaseWarning = function() --[[ Line: 268 ]] --[[ Name: dispatchFetchPurchaseWarning ]]
            -- upvalues: v53 (copy), v24 (ref)
            return v53(v24());
        end, 
        completeRequest = function() --[[ Line: 271 ]] --[[ Name: completeRequest ]]
            -- upvalues: l_GuiService_0 (ref), v53 (copy), v17 (ref)
            l_GuiService_0.SelectedCoreObject = nil;
            return v53(v17());
        end, 
        onUpsellSuggestionsSelected = function(v55, v56, v57) --[[ Line: 275 ]] --[[ Name: onUpsellSuggestionsSelected ]]
            -- upvalues: v53 (copy), v14 (ref)
            return v53(v14(v55, v56, v57));
        end, 
        onAnalyticEvent = function(v58, v59) --[[ Line: 282 ]] --[[ Name: onAnalyticEvent ]]
            -- upvalues: v53 (copy), v25 (ref)
            return v53(v25(v58, v59));
        end
    };
end)(v38));