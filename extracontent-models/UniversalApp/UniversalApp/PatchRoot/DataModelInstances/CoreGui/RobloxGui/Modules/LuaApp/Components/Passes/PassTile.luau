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
v33.init = function(v38) --[[ Line: 85 ]] --[[ Name: init ]]
    -- upvalues: v21 (copy), v2 (copy), v12 (copy), v30 (copy), v15 (copy), l_Constants_0 (copy), v29 (copy), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (copy), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (copy), v6 (copy), v7 (copy), v5 (copy)
    if v21 then
        v38.ref = v2.createRef();
    end;
    v38.promptPurchase = function(v39, v40) --[[ Line: 89 ]]
        -- upvalues: v38 (copy), v12 (ref), v30 (ref), v15 (ref), l_Constants_0 (ref), v29 (ref), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (ref), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (ref)
        local function v41() --[[ Line: 90 ]] --[[ Name: onFlowComplete ]]
            -- upvalues: v38 (ref)
            v38.props.closeCentralOverlay();
        end;
        local function v42() --[[ Line: 93 ]] --[[ Name: onPurchaseSuccess ]]
            -- upvalues: v38 (ref), v40 (copy)
            v38.props.apiFetchGamePasses(v38.props.networking, v40);
        end;
        local function v43() --[[ Line: 96 ]] --[[ Name: fetchProductInfo ]]
            -- upvalues: v12 (ref), v39 (copy), v38 (ref)
            return v12.resolve({
                TargetId = v39.id, 
                IsForSale = true, 
                Name = v39.displayName, 
                Description = v39.displayDescription, 
                PriceInRobux = v39.price, 
                ImageUrl = v38.props.passThumbnail, 
                ProductId = v39.productId
            });
        end;
        return function() --[[ Line: 107 ]]
            -- upvalues: v30 (ref), v15 (ref), l_Constants_0 (ref), v38 (ref), v39 (copy), v29 (ref), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (ref), v40 (copy), v41 (copy), v42 (copy), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (ref), v43 (copy)
            if v30() then
                v15.EdpStoreAnalyticsLogger.logEvent(l_Constants_0.StoreEnums.ActionType.PurchaseAttemptClick, l_Constants_0.StoreEnums.ProductType.GamePasses, v38.props.locationType, tonumber(v38.props.universeId), tonumber(v39.id), (tostring(v39.id)));
            end;
            if not v39.isOwned then
                if v29 then
                    l_getIsUserEligibleForUnifiedPurchaseFlow_0(v38.props.networking):andThen(function(v44) --[[ Line: 121 ]]
                        -- upvalues: v38 (ref), v39 (ref), v40 (ref), v41 (ref), v42 (ref), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (ref), v43 (ref)
                        if v44 then
                            v38.props.requestPurchasePassWithUnifiedPurchasePrompt(v39, v40, v41, v42, if l_FFlagUnifiedPurchasePassInProductInfoEDP_0 then v43 else nil, if l_FFlagUnifiedPurchasePassInProductInfoEDP_0 then v38.props.userRobux else nil);
                            return;
                        else
                            v38.props.requestPurchasePass(v39, v40);
                            return;
                        end;
                    end):catch(function() --[[ Line: 135 ]]
                        -- upvalues: v38 (ref), v39 (ref), v40 (ref)
                        v38.props.requestPurchasePass(v39, v40);
                    end);
                    return;
                else
                    v38.props.requestPurchasePass(v39, v40);
                end;
            end;
        end;
    end;
    v38.viewPassDetails = function(v45) --[[ Line: 145 ]]
        -- upvalues: v38 (copy), v30 (ref), v15 (ref), l_Constants_0 (ref), v6 (ref), v7 (ref), v5 (ref)
        return function() --[[ Line: 146 ]]
            -- upvalues: v38 (ref), v30 (ref), v15 (ref), l_Constants_0 (ref), v45 (copy), v6 (ref), v7 (ref), v5 (ref)
            if v38.isMounted then
                if v30() then
                    v15.EdpStoreAnalyticsLogger.logEvent(l_Constants_0.StoreEnums.ActionType.ItemClick, l_Constants_0.StoreEnums.ProductType.GamePasses, v38.props.locationType, tonumber(v38.props.universeId), tonumber(v45.id), (tostring(v45.id)));
                end;
                v38.props.navigateDown({
                    name = v6.GenericWebPage, 
                    detail = v7.game.info.pass({
                        passId = v45.id
                    }), 
                    extraProps = {
                        title = v45.displayName, 
                        transitionAnimation = v5.SlideInFromRight, 
                        passOwned = v45.isOwned
                    }
                });
            end;
        end;
    end;
