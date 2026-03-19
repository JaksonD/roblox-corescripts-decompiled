local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v2.Style.withStyle;
local l_Images_0 = v2.App.ImageSet.Images;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_usePlayerCountText_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).usePlayerCountText;
local v7 = require(l_CorePackages_0.Packages.Cryo);
local l_useAbbreviatedNumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useAbbreviatedNumberLocalization;
local v9 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_GameCardLayoutType_0 = v9.GameCardLayoutType;
local l_GameBasicStatsLayoutType_0 = v9.GameBasicStatsLayoutType;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v13 = require(l_Modules_0.LuaApp.Components.FitImageTextFrame);
local v14 = l_Images_0["icons/status/games/rating_small"];
local v15 = l_Images_0["icons/status/games/people-playing_small"];
local v16 = l_Images_0["icons/status/games/sessions_large"];
local v17 = {
    [l_GameBasicStatsLayoutType_0[l_GameCardLayoutType_0.Small]] = {
        Padding = 6, 
        TextSize = 14, 
        IconSize = 10, 
        IconTextPadding = 3
    }, 
    [l_GameBasicStatsLayoutType_0[l_GameCardLayoutType_0.Medium]] = {
        Padding = 12, 
        TextSize = 14, 
        IconSize = 10, 
        IconTextPadding = 3
    }, 
    [l_GameBasicStatsLayoutType_0[l_GameCardLayoutType_0.Large]] = {
        Padding = 12, 
        TextSize = 16, 
        IconSize = 12, 
        IconTextPadding = 3
    }, 
    [l_GameBasicStatsLayoutType_0.GameDetails] = {
        Padding = 13, 
        TextSize = 22, 
        IconSize = 17, 
        IconTextPadding = 5
    }
};
local v18 = v1.PureComponent:extend("GameBasicStats");
v18.init = function(v19) --[[ Line: 51 ]] --[[ Name: init ]]
    -- upvalues: v17 (copy)
    v19.getImageProps = function(v20, v21) --[[ Line: 52 ]]
        -- upvalues: v17 (ref), v19 (copy)
        local v22 = v17[v19.props.layoutType];
        return {
            Size = UDim2.new(0, v22.IconSize, 0, v22.IconSize), 
            Image = v20, 
            ImageColor3 = v21.Theme.TextMuted.Color, 
            ImageTransparency = v21.Theme.TextMuted.Transparency
        };
    end;
    v19.getTextProps = function(v23, v24) --[[ Line: 62 ]]
        -- upvalues: v17 (ref), v19 (copy)
        local v25 = v17[v19.props.layoutType];
        return {
            Text = v23, 
            Font = v24.Font.SubHeader1.Font, 
            TextSize = v25.TextSize, 
            TextColor3 = v24.Theme.TextMuted.Color, 
            TextTransparency = v24.Theme.TextMuted.Transparency
        };
    end;
end;
v18.render = function(v26) --[[ Line: 74 ]] --[[ Name: render ]]
    -- upvalues: v17 (copy), l_withStyle_0 (copy), v1 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy)
    local l_Position_0 = v26.props.Position;
    local l_LayoutOrder_0 = v26.props.LayoutOrder;
    local l_upVotes_0 = v26.props.upVotes;
    local l_downVotes_0 = v26.props.downVotes;
    local l_showGlobalCounters_0 = v26.props.showGlobalCounters;
    local l_visits_0 = v26.props.visits;
    local l_layoutType_0 = v26.props.layoutType;
    assert(l_layoutType_0 ~= nil, "GameBasicStats expects a layoutType props");
    local v34 = v17[l_layoutType_0];
    assert(v34 ~= nil, "GameBasicStats expects a supported layoutType props; was given: " .. l_layoutType_0);
    local l_playerCountText_0 = v26.props.playerCountText;
    local l_visitsText_0 = v26.props.visitsText;
    local v37 = "--";
    if l_upVotes_0 == nil or l_upVotes_0 < 0 then
        l_upVotes_0 = 0;
    end;
    if l_downVotes_0 == nil or l_downVotes_0 < 0 then
        l_downVotes_0 = 0;
    end;
    local v38 = l_upVotes_0 + l_downVotes_0;
    if v38 > 0 then
        v37 = math.floor(l_upVotes_0 / v38 * 100) .. "%";
    end;
    return l_withStyle_0(function(v39) --[[ Line: 108 ]]
        -- upvalues: v1 (ref), v34 (copy), l_Position_0 (copy), l_LayoutOrder_0 (copy), v13 (ref), v26 (copy), v14 (ref), v37 (ref), v15 (ref), l_playerCountText_0 (copy), l_showGlobalCounters_0 (copy), l_visits_0 (copy), v16 (ref), l_visitsText_0 (copy)
        return v1.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, v34.TextSize), 
            AutomaticSize = Enum.AutomaticSize.X, 
            Position = l_Position_0, 
            LayoutOrder = l_LayoutOrder_0, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            Layout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, v34.Padding)
            }), 
            VoteInfo = v1.createElement(v13, {
                LayoutOrder = 1, 
                padding = v34.IconTextPadding, 
                imageProps = v26.getImageProps(v14, v39), 
                textProps = v26.getTextProps(v37, v39)
            }), 
            PlayerCountInfo = v1.createElement(v13, {
                LayoutOrder = 2, 
                padding = v34.IconTextPadding, 
                imageProps = v26.getImageProps(v15, v39), 
                textProps = v26.getTextProps(l_playerCountText_0, v39)
            }), 
            VisitsInfo = l_showGlobalCounters_0 and l_visits_0 and v1.createElement(v13, {
                LayoutOrder = 3, 
                padding = v34.IconTextPadding, 
                imageProps = v26.getImageProps(v16, v39), 
                textProps = v26.getTextProps(l_visitsText_0, v39)
            })
        });
    end);
end;
local l_v18_0 = v18;
return (l_RoactAppPolicy_0.connect(function(v41, _) --[[ Line: 163 ]]
    return {
        showGlobalCounters = v41.getShowGlobalCounters()
    };
end)(function(v43) --[[ Line: 146 ]]
    -- upvalues: l_usePlayerCountText_0 (copy), l_useAbbreviatedNumberLocalization_0 (copy), v1 (copy), l_v18_0 (copy), v7 (copy)
    local l_playerCount_0 = v43.playerCount;
    local l_visits_1 = v43.visits;
    local v46 = l_usePlayerCountText_0(l_playerCount_0);
    local v47 = l_useAbbreviatedNumberLocalization_0(l_visits_1);
    return v1.createElement(l_v18_0, v7.Dictionary.join(v43, {
        playerCountText = v46, 
        visitsText = v47
    }));
end));