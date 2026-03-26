local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SignalsReact);
local v5 = require(l_Parent_0.Foundation);
local l_useScaledValue_0 = v5.Hooks.useScaledValue;
local l_useTokens_0 = v5.Hooks.useTokens;
local l_View_0 = v5.View;
local v9 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v9.usePreferredInput;
local l_Input_0 = v9.Input;
local l_useLastInputMode_0 = require(l_Parent_0.FocusNavigationUtils).useLastInputMode;
local v13 = require(l_Parent_0.PeopleService);
local _ = require(l_script_FirstAncestor_0.Stores.GetScrollingFrameStore);
local v15 = require(l_script_FirstAncestor_0.Hooks.useCardWidth);
local v16 = require(l_script_FirstAncestor_0.Hooks.useCardLayoutValues);
local v17 = require(l_script_FirstAncestor_0.Hooks.useGetPeopleService);
local v18 = require(l_script_FirstAncestor_0.Components.Card.PersonCard);
local v19 = require(l_script_FirstAncestor_0.Components.Card.LazyPersonCard);
local v20 = require(l_script_FirstAncestor_0.Components.Common.VirtualizedGrid);
local v21 = require(l_script_FirstAncestor_0.Constants);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v23 = v13.getService("Flags");
local l_GetFFlagPeoplePageEnablePersonSignalStore_0 = v23.GetFFlagPeoplePageEnablePersonSignalStore;
local l_GetFFlagPeoplePageLazyRenderCards_0 = v23.GetFFlagPeoplePageLazyRenderCards;
local l_FFlagPeoplePageRemoveUseMemoElements_0 = v23.FFlagPeoplePageRemoveUseMemoElements;
local l_FFlagPeopleCardsEnableVirtualizedGrid_0 = v23.FFlagPeopleCardsEnableVirtualizedGrid;
local v28 = game:DefineFastInt("MaxNumUniversesExposedToCardTooltip", 3);
local v29 = false;
local function v79(v30) --[[ Line: 59 ]] --[[ Name: PeopleCards ]]
    -- upvalues: l_useTokens_0 (copy), l_useScaledValue_0 (copy), v21 (copy), l_FFlagPeopleCardsEnableVirtualizedGrid_0 (copy), v16 (copy), v15 (copy), v3 (copy), v17 (copy), l_GetFFlagPeoplePageEnablePersonSignalStore_0 (copy), v4 (copy), l_GetFFlagPeoplePageLazyRenderCards_0 (copy), l_useLastInputMode_0 (copy), l_usePreferredInput_0 (copy), l_Input_0 (copy), v29 (ref), v28 (copy), l_FFlagPeoplePageRemoveUseMemoElements_0 (copy), v19 (copy), v18 (copy), l_LocalPlayer_0 (copy), v20 (copy), l_View_0 (copy)
    local l_Medium_0 = l_useTokens_0().Gap.Medium;
    local v32 = l_useScaledValue_0(v21.PEOPLEPAGE.PEOPLE_CARDS.MINIMUM_CARD_WIDTH);
    local v33 = nil;
    local v34 = nil;
    local v35 = nil;
    local v36 = nil;
    local v37 = nil;
    if l_FFlagPeopleCardsEnableVirtualizedGrid_0 then
        local v38, v39, v40, v41 = v16();
        v33 = v38;
        v35 = v39;
        v36 = v40;
        v37 = v41;
    else
        local v42, v43 = v15();
        v33 = v42;
        v34 = v43;
    end;
    local v44 = nil;
    local v45 = nil;
    if l_FFlagPeopleCardsEnableVirtualizedGrid_0 then
        local v46, v47 = v3.useState(false);
        v44 = v46;
        v45 = v47;
    end;
    local v48 = v17("PeopleListStore");
    local v49 = if not l_GetFFlagPeoplePageEnablePersonSignalStore_0() then v4.useSignalState(v48.people) else nil;
    local v50 = if l_GetFFlagPeoplePageEnablePersonSignalStore_0() then v4.useSignalState(v48.peopleSignalMap.getCount) else nil;
    local v51 = if l_GetFFlagPeoplePageLazyRenderCards_0() then l_useLastInputMode_0() else nil;
    local v52 = if l_GetFFlagPeoplePageLazyRenderCards_0() then l_usePreferredInput_0() else nil;
    local v54 = if l_GetFFlagPeoplePageLazyRenderCards_0() then v3.useMemo(function() --[[ Line: 92 ]]
        -- upvalues: v51 (copy), v52 (copy), l_Input_0 (ref)
        local v53 = true;
        if v51 ~= "Focus" then
            v53 = v52 ~= l_Input_0.Pointer;
        end;
        return v53;
    end, {
        v51, 
        v52
    }) else nil;
    local v59 = v3.useMemo(function() --[[ Line: 98 ]]
        -- upvalues: l_FFlagPeopleCardsEnableVirtualizedGrid_0 (ref), v44 (ref), v29 (ref), v30 (copy), v21 (ref), v28 (ref)
        if l_FFlagPeopleCardsEnableVirtualizedGrid_0 and v44 or v29 or not v30.getUniversesExposedTo or not v30.addUniverseToExposureList then
            return false;
        else
            local v55 = v30.getUniversesExposedTo(v21.PEOPLEPAGE.CARD_TOOLTIP.UNIVERSES_EXPOSED_TO_CARD_TOOLTIP);
            local v56 = 0;
            for _, v58 in v55 do
                if v58 == game.GameId then
                    return false;
                else
                    v56 = v56 + 1;
                end;
            end;
            if v28 <= v56 then
                return false;
            else
                v30.addUniverseToExposureList(v21.PEOPLEPAGE.CARD_TOOLTIP.UNIVERSES_EXPOSED_TO_CARD_TOOLTIP, game.GameId);
                return true;
            end;
        end;
    end, if l_FFlagPeopleCardsEnableVirtualizedGrid_0 then {
        v44, 
        v30.getUniversesExposedTo, 
        v30.addUniverseToExposureList
    } else {
        v30.getUniversesExposedTo, 
        v30.addUniverseToExposureList
    });
    local v60 = v3.useCallback(function() --[[ Line: 133 ]]
        -- upvalues: v29 (ref), l_FFlagPeopleCardsEnableVirtualizedGrid_0 (ref), v45 (ref)
        v29 = true;
        if l_FFlagPeopleCardsEnableVirtualizedGrid_0 then
            v45(true);
        end;
    end, {});
    v3.useEffect(function() --[[ Line: 140 ]]
        -- upvalues: v60 (copy)
        return function() --[[ Line: 141 ]]
            -- upvalues: v60 (ref)
            v60();
        end;
    end, {});
    local v62 = v3.useCallback(function(v61) --[[ Line: 146 ]]
        -- upvalues: v34 (ref), v32 (copy), l_Medium_0 (copy)
        v34(v32, v61.AbsoluteSize.X, l_Medium_0);
    end, {
        v34, 
        v32, 
        l_Medium_0
    });
    local v63 = {};
    if not l_FFlagPeopleCardsEnableVirtualizedGrid_0 then
        if l_FFlagPeoplePageRemoveUseMemoElements_0 then
            if l_GetFFlagPeoplePageEnablePersonSignalStore_0() then
                v63 = {};
                v48.peopleSignalMap.iterateData(function(v64, v65) --[[ Line: 156 ]]
                    -- upvalues: v63 (ref), v3 (ref), l_GetFFlagPeoplePageLazyRenderCards_0 (ref), v19 (ref), v18 (ref), v33 (ref), v59 (copy), l_LocalPlayer_0 (ref), v60 (copy), v30 (copy), v54 (copy)
                    v63["PersonCard_" .. v64] = v3.createElement(if l_GetFFlagPeoplePageLazyRenderCards_0() then v19 else v18, {
                        width = v33, 
                        person = v65.getPerson(), 
                        showTooltip = v59 and l_LocalPlayer_0 ~= nil and v64 == l_LocalPlayer_0.UserId, 
                        onDismissTooltip = v60, 
                        layoutOrder = v65.getOrder, 
                        scrollingFrameStore = if l_GetFFlagPeoplePageLazyRenderCards_0() then v30.scrollingFrameStore else nil, 
                        shouldShowMenu = if l_GetFFlagPeoplePageLazyRenderCards_0() then v54 else nil
                    });
                end, false);
            else
                v63 = {};
                for v66, v67 in v49 do
                    v63["PersonCard_" .. v67.UserId] = v3.createElement(if l_GetFFlagPeoplePageLazyRenderCards_0() then v19 else v18, {
                        width = v33, 
                        person = v67, 
                        showTooltip = v59 and v66 == 1, 
                        onDismissTooltip = v60, 
                        layoutOrder = v66, 
                        scrollingFrameStore = if l_GetFFlagPeoplePageLazyRenderCards_0() then v30.scrollingFrameStore else nil, 
                        shouldShowMenu = if l_GetFFlagPeoplePageLazyRenderCards_0() then v54 else nil
                    });
                end;
            end;
        else
            v63 = if l_GetFFlagPeoplePageEnablePersonSignalStore_0() then v3.useMemo(function() --[[ Line: 194 ]]
                -- upvalues: v48 (copy), v3 (ref), l_GetFFlagPeoplePageLazyRenderCards_0 (ref), v19 (ref), v18 (ref), v33 (ref), v59 (copy), l_LocalPlayer_0 (ref), v60 (copy), v30 (copy), v54 (copy)
                local v68 = {};
                v48.peopleSignalMap.iterateData(function(v69, v70) --[[ Line: 197 ]]
                    -- upvalues: v68 (copy), v3 (ref), l_GetFFlagPeoplePageLazyRenderCards_0 (ref), v19 (ref), v18 (ref), v33 (ref), v59 (ref), l_LocalPlayer_0 (ref), v60 (ref), v30 (ref), v54 (ref)
                    v68["PersonCard_" .. v69] = v3.createElement(if l_GetFFlagPeoplePageLazyRenderCards_0() then v19 else v18, {
                        width = v33, 
                        person = v70.getPerson(), 
                        showTooltip = v59 and l_LocalPlayer_0 ~= nil and v69 == l_LocalPlayer_0.UserId, 
                        onDismissTooltip = v60, 
                        layoutOrder = v70.getOrder, 
                        scrollingFrameStore = if l_GetFFlagPeoplePageLazyRenderCards_0() then v30.scrollingFrameStore else nil, 
                        shouldShowMenu = if l_GetFFlagPeoplePageLazyRenderCards_0() then v54 else nil
                    });
                end, false);
                return v68;
            end, {
                v50, 
                v59, 
                v30.scrollingFrameStore, 
                v54
            }) else v3.useMemo(function() --[[ Line: 219 ]]
                -- upvalues: v49 (copy), v3 (ref), l_GetFFlagPeoplePageLazyRenderCards_0 (ref), v19 (ref), v18 (ref), v33 (ref), v59 (copy), v60 (copy), v30 (copy), v54 (copy)
                local v71 = {};
                for v72, v73 in v49 do
                    v71["PersonCard_" .. v73.UserId] = v3.createElement(if l_GetFFlagPeoplePageLazyRenderCards_0() then v19 else v18, {
                        width = v33, 
                        person = v73, 
                        showTooltip = v59 and v72 == 1, 
                        onDismissTooltip = v60, 
                        layoutOrder = v72, 
                        scrollingFrameStore = if l_GetFFlagPeoplePageLazyRenderCards_0() then v30.scrollingFrameStore else nil, 
                        shouldShowMenu = if l_GetFFlagPeoplePageLazyRenderCards_0() then v54 else nil
                    });
                end;
                return v71;
            end, {
                v49, 
                v59, 
                v30.scrollingFrameStore, 
                v54
            });
        end;
    end;
    if l_FFlagPeopleCardsEnableVirtualizedGrid_0 then
        local v75 = v3.useCallback(function(v74) --[[ Line: 246 ]]
            -- upvalues: v37 (ref), v32 (copy), l_Medium_0 (copy)
            v37(v32, v74, l_Medium_0);
        end, {
            v32, 
            l_Medium_0
        });
        local v78 = v3.useCallback(function(v76) --[[ Line: 250 ]]
            -- upvalues: v49 (copy), v3 (ref), v18 (ref), v33 (ref), v59 (copy), v60 (copy), v54 (copy)
            local v77 = if v76 > 0 and v76 <= #v49 then v49[v76] else nil;
            if not v77 then
                return nil;
            else
                return v3.createElement(v18, {
                    width = v33, 
                    person = v77, 
                    showTooltip = v59, 
                    onDismissTooltip = v60, 
                    shouldShowMenu = v54
                });
            end;
        end, {
            v49, 
            v59, 
            v54, 
            v60
        });
        return (v3.createElement(v20, {
            scrollingFrameStore = v30.scrollingFrameStore, 
            itemWidth = v33, 
            itemHeight = v35, 
            numColumns = v36, 
            gapSize = l_Medium_0, 
            numItems = #v49, 
            layoutOrder = v30.LayoutOrder, 
            onContainerWidthChanged = v75, 
            getElement = v78
        }));
    else
        return (v3.createElement(l_View_0, {
            tag = "size-full-0 auto-y", 
            layout = {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, l_Medium_0), 
                Wraps = true
            }, 
            LayoutOrder = v30.LayoutOrder, 
            onAbsoluteSizeChanged = v62
        }, v63));
    end;
end;
return v3.memo(v79);