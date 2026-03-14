local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.withLocalization);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v6.Style.withStyle;
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local v10 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v11 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v12 = v2.PureComponent:extend("UserAgreementsSecondPrompt");
v12.validateProps = v5.strictInterface({
    agreements = v5.array(v5.strictInterface({
        id = v5.string, 
        agreementType = v5.string, 
        clientType = v5.string, 
        displayUrl = v5.string, 
        regulationType = v5.string
    })), 
    agreementsListItems = v5.table, 
    screenSize = v5.Vector2, 
    showFirstPrompt = v5.callback
});
v12.init = function(v13) --[[ Line: 33 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v13.onAck = function() --[[ Line: 34 ]]
        -- upvalues: v13 (copy)
        local l_agreements_0 = v13.props.agreements;
        v13.props.showFirstPrompt(l_agreements_0);
    end;
    v13.renderMiddleContent = function(v15, v16) --[[ Line: 40 ]]
        -- upvalues: v13 (copy), v2 (ref)
        local l_Theme_0 = v16.Theme;
        local l_Font_0 = v16.Font;
        local l_agreementsListItems_0 = v13.props.agreementsListItems;
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            Agreements = v2.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Prefix = v2.createElement("Frame", {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 12)
                }, {
                    PrefixText = v2.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        Text = v15.bodyTextPart1, 
                        Font = l_Font_0.CaptionHeader.Font, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextWrapped = true
                    }), 
                    Padding = v2.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 12)
                    })
                }), 
                AgreementsList = v2.createElement("Frame", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    AutomaticSize = Enum.AutomaticSize.XY
                }, l_agreementsListItems_0), 
                Suffix = v2.createElement("Frame", {
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 12)
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 12)
                    }), 
                    PrefixText = v2.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        Text = v15.bodyTextPart2, 
                        Font = l_Font_0.CaptionHeader.Font, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextWrapped = true
                    })
                })
            })
        });
    end;
end;
v12.render = function(v20) --[[ Line: 116 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v4 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local l_screenSize_0 = v20.props.screenSize;
    return l_withStyle_0(function(v22) --[[ Line: 118 ]]
        -- upvalues: v4 (ref), v2 (ref), l_InteractiveAlert_0 (ref), v20 (copy), l_ButtonType_0 (ref), l_screenSize_0 (copy)
        return v4({
            title = "Luobu.Authentication.UserAgreementsSecondPrompt.Title", 
            bodyTextPart1 = "Luobu.Authentication.UserAgreementsSecondPrompt.BodyText.Part1", 
            bodyTextPart2 = "Luobu.Authentication.UserAgreementsSecondPrompt.BodyText.Part2", 
            buttonText = "Luobu.Authentication.UserAgreementsSecondPrompt.Button.Acknowledge"
        })(function(v23) --[[ Line: 124 ]]
            -- upvalues: v2 (ref), l_InteractiveAlert_0 (ref), v20 (ref), v22 (copy), l_ButtonType_0 (ref), l_screenSize_0 (ref)
            return v2.createElement(l_InteractiveAlert_0, {
                title = v23.title, 
                middleContent = function() --[[ Line: 127 ]] --[[ Name: middleContent ]]
                    -- upvalues: v20 (ref), v23 (copy), v22 (ref)
                    return v20.renderMiddleContent(v23, v22);
                end, 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = v20.onAck, 
                                text = v23.buttonText
                            }
                        }
                    }
                }, 
                position = UDim2.fromScale(0.5, 0.5), 
                screenSize = l_screenSize_0
            });
        end);
    end);
end;
return (v3.connect(function(v24) --[[ Line: 148 ]]
    return {
        screenSize = v24.ScreenSize
    };
end, function(v25) --[[ Line: 152 ]]
    -- upvalues: v11 (copy), v10 (copy)
    return {
        showFirstPrompt = function(v26) --[[ Line: 154 ]] --[[ Name: showFirstPrompt ]]
            -- upvalues: v25 (copy), v11 (ref), v10 (ref)
            v25(v11(v10.UserAgreementsPrompt, {
                agreements = v26, 
                context = v10.UserAgreementsSecondPrompt
            }));
        end
    };
end)(v12));