local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_DropdownMenu_0 = v4.App.Menu.DropdownMenu;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v8 = require(l_Modules_0.LuaApp.Components.More.Licensing.useLicenseData);
local l_GetTextSize_0 = require(l_CorePackages_0.Workspace.Packages.Style).GetTextSize;
local l_ScrollBarType_0 = v4.App.Container.Enum.ScrollBarType;
local l_VerticalScrollView_0 = v4.App.Container.VerticalScrollView;
local v12 = require(l_Modules_0.LuaApp.Components.FocusFrame);
local v13 = require(l_Modules_0.LuaApp.TenFootUI.MoreComponents.MoreSection);
local l_BodyText_0 = require(l_Modules_0.LuaApp.TenFootUI.MoreComponents.MoreText).BodyText;
local _ = require(script.Parent.Types);
local function v26() --[[ Line: 25 ]] --[[ Name: useDropDownData ]]
    -- upvalues: v8 (copy), v3 (copy), v2 (copy)
    local v16 = v8();
    local l_licenseList_0 = v16.licenseList;
    local l_initialLicenseKey_0 = v16.initialLicenseKey;
    local v19, v20 = v3.useState(nil);
    local v24 = v3.useMemo(function() --[[ Line: 31 ]]
        -- upvalues: v2 (ref), l_licenseList_0 (copy), v19 (copy), l_initialLicenseKey_0 (copy)
        local v22 = v2.map(l_licenseList_0, function(v21) --[[ Line: 32 ]]
            return {
                key = v21.key, 
                value = table.concat(v21.value, "\n")
            };
        end);
        return (v2.find(v22, function(v23) --[[ Line: 39 ]]
            -- upvalues: v19 (ref), l_initialLicenseKey_0 (ref)
            return v23.key == (v19 or l_initialLicenseKey_0);
        end) or v22[1] or {
            key = "", 
            value = ""
        }).value;
    end, {
        v19, 
        l_licenseList_0, 
        l_initialLicenseKey_0
    });
    return v3.useMemo(function() --[[ Line: 46 ]]
        -- upvalues: v2 (ref), l_licenseList_0 (copy)
        return v2.map(l_licenseList_0, function(v25) --[[ Line: 47 ]]
            return {
                text = v25.key
            };
        end);
    end, {
        l_licenseList_0
    }), v24, v20;
end;
local function v33(v27) --[[ Line: 57 ]] --[[ Name: PanelContentWrapper ]]
    -- upvalues: l_useDesignTokens_0 (copy), v3 (copy), l_VerticalScrollView_0 (copy), l_ScrollBarType_0 (copy)
    local v28 = l_useDesignTokens_0();
    local v29 = v3.useRef(nil);
    local v30 = v3.useRef(nil);
    v3.useEffect(function() --[[ Line: 62 ]]
        -- upvalues: v29 (copy), v30 (copy), v27 (copy)
        if v29.current then
            for _, v32 in v29.current:GetDescendants() do
                if v32:IsA("GuiObject") then
                    if v32 == v30.current and v27.selectable then
                        v32.Selectable = true;
                    else
                        v32.Selectable = false;
                    end;
                end;
            end;
        end;
    end);
    return v3.createElement("Frame", {
        ref = v29, 
        Position = UDim2.new(), 
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = v28.Semantic.Color.Background.Default.Color3, 
        BackgroundTransparency = if v27.selectable then v28.Semantic.Color.Background.Default.Transparency else 1, 
        SelectionGroup = true, 
        SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorUp = Enum.SelectionBehavior.Stop
    }, v3.createElement(l_VerticalScrollView_0, {
        ref = v30, 
        canvasSizeY = UDim.new(), 
        useAutomaticCanvasSize = true, 
        isGamepadFocusable = true, 
        scrollingEnabled = v27.scrollingEnabled, 
        scrollBarType = if v27.scrollingEnabled then l_ScrollBarType_0.Gamepad else nil
    }, v27.children));
end;
local function v37(v34, v35, v36) --[[ Line: 103 ]] --[[ Name: renderPanel ]]
    -- upvalues: v3 (copy), v33 (copy)
    return v3.createElement(v33, {
        scrollingEnabled = v34, 
        selectable = v35
    }, v36);
