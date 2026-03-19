return {
    isActivationInput = function(v0) --[[ Line: 3 ]] --[[ Name: isActivationInput ]]
        local v1 = true;
        if v0.UserInputType ~= Enum.UserInputType.MouseButton1 then
            v1 = v0.UserInputType == Enum.UserInputType.Touch;
        end;
        return v1;
    end, 
    isPointerInput = function(v2) --[[ Line: 8 ]] --[[ Name: isPointerInput ]]
        local v3 = true;
        if v2.UserInputType ~= Enum.UserInputType.MouseMovement then
            v3 = v2.UserInputType == Enum.UserInputType.Touch;
        end;
        return v3;
    end, 
    isTouchInput = function(v4) --[[ Line: 13 ]] --[[ Name: isTouchInput ]]
        return v4.UserInputType == Enum.UserInputType.Touch;
    end
};