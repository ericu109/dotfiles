----------------
--- Monitors ---
----------------
hl.monitor({ output = 'DP-1', mode = '2560x1440@144', position = '0x0', scale = 1 })          -- bottom right
hl.monitor({ output = 'DP-2', mode = '3840x2160@60', position = '-2560x0', scale = 1.5 })     -- bottom left
hl.monitor({ output = 'HDMI-A-1', mode = '2560x1440@60', position = '0x-1440', scale = 1 })   -- top right
hl.monitor({ output = 'DP-3', mode = '3840x2160@60', position = '-2560x-1440', scale = 1.5 }) -- top left

-----------------------
--- Workspace setup ---
-----------------------
local workspaceNames = 'abcdefghijklmnopqrstuvwxyz'
local workspaces = {};

for i = 1, 26 do
  local workspaceName = workspaceNames:sub(i, i)
  workspaces[i] = {
    workspace = i,
    default_name = workspaceName
  }

  if workspaceName == 'g' then
    workspaces[i].monitor = 'HDMI-A-1'
  end

  if workspaceName == 'm' then
    workspaces[i].monitor = 'HDMI-A-1'
  end

  if workspaceName == 'k' then
    workspaces[i].monitor = 'DP-2'
  end
end

--- Get the workspace number based on the workspace's default_name
--- @param workspaceName string
--- @return integer
local function getWorkspaceNumber(workspaceName)
  for key, value in ipairs(workspaces) do
    if value.default_name == workspaceName then
      return key
    end
  end

  error(workspaceName .. ' was not found in worksapces')
end

for _, value in ipairs(workspaces) do
  hl.workspace_rule(value)
end

--------------------------------------------
--- Window rules for auto started things ---
--------------------------------------------
hl.window_rule({
  match = {
    class = 'discord'
  },
  workspace = getWorkspaceNumber('g')
})

hl.window_rule({
  match = {
    class = '.*steam.*'
  },
  workspace = getWorkspaceNumber('g')
})

hl.window_rule({
  match = {
    class = '.*signal.*'
  },
  workspace = getWorkspaceNumber('g')
})

hl.window_rule({
  match = {
    class = '.*Evolution.*'
  },
  workspace = getWorkspaceNumber('m')
})

hl.window_rule({
  match = {
    class = '.*Thunderbird.*'
  },
  workspace = getWorkspaceNumber('m')
})

-- Open keepass's main window on the k workspace, but exclude the unlock modal, so it can open on the active workspace
hl.window_rule({
  match = {
    class = 'org.keepassxc.KeePassXC',
    title = "[^Unlock].*"
  },
  workspace = getWorkspaceNumber('k')
})


------------------
--- Auto start ---
------------------
hl.on('hyprland.start', function()
  hl.exec_cmd('waybar')
  hl.exec_cmd('systemctl --user start hyprpolkitagent')
  hl.exec_cmd('hyprpaper')
  hl.exec_cmd('/home/eric/.config/hypr/scripts/rotate-wallpapers.sh')
  hl.exec_cmd('insync start')
  hl.exec_cmd('hyprsunset')
  hl.exec_cmd('swaync')
  hl.exec_cmd('hypridle')
  hl.exec_cmd('input-remapper-control --command autoload')
  hl.exec_cmd('thunderbird')
  hl.exec_cmd('steam')
  hl.exec_cmd('signal-desktop')
  hl.exec_cmd('discord')
  hl.exec_cmd('keepassxc')
end)

-------------------
--- Main Config ---
-------------------
hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 8,

    border_size = 2,

    col = {
      active_border = { colors = { "rgba(7aa2f7ff)", "rgba(bb9af7ff)" }, angle = 45 },
      inactive_border = 'rgba(595959aa)'
    },

    resize_on_border = true,

    allow_tearing = true,

    layout = 'dwindle'
  },

  decoration = {
    rounding = 5,
    rounding_power = 2,

    active_opacity = 1,
    inactive_opacity = .95,

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = 'rgba(283457ee)'
    },

    blur = {
      enabled = true,
      size = 3,
      passes = 1,
      vibrancy = 0.1696
    }
  },

  animations = {
    enabled = true
  },

  dwindle = {
    preserve_split = true,
    smart_split = true
  },

  master = {
    new_status = 'master'
  },

  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = false,
    focus_on_activate = true,
    key_press_enables_dpms = true
  },

  input = {
    kb_layout = 'us',
    kb_variant = '',
    kb_model = '',
    kb_options = '',
    kb_rules = '',

    follow_mouse = 1,

    sensitivity = 0,

    touchpad = {
      natural_scroll = false
    }
  }
})

