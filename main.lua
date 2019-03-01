-- PLUGINS --
local mouseHover = require 'plugin.mouseHover' -- requiring a plugin for mouseover events

-- DISPLAY GROUPS --
local backGroup = display.newGroup()         --Background assets
local uiGroup = display.newGroup()           --UI assets
local mainGroup = display.newGroup()         --Heroes, mobs etc. assets

-- UI BACKGROUND --
local background = display.newImageRect( backGroup, "ui_background.png", 1920, 1080 ) --declaring background image
    background.x = display.contentCenterX
    background.y = display.contentCenterY

-- EXIT BUTTON --
local exitButton = display.newImageRect( uiGroup, "exitbutton.png", 75, 77 ) -- declaring exit button
    exitButton.x = 1920 - 75
    exitButton.y = 73

local function exitButton_tap() -- close the application
    native.requestExit()
end
exitButton:addEventListener( "tap", exitButton_tap ) -- when exit tapped close the application

local onMouseHoverExit = function(event) -- exit button interactable by getting bigger when hovered over
    if event.phase == "began" then
            exitButton:scale(1.1,1.1)
    elseif event.phase == "ended" then
            exitButton:scale(0.90909,0.90909)
    end
end
exitButton:addEventListener( "mouseHover", onMouseHoverExit ) -- points to the function above

-- CONTINUE BUTTON --
local continueButton = display.newImageRect( uiGroup, "continuebutton.png", 658, 180 ) -- declaring continue button
    continueButton.x = display.contentCenterX - 250
    continueButton.y = display.contentCenterY - 200

local continueButtonLight = display.newImageRect( uiGroup, "continuebuttonlight.png", 658, 180 ) --declaring the light up version
    continueButtonLight.x = display.contentCenterX - 250
    continueButtonLight.y = display.contentCenterY - 200
    continueButtonLight.isVisible = false

local onMouseHover = function(event) -- Continue lights up when hovered over
    if event.phase == "began" then
            event.target.isVisible = true
            continueButtonLight.isVisible = true
    elseif event.phase == "ended" then
            continueButtonLight.isVisible = false
    end
end
continueButton:addEventListener( "mouseHover", onMouseHover ) -- points to the function above

-- NEW GAME BUTTON --
local newButton = display.newImageRect( uiGroup, "newbutton.png", 658, 180 ) -- declaring new game button
    newButton.x = display.contentCenterX - 250
    newButton.y = display.contentCenterY - 0

local newButtonLight = display.newImageRect( uiGroup, "newbuttonlight.png", 658, 180 ) --declaring light up version
    newButtonLight.x = display.contentCenterX - 250
    newButtonLight.y = display.contentCenterY - 0
    newButtonLight.isVisible = false

local onMouseHover2 = function(event) --button lights up when hovered over
    if event.phase == "began" then
            event.target.isVisible = true
            newButtonLight.isVisible = true
    elseif event.phase == "ended" then
            newButtonLight.isVisible = false
    end
end
newButton:addEventListener( "mouseHover", onMouseHover2 ) -- points to the function above

-- MENU BUTTON --
local menuButton = display.newImageRect( uiGroup, "menubutton.png", 658, 180 ) --declaring menu button
    menuButton.x = display.contentCenterX - 250
    menuButton.y = display.contentCenterY + 200

local menuButtonLight = display.newImageRect( uiGroup, "menubuttonlight.png", 658, 180 ) --declaring light up version
    menuButtonLight.x = display.contentCenterX - 250
    menuButtonLight.y = display.contentCenterY + 200
    menuButtonLight.isVisible = false

local onMouseHover3 = function(event) -- Button lights up when hovered over
    if event.phase == "began" then
            event.target.isVisible = true
            menuButtonLight.isVisible = true
    elseif event.phase == "ended" then
            menuButtonLight.isVisible = false
    end
end
menuButton:addEventListener( "mouseHover", onMouseHover3 ) --Points to the function above

