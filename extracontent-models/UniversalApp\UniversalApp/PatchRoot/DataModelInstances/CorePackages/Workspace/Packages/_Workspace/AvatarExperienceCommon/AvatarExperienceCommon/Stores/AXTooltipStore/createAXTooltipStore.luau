local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_script_FirstAncestor_0.Constants);
local v4 = require(l_script_FirstAncestor_0.Lib.SafeAppStorageService);
local v5 = game:DefineFastString("AXTooltipAllowedTooltips", "");
local v6 = game:DefineFastFlag("AXTooltipUseMemStorage", false);
local v7 = game:DefineFastInt("AXTooltipMaxNumberOfTimesSeen", 2);
local function v12(v8) --[[ Line: 30 ]] --[[ Name: deserializeSeenTooltips ]]
    local v9 = {};
    for _, v11 in (v8:split(",")) do
        v9[v11] = if v9[v11] then v9[v11] + 1 else 1;
    end;
    return v9;
end;
local function v18(v13) --[[ Line: 42 ]] --[[ Name: serializeSeenTooltips ]]
    -- upvalues: v7 (copy)
    local v14 = {};
    for v15, v16 in v13 do
        for _ = 1, math.min(v7, v16) do
            table.insert(v14, v15);
        end;
    end;
    return table.concat(v14, ",");
end;
return function() --[[ Line: 54 ]] --[[ Name: createAXTooltipStore ]]
    -- upvalues: v5 (copy), v4 (copy), v3 (copy), v6 (copy), v12 (copy), v7 (copy), v18 (copy), v2 (copy)
    local v19 = v5:split(",");
    local v20 = v4.getItem(v3.AX_TOOLTIP_STORAGE_KEY, v6);
    local v21 = v12(v20);
    local v22 = {};
    local v23 = {};
    for _, v25 in v19 do
        local v26 = v21[v25] or 0;
        if v26 < v7 then
            v22[v25] = true;
        end;
        v23[v25] = v26;
    end;
    v4.setItem(v3.AX_TOOLTIP_STORAGE_KEY, v18(v23), v6);
    v4.flush();
    local v27, v28 = v2.createSignal(v22);
    local v29, v30 = v2.createSignal(v23);
    local v31 = {};
    local function v34(v32) --[[ Line: 87 ]] --[[ Name: getIsTooltipAllowedToBeShownSignal ]]
        -- upvalues: v31 (copy), v2 (ref), v27 (copy)
        if v31[v32] == nil then
            v31[v32] = v2.createComputed(function(v33) --[[ Line: 89 ]]
                -- upvalues: v27 (ref), v32 (copy)
                return v27(v33)[v32] == true;
            end);
        end;
        return v31[v32];
    end;
    local function v40(v35, v36) --[[ Line: 97 ]] --[[ Name: dismissTooltip ]]
        -- upvalues: v27 (copy), v28 (copy), v29 (copy), v7 (ref), v4 (ref), v3 (ref), v18 (ref), v6 (ref), v30 (copy)
        local v37 = table.clone(v27(false));
        if v37[v35] ~= true then
            return;
        else
            v37[v35] = false;
            v28(v37);
            local v38 = v29(false);
            local v39 = v38[v35] or 0;
            if not v36 or v7 <= v39 then
                v38[v35] = v7;
            else
                v38[v35] = v39 + 1;
            end;
            v4.setItem(v3.AX_TOOLTIP_STORAGE_KEY, v18(v38), v6);
            v4.flush();
            v30(v38);
            return;
        end;
    end;
    return {
        getIsTooltipAllowedToBeShown = v34, 
        dismissTooltip = v40
    };
end;