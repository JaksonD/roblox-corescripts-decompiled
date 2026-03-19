local l_script_FirstAncestorWhichIsA_0 = script:FindFirstAncestorWhichIsA("Plugin");
return {
    context = l_script_FirstAncestorWhichIsA_0 and "plugin" or "unknown", 
    plugin_name = if l_script_FirstAncestorWhichIsA_0 then l_script_FirstAncestorWhichIsA_0.Name else nil
};