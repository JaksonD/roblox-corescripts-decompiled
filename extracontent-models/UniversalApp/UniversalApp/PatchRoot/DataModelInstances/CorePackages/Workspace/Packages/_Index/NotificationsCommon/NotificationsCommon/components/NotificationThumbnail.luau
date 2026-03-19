local l_Parent_0 = script.Parent.Parent;
local l_context_0 = l_Parent_0.context;
local v2 = require(l_Parent_0.dependencies);
local l_React_0 = v2.React;
local l_UIBlox_0 = v2.UIBlox;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_LoadableImage_0 = l_UIBlox_0.App.Loading.LoadableImage;
local v7 = require(l_Parent_0.type);
local l_getRbxthumbWithTypeSizeAndOptions_0 = v2.getRbxthumbWithTypeSizeAndOptions;
local l_UserLibConstants_0 = v2.UserLibConstants;
local v10 = require(l_Parent_0.constants);
local v11 = game:DefineFastFlag("EnableStreamGamePassThumbnail", false);
local v12 = game:DefineFastFlag("EnableStreamAvatarImageUrlThumbnail", false);
local v13 = game:DefineFastFlag("EnableWhiteOverlayForRobloxIconInStreamNotifications", false);
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v16 = l_Images_0["icons/logo/block"];
local v17 = l_Images_0["icons/common/safety"];
local v18 = require(l_context_0.useNotificationCardState);
local function v20(v19) --[[ Line: 25 ]]
    -- upvalues: v7 (copy), l_UserLibConstants_0 (copy), v11 (copy), v12 (copy)
    if v19 == v7.SENDERThumbnailTypeEnum.Game then
        return l_UserLibConstants_0.RbxthumbTypes.GameIcon;
    elseif v19 == v7.SENDERThumbnailTypeEnum.User then
        return l_UserLibConstants_0.RbxthumbTypes.AvatarHeadShot;
    elseif v19 == v7.SENDERThumbnailTypeEnum.Group then
        return l_UserLibConstants_0.RbxthumbTypes.GroupIcon;
    elseif v19 == v7.SENDERThumbnailTypeEnum.Asset then
        return l_UserLibConstants_0.RbxthumbTypes.Asset;
    elseif v19 == v7.SENDERThumbnailTypeEnum.Bundle then
        return l_UserLibConstants_0.RbxthumbTypes.BundleThumbnail;
    elseif v19 == v7.SENDERThumbnailTypeEnum.GamePass and v11 then
        return l_UserLibConstants_0.RbxthumbTypes.GamePass;
    elseif v12 and v19 == v7.SENDERThumbnailTypeEnum.AvatarImageUrl then
        return l_UserLibConstants_0.RbxthumbTypes.AvatarImageUrl;
    else
        return l_UserLibConstants_0.RbxthumbTypes.GameIcon;
    end;
end;
local function _(v21) --[[ Line: 48 ]]
    -- upvalues: v7 (copy), v12 (copy)
    local v22 = true;
    if v21.idType ~= v7.SENDERThumbnailTypeEnum.User then
        v22 = v12 and v21.idType == v7.SENDERThumbnailTypeEnum.AvatarImageUrl;
    end;
    return v22;
end;
return function() --[[ Line: 56 ]]
    -- upvalues: v18 (copy), v12 (copy), v7 (copy), l_useStyle_0 (copy), v10 (copy), l_React_0 (copy), l_ImageSetLabel_0 (copy), v17 (copy), v16 (copy), v13 (copy), v20 (copy), l_UserLibConstants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_LoadableImage_0 (copy)
    local v24 = v18("thumbnail");
    if v24 == nil or #v24 == 0 then
        return nil;
    else
        local v25 = v24[1];
        if v25 == nil then
            return nil;
        elseif not v12 and v25.idType == v7.SENDERThumbnailTypeEnum.AvatarImageUrl then
            return nil;
        else
            local v26 = l_useStyle_0();
            if v25.idType == v7.SENDERThumbnailTypeEnum.Icon then
                if v25.id == v10.SafetyThumbnailId then
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
                            Image = v17, 
                            BackgroundTransparency = 1, 
                            ImageColor3 = v26.Theme.IconDefault.Color
                        })
                    });
                else
                    return l_React_0.createElement("Frame", {
                        BackgroundTransparency = 0, 
                        Size = UDim2.fromScale(1, 1), 
                        SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                        BackgroundColor3 = v26.Tokens.Global.Color.Blue.Color3, 
                        BorderSizePixel = 0
                    }, {
                        UICorner = l_React_0.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 11)
                        }), 
                        Icon = l_React_0.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.fromScale(0.75, 0.75), 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            LayoutOrder = 1, 
                            Image = v16, 
                            BackgroundTransparency = 1, 
                            ImageColor3 = if v13 then v26.Tokens.Global.Color.White.Color3 else nil
                        })
                    });
                end;
            else
                local v27 = if v12 and v20(v25.idType) == l_UserLibConstants_0.RbxthumbTypes.AvatarImageUrl then v25.id else l_getRbxthumbWithTypeSizeAndOptions_0(v25.id, v20(v25.idType), 150);
                local l_createElement_0 = l_React_0.createElement;
                local v29 = "Frame";
                local v30 = {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                    BorderSizePixel = 0
                };
                local v31 = {};
                local l_createElement_1 = l_React_0.createElement;
                local l_l_LoadableImage_0_0 = l_LoadableImage_0;
                local v34 = {
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = v26.Theme.BackgroundDefault.Color, 
                    Image = v27, 
                    Size = UDim2.fromScale(1, 1)
                };
                local v35 = true;
                if v25.idType ~= v7.SENDERThumbnailTypeEnum.User then
                    v35 = v12 and v25.idType == v7.SENDERThumbnailTypeEnum.AvatarImageUrl;
                end;
                v34.cornerRadius = if v35 then UDim.new(0.5, 0) else UDim.new(0, 8);
                v34.showFailedStateWhenLoadingFailed = true;
                v34.useShimmerAnimationWhileLoading = true;
                v34.ZIndex = 1;
                v31.Thumbnail = l_createElement_1(l_l_LoadableImage_0_0, v34);
                return l_createElement_0(v29, v30, v31);
            end;
        end;
    end;
end;