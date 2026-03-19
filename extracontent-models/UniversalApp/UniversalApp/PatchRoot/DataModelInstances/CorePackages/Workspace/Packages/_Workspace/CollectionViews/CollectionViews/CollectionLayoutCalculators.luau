local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Style);
local _ = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.Responsive);
local l_hasExtraPlatformInset_0 = v4.HardwareSafeAreaInsets.hasExtraPlatformInset;
local v6 = require(l_Parent_0.ArgCheck);
local v7 = require(l_script_FirstAncestor_0.calculateNumColumns);
local l_CollectionItemSize_0 = require(l_script_FirstAncestor_0.CollectionViewTypes).CollectionItemSize;
local v9 = game:DefineFastInt("XSmallCollectionItemMinItemCount", 3);
local v10 = game:DefineFastInt("XSmallCollectionItemMaxItemCount", 20);
local v11 = game:DefineFastInt("XSmallCollectionItemMinItemWidth", 100);
local v12 = game:DefineFastInt("XSmallCollectionItemVerticalGap", 16);
local v13 = game:DefineFastInt("XSmallCollectionItemFractionalPercent", 15);
local v14 = game:DefineFastInt("SmallCollectionItemMinItemCount", 3);
local v15 = game:DefineFastInt("SmallCollectionItemMaxItemCount", 12);
local v16 = game:DefineFastInt("SmallCollectionItemMinItemWidth", 150);
local v17 = game:DefineFastInt("SmallCollectionItemVerticalGap", 16);
local v18 = game:DefineFastInt("SmallCollectionItemFractionalPercent", 15);
local v19 = game:DefineFastInt("MediumCollectionItemMinItemCount", 2);
local v20 = game:DefineFastInt("MediumCollectionItemMaxItemCount", 6);
local v21 = game:DefineFastInt("MediumCollectionItemMinItemWidth", 233);
local v22 = game:DefineFastInt("MediumCollectionItemVerticalGap", 16);
local v23 = game:DefineFastInt("MediumCollectionItemFractionalPercent", 15);
local v24 = game:DefineFastInt("LargeCollectionItemMinItemCount", 1);
local v25 = game:DefineFastInt("LargeCollectionItemMaxItemCount", 4);
local v26 = game:DefineFastInt("LargeCollectionItemMinItemWidth", 300);
local v27 = game:DefineFastInt("LargeCollectionItemVerticalGap", 16);
local v28 = game:DefineFastInt("LargeCollectionItemFractionalPercent", 30);
local v29 = game:DefineFastInt("XLargeCollectionItemMinItemCount", 1);
local v30 = game:DefineFastInt("XLargeCollectionItemMaxItemCount", 1);
local v31 = game:DefineFastInt("XLargeCollectionItemMinItemWidth", 300);
local v32 = game:DefineFastInt("XLargeCollectionItemVerticalGap", 16);
local v33 = game:DefineFastInt("XLargeCollectionItemFractionalPercent", 10) / 100;
local v34 = v28 / 100;
local v35 = v23 / 100;
local v36 = v18 / 100;
local v37 = v13 / 100;
local l_FFlagLuaAppLayoutParamsInContext_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLayoutParamsInContext;
local function _(v39, v40) --[[ Line: 57 ]] --[[ Name: scaleSizeForPlatform ]]
    -- upvalues: l_FFlagLuaAppLayoutParamsInContext_0 (copy)
    return v39 * if l_FFlagLuaAppLayoutParamsInContext_0 then v40.Config.UI.Scale else v40.Global.Stroke_100;
