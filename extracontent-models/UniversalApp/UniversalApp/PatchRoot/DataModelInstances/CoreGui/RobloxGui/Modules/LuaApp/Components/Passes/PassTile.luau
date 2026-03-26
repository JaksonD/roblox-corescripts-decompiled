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
local v15 = require(l_CorePackages_0.Workspace.Packages.EdpStoreAnalytics);
local l_Constants_0 = v15.Constants;
local v17 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local l_UnifiedEventLogEnums_0 = v17.UnifiedEventLogEnums;
local l_addUnifiedEventLogging_0 = v17.addUnifiedEventLogging;
local l_SessionService_0 = game:GetService("SessionService");
local v21 = require(l_Modules_0.LuaApp.Flags.FFlagEnableEdpStoreUnifiedLogging);
local v22 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt);
local v23 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite);
local l_getIsUserEligibleForUnifiedPurchaseFlow_0 = v23.getIsUserEligibleForUnifiedPurchaseFlow;
local l_ProductPurchaseSurface_0 = v23.Enums.ProductPurchaseSurface;
local l_getTTIEventName_0 = v23.getTTIEventName;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local v28 = require(l_Modules_0.LuaApp.Components.Passes.PassFooter);
local v29 = require(l_Modules_0.LuaApp.Flags.FFlagEnableUnifiedPurchasePromptForEDPGamepass);
local v30 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreClickLogging);
local v31 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreGridPositionLogging);
local l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId;
local v33 = v2.PureComponent:extend("PassTile");
local l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAddUnifiedPurchaseFlowTTIToEDP;
local l_FFlagUnifiedPurchasePassInProductInfoEDP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifiedPurchasePassInProductInfoEDP;
local l_FFlagUnifiedPurchaseAddSkeleton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifiedPurchaseAddSkeleton;
local v37 = game:DefineFastFlag("UnifiedPurchaseAddSkeletonLoadingForEDPGamepass", false) and l_FFlagUnifiedPurchaseAddSkeleton_0;
local l_FFlagIntegrateDiscountsWithEDP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagIntegrateDiscountsWithEDP;
v33.validateProps = v8.strictInterface({
    universeId = v8.string, 
    pass = v8.table, 
    passThumbnail = v8.string, 
    locationType = if v30() then v8.optional(v8.string) else nil, 
    gridPositionRow = if v31() then v8.optional(v8.number) else nil, 
    gridPositionColumn = if v31() then v8.optional(v8.number) else nil, 
    networking = if v29 then v8.optional(v8.callback) else nil, 
    userRobux = v8.optional(v8.number), 
    requestPurchasePass = v8.optional(v8.callback), 
    requestPurchasePassWithUnifiedPurchasePrompt = v8.optional(v8.callback), 
    navigateDown = v8.optional(v8.callback), 
    closeCentralOverlay = v8.optional(v8.callback), 
    apiFetchGamePasses = v8.optional(v8.callback)
});
v33.init = function(v39) --[[ Line: 87 ]] --[[ Name: init ]]
    -- upvalues: v21 (copy), v2 (copy), v12 (copy), l_FFlagIntegrateDiscountsWithEDP_0 (copy), v30 (copy), v15 (copy), l_Constants_0 (copy), v29 (copy), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (copy), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (copy), v6 (copy), v7 (copy), v5 (copy)
    if v21 then
        v39.ref = v2.createRef();
    end;
    v39.promptPurchase = function(v40, v41) --[[ Line: 91 ]]
        -- upvalues: v39 (copy), v12 (ref), l_FFlagIntegrateDiscountsWithEDP_0 (ref), v30 (ref), v15 (ref), l_Constants_0 (ref), v29 (ref), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (ref), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (ref)
        local function v42() --[[ Line: 92 ]] --[[ Name: onFlowComplete ]]
            -- upvalues: v39 (ref)
            v39.props.closeCentralOverlay();
        end;
        local function v43() --[[ Line: 95 ]] --[[ Name: onPurchaseSuccess ]]
            -- upvalues: v39 (ref), v41 (copy)
            v39.props.apiFetchGamePasses(v39.props.networking, v41);
        end;
        local function v44() --[[ Line: 98 ]] --[[ Name: fetchProductInfo ]]
            -- upvalues: v12 (ref), v40 (copy), v39 (ref), l_FFlagIntegrateDiscountsWithEDP_0 (ref)
            return v12.resolve({
                TargetId = v40.id, 
                IsForSale = true, 
                Name = v40.displayName, 
                Description = v40.displayDescription, 
                PriceInRobux = v40.price, 
                ImageUrl = v39.props.passThumbnail, 
                ProductId = v40.productId, 
                PriceDiscountDetails = if l_FFlagIntegrateDiscountsWithEDP_0 then v40.priceDiscountDetails else nil, 
                BasePriceInRobux = if l_FFlagIntegrateDiscountsWithEDP_0 then v40.basePriceInRobux else nil
            });
        end;
        return function() --[[ Line: 111 ]]
            -- upvalues: v30 (ref), v15 (ref), l_Constants_0 (ref), v39 (ref), v40 (copy), v29 (ref), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (ref), v41 (copy), v42 (copy), v43 (copy), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (ref), v44 (copy)
            if v30() then
                v15.EdpStoreAnalyticsLogger.logEvent(l_Constants_0.StoreEnums.ActionType.PurchaseAttemptClick, l_Constants_0.StoreEnums.ProductType.GamePasses, v39.props.locationType, tonumber(v39.props.universeId), tonumber(v40.id), (tostring(v40.id)));
            end;
            if not v40.isOwned then
                if v29 then
                    l_getIsUserEligibleForUnifiedPurchaseFlow_0(v39.props.networking):andThen(function(v45) --[[ Line: 125 ]]
                        -- upvalues: v39 (ref), v40 (ref), v41 (ref), v42 (ref), v43 (ref), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (ref), v44 (ref)
                        if v45 then
                            v39.props.requestPurchasePassWithUnifiedPurchasePrompt(v40, v41, v42, v43, if l_FFlagUnifiedPurchasePassInProductInfoEDP_0 then v44 else nil, if l_FFlagUnifiedPurchasePassInProductInfoEDP_0 then v39.props.userRobux else nil);
                            return;
                        else
                            v39.props.requestPurchasePass(v40, v41);
                            return;
                        end;
                    end):catch(function() --[[ Line: 139 ]]
                        -- upvalues: v39 (ref), v40 (ref), v41 (ref)
                        v39.props.requestPurchasePass(v40, v41);
                    end);
                    return;
                else
                    v39.props.requestPurchasePass(v40, v41);
                end;
            end;
        end;
    end;
    v39.viewPassDetails = function(v46) --[[ Line: 149 ]]
        -- upvalues: v39 (copy), v30 (ref), v15 (ref), l_Constants_0 (ref), v6 (ref), v7 (ref), v5 (ref)
        return function() --[[ Line: 150 ]]
            -- upvalues: v39 (ref), v30 (ref), v15 (ref), l_Constants_0 (ref), v46 (copy), v6 (ref), v7 (ref), v5 (ref)
            if v39.isMounted then
                if v30() then
                    v15.EdpStoreAnalyticsLogger.logEvent(l_Constants_0.StoreEnums.ActionType.ItemClick, l_Constants_0.StoreEnums.ProductType.GamePasses, v39.props.locationType, tonumber(v39.props.universeId), tonumber(v46.id), (tostring(v46.id)));
                end;
                v39.props.navigateDown({
                    name = v6.GenericWebPage, 
                    detail = v7.game.info.pass({
                        passId = v46.id
                    }), 
                    extraProps = {
                        title = v46.displayName, 
                        transitionAnimation = v5.SlideInFromRight, 
                        passOwned = v46.isOwned
                    }
                });
            end;
        end;
    end;
