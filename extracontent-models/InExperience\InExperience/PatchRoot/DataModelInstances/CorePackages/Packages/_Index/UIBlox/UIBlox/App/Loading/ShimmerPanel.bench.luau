local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local v4 = require(l_Parent_0.ShimmerPanel);
local v5 = require(l_Parent_1.Utility.benchmarks);
local l_mountComponentTimes_0 = v5.mountComponentTimes;
local l_scrollComponentTimes_0 = v5.scrollComponentTimes;
local l_describe_0 = require(l_Parent_2.Dev.JestGlobals).describe;
local v9 = v3.createElement(v4, {
    Size = UDim2.new(0, 100, 0, 100)
});
l_describe_0("ShimmerPanel", function() --[[ Line: 20 ]]
    -- upvalues: l_mountComponentTimes_0 (copy), v9 (copy), l_scrollComponentTimes_0 (copy)
    l_mountComponentTimes_0(v9, 100, "ShimmerPanel");
    l_scrollComponentTimes_0(v9, 100, "ShimmerPanel");
end);