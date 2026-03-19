local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v2 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_Parent_0 = script.Parent.Parent;
local v7 = require(l_Parent_0.Colors);
local v8 = require(l_Parent_0.Constants);
local v9 = require(l_Parent_0.Actions.SetTryingOnInfo);
local v10 = require(l_Parent_0.Thunks.TryOnItem);
local v11 = require(l_Parent_0.getSelectionImageObjectRounded);
local l_TryOn_0 = require(script.Parent.Common.ControllerShortcutKeycodes).TryOn;
local v13 = v3.PureComponent:extend("TryOnButton");
v13.init = function(v14) --[[ Line: 22 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy), l_ContextActionService_0 (copy), l_TryOn_0 (copy)
    v14.selectedImage = v11();
    l_ContextActionService_0:BindCoreAction("TryOnGamepadShortcut", function(_, v16, _) --[[ Line: 25 ]]
        -- upvalues: v14 (copy)
        if v16 == Enum.UserInputState.End then
            v14:activateButton();
            return Enum.ContextActionResult.Sink;
        else
            return Enum.ContextActionResult.Pass;
        end;
    end, false, l_TryOn_0);
end;
v13.activateButton = function(v18) --[[ Line: 34 ]] --[[ Name: activateButton ]]
    -- upvalues: v8 (copy)
    if not v18.props.showTryOn then
        return;
    else
        local l_assetInfo_0 = v18.props.assetInfo;
        local l_tryOnItem_0 = v18.props.tryOnItem;
        local l_takeOffItem_0 = v18.props.takeOffItem;
        local l_tryingOn_0 = v18.props.tryingOnInfo.tryingOn;
        local l_partOfBundleAndOffsale_0 = v18.props.partOfBundleAndOffsale;
        local l_bundleId_0 = v18.props.bundleId;
        if not (l_assetInfo_0 and v18.props.localPlayerModel and v8.LayeredAssetTypes[l_assetInfo_0.assetTypeId] ~= nil and v18.props.localPlayerModel.Humanoid.RigType == Enum.HumanoidRigType.R6) then
            if l_tryingOn_0 then
                l_takeOffItem_0();
                return;
            else
                l_tryOnItem_0(true, l_assetInfo_0.assetId, l_assetInfo_0.assetTypeId, l_partOfBundleAndOffsale_0, l_bundleId_0);
            end;
        end;
        return;
    end;
end;
v13.willUnmount = function(_) --[[ Line: 61 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("TryOnGamepadShortcut");
end;
v13.render = function(v26) --[[ Line: 65 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v3 (copy), v7 (copy), v2 (copy), l_AppFonts_0 (copy)
    local l_tryingOn_1 = v26.props.tryingOnInfo.tryingOn;
    local l_showTryOn_0 = v26.props.showTryOn;
    local l_locale_0 = v26.props.locale;
    local l_assetInfo_1 = v26.props.assetInfo;
    local l_tryOnButtonRef_0 = v26.props.tryOnButtonRef;
    local v32 = nil;
    v32 = l_tryingOn_1 and "InGame.InspectMenu.Action.TakeOff" or "InGame.InspectMenu.Action.TryOn";
    local v33 = l_assetInfo_1 and v26.props.localPlayerModel and v8.LayeredAssetTypes[l_assetInfo_1.assetTypeId] ~= nil and v26.props.localPlayerModel.Humanoid.RigType == Enum.HumanoidRigType.R6;
    return v3.createElement("ImageLabel", {
        AnchorPoint = Vector2.new(0.5, 0), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0.5, -32, 0, 44), 
        Visible = l_showTryOn_0, 
        LayoutOrder = 2, 
        Image = "rbxasset://textures/ui/InspectMenu/Button_outline.png", 
        ImageTransparency = v33 and 0.5 or 0, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(5, 5, 120, 20)
    }, {
        SelectionGainedImage = v3.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Visible = false, 
            Image = "rbxasset://textures/ui/InspectMenu/Button_white.png", 
            ImageColor3 = v7.Pumice
        }), 
        TryOnTextKey = v3.createElement("TextButton", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Text = v2:FormatByKeyForLocale(v32, l_locale_0), 
            Font = l_AppFonts_0.default:getDefault(), 
            TextSize = 16, 
            TextColor3 = v7.White, 
            TextTransparency = v33 and 0.5 or 0, 
            SelectionImageObject = v26.selectedImage, 
            ZIndex = 2, 
            [v3.Event.SelectionGained] = function(v34) --[[ Line: 114 ]]
                -- upvalues: v7 (ref)
                v34.Parent.SelectionGainedImage.Visible = true;
                v34.TextColor3 = v7.Carbon;
            end, 
            [v3.Event.SelectionLost] = function(v35) --[[ Line: 118 ]]
                -- upvalues: v7 (ref)
                v35.Parent.SelectionGainedImage.Visible = false;
                v35.TextColor3 = v7.White;
            end, 
            [v3.Ref] = l_tryOnButtonRef_0, 
            [v3.Event.Activated] = function() --[[ Line: 123 ]]
                -- upvalues: v26 (copy)
                v26:activateButton();
            end
        })
    });
end;
return v4.UNSTABLE_connect2(function(v36, _) --[[ Line: 130 ]]
    local l_assetId_0 = v36.detailsInformation.assetId;
    return {
        locale = v36.locale, 
        view = v36.view, 
        assetInfo = v36.assets[l_assetId_0], 
        bundleInfo = v36.bundles, 
        tryingOnInfo = v36.tryingOnInfo
    };
end, function(v39) --[[ Line: 140 ]]
    -- upvalues: v10 (copy), v9 (copy)
    return {
        tryOnItem = function(v40, v41, v42, v43, v44) --[[ Line: 142 ]] --[[ Name: tryOnItem ]]
            -- upvalues: v39 (copy), v10 (ref)
            v39(v10(v40, v41, v42, v43, v44));
        end, 
        takeOffItem = function() --[[ Line: 145 ]] --[[ Name: takeOffItem ]]
            -- upvalues: v39 (copy), v9 (ref)
            v39(v9(false, nil, nil));
        end
    };
end)(v13);