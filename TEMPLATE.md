# X
A collection of useful scripts/shaders/objects for GameMaker Studio 2, mainly targetting 3D math and rendering. Just scroll down a bit and see for yourself what you can grab ;)

Maintained by: [kraifpatrik](https://github.com/kraifpatrik)
Donate: [PayPal.Me](https://www.paypal.me/kraifpatrik/1usd)

## List of features
Since the reference is getting quite long, I will try to keep here a compressed version so you can faster check out whether this repo has something for you:

 * Extensive math library (Matrices, Quaternions, Vec2, Vec3, Vec4)
 * Standalone shader library with some handy functions (see [Xshaders](https://github.com/GameMakerDiscord/x/tree/master/X/Xshaders))
 * Mesh functionality:
   * Load from obj file or custom json
   * Save mesh as json
   * Calculate TBN matrix (allows for normal mapping)
   * Convert mesh to a vertex buffer
 * Deferred rendering pipeline (heavily WIP, I wouldn't recommend using just yet):
   * Directional light with shadow mapping
   * Point lights
   * Normal mapping
   * Emissive textures
   * Light bloom
   * Prepared forward pass for rendering stuff that can't go through the deferred one
 * Screen Space Ambient Occlusion (SSAO):
   * Put into standalone scripts and shaders, so it should be easy to implement it into your game
 * Color grading through LUT
 * Chromatic aberration

# Table of Contents
- [Reference](#reference) 
<REFERENCE_TOC>

# Reference
<REFERENCE>