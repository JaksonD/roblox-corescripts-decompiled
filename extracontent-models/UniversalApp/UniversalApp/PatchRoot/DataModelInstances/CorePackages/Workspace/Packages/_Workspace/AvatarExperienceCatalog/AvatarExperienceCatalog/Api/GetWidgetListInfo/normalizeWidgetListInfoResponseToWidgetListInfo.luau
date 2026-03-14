local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_normalize_0 = require(l_Parent_0.AvatarExperienceCommon).Utils.normalize;
local l_normalizeBoolean_0 = l_normalize_0.normalizeBoolean;
local l_normalizeString_0 = l_normalize_0.normalizeString;
local l_normalizeNumber_0 = l_normalize_0.normalizeNumber;
local l_normalizeStringToBoolean_0 = l_normalize_0.normalizeStringToBoolean;
local l_makeNormalizeTableFn_0 = l_normalize_0.makeNormalizeTableFn;
local l_makeNormalizeListFn_0 = l_normalize_0.makeNormalizeListFn;
local l_makeNormalizeUnionFn_0 = l_normalize_0.makeNormalizeUnionFn;
local l_makeNormalizeValueFn_0 = l_normalize_0.makeNormalizeValueFn;
local l_makeRequired_0 = l_normalize_0.makeRequired;
local _ = require(l_script_FirstAncestor_0.Models.WidgetListInfo);
local function _(v13) --[[ Line: 27 ]] --[[ Name: makeNormalizeResponsiveValueFn ]]
    -- upvalues: l_makeNormalizeTableFn_0 (copy)
    return l_makeNormalizeTableFn_0({
        default = v13, 
        xSmall = v13, 
        small = v13, 
        medium = v13, 
        large = v13, 
        xLarge = v13, 
        x2Large = v13, 
        landscape = v13, 
        portrait = v13
    });
end;
local function _(v15) --[[ Line: 41 ]] --[[ Name: makeNormalizedThemeValueFn ]]
    -- upvalues: l_makeNormalizeTableFn_0 (copy)
    return l_makeNormalizeTableFn_0({
        default = v15, 
        light = v15, 
        dark = v15
    });
