 // The MIT License (MIT) Copyright (c) 2015 Jam3

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

/// @param texel `(1/imageWidth,1/imageHeight)*direction`, where
///        `direction` is `(1.0,0.0)` for horizontal or `(0.0,1.0)` for
///        vertical blur.
/// @source https://github.com/Jam3/glsl-fast-gaussian-blur
Vec4 xBlur9(Texture2D image, Vec2 uv, Vec2 texel)
{
	Vec4 color = Vec4(0.0, 0.0, 0.0, 0.0);
	Vec2 off1 = texel * 1.3846153846;
	Vec2 off2 = texel * 3.2307692308;
	color += Sample(image, uv) * 0.2270270270;
	color += Sample(image, uv + off1) * 0.3162162162;
	color += Sample(image, uv - off1) * 0.3162162162;
	color += Sample(image, uv + off2) * 0.0702702703;
	color += Sample(image, uv - off2) * 0.0702702703;
	return color;
}