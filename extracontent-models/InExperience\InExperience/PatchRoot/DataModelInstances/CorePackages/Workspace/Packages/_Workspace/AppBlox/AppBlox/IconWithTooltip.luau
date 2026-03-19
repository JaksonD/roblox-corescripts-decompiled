local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = v3.Core.Control.Interactable;
local l_withHoverTooltip_0 = v3.App.Dialog.TooltipV2.withHoverTooltip;
local l_useCursor_0 = v3.App.SelectionCursor.useCursor;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_GetFFlagTenFootUiSupportSortHeaderTooltip_0 = require(l_Parent_0.SharedFlags).GetFFlagTenFootUiSupportSortHeaderTooltip;
local l_FFlagLuaAppFixCursorHooks_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixCursorHooks;
game:DefineFastInt("TooltipHitboxMinSize", 26);
local v14 = l_Images_0["icons/actions/info"];
local v15 = Vector2.new(game:GetFastInt("TooltipHitboxMinSize"), game:GetFastInt("TooltipHitboxMinSize"));
return function(v16) --[[ Line: 42 ]] --[[ Name: IconWithTooltip ]]
    -- upvalues: l_useUiModeInfo_0 (copy), l_useDesignTokens_0 (copy), l_GetFFlagTenFootUiSupportSortHeaderTooltip_0 (copy), l_FFlagLuaAppFixCursorHooks_0 (copy), l_useCursor_0 (copy), l_UiMode_0 (copy), l_CoreGui_0 (copy), l_withHoverTooltip_0 (copy), v2 (copy), l_ImageSetLabel_0 (copy), v14 (copy), l_Interactable_0 (copy), v15 (copy)
    local v17 = l_useUiModeInfo_0();
    local v18 = l_useDesignTokens_0();
    local l_Color3_0 = v18.Semantic.Color.Text.Emphasis.Color3;
    local l_Space_300_0 = v18.Global.Space_300;
    local v21 = nil;
    local v22 = nil;
    if l_GetFFlagTenFootUiSupportSortHeaderTooltip_0() then
        v21 = v18.Semantic.Radius.Circle;
        v22 = v18.Semantic.Offset.Focus.Inset;
    end;
    local v23 = if l_FFlagLuaAppFixCursorHooks_0 and l_GetFFlagTenFootUiSupportSortHeaderTooltip_0() then l_useCursor_0(UDim.new(0, v21), v22) else nil;
    local v24 = v17.uiMode == l_UiMode_0.VR;
    if v17.uiMode == l_UiMode_0.VR and not v16.supportVR then
        return nil;
    elseif v17.uiMode == l_UiMode_0.TenFoot and not v16.supportTenFootUi then
        return nil;
    else
        local v25 = {
            bodyText = v16.hoverText, 
            useLargeDropShadow = true
        };
        local v26 = {
            preferredOrientation = v16.tooltipOrientation, 
            guiTarget = l_CoreGui_0, 
            DisplayOrder = 10, 
            delayTime = 0.2, 
            triggerPointName = v16.triggerPointName, 
            disabled = v24
        };
        local v27 = v16.size or UDim2.new(0, l_Space_300_0, 0, l_Space_300_0);
        return l_withHoverTooltip_0(v25, v26, function(v28, v29) --[[ Line: 81 ]]
            -- upvalues: v2 (ref), v27 (copy), v16 (copy), l_FFlagLuaAppFixCursorHooks_0 (ref), l_GetFFlagTenFootUiSupportSortHeaderTooltip_0 (ref), v23 (copy), l_useCursor_0 (ref), v21 (ref), v22 (ref), l_ImageSetLabel_0 (ref), v14 (ref), l_Color3_0 (copy), l_Interactable_0 (ref), v15 (ref)
            return v2.createElement("Frame", {
                Size = v27, 
                BackgroundTransparency = 1, 
                LayoutOrder = v16.layoutOrder, 
                AnchorPoint = v16.anchorPoint, 
                Position = v16.position, 
                SelectionImageObject = if l_FFlagLuaAppFixCursorHooks_0 and l_GetFFlagTenFootUiSupportSortHeaderTooltip_0() then v23 else if l_GetFFlagTenFootUiSupportSortHeaderTooltip_0() then l_useCursor_0(UDim.new(0, v21), v22) else nil, 
                [v2.Change.AbsolutePosition] = v28, 
                [v2.Change.AbsoluteSize] = v28
            }, {
                TooltipIcon = v2.createElement(l_ImageSetLabel_0, {
                    Size = v27, 
                    BackgroundTransparency = 1, 
                    Image = v16.icon or v14, 
                    ImageColor3 = v16.color or l_Color3_0, 
                    ZIndex = 0
                }), 
                Hitbox = v2.createElement(l_Interactable_0, {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    onStateChanged = v29, 
                    [v2.Event.Activated] = v16.onActivateTooltip, 
                    ZIndex = 1, 
                    Selectable = v16.selectable
                }, {
                    UISizeConstraint = v2.createElement("UISizeConstraint", {
                        MinSize = v15
                    })
                })
            });
        end);
    end;
end;