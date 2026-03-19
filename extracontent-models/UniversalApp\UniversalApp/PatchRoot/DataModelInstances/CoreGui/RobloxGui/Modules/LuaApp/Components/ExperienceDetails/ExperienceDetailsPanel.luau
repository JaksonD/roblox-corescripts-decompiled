local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_ScrollBarType_0 = v3.App.Container.Enum.ScrollBarType;
local l_VerticalScrollView_0 = v3.App.Container.VerticalScrollView;
local l_useCursor_0 = v3.App.SelectionCursor.useCursor;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v10 = require(l_Modules_0.LuaApp.Components.FocusFrame);
local v11 = require(script.Parent.Flags.FFlagExperienceDetailsTextUseTokens);
local function v19(v12) --[[ Line: 32 ]] --[[ Name: PanelContentWrapper ]]
    -- upvalues: l_useStyle_0 (copy), l_useDesignTokens_0 (copy), v1 (copy), l_VerticalScrollView_0 (copy), l_ScrollBarType_0 (copy)
    local v13 = l_useStyle_0();
    local l_PanelRadius_0 = l_useDesignTokens_0().LuaApps.ExperienceDetails.PanelRadius;
    local v15 = v1.useRef(nil);
    local v16 = v1.useRef(nil);
    v1.useEffect(function() --[[ Line: 38 ]]
        -- upvalues: v15 (copy), v16 (copy), v12 (copy)
        if v15.current then
            for _, v18 in v15.current:GetDescendants() do
                if v18:IsA("GuiObject") then
                    if v18 == v16.current and v12.selectable then
                        v18.Selectable = true;
                    else
                        v18.Selectable = false;
                    end;
                end;
            end;
        end;
    end);
    return v1.createElement(v12.useCanvasGroup and "CanvasGroup" or "Frame", {
        ref = v15, 
        Position = UDim2.new(), 
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = v13.Theme.BackgroundUIContrast.Color, 
        BackgroundTransparency = v13.Theme.BackgroundUIContrast.Transparency, 
        SelectionGroup = true, 
        SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorUp = Enum.SelectionBehavior.Stop
    }, {
        Corner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0, l_PanelRadius_0)
        }), 
        ScrollView = v1.createElement(l_VerticalScrollView_0, {
            ref = v16, 
            canvasSizeY = UDim.new(), 
            useAutomaticCanvasSize = true, 
            scrollingEnabled = v12.scrollingEnabled, 
            scrollBarType = if v12.scrollingEnabled then l_ScrollBarType_0.Gamepad else nil
        }, v12.children)
    });
end;
return v1.forwardRef(function(v20, v21) --[[ Line: 76 ]]
    -- upvalues: l_useStyle_0 (copy), l_useDesignTokens_0 (copy), v1 (copy), l_StyledTextLabel_0 (copy), v11 (copy), v19 (copy), l_useCursor_0 (copy), v10 (copy)
    local v22 = l_useStyle_0();
    local v23 = l_useDesignTokens_0();
    local v24 = v23.LuaApps.ExperienceDetails.SafeAreaSize or Vector2.zero;
    local v25 = v23.LuaApps.ExperienceDetails.PanelHeaderMargin or 0;
    local l_PanelRadius_1 = v23.LuaApps.ExperienceDetails.PanelRadius;
    local v28 = v1.useCallback(function(_) --[[ Line: 84 ]]
        -- upvalues: v1 (ref), l_StyledTextLabel_0 (ref), v20 (copy), v22 (copy), v11 (ref), v23 (copy), v25 (copy)
        return {
            v1.createElement(l_StyledTextLabel_0, {
                text = v20.title, 
                colorStyle = v22.Theme.TextEmphasis, 
                fontStyle = if v11 then v23.Semantic.Typography.Header else v22.Font.Header1
            }), 
            v1.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, v25)
            })
        };
    end, {
        v20.title, 
        v22
    });
    local v30 = v1.useCallback(function(_) --[[ Line: 99 ]]
        -- upvalues: v1 (ref), v20 (copy)
        return v1.createElement("Frame", {
            Position = UDim2.new(), 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, v20.children);
    end, {
        v20.children
    });
    local v34 = v1.useCallback(function(v31, v32, v33) --[[ Line: 108 ]]
        -- upvalues: v20 (copy), v1 (ref), v19 (ref)
        if v20.onFocusChanged then
            v20.onFocusChanged(v32);
        end;
        return v1.createElement(v19, {
            scrollingEnabled = v31, 
            selectable = v32, 
            useCanvasGroup = v20.roundContentCorners or false
        }, v33);
    end, {
        v20.roundContentCorners, 
        v20.onFocusChanged
    });
    local v35 = l_useCursor_0(UDim.new(0, l_PanelRadius_1));
    return v1.createElement(v10, {
        ref = v21, 
        layoutOrder = v20.layoutOrder, 
        safeAreaSize = UDim2.new(1, -2 * v24.X, 1, -2 * v24.Y), 
        limitInlineHeight = true, 
        renderHeader = v28, 
        renderContents = v30, 
        renderContentWrapper = v34, 
        selectionCursor = v35
    });
end);