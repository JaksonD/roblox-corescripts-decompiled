local l_Parent_0 = script.Parent.Parent;
local l_context_0 = l_Parent_0.context;
local v2 = require(l_Parent_0.dependencies);
local l_ImagePile_0 = v2.AppBlox.ImagePile;
local l_React_0 = v2.React;
local l_UIBlox_0 = v2.UIBlox;
local l_LoadableImage_0 = l_UIBlox_0.App.Loading.LoadableImage;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v8 = require(l_Parent_0.type);
local l_getRbxthumbWithTypeSizeAndOptions_0 = v2.getRbxthumbWithTypeSizeAndOptions;
local l_UserLibConstants_0 = v2.UserLibConstants;
local l_Parent_1 = l_Parent_0.Parent;
local l_constants_0 = require(l_Parent_1.NotificationsCommon).constants;
local v13 = require(l_Parent_1.SharedFlags);
local l_utils_0 = l_Parent_0.utils;
local v15 = require(l_utils_0.toastNotificationHelper);
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v18 = l_Images_0["icons/graphic/logomark-gradient_xlarge"];
local v19 = l_Images_0["icons/common/safety"];
local l_GetFFlagEnableToastIconSupport_0 = v13.GetFFlagEnableToastIconSupport;
local v21 = require(l_context_0.useNotificationCardState);
local function v23(v22) --[[ Line: 30 ]]
    -- upvalues: v8 (copy), l_UserLibConstants_0 (copy)
    if v22 == v8.SENDERThumbnailTypeEnum.Game then
        return l_UserLibConstants_0.RbxthumbTypes.GameIcon;
    elseif v22 == v8.SENDERThumbnailTypeEnum.User then
        return l_UserLibConstants_0.RbxthumbTypes.AvatarHeadShot;
    elseif v22 == v8.SENDERThumbnailTypeEnum.Group then
        return l_UserLibConstants_0.RbxthumbTypes.GroupIcon;
    elseif v22 == v8.SENDERThumbnailTypeEnum.Asset then
        return l_UserLibConstants_0.RbxthumbTypes.Asset;
    elseif v22 == v8.SENDERThumbnailTypeEnum.Bundle then
        return l_UserLibConstants_0.RbxthumbTypes.BundleThumbnail;
    else
        return l_UserLibConstants_0.RbxthumbTypes.GameIcon;
    end;
end;
local v25 = if v15.isUserThumbnail then v15.isUserThumbnail else function(v24) --[[ Line: 48 ]]
    -- upvalues: v8 (copy)
    return v24.idType == v8.SENDERThumbnailTypeEnum.User;
end;
return function() --[[ Line: 52 ]]
    -- upvalues: v21 (copy), l_useStyle_0 (copy), v25 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v23 (copy), l_GetFFlagEnableToastIconSupport_0 (copy), v8 (copy), l_constants_0 (copy), l_React_0 (copy), l_ImageSetLabel_0 (copy), v19 (copy), v18 (copy), l_ImagePile_0 (copy), l_LoadableImage_0 (copy)
    local v26 = v21("thumbnail");
    if v26 == nil or #v26 == 0 then
        return nil;
    else
        local v27 = l_useStyle_0();
        local v28 = {};
        local v29 = false;
        for _, v31 in ipairs(v26) do
            if not v25(v31) then
                v29 = true;
            end;
            v28[tostring(v31.id)] = l_getRbxthumbWithTypeSizeAndOptions_0(v31.id, v23(v31.idType), 150);
        end;
        local v32 = {};
        if l_GetFFlagEnableToastIconSupport_0() then
            local v33 = v26[1];
            if v33.idType == v8.SENDERThumbnailTypeEnum.Icon then
                if v33.id == l_constants_0.SafetyThumbnailId then
                    return l_React_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromScale(1, 1), 
                        SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                        BorderSizePixel = 0
                    }, {
                        Icon = l_React_0.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.fromScale(1, 1), 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            LayoutOrder = 1, 
                            Image = v19, 
                            BackgroundTransparency = 1, 
                            ImageColor3 = v27.Theme.IconDefault.Color
                        })
                    });
                else
                    return l_React_0.createElement("Frame", {
                        BackgroundTransparency = 0, 
                        Size = UDim2.fromScale(1, 1), 
                        SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                        BackgroundColor3 = v27.Tokens.Global.Color.Black.Color3, 
                        BorderSizePixel = 0
                    }, {
                        UICorner = l_React_0.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 8)
                        }), 
                        Icon = l_React_0.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.fromScale(0.8, 0.8), 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            LayoutOrder = 1, 
                            Image = v18, 
                            BackgroundTransparency = 1
                        })
                    });
                end;
            end;
        end;
        if not v29 then
            for _, v35 in v28 do
                table.insert(v32, {
                    Image = v35, 
                    BackgroundColor3 = Color3.fromRGB(101, 102, 104)
                });
            end;
            return l_React_0.createElement(l_ImagePile_0, {
                images = v32, 
                imageBorderColor = v27.Theme.BackgroundUIDefault.Color, 
                imageBorderThickness = #v32 > 1 and 2 or 0
            });
        else
            local v36 = v26[1];
            if v36 == nil then
                return nil;
            else
                local v37 = l_getRbxthumbWithTypeSizeAndOptions_0(v36.id, v23(v36.idType), 150);
                local v38 = UDim.new(0.5, 0);
                return l_React_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                    BorderSizePixel = 0
                }, {
                    Thumbnail = l_React_0.createElement(l_LoadableImage_0, {
                        BackgroundTransparency = 1, 
                        Image = v37, 
                        Size = UDim2.fromScale(1, 1), 
                        cornerRadius = if v25(v36) then v38 else UDim.new(0, 8), 
                        showFailedStateWhenLoadingFailed = true, 
                        useShimmerAnimationWhileLoading = true, 
                        ZIndex = 1
                    })
                });
            end;
        end;
    end;
end;