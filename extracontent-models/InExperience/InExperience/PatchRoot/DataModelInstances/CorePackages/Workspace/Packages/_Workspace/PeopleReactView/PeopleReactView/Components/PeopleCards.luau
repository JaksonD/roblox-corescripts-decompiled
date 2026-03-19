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
local v16 = require(l_script_FirstAncestor_0.Hooks.useGetPeopleService);
local v17 = require(l_script_FirstAncestor_0.Components.Card.PersonCard);
local v18 = require(l_script_FirstAncestor_0.Components.Card.LazyPersonCard);
local v19 = require(l_script_FirstAncestor_0.Constants);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v21 = v13.getService("Flags");
local l_GetFFlagPeoplePageEnablePersonSignalStore_0 = v21.GetFFlagPeoplePageEnablePersonSignalStore;
local l_GetFFlagPeoplePageLazyRenderCards_0 = v21.GetFFlagPeoplePageLazyRenderCards;
local l_FFlagPeoplePageRemoveUseMemoElements_0 = v21.FFlagPeoplePageRemoveUseMemoElements;
local v25 = game:DefineFastInt("MaxNumUniversesExposedToCardTooltip", 3);
local v26 = false;
local function v58(v27) --[[ Line: 57 ]] --[[ Name: PeopleCards ]]
    -- upvalues: l_useTokens_0 (copy), l_useScaledValue_0 (copy), v19 (copy), v15 (copy), v16 (copy), l_GetFFlagPeoplePageEnablePersonSignalStore_0 (copy), v4 (copy), l_GetFFlagPeoplePageLazyRenderCards_0 (copy), l_useLastInputMode_0 (copy), l_usePreferredInput_0 (copy), v3 (copy), l_Input_0 (copy), v26 (ref), v25 (copy), l_FFlagPeoplePageRemoveUseMemoElements_0 (copy), v18 (copy), v17 (copy), l_LocalPlayer_0 (copy), l_View_0 (copy)
    local l_Medium_0 = l_useTokens_0().Gap.Medium;
    local v29 = l_useScaledValue_0(v19.PEOPLEPAGE.PEOPLE_CARDS.MINIMUM_CARD_WIDTH);
    local v30, v31 = v15();
    local v32 = v16("PeopleListStore");
    local v33 = if not l_GetFFlagPeoplePageEnablePersonSignalStore_0() then v4.useSignalState(v32.people) else nil;
    local v34 = if l_GetFFlagPeoplePageEnablePersonSignalStore_0() then v4.useSignalState(v32.peopleSignalMap.getCount) else nil;
    local v35 = if l_GetFFlagPeoplePageLazyRenderCards_0() then l_useLastInputMode_0() else nil;
    local v36 = if l_GetFFlagPeoplePageLazyRenderCards_0() then l_usePreferredInput_0() else nil;
    local v38 = if l_GetFFlagPeoplePageLazyRenderCards_0() then v3.useMemo(function() --[[ Line: 78 ]]
        -- upvalues: v35 (copy), v36 (copy), l_Input_0 (ref)
        local v37 = true;
        if v35 ~= "Focus" then
            v37 = v36 ~= l_Input_0.Pointer;
        end;
        return v37;
    end, {
        v35, 
        v36
    }) else nil;
    local v43 = v3.useMemo(function() --[[ Line: 83 ]]
        -- upvalues: v26 (ref), v27 (copy), v19 (ref), v25 (ref)
        if v26 or not v27.getUniversesExposedTo or not v27.addUniverseToExposureList then
            return false;
        else
            local v39 = v27.getUniversesExposedTo(v19.PEOPLEPAGE.CARD_TOOLTIP.UNIVERSES_EXPOSED_TO_CARD_TOOLTIP);
            local v40 = 0;
            for _, v42 in v39 do
                if v42 == game.GameId then
                    return false;
                else
                    v40 = v40 + 1;
                end;
            end;
            if v25 <= v40 then
                return false;
            else
                v27.addUniverseToExposureList(v19.PEOPLEPAGE.CARD_TOOLTIP.UNIVERSES_EXPOSED_TO_CARD_TOOLTIP, game.GameId);
                return true;
            end;
        end;
    end, {
        v27.getUniversesExposedTo, 
        v27.addUniverseToExposureList
    });
    local v44 = v3.useCallback(function() --[[ Line: 109 ]]
        -- upvalues: v26 (ref)
        v26 = true;
    end, {});
    v3.useEffect(function() --[[ Line: 113 ]]
        -- upvalues: v44 (copy)
        return function() --[[ Line: 114 ]]
            -- upvalues: v44 (ref)
            v44();
        end;
    end, {});
    local v46 = v3.useCallback(function(v45) --[[ Line: 119 ]]
        -- upvalues: v31 (copy), v29 (copy), l_Medium_0 (copy)
        v31(v29, v45.AbsoluteSize.X, l_Medium_0);
    end, {
        v31, 
        v29, 
        l_Medium_0
    });
    local v47 = {};
    if l_FFlagPeoplePageRemoveUseMemoElements_0 then
        if l_GetFFlagPeoplePageEnablePersonSignalStore_0() then
            v47 = {};
            v32.peopleSignalMap.iterateData(function(v48, v49) --[[ Line: 128 ]]
                -- upvalues: v47 (ref), v3 (ref), l_GetFFlagPeoplePageLazyRenderCards_0 (ref), v18 (ref), v17 (ref), v30 (copy), v43 (copy), l_LocalPlayer_0 (ref), v44 (copy), v27 (copy), v38 (copy)
                v47["PersonCard_" .. v48] = v3.createElement(if l_GetFFlagPeoplePageLazyRenderCards_0() then v18 else v17, {
                    width = v30, 
                    person = v49.getPerson(), 
                    showTooltip = v43 and l_LocalPlayer_0 ~= nil and v48 == l_LocalPlayer_0.UserId, 
                    onDismissTooltip = v44, 
                    layoutOrder = v49.getOrder, 
                    scrollingFrameStore = if l_GetFFlagPeoplePageLazyRenderCards_0() then v27.scrollingFrameStore else nil, 
                    shouldShowMenu = if l_GetFFlagPeoplePageLazyRenderCards_0() then v38 else nil
                });
            end, false);
        else
            v47 = {};
            for v50, v51 in v33 do
                v47["PersonCard_" .. v51.UserId] = v3.createElement(if l_GetFFlagPeoplePageLazyRenderCards_0() then v18 else v17, {
                    width = v30, 
                    person = v51, 
                    showTooltip = v43 and v50 == 1, 
                    onDismissTooltip = v44, 
                    layoutOrder = v50, 
                    scrollingFrameStore = if l_GetFFlagPeoplePageLazyRenderCards_0() then v27.scrollingFrameStore else nil, 
                    shouldShowMenu = if l_GetFFlagPeoplePageLazyRenderCards_0() then v38 else nil
                });
            end;
        end;
    else
        v47 = if l_GetFFlagPeoplePageEnablePersonSignalStore_0() then v3.useMemo(function() --[[ Line: 162 ]]
            -- upvalues: v32 (copy), v3 (ref), l_GetFFlagPeoplePageLazyRenderCards_0 (ref), v18 (ref), v17 (ref), v30 (copy), v43 (copy), l_LocalPlayer_0 (ref), v44 (copy), v27 (copy), v38 (copy)
            local v52 = {};
            v32.peopleSignalMap.iterateData(function(v53, v54) --[[ Line: 165 ]]
                -- upvalues: v52 (copy), v3 (ref), l_GetFFlagPeoplePageLazyRenderCards_0 (ref), v18 (ref), v17 (ref), v30 (ref), v43 (ref), l_LocalPlayer_0 (ref), v44 (ref), v27 (ref), v38 (ref)
                v52["PersonCard_" .. v53] = v3.createElement(if l_GetFFlagPeoplePageLazyRenderCards_0() then v18 else v17, {
                    width = v30, 
                    person = v54.getPerson(), 
                    showTooltip = v43 and l_LocalPlayer_0 ~= nil and v53 == l_LocalPlayer_0.UserId, 
                    onDismissTooltip = v44, 
                    layoutOrder = v54.getOrder, 
                    scrollingFrameStore = if l_GetFFlagPeoplePageLazyRenderCards_0() then v27.scrollingFrameStore else nil, 
                    shouldShowMenu = if l_GetFFlagPeoplePageLazyRenderCards_0() then v38 else nil
                });
            end, false);
            return v52;
        end, {
            v34, 
            v43, 
            v27.scrollingFrameStore, 
            v38
        }) else v3.useMemo(function() --[[ Line: 185 ]]
            -- upvalues: v33 (copy), v3 (ref), l_GetFFlagPeoplePageLazyRenderCards_0 (ref), v18 (ref), v17 (ref), v30 (copy), v43 (copy), v44 (copy), v27 (copy), v38 (copy)
            local v55 = {};
            for v56, v57 in v33 do
                v55["PersonCard_" .. v57.UserId] = v3.createElement(if l_GetFFlagPeoplePageLazyRenderCards_0() then v18 else v17, {
                    width = v30, 
                    person = v57, 
                    showTooltip = v43 and v56 == 1, 
                    onDismissTooltip = v44, 
                    layoutOrder = v56, 
                    scrollingFrameStore = if l_GetFFlagPeoplePageLazyRenderCards_0() then v27.scrollingFrameStore else nil, 
                    shouldShowMenu = if l_GetFFlagPeoplePageLazyRenderCards_0() then v38 else nil
                });
            end;
            return v55;
        end, {
            v33, 
            v43, 
            v27.scrollingFrameStore, 
            v38
        });
    end;
    return v3.createElement(l_View_0, {
        tag = "size-full-0 auto-y", 
        layout = {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_Medium_0), 
            Wraps = true
        }, 
        LayoutOrder = v27.LayoutOrder, 
        onAbsoluteSizeChanged = v46
    }, v47);
end;
return v3.memo(v58);