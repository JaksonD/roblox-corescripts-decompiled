local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.Lock);
local v4 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBase);
local v5 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBodyText);
local v6 = require(l_Modules_0.LuaApp.withLocalization);
local v7 = {
    description = "Feature.AccountSecurityPrompt.Description.ChangeYourPasswordSuccess", 
    header = "Feature.AccountSecurityPrompt.Header.Success"
};
local v8 = v2.PureComponent:extend("ChangePassword" .. script.Name);
v8.render = function(_) --[[ Line: 19 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v7 (copy), v2 (copy), v4 (copy), v3 (copy), v5 (copy)
    return v6(v7)(function(v10) --[[ Line: 20 ]]
        -- upvalues: v2 (ref), v4 (ref), v3 (ref), v5 (ref)
        return v2.createElement(v4, {
            title = v10.header, 
            makeBodyFragment = function(v11) --[[ Line: 23 ]] --[[ Name: makeBodyFragment ]]
                -- upvalues: v2 (ref), v3 (ref), v5 (ref), v10 (copy)
                return v2.createFragment({
                    Lock = v2.createElement(v3, {
                        layoutOrder = 1
                    }), 
                    ModalBodyText = v2.createElement(v5, {
                        layoutOrder = 2, 
                        contentWidth = v11, 
                        text = v10.description
                    })
                });
            end
        });
    end);
end;
return v8;