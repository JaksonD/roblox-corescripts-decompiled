local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local l_Connection_0 = l_Parent_0.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local l_Parent_1 = l_Parent_0.Parent;
local v11 = require(l_Parent_1.Flags.FFlagPlayerListReduceRerenders);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v13 = require(l_RobloxGui_0.Modules.GameTranslator);
local v14 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_Enabled_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled;
local v16 = v2.PureComponent:extend("TitleBar");
v16.validateProps = v5.strictInterface({
    Size = v5.UDim2, 
    LayoutOrder = v5.integer, 
    entrySize = v5.integer, 
    contentsVisible = v5.boolean, 
    showBackground = v5.optional(v5.boolean), 
    backgroundTransparency = v5.union(v5.number, v5.table), 
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
v16.render = function(v17) --[[ Line: 47 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), v2 (copy), v14 (copy), v13 (copy), l_CoreGui_0 (copy), l_Enabled_0 (copy)
    return l_WithLayoutValues_0(function(v18) --[[ Line: 48 ]]
        -- upvalues: l_withStyle_0 (ref), v2 (ref), v17 (copy), v14 (ref), v13 (ref), l_CoreGui_0 (ref), l_Enabled_0 (ref)
        return l_withStyle_0(function(v19) --[[ Line: 49 ]]
            -- upvalues: v2 (ref), v17 (ref), v14 (ref), v18 (copy), v13 (ref), l_CoreGui_0 (ref), l_Enabled_0 (ref)
            local v20 = {
                layout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                })
            };
            local l_entrySize_0 = v17.props.entrySize;
            v20.playersHeader = v2.createElement("TextLabel", {
                LayoutOrder = 1, 
                Size = UDim2.new(0, l_entrySize_0, 1, 0), 
                Text = v14:FormatByKey("InGame.PlayerList.Players"), 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Font = v19.Font.Footer.Font, 
                TextSize = v19.Font.BaseSize * v19.Font.Footer.RelativeSize, 
                TextTransparency = v19.Theme.TextMuted.Transparency, 
                TextColor3 = v19.Theme.TextMuted.Color
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 15)
                })
            });
            local l_MaxLeaderstats_0 = v18.MaxLeaderstats;
            if v17.props.isSmallTouchDevice then
                l_MaxLeaderstats_0 = v18.MaxLeaderstatsSmallScreen;
            end;
            for v23, v24 in ipairs(v17.props.gameStats) do
                if l_MaxLeaderstats_0 >= v23 then
                    local v25 = v13:TranslateGameText(l_CoreGui_0, v24.name);
                    v20["stat_" .. v24.name] = v2.createElement("TextLabel", {
                        LayoutOrder = v23 + 1, 
                        Size = UDim2.new(0, v18.StatEntrySizeX, 1, 0), 
                        Text = v25, 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        Font = v19.Font.Footer.Font, 
                        TextSize = v19.Font.BaseSize * v19.Font.Footer.RelativeSize, 
                        TextTransparency = v19.Theme.TextMuted.Transparency, 
                        TextColor3 = v19.Theme.TextMuted.Color, 
                        TextTruncate = Enum.TextTruncate.AtEnd
                    });
                else
                    break;
                end;
            end;
            local v26 = if l_Enabled_0() then v19.Theme.BackgroundUIContrast.Color else v19.Theme.BackgroundContrast.Color;
            return v2.createElement("Frame", {
                Size = v17.props.Size, 
                LayoutOrder = v17.props.LayoutOrder, 
                BackgroundTransparency = v17.props.backgroundTransparency, 
                BackgroundColor3 = v26, 
                BorderSizePixel = 0
            }, {
                Divider = v2.createElement("Frame", {
                    Visible = v17.props.contentsVisible, 
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundTransparency = v19.Theme.Divider.Transparency, 
                    BackgroundColor3 = v19.Theme.Divider.Color, 
                    BorderSizePixel = 0
                }), 
                ChildrenFrame = v2.createElement("Frame", {
                    Visible = v17.props.contentsVisible, 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0, 0, 0, -2), 
                    Size = UDim2.new(1, 0, 1, 0)
                }, v20)
            });
        end);
    end);
end;
local function v28(v27) --[[ Line: 133 ]] --[[ Name: mapStateToProps ]]
    return {
        isSmallTouchDevice = v27.displayOptions.isSmallTouchDevice
    };
end;
if v11 then
    return v3.memo(v4.UNSTABLE_connect2(v28, nil)(v16));
else
    return v4.UNSTABLE_connect2(v28, nil)(v16);
end;