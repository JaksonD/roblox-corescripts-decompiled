local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local l_Connection_0 = script.Parent.Parent.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local l_Parent_0 = script.Parent.Parent.Parent;
local v10 = require(l_Parent_0.Flags.FFlagPlayerListReduceRerenders);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v12 = require(l_RobloxGui_0.Modules.GameTranslator);
local v13 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v14 = v2.PureComponent:extend("TitleBar");
v14.validateProps = v5.strictInterface({
    Size = v5.UDim2, 
    Position = v5.optional(v5.UDim2), 
    LayoutOrder = v5.optional(v5.integer), 
    entrySize = v5.integer, 
    contentsVisible = v5.boolean, 
    showBackground = v5.optional(v5.boolean), 
    isSmallTouchDevice = v5.boolean, 
    gameStats = v5.array(v5.strictInterface({
        name = v5.string, 
        text = v5.string, 
        addId = v5.integer, 
        serverAddId = v5.integer, 
        isPrimary = v5.boolean, 
        priority = v5.number
    }))
});
v14.render = function(v15) --[[ Line: 46 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), v2 (copy), v13 (copy), v12 (copy), l_CoreGui_0 (copy)
    return l_WithLayoutValues_0(function(v16) --[[ Line: 47 ]]
        -- upvalues: l_withStyle_0 (ref), v2 (ref), v13 (ref), v15 (copy), v12 (ref), l_CoreGui_0 (ref)
        return l_withStyle_0(function(v17) --[[ Line: 48 ]]
            -- upvalues: v2 (ref), v16 (copy), v13 (ref), v15 (ref), v12 (ref), l_CoreGui_0 (ref)
            local v18 = {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                PlayersHeader = v2.createElement("TextLabel", {
                    LayoutOrder = 0, 
                    Size = UDim2.new(0, v16.PlayerNameSizeXMobile, 1, 0), 
                    Text = v13:FormatByKey("InGame.PlayerList.Players"), 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Font = v17.Font.Footer.Font, 
                    TextSize = v17.Font.BaseSize * v17.Font.Footer.RelativeSize, 
                    TextColor3 = v17.Theme.TextMuted.Color
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 14)
                    })
                })
            };
            local l_MaxLeaderstats_0 = v16.MaxLeaderstats;
            for v20, v21 in ipairs(v15.props.gameStats) do
                if l_MaxLeaderstats_0 >= v20 then
                    local v22 = v12:TranslateGameText(l_CoreGui_0, v21.name);
                    v18["Stat_" .. v21.name] = v2.createElement("TextLabel", {
                        LayoutOrder = v20, 
                        Size = UDim2.new(0, v16.StatEntrySizeX, 1, 0), 
                        Text = v22, 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        Font = v17.Font.Footer.Font, 
                        TextSize = v17.Font.BaseSize * v17.Font.Footer.RelativeSize, 
                        TextTransparency = 0, 
                        TextColor3 = Color3.fromRGB(255, 255, 255), 
                        TextTruncate = Enum.TextTruncate.AtEnd
                    });
                else
                    break;
                end;
            end;
            return v2.createElement("Frame", {
                Size = v15.props.Size, 
                Position = v15.props.Position, 
                LayoutOrder = v15.props.LayoutOrder, 
                Visible = v15.props.contentsVisible, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, v18);
        end);
    end);
end;
local function v24(v23) --[[ Line: 107 ]] --[[ Name: mapStateToProps ]]
    return {
        isSmallTouchDevice = v23.displayOptions.isSmallTouchDevice
    };
end;
if v10 then
    return v3.memo(v4.connect(v24, nil)(v14));
else
    return v4.connect(v24, nil)(v14);
end;