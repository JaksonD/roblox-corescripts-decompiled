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
v34.init = function(v40) --[[ Line: 87 ]] --[[ Name: init ]]
    -- upvalues: v22 (copy), v2 (copy), v12 (copy), l_FFlagIntegrateDiscountsWithEDP_0 (copy), v31 (copy), v16 (copy), l_Constants_0 (copy), v30 (copy), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (copy), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (copy), v6 (copy), v7 (copy), v5 (copy)
    if v22 then
        v40.ref = v2.createRef();
    end;
    v40.promptPurchase = function(v41, v42) --[[ Line: 91 ]]
        -- upvalues: v40 (copy), v12 (ref), l_FFlagIntegrateDiscountsWithEDP_0 (ref), v31 (ref), v16 (ref), l_Constants_0 (ref), v30 (ref), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (ref), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (ref)
        local function v43() --[[ Line: 92 ]] --[[ Name: onFlowComplete ]]
            -- upvalues: v40 (ref)
            v40.props.closeCentralOverlay();
        end;
        local function v44() --[[ Line: 95 ]] --[[ Name: onPurchaseSuccess ]]
            -- upvalues: v40 (ref), v42 (copy)
            v40.props.apiFetchGamePasses(v40.props.networking, v42);
        end;
        local function v45() --[[ Line: 98 ]] --[[ Name: onRobloxSubscriptionUpsellSuccess ]]
            -- upvalues: v40 (ref), v42 (copy)
            v40.props.fetchExperienceStoreProducts(v40.props.networking, v42);
        end;
        local function v46() --[[ Line: 101 ]] --[[ Name: fetchProductInfo ]]
            -- upvalues: v12 (ref), v41 (copy), v40 (ref), l_FFlagIntegrateDiscountsWithEDP_0 (ref)
            return v12.resolve({
                TargetId = v41.id, 
                IsForSale = true, 
                Name = v41.displayName, 
                Description = v41.displayDescription, 
                PriceInRobux = v41.price, 
                ImageUrl = v40.props.passThumbnail, 
                ProductId = v41.productId, 
                PriceDiscountDetails = if l_FFlagIntegrateDiscountsWithEDP_0 then v41.priceDiscountDetails else nil, 
                BasePriceInRobux = if l_FFlagIntegrateDiscountsWithEDP_0 then v41.userBasePriceInRobux else nil
            });
        end;
        return function() --[[ Line: 114 ]]
            -- upvalues: v31 (ref), v16 (ref), l_Constants_0 (ref), v40 (ref), v41 (copy), v30 (ref), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (ref), v42 (copy), v43 (copy), v44 (copy), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (ref), v46 (copy), l_FFlagIntegrateDiscountsWithEDP_0 (ref), v45 (copy)
            if v31() then
                v16.EdpStoreAnalyticsLogger.logEvent(l_Constants_0.StoreEnums.ActionType.PurchaseAttemptClick, l_Constants_0.StoreEnums.ProductType.GamePasses, v40.props.locationType, tonumber(v40.props.universeId), tonumber(v41.id), (tostring(v41.id)));
            end;
            if not v41.isOwned then
                if v30 then
                    l_getIsUserEligibleForUnifiedPurchaseFlow_0(v40.props.networking):andThen(function(v47) --[[ Line: 128 ]]
                        -- upvalues: v40 (ref), v41 (ref), v42 (ref), v43 (ref), v44 (ref), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (ref), v46 (ref), l_FFlagIntegrateDiscountsWithEDP_0 (ref), v45 (ref)
                        if v47 then
                            v40.props.requestPurchasePassWithUnifiedPurchasePrompt(v41, v42, v43, v44, if l_FFlagUnifiedPurchasePassInProductInfoEDP_0 then v46 else nil, if l_FFlagUnifiedPurchasePassInProductInfoEDP_0 then v40.props.userRobux else nil, if l_FFlagIntegrateDiscountsWithEDP_0 then v45 else nil);
                            return;
                        else
                            v40.props.requestPurchasePass(v41, v42);
                            return;
                        end;
                    end):catch(function() --[[ Line: 143 ]]
                        -- upvalues: v40 (ref), v41 (ref), v42 (ref)
                        v40.props.requestPurchasePass(v41, v42);
                    end);
                    return;
                else
                    v40.props.requestPurchasePass(v41, v42);
                end;
            end;
        end;
    end;
    v40.viewPassDetails = function(v48) --[[ Line: 153 ]]
        -- upvalues: v40 (copy), v31 (ref), v16 (ref), l_Constants_0 (ref), v6 (ref), v7 (ref), v5 (ref)
        return function() --[[ Line: 154 ]]
            -- upvalues: v40 (ref), v31 (ref), v16 (ref), l_Constants_0 (ref), v48 (copy), v6 (ref), v7 (ref), v5 (ref)
            if v40.isMounted then
                if v31() then
                    v16.EdpStoreAnalyticsLogger.logEvent(l_Constants_0.StoreEnums.ActionType.ItemClick, l_Constants_0.StoreEnums.ProductType.GamePasses, v40.props.locationType, tonumber(v40.props.universeId), tonumber(v48.id), (tostring(v48.id)));
                end;
                v40.props.navigateDown({
                    name = v6.GenericWebPage, 
                    detail = v7.game.info.pass({
                        passId = v48.id
                    }), 
                    extraProps = {
                        title = v48.displayName, 
                        transitionAnimation = v5.SlideInFromRight, 
                        passOwned = v48.isOwned
                    }
                });
            end;
        end;
    end;
