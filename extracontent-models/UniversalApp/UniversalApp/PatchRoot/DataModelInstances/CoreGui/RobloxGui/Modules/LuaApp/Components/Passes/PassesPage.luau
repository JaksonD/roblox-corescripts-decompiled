local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamePasses);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_Modules_0.LuaApp.withLocalization);
local v9 = require(l_CorePackages_0.Packages.Cryo);
local v10 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local v11 = require(l_CorePackages_0.Workspace.Packages.EdpStoreAnalytics);
local l_Constants_0 = v11.Constants;
local l_EdpStoreImpressionsDetector_0 = v11.EdpStoreImpressionsDetector;
local v14 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v14.Style.withStyle;
local l_useTextSizeOffset_0 = v14.Core.Style.useTextSizeOffset;
local v17 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_ImpressionsTagUtility_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ImpressionsTagUtility;
local v19 = require(l_Modules_0.LuaApp.Flags.FFlagEnableEdpStoreImpressionsLogging);
local v20 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreClickLogging);
local v21 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreGridPositionLogging);
local v22 = require(l_Modules_0.LuaApp.Thunks.ApiFetchPassesThumbnails);
local v23 = require(l_Modules_0.LuaApp.Thunks.DeveloperProduct.ApiFetchGameDeveloperProducts);
local v24 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v25 = require(l_Modules_0.LuaApp.Components.Passes.PassesGrid);
local v26 = require(l_Modules_0.LuaApp.Components.Subscription.SubscriptionsGrid);
local v27 = require(l_Modules_0.LuaApp.Components.DeveloperProduct.DeveloperProductsGrid);
local v28 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local v29 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableDevSubsInRobux);
local l_FFlagAppIaScrollAway_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAppIaScrollAway;
local v31 = v2.PureComponent:extend("PassesPage");
v31.validateProps = v7.strictInterface({
    universeId = v7.string, 
    viewWidth = if v21() then v7.optional(v7.number) else nil, 
    networking = v7.callback, 
    passes = v7.optional(v7.table), 
    showSubscriptionProducts = v7.optional(v7.boolean), 
    developerProducts = v7.optional(v7.table), 
    rootPlaceId = v7.optional(v7.string), 
    localUserId = v7.optional(v7.string), 
    creatorName = v7.optional(v7.string), 
    creatorVerified = v7.optional(v7.boolean), 
    topBarHeight = if l_FFlagAppIaScrollAway_0 then v7.number else nil, 
    requestPassesThumbnails = v7.callback, 
    fetchGamePasses = v7.callback, 
    fetchGameDeveloperProducts = v7.callback, 
    textSizeOffset = v7.number
});
v31.init = function(v32) --[[ Line: 73 ]] --[[ Name: init ]]
    -- upvalues: v19 (copy), v2 (copy), v17 (copy)
    if v19 then
        v32.gamePassRef = v2.createRef();
        v32.developerProductsRef = v2.createRef();
        v32.subscriptionsRef = v2.createRef();
        v32.storeContainerRef = v2.createRef();
        v32.scrollViewPositionChangedSignal = v2.createRef();
        v32.scrollViewPositionChangedSignal.current = v17.Signal.new();
        v32.scrollViewPositionChangedSignalCallback = function(_) --[[ Line: 83 ]]
            -- upvalues: v32 (copy)
            v32.scrollViewPositionChangedSignal.current:fire();
        end;
    end;
    v32.fetchPassesThumbnails = function(v34, v35) --[[ Line: 88 ]]
        -- upvalues: v32 (copy)
        if v34 then
            local v36 = {};
            for _, v38 in ipairs(v34) do
                table.insert(v36, v38.id);
            end;
            v32.props.requestPassesThumbnails(v35, v36);
        end;
    end;
    v32.fetchGameDeveloperProducts = function(v39, v40, v41, v42) --[[ Line: 99 ]]
        -- upvalues: v32 (copy)
        v32.props.fetchGameDeveloperProducts(v39, v40, v41, v42);
    end;
