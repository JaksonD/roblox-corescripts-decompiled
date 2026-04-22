local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v5 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v6 = require(l_Modules_0.LuaApp.AppPage);
local v7 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v8 = require(l_CorePackages_0.Packages.t);
local v9 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamePasses);
local v10 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v12 = require(l_CorePackages_0.Packages.Promise);
local l_ItemTile_0 = require(l_CorePackages_0.Packages.UIBlox).Tile.ItemTile;
local v14 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForPurchasePass);
local v15 = require(l_Modules_0.LuaApp.Thunks.Economy.FetchExperienceStoreProducts);
local v16 = require(l_CorePackages_0.Workspace.Packages.EdpStoreAnalytics);
local l_Constants_0 = v16.Constants;
local v18 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local l_UnifiedEventLogEnums_0 = v18.UnifiedEventLogEnums;
local l_addUnifiedEventLogging_0 = v18.addUnifiedEventLogging;
local l_SessionService_0 = game:GetService("SessionService");
local v22 = require(l_Modules_0.LuaApp.Flags.FFlagEnableEdpStoreUnifiedLogging);
local v23 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt);
local v24 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite);
local l_getIsUserEligibleForUnifiedPurchaseFlow_0 = v24.getIsUserEligibleForUnifiedPurchaseFlow;
local l_ProductPurchaseSurface_0 = v24.Enums.ProductPurchaseSurface;
local l_getTTIEventName_0 = v24.getTTIEventName;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local v29 = require(l_Modules_0.LuaApp.Components.Passes.PassFooter);
local v30 = require(l_Modules_0.LuaApp.Flags.FFlagEnableUnifiedPurchasePromptForEDPGamepass);
local v31 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreClickLogging);
local v32 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreGridPositionLogging);
local l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId;
local v34 = v2.PureComponent:extend("PassTile");
local l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAddUnifiedPurchaseFlowTTIToEDP;
local l_FFlagUnifiedPurchasePassInProductInfoEDP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifiedPurchasePassInProductInfoEDP;
local l_FFlagUnifiedPurchaseAddSkeleton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifiedPurchaseAddSkeleton;
local v38 = game:DefineFastFlag("UnifiedPurchaseAddSkeletonLoadingForEDPGamepass", false) and l_FFlagUnifiedPurchaseAddSkeleton_0;
local l_FFlagIntegrateDiscountsWithEDP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagIntegrateDiscountsWithEDP;
local v40 = game:DefineFastFlag("ShipUnifiedPurchaseFlowToGamepassEDP", false);
local l_FFlagEnableBlackbirdPageCloseCallback_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableBlackbirdPageCloseCallback;
local l_getSubscriptionPurchaseCloseCallback_0 = require(l_CorePackages_0.Workspace.Packages.RobloxSubscriptionPurchaseApp).Utils.getSubscriptionPurchaseCloseCallback;
v34.validateProps = v8.strictInterface({
    universeId = v8.string, 
    pass = v8.table, 
    passThumbnail = v8.string, 
    locationType = if v31() then v8.optional(v8.string) else nil, 
    gridPositionRow = if v32() then v8.optional(v8.number) else nil, 
    gridPositionColumn = if v32() then v8.optional(v8.number) else nil, 
    networking = if v30 then v8.optional(v8.callback) else nil, 
    userRobux = v8.optional(v8.number), 
    requestPurchasePass = v8.optional(v8.callback), 
    requestPurchasePassWithUnifiedPurchasePrompt = v8.optional(v8.callback), 
    navigateDown = v8.optional(v8.callback), 
    closeCentralOverlay = v8.optional(v8.callback), 
    apiFetchGamePasses = v8.optional(v8.callback), 
    fetchExperienceStoreProducts = v8.optional(v8.callback)
});
v34.init = function(v43) --[[ Line: 92 ]] --[[ Name: init ]]
    -- upvalues: v22 (copy), v2 (copy), v12 (copy), l_FFlagIntegrateDiscountsWithEDP_0 (copy), v31 (copy), v16 (copy), l_Constants_0 (copy), v30 (copy), v40 (copy), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (copy), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (copy), l_FFlagEnableBlackbirdPageCloseCallback_0 (copy), l_getSubscriptionPurchaseCloseCallback_0 (copy), v6 (copy), v7 (copy), v5 (copy)
    if v22 then
        v43.ref = v2.createRef();
    end;
    v43.promptPurchase = function(v44, v45) --[[ Line: 96 ]]
        -- upvalues: v43 (copy), v12 (ref), l_FFlagIntegrateDiscountsWithEDP_0 (ref), v31 (ref), v16 (ref), l_Constants_0 (ref), v30 (ref), v40 (ref), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (ref), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (ref)
        local function v46() --[[ Line: 97 ]] --[[ Name: onFlowComplete ]]
            -- upvalues: v43 (ref)
            v43.props.closeCentralOverlay();
        end;
        local function v47() --[[ Line: 100 ]] --[[ Name: onPurchaseSuccess ]]
            -- upvalues: v43 (ref), v45 (copy)
            v43.props.apiFetchGamePasses(v43.props.networking, v45);
        end;
        local function v48() --[[ Line: 103 ]] --[[ Name: onRobloxSubscriptionUpsellSuccess ]]
            -- upvalues: v43 (ref), v45 (copy)
            v43.props.fetchExperienceStoreProducts(v43.props.networking, v45);
        end;
        local function v49() --[[ Line: 106 ]] --[[ Name: fetchProductInfo ]]
            -- upvalues: v12 (ref), v44 (copy), v43 (ref), l_FFlagIntegrateDiscountsWithEDP_0 (ref)
            return v12.resolve({
                TargetId = v44.id, 
                IsForSale = true, 
                Name = v44.displayName, 
                Description = v44.displayDescription, 
                PriceInRobux = v44.price, 
                ImageUrl = v43.props.passThumbnail, 
                ProductId = v44.productId, 
                PriceDiscountDetails = if l_FFlagIntegrateDiscountsWithEDP_0 then v44.priceDiscountDetails else nil, 
                BasePriceInRobux = if l_FFlagIntegrateDiscountsWithEDP_0 then v44.userBasePriceInRobux else nil
            });
        end;
        return function() --[[ Line: 119 ]]
            -- upvalues: v31 (ref), v16 (ref), l_Constants_0 (ref), v43 (ref), v44 (copy), v30 (ref), v40 (ref), v45 (copy), v46 (copy), v47 (copy), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (ref), v49 (copy), l_FFlagIntegrateDiscountsWithEDP_0 (ref), v48 (copy), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (ref)
            if v31() then
                v16.EdpStoreAnalyticsLogger.logEvent(l_Constants_0.StoreEnums.ActionType.PurchaseAttemptClick, l_Constants_0.StoreEnums.ProductType.GamePasses, v43.props.locationType, tonumber(v43.props.universeId), tonumber(v44.id), (tostring(v44.id)));
            end;
            if not v44.isOwned then
                if v30 then
                    if v40 then
                        v43.props.requestPurchasePassWithUnifiedPurchasePrompt(v44, v45, v46, v47, if l_FFlagUnifiedPurchasePassInProductInfoEDP_0 then v49 else nil, if l_FFlagUnifiedPurchasePassInProductInfoEDP_0 then v43.props.userRobux else nil, if l_FFlagIntegrateDiscountsWithEDP_0 then v48 else nil);
                        return;
                    else
                        l_getIsUserEligibleForUnifiedPurchaseFlow_0(v43.props.networking):andThen(function(v50) --[[ Line: 145 ]]
                            -- upvalues: v43 (ref), v44 (ref), v45 (ref), v46 (ref), v47 (ref), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (ref), v49 (ref), l_FFlagIntegrateDiscountsWithEDP_0 (ref), v48 (ref)
                            if v50 then
                                v43.props.requestPurchasePassWithUnifiedPurchasePrompt(v44, v45, v46, v47, if l_FFlagUnifiedPurchasePassInProductInfoEDP_0 then v49 else nil, if l_FFlagUnifiedPurchasePassInProductInfoEDP_0 then v43.props.userRobux else nil, if l_FFlagIntegrateDiscountsWithEDP_0 then v48 else nil);
                                return;
                            else
                                v43.props.requestPurchasePass(v44, v45);
                                return;
                            end;
                        end):catch(function() --[[ Line: 160 ]]
                            -- upvalues: v43 (ref), v44 (ref), v45 (ref)
                            v43.props.requestPurchasePass(v44, v45);
                        end);
                        return;
                    end;
                else
                    v43.props.requestPurchasePass(v44, v45);
                end;
            end;
        end;
    end;
    local v51 = if l_FFlagEnableBlackbirdPageCloseCallback_0 and l_getSubscriptionPurchaseCloseCallback_0 then l_getSubscriptionPurchaseCloseCallback_0() else nil;
    v43.viewPassDetails = function(v52) --[[ Line: 174 ]]
        -- upvalues: v43 (copy), v31 (ref), v16 (ref), l_Constants_0 (ref), v6 (ref), v7 (ref), v5 (ref), l_FFlagEnableBlackbirdPageCloseCallback_0 (ref), v51 (copy)
        return function() --[[ Line: 175 ]]
            -- upvalues: v43 (ref), v31 (ref), v16 (ref), l_Constants_0 (ref), v52 (copy), v6 (ref), v7 (ref), v5 (ref), l_FFlagEnableBlackbirdPageCloseCallback_0 (ref), v51 (ref)
            if v43.isMounted then
                if v31() then
                    v16.EdpStoreAnalyticsLogger.logEvent(l_Constants_0.StoreEnums.ActionType.ItemClick, l_Constants_0.StoreEnums.ProductType.GamePasses, v43.props.locationType, tonumber(v43.props.universeId), tonumber(v52.id), (tostring(v52.id)));
                end;
                v43.props.navigateDown({
                    name = v6.GenericWebPage, 
                    detail = v7.game.info.pass({
                        passId = v52.id
                    }), 
                    extraProps = {
                        title = v52.displayName, 
                        transitionAnimation = v5.SlideInFromRight, 
                        passOwned = v52.isOwned, 
                        onClose = if l_FFlagEnableBlackbirdPageCloseCallback_0 then v51 else nil
                    }
                });
            end;
        end;
    end;
