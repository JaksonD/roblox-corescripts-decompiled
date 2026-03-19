local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_GuiService_0 = game:GetService("GuiService");
local v5 = require(l_Parent_2.Roact);
local v6 = require(l_Parent_2.RoactGamepad);
local v7 = require(l_Parent_2.Cryo);
local v8 = require(l_Parent_2.UIBlox);
local l_withSelectionCursorProvider_0 = v8.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v8.App.SelectionImage.CursorKind;
local l_Images_0 = v8.App.ImageSet.Images;
local l_ImageSetButton_0 = v8.Core.ImageSet.ImageSetButton;
local l_ImageSetLabel_0 = v8.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v8.Core.Style.withStyle;
local l_useStyleMetadata_0 = v8.Core.Style.useStyleMetadata;
local l_Constants_0 = v8.App.Style.Constants;
local v17 = require(l_Parent_2.RoactFitComponents);
local l_FitFrameHorizontal_0 = v17.FitFrameHorizontal;
local l_FitTextLabel_0 = v17.FitTextLabel;
local v20 = require(l_Parent_1.Locale.MultiTextLocalizer);
local v21 = require(l_Parent_1.Utility.formatNumber);
local v22 = require(l_Parent_1.Generic.Animator);
local v23 = require(l_Parent_1.Flags.getEnableCompensatingScrollingFrame);
local v24 = require(l_Parent_1.Utility.getUserInputEventData);
local v25 = require(l_Parent_0.RobuxPackage);
local l_FFlagEnableLeftNavOnConsole_0 = require(l_Parent_2.SharedFlags).FFlagEnableLeftNavOnConsole;
local v27 = v5.Component:extend(script.Name);
local v28 = l_Images_0["icons/common/goldrobux"];
local v29 = l_Images_0["icons/logo/block"];
local v30 = {
    l_Images_0["icons/graphic/robuxcoin1_xxlarge"], 
    l_Images_0["icons/graphic/robuxcoin2_xxlarge"], 
    l_Images_0["icons/graphic/robuxcoin3_xxlarge"], 
    l_Images_0["icons/graphic/robuxcoin4_xxlarge"], 
    l_Images_0["icons/graphic/robuxcoin5_xxlarge"], 
    l_Images_0["icons/graphic/robuxcoin6_xxlarge"]
};
local v31 = l_Images_0["icons/navigation/close"];
v27.init = function(v32) --[[ Line: 80 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy), v5 (copy), l_GuiService_0 (copy)
    v32.state = {
        selectedPackage = nil, 
        showMessageBanner = false
    };
    v32.buttonRefs = v6.createRefCache();
    v32.scrollingFrameRef = v5.createRef();
    v32.getGamepadNextSelectionLeft = function(v33) --[[ Line: 89 ]]
        -- upvalues: v32 (copy)
        return v33 > 1 and v32.buttonRefs[v33 - 1] or nil;
    end;
    v32.getGamepadNextSelectionRight = function(v34) --[[ Line: 93 ]]
        -- upvalues: v32 (copy)
        return v34 < #v32.buttonRefs and v32.buttonRefs[v34 + 1] or nil;
    end;
    v32.initSelectionChangedListener = function() --[[ Line: 97 ]]
        -- upvalues: v32 (copy), l_GuiService_0 (ref)
        if v32.selectionListener ~= nil then
            v32.selectionListener:Disconnect();
            v32.selectionListener = nil;
        end;
        if v32.selectionListener ~= nil then
            v32.selectionListener:Disconnect();
            v32.selectionListener = nil;
        end;
        v32.selectionListener = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 108 ]]
            -- upvalues: v32 (ref), l_GuiService_0 (ref)
            if v32.state.selectedPackage == nil or l_GuiService_0.SelectedCoreObject == nil or v32.state.selectedPackage ~= l_GuiService_0.SelectedCoreObject then
                v32:setState({
                    selectedPackage = l_GuiService_0.SelectedCoreObject
                });
            end;
        end);
    end;
end;
v27.didMount = function(v35) --[[ Line: 120 ]] --[[ Name: didMount ]]
    v35.initSelectionChangedListener();
end;
v27.didUpdate = function(v36, v37, _) --[[ Line: 124 ]] --[[ Name: didUpdate ]]
    local l_props_0 = v36.props;
    if v37.hasNativePurchaseSucceeded ~= l_props_0.hasNativePurchaseSucceeded and l_props_0.hasNativePurchaseSucceeded then
        v36:setState({
            showMessageBanner = true
        });
        task.delay(3, function() --[[ Line: 130 ]]
            -- upvalues: v36 (copy)
            v36:setState({
                showMessageBanner = false
            });
        end);
    end;
