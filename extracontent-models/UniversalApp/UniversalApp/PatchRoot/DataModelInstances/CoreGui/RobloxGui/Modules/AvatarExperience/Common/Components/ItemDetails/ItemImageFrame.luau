local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v7 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v9.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v9.AvatarRoute.Hooks.useAvatarRoute;
local v12 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v13 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v14 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_AvatarExperience_0 = l_Modules_0.AvatarExperience;
local l_Common_0 = l_AvatarExperience_0.Common;
local l_Catalog_0 = l_AvatarExperience_0.Catalog;
local _ = require(l_Common_0.Types);
local v19 = require(l_Common_0.Thunks.ToggleTryOnThunk);
local v20 = require(l_Common_0.Components.RoactNavigation.AppRouterWrapper.NavigateDownToAvatarScreen);
local v21 = require(l_Catalog_0.CatalogUtils);
local v22 = require(l_Catalog_0.Services.Analytics);
local l_LoadableImage_0 = v5.App.Loading.LoadableImage;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_Button_0 = v5.App.Button.Button;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v7.Utils.getRbxthumbWithTypeSizeAndOptions;
return function(v28) --[[ Line: 59 ]] --[[ Name: ItemImageFrame ]]
    -- upvalues: l_useStyle_0 (copy), v12 (copy), l_useNavigation_0 (copy), v14 (copy), v13 (copy), v22 (copy), l_useDispatch_0 (copy), l_useAvatarRoute_0 (copy), v4 (copy), v19 (copy), v20 (copy), l_AvatarScreen_0 (copy), v21 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_TextService_0 (copy), v3 (copy), l_LoadableImage_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local v29 = l_useStyle_0();
    local l_Theme_0 = v29.Theme;
    local l_Font_0 = v29.Font;
    local v32 = v12({
        tryOn = "Feature.Avatar.Action.TryOn"
    });
    local v33 = l_useNavigation_0();
    local v34 = v14(v13);
    local v35 = v14(v22);
    local v36 = l_useDispatch_0();
    local v37 = l_useAvatarRoute_0();
    local v40 = v4.useCallback(function() --[[ Line: 73 ]]
        -- upvalues: v28 (copy), v36 (copy), v19 (ref), v34 (copy), v35 (copy), v37 (copy), v33 (copy), v20 (ref), l_AvatarScreen_0 (ref)
        local v38 = {
            itemId = v28.itemId, 
            itemType = v28.itemType, 
            mountAsFullView = false, 
            mountAnimation = false, 
            itemDetailsPeekViewRefs = v28.itemDetailsPeekViewRefs, 
            resultsListRef = v28.resultsListRef
        };
        local v39 = v28.itemType .. v28.itemId;
        v36(v19(v34, v35, v28.itemType, v28.itemSubType, v28.itemId, true, v37, v33));
        v36(v20(l_AvatarScreen_0.TryOnItem, v39, v38));
    end, {
        v34, 
        v35, 
        v37, 
        v33, 
        v28
    });
    local v41 = v28.width * 9 / 16;
    local l_itemType_0 = v28.itemType;
    local l_itemId_0 = v28.itemId;
    local v44 = v21.GetRbxThumbType(l_itemType_0);
    local v45 = l_getRbxthumbWithTypeSizeAndOptions_0(l_itemId_0, v44, 420);
    local v46 = v33.getParam("fromProfile");
    local l_tryOn_0 = v32.tryOn;
    local v48 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local v49 = 16 + l_TextService_0:GetTextSize(l_tryOn_0, v48, l_Font_0.Header2.Font, Vector2.new(10000, 10000)).X;
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v41), 
        LayoutOrder = 1, 
        ZIndex = 0
    }, {
        ItemBackground = v3.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.fromScale(0.5, 0), 
            Size = UDim2.new(1, 48, 1, 0), 
            ZIndex = 0, 
            BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
            BorderSizePixel = 0
        }, {
            UIGradient = v3.createElement("UIGradient", {
                Rotation = -90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(0.4, 0), 
                    NumberSequenceKeypoint.new(1, 1)
                })
            })
        }), 
        Image = v3.createElement(l_LoadableImage_0, {
            BackgroundTransparency = 1, 
            Image = v45, 
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.fromScale(0.5, 0), 
            Size = UDim2.fromOffset(v41, v41), 
            useShimmerAnimationWhileLoading = true
        }), 
        TryOnButtonFrame = if v46 then v3.createElement("Frame", {
            ZIndex = 2, 
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            TryOnButton = v3.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                position = UDim2.new(1, -v49 - 8, 1, -44), 
                size = UDim2.fromOffset(v49, 36), 
                text = l_tryOn_0, 
                onActivated = v40
            })
        }) else nil
    });
end;