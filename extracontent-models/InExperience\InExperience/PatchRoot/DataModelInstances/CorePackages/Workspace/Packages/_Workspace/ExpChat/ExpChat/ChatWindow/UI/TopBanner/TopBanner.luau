local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_ChatBoxContextMenu_0 = require(l_Parent_0.ChatLineReporting).ChatBoxContextMenu;
local l_Constants_0 = require(l_Parent_0.ChatLineReporting).Constants;
local v9 = require(l_Parent_0.FocusNavigationUtils);
local l_GetFFlagMemoizeChatReportingMenu_0 = require(l_Parent_0.SharedFlags).GetFFlagMemoizeChatReportingMenu;
local v11 = require(l_Parent_0.ReactFocusNavigation);
local v12 = require(l_Parent_0.Signals);
local v13 = require(l_Parent_0.SignalsReact);
local v14 = require(l_Parent_0.UIBlox);
local l_IconButton_0 = v14.App.Button.IconButton;
local l_Images_0 = v14.App.ImageSet.Images;
local v17 = require(l_Parent_0.Foundation);
local l_Icon_0 = v17.Icon;
local l_IconName_0 = v17.Enums.IconName;
local l_IconSize_0 = v17.Enums.IconSize;
local l_View_0 = v17.View;
local v22 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatFocusViaLastModeFix);
local v23 = require(l_script_FirstAncestor_0.Flags.getFFlagChatWindowUseCallbackOptimizations);
local v24 = game:DefineFastFlag("ReplaceChatLineReportingIcon", false);
local v25 = require(l_script_FirstAncestor_0.Stores.GetFocusNavigationStore)(false);
local function v37(v26) --[[ Line: 37 ]]
    -- upvalues: v3 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v11 (copy), v22 (copy), v9 (copy), v13 (copy), v25 (copy), l_GuiService_0 (copy), v12 (copy), l_Constants_0 (copy), v24 (copy), l_View_0 (copy), v23 (copy), l_Icon_0 (copy), l_IconName_0 (copy), l_IconSize_0 (copy), l_IconButton_0 (copy), l_Images_0 (copy), l_LocalizationProvider_0 (copy), l_ChatBoxContextMenu_0 (copy), l_GetFFlagMemoizeChatReportingMenu_0 (copy)
    local v27 = v3.useRef(nil);
    local v28, v29 = v3.useState(false);
    local v30 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    local v31 = v11.useFocusGuiObject();
    local v32 = if v22 then nil else v9.useLastInputMode();
    local v33 = if v22 then v13.useSignalState(v25.getChatInputBarFocused) else nil;
    local v34 = v3.useCallback(function() --[[ Line: 49 ]]
        -- upvalues: v26 (copy), v22 (ref), v33 (copy), v32 (copy), v27 (copy), v31 (copy), l_GuiService_0 (ref)
        v26.onUnfocus();
        if (v22 and v33 or not v22 and v32 == "Focus") and v27.current then
            v31(v27.current);
            l_GuiService_0.SelectedCoreObject = nil;
        end;
    end, {
        if v22 then v33 else nil, 
        v31, 
        if v22 then nil else v32, 
        v26.onUnfocus
    });
    local v35 = v3.useRef(v34);
    v3.useEffect(function() --[[ Line: 73 ]]
        -- upvalues: v35 (copy), v34 (copy)
        v35.current = v34;
    end, {
        v34
    });
    v3.useEffect(function() --[[ Line: 77 ]]
        -- upvalues: v28 (copy), v35 (copy)
        return function() --[[ Line: 78 ]]
            -- upvalues: v28 (ref), v35 (ref)
            if v28 and v35.current then
                v35.current();
            end;
        end;
    end, {
        v28
    });
    v3.useEffect(function() --[[ Line: 86 ]]
        -- upvalues: v22 (ref), v33 (copy), v28 (copy), v29 (copy), v32 (copy), v12 (ref), v25 (ref)
        if v22 then
            if v33 and v28 then
                return function() --[[ Line: 90 ]]
                    -- upvalues: v29 (ref)
                    v29(false);
                end;
            else
                return nil;
            end;
        elseif v32 == "Focus" and v28 then
            return v12.createEffect(function(v36) --[[ Line: 98 ]]
                -- upvalues: v25 (ref), v29 (ref)
                if not v25.getChatInputBarFocused(v36) then
                    v29(false);
                end;
            end);
        else
            return nil;
        end;
    end, {
        if v22 then v33 else nil, 
        v28, 
        if v22 then nil else v32
    });
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_Constants_0.TopBannerSize), 
        BackgroundTransparency = 1
    }, {
        DotMenu = if v24 then v3.createElement(l_View_0, {
            Size = UDim2.new(0, l_Constants_0.IconButtonSize, 0, l_Constants_0.IconButtonSize), 
            Position = UDim2.new(1, l_Constants_0.IconButtonPositionXOffset, 0, l_Constants_0.IconButtonPositionYOffset), 
            onActivated = if v23() then v3.useCallback(function() --[[ Line: 131 ]]
                -- upvalues: v29 (copy), v26 (copy)
                v29(true);
                v26.onFocus();
            end, {
                v29, 
                v26.onFocus
            }) else function() --[[ Line: 135 ]]
                -- upvalues: v29 (copy), v26 (copy)
                v29(true);
                v26.onFocus();
            end, 
            tag = "auto-xy padding-small radius-medium align-x-center align-y-center", 
            ref = v27
        }, v3.createElement(l_Icon_0, {
            name = l_IconName_0.ThreeDotsHorizontal, 
            size = l_IconSize_0.Large, 
            style = {
                Transparency = v26.iconTransparency
            }
        })) else v3.createElement(l_IconButton_0, {
            size = UDim2.new(0, l_Constants_0.IconButtonSize, 0, l_Constants_0.IconButtonSize), 
            position = UDim2.new(1, l_Constants_0.IconButtonPositionXOffset, 0, l_Constants_0.IconButtonPositionYOffset), 
            icon = l_Images_0["icons/menu/more_off"], 
            showBackground = true, 
            backgroundTransparency = 1, 
            iconTransparency = v26.iconTransparency, 
            buttonRef = v27, 
            onActivated = if v23() then v3.useCallback(function() --[[ Line: 164 ]]
                -- upvalues: v29 (copy), v26 (copy)
                v29(true);
                v26.onFocus();
            end, {
                v29, 
                v26.onFocus
            }) else function() --[[ Line: 168 ]]
                -- upvalues: v29 (copy), v26 (copy)
                v29(true);
                v26.onFocus();
            end
        }), 
        LocalizationProvider = v3.createElement(l_LocalizationProvider_0, {
            localization = v30
        }, {
            ContextMenu = if v28 then v3.createElement(l_ChatBoxContextMenu_0, {
                setContextMenuOpen = v29, 
                backgroundColor3 = v26.backgroundColor3, 
                backgroundTransparency = v26.backgroundTransparency, 
                getMessages = if l_GetFFlagMemoizeChatReportingMenu_0() then v26.getMessages else nil, 
                messages = if not l_GetFFlagMemoizeChatReportingMenu_0() then v26.messages else nil
            }) else nil
        })
    });
end;
if l_GetFFlagMemoizeChatReportingMenu_0() then
    return (v3.memo(v37));
else
    return v37;
end;