local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useNavigator_0 = require(l_Parent_0.ServerUI).Hooks.useNavigator;
local v5 = require(l_script_FirstAncestor_0.Hooks.useAbuseReportingDesignTokens);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local _ = require(script.Parent.Parent.Common.Types);
local v8 = require(script.Parent.ReportStep);
local l_ScrollingListTable_0 = v3.App.Table.ScrollingListTable;
local l_CellTailDescription_0 = v3.App.Table.CellTailDescription;
local l_CellHeadDetail_0 = v3.App.Table.CellHeadDetail;
local l_Cell_0 = v3.App.Table.Cell;
local v13 = UDim2.new(1, 0, 0, 64);
return function(v14) --[[ Line: 45 ]] --[[ Name: ListSelection ]]
    -- upvalues: v5 (copy), l_useNavigator_0 (copy), v2 (copy), l_Cell_0 (copy), v13 (copy), l_CellHeadDetail_0 (copy), l_CellTailDescription_0 (copy), l_useLocalization_0 (copy), v8 (copy), l_ScrollingListTable_0 (copy)
    local l_ReportListSelection_0 = v5().ReportListSelection;
    local v16 = {};
    local l_params_0 = v14.params;
    local v18 = l_useNavigator_0();
    if l_params_0.listItems then
        for v19, v20 in l_params_0.listItems do
            v16[v19] = v2.createElement(l_Cell_0, {
                size = l_ReportListSelection_0.listEntrySize or v13, 
                head = v2.createElement(l_CellHeadDetail_0, {
                    labelText = v20.humanReadableText
                }), 
                tail = v2.createElement(l_CellTailDescription_0, {
                    text = "", 
                    showArrow = true
                }), 
                background = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1)
                }), 
                onActivated = function() --[[ Line: 68 ]] --[[ Name: onActivated ]]
                    -- upvalues: v14 (copy), v20 (copy), v18 (copy), l_params_0 (copy)
                    v14.onItemSelected(v14, v20);
                    if v20.nextPage and v20.nextPage.componentRefs then
                        v18.push(v20.nextPage.componentRefs);
                        return;
                    elseif v20.nextList then
                        v18.pushParams(v20.nextList);
                        return;
                    else
                        if l_params_0.nextPage and l_params_0.nextPage.componentRefs then
                            v18.push(l_params_0.nextPage.componentRefs);
                        end;
                        return;
                    end;
                end
            });
        end;
    end;
    local v21 = l_useLocalization_0({
        cancelText = "Feature.Chat.Action.Cancel", 
        skipText = "Feature.VerificationUpsell.Action.GenericSkip"
    });
    local v22 = {
        {
            text = v21.cancelText, 
            onActivated = function() --[[ Line: 91 ]] --[[ Name: onActivated ]]
                -- upvalues: v14 (copy)
                v14.onCancel(v14);
            end
        }
    };
    if l_params_0.skippable then
        table.insert(v22, {
            text = v21.skipText, 
            onActivated = function() --[[ Line: 100 ]] --[[ Name: onActivated ]]
                -- upvalues: l_params_0 (copy), v18 (copy)
                if l_params_0.nextPage and l_params_0.nextPage.componentRefs then
                    v18.push(l_params_0.nextPage.componentRefs);
                end;
            end
        });
    end;
    return v2.createElement(v8, {
        title = l_params_0.heading, 
        buttons = v22
    }, {
        ListTable = v2.createElement(l_ScrollingListTable_0, {
            cells = v16, 
            selectable = false
        })
    });
end;