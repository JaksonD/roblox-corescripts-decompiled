local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Foundation);
local v3 = require(l_CorePackages_0.Packages.React);
local l_Icon_0 = v2.Icon;
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local v7 = require(l_script_FirstAncestor_0.Components.ChatModalSelectorDialogController);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagHideShortcutsOnReportDropdown);
return function(v10) --[[ Line: 27 ]] --[[ Name: ChatModalSelector ]]
    -- upvalues: v9 (copy), v3 (copy), v7 (copy), l_View_0 (copy), l_Text_0 (copy), l_Icon_0 (copy)
    local v11 = nil;
    if v9 then
        v11 = v3.useCallback(function() --[[ Line: 30 ]]
            -- upvalues: v10 (copy)
            v10.onMenuOpenChange(true);
        end, {
            v10.onMenuOpenChange
        });
    end;
    local v12 = v3.useCallback(function() --[[ Line: 35 ]]
        -- upvalues: v7 (ref), v9 (ref), v10 (copy)
        v7.unmountModalSelector();
        if v9 then
            v10.onMenuOpenChange(false);
        end;
    end, {
        v10.onMenuOpenChange
    });
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v10.selectorHeight)
    }, {
        ControlButton = v3.createElement(l_View_0, {
            tag = "size-full stroke-thicker stroke-emphasis radius-medium", 
            onActivated = function() --[[ Line: 48 ]] --[[ Name: onActivated ]]
                -- upvalues: v7 (ref), v12 (copy), v11 (ref), v10 (copy)
                v7.mountModalSelector(v12, v11, v10.onSelect);
            end
        }, {
            Text = v3.createElement(l_Text_0, {
                Text = v10.selectedValue or v10.placeholderText, 
                tag = "size-full anchor-center-center position-center-center", 
                TextTruncate = Enum.TextTruncate.AtEnd
            }), 
            Icon = v3.createElement(l_Icon_0, {
                name = "icons/actions/truncationExpand", 
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(1, 0, 0, 0)
            })
        })
    });
end;