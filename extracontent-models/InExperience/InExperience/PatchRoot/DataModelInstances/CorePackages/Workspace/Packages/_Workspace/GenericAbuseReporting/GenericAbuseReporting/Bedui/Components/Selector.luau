local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_Checkbox_0 = v2.Checkbox;
local l_Image_0 = v2.Image;
local l_ScaleType_0 = Enum.ScaleType;
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local _ = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportBeduiTypes);
local v12 = require(l_script_FirstAncestor_0.Enums.AbuseVector);
local v13 = require(l_script_FirstAncestor_0.Bedui.Components.ComponentSubtext);
local v14 = require(l_script_FirstAncestor_0.Bedui.Utils.getPlaceMediaAssetIds);
local v15 = require(l_script_FirstAncestor_0.Bedui.Provider.useFormData);
local v16 = UDim2.fromOffset(180, 101);
local v17 = {
    [v12.Place] = "THUMBNAIL_IDS"
};
return v3.memo(function(v18) --[[ Line: 38 ]] --[[ Name: Selector ]]
    -- upvalues: v3 (copy), v15 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v12 (copy), v14 (copy), v17 (copy), l_View_0 (copy), l_Checkbox_0 (copy), l_Image_0 (copy), l_ScaleType_0 (copy), v16 (copy), l_Text_0 (copy), v13 (copy)
    local v19, v20 = v3.useState({});
    local v21, v22 = v3.useState({});
    local l_custom_0 = v15().custom;
    local l_updateForm_0 = v15().updateForm;
    local l_updateAdditionalReportTags_0 = v15().updateAdditionalReportTags;
    local v26 = l_useRoactService_0(l_RoactNetworking_0);
    local v27 = v3.useRef((("selector-%*"):format((DateTime.now()))));
    v3.useEffect(function() --[[ Line: 52 ]]
        -- upvalues: v18 (copy), v12 (ref), v14 (ref), v26 (copy), l_custom_0 (copy), v20 (copy)
        if v18.abuseVector == v12.Place then
            v14(v26, (tostring(l_custom_0 and l_custom_0.universeId))):andThen(function(v28) --[[ Line: 54 ]]
                -- upvalues: v20 (ref)
                v20(v28);
            end);
        end;
    end, {
        v18.abuseVector, 
        v14, 
        v26, 
        l_custom_0 and l_custom_0.universeId
    });
    local v34 = v3.useCallback(function(v29) --[[ Line: 61 ]]
        -- upvalues: v22 (copy), v18 (copy), v12 (ref), l_updateAdditionalReportTags_0 (copy), v27 (copy), v17 (ref)
        v22(function(v30) --[[ Line: 62 ]]
            -- upvalues: v29 (copy), v18 (ref), v12 (ref), l_updateAdditionalReportTags_0 (ref), v27 (ref), v17 (ref)
            local v31 = table.clone(v30);
            local v32 = table.find(v31, v29);
            if v32 then
                table.remove(v31, v32);
            else
                table.insert(v31, v29);
            end;
            if v18.abuseVector == v12.Place then
                local v33 = table.concat(v31, ",");
                if l_updateAdditionalReportTags_0 then
                    l_updateAdditionalReportTags_0(v27.current, {
                        tagKey = v17[v18.abuseVector], 
                        tagValue = v33
                    });
                end;
            end;
            return v31;
        end);
    end, {
        v18.component, 
        v18.abuseVector, 
        l_updateForm_0
    });
    local v38 = v3.useMemo(function() --[[ Line: 85 ]]
        -- upvalues: v19 (copy), v3 (ref), l_View_0 (ref), l_Checkbox_0 (ref), v21 (copy), v34 (copy), l_Image_0 (ref), l_ScaleType_0 (ref), v16 (ref)
        local v35 = {};
        for v36, v37 in ipairs(v19) do
            table.insert(v35, v3.createElement(l_View_0, {
                tag = "size-0-0 auto-xy row gap-small self-center border-radius-medium padding-small", 
                LayoutOrder = v36
            }, {
                Checkbox = v3.createElement(l_Checkbox_0, {
                    label = "", 
                    isChecked = table.find(v21, v37) ~= nil, 
                    onActivated = function() --[[ Line: 97 ]] --[[ Name: onActivated ]]
                        -- upvalues: v34 (ref), v37 (copy)
                        v34(v37);
                    end
                }), 
                Image = v3.createElement(l_Image_0, {
                    Image = ("rbxthumb://type=Asset&id=%*&w=768&h=432"):format(v37), 
                    ScaleType = l_ScaleType_0.Fit, 
                    Size = v16, 
                    onActivated = function() --[[ Line: 105 ]] --[[ Name: onActivated ]]
                        -- upvalues: v34 (ref), v37 (copy)
                        v34(v37);
                    end
                })
            }));
        end;
        return v35;
    end, {
        v19, 
        v21
    });
    if #v19 ~= 0 then
        return (v3.createElement(l_View_0, {
            tag = "size-full-0 auto-y col gap-small", 
            LayoutOrder = v18.layoutOrder
        }, {
            Prompt = v3.createElement(l_Text_0, {
                Text = v18.component.selector.prompt, 
                tag = "auto-xy", 
                LayoutOrder = 0
            }), 
            CheckboxGroup = v3.createElement(l_View_0, {
                tag = "size-full-0 auto-y col", 
                LayoutOrder = 1
            }, v38), 
            ComponentSubtext = v3.createElement(v13, {
                isErrorState = v18.isErrorState, 
                isOptional = v18.component.isOptional, 
                requirementMessage = v18.component.requirementMessage, 
                layoutOrder = 2
            })
        }));
    else
        return nil;
    end;
end);