local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v3.Focusable;
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_RoactFitComponents_0 = require(l_CorePackages_0.Packages.AvatarExperienceDeps).RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_withStyle_0 = v6.Style.withStyle;
local l_withSelectionCursorProvider_0 = v6.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v6.App.SelectionImage.CursorKind;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v6.App.ImageSet.Images;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local l_FFlagAXRemoveSellPageAndChildrenGamepadBindings_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRemoveSellPageAndChildrenGamepadBindings;
local v16 = l_Images_0["icons/common/robux"];
local v17 = l_Images_0["icons/actions/edit/remove"];
local v18 = v2.PureComponent:extend("CurrentlySellingRow");
v18.defaultProps = {
    horizontalPadding = 0, 
    onActivated = function() --[[ Line: 47 ]] --[[ Name: onActivated ]]

    end
};
v18.render = function(v19) --[[ Line: 50 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy), v2 (copy), l_Focusable_0 (copy), l_CursorKind_0 (copy), l_FFlagAXRemoveSellPageAndChildrenGamepadBindings_0 (copy), v3 (copy), l_FitFrameVertical_0 (copy), l_FitTextLabel_0 (copy), l_ImageSetLabel_0 (copy), v16 (copy), v17 (copy)
    local l_userAssetInfo_0 = v19.props.userAssetInfo;
    if not l_userAssetInfo_0 then
        return;
    else
        return l_withStyle_0(function(v21) --[[ Line: 55 ]]
            -- upvalues: v19 (copy), l_userAssetInfo_0 (copy), l_withSelectionCursorProvider_0 (ref), v2 (ref), l_Focusable_0 (ref), l_CursorKind_0 (ref), l_FFlagAXRemoveSellPageAndChildrenGamepadBindings_0 (ref), v3 (ref), l_FitFrameVertical_0 (ref), l_FitTextLabel_0 (ref), l_ImageSetLabel_0 (ref), v16 (ref), v17 (ref)
            local l_Font_0 = v21.Font;
            local l_Theme_0 = v21.Theme;
            local l_Position_0 = v19.props.Position;
            local l_LayoutOrder_0 = v19.props.LayoutOrder;
            local l_horizontalPadding_0 = v19.props.horizontalPadding;
            local l_onActivated_0 = v19.props.onActivated;
            local l_isLimitedUnique_0 = v19.props.isLimitedUnique;
            local v29 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
            local v30 = "# " .. tostring(l_userAssetInfo_0.serialNumber);
            local l_priceInRobux_0 = l_userAssetInfo_0.priceInRobux;
            local l_forwardRef_0 = v19.props.forwardRef;
            return l_withSelectionCursorProvider_0(function(v33) --[[ Line: 72 ]]
                -- upvalues: v2 (ref), l_Focusable_0 (ref), l_LayoutOrder_0 (copy), l_Position_0 (copy), v19 (ref), l_forwardRef_0 (copy), l_CursorKind_0 (ref), l_FFlagAXRemoveSellPageAndChildrenGamepadBindings_0 (ref), v3 (ref), l_onActivated_0 (copy), l_horizontalPadding_0 (copy), l_FitFrameVertical_0 (ref), l_isLimitedUnique_0 (copy), l_FitTextLabel_0 (ref), l_Font_0 (copy), v29 (copy), v30 (copy), l_Theme_0 (copy), l_ImageSetLabel_0 (ref), v16 (ref), l_priceInRobux_0 (copy), v17 (ref)
                return v2.createElement(l_Focusable_0.Frame, {
                    BackgroundTransparency = 1, 
                    LayoutOrder = l_LayoutOrder_0, 
                    Position = l_Position_0, 
                    Size = UDim2.new(1, 0, 0, 70), 
                    NextSelectionLeft = v19.props.NextSelectionLeft, 
                    NextSelectionRight = v19.props.NextSelectionRight, 
                    NextSelectionUp = v19.props.NextSelectionUp, 
                    NextSelectionDown = v19.props.NextSelectionDown, 
                    [v2.Ref] = l_forwardRef_0, 
                    onFocusGained = v19.props.onFocusGained, 
                    SelectionImageObject = v33(l_CursorKind_0.RoundedRectNoInset), 
                    inputBindings = if l_FFlagAXRemoveSellPageAndChildrenGamepadBindings_0 then nil else {
                        RemoveItemFromSale = v3.Input.onBegin(Enum.KeyCode.ButtonA, l_onActivated_0)
                    }
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, l_horizontalPadding_0), 
                        PaddingRight = UDim.new(0, l_horizontalPadding_0)
                    }), 
                    SerialAndPriceContainer = v2.createElement(l_FitFrameVertical_0, {
                        width = UDim.new(1, 0), 
                        contentPadding = UDim.new(0, 6), 
                        FillDirection = Enum.FillDirection.Vertical, 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    }, {
                        SerialNumberTextLabel = l_isLimitedUnique_0 and v2.createElement(l_FitTextLabel_0, {
                            width = UDim.new(1, 0), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Font = l_Font_0.Body.Font, 
                            LayoutOrder = 1, 
                            Position = UDim2.new(0, 0, 0, -v29), 
                            Size = UDim2.new(1, 0, 0, 0), 
                            Text = v30, 
                            TextColor3 = l_Theme_0.TextEmphasis.Color, 
                            TextSize = v29, 
                            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        }), 
                        RobuxContainer = v2.createElement(l_FitFrameVertical_0, {
                            width = UDim.new(1, -40), 
                            contentPadding = UDim.new(0, 6), 
                            FillDirection = Enum.FillDirection.Horizontal, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            LayoutOrder = 2
                        }, {
                            Image = v2.createElement(l_ImageSetLabel_0, {
                                LayoutOrder = 1, 
                                BackgroundTransparency = 1, 
                                Size = UDim2.new(0, v29, 0, v29), 
                                Image = v16, 
                                ImageColor3 = l_Theme_0.TextDefault.Color, 
                                ImageTransparency = l_Theme_0.TextDefault.Transparency
                            }), 
                            Text = v2.createElement(l_FitTextLabel_0, {
                                width = UDim.new(1, 0), 
                                LayoutOrder = 2, 
                                Size = UDim2.new(1, -v29, 0, v29), 
                                BackgroundTransparency = 1, 
                                Text = tostring(l_priceInRobux_0), 
                                Font = l_Font_0.Body.Font, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                                TextSize = v29, 
                                TextXAlignment = Enum.TextXAlignment.Left
                            })
                        })
                    }), 
                    PressableButton = v2.createElement("TextButton", {
                        AnchorPoint = Vector2.new(0, 0.5), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Position = UDim2.new(1, -50, 0.5, 0), 
                        Size = UDim2.new(0, 50, 0, 50), 
                        Text = "", 
                        [v2.Event.Activated] = l_onActivated_0
                    }, {
                        RemoveIcon = v2.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Image = v17, 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                            LayoutOrder = 2, 
                            Position = UDim2.new(0.5, 0, 0.5, 0), 
                            Size = UDim2.new(0, 40, 0, 40)
                        })
                    })
                });
            end);
        end);
    end;
end;
v18 = v5.connect(function(v34, v35) --[[ Line: 183 ]]
    return {
        userAssetInfo = v34.AvatarExperience.Catalog.UserAssets[v35.userAssetId]
    };
end)(v18);
return v2.forwardRef(function(v36, v37) --[[ Line: 190 ]]
    -- upvalues: v2 (copy), v18 (ref), v1 (copy)
    return v2.createElement(v18, v1.Dictionary.join(v36, {
        forwardRef = v37
    }));
end);