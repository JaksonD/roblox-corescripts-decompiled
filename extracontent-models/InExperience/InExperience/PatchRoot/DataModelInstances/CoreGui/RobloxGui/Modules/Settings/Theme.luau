local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_DarkTheme_0 = require(l_CorePackages_0.Workspace.Packages.Style).Themes.DarkTheme;
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v8.App.ImageSet.Images;
local l_getIconSize_0 = v8.App.ImageSet.getIconSize;
local l_IconSize_0 = v8.App.ImageSet.Enum.IconSize;
local l_getUIScale_0 = require(l_CorePackages_0.Workspace.Packages.Display).GetDisplayStore(false).getUIScale;
local v13 = game:DefineFastFlag("IncreaseUtilityRowTextSizeConsole", false);
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v15 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagRelocateMobileMenuButtons);
local v16 = require(l_RobloxGui_0.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant);
local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
local v19 = {
    [Enum.FontSize.Size14] = Enum.FontSize.Size11, 
    [Enum.FontSize.Size18] = Enum.FontSize.Size14, 
    [Enum.FontSize.Size24] = Enum.FontSize.Size18, 
    [Enum.FontSize.Size36] = Enum.FontSize.Size28, 
    [Enum.FontSize.Size48] = Enum.FontSize.Size36
};
local v20 = Color3.fromRGB(0, 0, 0);
local v21 = l_AppFonts_0.default:getDefault();
local v22 = v19[Enum.FontSize.Size24];
local v23 = {
    MenuContainer = {
        Color = Color3.new(0, 0, 0), 
        Transparency = 0.2
    }, 
    IGM_TabSelection = {
        Color = Color3.new(1, 1, 1), 
        Transparency = 0
    }, 
    White = {
        Color = Color3.new(1, 1, 1), 
        Transparency = 0
    }, 
    IGM_Background = {
        Color = Color3.fromRGB(0, 0, 0), 
        Transparency = 1
    }, 
    IGM_Button = {
        Color = Color3.fromRGB(0, 0, 0), 
        Transparency = 1
    }, 
    IGM_ButtonNonInteractable = {
        Color = Color3.fromRGB(100, 100, 100), 
        Transparency = 0
    }, 
    IGM_ButtonHover = {
        Color = Color3.fromRGB(56, 57, 59), 
        Transparency = 0
    }, 
    IGM_Stroke = {
        Color = Color3.new(0.776, 0.776, 0.776), 
        Transparency = 0
    }, 
    IGM_Selected = {
        Color = Color3.fromRGB(217, 217, 217), 
        Transparency = 0
    }, 
    Player_RowSelection = {
        Color = Color3.new(0.396, 0.4, 0.408), 
        Transparency = 0.9
    }
};
local v24 = {
    Confirmation_Font = {
        Font = l_AppFonts_0.default:getBold(), 
        RelativeSize = v19[Enum.FontSize.Size36], 
        TextSize = 28.584000000000003
    }, 
    Button_Font = {
        Font = l_AppFonts_0.default:getMedium(), 
        RelativeSize = v19[Enum.FontSize.Size24], 
        TextSize = 17.468
    }, 
    Username = {
        RelativeSize = if v5 then v19[Enum.FontSize.Size24] else v19[Enum.FontSize.Size18]
    }, 
    DisplayName = {
        RelativeSize = if v5 then Enum.FontSize.Size24 else Enum.FontSize.Size18, 
        Font = l_AppFonts_0.default:getMedium()
    }, 
    Settings_Font = {
        Font = l_AppFonts_0.default:getDefault()
    }, 
    Help_Title_Font = {
        Font = l_AppFonts_0.default:getMedium(), 
        RelativeSize = v19[Enum.FontSize.Size18]
    }, 
    Help_Text_Font = {
        Font = l_AppFonts_0.default:getDefault(), 
        RelativeSize = v19[Enum.FontSize.Size18], 
        TextSize = 14.292000000000002
    }, 
    Help_Gamepad_Font = {
        Font = l_AppFonts_0.default:getMedium()
    }, 
    Help_Touch_Font = {
        Font = l_AppFonts_0.default:getBold(), 
        RelativeSize = v19[Enum.FontSize.Size14]
    }, 
    Game_Settings_Font = {
        Font = l_AppFonts_0.default:getDefault(), 
        RelativeSize = v19[Enum.FontSize.Size24]
    }, 
    Conversation_Details_Font = {
        Font = l_AppFonts_0.default:getDefault(), 
        TextSize = 12.704
    }, 
    Utility_Text_Font = {
        Font = l_AppFonts_0.default:getDefault(), 
        TextSize = 17.468
    }, 
    Utility_Text_Small_Font = {
        Font = l_AppFonts_0.default:getDefault(), 
        TextSize = 12.704
    }, 
    Utility_Row_Small_Font = {
        Font = l_AppFonts_0.default:getDefault(), 
        TextSize = 12.704
    }, 
    Utility_Row_Font = {
        Font = l_AppFonts_0.default:getMedium(), 
        TextSize = v13 and v5 and 19.056 or 12.704
    }, 
    Back_Button_Font = {
        Font = l_AppFonts_0.default:getSemibold(), 
        TextSize = 19.056
    }, 
    Semibold_Font = {
        Font = l_AppFonts_0.default:getSemibold()
    }, 
    Bold_Font = {
        Font = l_AppFonts_0.default:getMedium()
    }
};
setmetatable(v23, {
    __index = function(_, v26) --[[ Line: 170 ]] --[[ Name: __index ]]
        -- upvalues: l_DarkTheme_0 (copy)
        return l_DarkTheme_0[v26];
    end
});
local v27 = {
    SETTINGS_SHIELD = "IGM_Background", 
    SETTINGS_SHIELD_TRANSPARENCY = "IGM_Background", 
    SELECTION_TEXT_COLOR_NORMAL = "White", 
    SELECTION_TEXT_COLOR_HIGHLIGHTED = "White", 
    HubBarContainer = "IGM_Background", 
    HubBarContainerTransparency = "IGM_Background", 
    HubBarContainerHover = "IGM_Background", 
    HubBarHomeButton = "IGM_Background", 
    HubBarHomeButtonHover = "IGM_Background", 
    HubBarHomeButtonTransparency = "IGM_Background", 
    HubBarHomeButtonTransparencyHover = "IGM_Background", 
    DarkenBackground = "Overlay", 
    PlayerRowFrame = "BackgroundDefault", 
    PlayerRowSelection = "Player_RowSelection", 
    TabSelection = "IGM_TabSelection", 
    DefaultButton = "IGM_Button", 
    DefaultButtonHover = "IGM_ButtonHover", 
    DefaultButtonStroke = "SecondaryDefault", 
    WhiteButtonText = "SecondaryContent", 
    MenuContainer = "BackgroundUIContrast", 
    ControlInputText = "SystemPrimaryDefault", 
    ControlInputStroke = "Divider", 
    ControlInputBackground = "BackgroundDefault", 
    ControlInputFocusedStroke = "IGM_TabSelection", 
    InputActionBackground = "BackgroundUIDefault", 
    IconButton = "UIDefault", 
    IconButtonHover = "BackgroundOnHover", 
    ImageButton = "Divider", 
    RowFrameBackground = "BackgroundDefault", 
    DropdownListBg = "BackgroundUIDefault", 
    DropdownListFocusBg = "UIDefault", 
    SELECTED_COLOR = "IGM_Selected", 
    NON_SELECTED_COLOR = "BackgroundUIDefault", 
    NotInteractableSelection = "UIEmphasis", 
    Confirmation = "Confirmation_Font", 
    Button = "Button_Font", 
    SettingsHub = "Settings_Font", 
    HelpTitle = "Help_Title_Font", 
    HelpText = "Help_Text_Font", 
    HelpGamepad = "Help_Gamepad_Font", 
    HelpTouch = "Help_Touch_Font", 
    GameSettings = "Game_Settings_Font", 
    ConversationDetails = "Conversation_Details_Font", 
    UtilityText = "Utility_Text_Font", 
    UtilityRow = "Utility_Row_Font", 
    UtilityRowSmall = "Utility_Row_Small_Font", 
    UtilityTextSmall = "Utility_Text_Small_Font", 
    BackButton = "Back_Button_Font", 
    Semibold = "Semibold_Font", 
    Bold = "Bold_Font", 
    ShareLinkTitle = "Utility_Text_Font", 
    ButtonNonInteractable = "IGM_ButtonNonInteractable"
};
local function v28() --[[ Line: 247 ]] --[[ Name: getViewportSize ]]
    if _G.__TESTEZ_RUNNING_TEST__ then
        return Vector2.new(1024, 1024);
    elseif not workspace.CurrentCamera then
        return nil;
    elseif workspace.CurrentCamera.ViewportSize == Vector2.new(0, 0) or workspace.CurrentCamera.ViewportSize == Vector2.new(1, 1) then
        return nil;
    else
        return workspace.CurrentCamera.ViewportSize;
    end;
