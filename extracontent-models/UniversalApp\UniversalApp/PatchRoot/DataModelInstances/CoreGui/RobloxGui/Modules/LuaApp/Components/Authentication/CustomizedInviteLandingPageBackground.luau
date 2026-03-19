local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_LandingPageConstants_0 = require(l_CorePackages_0.Workspace.Packages.LandingPage).Constants.LandingPageConstants;
local v3 = require(l_CorePackages_0.Packages.Otter);
local l_useScreenSize_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useScreenSize;
return function(v5) --[[ Line: 25 ]] --[[ Name: CustomizedInviteLandingPageBackground ]]
    -- upvalues: l_LandingPageConstants_0 (copy), l_useScreenSize_0 (copy), v1 (copy), v3 (copy)
    local l_BackgroundAnimation_0 = l_LandingPageConstants_0.CustomizedLandingPage.BackgroundAnimation;
    local v7 = l_useScreenSize_0();
    local v8, v9 = v1.useBinding(l_BackgroundAnimation_0.RIGHT_EDGE);
    local v10, _ = v1.useBinding(v3.createSingleMotor(l_BackgroundAnimation_0.RIGHT_EDGE));
    local v12, v13 = v1.useBinding(l_BackgroundAnimation_0.OPAQUE);
    local v14, _ = v1.useBinding(v3.createSingleMotor(l_BackgroundAnimation_0.OPAQUE));
    v10:getValue():onStep(function(v16) --[[ Line: 36 ]]
        -- upvalues: v9 (copy)
        v9(v16);
    end);
    v10:getValue():onComplete(function(v17) --[[ Line: 40 ]]
        -- upvalues: l_BackgroundAnimation_0 (copy), v14 (copy), v10 (copy)
        if v17 == l_BackgroundAnimation_0.LEFT_EDGE then
            v14:getValue():setGoal(l_BackgroundAnimation_0.OTTER_FADE_OUT);
            return;
        else
            v10:getValue():setGoal(l_BackgroundAnimation_0.OTTER_SCROLL_LEFT);
            return;
        end;
    end);
    v14:getValue():onStep(function(v18) --[[ Line: 48 ]]
        -- upvalues: v13 (copy)
        v13(v18);
    end);
    v14:getValue():onComplete(function(v19) --[[ Line: 53 ]]
        -- upvalues: l_BackgroundAnimation_0 (copy), v10 (copy), v14 (copy)
        if v19 == l_BackgroundAnimation_0.TRANSPARENT then
            v10:getValue():setGoal(l_BackgroundAnimation_0.OTTER_INSTANT_RIGHT);
            v14:getValue():setGoal(l_BackgroundAnimation_0.OTTER_INSTANT_IN);
        end;
    end);
    v1.useEffect(function() --[[ Line: 60 ]]
        -- upvalues: v10 (copy), l_BackgroundAnimation_0 (copy)
        v10:getValue():setGoal(l_BackgroundAnimation_0.OTTER_SCROLL_LEFT);
    end, {});
    local v20 = math.max(v7.X, v7.Y);
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        BackgroundImage = v1.createElement("ImageLabel", {
            Image = v5.backgroundImage, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = v8:map(function(v21) --[[ Line: 74 ]]
                return UDim2.new(v21, 0, 0.5, 0);
            end), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BorderSizePixel = 0, 
            ScaleType = Enum.ScaleType.Crop, 
            ImageTransparency = v12:map(function(v22) --[[ Line: 80 ]]
                return v22;
            end), 
            BackgroundTransparency = v12:map(function(v23) --[[ Line: 83 ]]
                return v23;
            end), 
            ZIndex = 2
        }, {
            UISizeConstraint = v1.createElement("UISizeConstraint", {
                MinSize = Vector2.new(v20, v20)
            }), 
            UIGradient = v1.createElement("UIGradient", l_LandingPageConstants_0.CustomizedLandingPage.BackgroundGradient)
        }), 
        FadeBackgroundImage = v1.createElement("ImageLabel", {
            Image = v5.backgroundImage, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BorderSizePixel = 0, 
            ScaleType = Enum.ScaleType.Crop, 
            ZIndex = 1
        }, {
            UISizeConstraint = v1.createElement("UISizeConstraint", {
                MinSize = Vector2.new(v20, v20)
            }), 
            UIGradient = v1.createElement("UIGradient", l_LandingPageConstants_0.CustomizedLandingPage.BackgroundGradient)
        })
    });
end;