local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Foundation);
local _ = require(l_Parent_0.Configs.ConfigTypes);
local v5 = require(l_Parent_1.Localization);
local v6 = require(script.Parent.KeyboardAction);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local v14 = v2.memo(function(v11) --[[ Line: 24 ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v12 = l_useTokens_0();
    local v13 = l_useLocalization_0({
        title = v11.title
    });
    return v2.createElement(l_View_0, {
        tag = "col align-y-center align-x-left size-full-0 auto-y padding-x-small padding-y-small", 
        LayoutOrder = v11.LayoutOrder
    }, {
        v2.createElement(l_Text_0, {
            tag = "text-title-medium text-align-x-left auto-xy text-wrap", 
            textStyle = v12.Color.Extended.White.White_100, 
            Text = v13.title, 
            key = "title-text"
        })
    });
end);
return v2.memo(function(v15) --[[ Line: 48 ]]
    -- upvalues: v2 (copy), v14 (copy), v6 (copy), l_View_0 (copy)
    local v19 = v2.useMemo(function() --[[ Line: 49 ]]
        -- upvalues: v2 (ref), v14 (ref), v15 (copy), v6 (ref)
        local v16 = {};
        table.insert(v16, v2.createElement(v14, {
            title = v15.group.label, 
            LayoutOrder = 0, 
            key = "groupTitle-" .. v15.group.id
        }));
        for _, v18 in v15.controls do
            if v18.keyboardInput ~= nil then
                table.insert(v16, (v2.createElement(v6, {
                    control = v18, 
                    LayoutOrder = v18.keyboardInput.layoutOrder, 
                    key = v18.label .. v18.keyboardInput.layoutOrder
                })));
            end;
        end;
        return v16;
    end, {
        v15.controls, 
        v15.group
    });
    return v2.createElement(l_View_0, {
        tag = "col align-y-top align-x-center size-full gap-xxsmall", 
        LayoutOrder = v15.group.layoutOrder, 
        testId = "KeyboardGroup"
    }, v19);
end);