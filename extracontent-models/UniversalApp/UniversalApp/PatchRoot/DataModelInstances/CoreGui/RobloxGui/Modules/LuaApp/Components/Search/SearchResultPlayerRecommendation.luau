local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.LuaApp.Components.FitTextButton);
local v5 = require(l_Modules_0.LuaApp.FitChildren);
local v6 = require(l_Modules_0.LuaApp.Components.LocalizedFitTextLabel);
local v7 = require(l_Modules_0.LuaApp.Components.Search.DoPlayerSearch);
local v8 = v3.PureComponent:extend("GamesSearchForPlayers");
v8.init = function(v9) --[[ Line: 24 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy)
    v9.onPlayerSearchButtonActivated = function() --[[ Line: 25 ]]
        -- upvalues: v7 (ref), v9 (copy)
        v7(v9.props.analytics, v9.props.guiService, v9.props.keyword, v9.props.openWebview, v9.props.localization, "CommonUI.Features.Label.Players");
    end;
end;
v8.render = function(v10) --[[ Line: 37 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v3 (copy), v6 (copy), v5 (copy), v4 (copy)
    local l_keyword_0 = v10.props.keyword;
    local l_layoutOrder_0 = v10.props.layoutOrder;
    return l_withStyle_0(function(v13) --[[ Line: 41 ]]
        -- upvalues: v3 (ref), l_layoutOrder_0 (copy), v6 (ref), v5 (ref), v4 (ref), l_keyword_0 (copy), v10 (copy)
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 18), 
            LayoutOrder = l_layoutOrder_0
        }, {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 2)
            }), 
            PlayerSearchTitleText = v3.createElement(v6, {
                Text = "Feature.GamePage.LabelSearchInsteadForPlayersNamed", 
                LayoutOrder = 1, 
                Size = UDim2.new(0, 0, 1, 0), 
                BackgroundTransparency = 1, 
                TextSize = v13.Font.Body.RelativeSize * v13.Font.BaseSize, 
                Font = v13.Font.Body.Font, 
                TextColor3 = v13.Theme.TextDefault.Color, 
                TextTransparency = v13.Theme.TextDefault.Transparency, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                fitAxis = v5.FitAxis.Width
            }), 
            PlayerSearchKeyword = v3.createElement(v4, {
                Text = l_keyword_0, 
                LayoutOrder = 2, 
                Size = UDim2.new(0, 0, 1, 0), 
                BackgroundTransparency = 1, 
                TextSize = v13.Font.Body.RelativeSize * v13.Font.BaseSize, 
                Font = v13.Font.Body.Font, 
                TextColor3 = v13.Theme.TextEmphasis.Color, 
                TextTransparency = v13.Theme.TextEmphasis.Transparency, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                fitAxis = v5.FitAxis.Width, 
                [v3.Event.Activated] = v10.onPlayerSearchButtonActivated
            }, {
                Underline = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 1, -1), 
                    BackgroundColor3 = v13.Theme.TextEmphasis.Color, 
                    BackgroundTransparency = v13.Theme.TextEmphasis.Transparency
                })
            })
        });
    end);
end;
return v8;