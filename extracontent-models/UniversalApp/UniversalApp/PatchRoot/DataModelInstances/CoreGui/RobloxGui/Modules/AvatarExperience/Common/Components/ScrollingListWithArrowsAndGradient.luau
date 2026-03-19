local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v6 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableCategoryPills);
local v7 = require(l_Modules_0.LuaApp.Constants);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.GradientFrame);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.ArrowFrame);
local v10 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.IntroScroll);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.withLastInputGroup);
local v13 = v2.PureComponent:extend("ScrollingListWithArrowsAndGradient");
local v14 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableAutomaticSizeGradientFrame);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterButton);
local l_FFlagAXScrollingListAutomaticCanvasSize_0 = v5.FFlagAXScrollingListAutomaticCanvasSize;
local l_FFlagAXMoveCatalogFilterToL1Navigation_0 = v5.FFlagAXMoveCatalogFilterToL1Navigation;
local l_FFlagAXEnableEditorCategoryDeepLink_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXEnableEditorCategoryDeepLink;
v13.validateProps = v3.strictInterface({
    getScollingListContent = v3.callback, 
    listHeight = if v14() then v3.optional(v3.number) else v3.number, 
    scrollingFrameRef = v3.table, 
    buttonRefs = v3.optional(v3.table), 
    buttonWidth = v3.optional(v3.number), 
    numButtons = v3.optional(v3.number), 
    padOutsideEdges = v3.optional(v3.boolean), 
    childWidgetIndex = v3.optional(v3.string), 
    useIntroScroll = v3.optional(v3.boolean), 
    buttonPadding = v3.number, 
    canvasWidth = if l_FFlagAXScrollingListAutomaticCanvasSize_0 then nil else v3.optional(v3.number), 
    filterButtonRef = if v6() then v3.optional(v3.table) else nil, 
    backgroundColor = if not not v6() or l_FFlagAXMoveCatalogFilterToL1Navigation_0 then v3.optional(v3.Color3) else nil, 
    tokens = if l_FFlagAXScrollingListAutomaticCanvasSize_0 then nil else v3.optional(v3.table), 
    supportFilterButton = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 then v3.optional(v3.boolean) else nil, 
    hideFilterButton = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 then v3.optional(v3.boolean) else nil, 
    filterButtonWidth = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 then v3.optional(v3.number) else nil, 
    filterButtonGradientWidth = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 then v3.optional(v3.number) else nil, 
    onSizeChanged = if l_FFlagAXEnableEditorCategoryDeepLink_0 then v3.optional(v3.callback) else nil, 
    lastInputGroup = v3.string
});
v13.init = function(v19) --[[ Line: 67 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v10 (copy), l_FFlagAXEnableEditorCategoryDeepLink_0 (copy)
    v19.gradientFrameRef = v2.createRef();
    local v20, v21 = v2.createBinding(false);
    v19.arrowLeftVisible = v20;
    v19.updateArrowLeftVisible = v21;
    v20, v21 = v2.createBinding(false);
    v19.arrowRightVisible = v20;
    v19.updateArrowRightVisible = v21;
    v20, v21 = v2.createBinding(Vector2.new(0, 0));
    v19.canvasPosition = v20;
    v19.updateCanvasPosition = v21;
    v19.onCanvasPositionChange = function(v22) --[[ Line: 75 ]]
        -- upvalues: v19 (copy)
        v19.checkShowGradient(v22);
        v19.updateCanvasPosition(v22.CanvasPosition);
    end;
    v19.checkShowGradient = function(v23) --[[ Line: 82 ]]
        -- upvalues: v19 (copy), v10 (ref)
        local v24 = v19.gradientFrameRef:getValue();
        if not v24 then
            return;
        else
            local v25, v26, v27 = v10.shouldShowGradientForScrollingFrame(v23);
            v24.Visible = v25;
            local l_Left_0 = v24:FindFirstChild("Left");
            local l_Right_0 = v24:FindFirstChild("Right");
            if l_Left_0 and l_Right_0 then
                l_Left_0.Visible = v26;
                l_Right_0.Visible = v27;
            end;
            v19.updateArrowLeftVisible(v26);
            v19.updateArrowRightVisible(v27);
            return;
        end;
    end;
    if l_FFlagAXEnableEditorCategoryDeepLink_0 then
        v19.onAbsoluteSizeChange = function(v30) --[[ Line: 104 ]]
            -- upvalues: v19 (copy)
            v19.checkShowGradient(v30);
            if v19.props.onSizeChanged then
                v19.props.onSizeChanged(v30);
            end;
        end;
    end;
end;
v13.didUpdate = function(v31) --[[ Line: 113 ]] --[[ Name: didUpdate ]]
    local v32 = v31.props.scrollingFrameRef:getValue();
    if v32 then
        v31.checkShowGradient(v32);
    end;
end;
v13.render = function(v33) --[[ Line: 120 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), l_FFlagAXScrollingListAutomaticCanvasSize_0 (copy), v2 (copy), l_FFlagAXEnableEditorCategoryDeepLink_0 (copy), v8 (copy), v14 (copy), v9 (copy), l_FFlagAXMoveCatalogFilterToL1Navigation_0 (copy), v11 (copy), v15 (copy)
    local l_listHeight_0 = v33.props.listHeight;
    local v35 = v33.props.lastInputGroup == v7.InputType.MouseAndKeyboard;
    local l_childWidgetIndex_0 = v33.props.childWidgetIndex;
    local l_useIntroScroll_0 = v33.props.useIntroScroll;
    local v38 = nil;
    if not l_FFlagAXScrollingListAutomaticCanvasSize_0 then
        v38 = v33.props.canvasWidth or 0;
    end;
    local v39 = nil;
    local v40 = nil;
    if l_FFlagAXScrollingListAutomaticCanvasSize_0 then
        v39 = v33.props.filterButtonWidth;
        v40 = v33.props.filterButtonGradientWidth;
    end;
    return v2.createFragment({
        ScrollingList = v2.createElement("ScrollingFrame", {
            ClipsDescendants = false, 
            Size = UDim2.new(1, 0, 1, 0), 
            Selectable = false, 
            CanvasSize = if l_FFlagAXScrollingListAutomaticCanvasSize_0 then nil else UDim2.new(0, v38, 1, 0), 
            AutomaticCanvasSize = if l_FFlagAXScrollingListAutomaticCanvasSize_0 then Enum.AutomaticSize.X else nil, 
            CanvasPosition = v33.canvasPosition, 
            ScrollBarThickness = 0, 
            BackgroundTransparency = 1, 
            ElasticBehavior = Enum.ElasticBehavior.Always, 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            ZIndex = 2, 
            [v2.Change.AbsoluteSize] = if l_FFlagAXEnableEditorCategoryDeepLink_0 then v33.onAbsoluteSizeChange else v33.checkShowGradient, 
            [v2.Change.CanvasSize] = v33.checkShowGradient, 
            [v2.Change.CanvasPosition] = v33.onCanvasPositionChange, 
            [v2.Ref] = v33.props.scrollingFrameRef
        }, v33.props.getScollingListContent()), 
        GradientFrame = v2.createElement(v8, {
            height = if v14() then nil else l_listHeight_0, 
            frameRef = v33.gradientFrameRef, 
            ZIndex = 3
        }), 
        ArrowFrame = v35 and v2.createElement(v9, {
            isVisibleLeft = v33.arrowLeftVisible, 
            isVisibleRight = v33.arrowRightVisible, 
            supportFilterButton = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 then v33.props.supportFilterButton else nil, 
            isFilterButtonVisible = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 and v33.props.supportFilterButton then not v33.props.hideFilterButton else nil, 
            filterButtonWidth = if l_FFlagAXScrollingListAutomaticCanvasSize_0 and v33.props.supportFilterButton then v39 else nil, 
            defaultUseProps = {
                scrollingFrameRef = v33.props.scrollingFrameRef, 
                buttonRefs = v33.props.buttonRefs, 
                buttonWidth = v33.props.buttonWidth, 
                padOutsideEdges = v33.props.padOutsideEdges, 
                numButtons = v33.props.numButtons, 
                buttonPadding = v33.props.buttonPadding, 
                updateCanvasPosition = v33.updateCanvasPosition
            }, 
            ZIndex = l_FFlagAXMoveCatalogFilterToL1Navigation_0 and v33.props.supportFilterButton and 5 or 4
        }), 
        IntroScroll = l_useIntroScroll_0 and v2.createElement(v11, {
            childWidgetIndex = l_childWidgetIndex_0, 
            scrollingFrameRef = v33.props.scrollingFrameRef, 
            updateCanvasPosition = v33.updateCanvasPosition
        }) or nil, 
        FilterButton = l_FFlagAXMoveCatalogFilterToL1Navigation_0 and v33.props.supportFilterButton and not v33.props.hideFilterButton and v2.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Size = UDim2.new(0, v39, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ZIndex = 4
        }, {
            GradientFrame = v2.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, -v40, 0.5, 0), 
                Size = UDim2.new(0, v40, 1, 0), 
                BackgroundColor3 = v33.props.backgroundColor, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0
            }, {
                UIGradient = v2.createElement("UIGradient", {
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1), 
                        NumberSequenceKeypoint.new(0.9, 0), 
                        NumberSequenceKeypoint.new(1, 0)
                    }), 
                    Rotation = 0
                })
            }), 
            InnerFrame = v2.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                Size = UDim2.new(0, v39, 1, 0), 
                BackgroundColor3 = v33.props.backgroundColor, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0
            }, {
                FilterButton = v2.createElement(v15, {
                    buttonRef = v33.props.filterButtonRef
                })
            })
        })
    });
end;
return (v12(v13));