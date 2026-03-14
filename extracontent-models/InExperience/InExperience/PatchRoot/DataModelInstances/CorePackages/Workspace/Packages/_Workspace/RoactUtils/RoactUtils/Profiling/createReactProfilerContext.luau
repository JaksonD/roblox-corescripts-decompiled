local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local _ = require(script.Parent.types);
return function() --[[ Line: 8 ]] --[[ Name: createReactProfilerContext ]]
    -- upvalues: l_Signal_0 (copy)
    return {
        onRender = l_Signal_0.new(), 
        onCommit = l_Signal_0.new()
    };
end;