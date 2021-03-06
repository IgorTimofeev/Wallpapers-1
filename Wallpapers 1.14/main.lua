-- подключаем библеотеку.
local GUI = require("GUI")
local MineOSInterface = require("MineOSInterface")
local MineOSCore = require("MineOSCore")
local computer = require("computer")
-- указываем локализацию (языки)
local resourcesPath = MineOSCore.getCurrentScriptDirectory()
local localization = MineOSCore.getLocalization(resourcesPath .. "Localizations/")

local pictures = { -- Список обоев.
  "Tatu",
  "WinterSunrise",
  "Nocturnal",
  "AhsokaTano",
  "Sea",
  "Sea-mountains",
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
  "Anonumys", -- анонимус, отсосимус!
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
  "Rammstein", 
  "Google", 
  "TED",
  "Little_big",  
  "Yandex",
  "Cat",
  "Sea-Night",
  "IMac",
  "Mojave",
  "Mojave_Night",
  "yosemite",
  "Omen",
  "Helloween",
  "NewYork",
  "Sunset",
  "CalfMountains",
  "China",
  "japan",
}



local mainContainer, window = MineOSInterface.addWindow(GUI.filledWindow(1, 1, 145, 35, 0x4B4B4B)) --  окно


window.backgroundPanel.colors.transparency = 0.4 -- прозрачность окна


mainContainer.menu:addItem(localization.author).onTouch = function() -- вкладка "Автор"
 local container = GUI.addBackgroundContainer(mainContainer, true, true, localization.author1) -- тут все понятно..
 end


local x, y, width, horizontalSpace, verticalSpace = 3, 4, 9, 2, 1 -- я тут ничёрта не пойму.
for i = 1, #pictures do
  window:addChild(GUI.text(x, y, 0xD2D2D2, string.limit(pictures[i], width))) -- название обоины.
  window:addChild(GUI.roundedButton(x, y + 1, width, 3, 0x969696, 0xE1E1E1, 0x696969, 0x969696, localization.download)).onTouch = function() -- кнопка скачать
    local file = pictures[i] .. ".pic" -- для чего то. 
    
        loadfile("/bin/wget.lua")("https://github.com/Fronun/Wallpapers/raw/master/wall/" .. file, "/MineOS/Pictures/" .. file, "-FQ")
      computer.beep() -- пипип нахуй :)
      
      os.sleep(1.000)
    local container = GUI.addBackgroundContainer(mainContainer, true, true, localization.warning ..file)
      
  end

  x = x + width + horizontalSpace
  if x + width > window.width then
    x, y = 3, y + verticalSpace + 4

  end
end

--тестовый режим. Test
  
--window.onResize = function(width, height) -- делаем чтобы юзер мог сделать окно полным.
 -- window.backgroundPanel.width = width
 -- window.backgroundPanel.height = height
  
--end

--window:resize(window.width, window.height)

mainContainer:drawOnScreen()