end;
local function v44(v42, v43) --[[ Line: 66 ]] --[[ Name: getLegacySideMargin ]]
    -- upvalues: l_FFlagLuaAppLayoutParamsInContext_0 (copy)
    if v42 < 1024 * if l_FFlagLuaAppLayoutParamsInContext_0 then v43.Config.UI.Scale else v43.Global.Stroke_100 then
        if l_FFlagLuaAppLayoutParamsInContext_0 then
            return v43.Padding.Medium;
        else
            return v43.Global.Space_150;
        end;
    elseif v42 < 1280 * if l_FFlagLuaAppLayoutParamsInContext_0 then v43.Config.UI.Scale else v43.Global.Stroke_100 then
        return 18 * if l_FFlagLuaAppLayoutParamsInContext_0 then v43.Config.UI.Scale else v43.Global.Stroke_100;
    elseif v42 < 1440 * if l_FFlagLuaAppLayoutParamsInContext_0 then v43.Config.UI.Scale else v43.Global.Stroke_100 then
        if l_FFlagLuaAppLayoutParamsInContext_0 then
            return v43.Margin.Medium;
        else
            return v43.Global.Space_300;
        end;
    elseif v42 < 1920 * if l_FFlagLuaAppLayoutParamsInContext_0 then v43.Config.UI.Scale else v43.Global.Stroke_100 then
        return 34 * if l_FFlagLuaAppLayoutParamsInContext_0 then v43.Config.UI.Scale else v43.Global.Stroke_100;
    elseif v42 < 2260 * if l_FFlagLuaAppLayoutParamsInContext_0 then v43.Config.UI.Scale else v43.Global.Stroke_100 then
        return 38 * if l_FFlagLuaAppLayoutParamsInContext_0 then v43.Config.UI.Scale else v43.Global.Stroke_100;
    elseif l_FFlagLuaAppLayoutParamsInContext_0 then
        return v43.Margin.Large;
    else
        return v43.Global.Space_600;
    end;
end;
local function _(v45, v46) --[[ Line: 91 ]] --[[ Name: getLegacyColumnGap ]]
    -- upvalues: l_FFlagLuaAppLayoutParamsInContext_0 (copy)
    if v45 < 1024 then
        if l_FFlagLuaAppLayoutParamsInContext_0 then
            return v46.Gap.Medium;
        else
            return v46.Global.Space_150;
        end;
    elseif v45 < 1280 then
        return 18;
    elseif l_FFlagLuaAppLayoutParamsInContext_0 then
        return v46.Gap.XXLarge;
    else
        return v46.Global.Space_300;
    end;
