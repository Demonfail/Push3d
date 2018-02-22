# X
A collection of useful scripts/shaders/objects for GameMaker Studio 2, mainly targetting 3D math and rendering. Just scroll down a bit and see for yourself what you can grab ;) Also, you gain no financial obligations towards me for using anything from this repo, but if you want to show either your appreciation or hate, you can just throw some coins at my face on https://www.paypal.me/kraifpatrik/1USD!

Maintained by: kraifpatrik

# Table of Contents
- [Xpanda](#xpanda)
- [Reference](#reference) 
<REFERENCE_TOC>

# Xpanda
Xpanda is a tool that allows for including shader code from other files. This can be handy when you have a set of functions shared between multiple shaders. It can become very tedious to mantain such functions, when you have copy-paste any change over to many different shaders. With Xpanda, you can place the shared code into a separate file, place a simple command into the original shader and then expand the command with the contents of the separate file.

## How to use
 * Create a folder called `Xshaders` in the project directory (right where the `*.yyp` file is).
 * Create a new file inside the `Xshaders` folder, for example `Common.fsh`. The file extension name does not play any role here, but I recommend using `.vsh` for code that is supposed to be included in vertex shaders and `.fsh` for fragment shader code.
 * Cut some code that you want to share between fragment shaders and paste it into the `Common.fsh` (or what you have called the file).
 * Replace all occurences of the code with `#pragma include("Common.fsh")` (or what you have called the file).
 * Run `Xpanda.py` to expand the pragma includes with the contents of the included file (and repeat this every time you make any changes to the includable files, Xpanda automatically takes care of removing the old code before expanding it again).

**Note:** You can nest `#pragma include(...)` in your included files as well.

## Warning
Xpanda is currently in a heavy WIP stage and it's not ready for common use in projects. Currently path to the GMS2 project is hardcoded to this one (the X project)!

## TODOs
 * Parametrize path to the GMS2 project.
 * Handle typename translations to allow for using snippets in both HLSL and GLSL shaders.
   * For example `Vec4` in the snippet would be translated to `vec4` in GLSL and `float4` in HLSL.

# Reference
<REFERENCE>