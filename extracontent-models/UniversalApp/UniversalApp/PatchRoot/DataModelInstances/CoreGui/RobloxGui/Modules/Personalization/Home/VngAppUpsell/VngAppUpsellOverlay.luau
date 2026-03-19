local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_FullPageModal_0 = v3.App.Dialog.Modal.FullPageModal;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_CloseCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v16 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v17 = game:DefineFastString("VngAppUpsellUrl", "https://www.roblox.com");
local v18 = game:DefineFastString("VngAppUpsellProTipTextEn", "");
local v19 = game:DefineFastString("VngAppUpsellProTipTextVn", "");
return function(v20) --[[ Line: 32 ]] --[[ Name: VngAppUpsellOverlay ]]
    -- upvalues: l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), l_useRoactService_0 (copy), l_AppLinking_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), v2 (copy), l_CloseCentralOverlay_0 (copy), v16 (copy), v19 (copy), v18 (copy), l_GuiService_0 (copy), l_FullPageModal_0 (copy), l_ButtonType_0 (copy), v17 (copy), l_StyledTextLabel_0 (copy)
    local v21 = l_useStyle_0();
    local v22 = l_useDesignTokens_0();
    local v23 = l_useLocalization_0({
        vngUpsellTitle = "CommonUI.Features.Label.VNGMigrationTitle", 
        vngUpsellBody = "CommonUI.Features.Label.VNGMigrationBody", 
        vngUpsellProtip = "CommonUI.Features.Label.VNGMigrationTip", 
        vngUpsellButtonText = "CommonUI.Features.Label.VNGMigrationGoButton"
    });
    local v24 = l_useRoactService_0(l_AppLinking_0);
    local v25 = l_useDispatch_0();
    local v27 = l_useSelector_0(function(v26) --[[ Line: 44 ]]
        return v26.ScreenSize;
    end);
    local v28 = v2.useCallback(function() --[[ Line: 48 ]]
        -- upvalues: v25 (copy), l_CloseCentralOverlay_0 (ref)
        v25(l_CloseCentralOverlay_0());
    end, {});
    local l_vngUpsellProtip_0 = v23.vngUpsellProtip;
    local l_Locale_0 = l_useRoactService_0(v16):GetLocale();
    if v19 ~= "" and l_Locale_0 == "vi-vn" then
        l_vngUpsellProtip_0 = v19;
    elseif v18 ~= "" and l_Locale_0 == "en-us" then
        l_vngUpsellProtip_0 = v18;
    end;
    local l_l_GuiService_0_SafeZoneOffsets_0 = l_GuiService_0:GetSafeZoneOffsets();
    local l_Size_250_0 = v22.Global.Size_250;
    local v33 = l_l_GuiService_0_SafeZoneOffsets_0.top + l_Size_250_0;
    local v34 = l_Size_250_0 + 186 + v22.Global.Size_400;
    return v2.createElement(l_FullPageModal_0, {
        screenSize = v27, 
        title = v23.vngUpsellTitle, 
        distanceFromTop = v33, 
        onCloseClicked = if v20.isDismissable then v28 else nil, 
        buttonStackProps = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = function() --[[ Line: 81 ]] --[[ Name: onActivated ]]
                            -- upvalues: v17 (ref), v24 (copy)
                            v24:openURL(v17);
                        end, 
                        text = v23.vngUpsellButtonText
                    }
                }
            }
        }
    }, {
        ContentFrame = v2.createElement("ScrollingFrame", {
            BackgroundTransparency = v21.Theme.BackgroundUIDefault.Transparency, 
            BackgroundColor3 = v21.Theme.BackgroundUIDefault.Color, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            BorderSizePixel = 0, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ScrollBarThickness = 0, 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            CanvasSize = UDim2.new(1, 0, 0, 0)
        }, {
            VngIcon = v2.createElement("ImageLabel", {
                Size = UDim2.new(0, 186, 0, 186), 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/LuaApp/icons/ic_launcher_vng_square_xxxhdpi.png", 
                Position = UDim2.new(0.5, 0, 0, l_Size_250_0), 
                AnchorPoint = Vector2.new(0.5, 0)
            }), 
            Contents = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                Position = UDim2.new(0.5, 0, 0, v34), 
                AnchorPoint = Vector2.new(0.5, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, l_Size_250_0)
                }), 
                BodyText = v2.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 1, 
                    automaticSize = Enum.AutomaticSize.Y, 
                    text = v23.vngUpsellBody, 
                    colorStyle = v21.Theme.TextEmphasis, 
                    fontStyle = v21.Font.HeadingSmall, 
                    size = UDim2.new(1, 0, 0, 0), 
                    textXAlignment = Enum.TextXAlignment.Center
                }), 
                Protip = v2.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 2, 
                    automaticSize = Enum.AutomaticSize.Y, 
                    text = l_vngUpsellProtip_0, 
                    colorStyle = v21.Theme.TextDefault, 
                    fontStyle = v21.Font.BodyLarge, 
                    size = UDim2.new(1, 0, 0, 0), 
                    textXAlignment = Enum.TextXAlignment.Center
                }), 
                BottomPadding = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 4
                })
            })
        })
    });
end;