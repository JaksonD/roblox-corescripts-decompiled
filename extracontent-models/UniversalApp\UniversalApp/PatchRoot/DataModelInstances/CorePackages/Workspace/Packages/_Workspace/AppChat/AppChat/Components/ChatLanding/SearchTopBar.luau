local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.SocialLibraries);
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.UIBlox);
local v7 = require(l_Parent_0.Foundation);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local l_TextButton_0 = v6.App.Button.TextButton;
local l_Images_0 = v6.App.ImageSet.Images;
local l_IconSize_0 = v6.App.Constant.IconSize;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local v14 = require(l_Parent_0.ReactFocusNavigation);
local v15 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigationService_0 = v14.FocusNavigationService;
local l_FocusNavigationEventNameEnum_0 = v15.FocusNavigationEventNameEnum;
local l_CoreGui_0 = v14.EngineInterface.CoreGui;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local l_withSelectionCursorProvider_0 = v6.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v6.App.SelectionImage.CursorKind;
local l_CallbackInputBox_0 = v2.Components.CallbackInputBox;
local v23 = l_Images_0["icons/common/search"];
local v24 = l_Images_0["icons/actions/edit/clear_small"];
local v25 = {
    Image = l_Images_0["squircles/fill"], 
    SliceCenter = Rect.new(8, 8, 9, 9)
};
local v26 = v3.PureComponent:extend("SearchTopBar");
v26.defaultProps = {
    cancelText = "CancelPlaceholder", 
    searchPlaceholderText = "PlaceholderText", 
    initialInputText = nil, 
    filterBoxPaddingTop = 6, 
    filterBoxPaddingBottom = 6, 
    filterBoxPaddingLeft = 0, 
    filterBoxPaddingRight = 0, 
    captureFocusOnMount = false, 
    resetOnMount = function() --[[ Line: 56 ]] --[[ Name: resetOnMount ]]

    end, 
    cancelCallback = nil, 
    shouldShowCancel = true, 
    textChangedCallback = nil, 
    LayoutOrder = 1, 
    onSelectCallback = function() --[[ Line: 61 ]] --[[ Name: onSelectCallback ]]

    end, 
    containerRef = nil, 
    inputBoxRef = nil, 
    focusNavigationEventHandlerRef = nil
};
v26.init = function(v27) --[[ Line: 68 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (copy), v3 (copy), l_memoize_0 (copy), l_Text_0 (copy)
    v27.focusNavigationService = v27.props.focusNavigationService;
    v27.inputBoxRef = if l_FFlagEnableAppChatFocusableFixes_0 then v27.props.inputBoxRef or v3.createRef() else v3.createRef();
    v27.containerRef = v27.props.containerRef or v3.createRef();
    v27.props.onSelectCallback();
    v27.focusInputBox = function() --[[ Line: 76 ]]
        -- upvalues: v27 (copy)
        if v27.inputBoxRef and v27.inputBoxRef.current then
            v27.inputBoxRef.current:CaptureFocus();
        end;
    end;
    v27.getTextWidth = l_memoize_0(function(v28, v29, v30) --[[ Line: 82 ]]
        -- upvalues: l_Text_0 (ref)
        return l_Text_0.GetTextWidth(v28, v29, v30);
    end);
end;
v26.didMount = function(v31) --[[ Line: 87 ]] --[[ Name: didMount ]]
    if v31.props.captureFocusOnMount and v31.containerRef.current and v31.focusNavigationService and v31.focusNavigationService.focusedGuiObject:getValue() ~= nil then
        v31.focusNavigationService:focusGuiObject(v31.containerRef.current);
    end;
    if v31.inputBoxRef.current then
        v31.inputBoxRef.current.Selectable = false;
    end;
    v31.props.resetOnMount();
end;
if l_FFlagEnableAppChatFocusableFixes_0 then
    v26.willUnmount = function(v32) --[[ Line: 104 ]] --[[ Name: willUnmount ]]
        if v32.focusNavigationService then
            v32.focusNavigationService:teardown();
        end;
    end;
end;
v26.render = function(v33) --[[ Line: 111 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v3 (copy), l_TextButton_0 (copy), l_withSelectionCursorProvider_0 (copy), v7 (copy), l_CursorKind_0 (copy), l_ImageSetLabel_0 (copy), v25 (copy), l_IconSize_0 (copy), v23 (copy), l_CallbackInputBox_0 (copy), v24 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy)
    local function v35(v34) --[[ Line: 112 ]]
        -- upvalues: v33 (copy)
        if not (v34 and #v34 > 0) and v33.focusNavigationService and v33.inputBoxRef.current then
            if v33.focusNavigationService.focusedGuiObject:getValue() ~= nil then
                v33.focusNavigationService:focusGuiObject(v33.containerRef.current);
                v33.focusInputBox();
            else
                v33.focusNavigationService:focusGuiObject(v33.inputBoxRef.current);
            end;
        end;
        if v33.props.textChangedCallback then
            v33.props.textChangedCallback(v34);
        end;
    end;
    return v6.Style.withStyle(function(v36) --[[ Line: 129 ]]
        -- upvalues: v33 (copy), v3 (ref), l_TextButton_0 (ref), l_withSelectionCursorProvider_0 (ref), v7 (ref), l_CursorKind_0 (ref), l_ImageSetLabel_0 (ref), v25 (ref), l_IconSize_0 (ref), v23 (ref), l_CallbackInputBox_0 (ref), v24 (ref), l_FFlagEnableAppChatFocusableFixes_0 (ref), v35 (copy)
        local l_cancelText_0 = v33.props.cancelText;
        local l_Header2_0 = v36.Font.Header2;
        local v39 = v36.Font.BaseSize * l_Header2_0.RelativeSize;
        local v40 = v33.getTextWidth(l_cancelText_0, l_Header2_0.Font, v39);
        local l_Left_0 = Enum.HorizontalAlignment.Left;
        local v42 = UDim.new(0, 4);
        local v43 = UDim2.new(1, 0, 1, 0);
        if v33.props.shouldShowCancel then
            v43 = UDim2.new(1, -v40 - 12, 1, 0);
        end;
        local l_Body_0 = v36.Font.Body;
        local v45 = v36.Font.BaseSize * l_Body_0.RelativeSize;
        return v3.createElement("Frame", {
            BackgroundTransparency = v36.Tokens.Global.Color.None.Transparency, 
            BackgroundColor3 = v36.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            LayoutOrder = v33.props.LayoutOrder, 
            [v3.Ref] = v33.props.focusNavigationEventHandlerRef
        }, {
            layout = v3.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = l_Left_0, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = v42
            }), 
            padding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v33.props.filterBoxPaddingTop), 
                PaddingBottom = UDim.new(0, v33.props.filterBoxPaddingBottom), 
                PaddingLeft = UDim.new(0, v33.props.filterBoxPaddingLeft), 
                PaddingRight = UDim.new(0, v33.props.filterBoxPaddingRight)
            }), 
            cancel = if v33.props.shouldShowCancel then v3.createElement(l_TextButton_0, {
                text = l_cancelText_0, 
                layoutOrder = 2, 
                onActivated = v33.props.cancelCallback
            }) else nil, 
            filterBoxContainer = l_withSelectionCursorProvider_0(function(v46) --[[ Line: 181 ]]
                -- upvalues: v3 (ref), v7 (ref), v43 (ref), l_CursorKind_0 (ref), v33 (ref), l_ImageSetLabel_0 (ref), v25 (ref), v36 (copy), l_IconSize_0 (ref), v23 (ref), l_CallbackInputBox_0 (ref), l_Body_0 (copy), v45 (copy), v24 (ref), l_FFlagEnableAppChatFocusableFixes_0 (ref), v35 (ref)
                return v3.createElement(v7.View, {
                    Size = v43, 
                    LayoutOrder = 1, 
                    selection = {
                        Selectable = true, 
                        SelectionImageObject = v46(l_CursorKind_0.RoundedRect)
                    }, 
                    onActivated = v33.focusInputBox, 
                    ref = v33.containerRef
                }, {
                    filterBoxBackground = v3.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.fromScale(1, 1), 
                        Image = v25.Image, 
                        ImageColor3 = v36.Theme.UIDefault.Color, 
                        ImageTransparency = v36.Theme.UIDefault.Transparency, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = v25.SliceCenter, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Selectable = false
                    }, {
                        layout = v3.createElement("UIListLayout", {
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            FillDirection = Enum.FillDirection.Horizontal, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, 4)
                        }), 
                        padding = v3.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, 12), 
                            PaddingRight = UDim.new(0, 12)
                        }), 
                        filterBoxIcon = v3.createElement(l_ImageSetLabel_0, {
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(0, l_IconSize_0.Small, 0, l_IconSize_0.Small), 
                            Image = v23, 
                            ImageColor3 = v36.Theme.IconEmphasis.Color, 
                            ImageTransparency = v36.Theme.IconEmphasis.Transparency, 
                            LayoutOrder = 1
                        }), 
                        filterBoxContainer = v3.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, -(l_IconSize_0.Small + 4), 1, 0), 
                            LayoutOrder = 2
                        }, {
                            filterBox = v3.createElement(l_CallbackInputBox_0, {
                                initialInputText = v33.props.initialInputText, 
                                inputTextColor3 = v36.Theme.TextEmphasis.Color, 
                                inputTextFont = l_Body_0.Font, 
                                inputTextSize = v45, 
                                inputTextTransparency = v36.Theme.TextEmphasis.Transparency, 
                                inputTextXAlignment = Enum.TextXAlignment.Left, 
                                placeholderText = v33.props.searchPlaceholderText, 
                                placeholderTextColor3 = v36.Theme.TextDefault.Color, 
                                placeholderTextTransparency = v36.Theme.TextDefault.Transparency, 
                                captureFocusOnMount = v33.props.captureFocusOnMount, 
                                clearIcon = v24, 
                                clearIconColor3 = v36.Theme.IconEmphasis.Color, 
                                clearIconTransparency = v36.Theme.IconEmphasis.Transparency, 
                                clearButtonSize = l_IconSize_0.Small, 
                                clearButtonDisabled = false, 
                                textChangedCallback = if l_FFlagEnableAppChatFocusableFixes_0 then v35 else v33.props.textChangedCallback, 
                                onSelectCallback = v33.props.onSelectCallback, 
                                inputBoxRef = v33.inputBoxRef, 
                                clearButtonSelectionImageObject = v46(l_CursorKind_0.RoundedRect)
                            })
                        })
                    })
                });
            end)
        });
    end);
