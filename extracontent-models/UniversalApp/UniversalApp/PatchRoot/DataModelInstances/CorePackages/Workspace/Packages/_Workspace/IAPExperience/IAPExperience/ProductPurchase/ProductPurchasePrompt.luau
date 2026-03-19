local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_1.RoactFitComponents);
local l_FitFrameVertical_0 = v4.FitFrameVertical;
local l_FitTextLabel_0 = v4.FitTextLabel;
local v7 = require(l_Parent_1.UIBlox);
local l_InteractiveAlert_0 = v7.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v7.App.Button.Enum.ButtonType;
local l_Images_0 = v7.App.ImageSet.Images;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v7.Core.Style.withStyle;
local l_useDefaultFocusBehavior_0 = require(l_Parent_1.ReactFocusNavigation).useDefaultFocusBehavior;
local v14 = require(l_Parent_1.Cryo);
local v15 = require(script.Parent.Parent.Generic.ModelViewport);
local v16 = require(l_Parent_0.Locale.MultiTextLocalizer);
local v17 = require(l_Parent_0.Utility.Experiments.shouldShowNewUpsellModalExperiment);
local v18 = require(l_Parent_0.Utility.Experiments.DesktopUpsellExperiment);
local v19 = require(script.Parent.v2.ProductPurchaseModal);
local v20 = l_Images_0["icons/common/robux"];
local v21 = utf8.char(57346);
local l_default_0 = require(l_Parent_1.LoggingProtocol).default;
local l_PurchaseModalV1ShownCounter_0 = require(l_Parent_0.Generic.Events.PurchaseModalCounter).PurchaseModalV1ShownCounter;
local v24 = require(l_Parent_0.Utility.logger);
local v25 = require(l_Parent_0.Utility.getAppContext);
local v26 = require(l_Parent_0.Flags.FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePrompt);
local v27 = v2.Component:extend(script.Name);
v27.validateProps = v3.strictInterface({
    anchorPoint = v3.optional(v3.Vector2), 
    position = v3.optional(v3.UDim2), 
    screenSize = v3.Vector2, 
    isLoading = v3.optional(v3.boolean), 
    isDisabled = v3.optional(v3.boolean), 
    isDelayedInput = v3.optional(v3.boolean), 
    enableInputDelayed = v3.optional(v3.boolean), 
    itemIcon = v3.union(v3.string, v3.table), 
    model = v3.optional(v3.table), 
    itemName = v3.string, 
    itemRobuxCost = v3.number, 
    currentBalance = v3.number, 
    currentBalanceValid = v3.optional(v3.boolean), 
    isGamePass = v3.optional(v3.boolean), 
    testPurchase = v3.optional(v3.boolean), 
    buyItemControllerIcon = v3.optional(v3.table), 
    cancelControllerIcon = v3.optional(v3.table), 
    buyItemActivated = v3.callback, 
    cancelPurchaseActivated = v3.callback, 
    isLuobu = v3.optional(v3.boolean), 
    defaultFocusRef = if v26 then v3.callback else nil, 
    containerRef = if v26 then v3.callback else nil
});
v27.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    position = UDim2.new(0.5, 0, 0.5, 0), 
    isLoading = false, 
    isDisabled = false, 
    testPurchase = false, 
    isDelayedInput = false, 
    enableInputDelayed = false, 
    isLuobu = false, 
    isGamePass = false, 
    currentBalanceValid = true
};
v27.init = function(v28) --[[ Line: 99 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v28.contentRef = v2.createRef();
    v28.footerRef = v2.createRef();
    v28.state = {
        contentSize = Vector2.new(0, 0), 
        footerSize = Vector2.new(0, 0)
    };
    v28.changeContentSize = function(v29) --[[ Line: 107 ]]
        -- upvalues: v28 (copy)
        if v28.state.contentSize ~= v29.AbsoluteSize then
            v28:setState({
                contentSize = v29.AbsoluteSize
            });
        end;
    end;
    v28.changeFooterSize = function(v30) --[[ Line: 115 ]]
        -- upvalues: v28 (copy)
        if v28.state.footerSize ~= v30.AbsoluteSize then
            v28:setState({
                footerSize = v30.AbsoluteSize
            });
        end;
    end;
end;
v27.render = function(v31) --[[ Line: 124 ]] --[[ Name: render ]]
    -- upvalues: v17 (copy), v18 (copy), v2 (copy), v19 (copy), v16 (copy)
    local v32 = v31.props.isLuobu and "IAPExperience.PurchasePrompt.Text.BuyItemQuestionIncludingWarning" or "IAPExperience.PurchasePrompt.Text.BuyItemQuestion";
    local l_isGamePass_0 = v31.props.isGamePass;
    if v17() or v18.shouldShowNewModal() then
        return v2.createElement(v19, {
            product = {
                itemIcon = v31.props.itemIcon, 
                itemName = v31.props.itemName, 
                itemRobuxCost = v31.props.itemRobuxCost
            }, 
            balanceAmount = v31.props.currentBalance, 
            balanceAmountValid = v31.props.currentBalanceValid, 
            buttons = {
                buyItemActivated = v31.props.buyItemActivated, 
                buyItemControllerIcon = v31.props.buyItemControllerIcon, 
                buyItemIsDelayedInput = v31.props.isDelayedInput, 
                buyItemEnableInputDelayed = v31.props.enableInputDelayed, 
                cancelActivated = v31.props.cancelPurchaseActivated, 
                isDisabled = v31.props.isDisabled
            }, 
            screenSize = v31.props.screenSize
        });
    else
        return v2.createElement(v16, {
            keys = {
                BuyItemTitle = {
                    key = l_isGamePass_0 and "IAPExperience.PurchasePrompt.Title.BuyGamepass" or "IAPExperience.PurchasePrompt.Title.BuyItem"
                }, 
                BuyItemQuestion = {
                    key = v32, 
                    params = {
                        name = v31.props.itemName
                    }
                }, 
                RemainingBalance = {
                    key = "IAPExperience.PurchasePrompt.Text.RemainingBalance"
                }, 
                TestPurchaseText = {
                    key = "IAPExperience.PurchasePrompt.Text.TestPurchase"
                }, 
                ButtonCancel = {
                    key = "IAPExperience.PurchasePrompt.Action.Cancel"
                }, 
                LoadingText = {
                    key = "IAPExperience.PurchasePrompt.Text.Loading"
                }
            }, 
            render = function(v34) --[[ Line: 177 ]] --[[ Name: render ]]
                -- upvalues: v31 (copy)
                return v31:renderAlert(v34);
            end
        });
    end;
end;
v27.renderAlert = function(v35, v36) --[[ Line: 183 ]] --[[ Name: renderAlert ]]
    -- upvalues: v24 (copy), v25 (copy), l_default_0 (copy), l_PurchaseModalV1ShownCounter_0 (copy), l_withStyle_0 (copy), v21 (copy), v2 (copy), v15 (copy), l_ImageSetLabel_0 (copy), l_InteractiveAlert_0 (copy), v26 (copy), l_FitFrameVertical_0 (copy), l_FitTextLabel_0 (copy), l_ButtonType_0 (copy), v20 (copy)
    local l_props_0 = v35.props;
    v24.debug({
        message = "Purchase Modal V1 Shown", 
        screenHeight = l_props_0.screenSize.Y, 
        screenWidth = l_props_0.screenSize.X, 
        portrait = l_props_0.screenSize.X < l_props_0.screenSize.Y, 
        appContext = v25()
    });
    l_default_0:logRobloxTelemetryCounter(l_PurchaseModalV1ShownCounter_0, 1, {
        screenHeight = l_props_0.screenSize.Y, 
        screenWidth = l_props_0.screenSize.X, 
        portrait = l_props_0.screenSize.X < l_props_0.screenSize.Y, 
        appContext = v25()
    });
    return l_withStyle_0(function(v38) --[[ Line: 200 ]]
        -- upvalues: v35 (copy), v36 (copy), v21 (ref), v2 (ref), v15 (ref), l_ImageSetLabel_0 (ref), l_InteractiveAlert_0 (ref), v26 (ref), l_FitFrameVertical_0 (ref), l_FitTextLabel_0 (ref), l_ButtonType_0 (ref), v20 (ref)
        local l_Theme_0 = v38.Theme;
        local l_Font_0 = v38.Font;
        local l_Color_0 = l_Theme_0.IconEmphasis.Color;
        local v42 = math.round(l_Color_0.R * 255);
        local v43 = math.round(l_Color_0.G * 255);
        local v44 = math.round(l_Color_0.B * 255);
        local v45 = string.format("rgb(%d,%d,%d)", v42, v43, v44);
        local v46 = v35.state.contentSize.X * 0.85;
        local v47 = string.format("%s <font color=\"%s\">%s</font>%d", v36.RemainingBalance, v45, v21, v35.props.currentBalance - v35.props.itemRobuxCost);
        local v48 = if v35.props.model then v2.createElement(v15, {
            model = v35.props.model, 
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(85, 85), 
            Position = UDim2.fromOffset(5, 5)
        }) else v2.createElement(l_ImageSetLabel_0, {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 5, 0, 5), 
            Size = UDim2.new(0, 85, 0, 85), 
            ScaleType = Enum.ScaleType.Stretch, 
            Image = v35.props.itemIcon, 
            ImageTransparency = 0
        });
        return v2.createElement(l_InteractiveAlert_0, {
            defaultChildRef = if v26 then v35.props.containerRef else nil, 
            screenSize = v35.props.screenSize, 
            position = v35.props.position, 
            anchorPoint = v35.props.anchorPoint, 
            title = v36.BuyItemTitle, 
            middleContent = function() --[[ Line: 244 ]] --[[ Name: middleContent ]]
                -- upvalues: v2 (ref), l_FitFrameVertical_0 (ref), v35 (ref), v48 (copy), l_FitTextLabel_0 (ref), l_Font_0 (copy), v36 (ref), l_Theme_0 (copy)
                return v2.createElement(l_FitFrameVertical_0, {
                    BackgroundTransparency = 1, 
                    width = UDim.new(1, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    contentPadding = UDim.new(0, 24), 
                    [v2.Ref] = v35.contentRef, 
                    [v2.Change.AbsoluteSize] = v35.changeContentSize
                }, {
                    ItemIcon = v48, 
                    ItemName = v2.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1, 
                        TextWrapped = true, 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        maximumWidth = v35.state.contentSize.X, 
                        Font = l_Font_0.Footer.Font, 
                        Text = v36.BuyItemQuestion, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color
                    })
                });
            end, 
            buttonStackInfo = {
                disableGamepadRefs = v26 and true or nil, 
                buttons = {
                    {
                        props = {
                            isDisabled = v35.props.isDisabled or v35.props.isLoading, 
                            onActivated = v35.props.cancelPurchaseActivated, 
                            text = v36.ButtonCancel, 
                            inputIcon = v35.props.cancelControllerIcon
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isLoading = v35.props.isLoading, 
                            isDisabled = v35.props.isDisabled, 
                            isDelayedInput = v35.props.isDelayedInput, 
                            enableInputDelayed = v35.props.enableInputDelayed, 
                            delayInputSeconds = 3, 
                            onActivated = v35.props.buyItemActivated, 
                            icon = v20, 
                            text = tostring(v35.props.itemRobuxCost), 
                            inputIcon = v35.props.buyItemControllerIcon, 
                            buttonRef = if v26 then v35.props.defaultFocusRef else nil
                        }
                    }
                }
            }, 
            footerContent = function() --[[ Line: 302 ]] --[[ Name: footerContent ]]
                -- upvalues: v35 (ref), v2 (ref), l_FitFrameVertical_0 (ref), v46 (copy), l_Font_0 (copy), v47 (copy), l_Theme_0 (copy), l_FitTextLabel_0 (ref), v36 (ref)
                if not v35.props.currentBalanceValid then
                    return v2.None;
                elseif not v35.props.testPurchase then
                    return v2.createElement(l_FitFrameVertical_0, {
                        BackgroundTransparency = 1, 
                        width = UDim.new(1, 0), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        contentPadding = UDim.new(0, 2), 
                        [v2.Ref] = v35.footerRef, 
                        [v2.Change.AbsoluteSize] = v35.changeFooterSize
                    }, {
                        RemainingBalanceText = v2.createElement("TextLabel", {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            RichText = true, 
                            Position = UDim2.fromScale(0, 0.5), 
                            Size = UDim2.fromOffset(v46, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            TextWrapped = true, 
                            Font = l_Font_0.Footer.Font, 
                            Text = v47, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                            TextColor3 = l_Theme_0.TextDefault.Color
                        })
                    });
                else
                    return v2.createElement(l_FitFrameVertical_0, {
                        BackgroundTransparency = 1, 
                        width = UDim.new(1, 0), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        contentPadding = UDim.new(0, 2), 
                        [v2.Ref] = v35.footerRef, 
                        [v2.Change.AbsoluteSize] = v35.changeFooterSize
                    }, {
                        TestPurchaseTest = v2.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            Font = l_Font_0.Footer.Font, 
                            Text = v36.TestPurchaseText, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                            TextColor3 = l_Theme_0.TextDefault.Color
                        })
                    });
                end;
            end
        });
    end);
end;
if v26 then
    local l_v27_0 = v27;
    v27 = function(v50) --[[ Line: 363 ]]
        -- upvalues: l_useDefaultFocusBehavior_0 (copy), v2 (copy), l_v27_0 (copy), v14 (copy)
        local v51, v52 = l_useDefaultFocusBehavior_0();
        return v2.createElement(l_v27_0, v14.Dictionary.join(v50, {
            defaultFocusRef = v51, 
            containerRef = v52
        }));
    end;
end;
return v27;