local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.ReactUtils);
local v4 = require(l_Parent_0.Utility.mockStyleComponent);
local l_render_0 = require(l_Parent_1.Dev.ReactTestingLibrary).render;
local l_benchmark_0 = require(l_Parent_1.Dev.JestBenchmark).benchmark;
measureFPS = function(v7, v8) --[[ Line: 14 ]] --[[ Name: measureFPS ]]
    task.wait();
    task.wait();
    v7.start("fps");
    task.wait(v8 or 0.5);
    v7.stop();
end;
mountComponentTimes = function(v9, v10, v11) --[[ Line: 22 ]] --[[ Name: mountComponentTimes ]]
    -- upvalues: v4 (copy), l_benchmark_0 (copy), l_render_0 (copy)
    local v12 = {};
    for v13 = 1, v10 do
        v12[v13] = v9;
    end;
    local v14 = v4(v12);
    l_benchmark_0(("Mount %* %* times"):format(v11, v10), function() --[[ Line: 29 ]]
        -- upvalues: l_render_0 (ref), v14 (copy)
        l_render_0(v14):unmount();
    end);
end;
AutoScrollingFrame = function(v15) --[[ Line: 35 ]] --[[ Name: AutoScrollingFrame ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v16 = v3.useClock();
    return v2.createElement("ScrollingFrame", {
        Size = UDim2.fromOffset(100, 100), 
        CanvasSize = UDim2.fromOffset(100, 0), 
        CanvasPosition = v16:map(function(v17) --[[ Line: 41 ]]
            return Vector2.new(0, v17 * 10000);
        end), 
        AutomaticCanvasSize = Enum.AutomaticSize.Y
    }, v15.children);
end;
scrollComponentTimes = function(v18, v19, v20) --[[ Line: 48 ]] --[[ Name: scrollComponentTimes ]]
    -- upvalues: v2 (copy), v4 (copy), l_benchmark_0 (copy), l_render_0 (copy)
    local v21 = {};
    for v22 = 1, v19 do
        v21[v22] = v18;
    end;
    v21[v19 + 1] = v2.createElement("UIListLayout", {
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        FillDirection = Enum.FillDirection.Vertical
    });
    local v23 = v4(v2.createElement(AutoScrollingFrame, {}, v21));
    l_benchmark_0(("Scroll %* %* times"):format(v20, v19), function(v24) --[[ Line: 62 ]]
        -- upvalues: l_render_0 (ref), v23 (copy)
        local v25 = l_render_0(v23);
        measureFPS(v24);
        v25:unmount();
    end);
end;
return {
    mountComponentTimes = mountComponentTimes, 
    scrollComponentTimes = scrollComponentTimes, 
    measureFPS = measureFPS
};