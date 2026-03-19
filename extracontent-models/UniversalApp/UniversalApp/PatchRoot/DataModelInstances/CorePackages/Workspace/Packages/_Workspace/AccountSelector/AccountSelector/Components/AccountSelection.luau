local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_Cell_0 = l_UIBlox_0.App.Table.Cell;
local l_LoadableImage_0 = l_UIBlox_0.App.Loading.LoadableImage;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v1.UserLib.Utils.getStandardSizeAvatarHeadShotRbxthumb;
local l_useState_0 = l_React_0.useState;
local l_useDesignTokens_0 = v1.Style.useDesignTokens;
local v13 = require(script.Parent.SelectionRow);
local v14 = game:DefineFastFlag("ShouldUseSelectionRowInAccountSelectionRelease1", false);
return function(v15) --[[ Line: 34 ]] --[[ Name: AccountSelection ]]
    -- upvalues: l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_useState_0 (copy), v14 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_React_0 (copy), l_LoadableImage_0 (copy), v13 (copy), l_StyledTextLabel_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_Cell_0 (copy)
    local v16 = l_useStyle_0();
    local v17 = l_useDesignTokens_0();
    local v18, v19 = l_useState_0(false);
    local function v20() --[[ Line: 41 ]] --[[ Name: handleAccountSelection ]]
        -- upvalues: v15 (copy), v19 (copy)
        if not v15.isDisabled and not v15.user.isUnselectable then
            v19(true);
            v15.onAccountSelection(v15.user.id);
        end;
    end;
    if v14 then
        local function v22() --[[ Line: 49 ]] --[[ Name: renderImage ]]
            -- upvalues: l_getStandardSizeAvatarHeadShotRbxthumb_0 (ref), v15 (copy), l_React_0 (ref), l_LoadableImage_0 (ref)
            local v21 = l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v15.user.id)));
            return l_React_0.createElement(l_LoadableImage_0, {
                Size = UDim2.new(0, 48, 0, 48), 
                Image = v21, 
                useShimmerAnimationWhileLoading = true, 
                cornerRadius = UDim.new(0.5, 0), 
                shouldHandleReloads = true
            });
        end;
        return l_React_0.createElement(v13, {
            titleContent = v15.user.displayName, 
            subtitleContent = "@" .. (v15.user.name or ""), 
            renderImage = v22, 
            iconKey = v15.user.iconKey, 
            onAccountSelection = v20, 
            userInteractionEnabled = not v15.user.isUnselectable
        });
    else
        local function v24() --[[ Line: 70 ]] --[[ Name: renderAvatarImage ]]
            -- upvalues: l_getStandardSizeAvatarHeadShotRbxthumb_0 (ref), v15 (copy), l_React_0 (ref), l_LoadableImage_0 (ref)
            local v23 = l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v15.user.id)));
            return l_React_0.createElement(l_LoadableImage_0, {
                Size = UDim2.new(0, 48, 0, 48), 
                Image = v23, 
                useShimmerAnimationWhileLoading = true, 
                cornerRadius = UDim.new(0.5, 0), 
                shouldHandleReloads = true
            });
        end;
        local function v25() --[[ Line: 81 ]] --[[ Name: renderNames ]]
            -- upvalues: l_React_0 (ref), v17 (copy), l_StyledTextLabel_0 (ref), v15 (copy), v16 (copy)
            return l_React_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = v17.Global.Opacity_0
            }, {
                VerticalLayout = l_React_0.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left
                }), 
                DisplayName = l_React_0.createElement(l_StyledTextLabel_0, {
                    text = v15.user.displayName, 
                    fontStyle = v16.Font.Header2, 
                    colorStyle = v16.Theme.TextEmphasis, 
                    layoutOrder = 0
                }), 
                UserName = l_React_0.createElement(l_StyledTextLabel_0, {
                    text = "@" .. v15.user.name, 
                    fontStyle = v16.Font.Body, 
                    colorStyle = v16.Theme.TextDefault, 
                    layoutOrder = 1
                })
            });
        end;
        local function v26() --[[ Line: 106 ]] --[[ Name: renderCellHead ]]
            -- upvalues: l_React_0 (ref), v17 (copy), v24 (copy), v25 (copy)
            return l_React_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = v17.Global.Opacity_0
            }, {
                Layout = l_React_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, v17.Global.Space_100)
                }), 
                AvatarThumbnail = v24(), 
                Names = v25()
            });
        end;
        local function v27() --[[ Line: 121 ]] --[[ Name: renderCellBackground ]]
            -- upvalues: l_React_0 (ref), v16 (copy)
            return l_React_0.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundColor3 = v16.Theme.BackgroundUIDefault.Color, 
                BackgroundTransparency = v16.Theme.BackgroundUIDefault.BackgroundTransparency, 
                BorderColor3 = v16.Theme.BackgroundUIDefault.Color
            });
        end;
        local v28 = l_React_0.createElement(l_ImageSetLabel_0, {
            Size = UDim2.fromOffset(28, 28), 
            Image = l_Images_0["icons/status/success_large"], 
            ImageColor3 = v16.Theme.Success.Color, 
            BackgroundTransparency = 1
        });
        return l_React_0.createElement(l_Cell_0, {
            onActivated = v20, 
            isSelected = v18, 
            head = v26(), 
            tail = v18 and v28 or l_React_0.createElement("Frame"), 
            background = v27(), 
            size = UDim2.new(1, 0, 0, v17.Global.Size_800)
        });
    end;
end;