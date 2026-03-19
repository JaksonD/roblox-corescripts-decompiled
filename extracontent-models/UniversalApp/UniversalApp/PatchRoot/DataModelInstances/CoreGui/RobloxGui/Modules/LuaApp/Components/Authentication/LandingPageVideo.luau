local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local v3 = require(l_CorePackages_0.Packages.React);
local l_useState_0 = v3.useState;
return function(v5) --[[ Line: 34 ]] --[[ Name: LandingPageVideo ]]
    -- upvalues: l_useStyle_0 (copy), v3 (copy), l_useState_0 (copy), l_RunService_0 (copy)
    local v6 = l_useStyle_0();
    local v7 = v3.useRef(false);
    local v8, v9 = l_useState_0(1);
    local function v10() --[[ Line: 39 ]]
        -- upvalues: v5 (copy), v8 (copy)
        if v5.screenSize.X / (v5.screenSize.Y - v5.videoBottomOffsetHeight) < v8 then
            return UDim2.new(0, 1e999, 1, 0);
        else
            return UDim2.new(1, 0, 0, 1e999);
        end;
    end;
    v3.useEffect(function() --[[ Line: 54 ]]
        -- upvalues: l_RunService_0 (ref)
        l_RunService_0:setThrottleFramerateEnabled(false);
        return function() --[[ Line: 56 ]]
            -- upvalues: l_RunService_0 (ref)
            l_RunService_0:setThrottleFramerateEnabled(true);
        end;
    end, {});
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0
    }, {
        VideoBox = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, v5.videoBottomOffsetHeight * -1), 
            ClipsDescendants = true
        }, {
            Video = v3.createElement("VideoFrame", {
                Video = v5.landingVideoAsset, 
                Size = v10(), 
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Looped = true, 
                Playing = true, 
                Volume = 0, 
                BorderSizePixel = 0, 
                [v3.Event.Loaded] = function(v11) --[[ Line: 61 ]]
                    -- upvalues: v9 (copy)
                    local l_Resolution_0 = v11.Resolution;
                    if l_Resolution_0.X > 0 and l_Resolution_0.Y > 0 then
                        v9(l_Resolution_0.X / l_Resolution_0.Y);
                    end;
                end, 
                ref = v7
            }, {
                UIAspectRatioConstraint = v3.createElement("UIAspectRatioConstraint", {
                    AspectRatio = v8, 
                    AspectType = Enum.AspectType.FitWithinMaxSize
                })
            })
        }), 
        FadeToBlack = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v5.videoBottomOffsetGradientHeight), 
            Position = UDim2.new(0, 0, 1, v5.videoBottomOffsetHeight * -1 + 1), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor3 = v6.Theme.DropShadow.Color, 
            BorderSizePixel = 0, 
            ZIndex = 2
        }, {
            UIGradient = v3.createElement("UIGradient", {
                Rotation = 270, 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, v6.Theme.DropShadow.Color), 
                    ColorSequenceKeypoint.new(1, v6.Theme.DropShadow.Color)
                }), 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0), 
                    NumberSequenceKeypoint.new(1, 1)
                })
            })
        }), 
        BlackBackground = v3.createElement("Frame", {
            Visible = true, 
            Size = UDim2.new(1, 0, 0, v5.videoBottomOffsetHeight), 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor3 = v6.Theme.BackgroundUIContrast.Color, 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0
        })
    });
end;