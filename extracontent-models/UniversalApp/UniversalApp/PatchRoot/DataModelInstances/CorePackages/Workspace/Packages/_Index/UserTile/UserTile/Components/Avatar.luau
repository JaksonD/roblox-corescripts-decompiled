local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.UserLib);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useCumulativeBackground_0 = v3.Hooks.useCumulativeBackground;
local l_UserPresence_0 = v3.Enums.UserPresence;
local l_Image_0 = v3.Image;
local l_View_0 = v3.View;
local v10 = require(l_script_FirstAncestor_0.Components.AnimatedRing);
local v11 = require(l_script_FirstAncestor_0.Utils.getCubicBezierProgress);
local v12 = require(l_script_FirstAncestor_0.Hooks.useAnimation);
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v4.Utils.getStandardSizeAvatarHeadShotRbxthumb;
local v14 = require(l_script_FirstAncestor_0.Flags.FFlagUserTileShowShimmerWhenLoading);
local v15 = game:DefineFastFlag("UserTilePresenceIndicatorStrokeColor", false);
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagCleanupTCIndicatorRing);
return function(v17) --[[ Line: 36 ]] --[[ Name: Avatar ]]
    -- upvalues: v14 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_useTokens_0 (copy), v16 (copy), v2 (copy), l_useCumulativeBackground_0 (copy), v12 (copy), v11 (copy), l_View_0 (copy), l_Image_0 (copy), v10 (copy), l_UserPresence_0 (copy), v15 (copy)
    local v18 = if v14 and v17.avatarThumbnailUrl then v17.avatarThumbnailUrl else l_getStandardSizeAvatarHeadShotRbxthumb_0(v17.userId);
    local v19 = l_useTokens_0();
    local v20 = nil;
    local v21 = nil;
    if not v16 then
        local v22, v23 = v2.useState(0);
        v20 = v22;
        v21 = v23;
    end;
    local v24 = not v16 and v17.triggerAnimation and v17.isTrustedConnection;
    local v25 = nil;
    local v26 = nil;
    if not v16 then
        local v27, v28 = v2.useState(v24);
        v25 = v27;
        v26 = v28;
    end;
    local v29 = nil;
    local v30 = nil;
    if not v16 then
        local v31, v32 = v2.useState(v24 and 1.25 or 1);
        v29 = v31;
        v30 = v32;
    end;
    local v33 = nil;
    local v34 = nil;
    if not v16 then
        local v35, v36 = v2.useState(false);
        v33 = v35;
        v34 = v36;
    end;
    local v37 = if v17.hover then v19.Color.Shift.Shift_400 else v19.Color.Shift.Shift_300;
    local v38 = if v16 then nil else l_useCumulativeBackground_0(v17.altSurfaceBackground or v19.Color.Surface.Surface_0, v37);
    if not v16 then
        v12(v25, 800, function(v39) --[[ Line: 72 ]]
            -- upvalues: v21 (ref), v11 (ref)
            v21(v11(v39, 800));
        end, function() --[[ Line: 74 ]]
            -- upvalues: v26 (ref), v34 (ref)
            v26(false);
            v34(true);
        end);
        v12(v33, 300, function(v40) --[[ Line: 79 ]]
            -- upvalues: v30 (ref), v11 (ref)
            v30(math.map(v11(v40, 300), 0, 100, 1.25, 1));
        end, function() --[[ Line: 89 ]]
            -- upvalues: v34 (ref)
            v34(false);
        end);
    end;
    return v2.createElement(l_View_0, {
        tag = "aspect-1-1 position-center-center anchor-center-center size-full-full", 
        ZIndex = v17.ZIndex, 
        LayoutOrder = v17.layoutOrder
    }, {
        AvatarThumbnail = v2.createElement(l_View_0, {
            tag = "size-full position-center-center anchor-center-center"
        }, {
            UiScale = if v16 then nil else v2.createElement("UIScale", {
                Scale = v29
            }), 
            AvatarImage = v2.createElement(l_Image_0, {
                LayoutOrder = 1, 
                backgroundStyle = if v16 then v37 else if v25 then nil else v37, 
                tag = {
                    ["size-full aspect-1-1 radius-circle align-x-center align-y-center row position-center-center anchor-center-center"] = true, 
                    ["stroke-thicker stroke-system-emphasis"] = not v16 and v17.isTrustedConnection and not v25
                }, 
                Image = v18, 
                ZIndex = 3
            }), 
            Animation = if v16 then nil else if v25 and v17.isTrustedConnection then v2.createElement(l_View_0, {
                tag = "size-full aspect-1-1 radius-circle align-x-center align-y-center"
            }, {
                animationBgMask = v2.createElement(l_View_0, {
                    tag = "radius-circle size-full-full position-center-center anchor-center-center", 
                    backgroundStyle = v38, 
                    ZIndex = 2
                }), 
                animationRingView = v2.createElement(l_View_0, {
                    tag = "radius-circle position-center-center anchor-center-center", 
                    Size = UDim2.new(1, v19.Stroke.Thicker * 2, 1, v19.Stroke.Thicker * 2), 
                    ZIndex = 1
                }, {
                    animatedRing = v2.createElement(v10, {
                        percentFilled = v20
                    })
                })
            }) else nil
        }), 
        Icon = if not (not v16 and (v25 or v33) or v17.userPresenceType ~= l_UserPresence_0.Active) or v17.userPresenceType == l_UserPresence_0.InExperience then v2.createElement(l_Image_0, {
            tag = v15 and "bg-surface-100 radius-circle auto-xy position-absolute" or "bg-surface-0 radius-circle auto-xy position-absolute", 
            Image = "component_assets/circle_16", 
            Size = UDim2.new(0.125, 4, 0.125, 4), 
            Position = UDim2.new(0.8536, v19.Stroke.Thicker, 0.8536, v19.Stroke.Thicker), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            stroke = {
                Thickness = v19.Stroke.Thicker, 
                Color = if v15 then v19.Color.Surface.Surface_100.Color3 else v19.Color.Surface.Surface_0.Color3
            }, 
            imageStyle = v19.Color.System.Success
        }) else nil
    });
end;