end;
v27.willUnmount = function(v40) --[[ Line: 137 ]] --[[ Name: willUnmount ]]
    if v40.selectionListener ~= nil then
        v40.selectionListener:Disconnect();
        v40.selectionListener = nil;
    end;
end;
v27.getScale = function(v41) --[[ Line: 145 ]] --[[ Name: getScale ]]
    if v41.props.isConsoleSize then
        return 1;
    else
        return 0.65;
    end;
end;
v27.render = function(v42) --[[ Line: 155 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v20 (copy), l_withSelectionCursorProvider_0 (copy)
    return v5.createElement(v20, {
        keys = {
            BannerText = {
                key = "IAPExperience.BuyRobux.Banner.Text"
            }, 
            BannerTitle = {
                key = "IAPExperience.BuyRobux.Banner.Title"
            }, 
            SuccessfulMessage = {
                key = "IAPExperience.BuyRobux.Alert.SuccessfulMessage"
            }
        }, 
        render = function(v43) --[[ Line: 168 ]] --[[ Name: render ]]
            -- upvalues: l_withSelectionCursorProvider_0 (ref), v42 (copy)
            return l_withSelectionCursorProvider_0(function(v44) --[[ Line: 169 ]]
                -- upvalues: v42 (ref), v43 (copy)
                return v42:renderWithLocale(v43, v44);
            end);
        end
    });
end;
v27.movePackageToAttentionArea = function(v45, v46) --[[ Line: 177 ]] --[[ Name: movePackageToAttentionArea ]]
    -- upvalues: v23 (copy)
    if not v23() then
        return;
    else
        local l_current_0 = v45.scrollingFrameRef.current;
        if l_current_0 == nil or v46 == nil then
            return;
        else
            local l_X_0 = l_current_0.AbsoluteSize.X;
            local v49 = 48 * v45:getScale();
            local v50 = v46.AbsolutePosition.X - v49;
            if v50 < 0 then
                l_current_0.CanvasPosition = Vector2.new(v50, 0);
                v45:reportScrollingFrameCompensationHappened();
                return;
            elseif l_X_0 < v46.AbsolutePosition.X + v46.AbsoluteSize.X + v49 then
                l_current_0.CanvasPosition = Vector2.new(v50, 0);
                v45:reportScrollingFrameCompensationHappened();
                return;
            else
                return;
            end;
        end;
    end;
end;
v27.reportScrollingFrameCompensationHappened = function(v51) --[[ Line: 206 ]] --[[ Name: reportScrollingFrameCompensationHappened ]]
    -- upvalues: v24 (copy)
    local l_props_1 = v51.props;
    if not l_props_1.onAnalyticEvent then
        return;
    else
        local v53 = v24(l_props_1.analyticId, "", "BuyRobux", "ScrollingFrame", "Compensated");
        l_props_1.onAnalyticEvent("UserPurchaseFlow", v53);
        return;
    end;
end;
v27.renderWithLocale = function(v54, v55, v56) --[[ Line: 217 ]] --[[ Name: renderWithLocale ]]
    -- upvalues: l_withStyle_0 (copy), v5 (copy), v25 (copy), v30 (copy), v6 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_Constants_0 (copy), l_ImageSetButton_0 (copy), v31 (copy), l_CursorKind_0 (copy), v22 (copy), l_ImageSetLabel_0 (copy), v29 (copy), l_FitTextLabel_0 (copy), l_FitFrameHorizontal_0 (copy), v28 (copy), v21 (copy), l_LocalizationService_0 (copy)
    local l_props_2 = v54.props;
    return l_withStyle_0(function(v58) --[[ Line: 220 ]]
        -- upvalues: l_props_2 (copy), v54 (copy), v5 (ref), v25 (ref), v30 (ref), v6 (ref), l_FFlagEnableLeftNavOnConsole_0 (ref), l_Constants_0 (ref), l_ImageSetButton_0 (ref), v31 (ref), v56 (copy), l_CursorKind_0 (ref), v22 (ref), l_ImageSetLabel_0 (ref), v29 (ref), l_FitTextLabel_0 (ref), v55 (copy), l_FitFrameHorizontal_0 (ref), v28 (ref), v21 (ref), l_LocalizationService_0 (ref)
        local l_Theme_0 = v58.Theme;
        local l_Font_0 = v58.Font;
        local v61 = l_props_2.robuxPackages ~= nil;
        local v62 = if l_props_2.robuxPackages ~= nil then #l_props_2.robuxPackages else 6;
        local v63 = 32 * v54:getScale();
        local v64 = {
            LeadingPadding = v5.createElement("Frame", {
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                LayoutOrder = 0, 
                Size = UDim2.new(0, 80 * v54:getScale(), 0, 1)
            }), 
            RobuxPackageChildren = v5.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 16 * v54:getScale())
            }), 
            TrailingPadding = v5.createElement("Frame", {
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                LayoutOrder = v62 + 1, 
                Size = UDim2.new(0, 80 * v54:getScale(), 0, 1)
            })
        };
        for v65 = 1, v62 do
            local v66 = v65 + 1;
            local l_createElement_0 = v5.createElement;
            local l_v25_0 = v25;
            local v69 = {
                layoutOrder = v65, 
                scale = v54:getScale()
            };
            local v70 = false;
            if v54.state.selectedPackage ~= nil then
                v70 = v54.state.selectedPackage == v54.buttonRefs[v65]:getValue();
            end;
            v69.selected = v70;
            v69.packageId = if v61 then l_props_2.robuxPackages[v65].packageId else tostring(v65);
            v69.robuxAmount = if v61 then l_props_2.robuxPackages[v65].robuxAmount else nil;
            v69.currencyAmountStr = if v61 then l_props_2.robuxPackages[v65].currencyAmountStr else nil;
            v69.robuxMoreAmount = if v61 then l_props_2.robuxPackages[v65].robuxMoreAmount else nil;
            v69.robuxImage = v30[v65];
            v69.forwardRef = v54.buttonRefs[v65];
            v69.nextSelectionLeft = v54.getGamepadNextSelectionLeft(v65);
            v69.nextSelectionRight = v54.getGamepadNextSelectionRight(v65);
            v69.onActivated = function(v71) --[[ Line: 270 ]] --[[ Name: onActivated ]]
                -- upvalues: l_props_2 (ref)
                l_props_2.robuxPackageActivated(v71);
            end;
            v69.onSelect = function(v72) --[[ Line: 273 ]] --[[ Name: onSelect ]]
                -- upvalues: v54 (ref)
                v54:movePackageToAttentionArea(v72:getValue());
            end;
            v69.onHover = function(v73, v74) --[[ Line: 276 ]] --[[ Name: onHover ]]
                -- upvalues: v54 (ref)
                if v74 then
                    if v54.state.selectedPackage ~= v73:getValue() then
                        v54:setState({
                            selectedPackage = v73:getValue()
                        });
                        return;
                    end;
                else
                    v54:setState({
                        selectedPackage = ""
                    });
                end;
            end;
            v64[v66] = l_createElement_0(l_v25_0, v69);
        end;
        return v5.createElement(v6.Focusable.Frame, {
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_FFlagEnableLeftNavOnConsole_0 and 0 or 0.8, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            BuyRobuxPageBackground = v5.createElement("Frame", {
                BackgroundTransparency = 0, 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                Visible = v54.props.showBackground, 
                ZIndex = 0
            }, {
                BackgroundImage = v5.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    ImageTransparency = 0, 
                    Image = l_props_2.themeName == l_Constants_0.ThemeName.Dark and "rbxasset://textures/AvatarEditorImages/AvatarEditor.png" or "rbxasset://textures/AvatarEditorImages/AvatarEditor_LightTheme.png", 
                    Size = UDim2.new(1, 0, 1, 0)
                }), 
                Backdrop = v5.createElement("Frame", {
                    BackgroundTransparency = l_props_2.themeName == l_Constants_0.ThemeName.Dark and 0.5 or 0.7, 
                    BackgroundColor3 = Color3.new(0, 0, 0), 
                    Size = UDim2.new(1, 0, 1, 0)
                })
            }), 
            CloseButton = v5.createElement(l_ImageSetButton_0, {
                Position = UDim2.new(0, 48 * v54:getScale(), 0, 48 * v54:getScale()), 
                AnchorPoint = Vector2.new(0, 0), 
                Size = UDim2.new(0, 36, 0, 36), 
                Image = v31, 
                BackgroundColor3 = Color3.new(0, 0, 0), 
                BackgroundTransparency = 0.7, 
                BorderSizePixel = 0, 
                SelectionImageObject = v56(l_CursorKind_0.RoundedRect), 
                Visible = v54.props.showCloseButton, 
                [v5.Event.Activated] = l_props_2.onPageClose
            }, {
                UICorner = v5.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 16 * v54:getScale())
                })
            }), 
            MessageBannerAnimator = v5.createElement(v22, {
                shouldAnimate = l_props_2.shouldAnimate, 
                shouldShow = v54.state.showMessageBanner, 
                animateDown = true, 
                ZIndex = 10, 
                renderChildren = function() --[[ Line: 340 ]] --[[ Name: renderChildren ]]
                    -- upvalues: v5 (ref), l_props_2 (ref), l_Constants_0 (ref), v54 (ref), v63 (copy), l_ImageSetLabel_0 (ref), v29 (ref), l_Theme_0 (copy), l_FitTextLabel_0 (ref), v55 (ref), l_Font_0 (copy)
                    return v5.createElement("Frame", {
                        AnchorPoint = Vector2.new(0, 0), 
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = if l_props_2.themeName == l_Constants_0.ThemeName.Dark then Color3.fromRGB(17, 18, 20) else Color3.fromRGB(198, 203, 206), 
                        Position = UDim2.fromOffset(48 * v54:getScale(), 40 * v54:getScale()), 
                        Size = UDim2.new(1, -96 * v54:getScale(), 0, v63 * 2)
                    }, {
                        UICorner = v5.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 16 * v54:getScale())
                        }), 
                        Icon = v5.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0, 0.5), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 1, 
                            Image = v29, 
                            ImageColor3 = l_Theme_0.TextEmphasis.Color, 
                            ImageTransparency = 0, 
                            Position = UDim2.fromOffset(24 * v54:getScale(), v63), 
                            Size = UDim2.fromOffset(36 * v54:getScale(), 36 * v54:getScale())
                        }), 
                        AlertMessage = v5.createElement(l_FitTextLabel_0, {
                            AnchorPoint = Vector2.new(0, 0.5), 
                            Position = UDim2.fromOffset(80 * v54:getScale(), v63), 
                            LayoutOrder = 2, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            Text = v55.SuccessfulMessage, 
                            Font = l_Font_0.Header1.Font, 
                            TextColor3 = l_Theme_0.TextEmphasis.Color, 
                            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                            TextSize = v63, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            BackgroundTransparency = 1
                        })
                    });
                end
            }), 
            RobuxBalanceFrame = v5.createElement(l_FitFrameHorizontal_0, {
                Position = UDim2.new(1, -96 * v54:getScale(), 0, 48 * v54:getScale()), 
                AnchorPoint = Vector2.new(1, 0), 
                height = UDim.new(0, v63), 
                contentPadding = UDim.new(0, 4), 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                BackgroundTransparency = 1
            }, {
                Icon = v5.createElement(l_ImageSetLabel_0, {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromOffset(v63 + 15 * v54:getScale(), v63 + 15 * v54:getScale()), 
                    Image = v28, 
                    ImageTransparency = 0
                }), 
                BalanceText = v5.createElement(l_FitTextLabel_0, {
                    LayoutOrder = 2, 
                    width = l_FitTextLabel_0.Width.FitToText, 
                    Text = if l_props_2.robuxBalance then v21(l_LocalizationService_0.RobloxLocaleId, l_props_2.robuxBalance) else "", 
                    Font = l_Font_0.Header1.Font, 
                    TextColor3 = if l_props_2.showBackground then Color3.new(255, 255, 255) else l_Theme_0.TextEmphasis.Color, 
                    TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                    TextSize = v63, 
                    BackgroundTransparency = 1
                })
            }), 
            BannerFrame = v5.createElement("Frame", {
                Position = UDim2.new(0, 96 * v54:getScale(), 0, 146 * v54:getScale()), 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                v5.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 36 * v54:getScale())
                }); 
                BannerTitle = v5.createElement("TextLabel", {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Font = l_Font_0.Title.Font, 
                    Text = v55.BannerTitle, 
                    TextSize = 46 * v54:getScale(), 
                    TextColor3 = if l_props_2.showBackground then Color3.new(255, 255, 255) else l_Theme_0.TextEmphasis.Color
                }), 
                BannerText = v5.createElement("TextLabel", {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Font = l_Font_0.Header1.Font, 
                    Text = v55.BannerText, 
                    TextSize = 38 * v54:getScale(), 
                    TextColor3 = if l_props_2.showBackground then Color3.new(255, 255, 255) else l_Theme_0.TextEmphasis.Color
                })
            }), 
            RobuxPackageTilesFrame = v5.createElement("ScrollingFrame", {
                Position = UDim2.new(0, 0, 0, 310 * v54:getScale()), 
                Size = UDim2.new(1, 0, 0, 615 * v54:getScale()), 
                AutomaticSize = Enum.AutomaticSize.None, 
                CanvasSize = UDim2.new(0, 0, 0, 0), 
                AutomaticCanvasSize = Enum.AutomaticSize.X, 
                ScrollingEnabled = v61, 
                ScrollingDirection = Enum.ScrollingDirection.X, 
                ScrollBarImageTransparency = 1, 
                ScrollBarThickness = 0, 
                Selectable = false, 
                BackgroundTransparency = 1, 
                [v5.Ref] = v54.scrollingFrameRef
            }, v64)
        });
    end);
end;
return function(v75) --[[ Line: 487 ]]
    -- upvalues: l_useStyleMetadata_0 (copy), v5 (copy), v27 (copy), v7 (copy)
    local l_ThemeName_0 = l_useStyleMetadata_0().ThemeName;
    return v5.createElement(v27, v7.Dictionary.join(v75, {
        themeName = l_ThemeName_0
    }));
end;