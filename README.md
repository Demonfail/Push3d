# X
A collection of useful scripts/shaders/objects for GameMaker Studio 2. Just scroll down a bit and see for yourself what you can grab ;) You have no financial obligations towards me for using code from this repo, but if you want to show your appreciation, you can throw me a coin or two at https://www.paypal.me/kraifpatrik/1USD.

# Table of Contents
- [Reference](#reference) 
	- [xAssert](#xassert)
	- [xVec2Abs](#xvec2abs)
	- [xVec2Add](#xvec2add)
	- [xVec2ClampLength](#xvec2clamplength)
	- [xVec2Clone](#xvec2clone)
	- [xVec2Create](#xvec2create)
	- [xVec2CreateBarycentric](#xvec2createbarycentric)
	- [xVec2Dot](#xvec2dot)
	- [xVec2Equals](#xvec2equals)
	- [xVec2Length](#xvec2length)
	- [xVec2LengthSqr](#xvec2lengthsqr)
	- [xVec2Lerp](#xvec2lerp)
	- [xVec2MaxComponent](#xvec2maxcomponent)
	- [xVec2Maximize](#xvec2maximize)
	- [xVec2MinComponent](#xvec2mincomponent)
	- [xVec2Minimize](#xvec2minimize)
	- [xVec2Multiply](#xvec2multiply)
	- [xVec2Normalize](#xvec2normalize)
	- [xVec2Reflect](#xvec2reflect)
	- [xVec2Scale](#xvec2scale)
	- [xVec2Subtract](#xvec2subtract)
	- [xVec2Transform](#xvec2transform)
	- [xVec4Transform](#xvec4transform)

# Reference
## xAssert
```
xAssert(exp, msg)
```
Shows the error message if the expression is not a `real` (`bool`) or equals to `0` (`false`) and aborts the game.

### Arguments:
Name | Type | Description
---- | ---- | -----------
exp | `any` | The expression to assert.
msg | `string` | The error message.

## xVec2Abs
```
xVec2Abs(v)
```
Sets vector's components to their absolute value.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector.

## xVec2Add
```
xVec2Add(v1, v2)
```
Adds vectors `v1`, `v2` and stores the result into `v1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector.
v2 | `array` | The second vector.

## xVec2ClampLength
```
xVec2ClampLength(v, min, max)
```
Clamps vector's length between `min` and `max`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector.
min | `real` | The minimum vector length.
max | `real` | The maximum vector length.

## xVec2Clone
```
xVec2Clone(v)
```
Creates a clone of the vector.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector.

### Returns:
`array`: The created clone.

## xVec2Create
```
xVec2Create(x, y)
```
Creates a new vector with given components.

### Arguments:
Name | Type | Description
---- | ---- | -----------
x | `real` | The first vector component.
y | `real` | The second vector component.

### Returns:
`array`: The created vector.

### Note:
One could also just write `[x, y]`, which would give the same result.

## xVec2CreateBarycentric
```
xVec2CreateBarycentric(v1, v2, v3, f, g)
```
Creates a new vector using barycentric coordinates, following formula `v1 + f(v2-v1) + g(v3-v1)`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first point of triangle.
v2 | `array` | The second point of triangle.
v3 | `array` | The third point of triangle.
f | `real` | The first weighting factor.
g | `real` | The second weighting factor.

### Returns:
`array`: The created vector.

## xVec2Dot
```
xVec2Dot(v1, v2)
```
Gets the dot product of vectors `v1` and `v2`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector.
v2 | `array` | The second vector.

### Returns:
`real`: The dot product.

## xVec2Equals
```
xVec2Equals(v1, v2)
```
Gets whether vectors `v1` and `v2` are equal.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector.
v2 | `array` | The second vector.

### Returns:
`bool`: True if the vectors are equal.

## xVec2Length
```
xVec2Length(v)
```
Gets length of the vector.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector.
The | `real` | vector's length.

## xVec2LengthSqr
```
xVec2LengthSqr(v)
```
Gets squared length of the vector.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector.
The | `real` | vector's squared length.

## xVec2Lerp
```
xVec2Lerp(v1, v2, s)
```
Linearly interpolates between vectors `v1`, `v2` and stores the resulting vector into `v1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector.
v2 | `array` | The second vector.
s | `real` | The interpolation factor.

## xVec2MaxComponent
```
xVec2MaxComponent(v)
```
Gets the largest component of the vector.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector.

### Returns:
`real`: The vetor's largest component.

### Example:
Here the `_max` variable would be equal to `2`.
```
var _vec = [1, 2];
var _max = xVec2MaxComponent(_vec);
```

## xVec2Maximize
```
xVec2Maximize(v1, v2)
```
Gets a vector that is made up of the largest components of the vectors `v1`, `v2` and stores it into `v1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector.
v2 | `array` | The second vector.

### Example:
This would make the vector `v1` equal to `[2, 4]`.
```
var _v1 = [1, 4];
var _v2 = [2, 3];
xVec2Maximize(_v1, _v2);
```

## xVec2MinComponent
```
xVec2MinComponent(v)
```
Gets the smallest component of the vector.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector.

### Returns:
`real`: The vetor's smallest component.

### Example:
Here the `_min` variable would be equal to `1`.
```
var _vec = [1, 2];
var _min = xVec2MaxComponent(_vec);
```

## xVec2Minimize
```
xVec2Minimize(v1, v2)
```
Gets a vector that is made up of the smallest components of the vectors `v1`, `v2` and stores it into `v1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector.
v2 | `array` | The second vector.

### Example:
This would make the vector `v1` equal to `[1, 3]`.
```
var _v1 = [1, 4];
var _v2 = [2, 3];
xVec2Minimize(_v1, _v2);
```

## xVec2Multiply
```
xVec2Multiply(v1, v2)
```
Multiplies the vectors `v1`, `v2` componentwise and stores the result into `v1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector.
v2 | `array` | The second vector.

### Example:
This would make the vector `v1` equal to `[3, 8]`.
```
var _v1 = [1, 2];
var _v2 = [3, 4];
xVec2Multiply(_v1, _v2);
```

## xVec2Normalize
```
xVec2Normalize(v)
```
Normalizes the vector (makes the vector's length equal to `1`).

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector to be normalized.

## xVec2Reflect
```
xVec2Reflect(v, n)
```
Reflects the incident vector `v` off the normal vector `n`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The incident vector.
v | `array` | The normal vector.

## xVec2Scale
```
xVec2Scale(v, s)
```
Scales the vector's components by the given value.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector.
s | `real` | The value to scale the components by.

## xVec2Subtract
```
xVec2Subtract(v1, v2)
```
Subtracts vector `v2` from `v1` and stores the result into `v1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The vector to subtract from.
v2 | `array` | The vector to subtract.

## xVec2Transform
```
xVec2Transform(v, m)
```
Transforms a 4D vector `[vX, vY, 0, 1]` by the matrix `m` and stores `[x, y]` of the resulting vector to `v`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector to transform.
m | `array` | The transform matrix.

## xVec4Transform
```
xVec4Transform(v, m)
```
Transforms the vector by the matrix.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector to transform.
m | `array` | The transform matrix.

