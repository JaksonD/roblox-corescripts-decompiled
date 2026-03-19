local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CollectionItemSize_0 = require(l_script_FirstAncestor_0.CollectionViewTypes).CollectionItemSize;
local v3 = require(l_script_FirstAncestor_0.useCollectionLayoutParams);
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v7 = require(l_Parent_0.DiscoveryTypes);
local v8 = require(l_Parent_0.AppComposition);
local v9 = require(l_Parent_0.SharedFlags);
local l_FFlagLuaAppCompositionSupport_0 = v9.FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = v9.FFlagLuaAppCompositionAlways;
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v7.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v7.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING;
return function(v14, v15) --[[ Line: 19 ]] --[[ Name: usePageSideMargin ]]
    -- upvalues: l_FFlagLuaAppCompositionSupport_0 (copy), v8 (copy), l_FFlagLuaAppCompositionAlways_0 (copy), l_useSelector_0 (copy), l_useAppPolicy_0 (copy), l_FormFactor_0 (copy), l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 (copy), l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 (copy), v3 (copy), l_CollectionItemSize_0 (copy)
    local v16 = nil;
    if l_FFlagLuaAppCompositionSupport_0 then
        v16 = v8.useCompositionLayout().margin;
    end;
    if l_FFlagLuaAppCompositionAlways_0 then
        return v16;
    else
        local v18 = l_useSelector_0(function(v17) --[[ Line: 30 ]]
            return v17.FormFactor;
        end);
        local v20 = if l_useAppPolicy_0(function(v19) --[[ Line: 34 ]]
            return v19.useGridPageLayout();
        end) then nil else {
            sideMargin = if v18 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0
        };
        local v21 = v3(l_CollectionItemSize_0.Small, v14, false, v20);
        if l_FFlagLuaAppCompositionSupport_0 and v15 then
            return v16;
        else
            return v21.sideMargin;
        end;
    end;
end;