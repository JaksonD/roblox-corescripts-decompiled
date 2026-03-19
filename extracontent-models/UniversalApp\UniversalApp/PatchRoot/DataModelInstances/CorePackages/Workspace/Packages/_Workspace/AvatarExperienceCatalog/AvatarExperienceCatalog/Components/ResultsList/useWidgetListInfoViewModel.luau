local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Cryo);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v6 = require(l_Parent_0.Responsive);
local v7 = v6.GetInputModeStore(false);
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local l_FFlagAXCatalogItemCardFooterBackendDriven_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXCatalogItemCardFooterBackendDriven;
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAXNoCarouselsOnCatalogWithGamepad);
local _ = require(l_script_FirstAncestor_0.Models.WidgetListInfo);
local _ = require(script.Parent.WidgetListInfoViewModel);
local v13 = require(script.Parent.WidgetListBreakPointEnum);
local v14 = {
    {
        contentType = "ItemName"
    }, 
    {
        contentType = "Price"
    }, 
    {
        contentType = "AgentName"
    }
};
local v15 = {
    type = "Carousel", 
    numItemsToShow = 12, 
    itemFooters = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then v14 else {
        {
            contentType = "ItemName"
        }, 
        {
            contentType = "Price"
        }
    }, 
    previewRows = {
        default = 1
    }, 
    previewColumns = {
        default = 3, 
        medium = 4, 
        large = 5, 
        xLarge = 7, 
        x2Large = 9
    }
};
local v16 = {
    type = "ItemGroup", 
    itemFooters = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then v14 else {
        {
            contentType = "ItemName"
        }, 
        {
            contentType = "Price"
        }
    }, 
    previewRows = {
        default = 1
    }, 
    previewColumns = {
        default = 3, 
        medium = 4, 
        large = 5, 
        xLarge = 7, 
        x2Large = 9
    }
};
local v17 = {
    Default = "default", 
    XSmall = "xSmall", 
    Small = "small", 
    Medium = "medium", 
    Large = "large", 
    XLarge = "xLarge", 
    X2Large = "x2Large", 
    Landscape = "landscape", 
    Portrait = "portrait"
};
local v18 = {
    Dark = "dark", 
    Light = "light", 
    Default = "default"
};
local function v23(v19) --[[ Line: 75 ]] --[[ Name: getQueryStringForSearchWidgets ]]
    if not v19 or not v19.searchKeyword then
        return nil;
    else
        local v20 = {
            v19.searchKeyword
        };
        if v19.sortAndFilters and v19.sortAndFilters.SelectedTopics then
            for _, v22 in v19.sortAndFilters.SelectedTopics do
                table.insert(v20, 1, v22);
            end;
        end;
        return table.concat(v20, " ");
    end;
end;
local function _(v24) --[[ Line: 90 ]] --[[ Name: getDefaultItemGroupTemplate ]]
    -- upvalues: v4 (copy), v16 (copy)
    if v24 and v24.defaultItemGroupTemplate then
        return v4.Dictionary.join(v16, v24.defaultItemGroupTemplate);
    elseif v24 and v24.defaultTemplate then
        return v4.Dictionary.join(v16, v24.defaultTemplate);
    else
        return v16;
    end;
end;
local function _(v26) --[[ Line: 101 ]] --[[ Name: getDefaultCarouselTemplate ]]
    -- upvalues: v4 (copy), v15 (copy)
    if v26 and v26.defaultItemCarouselTemplate then
        return v4.Dictionary.join(v15, v26.defaultItemCarouselTemplate);
    else
        return v15;
    end;
end;
local function _(v28, v29) --[[ Line: 108 ]] --[[ Name: getResponsiveValue ]]
    -- upvalues: v17 (copy)
    if not v28 then
        return nil;
    else
        local v30 = if v29 and v17[v29] then v17[v29] else "default";
        if v28[v30] then
            return v28[v30];
        else
            return v28.default;
        end;
    end;
