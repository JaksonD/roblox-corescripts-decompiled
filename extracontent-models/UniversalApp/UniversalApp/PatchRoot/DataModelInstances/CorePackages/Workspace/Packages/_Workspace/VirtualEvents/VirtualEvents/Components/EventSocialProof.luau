local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.Foundation);
local l_Image_0 = v3.Image;
local l_useTokens_0 = v3.Hooks.useTokens;
local v6 = UDim.new(0, -8);
return function(v7) --[[ Line: 21 ]] --[[ Name: EventSocialProof ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), v1 (copy), v6 (copy), l_Image_0 (copy)
    local v8 = l_useTokens_0();
    local v9 = v2.useMemo(function() --[[ Line: 24 ]]
        -- upvalues: v7 (copy), v1 (ref)
        if v7.desiredFirstUserId and v1.List.find(v7.userIds, v7.desiredFirstUserId) then
            return v7.desiredFirstUserId;
        else
            return v7.userIds[1];
        end;
    end, {
        v7.userIds, 
        v7.desiredFirstUserId
    });
    local v10 = v2.useMemo(function() --[[ Line: 35 ]]
        -- upvalues: v7 (copy)
        return v7.userIds[2] or nil;
    end, {
        v7.userIds
    });
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = v6
        }), 
        FirstUser = if v9 then v2.createElement("Frame", {
            BackgroundColor3 = v8.Inverse.Surface.Surface_300.Color3, 
            Size = UDim2.fromOffset(25, 25), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            ZIndex = 3
        }, {
            Corner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            FirstUserFace = v2.createElement(l_Image_0, {
                ZIndex = 4, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                tag = "radius-circle", 
                Image = ("rbxthumb://type=AvatarHeadShot&id=%s&w=100&h=100"):format(v9), 
                backgroundStyle = {
                    Color3 = v8.Color.Shift.Shift_200.Color3, 
                    Transparency = 0
                }, 
                Size = UDim2.fromOffset(20, 20)
            })
        }) else nil, 
        SecondUser = if v10 then v2.createElement("Frame", {
            BackgroundColor3 = v8.Inverse.Surface.Surface_300.Color3, 
            Size = UDim2.fromOffset(25, 25), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            ZIndex = 1
        }, {
            Corner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            SecondUserFace = v2.createElement(l_Image_0, {
                ZIndex = 2, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                tag = "radius-circle", 
                Image = ("rbxthumb://type=AvatarHeadShot&id=%s&w=100&h=100"):format(v10), 
                backgroundStyle = {
                    Color3 = v8.Color.Shift.Shift_200.Color3, 
                    Transparency = 0
                }, 
                Size = UDim2.fromOffset(20, 20)
            })
        }) else nil
    });
end;