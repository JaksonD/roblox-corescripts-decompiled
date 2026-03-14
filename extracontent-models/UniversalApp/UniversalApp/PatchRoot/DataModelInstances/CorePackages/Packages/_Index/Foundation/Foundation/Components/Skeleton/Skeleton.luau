local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useClock_0 = require(l_Parent_0.ReactUtils).useClock;
local l_Components_0 = l_script_FirstAncestor_0.Components;
local _ = require(l_Components_0.Types);
local v6 = require(l_Components_0.View);
local v7 = require(l_script_FirstAncestor_0.Enums.Radius);
local v8 = require(l_script_FirstAncestor_0.Providers.Preferences.usePreferences);
local v9 = require(l_script_FirstAncestor_0.Utility.usePulseBinding);
local v10 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v11 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v12 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v13 = require(l_script_FirstAncestor_0.Utility.lerp);
local v14 = {
    radius = v7.None, 
    Size = UDim2.fromScale(1, 1), 
    testId = "--foundation-skeleton"
};
return v2.memo(v2.forwardRef(function(v15, v16) --[[ Line: 39 ]] --[[ Name: Skeleton ]]
    -- upvalues: v12 (copy), v14 (copy), l_useClock_0 (copy), v9 (copy), v10 (copy), v8 (copy), v7 (copy), v2 (copy), v6 (copy), v11 (copy), v13 (copy)
    local v17 = v12(v15, v14);
    local v18 = l_useClock_0();
    local v19 = v9(2);
    local v20 = v10();
    local v21 = v8();
    local v22 = if v17.radius ~= v7.None then UDim.new(0, v20.Radius[v17.radius]) else nil;
    return v2.createElement(v6, v11(v17, {
        cornerRadius = v22, 
        backgroundStyle = if v21.reducedMotion then v19:map(function(v23) --[[ Line: 53 ]]
            -- upvalues: v20 (copy), v13 (ref)
            return {
                Color3 = v20.Color.Shift.Shift_300.Color3, 
                Transparency = v13(v20.Color.Extended.White.White_10.Transparency, v20.Color.Extended.White.White_10.Transparency - 0.1, v23)
            };
        end) else v20.Color.Extended.White.White_100, 
        Size = v17.Size, 
        ref = v16
    }), {
        Gradient = if not v21.reducedMotion then v2.createElement("UIGradient", {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, v20.Color.Shift.Shift_300.Color3), 
                ColorSequenceKeypoint.new(0.5, v20.Color.Extended.White.White_30.Color3), 
                ColorSequenceKeypoint.new(1, v20.Color.Shift.Shift_300.Color3)
            }), 
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, v20.Color.Shift.Shift_300.Transparency), 
                NumberSequenceKeypoint.new(0.5, v20.Color.Extended.White.White_30.Transparency), 
                NumberSequenceKeypoint.new(1, v20.Color.Shift.Shift_300.Transparency)
            }), 
            Offset = v18:map(function(v24) --[[ Line: 81 ]]
                return Vector2.new(v24 * 2 % 3 - 1.5, 0);
            end), 
            Rotation = 15
        }) else nil
    });
end));