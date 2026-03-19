local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local l_createSignal_0 = v2.createSignal;
local v4 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatTransparentFocusSupport);
local function v5() --[[ Line: 27 ]]

end;
return function() --[[ Line: 29 ]]
    -- upvalues: l_createSignal_0 (copy), v4 (copy), v2 (copy), v5 (copy)
    local v6, v7 = l_createSignal_0(0);
    local v8, v9 = l_createSignal_0(0);
    local v10, v11 = l_createSignal_0(false);
    local v12, v13 = l_createSignal_0(false);
    local v14, v15 = l_createSignal_0(false);
    local v17 = if v4 then v2.createComputed(function(v16) --[[ Line: 37 ]]
        -- upvalues: v10 (copy), v12 (copy), v14 (copy)
        return v10(v16) or v12(v16) or v14(v16);
    end) else nil;
    local function v18() --[[ Line: 42 ]] --[[ Name: resetAllTransparency ]]
        -- upvalues: v7 (copy), v9 (copy)
        v7(os.clock());
        v9(os.clock());
    end;
    local function _(v19) --[[ Line: 47 ]] --[[ Name: withResetAllTransparency ]]
        -- upvalues: v7 (copy), v9 (copy)
        return function() --[[ Line: 48 ]]
            -- upvalues: v19 (copy), v7 (ref), v9 (ref)
            v19();
            v7(os.clock());
            v9(os.clock());
        end;
    end;
    local v21 = {
        getLastActivity = v6, 
        getLastMessageActivity = v8, 
        getIsTextBoxFocused = v10, 
        getIsFocused = v17, 
        resetAllTransparency = v18, 
        resetTextTransparency = function() --[[ Line: 63 ]] --[[ Name: resetTextTransparency ]]
            -- upvalues: v9 (copy)
            v9(os.clock());
        end
    };
    local v22;
    if v4 then
        local function v23() --[[ Line: 67 ]]
            -- upvalues: v11 (copy)
            v11(true);
        end;
        local l_v23_0 = v23 --[[ copy: 15 -> 20 ]];
        v22 = function() --[[ Line: 48 ]]
            -- upvalues: l_v23_0 (copy), v7 (copy), v9 (copy)
            l_v23_0();
            v7(os.clock());
            v9(os.clock());
        end;
    else
        v22 = function() --[[ Line: 70 ]]
            -- upvalues: v11 (copy), v7 (copy), v9 (copy)
            v11(true);
            v7(os.clock());
            v9(os.clock());
        end;
    end;
    v21.setTextboxFocus = v22;
    local function v25() --[[ Line: 74 ]]
        -- upvalues: v11 (copy)
        v11(false);
    end;
    local l_v25_0 = v25 --[[ copy: 15 -> 16 ]];
    v21.clearTextboxFocus = function() --[[ Line: 48 ]]
        -- upvalues: l_v25_0 (copy), v7 (copy), v9 (copy)
        l_v25_0();
        v7(os.clock());
        v9(os.clock());
    end;
    if v4 then
        v25 = function() --[[ Line: 78 ]]
            -- upvalues: v13 (copy)
            v13(true);
        end;
        local l_v25_1 = v25 --[[ copy: 15 -> 19 ]];
        v22 = function() --[[ Line: 48 ]]
            -- upvalues: l_v25_1 (copy), v7 (copy), v9 (copy)
            l_v25_1();
            v7(os.clock());
            v9(os.clock());
        end;
    else
        v22 = v5;
    end;
    v21.setWindowFocusInput = v22;
    if v4 then
        v25 = function() --[[ Line: 83 ]]
            -- upvalues: v13 (copy)
            v13(false);
        end;
        local l_v25_2 = v25 --[[ copy: 15 -> 18 ]];
        v22 = function() --[[ Line: 48 ]]
            -- upvalues: l_v25_2 (copy), v7 (copy), v9 (copy)
            l_v25_2();
            v7(os.clock());
            v9(os.clock());
        end;
    else
        v22 = v5;
    end;
    v21.clearWindowFocusInput = v22;
    if v4 then
        v25 = function() --[[ Line: 88 ]]
            -- upvalues: v15 (copy)
            v15(true);
        end;
        local l_v25_3 = v25 --[[ copy: 15 -> 17 ]];
        v22 = function() --[[ Line: 48 ]]
            -- upvalues: l_v25_3 (copy), v7 (copy), v9 (copy)
            l_v25_3();
            v7(os.clock());
            v9(os.clock());
        end;
    else
        v22 = v5;
    end;
    v21.setContextMenuOpen = v22;
    if v4 then
        v25 = function() --[[ Line: 93 ]]
            -- upvalues: v15 (copy)
            v15(false);
        end;
        v22 = function() --[[ Line: 48 ]]
            -- upvalues: v25 (copy), v7 (copy), v9 (copy)
            v25();
            v7(os.clock());
            v9(os.clock());
        end;
    else
        v22 = v5;
    end;
    v21.clearContextMenuOpen = v22;
    return v21;
end;