end;
local v17 = l_makeNormalizeTableFn_0({
    default = l_normalizeNumber_0, 
    xSmall = l_normalizeNumber_0, 
    small = l_normalizeNumber_0, 
    medium = l_normalizeNumber_0, 
    large = l_normalizeNumber_0, 
    xLarge = l_normalizeNumber_0, 
    x2Large = l_normalizeNumber_0, 
    landscape = l_normalizeNumber_0, 
    portrait = l_normalizeNumber_0
});
local v18 = l_makeNormalizeTableFn_0({
    r = l_makeRequired_0(l_normalizeNumber_0), 
    g = l_makeRequired_0(l_normalizeNumber_0), 
    b = l_makeRequired_0(l_normalizeNumber_0)
});
local v19 = l_makeNormalizeTableFn_0({
    x = l_makeRequired_0(l_normalizeNumber_0), 
    y = l_makeRequired_0(l_normalizeNumber_0)
});
local v20 = l_makeNormalizeTableFn_0({
    default = v19, 
    xSmall = v19, 
    small = v19, 
    medium = v19, 
    large = v19, 
    xLarge = v19, 
    x2Large = v19, 
    landscape = v19, 
    portrait = v19
});
local v21 = l_makeNormalizeTableFn_0({
    type = l_makeRequired_0(l_makeNormalizeValueFn_0({
        "ImageBackground"
    })), 
    color = v18, 
    resourceIdentifier = l_makeNormalizeTableFn_0({
        default = l_normalizeString_0, 
        xSmall = l_normalizeString_0, 
        small = l_normalizeString_0, 
        medium = l_normalizeString_0, 
        large = l_normalizeString_0, 
        xLarge = l_normalizeString_0, 
        x2Large = l_normalizeString_0, 
        landscape = l_normalizeString_0, 
        portrait = l_normalizeString_0
    }), 
    anchorPoint = v20, 
    position = v20, 
    transparency = v17
});
local v22 = l_makeNormalizeTableFn_0({
    time = l_makeRequired_0(l_normalizeNumber_0), 
    color = l_makeRequired_0(v18)
});
local v23 = l_makeNormalizeTableFn_0({
    time = l_makeRequired_0(l_normalizeNumber_0), 
    number = l_makeRequired_0(l_normalizeNumber_0)
});
local v24 = l_makeNormalizeListFn_0((l_makeNormalizeUnionFn_0({
    v21, 
    (l_makeNormalizeTableFn_0({
        type = l_makeRequired_0(l_makeNormalizeValueFn_0({
            "GradientBackground"
        })), 
        colorSequence = l_makeRequired_0(l_makeNormalizeListFn_0(v22)), 
        rotation = l_normalizeNumber_0, 
        transparency = l_makeNormalizeUnionFn_0({
            l_normalizeNumber_0, 
            l_makeNormalizeListFn_0(v23)
        }), 
        offset = v19
    }))
})));
local v25 = l_makeNormalizeTableFn_0({
    default = v24, 
    light = v24, 
    dark = v24
});
v24 = l_makeNormalizeTableFn_0({
    backgroundLayers = v25
});
local v27 = l_makeNormalizeUnionFn_0({
    l_makeNormalizeValueFn_0({
        "Wide", 
        "Tall", 
        "Square"
    }), 
    function(v26) --[[ Line: 102 ]]
        if v26 then
            return (tonumber(v26));
        else
            return nil;
        end;
    end
});
local v28 = l_makeNormalizeTableFn_0({
    backgroundLayers = v25, 
    thumbnailAspectRatio = v27
});
local v29 = l_makeNormalizeListFn_0((l_makeNormalizeTableFn_0({
    contentType = l_makeNormalizeValueFn_0({
        "ItemName", 
        "AgentName", 
        "Price", 
        "PriceRange"
    })
})));
local v30 = l_makeNormalizeTableFn_0({
    continueBrowsingTitle = l_normalizeString_0, 
    shouldUseDefaultTemplatesAcrossTabs = l_normalizeString_0, 
    creatorNameTileFooterEnabled = l_normalizeString_0, 
    hydrateOnlyVisibleItems = l_normalizeStringToBoolean_0, 
    disableOrganicContentFetch = l_normalizeStringToBoolean_0
});
local v31 = l_makeNormalizeTableFn_0({
    type = l_makeRequired_0(l_makeNormalizeValueFn_0({
        "Carousel"
    })), 
    numItemsToShow = l_normalizeNumber_0, 
    seeAllButton = l_normalizeBoolean_0, 
    title = l_normalizeString_0, 
    localizedTitle = l_normalizeString_0, 
    description = l_normalizeString_0, 
    localizedDescription = l_normalizeString_0, 
    widgetStyle = v24, 
    cardStyle = v28, 
    itemFooters = v29, 
    previewRows = v17, 
    previewColumns = v17
});
local v32 = l_makeNormalizeTableFn_0({
    type = l_makeRequired_0(l_makeNormalizeValueFn_0({
        "ItemGroup"
    })), 
    seeAllButton = l_normalizeBoolean_0, 
    title = l_normalizeString_0, 
    localizedTitle = l_normalizeString_0, 
    description = l_normalizeString_0, 
    localizedDescription = l_normalizeString_0, 
    widgetStyle = v24, 
    cardStyle = v28, 
    itemFooters = v29, 
    previewRows = v17, 
    previewColumns = v17
});
local v33 = l_makeNormalizeTableFn_0({
    customizedDataMap = v30, 
    defaultItemCarouselTemplate = v31, 
    defaultItemGroupTemplate = v32, 
    defaultTemplate = v32
});
local v34 = l_makeNormalizeListFn_0(l_makeNormalizeUnionFn_0({
    l_makeNormalizeTableFn_0({
        id = l_makeRequired_0(l_normalizeNumber_0), 
        type = l_makeRequired_0(l_makeNormalizeValueFn_0({
            "Bundle"
        }))
    }), 
    l_makeNormalizeTableFn_0({
        id = l_makeRequired_0(l_normalizeNumber_0), 
        type = l_makeRequired_0(l_makeNormalizeValueFn_0({
            "Asset"
        }))
    }), 
    (l_makeNormalizeTableFn_0({
        id = l_makeRequired_0(l_normalizeString_0), 
        type = l_makeRequired_0(l_makeNormalizeValueFn_0({
            "Look"
        })), 
        displayProperties = l_makeNormalizeTableFn_0({
            animatedAvatarEmoteAssetIds = l_normalizeString_0
        })
    }))
}));
local v35 = l_makeNormalizeTableFn_0({
    id = l_makeRequired_0(l_normalizeString_0), 
    type = l_makeRequired_0(l_normalizeString_0), 
    content = l_makeRequired_0(v34), 
    template = l_makeRequired_0(l_makeNormalizeUnionFn_0({
        v32, 
        v31
    })), 
    tagId = l_normalizeString_0
});
return (l_makeNormalizeTableFn_0({
    configuration = v33, 
    widgets = function(v36) --[[ Line: 195 ]] --[[ Name: normalizeWidgets ]]
        -- upvalues: v35 (copy)
        if typeof(v36) ~= "table" then
            return nil, nil;
        else
            local v37 = {};
            local v38 = {};
            for v39, v40 in v36 do
                local v41, v42 = v35(v40);
                table.insert(v38, v42);
                v37[tostring(tonumber(v39) + 1)] = v41;
            end;
            local v43 = nil;
            if next(v38) then
                v43 = table.concat(v38, " ");
            end;
            return v37, v43;
        end;
    end
}));