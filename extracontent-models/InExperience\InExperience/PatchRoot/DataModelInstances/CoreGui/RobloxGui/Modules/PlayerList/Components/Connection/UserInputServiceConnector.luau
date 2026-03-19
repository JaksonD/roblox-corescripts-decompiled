local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.Actions.ClosePlayerDropDown);
local v6 = require(l_Parent_0.Actions.SetIsUsingGamepad);
local v7 = require(script.Parent.EventConnection);
local v8 = v2.PureComponent:extend("UserInputServiceConnector");
local v9 = game:DefineFastFlag("PlayerListFilterInputServiceDispatches", false);
v8.render = function(v10) --[[ Line: 19 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v7 (copy), l_UserInputService_0 (copy), v9 (copy)
    return v2.createFragment({
        InputBeganConnection = v2.createElement(v7, {
            event = l_UserInputService_0.InputBegan, 
            callback = function(v11, v12) --[[ Line: 23 ]] --[[ Name: callback ]]
                -- upvalues: v9 (ref), v10 (copy)
                if v9 and not v10.props.playerDropdownVisible then
                    return;
                elseif v12 then
                    return;
                else
                    local l_UserInputType_0 = v11.UserInputType;
                    if l_UserInputType_0 == Enum.UserInputType.Touch or l_UserInputType_0 == Enum.UserInputType.MouseButton1 then
                        v10.props.closePlayerDropDown();
                    end;
                    return;
                end;
            end
        }), 
        LastInputTypeChangedConnection = v2.createElement(v7, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = function(v14) --[[ Line: 41 ]] --[[ Name: callback ]]
                -- upvalues: v9 (ref), v10 (copy)
                local v15 = v14.Name:find("Gamepad") ~= nil;
                if v9 and v15 == v10.props.isUsingGamepad then
                    return;
                else
                    v10.props.setIsUsingGamepad(v15);
                    return;
                end;
            end
        })
    });
end;
local function v17(v16) --[[ Line: 55 ]] --[[ Name: mapStateToProps ]]
    return {
        playerDropdownVisible = v16.playerDropDown.isVisible, 
        isUsingGamepad = v16.displayOptions.isUsingGamepad
    };
end;
local function v20(v18) --[[ Line: 62 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v5 (copy), v6 (copy)
    return {
        closePlayerDropDown = function() --[[ Line: 64 ]] --[[ Name: closePlayerDropDown ]]
            -- upvalues: v18 (copy), v5 (ref)
            return v18(v5());
        end, 
        setIsUsingGamepad = function(v19) --[[ Line: 68 ]] --[[ Name: setIsUsingGamepad ]]
            -- upvalues: v18 (copy), v6 (ref)
            return v18(v6(v19));
        end
    };
end;
local v21 = v9 and v17 or nil;
return v3.connect(v21, v20)(v8);