end;
local function _(v32, v33) --[[ Line: 116 ]] --[[ Name: getThemeValue ]]
    -- upvalues: v18 (copy)
    if not v32 then
        return nil;
    else
        local v34 = if v33 and v18[v33] then v18[v33] else "default";
        if v32[v34] then
            return v32[v34];
        else
            return v32.default;
        end;
    end;
end;
local function v37(v36) --[[ Line: 124 ]] --[[ Name: colorToColor3 ]]
    return Color3.new(v36.r, v36.g, v36.b);
end;
local function v39(v38) --[[ Line: 128 ]] --[[ Name: pointToVector2 ]]
    return Vector2.new(v38.x, v38.y);
end;
local function v41(v40) --[[ Line: 132 ]] --[[ Name: pointToUDim2 ]]
    return UDim2.fromOffset(v40.x, v40.y);
end;
local function _(v42, v43) --[[ Line: 136 ]] --[[ Name: formatResponsivePointToVector ]]
    -- upvalues: v17 (copy), v39 (copy)
    local v44;
    if not v42 then
        v44 = nil;
    else
        local v45 = if v43 and v17[v43] then v17[v43] else "default";
        v44 = if v42[v45] then v42[v45] else v42.default;
    end;
    return v39(if v44 then v44 else {
        x = 0, 
        y = 0
    });
end;
local function _(v47, v48) --[[ Line: 144 ]] --[[ Name: formatResponsivePointToUDim2 ]]
    -- upvalues: v17 (copy), v41 (copy)
    local v49;
    if not v47 then
        v49 = nil;
    else
        local v50 = if v48 and v17[v48] then v17[v48] else "default";
        v49 = if v47[v50] then v47[v50] else v47.default;
    end;
    return v41(if v49 then v49 else {
        x = 0, 
        y = 0
    });
end;
local function v56(v52) --[[ Line: 152 ]] --[[ Name: formatColorSequence ]]
    -- upvalues: v37 (copy)
    local v53 = {};
    for _, v55 in v52 do
        table.insert(v53, ColorSequenceKeypoint.new(v55.time, v37(v55.color)));
    end;
    return ColorSequence.new(v53);
end;
local function v61(v57) --[[ Line: 160 ]] --[[ Name: formatNumberSequence ]]
    if type(v57) == "number" then
        return NumberSequence.new(v57);
    elseif #v57 == 0 then
        return nil;
    else
        local v58 = {};
        for _, v60 in v57 do
            table.insert(v58, NumberSequenceKeypoint.new(v60.time, v60.number));
        end;
        return NumberSequence.new(v58);
    end;
end;
local function v81(v62, v63) --[[ Line: 174 ]] --[[ Name: formatImageBackground ]]
    -- upvalues: v17 (copy)
    local v64;
    if v62.anchorPoint then
        local l_anchorPoint_0 = v62.anchorPoint;
        local v66;
        if not l_anchorPoint_0 then
            v66 = nil;
        else
            local v67 = if v63 and v17[v63] then v17[v63] else "default";
            v66 = if l_anchorPoint_0[v67] then l_anchorPoint_0[v67] else l_anchorPoint_0.default;
        end;
        local v68 = if v66 then v66 else {
            x = 0, 
            y = 0
        };
        v64 = Vector2.new(v68.x, v68.y);
    else
        v64 = nil;
    end;
    local v69;
    if v62.position then
        local l_position_0 = v62.position;
        local v71;
        if not l_position_0 then
            v71 = nil;
        else
            local v72 = if v63 and v17[v63] then v17[v63] else "default";
            v71 = if l_position_0[v72] then l_position_0[v72] else l_position_0.default;
        end;
        local v73 = if v71 then v71 else {
            x = 0, 
            y = 0
        };
        v69 = UDim2.fromOffset(v73.x, v73.y);
    else
        v69 = nil;
    end;
    local v74 = {
        type = "ImageBackground"
    };
    local v75;
    if v62.resourceIdentifier then
        local l_resourceIdentifier_0 = v62.resourceIdentifier;
        if not l_resourceIdentifier_0 then
            v75 = nil;
        else
            local v77 = if v63 and v17[v63] then v17[v63] else "default";
            v75 = if l_resourceIdentifier_0[v77] then l_resourceIdentifier_0[v77] else l_resourceIdentifier_0.default;
        end;
    else
        v75 = nil;
    end;
    v74.resourceIdentifier = v75;
    if v62.color then
        local l_color_0 = v62.color;
        v75 = Color3.new(l_color_0.r, l_color_0.g, l_color_0.b);
    else
        v75 = nil;
    end;
    v74.color = v75;
    v74.anchorPoint = v64;
    v74.position = v69;
    if v62.transparency then
        local l_transparency_0 = v62.transparency;
        if not l_transparency_0 then
            v75 = nil;
        else
            local v80 = if v63 and v17[v63] then v17[v63] else "default";
            v75 = if l_transparency_0[v80] then l_transparency_0[v80] else l_transparency_0.default;
        end;
    else
        v75 = nil;
    end;
    v74.transparency = v75;
    return v74;
