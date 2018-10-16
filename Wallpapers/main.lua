local GUI = require("GUI")
local MineOSInterface = require("MineOSInterface")
local Version = "1.07"
local MineOSCore = require("MineOSCore")

local pictures = {
  "Zemfira", -- хочешь, сладких апельсинов.
  "Tatu",
  "Katya", --шлюха
  "WinterSunrise",
  "Nocturnal",
  "AhsokaTano",
  "Sea",
  "Sea-mountains",
  "Chester",
  "linkin_park", -- говно
  "moscow",
  "Piter",
  "Nice_girl",
  "Win_10",
  "texture",
  "Winter_National",
  "Car",
  "field",
  "Colors",
  "CPU",
  "Surgut",
  "Forest",
  "Sea-2",
  "Hard_disk",
  "Kiev",
  "Color_Skull",
  "winter_fun",
  "Squirrel",
  "Ferret",
  "Android_P",
  "Android_O",
  "Android_N",
  "Android_M",
  "Redstone",
  "Linux",
  "Code",
  "Anonumys",
  "MineCraft",
  "Apple",
  "Trap_nation",
  "Ryzen",
  "Ryazan",
  "Raspberry",
  "Firefox",
  "Scrimer",
  "lox",
  "Anime",
  "seashell",
  "Ice_haze",
  "Sea_wave",
  "3D_Cat",
  "Github",
  "lake_forest_mountains",
  "Nvidia",
  "wave_in_the_ocean",
  "Strawberry_cocktail",
  "Matrix",
  "Intel_Inside",
  "Rammstein", -- ну, норм я ниче не могу сказать.
  "Google",
  "TED",
  "Little_big", -- скпибиди папапа бум бум айс.
  "Yandex",
  "Cat",
  "Sea-Night",
  "IMac",
  "Mojave",
  "Mojave_Night",
  "yosemite",
  "Omen",
}

local mainContainer, window = MineOSInterface.addWindow(GUI.titledWindow(1, 1, 145, 35, "Wallpapers "..Version, true))
--local mainContainer, window = MineOSInterface.addWindow(GUI.filledWindow(1, 1, 135, 35))

--local mainContainer, window = MineOSInterface.addWindow(GUI.filledWindow(1, 1, 145, 35, 0))
window.backgroundPanel.colors.transparency = 0.2
--local progressIndicator = window:addChild(GUI.progressIndicator(140, 32, 0x1E1E1E, 0x990000, 0xFF0000))



local x, y, width, horizontalSpace, verticalSpace = 3, 3, 10, 2, 1
for i = 1, #pictures do
  window:addChild(GUI.text(x, y, 0x696969, string.limit(pictures[i], width)))
  window:addChild(GUI.framedButton(x, y + 1, width, 3, 0x696969, 0x696969, 0x880000, 0x880000, "Download")).onTouch = function()
    local file = pictures[i] .. ".pic"
    
    GUI.alert("Russian: не вынимайте, интернет карту во время скачиваний, это пройдет 3 секунды. \nEnglish: do not remove the internet map during downloads, it will take 3 seconds.")
    -- progressIndicator.active = true
     
      mainContainer:drawOnScreen()
        loadfile("/bin/wget.lua")("https://github.com/Fronun/Wallpapers/raw/master/wall/" .. file, "/MineOS/Pictures/" .. file, "-FQ")
    GUI.alert("Russian: Загрузка завершена! Чтобы поставить на рабочий стол, Settings -> обои и заставка, выбираете " .. file, "\nEnglish: Loading is successfully! To put on your desktop, Settings -> wallpapers, choose " ..file)
  --  progressIndicator.active = false
  end

  x = x + width + horizontalSpace
  if x + width > window.width then
    x, y = 3, y + verticalSpace + 4

  end
end

mainContainer:drawOnScreen()
