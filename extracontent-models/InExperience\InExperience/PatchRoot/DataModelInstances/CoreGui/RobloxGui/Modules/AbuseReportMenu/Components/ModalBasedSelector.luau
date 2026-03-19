local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Foundation);
local v3 = require(l_CorePackages_0.Packages.React);
local l_Icon_0 = v2.Icon;
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local v7 = require(l_script_FirstAncestor_0.Components.ModalBasedSelectorDialogController);
local v8 = require(l_script_FirstAncestor_0.Flags.FFlagHideShortcutsOnReportDropdown);
return function(v9) --[[ Line: 23 ]] --[[ Name: ModalBasedSelector ]]
    -- upvalues: v8 (copy), v3 (copy), v7 (copy), l_View_0 (copy), l_Text_0 (copy), l_Icon_0 (copy)
    local v10 = nil;
    if v8 then
        v10 = v3.useCallback(function() --[[ Line: 26 ]]
            -- upvalues: v9 (copy)
            v9.onMenuOpenChange(true);
        end, {
            v9.onMenuOpenChange
        });
    end;
    local v11 = v3.useCallback(function() --[[ Line: 31 ]]
        -- upvalues: v7 (ref), v8 (ref), v9 (copy)
        v7.unmountModalSelector();
        if v8 then
            v9.onMenuOpenChange(false);
        end;
    end, {
        v9.onMenuOpenChange
    });
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v9.selectorHeight), 
        BackgroundTransparency = 1
    }, {
        ControlButton = v3.createElement(l_View_0, {
            tag = "size-full stroke-thicker stroke-emphasis radius-medium", 
            onActivated = function() --[[ Line: 44 ]] --[[ Name: onActivated ]]
                -- upvalues: v7 (ref), v9 (copy), v11 (copy), v10 (ref)
                v7.mountModalSelector(v9.viewportHeight, v9.viewportWidth, v9.selections, v9.onSelect, v11, v10);
            end
        }, {
            Text = v3.createElement(l_Text_0, {
                Text = v9.selectedValue or v9.placeholderText, 
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