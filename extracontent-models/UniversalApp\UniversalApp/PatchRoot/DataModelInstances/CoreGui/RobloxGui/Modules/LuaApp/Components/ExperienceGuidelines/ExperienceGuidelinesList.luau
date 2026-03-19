local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.t);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v4 = require(l_CorePackages_0.Packages.Roact);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v7.Style.withStyle;
local l_StyledTextLabel_0 = v7.App.Text.StyledTextLabel;
local l_AgeRecommendationDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).AgeRecommendations.AgeRecommendationDetails;
local v11 = v4.PureComponent:extend("ExperienceGuidelinesList");
v11.validateProps = v2.strictInterface({
    ageRecommendations = l_AgeRecommendationDetails_0.validateModel, 
    localization = v2.table, 
    layoutOrder = v2.optional(v2.number)
});
v11.init = function(v12) --[[ Line: 25 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), l_StyledTextLabel_0 (copy), l_memoize_0 (copy)
    v12.createDescriptorLabels = function(v13, v14) --[[ Line: 26 ]]
        -- upvalues: v4 (ref), l_StyledTextLabel_0 (ref)
        local v15 = {};
        for v16, v17 in ipairs(v14) do
            v15["Descriptor" .. v16] = v4.createElement(l_StyledTextLabel_0, {
                layoutOrder = v16 + 1, 
                fontStyle = v13.Font.Body, 
                colorStyle = v13.Theme.TextDefault, 
                size = UDim2.new(1, 0, 0, 0), 
                fluidSizing = false, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Center, 
                automaticSize = Enum.AutomaticSize.Y, 
                text = v17.displayName
            });
        end;
        return v15;
    end;
    v12.createContentList = function(v18, v19) --[[ Line: 45 ]]
        -- upvalues: v4 (ref), v12 (copy)
        local v20 = {
            Layout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = UDim.new(0, 8)
            })
        };
        local v21 = v12.createDescriptorLabels(v18, v19);
        for v22, v23 in pairs(v21) do
            v20[v22] = v23;
        end;
        return v20;
    end;
    v12.createDescriptors = l_memoize_0(function(v24) --[[ Line: 63 ]]
        local v25 = {};
        local l_descriptorUsages_0 = v24.descriptorUsages;
        if l_descriptorUsages_0 ~= nil then
            for v27, v28 in ipairs(l_descriptorUsages_0) do
                local l_descriptor_0 = v28.descriptor;
                if l_descriptor_0 then
                    v25[v27] = {
                        displayName = l_descriptor_0.displayName
                    };
                end;
            end;
        end;
        return v25;
    end);
end;
v11.render = function(v30) --[[ Line: 82 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v4 (copy), l_StyledTextLabel_0 (copy)
    local l_localization_0 = v30.props.localization;
    local l_ageRecommendations_0 = v30.props.ageRecommendations;
    local v33 = nil;
    local v34 = nil;
    if l_ageRecommendations_0 then
        v33 = v30.createDescriptors(l_ageRecommendations_0);
        local l_ageRecommendation_0 = l_ageRecommendations_0.summary.ageRecommendation;
        v34 = if l_ageRecommendation_0 then l_ageRecommendation_0.displayName else l_localization_0:Format("Feature.GameDetails.Label.Unavailable");
    else
        v33 = {};
        v34 = l_localization_0:Format("Feature.GameDetails.Label.Unavailable");
    end;
    return l_withStyle_0(function(v36) --[[ Line: 99 ]]
        -- upvalues: v30 (copy), v33 (ref), v4 (ref), l_StyledTextLabel_0 (ref), v34 (ref)
        local v37 = v30.createContentList(v36, v33);
        local l_layoutOrder_0 = v30.props.layoutOrder;
        return v4.createElement("Frame", {
            LayoutOrder = l_layoutOrder_0, 
            BackgroundColor3 = v36.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            MainLayout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = UDim.new(0, 24)
            }), 
            SummaryLabel = v4.createElement(l_StyledTextLabel_0, {
                layoutOrder = 1, 
                fontStyle = v36.Font.Title, 
                colorStyle = v36.Theme.TextEmphasis, 
                size = UDim2.new(1, 0, 0, 0), 
                fluidSizing = false, 
                textXAlignment = Enum.TextXAlignment.Center, 
                textYAlignment = Enum.TextYAlignment.Center, 
                automaticSize = Enum.AutomaticSize.Y, 
                text = v34
            }), 
            ListFrame = v4.createElement("Frame", {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 0), 
                BorderSizePixel = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Position = UDim2.fromOffset(0, 0), 
                BackgroundTransparency = 1
            }, v37)
        });
    end);
end;
return (l_RoactServices_0.connect({
    localization = v6
})(v11));