end;
return function(v38) --[[ Line: 110 ]] --[[ Name: LicensingSection ]]
    -- upvalues: l_useLocalization_0 (copy), l_useDesignTokens_0 (copy), v3 (copy), v26 (copy), l_GetTextSize_0 (copy), l_BodyText_0 (copy), v13 (copy), l_DropdownMenu_0 (copy), v12 (copy), v37 (copy)
    local v39 = l_useLocalization_0({
        title = v38.titleKey, 
        noLicenses = "CommonUI.Messages.Message.NoLicenses"
    });
    local v40 = l_useDesignTokens_0();
    local l_LicensePanelWidthScale_0 = v40.LuaApps.More.LicensePanelWidthScale;
    local v42, v43 = v3.useState(0);
    local v44 = UDim.new(0, v40.Global.Space_300);
    local l_Color3_0 = v40.Semantic.Color.Common.Overlay.Color3;
    local l_Transparency_0 = v40.Semantic.Color.Common.Overlay.Transparency;
    local l_Default_0 = v40.Semantic.Color.Background.Default;
    local l_Font_0 = v40.Semantic.Typography.Body.Font;
    local l_FontSize_0 = v40.Semantic.Typography.Body.FontSize;
    local l_Size_300_0 = v40.Global.Size_300;
    local v51, v52, v53 = v26();
    local v55 = v3.useCallback(function(v54) --[[ Line: 129 ]]
        -- upvalues: v43 (copy), l_LicensePanelWidthScale_0 (copy)
        if v54 then
            v43(v54.AbsoluteSize.X * l_LicensePanelWidthScale_0);
        end;
    end, {});
    local v56 = v3.useMemo(function() --[[ Line: 135 ]]
        -- upvalues: v52 (copy), l_GetTextSize_0 (ref), l_FontSize_0 (copy), l_Font_0 (copy), v42 (copy), l_Size_300_0 (copy)
        if v52 then
            return l_GetTextSize_0(v52, l_FontSize_0, l_Font_0, Vector2.new(v42 + l_Size_300_0 * 2, 1e999)).Y;
        else
            return 0;
        end;
    end, {
        v52, 
        l_FontSize_0, 
        l_Font_0, 
        v42, 
        l_Size_300_0
    });
    local v57 = v3.useCallback(function() --[[ Line: 156 ]]
        -- upvalues: v3 (ref), l_LicensePanelWidthScale_0 (copy), v44 (copy), l_BodyText_0 (ref), v52 (copy), v56 (copy)
        return v3.createElement("Frame", {
            Position = UDim2.new(), 
            Size = UDim2.fromScale(l_LicensePanelWidthScale_0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, v3.createElement("UIPadding", {
            PaddingTop = v44, 
            PaddingBottom = v44
        }), v3.createElement(l_BodyText_0, {
            text = v52, 
            layoutOrder = 2, 
            size = UDim2.new(1, 0, 1, v56), 
            TextYAlignment = Enum.TextYAlignment.Top
        }));
    end, {
        v52, 
        v56, 
        v44, 
        l_LicensePanelWidthScale_0
    });
    return v3.createElement(v13, {
        layoutOrder = v38.layoutOrder, 
        withDivider = v38.withDivider, 
        title = v39.title
    }, v3.createElement("Frame", {
        Name = "LicenseDropdown", 
        ref = v55, 
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 0, 72), 
        BackgroundTransparency = 1, 
        ZIndex = 2
    }, v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, v3.createElement(l_DropdownMenu_0, {
        placeholder = if #v51 > 0 then v51[1].text else v39.noLicenses, 
        onChange = v53, 
        height = UDim.new(0, 72), 
        screenSize = Vector2.new(1920, 1080), 
        cellDatas = v51, 
        menuListBackground = {
            Color = l_Default_0.Color3, 
            Transparency = l_Default_0.Transparency
        }
    }))), v3.createElement(v12, {
        layoutOrder = 2, 
        safeAreaSize = UDim2.new(1, -2 * v40.Global.Size_800, 0, 3 * v40.Global.Size_1000), 
        limitInlineHeight = true, 
        overlayColor3 = l_Color3_0, 
        overlayTransparency = l_Transparency_0, 
        renderContents = v57, 
        renderContentWrapper = v37
    }));
end;