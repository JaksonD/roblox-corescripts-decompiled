local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.SignalsReact);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local _ = require(l_CorePackages_0.Workspace.Packages.LeaderboardStore);
local l_useLayoutValues_0 = v6.Common.useLayoutValues;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_EntryFrameView_0 = v6.Presentation.EntryFrameView;
local v11 = require(l_Parent_1.Components.Container.StatEntryContainer);
local l_FFlagPlayerListFixLeaderstatsStacking_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagPlayerListFixLeaderstatsStacking;
local l_FFlagEnableMobilePlayerListOnConsole_0 = v6.Flags.FFlagEnableMobilePlayerListOnConsole;
local v14 = require(l_Parent_0.Presentation.CellExtender);
return v3.memo(function(v15) --[[ Line: 54 ]] --[[ Name: TeamEntryView ]]
    -- upvalues: l_useLayoutValues_0 (copy), l_useStyle_0 (copy), l_FFlagEnableMobilePlayerListOnConsole_0 (copy), v3 (copy), l_FFlagPlayerListFixLeaderstatsStacking_0 (copy), v4 (copy), v11 (copy), l_EntryFrameView_0 (copy), v14 (copy)
    local v16 = l_useLayoutValues_0();
    local v17 = l_useStyle_0();
    local v18 = v15.isSmallTouchDevice or false;
    local v19 = v15.isDirectionalPreferred or false;
    local l_TextEmphasis_0 = v17.Theme.TextEmphasis;
    local v21 = if l_FFlagEnableMobilePlayerListOnConsole_0 then v16.TeamNameTextSize else v17.Font.CaptionHeader.RelativeSize * v17.Font.BaseSize;
    local l_Font_0 = v17.Font.CaptionHeader.Font;
    if v19 then
        l_TextEmphasis_0 = v16.DefaultTextStyle;
        v21 = v16.PlayerNameTextSize;
        l_Font_0 = v16.TeamEntryFont;
    end;
    local v24 = v3.useMemo(function() --[[ Line: 75 ]]
        -- upvalues: v18 (copy), v17 (copy), v15 (copy), v19 (copy), v16 (copy)
        if v18 then
            local l_Settings_0 = v17.Settings;
            return {
                Color = v15.teamColor, 
                Transparency = l_Settings_0.PreferredTransparency * 0.5
            };
        elseif v19 then
            return {
                Color = v15.teamColor, 
                Transparency = if v16.BackgroundStyle then v16.BackgroundStyle.Default.Transparency else 0
            };
        else
            return {
                Color = v15.teamColor, 
                Transparency = v16.TeamEntryBackgroundTransparency * v17.Settings.PreferredTransparency
            };
        end;
    end, {
        v18, 
        v19, 
        v15.teamColor, 
        v17, 
        v16
    });
    local v25 = {
        Color = Color3.new(1, 1, 1), 
        Transparency = 1
    };
    local l_MaxLeaderstats_0 = v16.MaxLeaderstats;
    local v27 = if l_FFlagPlayerListFixLeaderstatsStacking_0 then v4.useSignalState(v15.gameStats.getAllData) else nil;
    if v18 then
        local v28 = {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            NameFrame = v3.createElement("TextLabel", {
                Size = UDim2.new(0, v16.PlayerNameSizeXMobile, 1, 0), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Font = l_Font_0, 
                TextSize = v21, 
                LayoutOrder = 0, 
                TextColor3 = l_TextEmphasis_0.Color, 
                TextStrokeTransparency = l_TextEmphasis_0.StrokeTransparency, 
                TextStrokeColor3 = l_TextEmphasis_0.StrokeColor, 
                BackgroundTransparency = 1, 
                Text = v15.teamName, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v16.TeamEntryTextPaddingMobile)
                })
            })
        };
        if l_FFlagPlayerListFixLeaderstatsStacking_0 then
            for v29, v30 in v27 do
                if l_MaxLeaderstats_0 >= v30.order(false) then
                    local v31 = v15.teamStats.getData(v29, false);
                    v28["GameStat_" .. v29] = v3.createElement(v11, {
                        statName = v29, 
                        stat = v31, 
                        isTeamEntry = true, 
                        showStatTitle = false, 
                        textStyle = l_TextEmphasis_0
                    });
                end;
            end;
        elseif v15.gameStatsCount and v15.teamStatsCount and v15.gameStatsCount > 0 and v15.teamStatsCount >= 0 then
            v15.gameStats.iterateData(function(v32, v33) --[[ Line: 159 ]]
                -- upvalues: l_MaxLeaderstats_0 (copy), v15 (copy), v28 (copy), v3 (ref), v11 (ref), l_TextEmphasis_0 (ref)
                if v33.order(false) > l_MaxLeaderstats_0 then
                    return;
                else
                    local v34 = v15.teamStats.getData(v32, false);
                    v28["GameStat_" .. v32] = v3.createElement(v11, {
                        statName = v32, 
                        stat = v34, 
                        isTeamEntry = true, 
                        showStatTitle = false, 
                        textStyle = l_TextEmphasis_0
                    });
                    return;
                end;
            end, false);
        end;
        return v3.createElement("Frame", {
            LayoutOrder = v15.layoutOrder, 
            Size = v15.size, 
            BackgroundColor3 = v24.Color, 
            BackgroundTransparency = v24.Transparency, 
            BorderSizePixel = 0, 
            GroupTransparency = nil
        }, v28);
    else
        local v35 = {};
        local v36 = nil;
        if v19 then
            v36 = UDim.new(0, v16.PlayerEntryPadding);
        end;
        v35.UIListLayout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = v36
        });
        v35.NameFrame = v3.createElement("Frame", {
            LayoutOrder = 0, 
            Size = UDim2.new(0, v15.entrySizeX, 0, v16.TeamEntrySizeY), 
            BackgroundTransparency = 1
        }, {
            Shadow = v3.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = v16.ShadowImage, 
                Position = UDim2.new(0, -v16.ShadowSize, 0, 0), 
                Size = UDim2.new(1, v16.ShadowSize * 2, 1, v16.ShadowSize), 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v16.ShadowSliceRect, 
                Visible = v19
            }), 
            BGFrame = v3.createElement(l_EntryFrameView_0, {
                size = UDim2.new(0, v15.entrySizeX, 0, v16.TeamEntrySizeY), 
                isTeamFrame = true, 
                backgroundStyle = v24, 
                overlayStyle = v25, 
                doubleOverlay = false
            }, {
                TeamName = v3.createElement("TextLabel", {
                    Position = UDim2.new(0, 0, 0, 0), 
                    Size = UDim2.new(1, 0, 1, 0), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Font = l_Font_0, 
                    TextSize = v21, 
                    TextColor3 = l_TextEmphasis_0.Color, 
                    TextStrokeTransparency = l_TextEmphasis_0.StrokeTransparency, 
                    TextStrokeColor3 = l_TextEmphasis_0.StrokeColor, 
                    BackgroundTransparency = 1, 
                    Text = v15.teamName, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                }, {
                    v3.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v16.TeamEntryTextPadding)
                    })
                })
            })
        });
        if l_FFlagPlayerListFixLeaderstatsStacking_0 then
            for v37, v38 in v27 do
                if l_MaxLeaderstats_0 >= v38.order(false) then
                    local v39 = v15.teamStats.getData(v37, false);
                    v35["GameStat_" .. v37] = v3.createElement(v11, {
                        statName = v37, 
                        stat = v39, 
                        isTeamEntry = true, 
                        showStatTitle = false, 
                        backgroundStyle = v24, 
                        overlayStyle = v25, 
                        doubleOverlay = false, 
                        textStyle = l_TextEmphasis_0
                    });
                end;
            end;
        elseif v15.gameStatsCount and v15.teamStatsCount and v15.gameStatsCount > 0 and v15.teamStatsCount >= 0 then
            v15.gameStats.iterateData(function(v40, v41) --[[ Line: 264 ]]
                -- upvalues: l_MaxLeaderstats_0 (copy), v15 (copy), v35 (copy), v3 (ref), v11 (ref), v24 (copy), v25 (copy), l_TextEmphasis_0 (ref)
                if v41.order(false) > l_MaxLeaderstats_0 then
                    return;
                else
                    local v42 = v15.teamStats.getData(v40, false);
                    v35["GameStat_" .. v40] = v3.createElement(v11, {
                        statName = v40, 
                        stat = v42, 
                        isTeamEntry = true, 
                        showStatTitle = false, 
                        backgroundStyle = v24, 
                        overlayStyle = v25, 
                        doubleOverlay = false, 
                        textStyle = l_TextEmphasis_0
                    });
                    return;
                end;
            end, false);
        end;
        if not v19 then
            v35.BackgroundExtender = v3.createElement(v14, {
                layoutOrder = 100, 
                size = UDim2.new(0, v16.ExtraContainerPadding, 1, 0), 
                backgroundStyle = v24, 
                overlayStyle = v25, 
                doubleOverlay = false
            });
        end;
        return v3.createElement("Frame", {
            Size = v15.size, 
            BackgroundColor3 = Color3.new(1, 1, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = v15.layoutOrder, 
            GroupTransparency = nil
        }, v35);
    end;
end);