end;
local function v86(v82) --[[ Line: 198 ]] --[[ Name: formatGradientBackground ]]
    -- upvalues: v56 (copy), v61 (copy)
    local v83 = {
        type = "GradientBackground", 
        colorSequence = v56(v82.colorSequence), 
        rotation = v82.rotation, 
        transparency = if v82.transparency then v61(v82.transparency) else nil
    };
    local v84;
    if v82.offset then
        local l_offset_0 = v82.offset;
        v84 = Vector2.new(l_offset_0.x, l_offset_0.y);
    else
        v84 = nil;
    end;
    v83.offset = v84;
    return v83;
end;
local function v95(v87, v88, v89) --[[ Line: 212 ]] --[[ Name: getFormattedBackgroundLayers ]]
    -- upvalues: v18 (copy), v81 (copy), v86 (copy)
    local v90;
    if not v87 then
        v90 = nil;
    else
        local v91 = if v89 and v18[v89] then v18[v89] else "default";
        v90 = if v87[v91] then v87[v91] else v87.default;
    end;
    if not v90 then
        v90 = {};
    end;
    local v92 = {};
    for _, v94 in v90 do
        if v94.type == "ImageBackground" then
            table.insert(v92, (v81(v94, v88)));
        elseif v94.type == "GradientBackground" then
            table.insert(v92, (v86(v94)));
        end;
    end;
    return v92;
end;
local function _(v96, v97, v98) --[[ Line: 229 ]] --[[ Name: formatCardStyle ]]
    -- upvalues: v95 (copy)
    return {
        backgroundLayers = if v96.backgroundLayers then v95(v96.backgroundLayers, v97, v98) else nil, 
        thumbnailAspectRatio = v96.thumbnailAspectRatio
    };
end;
local function _(v100, v101, v102) --[[ Line: 242 ]] --[[ Name: formatWidgetStyle ]]
    -- upvalues: v95 (copy)
    return {
        backgroundLayers = if v100.backgroundLayers then v95(v100.backgroundLayers, v101, v102) else nil
    };