end;
v34.render = function(v49) --[[ Line: 182 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_ItemTile_0 (copy), v22 (copy), v29 (copy)
    local l_pass_0 = v49.props.pass;
    return v2.createElement(l_ItemTile_0, {
        [v2.Ref] = if v22 then v49.ref else nil, 
        name = l_pass_0.displayName, 
        titleTextLineCount = 1, 
        thumbnail = v49.props.passThumbnail, 
        onActivated = v49.viewPassDetails(l_pass_0), 
        footer = v2.createElement(v29, {
            price = l_pass_0.price, 
            userOwnsPass = l_pass_0.isOwned, 
            onActivated = v49.promptPurchase(l_pass_0, v49.props.universeId)
        })
    });
end;
v34.didMount = function(v51) --[[ Line: 199 ]] --[[ Name: didMount ]]
    -- upvalues: v22 (copy), l_UnifiedEventLogEnums_0 (copy), v32 (copy), l_addUnifiedEventLogging_0 (copy), l_SessionService_0 (copy)
    v51.isMounted = true;
    if v22 then
        task.delay(0, function() --[[ Line: 202 ]]
            -- upvalues: v51 (copy), l_UnifiedEventLogEnums_0 (ref), v32 (ref), l_addUnifiedEventLogging_0 (ref), l_SessionService_0 (ref)
            local v52 = {
                universeId = tonumber(v51.props.universeId), 
                itemId = v51.props.pass.id, 
                itemType = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.GAME_PASS
            };
            if v32() then
                v52.gridPositionRow = v51.props.gridPositionRow;
                v52.gridPositionColumn = v51.props.gridPositionColumn;
            end;
            l_addUnifiedEventLogging_0(v51.ref, v52, {
                sessionTagName = l_SessionService_0:GetSessionTag("level2a")
            });
        end);
    end;
end;
v34.willUnmount = function(v53) --[[ Line: 219 ]] --[[ Name: willUnmount ]]
    v53.isMounted = false;
end;
v34 = v3.connect(l_FFlagUnifiedPurchasePassInProductInfoEDP_0 and function(v54, _) --[[ Line: 224 ]]
    return {
        userRobux = v54.UserRobux[v54.LocalUserId]
    };
end or nil, function(v56) --[[ Line: 229 ]]
    -- upvalues: l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 (copy), l_getTTIEventName_0 (copy), l_ProductPurchaseSurface_0 (copy), l_TimeToInteractiveTracker_0 (copy), v14 (copy), v23 (copy), l_FFlagIntegrateDiscountsWithEDP_0 (copy), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (copy), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (copy), v38 (copy), l_CorePackages_0 (copy), v9 (copy), v4 (copy), v15 (copy)
    return {
        requestPurchasePass = function(v57, v58) --[[ Line: 231 ]] --[[ Name: requestPurchasePass ]]
            -- upvalues: l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 (ref), l_getTTIEventName_0 (ref), l_ProductPurchaseSurface_0 (ref), l_TimeToInteractiveTracker_0 (ref), v56 (copy), v14 (ref)
            if l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 then
                local v59 = l_getTTIEventName_0(l_ProductPurchaseSurface_0.EDP);
                l_TimeToInteractiveTracker_0.trackStart(v59);
                l_TimeToInteractiveTracker_0.updateMetadata(v59, {
                    page = l_ProductPurchaseSurface_0.EDP, 
                    category = "legacy_purchase_modal"
                });
            end;
            return v56(v14(v57, v58));
        end, 
        requestPurchasePassWithUnifiedPurchasePrompt = function(v60, v61, v62, v63, v64, v65, v66) --[[ Line: 242 ]] --[[ Name: requestPurchasePassWithUnifiedPurchasePrompt ]]
            -- upvalues: v56 (copy), v23 (ref), l_FFlagIntegrateDiscountsWithEDP_0 (ref), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (ref), l_ProductPurchaseSurface_0 (ref), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (ref), v38 (ref), l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 (ref)
            return v56(v23({
                productPayload = {
                    id = v60.id, 
                    kind = "Gamepass"
                }, 
                purchaseCallbacks = {
                    onFlowComplete = v62, 
                    onPurchaseSuccess = v63, 
                    onRobloxSubscriptionUpsellSuccess = if l_FFlagIntegrateDiscountsWithEDP_0 then v66 else nil, 
                    fetchProductInfo = if l_FFlagUnifiedPurchasePassInProductInfoEDP_0 then v64 else nil
                }, 
                purchaseAnalyticsMetadata = {
                    surface = l_ProductPurchaseSurface_0.EDP, 
                    productUniverseId = if l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 then v61 else nil
                }, 
                purchaseOptions = if l_FFlagUnifiedPurchasePassInProductInfoEDP_0 then {
                    shouldSkipOwnershipCheck = not v60.isOwned, 
                    providedRobuxBalance = v65, 
                    enablePreloadedPurchaseUI = v38 and true or nil
                } else nil
            }, l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 and true or nil));
        end, 
        closeCentralOverlay = function() --[[ Line: 276 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: l_CorePackages_0 (ref), v56 (copy)
            local l_CloseCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay;
            return v56(l_CloseCentralOverlay_0());
        end, 
        apiFetchGamePasses = function(v68, v69) --[[ Line: 281 ]] --[[ Name: apiFetchGamePasses ]]
            -- upvalues: v56 (copy), v9 (ref)
            return v56(v9(v68, v69));
        end, 
        navigateDown = function(v70) --[[ Line: 284 ]] --[[ Name: navigateDown ]]
            -- upvalues: v56 (copy), v4 (ref)
            return v56(v4(v70));
        end, 
        fetchExperienceStoreProducts = l_FFlagIntegrateDiscountsWithEDP_0 and function(v71, v72) --[[ Line: 288 ]]
            -- upvalues: v56 (copy), v15 (ref)
            return v56(v15(v71, v72));
        end or nil
    };
end)(v34);
if v30 then
    v34 = l_RoactServices_0.connect({
        networking = v10
    })(v34);
end;
return v34;