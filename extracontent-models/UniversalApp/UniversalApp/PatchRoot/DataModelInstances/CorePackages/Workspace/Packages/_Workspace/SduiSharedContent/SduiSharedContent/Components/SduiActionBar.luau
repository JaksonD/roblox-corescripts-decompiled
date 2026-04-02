local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.SduiCoreSystem);
local l_View_0 = v2.View;
local l_getSduiComponentWrapper_0 = v3.getSduiComponentWrapper;
return v1.memo(function(v6) --[[ Line: 42 ]] --[[ Name: SduiActionBar ]]
    -- upvalues: l_getSduiComponentWrapper_0 (copy), v1 (copy), l_View_0 (copy)
    if v6.items == nil or #v6.items == 0 then
        return nil;
    else
        local v7 = {};
        for v8, v9 in v6.items do
            local v10 = l_getSduiComponentWrapper_0(v9);
            v7["item_" .. tostring(v8)] = v1.createElement(v10, {
                componentConfig = v9, 
                sduiContext = v6.sduiContext, 
                extraLocalProps = {
                    layoutOrder = v8
                }
            });
        end;
        if v6.footer == nil then
            return v1.createElement(l_View_0, {
                tag = v6.rowTag or "row size-full-0 auto-y gap-small", 
                size = v6.size, 
                anchorPoint = v6.anchorPoint, 
                position = v6.position, 
                layoutOrder = v6.layoutOrder, 
                testId = v6.testId
            }, v7);
        else
            local v11 = v1.createElement(l_View_0, {
                tag = v6.rowTag or "row size-full-0 auto-y gap-small", 
                layoutOrder = 1
            }, v7);
            return v1.createElement(l_View_0, {
                tag = v6.wrapperTag or "col size-full-0 auto-y gap-small", 
                size = v6.size, 
                anchorPoint = v6.anchorPoint, 
                position = v6.position, 
                layoutOrder = v6.layoutOrder, 
                testId = v6.testId
            }, {
                ItemsRow = v11, 
                Footer = v1.createElement(l_View_0, {
                    tag = "size-full-0 auto-y", 
                    layoutOrder = 2
                }, v6.footer)
            });
        end;
    end;
end);