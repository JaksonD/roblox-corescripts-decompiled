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
local v17 = require(l_script_FirstAncestor_0.getSduiApiStore);
local _ = require(l_script_FirstAncestor_0.SduiLoadTimer);
local v19 = require(l_script_FirstAncestor_0.SduiPageNavigationHeader);
local v20 = require(l_script_FirstAncestor_0.useCreateClientBindingSduiContext);
local l_NavButtonType_0 = require(l_script_FirstAncestor_0.SduiIntegrationTypes).NavButtonType;
local v22 = require(l_script_FirstAncestor_0.SduiPageErrorState);
local l_DataHydrationTypes_0 = v8.DataHydrationTypes;
local l_usePageSideMargin_0 = v14.usePageSideMargin;
local v25 = require(l_script_FirstAncestor_0.usePageEntrySnackbar);
local l_Snackbar_0 = v5.Snackbar;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
local l_FFlagSduiCoreBadgeDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiCoreBadgeDetailsSupport;
local l_FFlagSduiFeedOptionalScrollingFrameFix_0 = require(l_Parent_0.SharedFlags).FFlagSduiFeedOptionalScrollingFrameFix;
local l_FFlagLuaAppSduiPageEntryPointSnackbar_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiPageEntryPointSnackbar;
return v4.memo(function(v31) --[[ Line: 89 ]] --[[ Name: SduiPageEntryPoint ]]
    -- upvalues: l_useTokens_0 (copy), l_useDispatch_0 (copy), v4 (copy), v17 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), v13 (copy), l_DataHydrationTypes_0 (copy), l_NavigateBack_0 (copy), v9 (copy), l_useCloseWithBackButton_0 (copy), l_FFlagLuaAppSduiPageEntryPointSnackbar_0 (copy), v25 (copy), l_FFlagSduiCoreBadgeDetailsSupport_0 (copy), v20 (copy), l_usePageSideMargin_0 (copy), l_CollectionItemSize_0 (copy), l_getSduiComponentWrapper_0 (copy), l_FFlagSduiFeedOptionalScrollingFrameFix_0 (copy), v19 (copy), l_NavButtonType_0 (copy), v5 (copy), l_Loading_0 (copy), v22 (copy), v3 (copy), l_Snackbar_0 (copy), l_CoreGui_0 (copy)
    local l_appPage_0 = v31.appPage;
    local v33 = v31.configKey or l_appPage_0;
    local v34 = ("SduiPageEntryPoint-%*"):format(v33);
    local l_pageTimer_0 = v31.pageTimer;
    local v36 = l_useTokens_0();
    local v37 = l_useDispatch_0();
    local v39 = v4.useCallback(function(v38) --[[ Line: 99 ]]
        -- upvalues: v17 (ref), v33 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (ref), v31 (copy)
        return v17().getRootConfig(v33, v38, if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v31.identifier else nil);
    end, {
        v33, 
        if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v31.identifier else nil
    });
    local v40 = v13.useSignalState(v39);
    local v42 = v4.useCallback(function(v41) --[[ Line: 109 ]]
        -- upvalues: v17 (ref), v33 (copy)
        return v17().getTitle(v33, v41);
    end, {
        v33
    });
    local v43 = v13.useSignalState(v42) or v31.pageTitle;
    local v44 = v13.useSignalState(v17().getData(v33).status);
    local v45 = v44 == l_DataHydrationTypes_0.DataStatus.NotReady;
    local v46 = v44 == l_DataHydrationTypes_0.DataStatus.Failed;
    v4.useEffect(function() --[[ Line: 119 ]]
        -- upvalues: l_pageTimer_0 (copy)
        if l_pageTimer_0 then
            l_pageTimer_0.logComponentMounted();
        end;
    end, {
        l_pageTimer_0
    });
    v4.useEffect(function() --[[ Line: 125 ]]
        -- upvalues: l_pageTimer_0 (copy), v40 (copy)
        if l_pageTimer_0 and v40 then
            l_pageTimer_0.logComponentReady();
        end;
    end, {
        l_pageTimer_0, 
        v40
    });
    local v47 = v4.useMemo(function() --[[ Line: 131 ]]
        -- upvalues: v33 (copy), l_appPage_0 (copy)
        return {
            configKey = v33, 
            appPage = l_appPage_0
        };
    end, {
        v33, 
        l_appPage_0
    });
    local v48, v49 = v4.useState(nil);
    v4.useRef(v48).current = v48;
    local v50 = v4.useCallback(function() --[[ Line: 143 ]]
        -- upvalues: v31 (copy), v37 (copy), l_NavigateBack_0 (ref)
        if v31.onCloseActivated then
            v31.onCloseActivated();
            return;
        else
            v37(l_NavigateBack_0());
            return;
        end;
    end, {
        v37, 
        v31.onCloseActivated
    });
    local _, v52 = v9.useMostRecentOrDefaultFocusBehavior(v49);
    local v53 = l_useCloseWithBackButton_0(v52, v50);
    local v54 = if l_FFlagLuaAppSduiPageEntryPointSnackbar_0 then v25(v33) else nil;
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    local v59 = nil;
    if l_FFlagSduiCoreBadgeDetailsSupport_0 then
        local v60, v61 = v4.useState(nil);
        v55 = v60;
        v56 = v61;
        v57 = v20(l_appPage_0, v55, 0);
        v58 = v48 == nil;
        v59 = l_usePageSideMargin_0(v48);
    else
        v57 = v20(l_appPage_0, v48);
        v59 = v13.useSignalState(v57.getPageLayoutConfig(l_CollectionItemSize_0.Small)).sideMargin;
    end;
    local v63 = v4.useMemo(function() --[[ Line: 179 ]]
        -- upvalues: v40 (copy), l_getSduiComponentWrapper_0 (ref), v4 (ref), v34 (copy), v57 (ref), v47 (copy), l_FFlagSduiFeedOptionalScrollingFrameFix_0 (ref), v31 (copy)
        if v40 == nil then
            return nil;
        else
            local v62 = l_getSduiComponentWrapper_0(v40);
            return v4.createElement(v62, {
                debugName = v34, 
                componentConfig = v40, 
                sduiContext = v57, 
                localAnalyticsData = v47, 
                extraLocalProps = if l_FFlagSduiFeedOptionalScrollingFrameFix_0 then {
                    pageBottomPadding = v31.pageBottomPadding, 
                    scrollingFrameRef = v31.scrollingFrameRef
                } else nil
            });
        end;
    end, {
        v40, 
        v34, 
        v57, 
        v47
    });
    local v64 = if l_FFlagSduiFeedOptionalScrollingFrameFix_0 then v31.scrollingFrameRef ~= nil else nil;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, v64 and 0 or 1, 0), 
        AutomaticSize = if v64 then Enum.AutomaticSize.Y else nil, 
        BorderSizePixel = 0, 
        BackgroundTransparency = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 and v31.backgroundStyle then v31.backgroundStyle.Transparency else 0, 
        BackgroundColor3 = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 and v31.backgroundStyle then v31.backgroundStyle.Color3 else v36.Color.Surface.Surface_0.Color3, 
        ref = v53, 
        ClipsDescendants = l_FFlagSduiCoreBadgeDetailsSupport_0 and true or nil
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = if l_FFlagSduiCoreBadgeDetailsSupport_0 then Enum.HorizontalAlignment.Center else nil
        }), 
        PageHeader = if l_FFlagSduiCoreBadgeDetailsSupport_0 and v58 then nil else if v31.includeNavigationHeaderBar then v4.createElement(v19, {
            title = v43, 
            pageSideMargin = v59, 
            layoutOrder = 1, 
            renderUtilities = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v31.renderUtilities else nil, 
            navButtonType = v31.navButtonType or l_NavButtonType_0.back, 
            closeCallback = v50
        }) else nil, 
        PageBody = if l_FFlagSduiFeedOptionalScrollingFrameFix_0 and v45 then v4.createElement(v5.View, {
            Size = UDim2.new(1, 0, 1, 0)
        }, v4.createElement(l_Loading_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5)
        })) else if l_FFlagSduiFeedOptionalScrollingFrameFix_0 and v46 then v4.createElement(v22, {
            refresh = v31.refresh
        }) else v4.createElement("Frame", {
            BorderSizePixel = 0, 
            Size = UDim2.new(1, (not l_FFlagSduiCoreBadgeDetailsSupport_0 or v31.disableRootPadding) and 0 or -2 * v59, v64 and 0 or 1, 0), 
            AutomaticSize = if v64 then Enum.AutomaticSize.Y else nil, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            ref = if l_FFlagSduiCoreBadgeDetailsSupport_0 then v56 else nil
        }, {
            UIFlexItem = if l_FFlagSduiFeedOptionalScrollingFrameFix_0 and v64 then nil else v4.createElement("UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Fill
            }), 
            Content = if l_FFlagSduiCoreBadgeDetailsSupport_0 and v58 then nil else if not l_FFlagSduiFeedOptionalScrollingFrameFix_0 and v45 then v4.createElement(l_Loading_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5)
            }) else if not l_FFlagSduiFeedOptionalScrollingFrameFix_0 and v46 then v4.createElement(v22, {
                refresh = v31.refresh
            }) else v63
        }), 
        SnackbarPortal = if v54 and v54.snackbarConfig then v3.createPortal({
            SduiSnackbarScreenGui = v4.createElement("ScreenGui", {
                DisplayOrder = v31.snackbarPortalLayoutOrder, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                IgnoreGuiInset = true
            }, {
                Snackbar = v4.createElement(l_Snackbar_0, {
                    title = v54.snackbarConfig.title, 
                    icon = v54.snackbarConfig.icon, 
                    Position = UDim2.new(0.5, 0, 1, -v36.Padding.XLarge), 
                    AnchorPoint = Vector2.new(0.5, 1), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    onClose = v54.onDismiss
                })
            })
        }, l_CoreGui_0) else nil
    });
end);