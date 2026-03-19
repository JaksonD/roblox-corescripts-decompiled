local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v8 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_withStyle_0 = v5.Style.withStyle;
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v12 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearAnimationPreview);
local v13 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAnimationPreview);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v18 = {
    {
        AssetType = v11.AssetTypeIdStrings.IdleAnimation, 
        Label = "Feature.Avatar.Label.Idle"
    }, 
    {
        AssetType = v11.AssetTypeIdStrings.WalkAnimation, 
        Label = "Feature.Avatar.Label.Walk"
    }, 
    {
        AssetType = v11.AssetTypeIdStrings.RunAnimation, 
        Label = "Feature.Avatar.Label.Run"
    }, 
    {
        AssetType = v11.AssetTypeIdStrings.JumpAnimation, 
        Label = "Feature.Avatar.Label.Jump"
    }, 
    {
        AssetType = v11.AssetTypeIdStrings.FallAnimation, 
        Label = "Feature.Avatar.Label.Fall"
    }, 
    {
        AssetType = v11.AssetTypeIdStrings.ClimbAnimation, 
        Label = "Feature.Avatar.Label.Climb"
    }, 
    {
        AssetType = v11.AssetTypeIdStrings.SwimAnimation, 
        Label = "Feature.Avatar.Label.Swim"
    }
};
local v19 = v3.PureComponent:extend("AnimationTabs");
v19.init = function(v20) --[[ Line: 77 ]] --[[ Name: init ]]
    v20.isMounted = false;
    v20.isRunningLoop = false;
    v20.validPreviews = {};
    v20.state = {
        previewIndex = 0
    };
end;
v19.updateValidPreviews = function(v21) --[[ Line: 87 ]] --[[ Name: updateValidPreviews ]]
    -- upvalues: v18 (copy)
    local l_assetInfosByAssetType_0 = v21.props.assetInfosByAssetType;
    if l_assetInfosByAssetType_0 then
        local v23 = {};
        for _, v25 in v18 do
            if l_assetInfosByAssetType_0[v25.AssetType] then
                v23[#v23 + 1] = v25;
            end;
        end;
        v21.validPreviews = v23;
        return;
    else
        v21.validPreviews = {};
        return;
    end;
end;
v19.startPreviewLoop = function(v26) --[[ Line: 103 ]] --[[ Name: startPreviewLoop ]]
    if v26.isRunningLoop then
        return;
    else
        v26.isRunningLoop = true;
        spawn(function() --[[ Line: 110 ]]
            -- upvalues: v26 (copy)
            if v26.isMounted and v26.state.previewIndex == 0 then
                v26:setState({
                    previewIndex = 1
                });
            end;
            while true do
                wait(2);
                if v26.isMounted then
                    local l_validPreviews_0 = v26.validPreviews;
                    local v28 = v26.state.previewIndex + 1;
                    if #l_validPreviews_0 < v28 then
                        v28 = 1;
                    end;
                    v26:setState({
                        previewIndex = v28
                    });
                else
                    break;
                end;
            end;
            v26.isRunningLoop = false;
        end);
        return;
    end;
end;
v19.renderWithStyle = function(v29, v30) --[[ Line: 140 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v3 (copy), l_withLocalization_0 (copy)
    if not v29.props.assetInfosByAssetType then
        return;
    else
        local l_previewIndex_0 = v29.state.previewIndex;
        local l_validPreviews_1 = v29.validPreviews;
        local v33 = l_validPreviews_1[l_previewIndex_0];
        if not v33 then
            return;
        else
            local l_Font_0 = v30.Font;
            local l_Theme_0 = v30.Theme;
            local l_Font_1 = l_Font_0.SubHeader1.Font;
            local v37 = l_Font_0.BaseSize * l_Font_0.SubHeader1.RelativeSize;
            local v38 = 1 / #l_validPreviews_1;
            local v39 = {};
            for v40 = 1, #l_validPreviews_1 do
                local v41 = l_previewIndex_0 == v40;
                v39[v40] = v3.createElement("Frame", {
                    AnchorPoint = Vector2.new(1, 0), 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(v38, 0, 1, 0), 
                    Position = UDim2.new(v38 * v40, 0, 0, 0)
                }, {
                    Tab = v3.createElement("Frame", {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BorderSizePixel = 0, 
                        BackgroundColor3 = v41 and l_Theme_0.UIEmphasis.Color or l_Theme_0.UIMuted.Color, 
                        Transparency = v41 and l_Theme_0.UIEmphasis.Transparency or l_Theme_0.UIMuted.Transparency, 
                        Size = UDim2.new(1, -4, 0, 6), 
                        Position = UDim2.new(0.5, 0, 0.5, 0)
                    })
                });
            end;
            return l_withLocalization_0({
                labelText = v33.Label
            })(function(v42) --[[ Line: 186 ]]
                -- upvalues: v3 (ref), v39 (copy), l_Font_1 (copy), v37 (copy), l_Theme_0 (copy)
                return v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    ListLayout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 0)
                    }), 
                    Tabs = v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 20), 
                        LayoutOrder = 1
                    }, v39), 
                    Label = v3.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, -4, 0, 20), 
                        Text = v42.labelText, 
                        Font = l_Font_1, 
                        TextSize = v37, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        TextWrapped = true, 
                        LayoutOrder = 2
                    })
                });
            end);
        end;
    end;