end;
return {
    calculateNumColumns = function(v48, v49, v50, v51, v52) --[[ Line: 150 ]] --[[ Name: calculateNumColumnsForCollection ]]
        -- upvalues: l_CollectionItemSize_0 (copy), v31 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), v29 (copy), v30 (copy), v26 (copy), v24 (copy), v25 (copy), v21 (copy), v19 (copy), v20 (copy), v6 (copy), v16 (copy), v14 (copy), v15 (copy), v11 (copy), v9 (copy), v10 (copy), v7 (copy)
        local v53 = nil;
        local v54 = nil;
        local v55 = nil;
        if v51 == l_CollectionItemSize_0.XLarge then
            v53 = v31 * if l_FFlagLuaAppLayoutParamsInContext_0 then v52.Config.UI.Scale else v52.Global.Stroke_100;
            v54 = v29;
            v55 = v30;
        elseif v51 == l_CollectionItemSize_0.Large then
            v53 = v26 * if l_FFlagLuaAppLayoutParamsInContext_0 then v52.Config.UI.Scale else v52.Global.Stroke_100;
            v54 = v24;
            v55 = v25;
        elseif v51 == l_CollectionItemSize_0.Medium then
            v53 = v21 * if l_FFlagLuaAppLayoutParamsInContext_0 then v52.Config.UI.Scale else v52.Global.Stroke_100;
            v54 = v19;
            v55 = v20;
        elseif v51 == l_CollectionItemSize_0.Small then
            v6.assert(v51 == l_CollectionItemSize_0.Small);
            v53 = v16 * if l_FFlagLuaAppLayoutParamsInContext_0 then v52.Config.UI.Scale else v52.Global.Stroke_100;
            v54 = v14;
            v55 = v15;
        else
            v6.assert(v51 == l_CollectionItemSize_0.XSmall);
            v53 = v11 * if l_FFlagLuaAppLayoutParamsInContext_0 then v52.Config.UI.Scale else v52.Global.Stroke_100;
            v54 = v9;
            v55 = v10;
        end;
        local v56 = v48 - v49 * 2;
        return v7(v53, v50, v54, v55, v56);
    end, 
    calculateSideMargin = function(_, v58, v59) --[[ Line: 107 ]] --[[ Name: calculateSideMargin ]]
        -- upvalues: l_hasExtraPlatformInset_0 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), v44 (copy)
        if l_hasExtraPlatformInset_0() then
            if l_FFlagLuaAppLayoutParamsInContext_0 then
                return v58.Size.Size_1600;
            else
                return v58.Global.Space_800;
            end;
        else
            return (v44(v59, v58));
        end;
    end, 
    calculateColumnGap = function(_, v61, v62) --[[ Line: 133 ]] --[[ Name: calculateColumnGap ]]
        -- upvalues: l_FFlagLuaAppLayoutParamsInContext_0 (copy)
        if v62 < 1024 then
            if l_FFlagLuaAppLayoutParamsInContext_0 then
                return v61.Gap.Medium;
            else
                return v61.Global.Space_150;
            end;
        elseif v62 < 1280 then
            return 18;
        elseif l_FFlagLuaAppLayoutParamsInContext_0 then
            return v61.Gap.XXLarge;
        else
            return v61.Global.Space_300;
        end;
    end, 
    calculateVerticalPadding = function(v63, v64) --[[ Line: 189 ]] --[[ Name: calculateVerticalPadding ]]
        -- upvalues: l_CollectionItemSize_0 (copy), v32 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), v27 (copy), v22 (copy), v17 (copy), v12 (copy)
        if v64 == l_CollectionItemSize_0.XLarge then
            return v32 * if l_FFlagLuaAppLayoutParamsInContext_0 then v63.Config.UI.Scale else v63.Global.Stroke_100;
        elseif v64 == l_CollectionItemSize_0.Large then
            return v27 * if l_FFlagLuaAppLayoutParamsInContext_0 then v63.Config.UI.Scale else v63.Global.Stroke_100;
        elseif v64 == l_CollectionItemSize_0.Medium then
            return v22 * if l_FFlagLuaAppLayoutParamsInContext_0 then v63.Config.UI.Scale else v63.Global.Stroke_100;
        elseif v64 == l_CollectionItemSize_0.Small then
            return v17 * if l_FFlagLuaAppLayoutParamsInContext_0 then v63.Config.UI.Scale else v63.Global.Stroke_100;
        else
            return v12 * if l_FFlagLuaAppLayoutParamsInContext_0 then v63.Config.UI.Scale else v63.Global.Stroke_100;
        end;
    end, 
    calculateFractionalItemAmount = function(v65, v66) --[[ Line: 217 ]] --[[ Name: calculateFractionalItemAmount ]]
        -- upvalues: l_CollectionItemSize_0 (copy), v4 (copy), v33 (copy), v34 (copy), v35 (copy), v36 (copy), v37 (copy)
        if v65 == l_CollectionItemSize_0.XLarge then
            if v66 == v4.Input.Directional then
                return 0;
            else
                return v33;
            end;
        elseif v65 == l_CollectionItemSize_0.Large then
            if v66 == v4.Input.Directional then
                return 0;
            else
                return v34;
            end;
        elseif v65 == l_CollectionItemSize_0.Medium then
            if v66 == v4.Input.Directional then
                return 0;
            else
                return v35;
            end;
        elseif v65 == l_CollectionItemSize_0.Small then
            if v66 == v4.Input.Directional then
                return 0;
            else
                return v36;
            end;
        elseif v66 == v4.Input.Directional then
            return 0;
        else
            return v37;
        end;
    end, 
    calculateMaxTilesToShow = function(v67) --[[ Line: 208 ]] --[[ Name: calculateMaxTilesToShow ]]
        -- upvalues: v4 (copy)
        if v67 == v4.Input.Directional then
            return 20;
        else
            return nil;
        end;
    end, 
    calculateLoadMoreThreshold = function(v68) --[[ Line: 231 ]] --[[ Name: calculateLoadMoreThreshold ]]
        return (math.max(1000, v68));
    end
};