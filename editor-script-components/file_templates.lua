local M = {}

function M.sound(path)
    return [[sound: "]] .. path .. [["
looping: 0
group: "master"
gain: 1.0
pan: 0.0
speed: 1.0
]]
end

function M.spine_scene(spine_json, atlas_path)
    spine_json = spine_json or ""
    atlas_path = atlas_path or ""
    return [[spine_json: "]] .. spine_json .. [["
atlas: "]] .. atlas_path .. [["
sample_rate: 30
]]
end

function M.spine_model(path)
    return [[spine_scene: "]] .. path .. [["
default_animation: ""
skin: ""
]]
end

function M.gui_node(node_id, x, y)
    return [[
nodes {
    position {
      x: ]] ..
    x ..
    [[ 
      y: ]]..
    y .. 
    [[ 
      z: 0.0
      w: 0.0
    }
    rotation {
      x: 0.0
      y: 0.0
      z: 0.0
      w: 1.0
    }
    scale {
      x: 1.0
      y: 1.0
      z: 1.0
      w: 1.0
    }
    size {
      x: 200.0
      y: 100.0
      z: 0.0
      w: 1.0
    }
    color {
      x: 1.0
      y: 1.0
      z: 1.0
      w: 1.0
    }
    type: TYPE_TEXT
    blend_mode: BLEND_MODE_ALPHA
    text: "<text>"
    font: "system_font"
    id: "]] ..
        node_id ..
            [["
    xanchor: XANCHOR_NONE
    yanchor: YANCHOR_NONE
    pivot: PIVOT_CENTER
    outline {
      x: 1.0
      y: 1.0
      z: 1.0
      w: 1.0
    }
    shadow {
      x: 1.0
      y: 1.0
      z: 1.0
      w: 1.0
    }
    adjust_mode: ADJUST_MODE_FIT
    line_break: false
    layer: ""
    inherit_alpha: true
    alpha: 1.0
    outline_alpha: 1.0
    shadow_alpha: 1.0
    template_node_child: false
    text_leading: 1.0
    text_tracking: 0.0
    custom_type: 0
}
]]
end

function M.new_gui(gui_script_name)
    return [[
    script: "]] .. 
    gui_script_name ..
    [["
    fonts {
    name: "system_font"
    font: "/builtins/fonts/system_font.font"
    }
    background_color {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 0.0
    }
    material: "/builtins/materials/gui.material"
    adjust_reference: ADJUST_REFERENCE_PARENT
    max_nodes: 512
    ]]
end

function M.new_gui_script(require_file)
    return 
[[local data = require ("]] .. require_file .. [[")]] ..
[[

local nodes = {}
function init(self)
    for name,var in pairs(data) do
        nodes[name] = gui.get_node(name)
    end
end

function update(self, dt)
    for name,var in pairs(data) do
        gui.set_text(nodes[name], var)
    end
end]]
end
return M
