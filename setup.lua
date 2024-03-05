local shell = require("shell")
local filesystem = require("filesystem")
local computer = require("computer")
local component = require("component")
local term = require("term")

local gpu = component.gpu
local width, height = gpu.getResolution()

local purple = 0x925CAF
gpu.setForeground(purple)

local links = {
    ["json"] = "https://raw.githubusercontent.com/Quetz4l/gt_oc_infusion/main/json.lua",
    ["ra_gui"] = "https://raw.githubusercontent.com/Quetz4l/gt_oc_infusion/main/ra_gui.lua",
    ["essentia"] = "https://raw.githubusercontent.com/Quetz4l/gt_oc_infusion/main/essentia.json",
    ["recipes"] = "https://raw.githubusercontent.com/Quetz4l/gt_oc_infusion/main/recipes.json",
    ["runic_matrix"] = "https://raw.githubusercontent.com/Quetz4l/gt_oc_infusion/main/runic_matrix.lua",
	["recipe_add"] = "https://raw.githubusercontent.com/Quetz4l/gt_oc_infusion/main/recipe_add.lua"
}

gpu.set(width / 2 - 13, height / 2 - 2, "Installation  Infusion")
os.sleep(1)
term.clear()

shell.setWorkingDirectory("/home")
if not filesystem.exists("home/infusion") then
    shell.execute("mkdir infusion")
end
shell.setWorkingDirectory("/home/infusion")

for name, link in pairs(links) do
    term.write(name .. " -> ")
    shell.execute("wget -fq " .. link)
    term.write('downloaded\n')
end

gpu.set(width / 2 - 14, height / 2 - 2, "Installation Complete")
os.sleep(1)
term.clear()

term.write("Run runic_matrix to start the program")
os.sleep(2)
term.clear()
