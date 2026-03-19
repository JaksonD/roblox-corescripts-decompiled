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
local v13 = require(l_script_FirstAncestor_0.Actions.PromptNativeUpsellSuggestions);
local v14 = require(l_script_FirstAncestor_0.Enums.PurchaseFlow);
local _ = require(l_script_FirstAncestor_0.Models.RobuxUpsell);
local v16 = require(l_script_FirstAncestor_0.Thunks.completeRequest);
local v17 = require(l_script_FirstAncestor_0.Thunks.purchaseItem);
local v18 = require(l_script_FirstAncestor_0.Thunks.launchRobuxUpsell);
local v19 = require(l_script_FirstAncestor_0.Thunks.openRobuxStore);
local v20 = require(l_script_FirstAncestor_0.Thunks.openSecuritySettings);
local v21 = require(l_script_FirstAncestor_0.Thunks.openTermsOfUse);
local _ = require(l_script_FirstAncestor_0.Thunks.initiatePurchasePrecheck);
local v23 = require(l_script_FirstAncestor_0.Thunks.initiateUserPurchaseSettingsPrecheck);
local v24 = require(l_script_FirstAncestor_0.Thunks.sendEvent);
local v25 = require(l_script_FirstAncestor_0.Utils.isMockingPurchases);
local v26 = require(l_script_FirstAncestor_0.Utils.getPlayerPrice);
local v27 = require(l_script_FirstAncestor_0.Utils.isLinksAllowed);
local v28 = require(l_script_FirstAncestor_0.Utils.SelectedRobuxPackage);
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_Parent_0.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local v30 = require(l_script_FirstAncestor_0.connectToStore);
local v31 = require(l_script_FirstAncestor_0.Components.Connection.ExternalEventConnection);
local v32 = require(l_script_FirstAncestor_0.Flags.GetFFLagUseCoreScriptsRootProviderForUpsellModal);
local l_UpsellSuggestionsAPIMaxPackages_0 = require(l_Parent_0.SharedFlags).UpsellSuggestionsAPIMaxPackages;
local v34 = require(script.Parent.RobuxUpsellOverlay);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v36 = l_Roact_0.Component:extend(script.Name);
v36.init = function(v37) --[[ Line: 53 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_AppPage_0 (copy)
    v37.state = {
        screenSize = Vector2.new(0, 0)
    };
    v37.changeScreenSize = function(v38) --[[ Line: 58 ]]
        -- upvalues: v37 (copy)
        if v37.state.screenSize ~= v38.AbsoluteSize then
            v37:setState({
                screenSize = v38.AbsoluteSize
            });
        end;
    end;
    if l_FFlagEnableUnifiedProductPurchaseFlow_0 then
        v37.navigateToBuyRobux = function() --[[ Line: 67 ]]
            -- upvalues: v37 (copy), l_AppPage_0 (ref)
            v37.props.navigation.navigate(l_AppPage_0.PurchaseRobux);
        end;
        v37.navigateToTermsOfUse = function() --[[ Line: 71 ]]
            -- upvalues: v37 (copy)
            v37.props.openTermsOfUse(v37.props.navigation);
        end;
    end;
end;
v36.createElement = function(v39) --[[ Line: 77 ]] --[[ Name: createElement ]]
    -- upvalues: v14 (copy), v27 (copy), l_Roact_0 (copy), v34 (copy), l_UpsellSuggestionsAPIMaxPackages_0 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v26 (copy), v31 (copy), l_GuiService_0 (copy)
    local l_props_0 = v39.props;
    local l_state_0 = v39.state;
    if l_props_0.purchaseFlow ~= v14.RobuxUpsellV2 and l_props_0.purchaseFlow ~= v14.LargeRobuxUpsell then
        return nil;
    else
        local v42 = v27();
        local l_imageUrl_0 = l_props_0.productInfo.imageUrl;
        if string.find(l_props_0.productInfo.imageUrl, "assetid=0") then
            l_imageUrl_0 = nil;
        end;
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            [l_Roact_0.Change.AbsoluteSize] = v39.changeScreenSize, 
            BackgroundTransparency = 1
        }, {
            Prompt = l_Roact_0.createElement(v34, {
                screenSize = l_state_0.screenSize, 
                requestType = l_props_0.requestType, 
                promptState = l_props_0.promptState, 
                purchaseFlow = l_props_0.purchaseFlow, 
                purchaseError = l_props_0.purchaseError, 
                economicRestrictionError = l_props_0.economicRestrictionError, 
                useUpsellSuggestions = l_UpsellSuggestionsAPIMaxPackages_0 > 1, 
                upsellSuggestions = l_props_0.robuxSuggestions, 
                selectedUpsellIndex = l_props_0.robuxPackageSelection, 
                virtualItemBadgeType = l_props_0.virtualItemBadgeType, 
                onUpsellSuggestionsSelected = function(v44) --[[ Line: 112 ]] --[[ Name: onUpsellSuggestionsSelected ]]
                    -- upvalues: l_props_0 (copy)
                    l_props_0.onUpsellSuggestionsSelected(l_props_0.robuxSuggestions, v44, l_props_0.virtualItemBadgeType);
                end, 
                useUnifiedProductPurchaseModal = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v39.props.isUserEligibleForUnifiedPurchaseFlow else nil, 
                purchaseAnalyticsMetadata = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v39.props.purchaseAnalyticsMetadata else nil, 
                robuxProviderId = l_props_0.robuxProductId, 
                robuxProductId = l_props_0.productId, 
                itemIcon = l_imageUrl_0, 
                itemProductId = l_props_0.productInfo.productId, 
                itemName = l_props_0.productInfo.name, 
                itemRobuxCost = v26(l_props_0.productInfo, l_props_0.accountInfo.membershipType == 4, l_props_0.expectedPrice), 
                iapRobuxAmount = l_props_0.robuxPurchaseAmount or 0, 
                iapCostStr = l_props_0.price, 
                beforeRobuxBalance = l_props_0.accountInfo.balance, 
                isTestPurchase = l_props_0.isTestPurchase, 
                isGamepadEnabled = l_props_0.isGamepadEnabled, 
                purchaseItem = l_props_0.purchaseItem, 
                promptRobuxPurchase = l_props_0.promptRobuxPurchase, 
                openRobuxStore = if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v39.props.isUserEligibleForUnifiedPurchaseFlow then v39.navigateToBuyRobux else l_props_0.openRobuxStore, 
                openTermsOfUse = v42 and (if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v39.navigateToTermsOfUse else l_props_0.openTermsOfUse) or nil, 
                openSecuritySettings = v42 and l_props_0.openSecuritySettings or nil, 
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
            OnCoreGuiMenuOpened = l_Roact_0.createElement(v31, {
                event = l_GuiService_0.MenuOpened, 
                callback = function() --[[ Line: 167 ]] --[[ Name: callback ]]
                    -- upvalues: l_props_0 (copy)
                    l_props_0.completeRequest();
                end
            })
        });
    end;
end;
v36.render = function(v45) --[[ Line: 174 ]] --[[ Name: render ]]
    -- upvalues: v32 (copy), l_Roact_0 (copy), l_CoreScriptsRootProvider_0 (copy), v4 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    if v32() then
        return l_Roact_0.createElement(l_CoreScriptsRootProvider_0, {}, {
            FocusNavigationCoreScriptsWrapper = v4.createElement(l_FocusRoot_0, {
                surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, 
                isIsolated = true, 
                isAutoFocusRoot = true
            }, {
                RobuxUpsellContainer = v45:createElement()
            })
        });
    else
        return v45:createElement();
    end;
end;
if l_FFlagEnableUnifiedProductPurchaseFlow_0 then
    local l_v36_0 = v36;
    v36 = function(v47) --[[ Line: 192 ]]
        -- upvalues: v11 (copy), l_Roact_0 (copy), l_v36_0 (copy), v12 (copy)
        local v48 = v11.useNavigation();
        return l_Roact_0.createElement(l_v36_0, v12.Dictionary.join(v47, {
            navigation = v48
        }));
    end;
end;
return (v30(function(v49) --[[ Line: 205 ]]
    -- upvalues: v25 (copy), v28 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy)
    local v50 = v25(v49.promptRequest.requestType);
    return {
        purchaseFlow = v49.purchaseFlow, 
        requestType = v49.promptRequest.requestType, 
        expectedPrice = v49.promptRequest.expectedPrice, 
        promptState = v49.promptState, 
        purchaseError = v49.purchaseError, 
        economicRestrictionError = v49.economicRestrictionError, 
        productInfo = v49.productInfo, 
        accountInfo = v49.accountInfo, 
        robuxSuggestions = v49.robuxUpsellSuggestions.products, 
        robuxPackageSelection = v49.robuxUpsellSuggestions.selection, 
        virtualItemBadgeType = v49.robuxUpsellSuggestions.virtualItemBadgeType, 
        robuxProductId = v28.getRobuxProductId(v49), 
        productId = v28.getProductId(v49), 
        robuxPurchaseAmount = v28.getRobuxPurchaseAmount(v49), 
        robuxAmountBeforeBonus = v28.getRobuxAmountBeforeBonus(v49), 
        price = v28.getPrice(v49), 
        isTestPurchase = v50, 
        isGamepadEnabled = v49.gamepadEnabled, 
        humanoidModel = v49.promptRequest.humanoidModel, 
        isUserEligibleForUnifiedPurchaseFlow = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v49.isUserEligibleForUnifiedPurchaseFlow else nil, 
        purchaseAnalyticsMetadata = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v49.purchaseAnalyticsMetadata else nil
    };
end, function(v51) --[[ Line: 243 ]]
    -- upvalues: v17 (copy), v18 (copy), v19 (copy), v20 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v21 (copy), v23 (copy), l_GuiService_0 (copy), v16 (copy), v13 (copy), v24 (copy)
    return {
        purchaseItem = function() --[[ Line: 245 ]] --[[ Name: purchaseItem ]]
            -- upvalues: v51 (copy), v17 (ref)
            return v51(v17());
        end, 
        promptRobuxPurchase = function() --[[ Line: 248 ]] --[[ Name: promptRobuxPurchase ]]
            -- upvalues: v51 (copy), v18 (ref)
            return v51(v18());
        end, 
        openRobuxStore = function() --[[ Line: 251 ]] --[[ Name: openRobuxStore ]]
            -- upvalues: v51 (copy), v19 (ref)
            return v51(v19());
        end, 
        openSecuritySettings = function() --[[ Line: 254 ]] --[[ Name: openSecuritySettings ]]
            -- upvalues: v51 (copy), v20 (ref)
            return v51(v20());
        end, 
        openTermsOfUse = function(v52) --[[ Line: 257 ]] --[[ Name: openTermsOfUse ]]
            -- upvalues: l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v51 (copy), v21 (ref)
            if l_FFlagEnableUnifiedProductPurchaseFlow_0 then
                return v51(v21(v52));
            else
                return v51(v21());
            end;
        end, 
        dispatchFetchPurchaseWarning = function() --[[ Line: 263 ]] --[[ Name: dispatchFetchPurchaseWarning ]]
            -- upvalues: v51 (copy), v23 (ref)
            return v51(v23());
        end, 
        completeRequest = function() --[[ Line: 266 ]] --[[ Name: completeRequest ]]
            -- upvalues: l_GuiService_0 (ref), v51 (copy), v16 (ref)
            l_GuiService_0.SelectedCoreObject = nil;
            return v51(v16());
        end, 
        onUpsellSuggestionsSelected = function(v53, v54, v55) --[[ Line: 270 ]] --[[ Name: onUpsellSuggestionsSelected ]]
            -- upvalues: v51 (copy), v13 (ref)
            return v51(v13(v53, v54, v55));
        end, 
        onAnalyticEvent = function(v56, v57) --[[ Line: 277 ]] --[[ Name: onAnalyticEvent ]]
            -- upvalues: v51 (copy), v24 (ref)
            return v51(v24(v56, v57));
        end
    };
end)(v36));