local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_Parent_1.Roact);
local _ = require(l_Parent_1.React);
local v5 = require(l_Parent_1.UIBlox);
local l_Skeleton_0 = require(l_Parent_1.Foundation).Skeleton;
local l_useStyleMetadata_0 = v5.Core.Style.useStyleMetadata;
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_ImageSetButton_0 = v5.Core.ImageSet.ImageSetButton;
local l_useCursor_0 = v5.App.SelectionCursor.useCursor;
local l_Constants_0 = v5.App.Style.Constants;
local v14 = require(l_Parent_1.RoactGamepad);
local v15 = require(l_Parent_1.RoactFitComponents);
local l_FitFrameHorizontal_0 = v15.FitFrameHorizontal;
local l_FitTextLabel_0 = v15.FitTextLabel;
local v18 = require(l_Parent_0.Locale.MultiTextLocalizer);
local v19 = require(l_Parent_0.Utility.formatNumber);
local v20 = l_Images_0["icons/common/robux"];
local function v30(v21, v22, v23, v24, v25) --[[ Line: 59 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v3 (copy), l_Skeleton_0 (copy), l_Constants_0 (copy), v14 (copy), l_ImageSetButton_0 (copy), l_ImageSetLabel_0 (copy), l_FitFrameHorizontal_0 (copy), v20 (copy), l_FitTextLabel_0 (copy), v19 (copy), l_LocalizationService_0 (copy)
    if v21.robuxAmount == nil then
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v21.scale * 404, 0, v21.scale * 448)
        }, {
            ShimmerPanel = v3.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 1, 0)
            })
        });
    else
        local l_Theme_0 = v23.Theme;
        local l_Font_0 = v23.Font;
        local v28 = v21.scale * 64;
        local v29 = if v25 == l_Constants_0.ThemeName.Dark then Color3.fromRGB(25, 27, 29) else Color3.fromRGB(242, 244, 245);
        if v21.selected then
            v29 = if v25 == l_Constants_0.ThemeName.Dark then Color3.fromRGB(57, 59, 61) else Color3.fromRGB(255, 255, 255);
        end;
        return v3.createElement(v14.Focusable[l_ImageSetButton_0], {
            LayoutOrder = v21.layoutOrder, 
            BackgroundColor3 = l_Theme_0.UIEmphasis.Color, 
            BackgroundTransparency = l_Theme_0.UIEmphasis.Transparency, 
            Size = UDim2.new(0, v21.scale * 404, 0, v21.scale * 448), 
            Image = nil, 
            SelectionImageObject = v24, 
            [v3.Ref] = v21.forwardRef, 
            NextSelectionUp = nil, 
            NextSelectionDown = nil, 
            NextSelectionLeft = v21.nextSelectionLeft, 
            NextSelectionRight = v21.nextSelectionRight, 
            inputBindings = {
                Activated = if v21.onActivated ~= nil then v14.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 103 ]]
                    -- upvalues: v21 (copy)
                    v21.onActivated(v21.packageId);
                end) else nil
            }, 
            [v3.Event.Activated] = function() --[[ Line: 108 ]]
                -- upvalues: v21 (copy)
                v21.onActivated(v21.packageId);
            end, 
            [v3.Event.MouseMoved] = function() --[[ Line: 111 ]]
                -- upvalues: v21 (copy)
                v21.onHover(v21.forwardRef, true);
            end, 
            [v3.Event.MouseEnter] = function() --[[ Line: 114 ]]
                -- upvalues: v21 (copy)
                v21.onHover(v21.forwardRef, true);
            end, 
            [v3.Event.MouseLeave] = function() --[[ Line: 117 ]]
                -- upvalues: v21 (copy)
                v21.onHover(v21.forwardRef, false);
            end, 
            [v3.Event.SelectionGained] = function() --[[ Line: 120 ]]
                -- upvalues: v21 (copy)
                v21.onSelect(v21.forwardRef);
            end
        }, {
            Corner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            Outline = v3.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundColor3 = v29, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, -3, 1, -3)
            }, {
                Corner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 8)
                }), 
                MiddleContent = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0)
                }, {
                    Padding = v3.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, v21.scale * 24)
                    }), 
                    v3.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, v21.scale * 17.5)
                    }), 
                    RobuxImageFrame = v3.createElement("Frame", {
                        LayoutOrder = 1, 
                        Size = UDim2.fromOffset(v21.scale * 192, v21.scale * 192), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1
                    }, {
                        RobuxImage = v3.createElement(l_ImageSetLabel_0, {
                            Size = if v21.selected then UDim2.fromOffset(v21.scale * 192 * 1.6, v21.scale * 192 * 1.6) else UDim2.fromOffset(v21.scale * 192, v21.scale * 192), 
                            Position = if v21.selected then UDim2.new(0.5, 0, 0.3, 0) else UDim2.new(0.5, 0, 0.5, 0), 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            BackgroundTransparency = 1, 
                            Image = v21.robuxImage, 
                            ImageTransparency = 0
                        })
                    }), 
                    RobuxAmount = v3.createElement(l_FitFrameHorizontal_0, {
                        LayoutOrder = 2, 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        height = UDim.new(0, v28), 
                        contentPadding = UDim.new(0, 0), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        BackgroundTransparency = 1
                    }, {
                        Icon = v3.createElement(l_ImageSetLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(0, v28, 0, v28), 
                            Image = v20, 
                            ImageColor3 = l_Theme_0.TextEmphasis.Color, 
                            ImageTransparency = l_Theme_0.TextEmphasis.Transparency
                        }), 
                        RobuxAmountText = v3.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 2, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            Text = v19(l_LocalizationService_0.RobloxLocaleId, v21.robuxAmount), 
                            Font = l_Font_0.Title.Font, 
                            TextColor3 = l_Theme_0.TextEmphasis.Color, 
                            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                            TextSize = v28, 
                            BackgroundTransparency = 1
                        })
                    }), 
                    CurrencyAmmountText = v3.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 3, 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        Text = v21.currencyAmountStr, 
                        Font = l_Font_0.Header1.Font, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                        TextSize = v21.scale * 32, 
                        BackgroundTransparency = 1
                    }), 
                    MoreText = v21.robuxMoreAmount and v3.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 4, 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        Text = v22.moreRobux, 
                        Font = l_Font_0.Header2.Font, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                        TextSize = v21.scale * 32, 
                        BackgroundTransparency = 1
                    }, {
                        Gradient = v3.createElement("UIGradient", {
                            Rotation = 0, 
                            Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 251, 103)), 
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(243, 185, 34))
                            })
                        })
                    }) or nil
                })
            })
        });
    end;
