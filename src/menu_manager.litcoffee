# Menu Manager
This module provides a wrapper interface for Electron's own menu APIs.
It can be used to create new menus as well as new menu items.

In order to actually use this module, we'll need to export it.
Since it will be a class, this is easy.

    module.exports = MenuManager
We can now actually define our menu manager class.

    class MenuManager
In the constructor, we should obtain a copy of Electron's menu APIs.

      constructor: ->
        @menu = require 'menu'
        @menuItem = require 'menu-item'
A small wrapper method to add an item to a menu is nice.

      addItemToMenu: (menu, item) ->
        menu.append(item)
Embedding the templates directly into the code is unwieldly due to it's structure.
We can avoid this by having a function that will obtain the template from a file.
Menus are an array, but for simplicity we'll creatively use require and module exports.

      loadMenuFile: (filename) ->
        menuData = require filename
        builtMenu = @menu.buildFromTemplate template
A way to initalise the application menu is needed.
I have not placed it in the constructor to prevent accidental invocation.

      initalise: ->
        applicationMenu = this.loadMenuFile('./application_menu')
        @menu.setApplicationMenu(applicationMenu)
That will be everything. A wrapper to create menu items would be nice.
Unfortunately, the constructor has many options reducing the utility.
