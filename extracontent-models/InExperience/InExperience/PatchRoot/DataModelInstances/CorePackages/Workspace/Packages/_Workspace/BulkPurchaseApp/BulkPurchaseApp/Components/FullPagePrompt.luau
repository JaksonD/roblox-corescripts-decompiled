local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local v6 = require(l_Parent_0.UIBlox);
local l_StyledTextLabel_0 = v6.App.Text.StyledTextLabel;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v6.App.ImageSet.Images;
local l_useCursor_0 = v6.App.SelectionCursor.useCursor;
local l_useScreenSize_0 = require(l_Parent_0.EconomyCommonCoreScriptHooks).useScreenSize;
local v12 = require(l_script_FirstAncestor_0.constants);
local v13 = require(script.Parent.Scrim);
local v14 = require(script.Parent.Box);
local function v18(v15) --[[ Line: 21 ]] --[[ Name: CloseButton ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useCursor_0 (copy), v2 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    local v16 = l_useDesignTokens_0();
    local v17 = l_useCursor_0(UDim.new(0, v16.Semantic.Radius.Medium), 0);
    return v2.createElement("TextButton", {
        Size = UDim2.fromOffset(v16.Global.Size_450, v16.Global.Size_450), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v2.Event.Activated] = v15.onActivated, 
        Text = "", 
        [v2.Tag] = "data-testid=BulkPurchaseApp_FullPagePromptCloseButton", 
        SelectionImageObject = v17, 
        Position = UDim2.fromScale(1, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5)
    }, v2.createElement(l_ImageSetLabel_0, {
        Size = UDim2.fromOffset(v16.Global.Size_350, v16.Global.Size_350), 
        BackgroundTransparency = 1, 
        Image = l_Images_0["icons/navigation/close"], 
        ImageColor3 = v16.Semantic.Color.Text.Emphasis.Color3, 
        ImageTransparency = v16.Semantic.Color.Text.Emphasis.Transparency, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5)
    }));
end;
local function v20(v19) --[[ Line: 50 ]]
    return {
        background = v19.Semantic.Color.Background.Default.Color3, 
        padding = v19.Global.Space_300, 
        cornerRadius = v19.Semantic.Radius.Medium, 
        headerFontStyle = v19.Semantic.Typography.Header, 
        headerColorStyle = v19.Semantic.Color.Text.Emphasis, 
        headerMarginBottom = v19.Global.Space_400, 
        headerHeight = v19.Global.Size_350
    };
end;
return (v2.forwardRef(function(v21, v22) --[[ Line: 68 ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useDesignTokens_0 (copy), v20 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), v12 (copy), v2 (copy), v13 (copy), v14 (copy), l_StyledTextLabel_0 (copy), v18 (copy)
    local v23 = l_useScreenSize_0();
    local v24 = l_useDesignTokens_0(v20);
    local v25 = l_useUiModeInfo_0();
    local v26 = if v25.uiMode == l_UiMode_0.TenFoot then v12.MAX_WIDTH * v12.TEN_FOOT_MULTIPLIER else v12.MAX_WIDTH;
    local v27 = if v25.uiMode == l_UiMode_0.TenFoot then v12.MAX_HEIGHT * v12.TEN_FOOT_MULTIPLIER else v12.MAX_HEIGHT;
    local v28 = false;
    if v23.X < v12.MOBILE_BREAKPOINT then
        v28 = v23.X < v23.Y;
    end;
    return v2.createElement(v13, {
        ref = v22
    }, v2.createElement(v14, {
        padding = {
            v24.padding, 
            v24.padding, 
            v24.padding, 
            v24.padding
        }, 
        cornerRadius = UDim.new(0, v24.cornerRadius), 
        Size = UDim2.new(v28 and 1 or 0, v28 and 0 or math.min(v26, v23.X), 0, (math.min(v27, v23.Y))), 
        BackgroundColor3 = v24.background, 
        BorderSizePixel = 0, 
        Position = UDim2.fromScale(0.5, v28 and 1 or 0.5), 
        AnchorPoint = Vector2.new(0.5, v28 and 1 or 0.5)
    }, {
        Header = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, v24.headerHeight)
        }, v2.createElement(l_StyledTextLabel_0, {
            fontStyle = v24.headerFontStyle, 
            colorStyle = v24.headerColorStyle, 
            textXAlignment = Enum.TextXAlignment.Center, 
            textYAlignment = Enum.TextYAlignment.Center, 
            text = v21.title, 
            size = UDim2.new(1, 0, 1, 0)
        }), v2.createElement(v18, {
            onActivated = v21.onClose
        })), 
        Content = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, -v24.headerHeight - v24.headerMarginBottom), 
            Position = UDim2.fromOffset(0, v24.headerHeight + v24.headerMarginBottom)
        }, v21.children)
    }));
end));