local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v10 = require(l_CorePackages_0.Packages.Roact);
local v11 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v13 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v14 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local v16 = require(l_CorePackages_0.Packages.AvatarExperienceDeps);
local v17 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v17.Focusable;
local l_RoactFitComponents_0 = v16.RoactFitComponents;
local l_FitFrameHorizontal_0 = l_RoactFitComponents_0.FitFrameHorizontal;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.RemoveAvailableToSellAsset);
local v24 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.GetMarketplaceFee);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v28 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v29 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v30 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v31 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v34 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v35 = require(l_Modules_0.AvatarExperience.Catalog.Components.IconTextBox);
local v36 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.RobuxAmountDisplay);
local l_FFlagAXRemoveSellPageAndChildrenGamepadBindings_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRemoveSellPageAndChildrenGamepadBindings;
local v38 = require(l_CorePackages_0.Packages.UIBlox);
local l_ImageSetLabel_0 = v38.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v38.App.ImageSet.Images;
local l_withStyle_0 = v38.Style.withStyle;
local l_InteractiveAlert_0 = v38.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v38.App.Button.Enum.ButtonType;
local l_LoadingStateContainer_0 = v38.App.Container.LoadingStateContainer;
local l_RetrievalStatus_1 = v38.App.Loading.Enum.RetrievalStatus;
local v46 = l_Images_0["icons/common/robux"];
local v47 = v10.PureComponent:extend("SellItemPrompt");
v47.init = function(v48) --[[ Line: 73 ]] --[[ Name: init ]]
    -- upvalues: l_UserInputService_0 (copy), l_withStyle_0 (copy), v10 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_1 (copy), v26 (copy)
    v48.isMounted = false;
    v48.state = {
        isKeyboardRepositioned = false, 
        priceInRobux = 0
    };
    v48.changeText = function(v49) --[[ Line: 80 ]]
        -- upvalues: v48 (copy)
        if not v48.isMounted then
            return;
        else
            local l_priceInRobux_0 = v48.state.priceInRobux;
            local l_Text_0 = v49.Text;
            local v52 = l_priceInRobux_0 == 0 and "" or l_priceInRobux_0;
            if string.len(l_Text_0) > 10 then
                v49.Text = v52;
                return;
            elseif l_priceInRobux_0 ~= 0 and (l_Text_0 == nil or l_Text_0 == "") then
                v48:setState({
                    priceInRobux = 0
                });
                return;
            elseif string.match(l_Text_0, "^[0-9]+$") then
                v48:setState({
                    priceInRobux = l_Text_0
                });
                return;
            else
                v49.Text = v52;
                return;
            end;
        end;
    end;
    v48.sellItem = function() --[[ Line: 106 ]]
        -- upvalues: v48 (copy)
        local l_priceInRobux_1 = v48.state.priceInRobux;
        if not l_priceInRobux_1 or tonumber(l_priceInRobux_1) <= 0 then
            return;
        else
            local l_networking_0 = v48.props.networking;
            local l_itemId_0 = v48.props.itemId;
            local l_userAssetId_0 = v48.props.userAssetId;
            local v57 = tonumber(l_priceInRobux_1);
            v48.props.sellAsset(l_networking_0, l_itemId_0, l_userAssetId_0, v57);
            return;
        end;
    end;
    v48.getMarketplaceFee = function() --[[ Line: 123 ]]
        -- upvalues: v48 (copy)
        local l_networking_1 = v48.props.networking;
        return v48.props.getMarketplaceFee(l_networking_1);
    end;
    v48.keyboardConnection = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(function() --[[ Line: 128 ]]
        -- upvalues: v48 (copy), l_UserInputService_0 (ref)
        if not v48.isMounted then
            return;
        else
            if not v48.state.isKeyboardRepositioned and l_UserInputService_0.OnScreenKeyboardVisible then
                v48:setState({
                    isKeyboardRepositioned = true
                });
            end;
            return;
        end;
    end);
    v48.getMiddleContent = function(v59) --[[ Line: 140 ]]
        -- upvalues: l_withStyle_0 (ref), v48 (copy), v10 (ref), l_LoadingStateContainer_0 (ref), l_RetrievalStatus_1 (ref)
        return function() --[[ Line: 141 ]]
            -- upvalues: l_withStyle_0 (ref), v48 (ref), v59 (copy), v10 (ref), l_LoadingStateContainer_0 (ref), l_RetrievalStatus_1 (ref)
            local function v61() --[[ Line: 142 ]]
                -- upvalues: l_withStyle_0 (ref), v48 (ref), v59 (ref)
                return l_withStyle_0(function(v60) --[[ Line: 143 ]]
                    -- upvalues: v48 (ref), v59 (ref)
                    return v48:renderOnLoaded(v59, v60);
                end);
            end;
            return v10.createElement(l_LoadingStateContainer_0, {
                dataStatus = l_RetrievalStatus_1.fromRawValue(v48.props.marketPlaceFeeFetchingState), 
                onRetry = v48.getMarketplaceFee, 
                renderOnLoaded = v61
            });
        end;
    end;
    v48.closePrompt = function() --[[ Line: 156 ]]
        -- upvalues: v26 (ref), v48 (copy)
        v26.closeOverlay(v48.props.navigation);
    end;
