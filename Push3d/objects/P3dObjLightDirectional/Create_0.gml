/// @desc Init
lightVec = [0.5, 0.5, -0.5];
p3d_vec3_normalize(lightVec);

color     = c_white;
intensity = 1;

shadowMapRes  = 1024;
shadowMapArea = 1024;
shadowmap     = noone;