local function menuClicked() --When menu is clicked
    continueButton.isVisible = false
    newButton.isVisible = false
    menuButton.isVisible = false
    menuButtonLight.isVisible = false
    exitButton.isVisible = false

    local backButtonMenu = display.newImageRect( uiGroup, "backbutton.png", 71, 101) --declaring back button
        backButtonMenu.x = 71 -- I declared two separate back buttons for new game and menu because
        backButtonMenu.y = 73 -- There was a bug where the button would just get smaller and smaller
                              -- when switching from new game to meanu and back -Jakub
    local onMouseHoverBack = function(event) --Back button gets bigger when hovered over
        if event.phase == "began" then
               backButtonMenu:scale(1.1,1.1)
        elseif event.phase == "ended" then
               backButtonMenu:scale(0.90909,0.90909)
        end
    end

    backButtonMenu:addEventListener( "mouseHover", onMouseHoverBack ) --points to the function above

    local function backToStart() --goes back to starting screen
        continueButton.isVisible = true
        newButton.isVisible = true
        menuButton.isVisible = true
        backButtonMenu.isVisible = false
        exitButton.isVisible = true
    end
    backButtonMenu:addEventListener("tap", backToStart) --points to the function above
end
menuButton:addEventListener("tap", menuClicked) --points to the function that triggers menu clicked functions

-- NEW GAME PRESSED --
local mageIcon = display.newImageRect(uiGroup, "Badge_mage.png", 500, 500) --declaring the mage image
mageIcon.x = display.contentCenterX
mageIcon.y = display.contentCenterY
mageIcon.isVisible = false

local chooseClass = display.newText( uiGroup,"Choose Your Class!", display.contentCenterX, display.contentCenterY - 300, native.systemFont, 80  )
    chooseClass:setFillColor(255, 0, 255) --Declaring the text, Lua uses RGB Colours
    chooseClass.isVisible = false

local backButtonNew = display.newImageRect( uiGroup, "backbutton.png", 71, 101) --declaring second back button
    backButtonNew.x = 71
    backButtonNew.y = 73
    backButtonNew.isVisible = false

local function newButton_tap() --goes to new game options
    continueButton.isVisible = false
    newButton.isVisible = false
    newButtonLight.isVisible = false
    menuButton.isVisible = false
    exitButton.isVisible = false
    mageIcon.isVisible = true
    chooseClass.isVisible = true
    backButtonNew.isVisible = true

    local onMouseHoverMage = function(event) --mage image gets bigger when hovered over
        if event.phase == "began" then
                  mageIcon:scale(1.1,1.1)
        elseif event.phase == "ended" then
                      mageIcon:scale(0.90909,0.90909)
        end
    end
    mageIcon:addEventListener( "mouseHover", onMouseHoverMage ) --Points to the function above

    local onMouseHoverBack = function(event) --button gets bigger when hovered over
        if event.phase == "began" then
               backButtonNew:scale(1.1,1.1)
        elseif event.phase == "ended" then
               backButtonNew:scale(0.90909,0.90909)
        end
    end
     backButtonNew:addEventListener("mouseHover", onMouseHoverBack) --Points to the function above

    local function backToStart() --goes back to the start screen
        continueButton.isVisible = true
        newButton.isVisible = true
        menuButton.isVisible = true
        backButtonNew.isVisible = false
        mageIcon.isVisible = false
        chooseClass.isVisible = false
        exitButton.isVisible = true
        mageIcon.isVisible = false
        chooseClass.isVisible = false
        backButtonNew.isVisible = false
    end
    backButtonNew:addEventListener("tap", backToStart) --points to the function above
end
newButton:addEventListener( "tap", newButton_tap ) --points to the new game clicked function

----------------------------------------------------------------------------
--GAME----------------------------------------------------------------------
----------------------------------------------------------------------------

local function mageIconClicked() --when the mage is clicked start new game
    mageIcon.isVisible = false
    chooseClass.isVisible = false
    background.isVisible = false
    backButtonNew.isVisible = false

  -- GAME PHYSICS --
  local physics = require("physics")
      physics.start()
      physics.setGravity(0, 0)

  -- VARIABLES --
  local livesP = 1
  local livesF = 1
  local died = false
  local Player

  -- PLAYER PHYSICS --
  local function Player()
      local Player = display.newImageRect(mainGroup,"Player.png", 100, 100)
      physics.addBody(Player, {radius=40, isSensor=true})
      Player.myName = "Player"
  end

  -- wall physics --
  local Walls = display.newImageRect( mainGroup,"Walls.jpg", 500, 600)
      Walls.x = display.contentCenterX-700
      Walls.y = display.contentCenterY-400
      physics.addBody(Walls, "static")
      Walls.isVisible = false --hiding this to work on UI -Kubo

end --end for mageIconClicked
mageIcon:addEventListener( "tap", mageIconClicked ) --Points to mageIconClicked
--mageIcon is getting bigger and bigger now when you go back and forth to main menu
--fuck this im done for now
