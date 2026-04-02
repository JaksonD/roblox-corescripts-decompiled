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
local l_FFlagAddBackplateSupportToUserTile_0 = require(l_Parent_0.SharedFlags).FFlagAddBackplateSupportToUserTile;
return function(v18) --[[ Line: 39 ]] --[[ Name: Avatar ]]
    -- upvalues: v14 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_useTokens_0 (copy), v16 (copy), v2 (copy), l_useCumulativeBackground_0 (copy), v12 (copy), v11 (copy), l_View_0 (copy), l_FFlagAddBackplateSupportToUserTile_0 (copy), l_Image_0 (copy), v10 (copy), l_UserPresence_0 (copy), v15 (copy)
    local v19 = if v14 and v18.avatarThumbnailUrl then v18.avatarThumbnailUrl else l_getStandardSizeAvatarHeadShotRbxthumb_0(v18.userId);
    local v20 = l_useTokens_0();
    local v21 = nil;
    local v22 = nil;
    if not v16 then
        local v23, v24 = v2.useState(0);
        v21 = v23;
        v22 = v24;
    end;
    local v25 = not v16 and v18.triggerAnimation and v18.isTrustedConnection;
    local v26 = nil;
    local v27 = nil;
    if not v16 then
        local v28, v29 = v2.useState(v25);
        v26 = v28;
        v27 = v29;
    end;
    local v30 = nil;
    local v31 = nil;
    if not v16 then
        local v32, v33 = v2.useState(v25 and 1.25 or 1);
        v30 = v32;
        v31 = v33;
    end;
    local v34 = nil;
    local v35 = nil;
    if not v16 then
        local v36, v37 = v2.useState(false);
        v34 = v36;
        v35 = v37;
    end;
    local v38 = if v18.hover then v20.Color.Shift.Shift_400 else v20.Color.Shift.Shift_300;
    local v39 = if v16 then nil else l_useCumulativeBackground_0(v18.altSurfaceBackground or v20.Color.Surface.Surface_0, v38);
    if not v16 then
        v12(v26, 800, function(v40) --[[ Line: 75 ]]
            -- upvalues: v22 (ref), v11 (ref)
            v22(v11(v40, 800));
        end, function() --[[ Line: 77 ]]
            -- upvalues: v27 (ref), v35 (ref)
            v27(false);
            v35(true);
        end);
        v12(v34, 300, function(v41) --[[ Line: 82 ]]
            -- upvalues: v31 (ref), v11 (ref)
            v31(math.map(v11(v41, 300), 0, 100, 1.25, 1));
        end, function() --[[ Line: 92 ]]
            -- upvalues: v35 (ref)
            v35(false);
        end);
    end;
    return v2.createElement(l_View_0, {
        tag = "aspect-1-1 position-center-center anchor-center-center size-full-full", 
        ZIndex = v18.ZIndex, 
        LayoutOrder = v18.layoutOrder
    }, {
        Backplate = if l_FFlagAddBackplateSupportToUserTile_0 and v18.backplateStyle then v2.createElement(l_View_0, {
            backgroundStyle = v18.backplateStyle, 
            tag = "position-center-center anchor-center-center radius-circle", 
            Size = UDim2.new(1, 14, 1, 14), 
            ZIndex = 0
        }) else nil, 
        AvatarThumbnail = v2.createElement(l_View_0, {
            tag = "size-full position-center-center anchor-center-center"
        }, {
            UiScale = if v16 then nil else v2.createElement("UIScale", {
                Scale = v30
            }), 
            AvatarImage = v2.createElement(l_Image_0, {
                LayoutOrder = 1, 
                backgroundStyle = if v16 then v38 else if v26 then nil else v38, 
                tag = {
                    ["size-full aspect-1-1 radius-circle align-x-center align-y-center row position-center-center anchor-center-center"] = true, 
                    ["stroke-thicker stroke-system-emphasis"] = not v16 and v18.isTrustedConnection and not v26
                }, 
                Image = v19, 
                ZIndex = 3
            }), 
            Animation = if v16 then nil else if v26 and v18.isTrustedConnection then v2.createElement(l_View_0, {
                tag = "size-full aspect-1-1 radius-circle align-x-center align-y-center"
            }, {
                animationBgMask = v2.createElement(l_View_0, {
                    tag = "radius-circle size-full-full position-center-center anchor-center-center", 
                    backgroundStyle = v39, 
                    ZIndex = 2
                }), 
                animationRingView = v2.createElement(l_View_0, {
                    tag = "radius-circle position-center-center anchor-center-center", 
                    Size = UDim2.new(1, v20.Stroke.Thicker * 2, 1, v20.Stroke.Thicker * 2), 
                    ZIndex = 1
                }, {
                    animatedRing = v2.createElement(v10, {
                        percentFilled = v21
                    })
                })
            }) else nil
        }), 
        Icon = if not (not v16 and (v26 or v34) or v18.userPresenceType ~= l_UserPresence_0.Active) or v18.userPresenceType == l_UserPresence_0.InExperience then v2.createElement(l_Image_0, {
            tag = v15 and "bg-surface-100 radius-circle auto-xy position-absolute" or "bg-surface-0 radius-circle auto-xy position-absolute", 
            Image = "component_assets/circle_16", 
            Size = UDim2.new(0.125, 4, 0.125, 4), 
            Position = UDim2.new(0.8536, v20.Stroke.Thicker, 0.8536, v20.Stroke.Thicker), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            stroke = {
                Thickness = v20.Stroke.Thicker, 
                Color = if v15 then v20.Color.Surface.Surface_100.Color3 else v20.Color.Surface.Surface_0.Color3
            }, 
            imageStyle = v20.Color.System.Success
        }) else nil
    });
end;