end;
v47.didMount = function(v62) --[[ Line: 161 ]] --[[ Name: didMount ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    v62.isMounted = true;
    if v62.props.marketPlaceFeeFetchingState ~= l_RetrievalStatus_0.Fetching then
        v62.getMarketplaceFee();
    end;
end;
v47.willUpdate = function(v63, v64, _) --[[ Line: 169 ]] --[[ Name: willUpdate ]]
    -- upvalues: v31 (copy)
    if v31.isFetchingDoneOrFailed(v63.props.sellFetchingState, v64.sellFetchingState) then
        v63.closePrompt();
    end;
end;
v47.renderOnLoaded = function(v66, v67, v68) --[[ Line: 175 ]] --[[ Name: renderOnLoaded ]]
    -- upvalues: l_NumberLocalization_0 (copy), v29 (copy), v10 (copy), l_FitFrameVertical_0 (copy), l_Focusable_0 (copy), v35 (copy), v46 (copy), l_FitTextLabel_0 (copy), l_FitFrameHorizontal_0 (copy), l_ImageSetLabel_0 (copy), v36 (copy)
    local l_marketplaceFee_0 = v66.props.marketplaceFee;
    local l_averagePrice_0 = v66.props.averagePrice;
    local l_localization_0 = v66.props.localization;
    local l_priceInRobux_2 = v66.state.priceInRobux;
    local l_taxRate_0 = l_marketplaceFee_0.taxRate;
    local l_minimumFee_0 = l_marketplaceFee_0.minimumFee;
    local v75 = l_averagePrice_0 and l_NumberLocalization_0.localize(l_averagePrice_0, l_localization_0:GetLocale()) or "";
    local v76 = 0;
    local v77 = 0;
    local v78 = true;
    local v79 = tonumber(l_priceInRobux_2);
    if v79 and v79 > 0 then
        v78 = false;
        local v80 = v29.Round(l_taxRate_0 * v79);
        v76 = l_minimumFee_0 < v80 and v80 or l_minimumFee_0;
        local v81 = string.format("%.0f", v29.Round(v79 - v76));
        v77 = l_NumberLocalization_0.localize(v81, l_localization_0:GetLocale());
    end;
    local v82 = v67.robloxFeeText:gsub("({feePercentage})", l_taxRate_0 * 100);
    local v83 = string.format("%.0f", v76);
    local v84 = l_NumberLocalization_0.localize(v83, l_localization_0:GetLocale());
    local l_Font_0 = v68.Font;
    local l_Theme_0 = v68.Theme;
    local v87 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v88 = v87 + 2;
    return v10.createElement(l_FitFrameVertical_0, {
        contentPadding = UDim.new(0, 6), 
        width = UDim.new(1, 0), 
        BackgroundTransparency = 1, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center
    }, {
        PriceTextBox = v10.createElement(l_Focusable_0[v35], {
            LayoutOrder = 1, 
            PlaceholderText = v67.placeholderText, 
            Image = v46, 
            TextInputType = Enum.TextInputType.Number, 
            [v10.Change.Text] = v66.changeText
        }), 
        WarningText = v78 and v10.createElement(l_FitTextLabel_0, {
            width = UDim.new(1, 0), 
            BackgroundTransparency = 1, 
            Text = v67.minimumWarningText, 
            LayoutOrder = 2, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(1, 0, 0, 20), 
            TextColor3 = l_Theme_0.Alert.Color, 
            TextWrapped = true, 
            Font = l_Font_0.Body.Font, 
            TextSize = l_Font_0.Body.RelativeSize * l_Font_0.BaseSize
        }), 
        RobuxFeeContainer = v10.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 3, 
            Size = UDim2.new(1, 0, 0, v88)
        }, {
            RobloxFeeLabel = v10.createElement(l_FitTextLabel_0, {
                width = l_FitTextLabel_0.Width.FitToText, 
                BackgroundTransparency = 1, 
                Font = l_Font_0.Body.Font, 
                Text = v82, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextSize = v87, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 1, 
                Size = UDim2.new(0, 0, 1, 0)
            }), 
            RobuxContainer = v10.createElement(l_FitFrameHorizontal_0, {
                height = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 6), 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                Position = UDim2.new(1, 0, 0, 0)
            }, {
                MinusText = v10.createElement(l_FitTextLabel_0, {
                    width = l_FitTextLabel_0.Width.FitToText, 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Text = "-", 
                    Font = l_Font_0.Body.Font, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency, 
                    TextSize = v87
                }), 
                Image = v10.createElement(l_ImageSetLabel_0, {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, v87, 0, v87), 
                    Image = v46, 
                    ImageColor3 = l_Theme_0.TextDefault.Color, 
                    ImageTransparency = l_Theme_0.TextDefault.Transparency
                }), 
                Text = v10.createElement(l_FitTextLabel_0, {
                    width = l_FitTextLabel_0.Width.FitToText, 
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Text = v84, 
                    Font = l_Font_0.Body.Font, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency, 
                    TextSize = v87
                })
            })
        }), 
        YouEarnContainer = v10.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 4, 
            Size = UDim2.new(1, 0, 0, v88)
        }, {
            YouEarnLabel = v10.createElement(l_FitTextLabel_0, {
                width = l_FitTextLabel_0.Width.FitToText, 
                BackgroundTransparency = 1, 
                Font = l_Font_0.Body.Font, 
                Text = v67.sellCutText, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextSize = v87, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 1, 
                Size = UDim2.new(0, 0, 1, 0)
            }), 
            RobuxContainer = v10.createElement(l_FitFrameHorizontal_0, {
                height = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 6), 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                Position = UDim2.new(1, 0, 0, 0)
            }, {
                Image = v10.createElement(l_ImageSetLabel_0, {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, v87, 0, v87), 
                    Image = v46, 
                    ImageColor3 = l_Theme_0.TextDefault.Color, 
                    ImageTransparency = l_Theme_0.TextDefault.Transparency
                }), 
                Text = v10.createElement(l_FitTextLabel_0, {
                    width = l_FitTextLabel_0.Width.FitToText, 
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Text = tostring(v77), 
                    Font = l_Font_0.Body.Font, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                    TextSize = v87
                })
            })
        }), 
        AverageSellPriceContainer = v10.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 5, 
            Size = UDim2.new(1, 0, 0, v88)
        }, {
            UIListLayout = v10.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 12), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            AverageSellPriceLabel = v10.createElement(l_FitTextLabel_0, {
                width = l_FitTextLabel_0.Width.FitToText, 
                BackgroundTransparency = 1, 
                Font = l_Font_0.Body.Font, 
                Text = v67.averageSellPriceText, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextSize = v87, 
                LayoutOrder = 0
            }), 
            RobuxContainer = v10.createElement(v36, {
                robuxAmountText = v75, 
                iconSize = v87, 
                textSize = v87, 
                padding = 6
            })
        })
    });
