local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_Skeleton_0 = require(l_CorePackages_0.Packages.Foundation).Skeleton;
local l_FitTextLabel_0 = require(l_CorePackages_0.Packages.AvatarExperienceDeps).RoactFitComponents.FitTextLabel;
local l_withStyle_0 = v4.Style.withStyle;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v11 = v2.PureComponent:extend("ResultsHeader");
v11.renderWithStyle = function(v12, v13) --[[ Line: 25 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v2 (copy), l_Skeleton_0 (copy), l_withLocalization_0 (copy), l_FitTextLabel_0 (copy)
    local l_Font_0 = v13.Font;
    local l_Font_1 = l_Font_0.Body.Font;
    local v16 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local l_Font_2 = l_Font_0.Header2.Font;
    local v18 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local l_Theme_0 = v13.Theme;
    local l_Color_0 = l_Theme_0.TextEmphasis.Color;
    local l_Transparency_0 = l_Theme_0.TextEmphasis.Transparency;
    local l_searchInCatalog_0 = v12.props.searchInCatalog;
    if not l_searchInCatalog_0 then
        return v2.createElement(l_Skeleton_0, {
            Size = UDim2.new(1, 0, 0, v16)
        });
    else
        local l_keyword_0 = l_searchInCatalog_0.keyword;
        return l_withLocalization_0({
            showingResultsFor = "Feature.GamePage.LabelShowingResultsFor"
        })(function(v24) --[[ Line: 49 ]]
            -- upvalues: v2 (ref), v16 (copy), l_FitTextLabel_0 (ref), l_Color_0 (copy), l_Transparency_0 (copy), l_Font_1 (copy), l_keyword_0 (copy), v18 (copy), l_Font_2 (copy)
            return v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v16), 
                LayoutOrder = 1
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 2)
                }), 
                ShowingResultsText = v2.createElement(l_FitTextLabel_0, {
                    width = l_FitTextLabel_0.Width.FitToText, 
                    Text = v24.showingResultsFor, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(0, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    TextSize = v16, 
                    TextColor3 = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    Font = l_Font_1, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top
                }), 
                Keyword = v2.createElement(l_FitTextLabel_0, {
                    width = l_FitTextLabel_0.Width.FitToText, 
                    Text = l_keyword_0 or "", 
                    LayoutOrder = 2, 
                    Size = UDim2.new(0, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    TextSize = v18, 
                    TextColor3 = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    Font = l_Font_2, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top
                })
            });
        end);
    end;
end;
v11.render = function(v25) --[[ Line: 97 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v26) --[[ Line: 98 ]]
        -- upvalues: v25 (copy)
        return v25:renderWithStyle(v26);
    end);
end;
return v3.connect(function(v27, v28) --[[ Line: 103 ]] --[[ Name: mapStateToProps ]]
    return {
        searchInCatalog = v27.Search.SearchesInCatalog[v28.searchUuid]
    };
end, nil)(v11);