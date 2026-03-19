local l_Parent_0 = script.Parent.Parent.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Signals);
local v4 = require(l_Parent_1.Cryo);
local v5 = require(l_Parent_1.Display);
local l_createSignal_0 = v3.createSignal;
local l_createEffect_0 = v3.createEffect;
return function() --[[ Line: 41 ]]
    -- upvalues: l_createSignal_0 (copy), v4 (copy), l_GuiService_0 (copy), v5 (copy), l_createEffect_0 (copy)
    local v8, v9 = l_createSignal_0({}, v4.Dictionary.equals);
    local function v26(v10, v11, v12) --[[ Line: 44 ]]
        local v13 = {};
        local l_X_0 = v10.X;
        local l_Y_0 = v10.Y;
        local l_X_1 = v11.X;
        local v17 = v11.Y - l_Y_0;
        local l_l_X_0_0 = l_X_0;
        local v19 = 0;
        for _, v21 in ipairs(v12) do
            local v22 = l_l_X_0_0 + v19;
            local v23 = v21.position.X - v22;
            table.insert(v13, {
                Position = {
                    X = v22, 
                    Y = l_Y_0
                }, 
                Size = {
                    X = v23, 
                    Y = v17
                }
            });
            l_l_X_0_0 = v21.position.X;
            v19 = v21.size.X;
        end;
        local v24 = l_l_X_0_0 + v19;
        local v25 = l_X_1 - v24;
        table.insert(v13, {
            Position = {
                X = v24, 
                Y = l_Y_0
            }, 
            Size = {
                X = v25, 
                Y = v17
            }
        });
        return v13;
    end;
    local function v43(v27) --[[ Line: 96 ]]
        -- upvalues: l_GuiService_0 (ref), v5 (ref), v26 (copy)
        local v28 = {};
        local v29 = {};
        for _, v31 in pairs(v27) do
            table.insert(v29, {
                id = v31.id, 
                size = v31.size, 
                position = v31.position
            });
        end;
        table.sort(v29, function(v32, v33) --[[ Line: 111 ]]
            local v34 = false;
            if v32.position.X < v33.position.X then
                v34 = v32.position.X + v32.size.X < v33.size.X + v33.position.X;
            end;
            return v34;
        end);
        local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
        local v37 = v5.GetDisplayStore(false).getViewportSize(false);
        local v38 = Vector2.new(0, 0);
        local v39 = Vector2.new(v37.X, l_l_GuiService_0_GuiInset_0.Y);
        v28 = v26(v38, v39, v29);
        local v40 = nil;
        for _, v42 in ipairs(v28) do
            if not v40 or v42.Size.X > v40.Width then
                v40 = Rect.new(v42.Position.X, v42.Position.Y, v42.Position.X + v42.Size.X, v42.Position.Y + v42.Size.Y);
            end;
        end;
        return v40;
    end;
    local function v48(v44, v45, v46) --[[ Line: 140 ]] --[[ Name: setKeepOutArea ]]
        -- upvalues: v9 (copy), v4 (ref), v8 (copy)
        local v47 = {
            [v44] = {
                id = v44, 
                position = v45, 
                size = v46
            }
        };
        v9(v4.Dictionary.join(v8(false), v47));
    end;
    local function v51(v49) --[[ Line: 151 ]] --[[ Name: removeKeepOutArea ]]
        -- upvalues: v8 (copy), v9 (copy)
        local v50 = v8(false);
        v50[v49] = nil;
        v9(v50);
    end;
    local v55 = l_createEffect_0(function(v52) --[[ Line: 157 ]]
        -- upvalues: v5 (ref), v43 (copy), v8 (copy), l_GuiService_0 (ref)
        local _ = v5.GetDisplayStore(v52).getViewportSize(v52);
        local v54 = v43(v8(v52));
        if v54 then
            l_GuiService_0:SetTopbarInset(v54);
        end;
    end);
    return {
        getKeepOutAreas = v8, 
        setKeepOutArea = v48, 
        removeKeepOutArea = v51, 
        cleanup = function() --[[ Line: 165 ]] --[[ Name: cleanup ]]
            -- upvalues: v55 (copy)
            v55();
        end
    };
end;