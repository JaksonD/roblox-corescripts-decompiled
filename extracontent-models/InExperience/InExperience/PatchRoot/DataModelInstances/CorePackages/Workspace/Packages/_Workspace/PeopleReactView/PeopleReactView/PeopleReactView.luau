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
return function(v23) --[[ Line: 39 ]] --[[ Name: _createPageView ]]
    -- upvalues: l_GetFFlagAddPeoplePageCardLayout_0 (copy), v8 (copy), v2 (copy), v6 (copy), l_useDeviceOrientation_0 (copy), v3 (copy), l_GameSettings_0 (copy), l_GetFFlagPeoplePagePostponeInitialRender_0 (copy), l_GetFFlagPeoplePageLazyRenderCards_0 (copy), l_FFlagEnablePeopleListLazyRender_0 (copy), v9 (copy), l_FFlagPeoplePageRemoveUseMemoElements_0 (copy), v12 (copy), v11 (copy), l_View_0 (copy), v14 (copy), v13 (copy), v15 (copy)
    local v24 = if l_GetFFlagAddPeoplePageCardLayout_0() then v8("PeopleAnalyticsManager") else nil;
    local v25 = nil;
    v25 = if l_GetFFlagAddPeoplePageCardLayout_0() then v8("PeopleBlockingModalManager") else v2.useMemo(function() --[[ Line: 60 ]]
        -- upvalues: v6 (ref)
        return v6.getService("PeopleBlockingModalManager");
    end, {});
    local v26 = v2.useMemo(function() --[[ Line: 66 ]]
        -- upvalues: v25 (ref), v23 (copy)
        return v25.getModalManager(v23.blockingModalScreen, v23.blockingFlags);
    end, {
        v25, 
        v23.blockingModalScreen, 
        v23.blockingFlags
    });
    local v27 = l_useDeviceOrientation_0() == v3.DeviceOrientationMode.Portrait;
    local v28 = nil;
    local v29 = nil;
    if l_GetFFlagAddPeoplePageCardLayout_0() then
        local v30, v31 = v2.useState(l_GameSettings_0.PeoplePageLayout);
        v28 = v30;
        v29 = v31;
    end;
    local v32 = nil;
    local v33 = nil;
    if l_GetFFlagPeoplePagePostponeInitialRender_0() then
        local v34, v35 = v2.useState(false);
        v32 = v34;
        v33 = v35;
    end;
    local v36 = if not not l_GetFFlagPeoplePageLazyRenderCards_0() or l_FFlagEnablePeopleListLazyRender_0 then v9(v23.scrollingFrame) else nil;
    local v38 = if l_GetFFlagAddPeoplePageCardLayout_0() then v2.useCallback(function(v37) --[[ Line: 88 ]]
        -- upvalues: v24 (copy), v29 (ref)
        v24:trackPeoplePageLayoutChanged(v37);
        v29(v37);
    end, {}) else nil;
    local v39 = nil;
    v39 = if l_FFlagPeoplePageRemoveUseMemoElements_0 then if v28 == Enum.PeoplePageLayout.Card then v2.createElement(v12, {
        getUniversesExposedTo = v23.getUniversesExposedTo, 
        addUniverseToExposureList = v23.addUniverseToExposureList, 
        scrollingFrameStore = if v23.scrollingFrame then v36 else nil, 
        LayoutOrder = 3
    }) else v2.createElement(v11, {
        scrollingFrameStore = if l_FFlagEnablePeopleListLazyRender_0 and v23.scrollingFrame then v36 else nil, 
        LayoutOrder = 3
    }) else if l_GetFFlagAddPeoplePageCardLayout_0() then v2.useMemo(function() --[[ Line: 114 ]]
        -- upvalues: v28 (ref), v2 (ref), v12 (ref), v23 (copy), v36 (copy), v11 (ref), l_FFlagEnablePeopleListLazyRender_0 (ref)
        if v28 == Enum.PeoplePageLayout.Card then
            return (v2.createElement(v12, {
                getUniversesExposedTo = v23.getUniversesExposedTo, 
                addUniverseToExposureList = v23.addUniverseToExposureList, 
                scrollingFrameStore = if v23.scrollingFrame then v36 else nil, 
                LayoutOrder = 3
            }));
        else
            return (v2.createElement(v11, {
                scrollingFrameStore = if l_FFlagEnablePeopleListLazyRender_0 and v23.scrollingFrame then v36 else nil, 
                LayoutOrder = 3
            }));
        end;
    end, {
        v28, 
        v36, 
        v23.scrollingFrame, 
        v23.getUniversesExposedTo, 
        v23.addUniverseToExposureList
    }) else nil;
    if l_GetFFlagPeoplePagePostponeInitialRender_0() then
        v2.useEffect(function() --[[ Line: 143 ]]
            -- upvalues: v33 (ref)
            v33(true);
        end, {});
    end;
    return v2.createElement(l_View_0, {
        tag = {
            ["size-full col gap-large padding-bottom-small"] = true, 
            ["padding-x-medium"] = not v27
        }, 
        testId = "mainView"
    }, {
        MenuButtonsWrapper = v2.createElement(v14), 
        CoreButtonRow = v2.createElement(v13, {
            chromeEnabled = v23.chromeEnabled, 
            LayoutOrder = l_GetFFlagAddPeoplePageCardLayout_0() and 1 or nil
        }), 
        TitleBar = if l_GetFFlagAddPeoplePageCardLayout_0() then v2.createElement(v15, {
            layout = v28, 
            setLayout = v38, 
            LayoutOrder = 2
        }) else nil, 
        People = if not l_GetFFlagPeoplePagePostponeInitialRender_0() or v32 then if l_GetFFlagAddPeoplePageCardLayout_0() then v39 else v2.createElement(v11, {
            scrollingFrameStore = if l_FFlagEnablePeopleListLazyRender_0 and v23.scrollingFrame then v36 else nil
        }) else nil, 
        BlockingModalManager = v2.createElement(v26)
    });
end;