end;
local function v115(v104, v105, v106) --[[ Line: 254 ]] --[[ Name: formatWidgetTemplateAsItemGroup ]]
    -- upvalues: v17 (copy), v95 (copy)
    local l_previewColumns_0 = v104.previewColumns;
    local v108;
    if not l_previewColumns_0 then
        v108 = nil;
    else
        local v109 = if v105 and v17[v105] then v17[v105] else "default";
        v108 = if l_previewColumns_0[v109] then l_previewColumns_0[v109] else l_previewColumns_0.default;
    end;
    local v110 = v108 or 1;
    local l_previewRows_0 = v104.previewRows;
    if not l_previewRows_0 then
        l_previewColumns_0 = nil;
    else
        local v112 = if v105 and v17[v105] then v17[v105] else "default";
        l_previewColumns_0 = if l_previewRows_0[v112] then l_previewRows_0[v112] else l_previewRows_0.default;
    end;
    v108 = l_previewColumns_0 or 1;
    l_previewColumns_0 = {
        type = "ItemGroup", 
        seeAllButton = v104.seeAllButton, 
        title = v104.title, 
        localizedTitle = v104.localizedTitle, 
        description = v104.description, 
        localizedDescription = v104.localizedDescription, 
        itemFooters = v104.itemFooters
    };
    if v104.widgetStyle then
        local l_widgetStyle_0 = v104.widgetStyle;
        l_previewRows_0 = {
            backgroundLayers = if l_widgetStyle_0.backgroundLayers then v95(l_widgetStyle_0.backgroundLayers, v105, v106) else nil
        };
    else
        l_previewRows_0 = nil;
    end;
    l_previewColumns_0.widgetStyle = l_previewRows_0;
    if v104.cardStyle then
        local l_cardStyle_0 = v104.cardStyle;
        l_previewRows_0 = {
            backgroundLayers = if l_cardStyle_0.backgroundLayers then v95(l_cardStyle_0.backgroundLayers, v105, v106) else nil, 
            thumbnailAspectRatio = l_cardStyle_0.thumbnailAspectRatio
        };
    else
        l_previewRows_0 = nil;
    end;
    l_previewColumns_0.cardStyle = l_previewRows_0;
    l_previewColumns_0.previewRows = v108;
    l_previewColumns_0.previewColumns = v110;
    return l_previewColumns_0;
end;
local function v127(v116, v117, v118) --[[ Line: 276 ]] --[[ Name: formatWidgetTemplateAsCarousel ]]
    -- upvalues: v17 (copy), v95 (copy)
    local l_previewColumns_1 = v116.previewColumns;
    local v120;
    if not l_previewColumns_1 then
        v120 = nil;
    else
        local v121 = if v117 and v17[v117] then v17[v117] else "default";
        v120 = if l_previewColumns_1[v121] then l_previewColumns_1[v121] else l_previewColumns_1.default;
    end;
    local v122 = v120 or 1;
    local l_previewRows_1 = v116.previewRows;
    if not l_previewRows_1 then
        l_previewColumns_1 = nil;
    else
        local v124 = if v117 and v17[v117] then v17[v117] else "default";
        l_previewColumns_1 = if l_previewRows_1[v124] then l_previewRows_1[v124] else l_previewRows_1.default;
    end;
    v120 = l_previewColumns_1 or 1;
    l_previewColumns_1 = {
        type = "Carousel", 
        numItemsToShow = v116.numItemsToShow, 
        seeAllButton = v116.seeAllButton, 
        title = v116.title, 
        localizedTitle = v116.localizedTitle, 
        description = v116.description, 
        localizedDescription = v116.localizedDescription, 
        itemFooters = v116.itemFooters
    };
    if v116.widgetStyle then
        local l_widgetStyle_1 = v116.widgetStyle;
        l_previewRows_1 = {
            backgroundLayers = if l_widgetStyle_1.backgroundLayers then v95(l_widgetStyle_1.backgroundLayers, v117, v118) else nil
        };
    else
        l_previewRows_1 = nil;
    end;
    l_previewColumns_1.widgetStyle = l_previewRows_1;
    if v116.cardStyle then
        local l_cardStyle_1 = v116.cardStyle;
        l_previewRows_1 = {
            backgroundLayers = if l_cardStyle_1.backgroundLayers then v95(l_cardStyle_1.backgroundLayers, v117, v118) else nil, 
            thumbnailAspectRatio = l_cardStyle_1.thumbnailAspectRatio
        };
    else
        l_previewRows_1 = nil;
    end;
    l_previewColumns_1.cardStyle = l_previewRows_1;
    l_previewColumns_1.previewRows = v120;
    l_previewColumns_1.previewColumns = v122;
    return l_previewColumns_1;
