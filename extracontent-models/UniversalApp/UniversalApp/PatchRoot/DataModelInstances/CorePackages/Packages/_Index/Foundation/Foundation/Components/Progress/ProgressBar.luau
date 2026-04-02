local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactIs);
local v4 = require(script.Parent.constants);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_script_FirstAncestor_0.Components.View);
local v7 = require(l_script_FirstAncestor_0.Providers.Preferences.usePreferences);
local v8 = require(script.Parent.useProgressBinding);
local v9 = require(script.Parent.useProgressVariants);
local v10 = require(l_script_FirstAncestor_0.Utility.usePulseBinding);
local v11 = require(l_script_FirstAncestor_0.Utility.useRotation);
local v12 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v13 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v14 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local _ = require(l_script_FirstAncestor_0.Enums.ProgressShape);
local v16 = require(l_script_FirstAncestor_0.Enums.ProgressSize);
local function v20(v17) --[[ Line: 27 ]] --[[ Name: getBarSequenceFromProgress ]]
    local v18 = v17 or 0;
    if v18 == 0 then
        return NumberSequence.new(1);
    elseif v18 == 1 then
        return NumberSequence.new(0);
    else
        local v19 = {
            NumberSequenceKeypoint.new(0, 0), 
            NumberSequenceKeypoint.new(v18, 0), 
            NumberSequenceKeypoint.new(math.min(v18 + 0.001, 1), 1)
        };
        if v18 < 0.999 then
            table.insert(v19, NumberSequenceKeypoint.new(1, 1));
        end;
        return NumberSequence.new(v19);
    end;
end;
local v21 = {
    size = v16.Medium, 
    width = UDim.new(1, 0)
};
return function(v22) --[[ Line: 63 ]] --[[ Name: ProgressBar ]]
    -- upvalues: v14 (copy), v21 (copy), v12 (copy), v7 (copy), v9 (copy), v8 (copy), v11 (copy), v10 (copy), v4 (copy), v3 (copy), v20 (copy), v2 (copy), v6 (copy), v13 (copy)
    local v23 = v14(v22, v21);
    local v24 = v12();
    local v25 = v7();
    local v26 = v9(v24, v23.size);
    local v27, v28 = v8(v23.value);
    local v29 = v11(1);
    local v30 = v10(1 / v4.INDETERMINATE_SHIMMER_SPEED);
    local v31 = if v3.isBinding(v27) then v27:map(v20) else v20(v27);
    return v2.createElement(v6, v13(v23, {
        Size = UDim2.new(v23.width, UDim.new(0, v26.bar.height)), 
        tag = "radius-small bg-shift-400", 
        ref = v23.ref
    }), {
        Fill = v2.createElement(v6, {
            backgroundStyle = v24.Color.Content.Emphasis, 
            tag = "size-full radius-small", 
            ref = v23.ref, 
            testId = ("%*--fill"):format(v23.testId)
        }, {
            Gradient = v2.createElement("UIGradient", {
                Color = ColorSequence.new(v24.Color.Content.Emphasis.Color3), 
                Transparency = if v28 then v30:map(function(v32) --[[ Line: 94 ]]
                    -- upvalues: v25 (copy), v24 (copy)
                    if v25.reducedMotion then
                        return NumberSequence.new(v32);
                    else
                        return NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 1), 
                            NumberSequenceKeypoint.new(0.2, 1), 
                            NumberSequenceKeypoint.new(0.5, v24.Color.Content.Emphasis.Transparency), 
                            NumberSequenceKeypoint.new(0.8, 1), 
                            NumberSequenceKeypoint.new(1, 1)
                        });
                    end;
                end) else v31, 
                Offset = if v28 then v29:map(function(v33) --[[ Line: 109 ]]
                    -- upvalues: v25 (copy), v4 (ref)
                    if v25.reducedMotion then
                        return Vector2.new(0, 0);
                    else
                        return Vector2.new(v33 * v4.INDETERMINATE_SHIMMER_SPEED % 360 / 360 * 2 - 1, 0);
                    end;
                end) else nil
            })
        })
    });
end;