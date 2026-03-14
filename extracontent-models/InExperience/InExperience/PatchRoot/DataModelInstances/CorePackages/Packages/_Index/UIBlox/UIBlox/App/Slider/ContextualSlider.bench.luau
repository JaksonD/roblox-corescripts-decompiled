local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local v4 = require(l_Parent_0.ContextualSlider);
local v5 = require(l_Parent_0.SystemSlider);
local l_describe_0 = require(l_Parent_2.Dev.JestGlobals).describe;
local v7 = require(l_Parent_1.Utility.benchmarks);
local l_mountComponentTimes_0 = v7.mountComponentTimes;
local l_scrollComponentTimes_0 = v7.scrollComponentTimes;
local v10 = v3.createElement(v4, {
    min = 0, 
    max = 100, 
    value = 0, 
    onValueChanged = function() --[[ Line: 21 ]] --[[ Name: onValueChanged ]]

    end
});
local v11 = v3.createElement(v5, {
    min = 0, 
    max = 100, 
    value = 0, 
    onValueChanged = function() --[[ Line: 27 ]] --[[ Name: onValueChanged ]]

    end
});
l_describe_0("ContextualSlider", function() --[[ Line: 30 ]]
    -- upvalues: l_mountComponentTimes_0 (copy), v10 (copy), l_scrollComponentTimes_0 (copy)
    l_mountComponentTimes_0(v10, 100, "ContextualSlider");
    l_scrollComponentTimes_0(v10, 100, "ContextualSlider");
end);
l_describe_0("SystemSlider", function() --[[ Line: 34 ]]
    -- upvalues: l_mountComponentTimes_0 (copy), v11 (copy), l_scrollComponentTimes_0 (copy)
    l_mountComponentTimes_0(v11, 100, "SystemSlider");
    l_scrollComponentTimes_0(v11, 100, "SystemSlider");
end);