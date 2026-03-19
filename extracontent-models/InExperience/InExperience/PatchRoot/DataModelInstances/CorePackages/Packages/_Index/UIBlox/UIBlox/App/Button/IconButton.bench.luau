local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local v4 = require(l_Parent_0.IconButton);
local l_describe_0 = require(l_Parent_2.Dev.JestGlobals).describe;
local v6 = require(l_Parent_1.Utility.benchmarks);
local l_mountComponentTimes_0 = v6.mountComponentTimes;
local l_scrollComponentTimes_0 = v6.scrollComponentTimes;
local v9 = v3.createElement(v4, {
    onActivated = function() --[[ Line: 17 ]] --[[ Name: onActivated ]]

    end, 
    icon = "rbxassetid://7173696656978"
});
l_describe_0("IconButton", function() --[[ Line: 21 ]]
    -- upvalues: l_mountComponentTimes_0 (copy), v9 (copy), l_scrollComponentTimes_0 (copy)
    l_mountComponentTimes_0(v9, 1000, "IconButton");
    l_scrollComponentTimes_0(v9, 1000, "IconButton");
end);