local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local _ = require(l_Parent_0.SduiCompat);
local v4 = require(script.Parent.SduiView);
local v5 = require(script.Parent.SduiIcon);
return v1.memo(function(v6) --[[ Line: 33 ]] --[[ Name: SduiCircleIcon ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), v4 (copy), v5 (copy)
    local v7 = l_useTokens_0();
    return v1.createElement(v4, {
        tag = "radius-circle align-x-center align-y-center aspect-1-1", 
        size = v6.size or UDim2.fromScale(1, 1), 
        backgroundStyle = v6.backgroundStyle or v7.Color.Surface.Surface_100, 
        layoutOrder = v6.layoutOrder, 
        testId = v6.testId
    }, {
        Icon = if v6.iconName then v1.createElement(v5, {
            name = v6.iconName, 
            size = v6.iconSize, 
            testId = if v6.testId then v6.testId .. "-icon" else nil
        }) else nil
    });
end);