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
return v9.memo(function(v23) --[[ Line: 42 ]]
    -- upvalues: l_FFlagLuaAppChartsActiveFilterChips_0 (copy), v9 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_useDispatch_0 (copy), l_useTokens_0 (copy), l_dependencyArray_0 (copy), l_ImpressionsTagUtility_0 (copy), v18 (copy), l_FFlagLuaAppChartsFilterOptionTextTag_0 (copy), v19 (copy), v20 (copy), v17 (copy), v15 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_Chip_0 (copy), l_IconPosition_0 (copy)
    local v24 = nil;
    local v25 = nil;
    if not l_FFlagLuaAppChartsActiveFilterChips_0 then
        local v26, v27 = v9.useState(false);
        v24 = v26;
        v25 = v27;
    end;
    local v28 = nil;
    local v29 = nil;
    if l_FFlagLuaAppChartsActiveFilterChips_0 then
        local v30, v31 = v9.useState(false);
        v28 = v30;
        v29 = v31;
    end;
    local v32 = l_useRoactService_0(l_AppEventIngestService_0);
    local v33 = v9.useRef(nil);
    local v34 = l_useDispatch_0();
    local v35 = l_useTokens_0();
    local v36 = if l_FFlagLuaAppChartsActiveFilterChips_0 then v9.useMemo(function() --[[ Line: 60 ]]
        -- upvalues: v23 (copy)
        if v23.filter.inactiveOptionIds == nil or v23.filter.selectedOptionId == nil then
            return false;
        else
            return not v23.filter.inactiveOptionIds[v23.filter.selectedOptionId];
        end;
    end, {
        v23.filter.selectedOptionId, 
        v23.filter.inactiveOptionIds
    }) else nil;
    local v37 = if l_FFlagLuaAppChartsActiveFilterChips_0 then v36 or v28 else nil;
    v9.useEffect(function() --[[ Line: 71 ]]
        -- upvalues: v33 (copy), v23 (copy)
        local v38 = nil;
        if v33.current then
            v38 = v33.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 75 ]]
                -- upvalues: v23 (ref), v33 (ref)
                v23.onAbsoluteSizeChanged(v33.current);
            end);
        end;
        return function() --[[ Line: 80 ]]
            -- upvalues: v38 (ref)
            if v38 then
                v38:Disconnect();
            end;
        end;
    end, l_dependencyArray_0(v23.onAbsoluteSizeChanged));
    v9.useEffect(function() --[[ Line: 87 ]]
        -- upvalues: l_ImpressionsTagUtility_0 (ref), v33 (copy), v23 (copy)
        l_ImpressionsTagUtility_0.AddTag(v33, v23.impressionsTag, v23.index);
        return function() --[[ Line: 90 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v33 (ref), v23 (ref)
            l_ImpressionsTagUtility_0.RemoveTag(v33, v23.impressionsTag, v23.index);
        end;
    end, l_dependencyArray_0(v23.impressionsTag, v23.index));
    local v45 = v9.useCallback(function(v39, v40, v41, v42, v43, v44) --[[ Line: 96 ]]
        -- upvalues: v18 (ref), v32 (copy), v23 (copy), l_FFlagLuaAppChartsFilterOptionTextTag_0 (ref), l_FFlagLuaAppChartsActiveFilterChips_0 (ref)
        v18(v32, v23.pageContext, {
            buttonName = v39, 
            filterId = v23.filter.filterId, 
            selectedOptionId = v40, 
            previousOptionId = v41, 
            gameSetTypeId = v23.analyticsInfo.gameSetTypeId, 
            gameSetTargetId = v23.analyticsInfo.gameSetTargetId, 
            sortPos = v23.analyticsInfo.sortPos, 
            selectedOptionContextTag = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v42 else nil, 
            previousOptionContextTag = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v43 else nil, 
            isActive = if l_FFlagLuaAppChartsActiveFilterChips_0 then v44 else nil
        });
    end, l_dependencyArray_0(v32, v23.filter, v23.pageContext, v23.analyticsInfo));
    local v46 = v19();
    local v47 = v9.useCallback(function() --[[ Line: 125 ]]
        -- upvalues: l_FFlagLuaAppChartsActiveFilterChips_0 (ref), v29 (ref), v25 (ref)
        if l_FFlagLuaAppChartsActiveFilterChips_0 then
            v29(false);
            return;
        else
            v25(false);
            return;
        end;
    end, {});
    local v50 = v9.useCallback(function() --[[ Line: 134 ]]
        -- upvalues: l_FFlagLuaAppChartsFilterOptionTextTag_0 (ref), v20 (ref), v23 (copy), v46 (copy), v34 (copy), v17 (ref), v47 (copy), v45 (copy), v15 (ref), l_FFlagLuaAppChartsActiveFilterChips_0 (ref), v37 (copy), v33 (copy), v35 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v29 (ref), v25 (ref)
        local v48 = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v20(v23.filter, v23.filter.selectedOptionId) else nil;
        if v46 then
            v34(v17(v23.filter, v23.onFilterApplied, v47, v45));
            v45(v15.OpenPeekView, v23.filter.selectedOptionId, nil, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v48 else nil, nil, if l_FFlagLuaAppChartsActiveFilterChips_0 then v37 else nil);
        else
            local v49 = {
                openPosition = if v33.current then Vector2.new(v33.current.AbsolutePosition.X, v33.current.AbsolutePosition.Y + v33.current.AbsoluteSize.Y + v35.Gap.Small) else nil, 
                filter = v23.filter, 
                onFilterApplied = v23.onFilterApplied, 
                onFilterMenuClosed = v47, 
                sendFilterClick = v45
            };
            v34(l_SetCentralOverlay_0(l_CentralOverlayType_0.GameFilterMenuDropdown, v49));
            v45(v15.OpenDropdown, v23.filter.selectedOptionId, nil, if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v48 else nil, nil, if l_FFlagLuaAppChartsActiveFilterChips_0 then v37 else nil);
        end;
        if l_FFlagLuaAppChartsActiveFilterChips_0 then
            v29(true);
            return;
        else
            v25(true);
            return;
        end;
    end, l_dependencyArray_0(v23.filter, v23.onFilterApplied, v47, v45, v46, if l_FFlagLuaAppChartsActiveFilterChips_0 then v37 else nil));
    return v9.createElement(l_Chip_0, {
        icon = {
            name = "icons/actions/truncationExpand_small", 
            position = l_IconPosition_0.Right
        }, 
        text = v23.filter.selectedOptionDisplayName, 
        isChecked = if l_FFlagLuaAppChartsActiveFilterChips_0 then v37 else v24, 
        onActivated = v50, 
        ref = v33
    });
end);