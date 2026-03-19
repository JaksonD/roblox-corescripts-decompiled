local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.GetFStringUGCValidateMaxAnimationMovement);
local function v2() --[[ Line: 25 ]] --[[ Name: getFallbackValue ]]
    -- upvalues: v1 (copy)
    return v1.asString();
end;
game:DefineFastString("UGCValidateMaxAnimationMovementHead", "");
game:DefineFastString("UGCValidateMaxAnimationMovementUpperTorso", "");
game:DefineFastString("UGCValidateMaxAnimationMovementLeftUpperLeg", "");
game:DefineFastString("UGCValidateMaxAnimationMovementLeftLowerLeg", "");
game:DefineFastString("UGCValidateMaxAnimationMovementLeftHand", "");
game:DefineFastString("UGCValidateMaxAnimationMovementRightUpperArm", "");
game:DefineFastString("UGCValidateMaxAnimationMovementRightLowerArm", "");
game:DefineFastString("UGCValidateMaxAnimationMovementRightHand", "");
game:DefineFastString("UGCValidateMaxAnimationMovementLeftUpperArm", "");
game:DefineFastString("UGCValidateMaxAnimationMovementLeftLowerArm", "");
game:DefineFastString("UGCValidateMaxAnimationMovementLeftFoot", "");
game:DefineFastString("UGCValidateMaxAnimationMovementRightUpperLeg", "");
game:DefineFastString("UGCValidateMaxAnimationMovementRightLowerLeg", "");
game:DefineFastString("UGCValidateMaxAnimationMovementRightFoot", "");
local v3 = {};
local v4 = {
    Head = function() --[[ Line: 47 ]] --[[ Name: Head ]]
        return game:GetFastString("UGCValidateMaxAnimationMovementHead");
    end, 
    UpperTorso = function() --[[ Line: 50 ]] --[[ Name: UpperTorso ]]
        return game:GetFastString("UGCValidateMaxAnimationMovementUpperTorso");
    end, 
    LeftUpperLeg = function() --[[ Line: 53 ]] --[[ Name: LeftUpperLeg ]]
        return game:GetFastString("UGCValidateMaxAnimationMovementLeftUpperLeg");
    end, 
    LeftLowerLeg = function() --[[ Line: 56 ]] --[[ Name: LeftLowerLeg ]]
        return game:GetFastString("UGCValidateMaxAnimationMovementLeftLowerLeg");
    end, 
    LeftHand = function() --[[ Line: 59 ]] --[[ Name: LeftHand ]]
        return game:GetFastString("UGCValidateMaxAnimationMovementLeftHand");
    end, 
    RightUpperArm = function() --[[ Line: 62 ]] --[[ Name: RightUpperArm ]]
        return game:GetFastString("UGCValidateMaxAnimationMovementRightUpperArm");
    end, 
    RightLowerArm = function() --[[ Line: 65 ]] --[[ Name: RightLowerArm ]]
        return game:GetFastString("UGCValidateMaxAnimationMovementRightLowerArm");
    end, 
    RightHand = function() --[[ Line: 68 ]] --[[ Name: RightHand ]]
        return game:GetFastString("UGCValidateMaxAnimationMovementRightHand");
    end, 
    LeftUpperArm = function() --[[ Line: 71 ]] --[[ Name: LeftUpperArm ]]
        return game:GetFastString("UGCValidateMaxAnimationMovementLeftUpperArm");
    end, 
    LeftLowerArm = function() --[[ Line: 74 ]] --[[ Name: LeftLowerArm ]]
        return game:GetFastString("UGCValidateMaxAnimationMovementLeftLowerArm");
    end, 
    LeftFoot = function() --[[ Line: 77 ]] --[[ Name: LeftFoot ]]
        return game:GetFastString("UGCValidateMaxAnimationMovementLeftFoot");
    end, 
    RightUpperLeg = function() --[[ Line: 80 ]] --[[ Name: RightUpperLeg ]]
        return game:GetFastString("UGCValidateMaxAnimationMovementRightUpperLeg");
    end, 
    RightLowerLeg = function() --[[ Line: 83 ]] --[[ Name: RightLowerLeg ]]
        return game:GetFastString("UGCValidateMaxAnimationMovementRightLowerLeg");
    end, 
    RightFoot = function() --[[ Line: 86 ]] --[[ Name: RightFoot ]]
        return game:GetFastString("UGCValidateMaxAnimationMovementRightFoot");
    end
};
v3.asString = function(v5) --[[ Line: 91 ]] --[[ Name: asString ]]
    -- upvalues: v4 (copy), v2 (copy)
    local v6 = v4[v5];
    if not v6 then
        return v2();
    else
        local v7 = v6();
        if #v7 == 0 then
            return v2();
        else
            return v7;
        end;
    end;
end;
v3.asNumber = function(v8) --[[ Line: 103 ]] --[[ Name: asNumber ]]
    -- upvalues: v3 (copy)
    return (tonumber(v3.asString(v8)));
end;
return v3;