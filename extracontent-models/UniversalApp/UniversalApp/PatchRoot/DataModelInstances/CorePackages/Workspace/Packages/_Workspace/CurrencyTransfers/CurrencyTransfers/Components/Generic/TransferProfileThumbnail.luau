local l_Parent_0 = script:FindFirstAncestor("CurrencyTransfers").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Image_0 = v2.Image;
local l_View_0 = v2.View;
local l_Text_0 = v2.Text;
local l_useTokens_0 = v2.Hooks.useTokens;
local v7 = require(l_Parent_0.UserLib);
local l_Constants_0 = v7.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v7.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Size100x100_0 = Enum.ThumbnailSize.Size100x100;
return function(v11) --[[ Line: 30 ]] --[[ Name: UserProfileThumbnail ]]
    -- upvalues: l_useTokens_0 (copy), l_Size100x100_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy), v1 (copy), l_View_0 (copy), l_Image_0 (copy), l_Text_0 (copy)
    local v12 = l_useTokens_0();
    if not v11.thumbnailSize then
        v11.thumbnailSize = l_Size100x100_0;
    end;
    local v13 = 0;
    v13 = v11.thumbnailSize == Enum.ThumbnailSize.Size48x48 and 48 or v11.thumbnailSize == Enum.ThumbnailSize.Size60x60 and 60 or 150;
    local v14 = l_getRbxthumbWithTypeSizeAndOptions_0(v11.userId, l_Constants_0.RbxthumbTypes.AvatarHeadShot, v13, true);
    local v15 = v11.size or UDim2.fromOffset(80, 80);
    return v1.createElement(l_View_0, {
        tag = "col gap-xlarge auto-xy align-x-center align-y-center", 
        LayoutOrder = v11.layoutOrder
    }, {
        AvatarContainer = v1.createElement(l_View_0, {
            tag = "aspect-1-1 position-center-center anchor-center-center", 
            Size = v15
        }, {
            AvatarImage = v1.createElement(l_Image_0, {
                Image = v14, 
                backgroundStyle = v12.Color.Shift.Shift_300, 
                tag = "size-full aspect-1-1 radius-circle align-x-center align-y-center"
            })
        }), 
        NameContainer = if v11.showUsername and v11.username then v1.createElement(l_View_0, {
            tag = "col auto-y align-x-center"
        }, {
            Name = v1.createElement(l_Text_0, {
                Text = v11.username, 
                tag = "text-title-medium content-emphasis text-align-x-center"
            })
        }) else nil, 
        HandleContainer = if v11.displayName then v1.createElement(l_View_0, {
            tag = "col auto-y padding-bottom-medium", 
            LayoutOrder = 3
        }, {
            Handle = v1.createElement(l_Text_0, {
                Text = "@" .. v11.displayName, 
                tag = "text-label-medium content-emphasis"
            })
        }) else nil
    });
end;