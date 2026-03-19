local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CollectionItemSize_0 = require(l_script_FirstAncestor_0.CollectionViewTypes).CollectionItemSize;
local v3 = require(l_script_FirstAncestor_0.useCollectionLayoutParams);
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v7 = require(l_Parent_0.DiscoveryTypes);
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v7.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v7.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING;
return function(v10) --[[ Line: 15 ]] --[[ Name: usePageSideMargin ]]
    -- upvalues: l_useSelector_0 (copy), l_useAppPolicy_0 (copy), l_FormFactor_0 (copy), l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 (copy), l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 (copy), v3 (copy), l_CollectionItemSize_0 (copy)
    local v12 = l_useSelector_0(function(v11) --[[ Line: 16 ]]
        return v11.FormFactor;
    end);
    local v14 = if l_useAppPolicy_0(function(v13) --[[ Line: 20 ]]
        return v13.useGridPageLayout();
    end) then nil else {
        sideMargin = if v12 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0
    };
    return v3(l_CollectionItemSize_0.Small, v10, false, v14).sideMargin;
end;