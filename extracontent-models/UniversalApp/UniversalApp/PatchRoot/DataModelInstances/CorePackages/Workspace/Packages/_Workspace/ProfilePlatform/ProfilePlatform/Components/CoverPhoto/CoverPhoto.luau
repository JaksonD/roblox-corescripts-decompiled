local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_View_0 = v3.View;
local l_LoadableImage_0 = require(l_Parent_0.UIBlox).App.Loading.LoadableImage;
local v7 = require(l_script_FirstAncestor_0.Common.Enums);
local v8 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCoverPhotoPeekViewFix);
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformFixWideModeUI);
local v10 = game:DefineFastFlag("ProfilePlatformFixCoverPhotoWidth", false);
local v11 = nil;
if v8 then
    v11 = function(v12, v13, v14) --[[ Line: 40 ]]
        return v12 + (v13 - v12) * v14;
    end;
end;
return function(v15) --[[ Line: 45 ]] --[[ Name: CoverPhoto ]]
    -- upvalues: v7 (copy), v10 (copy), l_useScreenSize_0 (copy), v2 (copy), v8 (copy), v11 (ref), l_View_0 (copy), l_LoadableImage_0 (copy), v9 (copy)
    local v16 = v15.profileFormFactorInfo.formFactor == v7.ProfileFormFactor.Wide;
    local v17 = v15.profileFormFactorInfo.formFactor == v7.ProfileFormFactor.PeekView;
    local l_isFullView_0 = v15.profileFormFactorInfo.isFullView;
    local v19 = if v10 then l_useScreenSize_0() else nil;
    local v20 = v2.useMemo(function() --[[ Line: 51 ]]
        -- upvalues: v17 (copy)
        if v17 then
            return 393;
        else
            return 456;
        end;
    end, {
        v17, 
        l_isFullView_0, 
        v15.peekViewOpenPercent
    });
    local v21 = v2.useMemo(function() --[[ Line: 59 ]]
        -- upvalues: v8 (ref), v17 (copy), l_isFullView_0 (copy), v11 (ref), v15 (copy), v20 (copy)
        if v8 and v17 and not l_isFullView_0 then
            return v11(295, 393, v15.peekViewOpenPercent);
        else
            return v20;
        end;
    end, {
        v17, 
        l_isFullView_0, 
        v15.peekViewOpenPercent, 
        v20
    });
    local v22 = v21 - 100;
    local v23 = v21 - v15.parallaxOffset;
    local v24 = v22 - v15.parallaxOffset;
    local v25 = if v10 then if l_isFullView_0 then UDim.new(0, v19.X) else UDim.new(1, 0) else nil;
    return v2.createElement(l_View_0, {
        LayoutOrder = v15.layoutOrder, 
        Size = if v10 then UDim2.new(v25, UDim.new(0, v22)) else UDim2.new(1, l_isFullView_0 and 850 or 0, 0, v22), 
        ZIndex = -1
    }, {
        ParallaxWrapper = v2.createElement(l_View_0, {
            Size = UDim2.new(1, 0, 0, v24), 
            Position = UDim2.new(0, 0, 0, v15.parallaxOffset)
        }, {
            CoverPhotoWrapper = v2.createElement(l_View_0, {
                Size = UDim2.new(1, 0, 0, v23), 
                ClipsDescendants = true
            }, {
                CoverPhoto = v2.createElement(l_LoadableImage_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = v15.coverPhotoThumbnail, 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    ScaleType = Enum.ScaleType.Crop, 
                    Size = UDim2.new(1, 0, 0, v20), 
                    useShimmerAnimationWhileLoading = true
                })
            }), 
            GradientWrapper = v2.createElement(l_View_0, {
                Size = UDim2.new(1, 0, 0, 100), 
                Position = UDim2.new(0, 0, 0, v24), 
                tag = (not not v16 or v9 and l_isFullView_0) and "bg-surface-0" or "bg-surface-100"
            }, {
                Gradient = v2.createElement("UIGradient", {
                    Rotation = 270, 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0), 
                        NumberSequenceKeypoint.new(0.25, 0), 
                        NumberSequenceKeypoint.new(0.5, 0.1), 
                        NumberSequenceKeypoint.new(0.75, 0.5), 
                        NumberSequenceKeypoint.new(1, 1)
                    })
                })
            })
        })
    });
end;