end;
v31.render = function(v43) --[[ Line: 104 ]] --[[ Name: render ]]
    -- upvalues: v19 (copy), l_ImpressionsTagUtility_0 (copy), l_Constants_0 (copy), v2 (copy), l_EdpStoreImpressionsDetector_0 (copy), l_withStyle_0 (copy), v24 (copy), l_FFlagAppIaScrollAway_0 (copy), v10 (copy), v8 (copy), v26 (copy), v29 (copy), v25 (copy), v20 (copy), v21 (copy), v27 (copy)
    local l_universeId_0 = v43.props.universeId;
    local l_passes_0 = v43.props.passes;
    local v46 = l_passes_0 and #l_passes_0 > 0;
    local l_showSubscriptionProducts_0 = v43.props.showSubscriptionProducts;
    local l_developerProducts_0 = v43.props.developerProducts;
    local v49 = l_developerProducts_0 and #l_developerProducts_0 > 0;
    local v50 = nil;
    local v51 = nil;
    local v52 = nil;
    local v53 = nil;
    local v54 = nil;
    local v55 = nil;
    local v56 = nil;
    if v19 then
        v53 = function(v57) --[[ Line: 121 ]]
            -- upvalues: v43 (copy)
            v43.storeContainerRef.current = v57;
        end;
        v54 = function(v58) --[[ Line: 124 ]]
            -- upvalues: v43 (copy), l_ImpressionsTagUtility_0 (ref), l_Constants_0 (ref)
            v43.gamePassRef.current = v58;
            l_ImpressionsTagUtility_0.AddTag(v43.gamePassRef, l_Constants_0.ImpressionsTags.GamePasses, 1);
        end;
        v55 = function(v59) --[[ Line: 128 ]]
            -- upvalues: v43 (copy), l_ImpressionsTagUtility_0 (ref), l_Constants_0 (ref)
            v43.developerProductsRef.current = v59;
            l_ImpressionsTagUtility_0.AddTag(v43.developerProductsRef, l_Constants_0.ImpressionsTags.DeveloperProducts, 1);
        end;
        v56 = function(v60) --[[ Line: 136 ]]
            -- upvalues: v43 (copy), l_ImpressionsTagUtility_0 (ref), l_Constants_0 (ref)
            v43.subscriptionsRef.current = v60;
            l_ImpressionsTagUtility_0.AddTag(v43.subscriptionsRef, l_Constants_0.ImpressionsTags.Subscriptions, 1);
        end;
        v50 = v2.createElement(l_EdpStoreImpressionsDetector_0, {
            parentRef = v43.storeContainerRef, 
            scrollViewPositionChangedSignal = v43.scrollViewPositionChangedSignal, 
            impressionsTag = l_Constants_0.ImpressionsTags.GamePasses, 
            parameters = {
                universeId = v43.props.universeId, 
                productType = l_Constants_0.StoreEnums.ProductType.GamePasses, 
                locationType = l_Constants_0.StoreEnums.LocationType.Store
            }
        });
        v51 = v2.createElement(l_EdpStoreImpressionsDetector_0, {
            parentRef = v43.storeContainerRef, 
            scrollViewPositionChangedSignal = v43.scrollViewPositionChangedSignal, 
            impressionsTag = l_Constants_0.ImpressionsTags.DeveloperProducts, 
            parameters = {
                universeId = v43.props.universeId, 
                productType = l_Constants_0.StoreEnums.ProductType.DeveloperProducts, 
                locationType = l_Constants_0.StoreEnums.LocationType.Store
            }
        });
        v52 = v2.createElement(l_EdpStoreImpressionsDetector_0, {
            parentRef = v43.storeContainerRef, 
            scrollViewPositionChangedSignal = v43.scrollViewPositionChangedSignal, 
            impressionsTag = l_Constants_0.ImpressionsTags.Subscriptions, 
            parameters = {
                universeId = v43.props.universeId, 
                productType = l_Constants_0.StoreEnums.ProductType.Subscriptions, 
                locationType = l_Constants_0.StoreEnums.LocationType.Store
            }
        });
    end;
    return l_withStyle_0(function(v61) --[[ Line: 176 ]]
        -- upvalues: v2 (ref), v24 (ref), l_FFlagAppIaScrollAway_0 (ref), v10 (ref), v43 (copy), v19 (ref), v53 (ref), v8 (ref), v50 (ref), v51 (ref), v52 (ref), l_showSubscriptionProducts_0 (copy), v56 (ref), v26 (ref), l_universeId_0 (copy), v29 (ref), v46 (copy), v54 (ref), v25 (ref), l_passes_0 (copy), v20 (ref), l_Constants_0 (ref), v21 (ref), v49 (copy), v55 (ref), v27 (ref), l_developerProducts_0 (copy)
        return v2.createElement("Frame", {
            Name = "PassesContent", 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v61.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = v61.Theme.BackgroundDefault.Transparency, 
            BorderSizePixel = 0
        }, {
            TopBar = v2.createElement(v24.Container, {
                leftItem = v24.BackButton, 
                rightItems = {
                    v24.BuyRobuxButton
                }
            }), 
            PageContent = v2.createElement(v24.PageContent, {}, {
                MainPadding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, if l_FFlagAppIaScrollAway_0 and v10.getScrollAwayEnabled() then 24 + v43.props.topBarHeight else 24), 
                    PaddingBottom = UDim.new(0, 24), 
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24)
                }), 
                PassesArea = v2.createElement("ScrollingFrame", {
                    Name = "PassesArea", 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = false, 
                    CanvasSize = UDim2.new(1, 0, 0, 0), 
                    ScrollBarThickness = 0, 
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    ElasticBehavior = Enum.ElasticBehavior.Always, 
                    [v2.Ref] = if v19 then v53 else nil
                }, {
                    GridLayoutContainer = v8({
                        subscriptions = "Feature.Subscription.Heading.Subscriptions", 
                        passes = "Feature.GamePass.Heading.PassesForThisGame", 
                        developerProducts = "Feature.DeveloperProducts.Heading.Products"
                    })(function(v62) --[[ Line: 218 ]]
                        -- upvalues: v2 (ref), v19 (ref), v43 (ref), v50 (ref), v51 (ref), v52 (ref), l_showSubscriptionProducts_0 (ref), v61 (copy), v56 (ref), v26 (ref), l_universeId_0 (ref), v29 (ref), v46 (ref), v54 (ref), v25 (ref), l_passes_0 (ref), v20 (ref), l_Constants_0 (ref), v21 (ref), v49 (ref), v55 (ref), v27 (ref), l_developerProducts_0 (ref)
                        return v2.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, 0), 
                            BackgroundTransparency = 1, 
                            [v2.Change.AbsolutePosition] = if v19 then v43.scrollViewPositionChangedSignalCallback else nil
                        }, {
                            GamePassesImpressionDetector = if v19 then v50 else nil, 
                            DeveloperProductsImpressionDetector = if v19 then v51 else nil, 
                            SubscriptionsImpressionDetector = if v19 then v52 else nil, 
                            UIListLayout = v2.createElement("UIListLayout", {
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                FillDirection = Enum.FillDirection.Vertical, 
                                Padding = UDim.new(0, 24)
                            }), 
                            SubscriptionHeader = if l_showSubscriptionProducts_0 then v2.createElement("TextLabel", {
                                Text = v62.subscriptions, 
                                BackgroundTransparency = 1, 
                                TextColor3 = v61.Theme.TextDefault.Color, 
                                TextSize = v61.Font.BaseSize * v61.Font.Header2.RelativeSize, 
                                Font = v61.Font.Header2.Font, 
                                LayoutOrder = 0, 
                                Size = UDim2.new(1, 0, 0, 0), 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                [v2.Ref] = if v19 then v56 else nil
                            }) else nil, 
                            SubscriptionsGrid = if l_showSubscriptionProducts_0 then v2.createElement(v26, {
                                universeId = l_universeId_0, 
                                layoutOrder = 1, 
                                creatorName = if v29() then v43.props.creatorName else nil, 
                                creatorVerified = if v29() then v43.props.creatorVerified else nil
                            }) else nil, 
                            Passes = if v46 then v2.createElement("TextLabel", {
                                Text = v62.passes, 
                                BackgroundTransparency = 1, 
                                TextColor3 = v61.Theme.TextDefault.Color, 
                                TextSize = v61.Font.BaseSize * v61.Font.Header2.RelativeSize, 
                                Font = v61.Font.Header2.Font, 
                                LayoutOrder = 2, 
                                Size = UDim2.new(1, 0, 0, 0), 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                [v2.Ref] = if v19 then v54 else nil
                            }) else nil, 
                            PassesGrid = if v46 then v2.createElement(v25, {
                                universeId = l_universeId_0, 
                                passes = l_passes_0, 
                                layoutOrder = 3, 
                                textSizeOffset = v43.props.textSizeOffset, 
                                locationType = if v20() then l_Constants_0.StoreEnums.LocationType.Store else nil, 
                                viewWidth = if v21() then v43.props.viewWidth else nil
                            }) else nil, 
                            DeveloperProductHeader = if v49 then v2.createElement("TextLabel", {
                                Text = v62.developerProducts, 
                                BackgroundTransparency = 1, 
                                TextColor3 = v61.Theme.TextDefault.Color, 
                                TextSize = v61.Font.BaseSize * v61.Font.Header2.RelativeSize, 
                                Font = v61.Font.Header2.Font, 
                                LayoutOrder = 4, 
                                Size = UDim2.new(1, 0, 0, 0), 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                [v2.Ref] = if v19 then v55 else nil
                            }) else nil, 
                            DeveloperProductsGrid = if v49 then v2.createElement(v27, {
                                universeId = l_universeId_0, 
                                developerProducts = l_developerProducts_0, 
                                layoutOrder = 5, 
                                locationType = l_Constants_0.StoreEnums.LocationType.Store
                            }) else nil
                        });
                    end)
                })
            })
        });
    end);
