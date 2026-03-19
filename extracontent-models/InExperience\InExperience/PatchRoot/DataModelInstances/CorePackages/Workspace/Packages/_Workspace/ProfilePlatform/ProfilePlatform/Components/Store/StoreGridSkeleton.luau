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
local v10 = {
    numColumns = 3
};
local function v12(v11) --[[ Line: 22 ]]
    return v11 + 49;
end;
return function(v13) --[[ Line: 26 ]] --[[ Name: StoreGridSkeleton ]]
    -- upvalues: l_useLocalization_0 (copy), v5 (copy), v2 (copy), l_View_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), v3 (copy), v12 (copy), v10 (copy)
    local v14 = l_useLocalization_0({
        store = v5.Store
    });
    local v18 = v2.useCallback(function(_, v16, v17) --[[ Line: 31 ]]
        -- upvalues: v2 (ref), l_View_0 (ref), l_Skeleton_0 (ref), l_Radius_0 (ref)
        return v2.createElement(l_View_0, {
            tag = "col gap-small radius-medium", 
            LayoutOrder = v16, 
            Size = v17
        }, {
            ThumbnailSkeleton = v2.createElement(l_Skeleton_0, {
                LayoutOrder = 1, 
                Size = UDim2.fromScale(1, 0.7), 
                radius = l_Radius_0.Medium
            }), 
            NameSkeleton = v2.createElement(l_Skeleton_0, {
                LayoutOrder = 2, 
                Size = UDim2.fromScale(0.8, 0.09), 
                radius = l_Radius_0.Medium
            }), 
            ButtonSkeleton = v2.createElement(l_Skeleton_0, {
                LayoutOrder = 3, 
                Size = UDim2.fromScale(0.6, 0.09), 
                radius = l_Radius_0.Medium
            })
        }), "Skeleton_" .. v16;
    end, {});
    local v21 = v2.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v13 (copy)
        local v19 = {};
        for v20 = 1, v13.numSkeletons do
            table.insert(v19, v20);
        end;
        return v19;
    end, {
        v13.numSkeletons
    });
    return v2.createElement(v3, {
        layoutOrder = v13.layoutOrder, 
        items = v21, 
        renderItem = v18, 
        getItemHeight = v12, 
        title = v14.store, 
        overrides = v10
    });
end;