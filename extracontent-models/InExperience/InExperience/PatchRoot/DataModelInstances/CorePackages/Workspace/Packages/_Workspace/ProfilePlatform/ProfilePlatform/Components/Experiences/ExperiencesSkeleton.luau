local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.BaseComponents.CollectionGridViews.SquareCollectionGridView);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v6 = require(l_Parent_0.Foundation);
local l_Skeleton_0 = v6.Skeleton;
local l_Radius_0 = v6.Enums.Radius;
local l_View_0 = v6.View;
local l_useTextSizeOffset_0 = v6.Hooks.useTextSizeOffset;
local v11 = {
    numColumns = 3
};
local function _(v12) --[[ Line: 23 ]] --[[ Name: getTextSizeAdjustedSquareExperienceTileHeight ]]
    return function(v13) --[[ Line: 24 ]]
        -- upvalues: v12 (copy)
        return v13 + 80 + v12 * 3;
    end;
end;
return function(v15) --[[ Line: 29 ]] --[[ Name: ExperiencesSkeleton ]]
    -- upvalues: l_useLocalization_0 (copy), v5 (copy), l_useTextSizeOffset_0 (copy), v2 (copy), l_View_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), v3 (copy), v11 (copy)
    local v16 = l_useLocalization_0({
        experiences = v5.Experiences
    });
    local v17 = nil;
    local v18 = nil;
    v17 = l_useTextSizeOffset_0();
    v18 = v2.useMemo(function() --[[ Line: 36 ]]
        -- upvalues: v17 (ref)
        local l_v17_0 = v17;
        return function(v20) --[[ Line: 24 ]]
            -- upvalues: l_v17_0 (copy)
            return v20 + 80 + l_v17_0 * 3;
        end;
    end, {
        v17
    });
    local v24 = v2.useCallback(function(_, v22, v23) --[[ Line: 40 ]]
        -- upvalues: v2 (ref), l_View_0 (ref), l_Skeleton_0 (ref), l_Radius_0 (ref)
        return v2.createElement(l_View_0, {
            tag = "col gap-small radius-medium", 
            LayoutOrder = v22, 
            Size = v23
        }, {
            ThumbnailSkeleton = v2.createElement(l_Skeleton_0, {
                LayoutOrder = 1, 
                Size = UDim2.fromScale(1, 0.6), 
                radius = l_Radius_0.Medium
            }), 
            NameSkeleton = v2.createElement(l_Skeleton_0, {
                LayoutOrder = 2, 
                Size = UDim2.fromScale(0.8, 0.18), 
                radius = l_Radius_0.Medium
            }), 
            ButtonSkeleton = v2.createElement(l_Skeleton_0, {
                LayoutOrder = 3, 
                Size = UDim2.fromScale(0.6, 0.08), 
                radius = l_Radius_0.Medium
            })
        }), "Skeleton_" .. v22;
    end, {});
    local v27 = v2.useMemo(function() --[[ Line: 65 ]]
        -- upvalues: v15 (copy)
        local v25 = {};
        for v26 = 1, v15.numSkeletons do
            table.insert(v25, v26);
        end;
        return v25;
    end, {
        v15.numSkeletons
    });
    return v2.createElement(v3, {
        layoutOrder = v15.layoutOrder, 
        items = v27, 
        renderItem = v24, 
        getItemHeight = v18, 
        title = v16.experiences, 
        overrides = v11
    });
end;