end;
v33.render = function(v47) --[[ Line: 178 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_ItemTile_0 (copy), v21 (copy), v28 (copy)
    local l_pass_0 = v47.props.pass;
    return v2.createElement(l_ItemTile_0, {
        [v2.Ref] = if v21 then v47.ref else nil, 
        name = l_pass_0.displayName, 
        titleTextLineCount = 1, 
        thumbnail = v47.props.passThumbnail, 
        onActivated = v47.viewPassDetails(l_pass_0), 
        footer = v2.createElement(v28, {
            price = l_pass_0.price, 
            userOwnsPass = l_pass_0.isOwned, 
            onActivated = v47.promptPurchase(l_pass_0, v47.props.universeId)
        })
    });
end;
v33.didMount = function(v49) --[[ Line: 195 ]] --[[ Name: didMount ]]
    -- upvalues: v21 (copy), l_UnifiedEventLogEnums_0 (copy), v31 (copy), l_addUnifiedEventLogging_0 (copy), l_SessionService_0 (copy)
    v49.isMounted = true;
    if v21 then
        task.delay(0, function() --[[ Line: 198 ]]
            -- upvalues: v49 (copy), l_UnifiedEventLogEnums_0 (ref), v31 (ref), l_addUnifiedEventLogging_0 (ref), l_SessionService_0 (ref)
            local v50 = {
                universeId = tonumber(v49.props.universeId), 
                itemId = v49.props.pass.id, 
                itemType = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.GAME_PASS
            };
            if v31() then
                v50.gridPositionRow = v49.props.gridPositionRow;
                v50.gridPositionColumn = v49.props.gridPositionColumn;
            end;
            l_addUnifiedEventLogging_0(v49.ref, v50, {
                sessionTagName = l_SessionService_0:GetSessionTag("level2a")
            });
        end);
    end;
end;
v33.willUnmount = function(v51) --[[ Line: 215 ]] --[[ Name: willUnmount ]]
    v51.isMounted = false;
end;
v33 = v3.connect(l_FFlagUnifiedPurchasePassInProductInfoEDP_0 and function(v52, _) --[[ Line: 220 ]]
    return {
        userRobux = v52.UserRobux[v52.LocalUserId]
    };
end or nil, function(v54) --[[ Line: 225 ]]
    -- upvalues: l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 (copy), l_getTTIEventName_0 (copy), l_ProductPurchaseSurface_0 (copy), l_TimeToInteractiveTracker_0 (copy), v14 (copy), v22 (copy), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (copy), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (copy), v37 (copy), l_CorePackages_0 (copy), v9 (copy), v4 (copy)
    return {
        requestPurchasePass = function(v55, v56) --[[ Line: 227 ]] --[[ Name: requestPurchasePass ]]
            -- upvalues: l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 (ref), l_getTTIEventName_0 (ref), l_ProductPurchaseSurface_0 (ref), l_TimeToInteractiveTracker_0 (ref), v54 (copy), v14 (ref)
            if l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 then
                local v57 = l_getTTIEventName_0(l_ProductPurchaseSurface_0.EDP);
                l_TimeToInteractiveTracker_0.trackStart(v57);
                l_TimeToInteractiveTracker_0.updateMetadata(v57, {
                    page = l_ProductPurchaseSurface_0.EDP, 
                    category = "legacy_purchase_modal"
                });
            end;
            return v54(v14(v55, v56));
        end, 
        requestPurchasePassWithUnifiedPurchasePrompt = function(v58, v59, v60, v61, v62, v63) --[[ Line: 238 ]] --[[ Name: requestPurchasePassWithUnifiedPurchasePrompt ]]
            -- upvalues: v54 (copy), v22 (ref), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (ref), l_ProductPurchaseSurface_0 (ref), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (ref), v37 (ref), l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 (ref)
            return v54(v22({
                productPayload = {
                    id = v58.id, 
                    kind = "Gamepass"
                }, 
                purchaseCallbacks = {
                    onFlowComplete = v60, 
                    onPurchaseSuccess = v61, 
                    fetchProductInfo = if l_FFlagUnifiedPurchasePassInProductInfoEDP_0 then v62 else nil
                }, 
                purchaseAnalyticsMetadata = {
                    surface = l_ProductPurchaseSurface_0.EDP, 
                    productUniverseId = if l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 then v59 else nil
                }, 
                purchaseOptions = if l_FFlagUnifiedPurchasePassInProductInfoEDP_0 then {
                    shouldSkipOwnershipCheck = not v58.isOwned, 
                    providedRobuxBalance = v63, 
                    enablePreloadedPurchaseUI = v37 and true or nil
                } else nil
            }, l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 and true or nil));
        end, 
        closeCentralOverlay = function() --[[ Line: 268 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: l_CorePackages_0 (ref), v54 (copy)
            local l_CloseCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay;
            return v54(l_CloseCentralOverlay_0());
        end, 
        apiFetchGamePasses = function(v65, v66) --[[ Line: 273 ]] --[[ Name: apiFetchGamePasses ]]
            -- upvalues: v54 (copy), v9 (ref)
            return v54(v9(v65, v66));
        end, 
        navigateDown = function(v67) --[[ Line: 276 ]] --[[ Name: navigateDown ]]
            -- upvalues: v54 (copy), v4 (ref)
            return v54(v4(v67));
        end
    };
end)(v33);
if v29 then
    v33 = l_RoactServices_0.connect({
        networking = v10
    })(v33);
end;
return v33;