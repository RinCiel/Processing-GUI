# Processing-GUI
GUI made in Processing for CS final project. The theme inspired by [Dear ImGUI](https://github.com/ocornut/imgui). <br>

Group Members: Eric Lin, Owen Kuchinad, Sam Cowan

## Instructions
Upon running the project you will see the “GoL Menu” GUI on the screen over a grid for Conway’s Game of Life  (created by Eric and Owen last semester). The GUI has replaced what was previously BRC code. <br><br>
Before running the simulation w/ the start or step buttons, you should set up the game using the GUI controls. <br><br>
First, you can use the sliders on the “Setup” tab to change the size of the grid and the framerate. You can draw in cells to the screen by pressing them. 
You can erase cells by switching the edit mode using the dropdown at the top of the GUI tab “Options” (and switch back to draw again). <br>
The “Population” tab controls other methods of populating the screen - you can set the “percent alive” slider at the top to randomly populate the screen with that percentage of cells. <br><br>
Also, you can use the samples dropdown to choose a preset sample to populate the game with. 
If you choose a sample that requires the highlife rule, you can switch from Conway’s rule to Highlife rule using the radio buttons at the bottom of the “Options” tab. 
You can also edit the color that cells turn after living for a while using the color picker.<br><br>
Finally, you can run the simulation with the four buttons on the “Setup” tab. 
The start button begins a nonstop simulation at the chosen framerate. The step button moves the simulation forward by one generation. 
The stop button will freeze the simulation after it has been started, and the clear button will stop the simulation and clear the grid of cells. 
The population and generation numbers are stored in the setup tab and update with every generation.

## Features Added Since MVP
- Hotkeys to move GUI around the screen easier - arrow keys and home button
- Color Picker tab element
- Bug fixes for slider, dropdown, checkbox, radio, button
- Implemented game of life to demo various features of the GUI

## Notes

- The checkbox and toggle tab elements do exist but aren't part of the GoL demo. If you want to check them out you can add a checkbox and toggle with their constructors. <br><br>
- The game of life was not created for this project, rather the implementation of our GUI into the game is what we did. <br><br>
- Similarly, the framework for the color picker was not from this project, rather what we did is change it into a tab element to work in the GUI.