end;
v19.render = function(v43) --[[ Line: 224 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v44) --[[ Line: 225 ]]
        -- upvalues: v43 (copy)
        return v43:renderWithStyle(v44);
    end);
end;
v19.didUpdate = function(v45, v46, v47) --[[ Line: 230 ]] --[[ Name: didUpdate ]]
    local l_assetInfosByAssetType_1 = v46.assetInfosByAssetType;
    local l_assetInfosByAssetType_2 = v45.props.assetInfosByAssetType;
    if l_assetInfosByAssetType_2 ~= l_assetInfosByAssetType_1 then
        v45:updateValidPreviews();
    end;
    if not l_assetInfosByAssetType_1 and l_assetInfosByAssetType_2 then
        v45:startPreviewLoop();
    end;
    local l_previewIndex_1 = v47.previewIndex;
    local l_previewIndex_2 = v45.state.previewIndex;
    if l_previewIndex_1 ~= l_previewIndex_2 then
        local v52 = v45.validPreviews[l_previewIndex_2];
        local v53 = if v52 then l_assetInfosByAssetType_2[v52.AssetType] else nil;
        if v53 then
            v45.props.setAnimationPreview(v53.id, v52.AssetType);
        end;
    end;
end;
v19.didMount = function(v54) --[[ Line: 256 ]] --[[ Name: didMount ]]
    -- upvalues: v11 (copy)
    v54.isMounted = true;
    if v54.props.assetInfosByAssetType then
        v54:updateValidPreviews();
        v54:startPreviewLoop();
        return;
    else
        local l_analytics_0 = v54.props.analytics;
        local l_networking_0 = v54.props.networking;
        for _, v58 in v54.props.assetIds do
            v54.props.fetchItemDetails(l_networking_0, l_analytics_0, v58, v11.ItemType.Asset);
        end;
        return;
    end;
end;
v19.willUnmount = function(v59) --[[ Line: 273 ]] --[[ Name: willUnmount ]]
    v59.props.clearAnimationPreview();
    v59.isMounted = false;
end;
local function v65(v60) --[[ Line: 278 ]] --[[ Name: getAssetIds ]]
    -- upvalues: v11 (copy)
    local v61 = {};
    local l_itemData_0 = v60.itemData;
    if l_itemData_0 and l_itemData_0.items then
        for _, v64 in l_itemData_0.items do
            if v64.type == v11.ItemType.Asset then
                v61[#v61 + 1] = v64.id;
            end;
        end;
    end;
    return v61;
end;
local function v75(v66, v67) --[[ Line: 293 ]] --[[ Name: getAssetInfosByAssetType ]]
    -- upvalues: v65 (copy)
    local v68 = v65(v67);
    local l_AssetInfos_0 = v66.AvatarExperience.Common.AssetInfos;
    local v70 = {};
    local v71 = false;
    for _, v73 in v68 do
        local v74 = l_AssetInfos_0[v73];
        if not v74 then
            return nil;
        elseif not v74.assetType then
            return nil;
        else
            assert(v74.assetType, "silence type checker");
            v70[v74.assetType] = v74;
            v71 = true;
        end;
    end;
    return v71 and v70 or nil;
end;
local function v78(v76, v77) --[[ Line: 319 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v65 (copy), v75 (copy)
    return {
        assetIds = v65(v77), 
        assetInfosByAssetType = v75(v76, v77)
    };
end;
local function v86(v79) --[[ Line: 326 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v14 (copy), v12 (copy), v13 (copy)
    return {
        fetchItemDetails = function(v80, v81, v82, v83) --[[ Line: 328 ]] --[[ Name: fetchItemDetails ]]
            -- upvalues: v79 (copy), v14 (ref)
            return v79(v14(v80, v81, v82, v83));
        end, 
        clearAnimationPreview = function() --[[ Line: 332 ]] --[[ Name: clearAnimationPreview ]]
            -- upvalues: v79 (copy), v12 (ref)
            return v79(v12());
        end, 
        setAnimationPreview = function(v84, v85) --[[ Line: 336 ]] --[[ Name: setAnimationPreview ]]
            -- upvalues: v79 (copy), v13 (ref)
            return v79(v13(v84, v85));
        end
    };
end;
v19 = l_RoactServices_0.connect({
    analytics = v6, 
    networking = v8
})(v19);
return v4.connect(v78, v86)(v19);