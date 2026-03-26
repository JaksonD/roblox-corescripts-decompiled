local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.RobloxAppEnums);
local v4 = require(l_Parent_1.RobloxAppHooks);
local v5 = require(l_Parent_1.Foundation);
local v6 = require(l_Parent_1.PeopleService);
local l_useDeviceOrientation_0 = v4.useDeviceOrientation;
local v8 = require(l_Parent_0.Hooks.useGetPeopleService);
local v9 = require(l_Parent_0.Hooks.useScrollingFrameStore);
local l_View_0 = v5.View;
local v11 = require(l_Parent_0.Components.PeopleList);
local v12 = require(l_Parent_0.Components.PeopleCards);
local v13 = require(l_Parent_0.Components.CoreButtonRow);
local v14 = require(l_Parent_0.Components.MenuButtonsWrapper);
local v15 = require(l_Parent_0.Components.TitleBar);
local l_GameSettings_0 = UserSettings().GameSettings;
local v17 = v6.getService("Flags");
local l_GetFFlagAddPeoplePageCardLayout_0 = v17.GetFFlagAddPeoplePageCardLayout;
local l_GetFFlagPeoplePageLazyRenderCards_0 = v17.GetFFlagPeoplePageLazyRenderCards;
local l_GetFFlagPeoplePagePostponeInitialRender_0 = v17.GetFFlagPeoplePagePostponeInitialRender;
local l_FFlagEnablePeopleListLazyRender_0 = v17.FFlagEnablePeopleListLazyRender;
local l_FFlagPeoplePageRemoveUseMemoElements_0 = v17.FFlagPeoplePageRemoveUseMemoElements;
local l_FFlagPeopleCardsEnableVirtualizedGrid_0 = v17.FFlagPeopleCardsEnableVirtualizedGrid;
return function(v24) --[[ Line: 40 ]] --[[ Name: _createPageView ]]
    -- upvalues: l_GetFFlagAddPeoplePageCardLayout_0 (copy), v8 (copy), v2 (copy), v6 (copy), l_useDeviceOrientation_0 (copy), v3 (copy), l_GameSettings_0 (copy), l_GetFFlagPeoplePagePostponeInitialRender_0 (copy), l_GetFFlagPeoplePageLazyRenderCards_0 (copy), l_FFlagEnablePeopleListLazyRender_0 (copy), l_FFlagPeopleCardsEnableVirtualizedGrid_0 (copy), v9 (copy), l_FFlagPeoplePageRemoveUseMemoElements_0 (copy), v12 (copy), v11 (copy), l_View_0 (copy), v14 (copy), v13 (copy), v15 (copy)
    local v25 = if l_GetFFlagAddPeoplePageCardLayout_0() then v8("PeopleAnalyticsManager") else nil;
    local v26 = nil;
    v26 = if l_GetFFlagAddPeoplePageCardLayout_0() then v8("PeopleBlockingModalManager") else v2.useMemo(function() --[[ Line: 61 ]]
        -- upvalues: v6 (ref)
        return v6.getService("PeopleBlockingModalManager");
    end, {});
    local v27 = v2.useMemo(function() --[[ Line: 67 ]]
        -- upvalues: v26 (ref), v24 (copy)
        return v26.getModalManager(v24.blockingModalScreen, v24.blockingFlags);
    end, {
        v26, 
        v24.blockingModalScreen, 
        v24.blockingFlags
    });
    local v28 = l_useDeviceOrientation_0() == v3.DeviceOrientationMode.Portrait;
    local v29 = nil;
    local v30 = nil;
    if l_GetFFlagAddPeoplePageCardLayout_0() then
        local v31, v32 = v2.useState(l_GameSettings_0.PeoplePageLayout);
        v29 = v31;
        v30 = v32;
    end;
    local v33 = nil;
    local v34 = nil;
    if l_GetFFlagPeoplePagePostponeInitialRender_0() then
        local v35, v36 = v2.useState(false);
        v33 = v35;
        v34 = v36;
    end;
    local v37 = if not not l_GetFFlagPeoplePageLazyRenderCards_0() or l_FFlagEnablePeopleListLazyRender_0 or l_FFlagPeopleCardsEnableVirtualizedGrid_0 then v9(v24.scrollingFrame) else nil;
    local v39 = if l_GetFFlagAddPeoplePageCardLayout_0() then v2.useCallback(function(v38) --[[ Line: 91 ]]
        -- upvalues: v25 (copy), v30 (ref)
        v25:trackPeoplePageLayoutChanged(v38);
        v30(v38);
    end, {}) else nil;
    local v40 = nil;
    v40 = if l_FFlagPeoplePageRemoveUseMemoElements_0 then if v29 == Enum.PeoplePageLayout.Card then v2.createElement(v12, {
        getUniversesExposedTo = v24.getUniversesExposedTo, 
        addUniverseToExposureList = v24.addUniverseToExposureList, 
        scrollingFrameStore = if v24.scrollingFrame then v37 else nil, 
        LayoutOrder = 3
    }) else v2.createElement(v11, {
        scrollingFrameStore = if l_FFlagEnablePeopleListLazyRender_0 and v24.scrollingFrame then v37 else nil, 
        LayoutOrder = 3
    }) else if l_GetFFlagAddPeoplePageCardLayout_0() then v2.useMemo(function() --[[ Line: 117 ]]
        -- upvalues: v29 (ref), v2 (ref), v12 (ref), v24 (copy), v37 (copy), v11 (ref), l_FFlagEnablePeopleListLazyRender_0 (ref)
        if v29 == Enum.PeoplePageLayout.Card then
            return (v2.createElement(v12, {
                getUniversesExposedTo = v24.getUniversesExposedTo, 
                addUniverseToExposureList = v24.addUniverseToExposureList, 
                scrollingFrameStore = if v24.scrollingFrame then v37 else nil, 
                LayoutOrder = 3
            }));
        else
            return (v2.createElement(v11, {
                scrollingFrameStore = if l_FFlagEnablePeopleListLazyRender_0 and v24.scrollingFrame then v37 else nil, 
                LayoutOrder = 3
            }));
        end;
    end, {
        v29, 
        v37, 
        v24.scrollingFrame, 
        v24.getUniversesExposedTo, 
        v24.addUniverseToExposureList
    }) else nil;
    if l_GetFFlagPeoplePagePostponeInitialRender_0() then
        v2.useEffect(function() --[[ Line: 146 ]]
            -- upvalues: v34 (ref)
            v34(true);
        end, {});
    end;
    return v2.createElement(l_View_0, {
        tag = {
            ["size-full col gap-large padding-bottom-small"] = true, 
            ["padding-x-medium"] = not v28
        }, 
        testId = "mainView"
    }, {
        MenuButtonsWrapper = v2.createElement(v14), 
        CoreButtonRow = v2.createElement(v13, {
            chromeEnabled = v24.chromeEnabled, 
            LayoutOrder = l_GetFFlagAddPeoplePageCardLayout_0() and 1 or nil
        }), 
        TitleBar = if l_GetFFlagAddPeoplePageCardLayout_0() then v2.createElement(v15, {
            layout = v29, 
            setLayout = v39, 
            LayoutOrder = 2
        }) else nil, 
        People = if not l_GetFFlagPeoplePagePostponeInitialRender_0() or v33 then if l_GetFFlagAddPeoplePageCardLayout_0() then v40 else v2.createElement(v11, {
            scrollingFrameStore = if l_FFlagEnablePeopleListLazyRender_0 and v24.scrollingFrame then v37 else nil
        }) else nil, 
        BlockingModalManager = v2.createElement(v27)
    });
end;