end;
return function(v31) --[[ Line: 246 ]]
    -- upvalues: l_useCursor_0 (copy), l_useStyleMetadata_0 (copy), v3 (copy), v18 (copy), v19 (copy), l_LocalizationService_0 (copy), l_withStyle_0 (copy), v30 (copy)
    local v32 = l_useCursor_0(UDim.new(0, 8));
    local l_ThemeName_0 = l_useStyleMetadata_0().ThemeName;
    return v3.createElement(v18, {
        keys = {
            moreRobux = {
                key = "IAPExperience.BuyRobux.Text.MoreRobux2", 
                params = {
                    robux = v19(l_LocalizationService_0.RobloxLocaleId, v31.robuxMoreAmount or 0)
                }
            }
        }, 
        render = function(v34) --[[ Line: 261 ]] --[[ Name: render ]]
            -- upvalues: l_withStyle_0 (ref), v31 (copy), v30 (ref), v32 (copy), l_ThemeName_0 (copy)
            return l_withStyle_0(function(v35) --[[ Line: 262 ]]
                -- upvalues: v31 (ref), v30 (ref), v34 (copy), v32 (ref), l_ThemeName_0 (ref)
                if v31.scale == nil then
                    v31.scale = 0.65;
                end;
                return v30(v31, v34, v35, v32, l_ThemeName_0);
            end);
        end
    });
end;