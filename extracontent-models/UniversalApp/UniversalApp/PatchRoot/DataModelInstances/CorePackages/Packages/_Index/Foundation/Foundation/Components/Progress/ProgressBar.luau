local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactIs);
local v4 = require(script.Parent.constants);
local v5 = require(l_script_FirstAncestor_0.Utility.Flags);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v7 = require(l_script_FirstAncestor_0.Components.View);
local v8 = require(l_script_FirstAncestor_0.Providers.Preferences.usePreferences);
local v9 = require(script.Parent.useProgressBinding);
local v10 = require(script.Parent.useProgressVariants);
local v11 = require(l_script_FirstAncestor_0.Utility.usePulseBinding);
local v12 = require(l_script_FirstAncestor_0.Utility.useRotation);
local v13 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v14 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v15 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local _ = require(l_script_FirstAncestor_0.Enums.ProgressShape);
local v17 = require(l_script_FirstAncestor_0.Enums.ProgressSize);
local function v21(v18) --[[ Line: 28 ]] --[[ Name: getBarSequenceFromProgress ]]
    local v19 = v18 or 0;
    if v19 == 0 then
        return NumberSequence.new(1);
    elseif v19 == 1 then
        return NumberSequence.new(0);
    else
        local v20 = {
            NumberSequenceKeypoint.new(0, 0), 
            NumberSequenceKeypoint.new(v19, 0), 
            NumberSequenceKeypoint.new(math.min(v19 + 0.001, 1), 1)
        };
        if v19 < 0.999 then
            table.insert(v20, NumberSequenceKeypoint.new(1, 1));
        end;
        return NumberSequence.new(v20);
    end;
end;
local v22 = {
    size = v17.Medium, 
    width = UDim.new(1, 0)
};
return function(v23) --[[ Line: 64 ]] --[[ Name: ProgressBar ]]
    -- upvalues: v15 (copy), v22 (copy), v13 (copy), v8 (copy), v10 (copy), v9 (copy), v12 (copy), v11 (copy), v4 (copy), v3 (copy), v5 (copy), v21 (copy), v2 (copy), v7 (copy), v14 (copy)
    local v24 = v15(v23, v22);
    local v25 = v13();
    local v26 = v8();
    local v27 = v10(v25, v24.size);
    local v28, v29 = v9(v24.value);
    local v30 = v12(1);
    local v31 = v11(1 / v4.INDETERMINATE_SHIMMER_SPEED);
    local v32 = if not v3.isBinding(v28) and v5.FoundationProgressBindableValue then v21(v28) else v28:map(v21);
    return v2.createElement(v7, v14(v24, {
        Size = UDim2.new(v24.width, UDim.new(0, v27.bar.height)), 
        tag = "radius-small bg-shift-400", 
        ref = v24.ref
    }), {
        Fill = v2.createElement(v7, {
            backgroundStyle = v25.Color.Content.Emphasis, 
            tag = "size-full radius-small", 
            ref = v24.ref, 
            testId = ("%*--fill"):format(v24.testId)
        }, {
            Gradient = v2.createElement("UIGradient", {
                Color = ColorSequence.new(v25.Color.Content.Emphasis.Color3), 
                Transparency = if v29 then v31:map(function(v33) --[[ Line: 96 ]]
                    -- upvalues: v26 (copy), v25 (copy)
                    if v26.reducedMotion then
                        return NumberSequence.new(v33);
                    else
                        return NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 1), 
                            NumberSequenceKeypoint.new(0.2, 1), 
                            NumberSequenceKeypoint.new(0.5, v25.Color.Content.Emphasis.Transparency), 
                            NumberSequenceKeypoint.new(0.8, 1), 
                            NumberSequenceKeypoint.new(1, 1)
                        });
                    end;
                end) else v32, 
                Offset = if v29 then v30:map(function(v34) --[[ Line: 111 ]]
                    -- upvalues: v26 (copy), v4 (ref)
                    if v26.reducedMotion then
                        return Vector2.new(0, 0);
                    else
                        return Vector2.new(v34 * v4.INDETERMINATE_SHIMMER_SPEED % 360 / 360 * 2 - 1, 0);
                    end;
                end) else nil
            })
        })
    });
end;