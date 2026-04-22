local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiSharedUtilities");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.ReactRoblox);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Foundation);
local l_Loading_0 = v5.Loading;
local l_useTokens_0 = v5.Hooks.useTokens;
local v8 = require(l_Parent_0.DataHydration);
local v9 = require(l_Parent_0.ReactFocusNavigation);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local l_useCloseWithBackButton_0 = require(l_Parent_0.AppBlox).useCloseWithBackButton;
local v13 = require(l_Parent_0.SignalsReact);
local v14 = require(l_Parent_0.CollectionViews);
local l_CollectionItemSize_0 = v14.CollectionViewTypes.CollectionItemSize;
local l_getSduiComponentWrapper_0 = require(l_Parent_0.SduiCoreSystem).getSduiComponentWrapper;
local l_CompositionTags_0 = require(l_Parent_0.AppComposition).CompositionTags;
local v18 = require(l_script_FirstAncestor_0.getSduiApiStore);
local _ = require(l_script_FirstAncestor_0.SduiLoadTimer);
local v20 = require(l_script_FirstAncestor_0.SduiPageNavigationHeader);
local v21 = require(l_script_FirstAncestor_0.useCreateClientBindingSduiContext);
local l_NavButtonType_0 = require(l_script_FirstAncestor_0.SduiIntegrationTypes).NavButtonType;
local v23 = require(l_script_FirstAncestor_0.SduiPageErrorState);
local l_DataHydrationTypes_0 = v8.DataHydrationTypes;
local l_usePageSideMargin_0 = v14.usePageSideMargin;
local v26 = require(l_script_FirstAncestor_0.usePageEntrySnackbar);
local v27 = require(l_script_FirstAncestor_0.hooks.useComponentLifecycleTiming);
local v28 = require(l_script_FirstAncestor_0.hooks.useLocalAnalyticsData);
local v29 = require(l_script_FirstAncestor_0.hooks.useStatefulRef);
local v30 = require(l_script_FirstAncestor_0.hooks.useComponentConfig);
local v31 = require(l_script_FirstAncestor_0.hooks.useUiStatus);
local v32 = require(l_script_FirstAncestor_0.hooks.useDataUpdatedTimestamp);
local l_UiStatus_0 = require(l_script_FirstAncestor_0.SduiIntegrationTypes).UiStatus;
local l_Snackbar_0 = v5.Snackbar;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
local l_FFlagSduiCoreBadgeDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiCoreBadgeDetailsSupport;
local l_FFlagSduiFeedOptionalScrollingFrameFix_0 = require(l_Parent_0.SharedFlags).FFlagSduiFeedOptionalScrollingFrameFix;
local l_FFlagLuaAppSduiPageEntryPointSnackbar_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiPageEntryPointSnackbar;
local l_FFlagSduiExperienceDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiExperienceDetailsSupport;
local l_FFlagSduiPageEntryUseSharedHooks_0 = require(l_Parent_0.SharedFlags).FFlagSduiPageEntryUseSharedHooks;
local l_FFlagLuaAppCompositionSduiEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSduiEnabled;
local l_FFlagSduiUseSharedUiStatusHook_0 = require(l_Parent_0.SharedFlags).FFlagSduiUseSharedUiStatusHook;
local l_FFlagSduiChartsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiChartsSupport;
local l_FFlagSduiPageEntryCustomSlots_0 = require(l_Parent_0.SharedFlags).FFlagSduiPageEntryCustomSlots;
local function v86(v45, v46) --[[ Line: 124 ]] --[[ Name: SduiPageEntryPoint ]]
    -- upvalues: l_useTokens_0 (copy), l_useDispatch_0 (copy), l_FFlagSduiPageEntryUseSharedHooks_0 (copy), v30 (copy), v4 (copy), v18 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), v13 (copy), l_FFlagSduiUseSharedUiStatusHook_0 (copy), v31 (copy), l_UiStatus_0 (copy), l_DataHydrationTypes_0 (copy), v27 (copy), v28 (copy), v29 (copy), l_NavigateBack_0 (copy), v9 (copy), l_useCloseWithBackButton_0 (copy), l_FFlagLuaAppSduiPageEntryPointSnackbar_0 (copy), v26 (copy), l_FFlagSduiChartsSupport_0 (copy), v32 (copy), l_FFlagSduiCoreBadgeDetailsSupport_0 (copy), v21 (copy), l_FFlagLuaAppCompositionSduiEnabled_0 (copy), l_usePageSideMargin_0 (copy), l_CollectionItemSize_0 (copy), l_getSduiComponentWrapper_0 (copy), l_FFlagSduiFeedOptionalScrollingFrameFix_0 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy), v20 (copy), l_CompositionTags_0 (copy), l_NavButtonType_0 (copy), l_FFlagSduiPageEntryCustomSlots_0 (copy), v5 (copy), l_Loading_0 (copy), v23 (copy), v3 (copy), l_Snackbar_0 (copy), l_CoreGui_0 (copy)
    local l_appPage_0 = v45.appPage;
    local v48 = v45.configKey or l_appPage_0;
    local v49 = ("SduiPageEntryPoint-%*"):format(v48);
    local l_pageTimer_0 = v45.pageTimer;
    local v51 = l_useTokens_0();
    local v52 = l_useDispatch_0();
    local v53 = nil;
    if l_FFlagSduiPageEntryUseSharedHooks_0 then
        v53 = v30(v48, v45.identifier);
    else
        local v55 = v4.useCallback(function(v54) --[[ Line: 138 ]]
            -- upvalues: v18 (ref), v48 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (ref), v45 (copy)
            return v18().getRootConfig(v48, v54, if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v45.identifier else nil);
        end, {
            v48, 
            if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v45.identifier else nil
        });
        v53 = v13.useSignalState(v55);
    end;
    local v57 = v4.useCallback(function(v56) --[[ Line: 149 ]]
        -- upvalues: v18 (ref), v48 (copy)
        return v18().getTitle(v48, v56);
    end, {
        v48
    });
    local v58 = v13.useSignalState(v57) or v45.pageTitle;
    local v59 = nil;
    local v60 = nil;
    if l_FFlagSduiUseSharedUiStatusHook_0 then
        local v61 = v31(v48);
        v59 = v61 == l_UiStatus_0.Loading;
        v60 = v61 == l_UiStatus_0.Error;
    else
        local v62 = v13.useSignalState(v18().getData(v48).status);
        v59 = v62 == l_DataHydrationTypes_0.DataStatus.NotReady;
        v60 = v62 == l_DataHydrationTypes_0.DataStatus.Failed;
    end;
    if l_FFlagSduiPageEntryUseSharedHooks_0 then
        v27(l_pageTimer_0, typeof(v53) == "table");
    else
        v4.useEffect(function() --[[ Line: 169 ]]
            -- upvalues: l_pageTimer_0 (copy)
            if l_pageTimer_0 then
                l_pageTimer_0.logComponentMounted();
            end;
        end, {
            l_pageTimer_0
        });
        v4.useEffect(function() --[[ Line: 175 ]]
            -- upvalues: l_pageTimer_0 (copy), v53 (ref)
            if l_pageTimer_0 and v53 then
                l_pageTimer_0.logComponentReady();
            end;
        end, {
            l_pageTimer_0, 
            v53
        });
    end;
    local v63 = if l_FFlagSduiPageEntryUseSharedHooks_0 then v28(v48, l_appPage_0, v45.additionalAnalyticsData) else v4.useMemo(function() --[[ Line: 184 ]]
        -- upvalues: v48 (copy), l_appPage_0 (copy)
        return {
            configKey = v48, 
            appPage = l_appPage_0
        };
    end, {
        v48, 
        l_appPage_0
    });
    local v64 = nil;
    local v65 = nil;
    if l_FFlagSduiPageEntryUseSharedHooks_0 then
        local v66, v67 = v29(v46);
        v64 = v66;
        v65 = v67;
    else
        local v68, v69 = v4.useState(nil);
        v64 = v68;
        v65 = v69;
        v4.useRef(v64).current = v64;
    end;
    local v70 = v4.useCallback(function() --[[ Line: 201 ]]
        -- upvalues: v45 (copy), v52 (copy), l_NavigateBack_0 (ref)
        if v45.onCloseActivated then
            v45.onCloseActivated();
            return;
        else
            v52(l_NavigateBack_0());
            return;
        end;
    end, {
        v52, 
        v45.onCloseActivated
    });
    local _, v72 = v9.useMostRecentOrDefaultFocusBehavior(v65);
    local v73 = l_useCloseWithBackButton_0(v72, v70);
    local v74 = if l_FFlagLuaAppSduiPageEntryPointSnackbar_0 then v26(v48) else nil;
    local v75 = nil;
    if l_FFlagSduiChartsSupport_0 then
        v75 = v32(v48, v45.identifier);
    end;
    local v76 = nil;
    local v77 = nil;
    local v78 = nil;
    local v79 = nil;
    local v80 = nil;
    if l_FFlagSduiCoreBadgeDetailsSupport_0 then
        local v81, v82 = v4.useState(nil);
        v76 = v81;
        v77 = v82;
        v78 = v21(l_appPage_0, v76, not l_FFlagLuaAppCompositionSduiEnabled_0 and 0 or nil, if l_FFlagSduiChartsSupport_0 then v75 else nil);
        v79 = v64 == nil;
        if not l_FFlagLuaAppCompositionSduiEnabled_0 then
            v80 = l_usePageSideMargin_0(v64);
        end;
    else
        v78 = v21(l_appPage_0, v64, nil, if l_FFlagSduiChartsSupport_0 then v75 else nil);
        v80 = v13.useSignalState(v78.getPageLayoutConfig(l_CollectionItemSize_0.Small)).sideMargin;
    end;
    local v84 = v4.useMemo(function() --[[ Line: 251 ]]
        -- upvalues: v53 (ref), l_getSduiComponentWrapper_0 (ref), v4 (ref), v49 (copy), v78 (ref), v63 (copy), l_FFlagSduiFeedOptionalScrollingFrameFix_0 (ref), v45 (copy), l_FFlagLuaAppCompositionSduiEnabled_0 (ref), l_FFlagSduiChartsSupport_0 (ref)
        if v53 == nil then
            return nil;
        else
            local v83 = l_getSduiComponentWrapper_0(v53);
            return v4.createElement(v83, {
                debugName = v49, 
                componentConfig = v53, 
                sduiContext = v78, 
                localAnalyticsData = v63, 
                extraLocalProps = if l_FFlagSduiFeedOptionalScrollingFrameFix_0 then {
                    pageBottomPadding = v45.pageBottomPadding, 
                    scrollingFrameRef = v45.scrollingFrameRef, 
                    defaultContentTag = if l_FFlagLuaAppCompositionSduiEnabled_0 then v45.contentTag else nil, 
                    defaultStickyContentTag = if l_FFlagSduiChartsSupport_0 then v45.stickyContentTag else nil
                } else nil
            });
        end;
    end, {
        v53, 
        v49, 
        v78, 
        v63, 
        if l_FFlagLuaAppCompositionSduiEnabled_0 then v45.contentTag else nil, 
        if l_FFlagSduiChartsSupport_0 then v45.stickyContentTag else nil, 
        if l_FFlagLuaAppCompositionSduiEnabled_0 then v45.pageBottomPadding else nil, 
        if l_FFlagLuaAppCompositionSduiEnabled_0 then v45.scrollingFrameRef else nil
    });
    local v85 = if l_FFlagSduiFeedOptionalScrollingFrameFix_0 then v45.scrollingFrameRef ~= nil else nil;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, v85 and 0 or 1, 0), 
        AutomaticSize = if v85 then Enum.AutomaticSize.Y else nil, 
        BorderSizePixel = 0, 
        BackgroundTransparency = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 and v45.backgroundStyle then v45.backgroundStyle.Transparency else 0, 
        BackgroundColor3 = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 and v45.backgroundStyle then v45.backgroundStyle.Color3 else v51.Color.Surface.Surface_0.Color3, 
        ref = v73, 
        ClipsDescendants = if l_FFlagSduiExperienceDetailsSupport_0 and v45.clipsDescendantsOverride ~= nil then v45.clipsDescendantsOverride else l_FFlagSduiCoreBadgeDetailsSupport_0 and true or nil
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = if l_FFlagSduiCoreBadgeDetailsSupport_0 then Enum.HorizontalAlignment.Center else nil
        }), 
        PageHeader = if l_FFlagSduiCoreBadgeDetailsSupport_0 and v79 then nil else if v45.includeNavigationHeaderBar then v4.createElement(v20, {
            title = v58, 
            contentTag = if l_FFlagLuaAppCompositionSduiEnabled_0 then v45.headerContentTag or l_CompositionTags_0.ContentRegion.Header else nil, 
            pageSideMargin = if not l_FFlagLuaAppCompositionSduiEnabled_0 then v80 else nil, 
            layoutOrder = 1, 
            renderUtilities = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v45.renderUtilities else nil, 
            navButtonType = v45.navButtonType or l_NavButtonType_0.back, 
            closeCallback = v70
        }) else nil, 
        PageBody = if l_FFlagSduiFeedOptionalScrollingFrameFix_0 and v59 then if l_FFlagSduiPageEntryCustomSlots_0 and v45.loadingSlot then v45.loadingSlot else v4.createElement(v5.View, {
            Size = UDim2.new(1, 0, 1, 0)
        }, v4.createElement(l_Loading_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5)
        })) else if l_FFlagSduiFeedOptionalScrollingFrameFix_0 and v60 then if l_FFlagSduiPageEntryCustomSlots_0 and v45.errorSlot then v45.errorSlot else v4.createElement(v23, {
            refresh = v45.refresh
        }) else v4.createElement("Frame", {
            BorderSizePixel = 0, 
            Size = UDim2.new(1, (not l_FFlagSduiCoreBadgeDetailsSupport_0 or v45.disableRootPadding or l_FFlagLuaAppCompositionSduiEnabled_0) and 0 or v80 * -2, v85 and 0 or 1, 0), 
            AutomaticSize = if v85 then Enum.AutomaticSize.Y else nil, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            ref = if l_FFlagSduiCoreBadgeDetailsSupport_0 then v77 else nil
        }, {
            UIFlexItem = if l_FFlagSduiFeedOptionalScrollingFrameFix_0 and v85 then nil else v4.createElement("UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Fill
            }), 
            Content = if l_FFlagSduiCoreBadgeDetailsSupport_0 and v79 then nil else if not l_FFlagSduiFeedOptionalScrollingFrameFix_0 and v59 then v4.createElement(l_Loading_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5)
            }) else if not l_FFlagSduiFeedOptionalScrollingFrameFix_0 and v60 then v4.createElement(v23, {
                refresh = v45.refresh
            }) else v84
        }), 
        SnackbarPortal = if v74 and v74.snackbarConfig then v3.createPortal({
            SduiSnackbarScreenGui = v4.createElement("ScreenGui", {
                DisplayOrder = v45.snackbarPortalLayoutOrder, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                IgnoreGuiInset = true
            }, {
                Snackbar = v4.createElement(l_Snackbar_0, {
                    title = v74.snackbarConfig.title, 
                    icon = v74.snackbarConfig.icon, 
                    Position = UDim2.new(0.5, 0, 1, -v51.Padding.XLarge), 
                    AnchorPoint = Vector2.new(0.5, 1), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    onClose = v74.onDismiss
                })
            })
        }, l_CoreGui_0) else nil
    });
end;
if l_FFlagSduiPageEntryUseSharedHooks_0 then
    return v4.memo(v4.forwardRef(v86));
else
    return v4.memo(v86);
end;