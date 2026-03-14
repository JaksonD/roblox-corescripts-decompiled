local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Utility.isPluginSecurity);
local v4 = require(l_Parent_0.Motion);
local l_useMotion_0 = v4.useMotion;
local l_usePresence_0 = v4.usePresence;
local v7 = require(script.Parent.useSpinnerMotionStates);
local v8 = require(l_script_FirstAncestor_0.Utility.Flags);
local v9 = require(l_script_FirstAncestor_0.Components.Image);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v11 = require(l_script_FirstAncestor_0.Components.View);
local v12 = require(l_script_FirstAncestor_0.Utility.useRotation);
local v13 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local function v16(v14) --[[ Line: 26 ]] --[[ Name: IconSpinner ]]
    -- upvalues: v12 (copy), v2 (copy), v9 (copy)
    local v15 = v12(2);
    return v2.createElement(v9, {
        Image = "icons/status/loading_large", 
        imageStyle = v14.style, 
        Rotation = v15, 
        tag = "anchor-center-center position-center-center size-full-full", 
        testId = v14.testId
    }, {
        UIScale = v2.createElement("UIScale", {
            Scale = v14.scale
        })
    });
end;
local v17 = {
    Path2DControlPoint.new(UDim2.fromScale(1, 0.5), UDim2.fromScale(0, 0.25), UDim2.fromScale(0, -0.25)), 
    Path2DControlPoint.new(UDim2.fromScale(0.5, 0), UDim2.fromScale(0.25, 0), UDim2.fromScale(-0.25, 0)), 
    Path2DControlPoint.new(UDim2.fromScale(0, 0.5), UDim2.fromScale(0, -0.33), UDim2.fromScale(0, 0.33)), 
    Path2DControlPoint.new(UDim2.fromScale(0.5, 1), UDim2.fromScale(-0.25, 0), UDim2.fromScale(0.25, 0))
};
local function v24(v18) --[[ Line: 50 ]] --[[ Name: Path2DSpinner ]]
    -- upvalues: v2 (copy), v12 (copy), v17 (copy), v11 (copy), v3 (copy)
    local v19 = v2.useRef(nil);
    local v20 = v12(2);
    v2.useEffect(function() --[[ Line: 54 ]]
        -- upvalues: v19 (copy), v17 (ref)
        local l_current_0 = v19.current;
        if l_current_0 ~= nil then
            l_current_0:SetControlPoints(v17);
        end;
    end, {});
    return v2.createElement(v11, {
        tag = "anchor-center-center position-center-center size-full", 
        Rotation = v20, 
        testId = v18.testId
    }, {
        Circle = v2.createElement("Path2D", {
            ref = v19, 
            Closed = false, 
            Color3 = v18.style:map(function(v22) --[[ Line: 69 ]]
                return v22.Color3;
            end), 
            Transparency = if v3() then v18.style:map(function(v23) --[[ Line: 73 ]]
                return v23.Transparency;
            end) else nil, 
            Thickness = v18.Thickness
        }), 
        UIScale = v2.createElement("UIScale", {
            Scale = v18.scale
        })
    });
end;
local v25 = {
    style = {}
};
return v2.memo(v2.forwardRef(function(v26, v27) --[[ Line: 95 ]] --[[ Name: Spinner ]]
    -- upvalues: v13 (copy), v25 (copy), v7 (copy), l_useMotion_0 (copy), l_usePresence_0 (copy), v2 (copy), v11 (copy), v8 (copy), v24 (copy), v16 (copy)
    local v28 = v13(v26, v25);
    local v29 = v7();
    local v30, v31 = l_useMotion_0(v29.Default);
    local v32 = l_usePresence_0();
    v2.useEffect(function() --[[ Line: 102 ]]
        -- upvalues: v32 (copy), v31 (copy), v29 (copy)
        if v32.isPresent then
            v31(v29.Loading);
            return;
        else
            v31(v29.Default, {
                onAnimationComplete = v32.onExitComplete
            });
            return;
        end;
    end, {
        v32.isPresent
    });
    return v2.createElement(v11, {
        tag = "position-center-center anchor-center-center", 
        Size = v28.Size, 
        ref = v27
    }, {
        Spinner = v2.createElement(if v8.FoundationUsePath2DSpinner then v24 else v16, {
            scale = v30.scale, 
            style = v2.joinBindings({
                style = v28.style, 
                transparency = v30.transparency
            }):map(function(v33) --[[ Line: 122 ]]
                return {
                    Color3 = v33.style.Color3, 
                    Transparency = v33.style.Transparency + v33.transparency / 2
                };
            end), 
            Thickness = math.max(math.floor(v28.Size.X.Offset / 8), 1), 
            testId = v28.testId
        })
    });
end));