end;
local function _() --[[ Line: 267 ]] --[[ Name: isPortrait ]]
    -- upvalues: v28 (copy)
    local v29 = v28();
    return v29 and v29.Y > v29.X;
end;
local v31 = v28();
local v32 = v31 and l_UserInputService_0.TouchEnabled and (v31.Y < 500 or v31.X < 700);
local function v35() --[[ Line: 276 ]]
    -- upvalues: v28 (copy)
    local v33 = v28();
    if v33 then
        local v34 = true;
        if v33.Y >= 500 then
            v34 = v33.X < 700;
        end;
    end;
    return false;
end;
local v36 = {
    PaddingTop = UDim.new(0, 0), 
    PaddingLeft = UDim.new(0, 20), 
    PaddingRight = UDim.new(0, 20), 
    PaddingBottom = UDim.new(0, 14)
};
local v37 = {
    PaddingTop = UDim.new(0, 0), 
    PaddingLeft = UDim.new(0, 12), 
    PaddingRight = UDim.new(0, 12), 
    PaddingBottom = if v15 and (not (v16 ~= 1) or v16 == 3) then UDim.new(0, 24) else UDim.new(0, 12)
};
local v38 = {
    AnchorPoint = Vector2.new(0.5, 0.5), 
    Position = UDim2.new(0.5, 0, 0.5, 10), 
    Size = UDim2.new(0, 0, 0, 0), 
    AutomaticSize = Enum.AutomaticSize.XY
};
local v39 = {
    AnchorPoint = Vector2.new(0.5, 1), 
    Position = UDim2.new(0.5, 0, 1, 8), 
    Size = UDim2.new(0, 0, 0, 0), 
    AutomaticSize = Enum.AutomaticSize.XY
};
local v40 = {
    AnchorPoint = Vector2.new(0.5, 0), 
    Position = UDim2.new(0.5, 0, 0, l_l_GuiService_0_GuiInset_0.Y), 
    Size = UDim2.new(1, -24, 0, 0), 
    AutomaticSize = Enum.AutomaticSize.Y
};
return {
    DefaultScrollBarThickness = 1, 
    DefaultCornerRadius = UDim.new(0, 8), 
    MenuContainerCornerRadius = UDim.new(0, 10), 
    DefaultStokeThickness = 1, 
    AlwaysShowBottomBar = function() --[[ Line: 322 ]] --[[ Name: AlwaysShowBottomBar ]]
        -- upvalues: v28 (copy), v32 (ref)
        local v41 = v28();
        if v41 then
            local v42 = true;
            if v41.Y >= 500 then
                v42 = v41.X < 700;
            end;
        end;
        if false then
            return true;
        elseif v32 then
            return false;
        else
            return true;
        end;
    end, 
    UIBloxThemeEnabled = true, 
    ShowHomeButton = false, 
    EnableVerticalBottomBar = false, 
    UseBiggerText = false, 
    UseStickyBar = v35, 
    EnableDarkenBackground = true, 
    TabHeaderIconPadding = 5, 
    UseInspectAndBuyPanel = function() --[[ Line: 345 ]] --[[ Name: UseInspectAndBuyPanel ]]
        -- upvalues: v32 (ref)
        return v32;
    end, 
    ExtraHubBottomPaddingMobile = 12, 
    HubPadding = function() --[[ Line: 349 ]] --[[ Name: HubPadding ]]
        -- upvalues: v15 (copy), v16 (copy), v28 (copy), l_UserInputService_0 (copy), v37 (copy), v36 (copy), v32 (ref)
        if v15 and v16 ~= 0 then
            local function _() --[[ Line: 352 ]]
                -- upvalues: v28 (ref), l_UserInputService_0 (ref)
                local v43 = v28();
                return v43 and l_UserInputService_0.TouchEnabled and (v43.Y < 500 or v43.X < 700);
            end;
            local v45 = v28();
            if v45 and l_UserInputService_0.TouchEnabled and (v45.Y < 500 or v45.X < 700) then
                return v37;
            else
                return v36;
            end;
        elseif v32 then
            return v37;
        else
            return v36;
        end;
    end, 
    MenuContainerPosition = function(v46) --[[ Line: 372 ]] --[[ Name: MenuContainerPosition ]]
        -- upvalues: l_isInExperienceUIVREnabled_0 (copy), v32 (ref), v28 (copy), v40 (copy), v39 (copy), v38 (copy)
        if l_isInExperienceUIVREnabled_0 and v46 then
            local v47 = v46:getMenuContainerPositionOverride();
            if v47 then
                return v47;
            end;
        end;
        if v32 then
            local v48 = v28();
            if v48 then
                local v49 = true;
                if v48.Y >= 500 then
                    v49 = v48.X < 700;
                end;
            end;
            if false then
                return v40;
            else
                return v39;
            end;
        else
            return v38;
        end;
    end, 
    ExtraPageBottomPaddingMobile = 48, 
    ButtonHeight = 36, 
    LargeButtonHeight = 48, 
    SelectorArrowButtonWidth = 32, 
    VerticalMenuWidth = 92, 
    Images = l_Images_0, 
    getIconSize = l_getIconSize_0, 
    IconSize = l_IconSize_0, 
    SHIELD_INACTIVE_POSITION = UDim2.new(0, 0, 1, 36), 
    viewportResized = function() --[[ Line: 398 ]] --[[ Name: viewportResized ]]
        -- upvalues: v31 (ref), v28 (copy), v32 (ref), l_UserInputService_0 (copy)
        v31 = v28();
        v32 = v31 and l_UserInputService_0.TouchEnabled and (v31.Y < 500 or v31.X < 700);
    end, 
    color = function(v50, v51) --[[ Line: 404 ]] --[[ Name: color ]]
        -- upvalues: v27 (copy), v23 (copy), v20 (copy)
        v50 = v27[v50] or v50;
        if v23[v50] then
            return v23[v50].Color;
        else
            return v51 or v20;
        end;
    end, 
    transparency = function(v52, v53) --[[ Line: 408 ]] --[[ Name: transparency ]]
        -- upvalues: v27 (copy), v23 (copy)
        v52 = v27[v52] or v52;
        if v23[v52] then
            return v23[v52].Transparency;
        else
            return v53 or 0;
        end;
    end, 
    font = function(v54, v55) --[[ Line: 412 ]] --[[ Name: font ]]
        -- upvalues: v21 (copy), v27 (copy), v24 (copy)
        if not v55 then
            return v21;
        else
            v55 = v27[v55] or v55;
            if v24[v55] then
                return v24[v55].Font;
            else
                return v54 or v21;
            end;
        end;
    end, 
    fontSize = function(v56, v57) --[[ Line: 419 ]] --[[ Name: fontSize ]]
        -- upvalues: v19 (copy), v27 (copy), v24 (copy), v22 (copy)
        if not v57 then
            return v19[v56];
        else
            v57 = v27[v57] or v57;
            if v24[v57] then
                return v24[v57].RelativeSize;
            else
                return v56 or v22;
            end;
        end;
    end, 
    textSize = function(v58, v59) --[[ Line: 426 ]] --[[ Name: textSize ]]
        -- upvalues: l_getUIScale_0 (copy), v32 (ref), v27 (copy), v24 (copy)
        local v60 = l_getUIScale_0(false);
        if not v59 then
            return v58 * 0.794 * v60;
        else
            if v32 and v59 == "UtilityRow" then
                v59 = "UtilityRowSmall";
            elseif v32 and v59 == "UtilityText" then
                v59 = "UtilityTextSmall";
            end;
            v59 = v27[v59] or v59;
            if v58 ~= nil then
                if v24[v59] and v24[v59].TextSize then
                    return v24[v59].TextSize * v60;
                else
                    return v58 * 0.794 * v60;
                end;
            elseif v24[v59] and v24[v59].TextSize then
                return v24[v59].TextSize;
            else
                return v58 * 0.794 or 19;
            end;
        end;
    end, 
    hydrateLabel = function(v61, v62, v63) --[[ Line: 447 ]] --[[ Name: hydrateLabel ]]
        -- upvalues: v27 (copy), v23 (copy), v24 (copy)
        v62 = v27[v62] or v62;
        if v23[v62] then
            local v64 = v23[v62];
            v61.TextColor3 = v64.Color;
            v61.TextTransparency = v64.Transparency;
        end;
        if v24[v63] then
            local v65 = v24[v62];
            v61.Font = v65.RelativeSize * 19.2;
            v61.TextSize = v65.TextSize;
        end;
    end, 
    platformNameTextSize = 18, 
    platformNameIconSize = UDim2.fromOffset(36, 36), 
    selectionCursor = v23.SelectionCursor
};