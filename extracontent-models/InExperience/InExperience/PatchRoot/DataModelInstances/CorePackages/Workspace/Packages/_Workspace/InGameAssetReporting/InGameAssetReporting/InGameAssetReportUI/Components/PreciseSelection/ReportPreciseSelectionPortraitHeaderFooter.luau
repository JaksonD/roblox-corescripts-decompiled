local l_Parent_0 = script:FindFirstAncestor("InGameAssetReporting").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.Foundation);
local l_Button_0 = v3.Button;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_InputSize_0 = v3.Enums.InputSize;
local l_HeaderBar_0 = v2.App.Bar.HeaderBar;
local l_IconButton_0 = v2.App.Button.IconButton;
local l_IconSize_0 = v2.App.ImageSet.Enum.IconSize;
local l_Images_0 = v2.App.ImageSet.Images;
local l_withStyle_0 = v2.Style.withStyle;
local function _(v12) --[[ Line: 36 ]] --[[ Name: renderHeaderBarLeft ]]
    -- upvalues: v1 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy)
    return function() --[[ Line: 37 ]]
        -- upvalues: v1 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v12 (copy)
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 30, 1, 0)
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            BackButton = v1.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/navigation/pushBack"], 
                layoutOrder = 1, 
                onActivated = v12
            })
        });
    end;
end;
local function _(v14) --[[ Line: 58 ]] --[[ Name: renderHeaderBarCenter ]]
    -- upvalues: l_withStyle_0 (copy), v1 (copy)
    return function() --[[ Line: 59 ]]
        -- upvalues: l_withStyle_0 (ref), v1 (ref), v14 (copy)
        return l_withStyle_0(function(v15) --[[ Line: 60 ]]
            -- upvalues: v1 (ref), v14 (ref)
            local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
            local v17 = 300;
            if l_CurrentCamera_0 ~= nil then
                v17 = l_CurrentCamera_0.ViewportSize.X - 150;
            end;
            local l_Theme_0 = v15.Theme;
            local l_Font_0 = v15.Font;
            return v1.createElement("TextLabel", {
                Text = v14, 
                Font = l_Font_0.Header2.Font, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextSize = 20, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Size = UDim2.new(0, v17, 1, 0), 
                BackgroundTransparency = 1
            });
        end);
    end;
end;
local function _() --[[ Line: 87 ]] --[[ Name: renderHeaderBarRight ]]
    -- upvalues: v1 (copy)
    return function() --[[ Line: 88 ]]
        -- upvalues: v1 (ref)
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 60, 1, 0)
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        });
    end;
end;
return {
    PortraitModeHeader = function(v22) --[[ Line: 103 ]] --[[ Name: PortraitModeHeader ]]
        -- upvalues: v1 (copy), l_HeaderBar_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), l_withStyle_0 (copy)
        local l_createElement_0 = v1.createElement;
        local v24 = "Frame";
        local v25 = {
            BorderSizePixel = 0, 
            BackgroundTransparency = 0.1, 
            BackgroundColor3 = Color3.fromHex("#000000"), 
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 72), 
            ZIndex = 2
        };
        local v26 = {};
        local l_createElement_1 = v1.createElement;
        local l_l_HeaderBar_0_0 = l_HeaderBar_0;
        local v29 = {
            backgroundTransparency = 1, 
            barHeight = 72, 
            margin = 12
        };
        local l_backAction_0 = v22.backAction;
        local l_l_backAction_0_0 = l_backAction_0 --[[ copy: 9 -> 10 ]];
        v29.renderLeft = function() --[[ Line: 37 ]]
            -- upvalues: v1 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), l_l_backAction_0_0 (copy)
            return v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 30, 1, 0)
            }, {
                Layout = v1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                BackButton = v1.createElement(l_IconButton_0, {
                    iconSize = l_IconSize_0.Medium, 
                    icon = l_Images_0["icons/navigation/pushBack"], 
                    layoutOrder = 1, 
                    onActivated = l_l_backAction_0_0
                })
            });
        end;
        v29.renderRight = function() --[[ Line: 88 ]]
            -- upvalues: v1 (ref)
            return v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 60, 1, 0)
            }, {
                Layout = v1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                })
            });
        end;
        l_backAction_0 = v22.titleText;
        v29.renderCenter = function() --[[ Line: 59 ]]
            -- upvalues: l_withStyle_0 (ref), v1 (ref), l_backAction_0 (copy)
            return l_withStyle_0(function(v32) --[[ Line: 60 ]]
                -- upvalues: v1 (ref), l_backAction_0 (ref)
                local l_CurrentCamera_1 = game.Workspace.CurrentCamera;
                local v34 = 300;
                if l_CurrentCamera_1 ~= nil then
                    v34 = l_CurrentCamera_1.ViewportSize.X - 150;
                end;
                local l_Theme_1 = v32.Theme;
                local l_Font_1 = v32.Font;
                return v1.createElement("TextLabel", {
                    Text = l_backAction_0, 
                    Font = l_Font_1.Header2.Font, 
                    TextColor3 = l_Theme_1.TextEmphasis.Color, 
                    TextTransparency = l_Theme_1.TextEmphasis.Transparency, 
                    TextSize = 20, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Size = UDim2.new(0, v34, 1, 0), 
                    BackgroundTransparency = 1
                });
            end);
        end;
        v29.isSecondary = true;
        v26.Bar = l_createElement_1(l_l_HeaderBar_0_0, v29);
        return l_createElement_0(v24, v25, v26);
    end, 
    PortraitModeFooter = function(v37) --[[ Line: 124 ]] --[[ Name: PortraitModeFooter ]]
        -- upvalues: v1 (copy), v3 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
        return v1.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 0.1, 
            Size = UDim2.new(1, 0, 0, 60), 
            BackgroundColor3 = Color3.fromHex("#000000"), 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.fromScale(0, 1), 
            LayoutOrder = 4
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            CoachmarkWrapper = v1.createElement(v3.Coachmark, {
                title = v37.coachmarkTitle, 
                text = v37.coachmarkText, 
                isOpen = v37.isCoachmarkOpen or false, 
                side = v3.Enums.PopoverSide.Top, 
                align = v3.Enums.PopoverAlign.Center, 
                onClose = v37.onCoachmarkClose
            }, {
                NextButton = v1.createElement(l_Button_0, {
                    variant = l_ButtonVariant_0.Emphasis, 
                    inputSize = l_InputSize_0.Large, 
                    width = UDim.new(0, 400), 
                    onActivated = v37.nextAction, 
                    text = v37.nextText
                })
            })
        });
    end
};