end;
local function v132(v128, v129) --[[ Line: 299 ]] --[[ Name: mergeCardStyle ]]
    -- upvalues: v4 (copy)
    if not v128 and not v129 then
        return nil;
    else
        local v130 = if v129 then v129.thumbnailAspectRatio else nil;
        local v131 = if v128 then v128.thumbnailAspectRatio else nil;
        return {
            thumbnailAspectRatio = if v130 == nil then v131 else v130, 
            backgroundLayers = v4.Dictionary.join(if v128 and v128.backgroundLayers then v128.backgroundLayers else {}, if v129 and v129.backgroundLayers then v129.backgroundLayers else {})
        };
    end;
end;
local function v135(v133, v134) --[[ Line: 315 ]] --[[ Name: mergeWidgetStyle ]]
    -- upvalues: v4 (copy)
    if not v133 and not v134 then
        return nil;
    else
        return {
            backgroundLayers = v4.Dictionary.join(if v133 and v133.backgroundLayers then v133.backgroundLayers else {}, if v134 and v134.backgroundLayers then v134.backgroundLayers else {})
        };
    end;
end;
local function v138(v136, v137) --[[ Line: 330 ]] --[[ Name: mergeItemGroupTemplates ]]
    -- upvalues: v135 (copy), v132 (copy), v4 (copy)
    return {
        type = "ItemGroup", 
        seeAllButton = if v137.seeAllButton == nil then v136.seeAllButton else v137.seeAllButton, 
        title = if v137.title == nil then v136.title else v137.title, 
        localizedTitle = if v137.localizedTitle == nil then v136.localizedTitle else v137.localizedTitle, 
        description = if v137.description == nil then v136.description else v137.description, 
        localizedDescription = if v137.localizedDescription == nil then v136.localizedDescription else v137.localizedDescription, 
        itemFooters = if v137.itemFooters == nil then v136.itemFooters else v137.itemFooters, 
        widgetStyle = v135(v136.widgetStyle, v137.widgetStyle), 
        cardStyle = v132(v136.cardStyle, v137.cardStyle), 
        previewRows = v4.Dictionary.join(v136.previewRows or {}, v137.previewRows or {}), 
        previewColumns = v4.Dictionary.join(v136.previewColumns or {}, v137.previewColumns or {})
    };
end;
local function v141(v139, v140) --[[ Line: 349 ]] --[[ Name: mergeCarouselTemplates ]]
    -- upvalues: v135 (copy), v132 (copy), v4 (copy)
    return {
        type = "Carousel", 
        numItemsToShow = if v140.numItemsToShow == nil then v139.numItemsToShow else v140.numItemsToShow, 
        seeAllButton = if v140.seeAllButton == nil then v139.seeAllButton else v140.seeAllButton, 
        title = if v140.title == nil then v139.title else v140.title, 
        localizedTitle = if v140.localizedTitle == nil then v139.localizedTitle else v140.localizedTitle, 
        description = if v140.description == nil then v139.description else v140.description, 
        localizedDescription = if v140.localizedDescription == nil then v139.localizedDescription else v140.localizedDescription, 
        itemFooters = if v140.itemFooters == nil then v139.itemFooters else v140.itemFooters, 
        widgetStyle = v135(v139.widgetStyle, v140.widgetStyle), 
        cardStyle = v132(v139.cardStyle, v140.cardStyle), 
        previewRows = v4.Dictionary.join(v139.previewRows or {}, v140.previewRows or {}), 
        previewColumns = v4.Dictionary.join(v139.previewColumns or {}, v140.previewColumns or {})
    };
end;
local function _(v142) --[[ Line: 369 ]] --[[ Name: convertCarouselTemplateToItemGroupTemplate ]]
    local v143 = table.clone(v142);
    v143.type = "ItemGroup";
    v143.numItemsToShow = nil;
    return v143;
