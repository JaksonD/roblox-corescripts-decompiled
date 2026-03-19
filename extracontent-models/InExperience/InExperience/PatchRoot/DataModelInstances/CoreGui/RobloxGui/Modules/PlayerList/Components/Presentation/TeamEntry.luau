local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v7 = require(l_RobloxGui_0.Modules.GameTranslator);
local l_Parent_0 = script.Parent.Parent;
local l_Connection_0 = l_Parent_0.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v11 = require(script.Parent.EntryFrame);
local v12 = require(script.Parent.StatEntry);
local v13 = require(script.Parent.CellExtender);
local l_Parent_1 = l_Parent_0.Parent;
local v15 = require(l_Parent_1.createShallowEqualAndTables);
local v16 = require(l_Parent_1.Flags.FFlagPlayerListReduceRerenders);
local v17 = v2.PureComponent:extend("TeamEntry");
v17.render = function(v18) --[[ Line: 30 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), v7 (copy), l_CoreGui_0 (copy), v2 (copy), v11 (copy), v16 (copy), v12 (copy), v13 (copy)
    return l_WithLayoutValues_0(function(v19) --[[ Line: 31 ]]
        -- upvalues: l_withStyle_0 (ref), v18 (copy), v7 (ref), l_CoreGui_0 (ref), v2 (ref), v11 (ref), v16 (ref), v12 (ref), v13 (ref)
        return l_withStyle_0(function(v20) --[[ Line: 32 ]]
            -- upvalues: v19 (copy), v18 (ref), v7 (ref), l_CoreGui_0 (ref), v2 (ref), v11 (ref), v16 (ref), v12 (ref), v13 (ref)
            local l_NeutralTeamName_0 = v19.NeutralTeamName;
            local l_Color_0 = v19.NeutralTeamColor.Color;
            if v18.props.teamName then
                l_NeutralTeamName_0 = v7:TranslateGameText(l_CoreGui_0, v18.props.teamName);
                l_Color_0 = v18.props.teamColor.Color;
            end;
            local v23 = nil;
            v23 = if not v19.IsTenFoot then if v18.props.teamColor then {
                Color = v18.props.teamColor.Color, 
                Transparency = v19.TeamEntryBackgroundTransparency * v20.Settings.PreferredTransparency
            } else v20.Theme.Divider else {
                Color = l_Color_0, 
                Transparency = v19.BackgroundStyle.Default.Transparency
            };
            local v24 = {
                Transparency = 1, 
                Color = Color3.new(1, 1, 1)
            };
            local v25 = nil;
            v25 = if v19.IsTenFoot then v19.DefaultTextStyle else v20.Theme.TextEmphasis;
            local l_entrySize_0 = v18.props.entrySize;
            local v27 = nil;
            local v28 = nil;
            if not v19.IsTenFoot then
                v27 = v20.Font.CaptionHeader.RelativeSize * v20.Font.BaseSize;
                v28 = v20.Font.CaptionHeader.Font;
            else
                v27 = v19.PlayerNameTextSize;
                v28 = v19.TeamEntryFont;
            end;
            local v29 = {};
            local v30 = nil;
            if v19.IsTenFoot then
                v30 = UDim.new(0, v19.PlayerEntryPadding);
            end;
            v29.Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = v30
            });
            v29.NameFrame = v2.createElement("Frame", {
                LayoutOrder = 0, 
                Size = UDim2.new(0, l_entrySize_0, 0, v19.TeamEntrySizeY), 
                BackgroundTransparency = 1
            }, {
                Shadow = v2.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = v19.ShadowImage, 
                    Position = UDim2.new(0, -v19.ShadowSize, 0, 0), 
                    Size = UDim2.new(1, v19.ShadowSize * 2, 1, v19.ShadowSize), 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = v19.ShadowSliceRect, 
                    Visible = v19.IsTenFoot
                }), 
                BGFrame = v2.createElement(v11, {
                    sizeX = l_entrySize_0, 
                    sizeY = v19.TeamEntrySizeY, 
                    isTeamFrame = true, 
                    backgroundStyle = v23, 
                    overlayStyle = v24, 
                    doubleOverlay = false
                }, {
                    TeamName = v2.createElement("TextLabel", {
                        Position = UDim2.new(0, 0, 0, 0), 
                        Size = UDim2.new(1, 0, 1, 0), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Font = v28, 
                        TextSize = v27, 
                        TextColor3 = v25.Color, 
                        TextStrokeTransparency = v25.StrokeTransparency, 
                        TextStrokeColor3 = v25.StrokeColor, 
                        BackgroundTransparency = 1, 
                        Text = l_NeutralTeamName_0, 
                        TextTruncate = Enum.TextTruncate.AtEnd
                    }, {
                        v2.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, v19.TeamEntryTextPadding)
                        })
                    })
                })
            });
            local l_MaxLeaderstats_0 = v19.MaxLeaderstats;
            if v18.props.isSmallTouchDevice then
                l_MaxLeaderstats_0 = v19.MaxLeaderstatsSmallScreen;
            end;
            if v16 then
                for v32, v33 in v18.props.gameStatNames do
                    if l_MaxLeaderstats_0 >= v32 then
                        v29["gameStat_" .. v33] = v2.createElement(v12, {
                            statName = v33, 
                            statValue = v18.props.leaderstats[v33], 
                            isTitleEntry = false, 
                            isTeamEntry = true, 
                            layoutOrder = v32, 
                            backgroundStyle = v23, 
                            overlayStyle = v24, 
                            doubleOverlay = false, 
                            textStyle = v25
                        });
                    else
                        break;
                    end;
                end;
            else
                for v34, v35 in ipairs(v18.props.gameStats) do
                    if l_MaxLeaderstats_0 >= v34 then
                        v29["gameStat_" .. v35.name] = v2.createElement(v12, {
                            statName = v35.name, 
                            statValue = v18.props.leaderstats[v35.name], 
                            isTitleEntry = false, 
                            isTeamEntry = true, 
                            layoutOrder = v34, 
                            backgroundStyle = v23, 
                            overlayStyle = v24, 
                            doubleOverlay = false, 
                            textStyle = v25
                        });
                    else
                        break;
                    end;
                end;
            end;
            if not v19.IsTenFoot then
                v29.BackgroundExtender = v2.createElement(v13, {
                    layoutOrder = 100, 
                    size = UDim2.new(0, v19.ExtraContainerPadding, 1, 0), 
                    backgroundStyle = v23, 
                    overlayStyle = v24, 
                    doubleOverlay = false
                });
            end;
            return v2.createFragment(v29);
        end);
    end);
end;
local function v37(v36) --[[ Line: 194 ]] --[[ Name: mapStateToProps ]]
    return {
        isSmallTouchDevice = v36.displayOptions.isSmallTouchDevice
    };
end;
if v16 then
    return v3.memo(v4.UNSTABLE_connect2(v37, nil)(v17), v15({
        "gameStatNames", 
        "leaderstats"
    }));
else
    return v4.UNSTABLE_connect2(v37, nil)(v17);
end;