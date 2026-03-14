local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.UIBlox);
local v2 = require(l_CorePackages_0.Packages.React);
local l_ButtonStack_0 = v1.App.Button.ButtonStack;
local l_ButtonType_0 = v1.App.Button.Enum.ButtonType;
local l_HeaderBar_0 = v1.App.Bar.HeaderBar;
local l_useStyle_0 = v1.Core.Style.useStyle;
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.Dependencies);
local v9 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v10 = require(l_Parent_0.Flags.GetFFlagReportAnythingLocalizationEnabled);
local v11 = require(v8.Divider);
return function(v12) --[[ Line: 27 ]] --[[ Name: RestartScreenshotDialog ]]
    -- upvalues: l_useStyle_0 (copy), v10 (copy), v2 (copy), l_HeaderBar_0 (copy), v9 (copy), v11 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy)
    local v13 = l_useStyle_0();
    local l_Theme_0 = v13.Theme;
    local l_Font_0 = v13.Font;
    local v16 = 48;
    local v17 = 180;
    local v18 = 50;
    if v10() and v12.isSmallPortraitMode then
        v16 = 84;
        v17 = 260;
        v18 = 100;
    end;
    local v19 = v12.isSmallPortraitMode and 343 or 480;
    return v2.createElement("Frame", {
        Size = UDim2.new(0, v19, 0, v17), 
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
                renderLeft = function() --[[ Line: 64 ]] --[[ Name: renderLeft ]]

                end, 
                renderRight = function() --[[ Line: 66 ]] --[[ Name: renderRight ]]

                end, 
                title = if v10() then v9:FormatByKey("Feature.ReportAbuse.Action.RetakeScene") else "Retake Scene", 
                LayoutOrder = 1
            }), 
            Divider = v2.createElement(v11, {
                LayoutOrder = 2
            }), 
            Description = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, -v16 - 1), 
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
                    Text = if v10() then v9:FormatByKey("Feature.ReportAbuse.Message.RetakeScene") else "Help us understand what\226\128\153s happening around you. We\226\128\153ll capture the scene the moment you select \226\128\156Report.\226\128\157", 
                    Font = l_Font_0.Body.Font, 
                    LayoutOrder = 3, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                    TextSize = 16, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = if v10() then Enum.TextYAlignment.Top else nil, 
                    Size = UDim2.new(1, 0, 0, v18), 
                    BackgroundTransparency = 1
                })
            })
        }), 
        Footer = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v16), 
            Position = UDim2.new(0, 0, 1, -v16), 
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
                forcedFillDirection = if v10() and v12.isSmallPortraitMode then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal, 
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = if v12.isSmallPortraitMode then {
                            onActivated = v12.onCancel, 
                            text = if v10() then v9:FormatByKey("InGame.InspectMenu.Action.Cancel") else "Cancel", 
                            size = if v10() then UDim2.new(1, 0, 0, 28) else UDim2.new(0, 80, 0, 28), 
                            fontStyle = l_Font_0.Body2
                        } else {
                            onActivated = v12.onCancel, 
                            text = if v10() then v9:FormatByKey("InGame.InspectMenu.Action.Cancel") else "Cancel"
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = if v12.isSmallPortraitMode then {
                            onActivated = v12.onRestart, 
                            text = if v10() then v9:FormatByKey("Feature.ReportAbuse.Action.BackToExperience") else "Back To Experience", 
                            size = if v10() then UDim2.new(1, 0, 0, 28) else UDim2.new(0, 200, 0, 28), 
                            fontStyle = l_Font_0.Body2
                        } else {
                            onActivated = v12.onRestart, 
                            text = if v10() then v9:FormatByKey("Feature.ReportAbuse.Action.BackToExperience") else "Back To Experience"
                        }
                    }
                }
            })
        })
    });
end;