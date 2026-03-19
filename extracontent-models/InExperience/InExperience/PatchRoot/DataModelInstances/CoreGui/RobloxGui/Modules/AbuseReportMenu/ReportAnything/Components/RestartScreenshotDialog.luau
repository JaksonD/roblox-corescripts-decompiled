local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.UIBlox);
local v2 = require(l_CorePackages_0.Packages.React);
local l_ButtonStack_0 = v1.App.Button.ButtonStack;
local l_ButtonType_0 = v1.App.Button.Enum.ButtonType;
local l_HeaderBar_0 = v1.App.Bar.HeaderBar;
local l_useStyle_0 = v1.Core.Style.useStyle;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v9 = require(l_Parent_0.Components.Divider);
return function(v10) --[[ Line: 26 ]] --[[ Name: RestartScreenshotDialog ]]
    -- upvalues: l_useStyle_0 (copy), v2 (copy), l_HeaderBar_0 (copy), v8 (copy), v9 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy)
    local v11 = l_useStyle_0();
    local l_Theme_0 = v11.Theme;
    local l_Font_0 = v11.Font;
    local v14 = 48;
    local v15 = 180;
    local v16 = 50;
    if v10.isSmallPortraitMode then
        v14 = 84;
        v15 = 260;
        v16 = 100;
    end;
    local v17 = v10.isSmallPortraitMode and 343 or 480;
    return v2.createElement("Frame", {
        Size = UDim2.new(0, v17, 0, v15), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundColor3 = Color3.fromHex("#4F545F"), 
        ZIndex = 5
    }, {
        Corner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        HeaderAndContent = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Header = v2.createElement(l_HeaderBar_0, {
                backgroundTransparency = 1, 
                barHeight = 48, 
                renderLeft = function() --[[ Line: 63 ]] --[[ Name: renderLeft ]]

                end, 
                renderRight = function() --[[ Line: 65 ]] --[[ Name: renderRight ]]

                end, 
                title = v8:FormatByKey("Feature.ReportAbuse.Action.RetakeScene"), 
                LayoutOrder = 1
            }), 
            Divider = v2.createElement(v9, {
                LayoutOrder = 2
            }), 
            Description = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, -v14 - 1), 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 8), 
                    PaddingBottom = UDim.new(0, 8), 
                    PaddingLeft = UDim.new(0, 16), 
                    PaddingRight = UDim.new(0, 16)
                }), 
                TextBody = v2.createElement("TextLabel", {
                    Text = v8:FormatByKey("Feature.ReportAbuse.Message.RetakeScene"), 
                    Font = l_Font_0.Body.Font, 
                    LayoutOrder = 3, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                    TextSize = 16, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    Size = UDim2.new(1, 0, 0, v16), 
                    BackgroundTransparency = 1
                })
            })
        }), 
        Footer = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v14), 
            Position = UDim2.new(0, 0, 1, -v14), 
            BorderSizePixel = 0, 
            LayoutOrder = 4
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 6), 
                PaddingBottom = UDim.new(0, 6), 
                PaddingLeft = UDim.new(0, 16), 
                PaddingRight = UDim.new(0, 16)
            }), 
            ActionButtons = v2.createElement(l_ButtonStack_0, {
                forcedFillDirection = if v10.isSmallPortraitMode then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal, 
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = if v10.isSmallPortraitMode then {
                            onActivated = v10.onCancel, 
                            text = v8:FormatByKey("InGame.InspectMenu.Action.Cancel"), 
                            size = UDim2.new(1, 0, 0, 28), 
                            fontStyle = l_Font_0.Body2
                        } else {
                            onActivated = v10.onCancel, 
                            text = v8:FormatByKey("InGame.InspectMenu.Action.Cancel")
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = if v10.isSmallPortraitMode then {
                            onActivated = v10.onRestart, 
                            text = v8:FormatByKey("Feature.ReportAbuse.Action.BackToExperience"), 
                            size = UDim2.new(1, 0, 0, 28), 
                            fontStyle = l_Font_0.Body2
                        } else {
                            onActivated = v10.onRestart, 
                            text = v8:FormatByKey("Feature.ReportAbuse.Action.BackToExperience")
                        }
                    }
                }
            })
        })
    });
end;