end;
v31.didMount = function(v63) --[[ Line: 333 ]] --[[ Name: didMount ]]
    local l_passes_1 = v63.props.passes;
    local l_networking_0 = v63.props.networking;
    local l_developerProducts_1 = v63.props.developerProducts;
    local l_universeId_1 = v63.props.universeId;
    local l_rootPlaceId_0 = v63.props.rootPlaceId;
    local l_localUserId_0 = v63.props.localUserId;
    if l_passes_1 ~= nil then
        v63.fetchPassesThumbnails(l_passes_1, l_networking_0);
    end;
    if l_developerProducts_1 ~= nil then
        v63.fetchGameDeveloperProducts(l_networking_0, l_universeId_1, l_rootPlaceId_0, l_localUserId_0);
    end;
end;
v31.didUpdate = function(v70, v71, _) --[[ Line: 350 ]] --[[ Name: didUpdate ]]
    if v71.passes ~= v70.props.passes then
        v70.fetchPassesThumbnails(v70.props.passes, v70.props.networking);
    end;
end;
v31 = v3.connect(function(v73, v74) --[[ Line: 356 ]]
    -- upvalues: v29 (copy), v28 (copy), l_FFlagAppIaScrollAway_0 (copy)
    local v75 = v29() and v28.isCreatorOfGameVerified(v73, {
        universeId = v74.universeId, 
        shouldUseV2GameDetails = true
    });
    return {
        passes = v73.GamePasses[tostring(v74.universeId)], 
        showSubscriptionProducts = v73.GameSubscriptionProducts[v74.universeId] and #v73.GameSubscriptionProducts[v74.universeId] > 0, 
        developerProducts = v73.GameDeveloperProducts[tostring(v74.universeId)], 
        rootPlaceId = if v73.GameDetails and v73.GameDetails[v74.universeId] then v73.GameDetails[v74.universeId].rootPlaceId else nil, 
        localUserId = v73.LocalUserId, 
        creatorName = if v29() and v73.GameDetails and v73.GameDetails[v74.universeId] then v73.GameDetails[v74.universeId].creator.name else nil, 
        creatorVerified = if v29() then v75 else nil, 
        topBarHeight = if l_FFlagAppIaScrollAway_0 then v73.TopBar.topBarHeight else nil
    };
end, function(v76) --[[ Line: 379 ]]
    -- upvalues: v22 (copy), v4 (copy), v23 (copy)
    return {
        requestPassesThumbnails = function(v77, v78) --[[ Line: 381 ]] --[[ Name: requestPassesThumbnails ]]
            -- upvalues: v76 (copy), v22 (ref)
            return v76(v22(v77, v78));
        end, 
        fetchGamePasses = function(v79, v80) --[[ Line: 384 ]] --[[ Name: fetchGamePasses ]]
            -- upvalues: v76 (copy), v4 (ref)
            return v76(v4(v79, v80));
        end, 
        fetchGameDeveloperProducts = function(v81, v82, v83, v84) --[[ Line: 387 ]] --[[ Name: fetchGameDeveloperProducts ]]
            -- upvalues: v76 (copy), v23 (ref)
            return v76(v23(v81, v82, v83, v84));
        end
    };
end)(v31);
v31 = l_RoactServices_0.connect({
    networking = v6
})(v31);
return function(v85) --[[ Line: 396 ]]
    -- upvalues: l_useTextSizeOffset_0 (copy), v9 (copy), v2 (copy), v31 (ref)
    local v86 = l_useTextSizeOffset_0();
    local v87 = v9.Dictionary.join(v85, {
        textSizeOffset = v86
    });
    return v2.createElement(v31, v87);
end;