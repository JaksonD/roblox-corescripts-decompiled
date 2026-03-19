local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.SignalsReact);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local _ = require(l_CorePackages_0.Workspace.Packages.LeaderboardStore);
local v8 = require(l_RobloxGui_0.Modules.GameTranslator);
local v9 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_useLayoutValues_0 = v6.Common.useLayoutValues;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_FFlagPlayerListFixLeaderstatsStacking_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagPlayerListFixLeaderstatsStacking;
local l_FFlagEnableMobilePlayerListOnConsole_0 = v6.Flags.FFlagEnableMobilePlayerListOnConsole;
local v14 = {
    showDivider = false, 
    showBackground = false, 
    backgroundTransparency = 1, 
    useCustomTextColor = false, 
    customTextColor = Color3.fromRGB(255, 255, 255), 
    headerPaddingLeft = 15
};
return v3.memo(function(v15) --[[ Line: 56 ]] --[[ Name: TitleBarView ]]
    -- upvalues: v14 (copy), l_useLayoutValues_0 (copy), l_useStyle_0 (copy), v3 (copy), v9 (copy), l_FFlagEnableMobilePlayerListOnConsole_0 (copy), l_FFlagPlayerListFixLeaderstatsStacking_0 (copy), v4 (copy), v8 (copy), l_CoreGui_0 (copy), l_CorePackages_0 (copy)
    local v16 = {};
    for v17, v18 in pairs(v14) do
        v16[v17] = v15[v17] ~= nil and v15[v17] or v18;
    end;
    for v19, v20 in pairs(v15) do
        v16[v19] = v20;
    end;
    v15 = v16;
    local v21 = l_useLayoutValues_0();
    local v22 = l_useStyle_0();
    local v23 = {
        layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        })
    };
    local l_entrySizeX_0 = v15.entrySizeX;
    if v15.isSmallTouchDevice then
        l_entrySizeX_0 = v21.PlayerNameSizeXMobile;
    end;
    local v25 = v15.useCustomTextColor and v15.customTextColor or v22.Theme.TextMuted.Color;
    local v26 = v15.useCustomTextColor and 0 or v22.Theme.TextMuted.Transparency;
    v23.playersHeader = v3.createElement("TextLabel", {
        LayoutOrder = 1, 
        Size = UDim2.new(0, l_entrySizeX_0, 1, 0), 
        Text = v9:FormatByKey("InGame.PlayerList.Players"), 
        BackgroundTransparency = 1, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Center, 
        Font = v22.Font.Footer.Font, 
        TextSize = if l_FFlagEnableMobilePlayerListOnConsole_0 then v21.TitleBarTextSize else v22.Font.BaseSize * v22.Font.Footer.RelativeSize, 
        TextTransparency = v26, 
        TextColor3 = v25
    }, {
        Padding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v15.headerPaddingLeft)
        })
    });
    local l_MaxLeaderstats_0 = v21.MaxLeaderstats;
    if l_FFlagPlayerListFixLeaderstatsStacking_0 then
        for v28, v29 in (v4.useSignalState(v15.gameStats.getAllData)) do
            if l_MaxLeaderstats_0 >= v29.order(false) then
                local v30 = v8:TranslateGameText(l_CoreGui_0, v28);
                v23["stat_" .. v28] = v3.createElement("TextLabel", {
                    LayoutOrder = v29.order(false) + 1, 
                    Size = UDim2.new(0, v21.StatEntrySizeX, 1, 0), 
                    Text = v30, 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Font = v22.Font.Footer.Font, 
                    TextSize = if l_FFlagEnableMobilePlayerListOnConsole_0 then v21.TitleBarTextSize else v22.Font.BaseSize * v22.Font.Footer.RelativeSize, 
                    TextTransparency = v26, 
                    TextColor3 = v25, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                });
            end;
        end;
    elseif v15.gameStatsCount and v15.gameStatsCount > 0 then
        v15.gameStats.iterateData(function(v31, v32) --[[ Line: 138 ]]
            -- upvalues: l_MaxLeaderstats_0 (copy), v8 (ref), l_CoreGui_0 (ref), v23 (copy), v3 (ref), v21 (copy), v22 (copy), l_FFlagEnableMobilePlayerListOnConsole_0 (ref), v26 (copy), v25 (copy)
            if v32.order(false) > l_MaxLeaderstats_0 then
                return;
            else
                local v33 = v8:TranslateGameText(l_CoreGui_0, v31);
                v23["stat_" .. v31] = v3.createElement("TextLabel", {
                    LayoutOrder = v32.order(false) + 1, 
                    Size = UDim2.new(0, v21.StatEntrySizeX, 1, 0), 
                    Text = v33, 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Font = v22.Font.Footer.Font, 
                    TextSize = if l_FFlagEnableMobilePlayerListOnConsole_0 then v21.TitleBarTextSize else v22.Font.BaseSize * v22.Font.Footer.RelativeSize, 
                    TextTransparency = v26, 
                    TextColor3 = v25, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                });
                return;
            end;
        end, false);
    end;
    local v34 = Color3.fromRGB(0, 0, 0);
    if v15.showBackground then
        v34 = if require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled() then v22.Theme.BackgroundUIContrast.Color else v22.Theme.BackgroundContrast.Color;
    end;
    local v35 = {};
    if v15.showDivider then
        v35.Divider = v3.createElement("Frame", {
            Visible = v15.contentsVisible, 
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = v22.Theme.Divider.Transparency, 
            BackgroundColor3 = v22.Theme.Divider.Color, 
            BorderSizePixel = 0
        });
    end;
    v35.ChildrenFrame = v3.createElement("Frame", {
        Visible = v15.contentsVisible, 
        BackgroundTransparency = 1, 
        Position = v15.showBackground and UDim2.new(0, 0, 0, -2) or UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0)
    }, v23);
    return v3.createElement("Frame", {
        Size = v15.size, 
        LayoutOrder = v15.layoutOrder, 
        BackgroundTransparency = v15.backgroundTransparency, 
        BackgroundColor3 = v34, 
        BorderSizePixel = 0
    }, v35);
end);