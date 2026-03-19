local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.SettingsService);
local v3 = require(l_Parent_0.FieldRow);
local v4 = require(l_Parent_1.React);
local l_View_0 = require(l_Parent_1.Foundation).View;
return function(v6) --[[ Line: 17 ]] --[[ Name: _createPageView ]]
    -- upvalues: v4 (copy), v3 (copy), l_View_0 (copy)
    local function v10() --[[ Line: 18 ]] --[[ Name: getFields ]]
        -- upvalues: v6 (copy), v4 (ref), v3 (ref)
        local v7 = {};
        for _, v9 in v6.settings do
            v7[v9.id] = v4.createElement(v3, v9);
        end;
        return v7;
    end;
    return v4.createElement(l_View_0, {
        tag = "padding-x-medium align-x-center align-y-top padding-small col size-full auto-y gui-object-defaults", 
        Visible = v6.visible
    }, {
        (v10())
    });
end;