end;
v34.render = function(v53) --[[ Line: 204 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_ItemTile_0 (copy), v22 (copy), v29 (copy)
    local l_pass_0 = v53.props.pass;
    return v2.createElement(l_ItemTile_0, {
        [v2.Ref] = if v22 then v53.ref else nil, 
        name = l_pass_0.displayName, 
        titleTextLineCount = 1, 
        thumbnail = v53.props.passThumbnail, 
        onActivated = v53.viewPassDetails(l_pass_0), 
        footer = v2.createElement(v29, {
            price = l_pass_0.price, 
            userOwnsPass = l_pass_0.isOwned, 
            onActivated = v53.promptPurchase(l_pass_0, v53.props.universeId)
        })
    });
end;
v34.didMount = function(v55) --[[ Line: 221 ]] --[[ Name: didMount ]]
    -- upvalues: v22 (copy), l_UnifiedEventLogEnums_0 (copy), v32 (copy), l_addUnifiedEventLogging_0 (copy), l_SessionService_0 (copy)
    v55.isMounted = true;
    if v22 then
        task.delay(0, function() --[[ Line: 224 ]]
            -- upvalues: v55 (copy), l_UnifiedEventLogEnums_0 (ref), v32 (ref), l_addUnifiedEventLogging_0 (ref), l_SessionService_0 (ref)
            local v56 = {
                universeId = tonumber(v55.props.universeId), 
                itemId = v55.props.pass.id, 
                itemType = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.GAME_PASS
            };
            if v32() then
                v56.gridPositionRow = v55.props.gridPositionRow;
                v56.gridPositionColumn = v55.props.gridPositionColumn;
            end;
            l_addUnifiedEventLogging_0(v55.ref, v56, {
                sessionTagName = l_SessionService_0:GetSessionTag("level2a")
            });
        end);
    end;
end;
v34.willUnmount = function(v57) --[[ Line: 241 ]] --[[ Name: willUnmount ]]
    v57.isMounted = false;
end;
v34 = v3.connect(l_FFlagUnifiedPurchasePassInProductInfoEDP_0 and function(v58, _) --[[ Line: 246 ]]
    return {
        userRobux = v58.UserRobux[v58.LocalUserId]
    };
end or nil, function(v60) --[[ Line: 251 ]]
    -- upvalues: l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 (copy), l_getTTIEventName_0 (copy), l_ProductPurchaseSurface_0 (copy), l_TimeToInteractiveTracker_0 (copy), v14 (copy), v23 (copy), l_FFlagIntegrateDiscountsWithEDP_0 (copy), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (copy), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (copy), v38 (copy), l_CorePackages_0 (copy), v9 (copy), v4 (copy), v15 (copy)
    return {
        requestPurchasePass = function(v61, v62) --[[ Line: 253 ]] --[[ Name: requestPurchasePass ]]
            -- upvalues: l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 (ref), l_getTTIEventName_0 (ref), l_ProductPurchaseSurface_0 (ref), l_TimeToInteractiveTracker_0 (ref), v60 (copy), v14 (ref)
            if l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 then
                local v63 = l_getTTIEventName_0(l_ProductPurchaseSurface_0.EDP);
                l_TimeToInteractiveTracker_0.trackStart(v63);
                l_TimeToInteractiveTracker_0.updateMetadata(v63, {
                    page = l_ProductPurchaseSurface_0.EDP, 
                    category = "legacy_purchase_modal"
                });
            end;
            return v60(v14(v61, v62));
        end, 
        requestPurchasePassWithUnifiedPurchasePrompt = function(v64, v65, v66, v67, v68, v69, v70) --[[ Line: 264 ]] --[[ Name: requestPurchasePassWithUnifiedPurchasePrompt ]]
            -- upvalues: v60 (copy), v23 (ref), l_FFlagIntegrateDiscountsWithEDP_0 (ref), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (ref), l_ProductPurchaseSurface_0 (ref), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (ref), v38 (ref), l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 (ref)
            return v60(v23({
                productPayload = {
                    id = v64.id, 
                    kind = "Gamepass"
                }, 
                purchaseCallbacks = {
                    onFlowComplete = v66, 
                    onPurchaseSuccess = v67, 
                    onRobloxSubscriptionUpsellSuccess = if l_FFlagIntegrateDiscountsWithEDP_0 then v70 else nil, 
                    fetchProductInfo = if l_FFlagUnifiedPurchasePassInProductInfoEDP_0 then v68 else nil
                }, 
                purchaseAnalyticsMetadata = {
                    surface = l_ProductPurchaseSurface_0.EDP, 
                    productUniverseId = if l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 then v65 else nil
                }, 
                purchaseOptions = if l_FFlagUnifiedPurchasePassInProductInfoEDP_0 then {
                    shouldSkipOwnershipCheck = not v64.isOwned, 
                    providedRobuxBalance = v69, 
                    enablePreloadedPurchaseUI = v38 and true or nil
                } else nil
            }, l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 and true or nil));
        end, 
        closeCentralOverlay = function() --[[ Line: 298 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: l_CorePackages_0 (ref), v60 (copy)
            local l_CloseCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay;
            return v60(l_CloseCentralOverlay_0());
        end, 
        apiFetchGamePasses = function(v72, v73) --[[ Line: 303 ]] --[[ Name: apiFetchGamePasses ]]
            -- upvalues: v60 (copy), v9 (ref)
            return v60(v9(v72, v73));
        end, 
        navigateDown = function(v74) --[[ Line: 306 ]] --[[ Name: navigateDown ]]
            -- upvalues: v60 (copy), v4 (ref)
            return v60(v4(v74));
        end, 
        fetchExperienceStoreProducts = l_FFlagIntegrateDiscountsWithEDP_0 and function(v75, v76) --[[ Line: 310 ]]
            -- upvalues: v60 (copy), v15 (ref)
            return v60(v15(v75, v76));
        end or nil
    };
end)(v34);
if v30 then
    v34 = l_RoactServices_0.connect({
        networking = v10
    })(v34);
end;
return v34;