local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameFilters");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local _ = require(l_Parent_0.DiscoveryTypes);
local v4 = require(l_Parent_0.Foundation);
local l_IconPosition_0 = v4.Enums.IconPosition;
local l_ImpressionsTagUtility_0 = require(l_Parent_0.Impressions).ImpressionsTagUtility;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_Chip_0 = v4.Chip;
local v9 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useTokens_0 = v4.Hooks.useTokens;
local v15 = require(l_script_FirstAncestor_0.Analytics.FilterClickButtonName);
local _ = require(l_script_FirstAncestor_0.Components.Menu.FilterMenuDropdown);
local v17 = require(l_script_FirstAncestor_0.OpenGameFilterMenuPeekView);
local v18 = require(l_script_FirstAncestor_0.Analytics.gamesFilterClickEvent);
local v19 = require(l_script_FirstAncestor_0.Components.Menu.shouldUsePeekView);
local v20 = require(l_script_FirstAncestor_0.Analytics.getOptionContextTag);
local l_FFlagLuaAppChartsFilterOptionTextTag_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag;
local l_FFlagLuaAppChartsActiveFilterChips_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsActiveFilterChips;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return v9.memo(function(v24) --[[ Line: 44 ]]
    -- upvalues: l_FFlagLuaAppChartsActiveFilterChips_0 (copy), v9 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_useDispatch_0 (copy), l_useTokens_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_ImpressionsTagUtility_0 (copy), v18 (copy), l_FFlagLuaAppChartsFilterOptionTextTag_0 (copy), v19 (copy), v20 (copy), v17 (copy), v15 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_Chip_0 (copy), l_IconPosition_0 (copy)
    local v25 = nil;
    local v26 = nil;
    if not l_FFlagLuaAppChartsActiveFilterChips_0 then
        local v27, v28 = v9.useState(false);
        v25 = v27;
        v26 = v28;
    end;
    local v29 = nil;
    local v30 = nil;
    if l_FFlagLuaAppChartsActiveFilterChips_0 then
        local v31, v32 = v9.useState(false);
        v29 = v31;
        v30 = v32;
    end;
    local v33 = l_useRoactService_0(l_AppEventIngestService_0);
    local v34 = v9.useRef(nil);
    local v35 = l_useDispatch_0();
    local v36 = l_useTokens_0();
    local v37 = if l_FFlagLuaAppChartsActiveFilterChips_0 then v9.useMemo(function() --[[ Line: 62 ]]
        -- upvalues: v24 (copy)
        if v24.filter.inactiveOptionIds == nil or v24.filter.selectedOptionId == nil then
            return false;
        else
            return not v24.filter.inactiveOptionIds[v24.filter.selectedOptionId];
        end;
    end, {
        v24.filter.selectedOptionId, 
        v24.filter.inactiveOptionIds
    }) else nil;
    local v38 = if l_FFlagLuaAppChartsActiveFilterChips_0 then v37 or v29 else nil;
    v9.useEffect(function() --[[ Line: 74 ]]
        -- upvalues: v34 (copy), v24 (copy)
        local v39 = nil;
        if v34.current then
            v39 = v34.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 78 ]]
                -- upvalues: v24 (ref), v34 (ref)
                v24.onAbsoluteSizeChanged(v34.current);
            end);
        end;
        return function() --[[ Line: 83 ]]
            -- upvalues: v39 (ref)
            if v39 then
                v39:Disconnect();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v24.onAbsoluteSizeChanged
    } else l_dependencyArray_0(v24.onAbsoluteSizeChanged));
    v9.useEffect(function() --[[ Line: 95 ]]
        -- upvalues: l_ImpressionsTagUtility_0 (ref), v34 (copy), v24 (copy)
        l_ImpressionsTagUtility_0.AddTag(v34, v24.impressionsTag, v24.index);
        return function() --[[ Line: 98 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v34 (ref), v24 (ref)
            l_ImpressionsTagUtility_0.RemoveTag(v34, v24.impressionsTag, v24.index);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v24.impressionsTag, 
        v24.index
    } else l_dependencyArray_0(v24.impressionsTag, v24.index));
    local v46 = v9.useCallback(function(v40, v41, v42, v43, v44, v45) --[[ Line: 108 ]]
        -- upvalues: v18 (ref), v33 (copy), v24 (copy), l_FFlagLuaAppChartsFilterOptionTextTag_0 (ref), l_FFlagLuaAppChartsActiveFilterChips_0 (ref)
        v18(v33, v24.pageContext, {
            buttonName = v40, 
            filterId = v24.filter.filterId, 
            selectedOptionId = v41, 
            previousOptionId = v42, 
            gameSetTypeId = v24.analyticsInfo.gameSetTypeId, 
            gameSetTargetId = v24.analyticsInfo.gameSetTargetId, 
            sortPos = v24.analyticsInfo.sortPos, 
            selectedOptionContextTag = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v43 else nil, 
            previousOptionContextTag = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v44 else nil, 
            isActive = if l_FFlagLuaAppChartsActiveFilterChips_0 then v45 else nil
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v33, 
        v24.filter, 
        v24.pageContext, 
        v24.analyticsInfo
    } else l_dependencyArray_0(v33, v24.filter, v24.pageContext, v24.analyticsInfo));
    local v47 = v19();
    local v48 = v9.useCallback(function() --[[ Line: 139 ]]
        -- upvalues: l_FFlagLuaAppChartsActiveFilterChips_0 (ref), v30 (ref), v26 (ref)
        if l_FFlagLuaAppChartsActiveFilterChips_0 then
            v30(false);
            return;
        else
            v26(false);
            return;
        end;
    end, {});
    local v51 = v9.useCallback(function() --[[ Line: 148 ]]
        -- upvalues: l_FFlagLuaAppChartsFilterOptionTextTag_0 (ref), v20 (ref), v24 (copy), v47 (copy), v35 (copy), v17 (ref), v48 (copy), v46 (copy), v15 (ref), l_FFlagLuaAppChartsActiveFilterChips_0 (ref), v38 (copy), v34 (copy), v36 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v30 (ref), v26 (ref)
        local v49 = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v20(v24.filter, v24.filter.selectedOptionId) else nil;
        if v47 then
            v35(v17(v24.filter, v24.onFilterApplied, v48, v46));
            v46(v15.OpenPeekView, v24.filter.selectedOptionId, nil, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v49 else nil, nil, if l_FFlagLuaAppChartsActiveFilterChips_0 then v38 else nil);
        else
            local v50 = {
                openPosition = if v34.current then Vector2.new(v34.current.AbsolutePosition.X, v34.current.AbsolutePosition.Y + v34.current.AbsoluteSize.Y + v36.Gap.Small) else nil, 
                filter = v24.filter, 
                onFilterApplied = v24.onFilterApplied, 
                onFilterMenuClosed = v48, 
                sendFilterClick = v46
            };
            v35(l_SetCentralOverlay_0(l_CentralOverlayType_0.GameFilterMenuDropdown, v50));
            v46(v15.OpenDropdown, v24.filter.selectedOptionId, nil, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v49 else nil, nil, if l_FFlagLuaAppChartsActiveFilterChips_0 then v38 else nil);
        end;
        if l_FFlagLuaAppChartsActiveFilterChips_0 then
            v30(true);
            return;
        else
            v26(true);
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v24.filter, 
        v24.onFilterApplied, 
        v48, 
        v46, 
        v47, 
        if l_FFlagLuaAppChartsActiveFilterChips_0 then v38 else nil
    } else l_dependencyArray_0(v24.filter, v24.onFilterApplied, v48, v46, v47, if l_FFlagLuaAppChartsActiveFilterChips_0 then v38 else nil));
    return v9.createElement(l_Chip_0, {
        icon = {
            name = "icons/actions/truncationExpand_small", 
            position = l_IconPosition_0.Right
        }, 
        text = v24.filter.selectedOptionDisplayName, 
        isChecked = if l_FFlagLuaAppChartsActiveFilterChips_0 then v38 else v25, 
        onActivated = v51, 
        ref = v34
    });
end);