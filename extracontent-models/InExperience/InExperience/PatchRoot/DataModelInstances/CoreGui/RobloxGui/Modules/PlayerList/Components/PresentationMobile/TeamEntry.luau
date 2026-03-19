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
local v11 = require(script.Parent.StatEntry);
local l_Parent_1 = l_Parent_0.Parent;
local v13 = require(l_Parent_1.createShallowEqualAndTables);
local v14 = require(l_Parent_1.Flags.FFlagPlayerListReduceRerenders);
local v15 = v2.PureComponent:extend("TeamEntry");
v15.render = function(v16) --[[ Line: 29 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), v7 (copy), l_CoreGui_0 (copy), v2 (copy), v14 (copy), v11 (copy)
    return l_WithLayoutValues_0(function(v17) --[[ Line: 30 ]]
        -- upvalues: l_withStyle_0 (ref), v16 (copy), v7 (ref), l_CoreGui_0 (ref), v2 (ref), v14 (ref), v11 (ref)
        return l_withStyle_0(function(v18) --[[ Line: 31 ]]
            -- upvalues: v16 (ref), v7 (ref), l_CoreGui_0 (ref), v17 (copy), v2 (ref), v14 (ref), v11 (ref)
            local v19 = nil;
            local v20 = nil;
            if v16.props.teamName then
                v19 = v7:TranslateGameText(l_CoreGui_0, v16.props.teamName);
                v20 = v16.props.teamColor.Color;
            else
                v19 = v17.NeutralTeamName;
                v20 = v17.NeutralTeamColor.Color;
            end;
            local l_Settings_0 = v18.Settings;
            local l_TextEmphasis_0 = v18.Theme.TextEmphasis;
            local v23 = v18.Font.CaptionHeader.RelativeSize * v18.Font.BaseSize;
            local l_Font_0 = v18.Font.CaptionHeader.Font;
            local v25 = {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                NameFrame = v2.createElement("TextLabel", {
                    Size = UDim2.new(0, v17.PlayerNameSizeXMobile, 1, 0), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Font = l_Font_0, 
                    TextSize = v23, 
                    LayoutOrder = 0, 
                    TextColor3 = l_TextEmphasis_0.Color, 
                    TextStrokeTransparency = l_TextEmphasis_0.StrokeTransparency, 
                    TextStrokeColor3 = l_TextEmphasis_0.StrokeColor, 
                    BackgroundTransparency = 1, 
                    Text = v19, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                }, {
                    UIPadding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v17.TeamEntryTextPaddingMobile)
                    })
                })
            };
            if v14 then
                for v26, v27 in v16.props.gameStatNames do
                    if v17.MaxLeaderstats >= v26 then
                        v25["GameStat_" .. v27] = v2.createElement(v11, {
                            statValue = v16.props.leaderstats[v27], 
                            isTitleEntry = false, 
                            isTeamEntry = true, 
                            textStyle = l_TextEmphasis_0, 
                            layoutOrder = v26
                        });
                    else
                        break;
                    end;
                end;
            else
                for v28, v29 in ipairs(v16.props.gameStats) do
                    if v17.MaxLeaderstats >= v28 then
                        v25["GameStat_" .. v29.name] = v2.createElement(v11, {
                            statValue = v16.props.leaderstats[v29.name], 
                            isTitleEntry = false, 
                            isTeamEntry = true, 
                            textStyle = l_TextEmphasis_0, 
                            layoutOrder = v28
                        });
                    else
                        break;
                    end;
                end;
            end;
            return v2.createElement("Frame", {
                LayoutOrder = v16.props.layoutOrder, 
                Size = UDim2.new(1, 0, 0, v17.TeamEntrySizeY), 
                Position = v16.props.Position, 
                BackgroundTransparency = l_Settings_0.PreferredTransparency * 0.5, 
                BackgroundColor3 = v20, 
                BorderSizePixel = 0
            }, v25);
        end);
    end);
end;
local function v31(v30) --[[ Line: 114 ]] --[[ Name: mapStateToProps ]]
    return {
        isSmallTouchDevice = v30.displayOptions.isSmallTouchDevice
    };
end;
if v14 then
    return v3.memo(v4.connect(v31, nil)(v15), v13({
        "gameStatNames", 
        "leaderstats"
    }));
else
    return v4.connect(v31, nil)(v15);
end;