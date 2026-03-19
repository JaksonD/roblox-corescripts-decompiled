local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.ReactOtter);
local v4 = require(l_script_FirstAncestor_0.Parent.Foundation);
local l_useCallback_0 = v2.useCallback;
local l_useEffect_0 = v2.useEffect;
local l_useTokens_0 = v4.Hooks.useTokens;
local v8 = {
    heightRange = NumberRange.new(0.3, 1), 
    width = UDim.new(1, 0), 
    isMoving = true, 
    staticHeight = 0.5
};
local v9 = Random.new();
return function(v10) --[[ Line: 34 ]] --[[ Name: AnimatedBar ]]
    -- upvalues: v1 (copy), v8 (copy), l_useTokens_0 (copy), l_useCallback_0 (copy), v9 (copy), v3 (copy), l_useEffect_0 (copy), v2 (copy)
    local v11 = v1.Dictionary.join(v8, v10);
    local v12 = l_useTokens_0();
    local v13 = l_useCallback_0(function() --[[ Line: 38 ]]
        -- upvalues: v9 (ref), v11 (copy)
        return v9:NextNumber(v11.heightRange.Min, v11.heightRange.Max);
    end, {
        v11.heightRange
    });
    local v14, v15 = v3.useAnimatedBinding(v13());
    l_useEffect_0(function() --[[ Line: 44 ]]
        -- upvalues: v11 (copy), v13 (copy), v15 (copy), v3 (ref)
        local v16 = true;
        task.spawn(function() --[[ Line: 47 ]]
            -- upvalues: v16 (ref), v11 (ref), v13 (ref), v15 (ref), v3 (ref)
            while v16 do
                local v17 = if v11.isMoving then v13() else v11.staticHeight;
                v15(v3.ease(v17, {
                    easingStyle = Enum.EasingStyle.Linear, 
                    duration = 0.25
                }));
                task.wait(0.25);
            end;
        end);
        return function() --[[ Line: 60 ]]
            -- upvalues: v16 (ref)
            v16 = false;
        end;
    end, {
        v15, 
        v11.isMoving, 
        v11.staticHeight
    });
    return v2.createElement("Frame", {
        LayoutOrder = v11.layoutOrder, 
        Size = v14:map(function(v18) --[[ Line: 67 ]]
            -- upvalues: v11 (copy)
            return UDim2.new(v11.width, UDim.new(v18, 0));
        end), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v12.Color.ActionSubEmphasis.Background.Color3
    }, {
        Corner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        })
    });
end;