end;
v47.render = function(v89) --[[ Line: 387 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_UserInputService_0 (copy), v10 (copy), l_Focusable_0 (copy), l_FFlagAXRemoveSellPageAndChildrenGamepadBindings_0 (copy), v17 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy), l_RetrievalStatus_0 (copy)
    return l_withLocalization_0({
        titleText = "Feature.Catalog.Heading.SellItem", 
        robloxFeeText = "Feature.Catalog.Label.RobuxFee", 
        sellCutText = "Feature.Catalog.Label.SellCut", 
        averageSellPriceText = "Feature.Catalog.Label.AveragePrice", 
        placeholderText = "Feature.Catalog.Label.Price", 
        minimumWarningText = "Feature.Catalog.Label.MinimumAmount", 
        minimumWarningTextWithPrice = "Feature.Catalog.Label.MinimumAmountCustom", 
        confirmButtonText = "Feature.Catalog.Action.Sell", 
        cancelButtonText = "Feature.Catalog.Action.Cancel"
    })(function(v90) --[[ Line: 398 ]]
        -- upvalues: v89 (copy), l_UserInputService_0 (ref), v10 (ref), l_Focusable_0 (ref), l_FFlagAXRemoveSellPageAndChildrenGamepadBindings_0 (ref), v17 (ref), l_InteractiveAlert_0 (ref), l_ButtonType_0 (ref), l_RetrievalStatus_0 (ref)
        local l_screenSize_0 = v89.props.screenSize;
        local v92 = tonumber(v89.state.priceInRobux);
        local v93 = not v92 or v92 == 0;
        local v94 = UDim2.new(0.5, 0, 0.5, 0);
        if v89.state.isKeyboardRepositioned then
            v94 = UDim2.new(0.5, 0, 0, (l_screenSize_0.Y - l_UserInputService_0.OnScreenKeyboardSize.Y) / 2);
        end;
        local l_createElement_0 = v10.createElement;
        local l_Frame_0 = l_Focusable_0.Frame;
        local v97 = {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            inputBindings = if l_FFlagAXRemoveSellPageAndChildrenGamepadBindings_0 then nil else {
                SellItem = v17.Input.onBegin(Enum.KeyCode.ButtonX, v89.sellItem, {
                    key = "Feature.Catalog.Action.Sell", 
                    disabled = v93
                })
            }
        };
        local v98 = {};
        local l_createElement_1 = v10.createElement;
        local l_l_InteractiveAlert_0_0 = l_InteractiveAlert_0;
        local v101 = {
            title = v90.titleText
        };
        local v102 = {};
        local v103 = {};
        local v104 = {
            props = {
                onActivated = v89.closePrompt, 
                text = v90.cancelButtonText
            }, 
            isDefaultChild = true
        };
        local v105 = {
            buttonType = l_ButtonType_0.PrimarySystem
        };
        local v106 = {
            isDisabled = v93
        };
        local v107 = true;
        if v89.props.sellFetchingState ~= l_RetrievalStatus_0.Fetching then
            v107 = v89.props.marketPlaceFeeFetchingState == l_RetrievalStatus_0.Fetching;
        end;
        v106.isLoading = v107;
        v106.onActivated = v89.sellItem;
        v106.text = v90.confirmButtonText;
        v105.props = v106;
        v6(v103, 1, v104, v105);
        v102.buttons = v103;
        v101.buttonStackInfo = v102;
        v101.middleContent = v89.getMiddleContent(v90);
        v101.isMiddleContentFocusable = true;
        v101.position = v94;
        v101.screenSize = v89.props.screenSize;
        v101.defaultChildRef = v89.props.defaultChildRef;
        v98.InteractiveAlert = l_createElement_1(l_l_InteractiveAlert_0_0, v101);
        return l_createElement_0(l_Frame_0, v97, v98);
    end);
end;
v47.willUnmount = function(v108) --[[ Line: 457 ]] --[[ Name: willUnmount ]]
    v108.keyboardConnection:disconnect();
    v108.keyboardConnection = nil;
    v108.isMounted = false;
end;
v47 = v11.connect(function(v109, v110) --[[ Line: 463 ]]
    -- upvalues: v30 (copy), l_PerformFetch_0 (copy), v34 (copy)
    local l_itemId_1 = v110.itemId;
    local l_itemType_0 = v110.itemType;
    local l_userAssetId_1 = v110.userAssetId;
    local v114 = v30(v109.AvatarExperience.Common, l_itemId_1, l_itemType_0);
    local v115 = v114 and v114.averagePrice;
    local v116 = v114 and v114.collectibleItemId;
    local v117 = v109.AvatarExperience.Catalog.CollectibleMarketplaceResaleParameters and v109.AvatarExperience.Catalog.CollectibleMarketplaceResaleParameters[v116] and v109.AvatarExperience.Catalog.CollectibleMarketplaceResaleParameters[v116].priceFloor or 0;
    return {
        screenSize = v109.ScreenSize, 
        averagePrice = v115, 
        sellFetchingState = l_PerformFetch_0.GetStatus(v109, v34.RemoveAvailableToSellAssetKey .. tostring(l_userAssetId_1)), 
        marketPlaceFeeFetchingState = l_PerformFetch_0.GetStatus(v109, v34.GetMarketplaceFeeKey), 
        marketplaceFee = v109.AvatarExperience.Catalog.MarketplaceFee, 
        collectibleItemId = v116, 
        priceFloor = v117
    };
end, function(v118) --[[ Line: 487 ]]
    -- upvalues: v24 (copy), v23 (copy)
    return {
        getMarketplaceFee = function(v119) --[[ Line: 489 ]] --[[ Name: getMarketplaceFee ]]
            -- upvalues: v118 (copy), v24 (ref)
            return v118(v24(v119));
        end, 
        sellAsset = function(v120, v121, v122, v123) --[[ Line: 492 ]] --[[ Name: sellAsset ]]
            -- upvalues: v118 (copy), v23 (ref)
            return v118(v23(v120, v121, v122, v123));
        end
    };
end)(v47);
return (v25((v28((l_RoactServices_0.connect({
    networking = v13, 
    localization = v14
})(v47))))));