------------------
--- Animations ---
------------------
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("easy", { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

----------------
--- Keybinds ---
----------------
local mainMod = 'SUPER'

--- Get the string for a keybinding
--- @param keys table
--- @return string
local function getKeys(keys)
  local rval = keys[1];

  for index, value in ipairs(keys) do
    if index ~= 1 then
      rval = rval .. ' + ' .. value
    end
  end

  return rval
end

-- brightness
hl.bind(getKeys({ mainMod, 'k' }), hl.dsp.exec_cmd('hyprctl hyprsunset gamma +10'))
hl.bind(getKeys({ mainMod, 'j' }), hl.dsp.exec_cmd('hyprctl hyprsunset gamma -10'))

-- restart waybar
hl.bind(getKeys({ mainMod, 'w' }), hl.dsp.exec_cmd('pkill waybar && waybar &'))

-- lock the session
hl.bind(getKeys({ 'ALT', 'l' }), hl.dsp.exec_cmd('hyprlock'))

-- Exit hyprland
hl.bind(
  getKeys({ mainMod, 'SHIFT', 'm' }),
  hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

-- swaync
hl.bind(getKeys({ mainMod, 'n' }), hl.dsp.exec_cmd('swaync-client -t'))

-- full-screen and floating
hl.bind(getKeys({ mainMod, 'b' }), hl.dsp.window.fullscreen({ action = 'toggle' }))
hl.bind(getKeys({ mainMod, 'v' }), hl.dsp.window.float({ action = 'toggle' }))

-- close/kill
hl.bind(getKeys({ mainMod, 'q' }), hl.dsp.window.close())
hl.bind(getKeys({ 'ALT', 'F4' }), hl.dsp.window.kill())

-- launcher
hl.bind(getKeys({ mainMod, 'r' }), hl.dsp.exec_cmd('rofi -show drun -show-icons'))
hl.bind(getKeys({ mainMod, 's' }), hl.dsp.exec_cmd('rofi -show window -show-icons'))

-- screenshot
hl.bind(getKeys({ 'CTRL', 'PRINT' }),
  hl.dsp.exec_cmd('grim -g "$(slurp)" -t ppm - | satty --filename - --floating-hack'))

--- Move the given workspace to the active monitor and switch to it
--- @param workspaceName string this name of the workspace
local function goToWorkspace(workspaceName)
  hl.dispatch(hl.dsp.workspace.move({
    workspace = getWorkspaceNumber(workspaceName),
    monitor = hl.get_active_monitor()
  }))

  hl.dispatch(hl.dsp.focus({ workspace = getWorkspaceNumber(workspaceName) }))
end

-- submap for moving workspaces to monitors
hl.bind(getKeys({ mainMod, 'u' }), hl.dsp.submap('Go to Workspace'))
hl.define_submap('Go to Workspace', function()
  for _, value in ipairs(workspaces) do
    hl.bind(
      value.default_name,
      function()
        goToWorkspace(value.default_name)
        hl.dispatch(hl.dsp.submap('reset'))
      end
    )
  end

  hl.bind('escape', hl.dsp.submap('reset'))
end)


-- submap for moving windows to workspaces
hl.bind(getKeys({ mainMod, 'm' }), hl.dsp.submap('Move Window to Workspace'))
hl.define_submap('Move Window to Workspace', function()
  for _, value in ipairs(workspaces) do
    hl.bind(
      value.default_name,
      function()
        hl.dispatch(
          hl.dsp.window.move({
            workspace = getWorkspaceNumber(value.default_name),
            window = hl.get_active_window()
          })
        )
        hl.dispatch(hl.dsp.submap('reset'))
      end
    )
  end

  hl.bind('escape', hl.dsp.submap('reset'))
end)

-- move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(getKeys({ mainMod, 'mouse:272' }), hl.dsp.window.drag(), { mouse = true })
hl.bind(getKeys({ mainMod, 'mouse:273' }), hl.dsp.window.resize(), { mouse = true })

--------------------
--- Window Rules ---
--------------------
hl.window_rule({
  name = 'suppress-maximize-events',
  match = {
    class = '.*'
  },
  suppress_event = 'maximize'
})

hl.window_rule({
  -- Fix some dragging issues with XWayland
  name     = "fix-xwayland-drags",
  match    = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },

  no_focus = true,
})

hl.window_rule({
  name  = "move-hyprland-run",
  match = { class = "hyprland-run" },

  move  = "20 monitor_h-120",
  float = true,
})

hl.window_rule({
  name = 'always opaque',
  match = {
    title = '.*YouTube.*|.*Twitch.*|.*▶.*',
    class = 'firefox-developer-edition'
  },
  opaque = true
})