end;
local function v160(v145, v146, v147, v148) --[[ Line: 378 ]] --[[ Name: formatWidgetListStateToWidgetListInfoViewModel ]]
    -- upvalues: v10 (copy), v6 (copy), v4 (copy), v15 (copy), v16 (copy), v127 (copy), v141 (copy), v115 (copy), v138 (copy)
    local v149 = {
        configuration = {}, 
        widgets = {}
    };
    local v150 = if v145 then v145.Configuration else nil;
    local v151 = if v10 then v148 ~= v6.Input.Directional else nil;
    local v152 = if v150 and v150.defaultItemCarouselTemplate then v4.Dictionary.join(v15, v150.defaultItemCarouselTemplate) else v15;
    local v153 = if v150 and v150.defaultItemGroupTemplate then v4.Dictionary.join(v16, v150.defaultItemGroupTemplate) else if v150 and v150.defaultTemplate then v4.Dictionary.join(v16, v150.defaultTemplate) else v16;
    if v145 and v145.Details then
        for v154, v155 in v145.Details do
            local v156;
            if v10 then
                if v155.template.type == "Carousel" and not v151 then
                    local l_template_0 = v155.template;
                    local v158 = table.clone(l_template_0);
                    v158.type = "ItemGroup";
                    v158.numItemsToShow = nil;
                    v156 = v158;
                else
                    v156 = v155.template;
                end;
            else
                v156 = nil;
            end;
            local v159 = if if v10 then v156.type == "Carousel" else v155.template.type == "Carousel" then v127(v141(v152, if v10 then v156 else v155.template), v146, v147) else v115(v138(v153, if v10 then v156 else v155.template), v146, v147);
            v149.widgets[v154] = {
                id = v155.id, 
                type = v155.type, 
                content = v155.content, 
                tagId = v155.tagId, 
                template = v159, 
                requestId = v145.RequestId
            };
        end;
    end;
    if v150 then
        v149.configuration.customizedDataMap = v150.customizedDataMap;
    end;
    v149.configuration.defaultItemGroupTemplate = v115(v153, v146, v147);
    v149.configuration.defaultItemCarouselTemplate = v127(v152, v146, v147);
    return v149;
end;
return function(v161, v162, v163) --[[ Line: 453 ]] --[[ Name: useWidgetListInfoViewModel ]]
    -- upvalues: v13 (copy), v10 (copy), l_useSignalState_0 (copy), v7 (copy), v3 (copy), v23 (copy), l_useSelector_0 (copy), l_useTokens_0 (copy), v160 (copy)
    local v164 = v163 or v13.Default;
    local v165 = if v10 then l_useSignalState_0(v7.getLastInputType) else nil;
    local v170 = v3.useCallback(function(v166) --[[ Line: 462 ]]
        -- upvalues: v161 (copy), v23 (ref), v162 (copy)
        local v167 = v166.SearchesParameters[v161];
        local v168 = v167 and v167.searchKeyword ~= nil;
        local v169 = v23(v167);
        if v168 then
            return v166.AvatarExperience.Common.Widgets.SearchPageWidgetInfo[v169];
        elseif v162 then
            return v166.AvatarExperience.Common.Widgets.ContextWidgetInfo[v162];
        else
            return v166.AvatarExperience.Common.Widgets.WidgetInfo;
        end;
    end, {
        v161, 
        v162
    });
    local v171 = l_useSelector_0(v170);
    local v172 = l_useTokens_0();
    return (v3.useMemo(function() --[[ Line: 478 ]]
        -- upvalues: v160 (ref), v171 (copy), v164 (copy), v172 (copy), v10 (ref), v165 (copy)
        return (v160(v171, v164, v172.Config.ColorMode.Name, if v10 then v165 else nil));
    end, {
        v172.Config.ColorMode.Name, 
        v171, 
        v164, 
        if v10 then v165 else nil
    }));
end;