end;
FocusableSearchTopBar = function(v47) --[[ Line: 269 ]] --[[ Name: FocusableSearchTopBar ]]
    -- upvalues: v4 (copy), l_FocusNavigationService_0 (copy), l_CoreGui_0 (copy), v14 (copy), l_FocusNavigationEventNameEnum_0 (copy), v3 (copy), v26 (copy), v5 (copy)
    local v48 = v4.useRef(nil);
    local v49 = v4.useRef(nil);
    local v50 = l_FocusNavigationService_0.new(l_CoreGui_0);
    local v52 = v14.useEventHandler(l_FocusNavigationEventNameEnum_0.NavigateBack, function(v51) --[[ Line: 276 ]]
        -- upvalues: v50 (copy), v48 (copy), v47 (copy)
        if v51.eventData and v50.focusedGuiObject:getValue() == v48.current and v51.eventData.KeyCode ~= Enum.KeyCode.Unknown then
            v51:cancel();
            v47.cancelCallback();
        end;
    end, "Bubble", nil);
    return v3.createElement(v26, v5.Dictionary.join({
        inputBoxRef = v49, 
        containerRef = v48, 
        focusNavigationEventHandlerRef = v52, 
        focusNavigationService = v50
    }, v47));
end;
if l_FFlagEnableAppChatFocusableFixes_0 then
    return FocusableSearchTopBar;
else
    return v26;
end;