end;
v33.render = function(v46) --[[ Line: 174 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_ItemTile_0 (copy), v21 (copy), v28 (copy)
    local l_pass_0 = v46.props.pass;
    return v2.createElement(l_ItemTile_0, {
        [v2.Ref] = if v21 then v46.ref else nil, 
        name = l_pass_0.displayName, 
        titleTextLineCount = 1, 
        thumbnail = v46.props.passThumbnail, 
        onActivated = v46.viewPassDetails(l_pass_0), 
        footer = v2.createElement(v28, {
            price = l_pass_0.price, 
            userOwnsPass = l_pass_0.isOwned, 
            onActivated = v46.promptPurchase(l_pass_0, v46.props.universeId)
        })
    });
end;
v33.didMount = function(v48) --[[ Line: 191 ]] --[[ Name: didMount ]]
    -- upvalues: v21 (copy), l_UnifiedEventLogEnums_0 (copy), v31 (copy), l_addUnifiedEventLogging_0 (copy), l_SessionService_0 (copy)
    v48.isMounted = true;
    if v21 then
        task.delay(0, function() --[[ Line: 194 ]]
            -- upvalues: v48 (copy), l_UnifiedEventLogEnums_0 (ref), v31 (ref), l_addUnifiedEventLogging_0 (ref), l_SessionService_0 (ref)
            local v49 = {
                universeId = tonumber(v48.props.universeId), 
                itemId = v48.props.pass.id, 
                itemType = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.GAME_PASS
            };
            if v31() then
                v49.gridPositionRow = v48.props.gridPositionRow;
                v49.gridPositionColumn = v48.props.gridPositionColumn;
            end;
            l_addUnifiedEventLogging_0(v48.ref, v49, {
                sessionTagName = l_SessionService_0:GetSessionTag("level2a")
            });
        end);
    end;
end;
v33.willUnmount = function(v50) --[[ Line: 211 ]] --[[ Name: willUnmount ]]
    v50.isMounted = false;
end;
v33 = v3.connect(l_FFlagUnifiedPurchasePassInProductInfoEDP_0 and function(v51, _) --[[ Line: 216 ]]
    return {
        userRobux = v51.UserRobux[v51.LocalUserId]
    };
end or nil, function(v53) --[[ Line: 221 ]]
    -- upvalues: l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 (copy), l_getTTIEventName_0 (copy), l_ProductPurchaseSurface_0 (copy), l_TimeToInteractiveTracker_0 (copy), v14 (copy), v22 (copy), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (copy), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (copy), v37 (copy), l_CorePackages_0 (copy), v9 (copy), v4 (copy)
    return {
        requestPurchasePass = function(v54, v55) --[[ Line: 223 ]] --[[ Name: requestPurchasePass ]]
            -- upvalues: l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 (ref), l_getTTIEventName_0 (ref), l_ProductPurchaseSurface_0 (ref), l_TimeToInteractiveTracker_0 (ref), v53 (copy), v14 (ref)
            if l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 then
                local v56 = l_getTTIEventName_0(l_ProductPurchaseSurface_0.EDP);
                l_TimeToInteractiveTracker_0.trackStart(v56);
                l_TimeToInteractiveTracker_0.updateMetadata(v56, {
                    page = l_ProductPurchaseSurface_0.EDP, 
                    category = "legacy_purchase_modal"
                });
            end;
            return v53(v14(v54, v55));
        end, 
        requestPurchasePassWithUnifiedPurchasePrompt = function(v57, v58, v59, v60, v61, v62) --[[ Line: 234 ]] --[[ Name: requestPurchasePassWithUnifiedPurchasePrompt ]]
            -- upvalues: v53 (copy), v22 (ref), l_FFlagUnifiedPurchasePassInProductInfoEDP_0 (ref), l_ProductPurchaseSurface_0 (ref), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (ref), v37 (ref), l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 (ref)
            return v53(v22({
                productPayload = {
                    id = v57.id, 
                    kind = "Gamepass"
                }, 
                purchaseCallbacks = {
                    onFlowComplete = v59, 
                    onPurchaseSuccess = v60, 
                    fetchProductInfo = if l_FFlagUnifiedPurchasePassInProductInfoEDP_0 then v61 else nil
                }, 
                purchaseAnalyticsMetadata = {
                    surface = l_ProductPurchaseSurface_0.EDP, 
                    productUniverseId = if l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 then v58 else nil
                }, 
                purchaseOptions = if l_FFlagUnifiedPurchasePassInProductInfoEDP_0 then {
                    shouldSkipOwnershipCheck = not v57.isOwned, 
                    providedRobuxBalance = v62, 
                    enablePreloadedPurchaseUI = v37 and true or nil
                } else nil
            }, l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 and true or nil));
        end, 
        closeCentralOverlay = function() --[[ Line: 264 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: l_CorePackages_0 (ref), v53 (copy)
            local l_CloseCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay;
            return v53(l_CloseCentralOverlay_0());
        end, 
        apiFetchGamePasses = function(v64, v65) --[[ Line: 269 ]] --[[ Name: apiFetchGamePasses ]]
            -- upvalues: v53 (copy), v9 (ref)
            return v53(v9(v64, v65));
        end, 
        navigateDown = function(v66) --[[ Line: 272 ]] --[[ Name: navigateDown ]]
            -- upvalues: v53 (copy), v4 (ref)
            return v53(v4(v66));
        end
    };
end)(v33);
if v29 then
    v33 = l_RoactServices_0.connect({
        networking = v10
    })(v33);
end;
return v33;