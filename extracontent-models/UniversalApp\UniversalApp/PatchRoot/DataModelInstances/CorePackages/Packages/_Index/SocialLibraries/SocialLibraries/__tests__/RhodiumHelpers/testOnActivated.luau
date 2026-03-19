local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Packages");
local v2 = require(l_script_FirstAncestor_0.Dev.Rhodium);
local v3 = require(l_script_FirstAncestor_0.Roact);
local l_Element_0 = v2.Element;
local l_XPath_0 = v2.XPath;
local v6 = require(script.Parent.Parent.UnitTestHelpers.mockStyle);
return function(v7) --[[ Line: 11 ]]
    -- upvalues: v3 (copy), v6 (copy), l_CoreGui_0 (copy), l_XPath_0 (copy), l_Element_0 (copy)
    local v8 = false;
    local v9 = v3.createElement("ScreenGui", {}, {
        buttonElement = v3.createElement(v7, {
            onActivated = function() --[[ Line: 16 ]] --[[ Name: onActivated ]]
                -- upvalues: v8 (ref)
                v8 = true;
            end
        })
    });
    local v10 = v6(v9);
    local v11 = v3.mount(v10, l_CoreGui_0, "TestRoot");
    local v12 = l_XPath_0.new("game.CoreGui.Children.buttonElement");
    local v13 = l_Element_0.new(v12);
    assert(v13:getRbxInstance() ~= nil, "button was nil");
    v13:click();
    wait(0);
    assert(v8 == true, "button was not activated");
    v3.unmount(v11);
end;