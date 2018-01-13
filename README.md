# X
A collection of useful scripts/shaders/objects for GameMaker Studio 2. Just scroll down a bit and see for yourself what you can grab ;) You have no financial obligations towards me for using anything from this repo, but if you want to show either your appreciation or hate, you can throw some coins at my face on https://www.paypal.me/kraifpatrik/1USD!

# Table of Contents
- [Reference](#reference) 
	- [xAssert](#xassert)
	- [xMatrixAddComponentwise](#xmatrixaddcomponentwise)
	- [xMatrixClone](#xmatrixclone)
	- [xMatrixCreate](#xmatrixcreate)
	- [xMatrixCreateFromColumns](#xmatrixcreatefromcolumns)
	- [xMatrixCreateFromRows](#xmatrixcreatefromrows)
	- [xMatrixDeterminant](#xmatrixdeterminant)
	- [xMatrixInverse](#xmatrixinverse)
	- [xMatrixMultiplyComponentwise](#xmatrixmultiplycomponentwise)
	- [xMatrixScale](#xmatrixscale)
	- [xMatrixSubtractComponentwise](#xmatrixsubtractcomponentwise)
	- [xMatrixToEuler](#xmatrixtoeuler)
	- [xMatrixTranspose](#xmatrixtranspose)
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
	- [xVec3Abs](#xvec3abs)
	- [xVec3Add](#xvec3add)
	- [xVec3ClampLength](#xvec3clamplength)
	- [xVec3Clone](#xvec3clone)
	- [xVec3Create](#xvec3create)
	- [xVec3CreateBarycentric](#xvec3createbarycentric)
	- [xVec3Cross](#xvec3cross)
	- [xVec3Dot](#xvec3dot)
	- [xVec3Equals](#xvec3equals)
	- [xVec3Length](#xvec3length)
	- [xVec3LengthSqr](#xvec3lengthsqr)
	- [xVec3Lerp](#xvec3lerp)
	- [xVec3MaxComponent](#xvec3maxcomponent)
	- [xVec3Maximize](#xvec3maximize)
	- [xVec3MinComponent](#xvec3mincomponent)
	- [xVec3Minimize](#xvec3minimize)
	- [xVec3Multiply](#xvec3multiply)
	- [xVec3Normalize](#xvec3normalize)
	- [xVec3OrthoNormalize](#xvec3orthonormalize)
	- [xVec3Project](#xvec3project)
	- [xVec3Reflect](#xvec3reflect)
	- [xVec3Scale](#xvec3scale)
	- [xVec3Slerp](#xvec3slerp)
	- [xVec3Subtract](#xvec3subtract)
	- [xVec3Transform](#xvec3transform)
	- [xVec3Unproject](#xvec3unproject)
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

## xMatrixAddComponentwise
```
xMatrixAddComponentwise(m1, m2)
```
Adds matrices `m1`, `m2` componentwise and stores the result to `m1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
m1 | `array` | The first matrix.
m2 | `array` | The second matrix.

## xMatrixClone
```
xMatrixClone(m)
```
Creates a clone of the matrix.

### Arguments:
Name | Type | Description
---- | ---- | -----------
m | `array` | The matrix to create a clone of.

### Returns:
`array`: The created matrix.

## xMatrixCreate
```
xMatrixCreate(m00, m01, m02, m03, m10, m11, m12, m13, m20, m21, m22, m23, m30, m31, m32, m33)
```
Creates a matrix with given components.

### Arguments:
Name | Type | Description
---- | ---- | -----------
m00 | `real` | 
m10 | `real` | 
m20 | `real` | 
m30 | `real` | 

### Returns:
`array`: The created matrix.

## xMatrixCreateFromColumns
```
xMatrixCreateFromColumns(c0, c1, c2, c3)
```
Creates a matrix with specified columns.

### Arguments:
Name | Type | Description
---- | ---- | -----------
c0 | `array` | The first column of the matrix.
c1 | `array` | The second column of the matrix.
c2 | `array` | The third column of the matrix.
c3 | `array` | The fourth column of the matrix.

### Returns:
`array`: The created matrix.

## xMatrixCreateFromRows
```
xMatrixCreateFromRows(r0, r1, r2, r3)
```
Creates a matrix with specified rows.

### Arguments:
Name | Type | Description
---- | ---- | -----------
r0 | `array` | The first row of the matrix.
r1 | `array` | The second row of the matrix.
r2 | `array` | The third row of the matrix.
r3 | `array` | The fourth row of the matrix.

### Returns:
`array`: The created matrix.

## xMatrixDeterminant
```
xMatrixDeterminant(m)
```
Gets the determinant of the matrix.

### Arguments:
Name | Type | Description
---- | ---- | -----------
m | `array` | The matrix.

### Returns:
`real`: The determinant of the matrix.

## xMatrixInverse
```
xMatrixInverse(m)
```
Inverts the matrix.

### Arguments:
Name | Type | Description
---- | ---- | -----------
m | `array` | The matrix.

## xMatrixMultiplyComponentwise
```
xMatrixMultiplyComponentwise(m1, m2)
```
Multiplies matrices `m1`, `m2` componentwise and stores the result to `m1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
m1 | `array` | The first matrix.
m2 | `array` | The second matrix.

## xMatrixScale
```
xMatrixScale(m, s)
```
Scales the matrix by the value.

### Arguments:
Name | Type | Description
---- | ---- | -----------
m | `array` | The matrix to scale.
s | `real` | The value to scale the matrix by.

## xMatrixSubtractComponentwise
```
xMatrixSubtractComponentwise(m1, m2)
```
Subtracts matrices `m1`, `m2` componentwise and stores the result to `m1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
m1 | `array` | The first matrix.
m2 | `array` | The second matrix.

## xMatrixToEuler
```
xMatrixToEuler(m)
```
Gets euler angles from the YXZ rotation matrix.

### Arguments:
Name | Type | Description
---- | ---- | -----------
m | `array` | The YXZ rotation matrix.

### Returns:
`array`: An array containing the euler angles `[rotX, rotY, rotZ]`.

## xMatrixTranspose
```
xMatrixTranspose(m)
```
Transposes the matrix.

### Arguments:
Name | Type | Description
---- | ---- | -----------
m | `array` | The matrix to be transposed.

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

## xVec3Abs
```
xVec3Abs(v)
```
Sets vector's components to their absolute value.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector.

## xVec3Add
```
xVec3Add(v1, v2)
```
Adds vectors `v1`, `v2` and stores the result into `v1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector.
v2 | `array` | The second vector.

## xVec3ClampLength
```
xVec3ClampLength(v, min, max)
```
Clamps vector's length between `min` and `max`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector.
min | `real` | The minimum vector length.
max | `real` | The maximum vector length.

## xVec3Clone
```
xVec3Clone(v)
```
Creates a clone of the vector.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector.

### Returns:
`array`: The created clone.

## xVec3Create
```
xVec3Create(x, y, z)
```
Creates a new vector with given components.

### Arguments:
Name | Type | Description
---- | ---- | -----------
x | `real` | The first vector component.
y | `real` | The second vector component.
z | `real` | The third vector component.

### Returns:
`array`: The created vector.

### Note:
One could also just write `[x, y, z]`, which would give the same result.

## xVec3CreateBarycentric
```
xVec3CreateBarycentric(v1, v2, v3, f, g)
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

## xVec3Cross
```
xVec3Cross(v1, v2)
```
Gets the cross product of the vectors `v1`, `v2` and stores it to `v1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector.
v2 | `array` | The second vector.

## xVec3Dot
```
xVec3Dot(v1, v2)
```
Gets the dot product of vectors `v1` and `v2`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector.
v2 | `array` | The second vector.

### Returns:
`real`: The dot product.

## xVec3Equals
```
xVec3Equals(v1, v2)
```
Gets whether vectors `v1` and `v2` are equal.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector.
v2 | `array` | The second vector.

### Returns:
`bool`: True if the vectors are equal.

## xVec3Length
```
xVec3Length(v)
```
Gets length of the vector.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector.
The | `real` | vector's length.

## xVec3LengthSqr
```
xVec3LengthSqr(v)
```
Gets squared length of the vector.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector.
The | `real` | vector's squared length.

## xVec3Lerp
```
xVec3Lerp(v1, v2, s)
```
Linearly interpolates between vectors `v1`, `v2` and stores the resulting vector into `v1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector.
v2 | `array` | The second vector.
s | `real` | The interpolation factor.

## xVec3MaxComponent
```
xVec3MaxComponent(v)
```
Gets the largest component of the vector.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector.

### Returns:
`real`: The vetor's largest component.

### Example:
Here the `_max` variable would be equal to `3`.
```
var _vec = [1, 2, 3];
var _max = xVec3MaxComponent(_vec);
```

## xVec3Maximize
```
xVec3Maximize(v1, v2)
```
Gets a vector that is made up of the largest components of the vectors `v1`, `v2` and stores it into `v1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector.
v2 | `array` | The second vector.

### Example:
This would make the vector `v1` equal to `[2, 4, 6]`.
```
var _v1 = [1, 4, 5];
var _v2 = [2, 3, 6];
xVec3Maximize(_v1, _v2);
```

## xVec3MinComponent
```
xVec3MinComponent(v)
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
var _vec = [1, 2, 3];
var _min = xVec3MinComponent(_vec);
```

## xVec3Minimize
```
xVec3Minimize(v1, v2)
```
Gets a vector that is made up of the smallest components of the vectors `v1`, `v2` and stores it into `v1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector.
v2 | `array` | The second vector.

### Example:
This would make the vector `v1` equal to `[1, 3, 5]`.
```
var _v1 = [1, 4, 5];
var _v2 = [2, 3, 6];
xVec3Minimize(_v1, _v2);
```

## xVec3Multiply
```
xVec3Multiply(v1, v2)
```
Multiplies the vectors `v1`, `v2` componentwise and stores the result into `v1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector.
v2 | `array` | The second vector.

### Example:
This would make the vector `v1` equal to `[4, 10, 18]`.
```
var _v1 = [1, 2, 3];
var _v2 = [4, 5, 6];
xVec3Multiply(_v1, _v2);
```

## xVec3Normalize
```
xVec3Normalize(v)
```
Normalizes the vector (makes the vector's length equal to `1`).

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector to be normalized.

## xVec3OrthoNormalize
```
xVec3OrthoNormalize(v1, v2)
```
Orthonormalizes the vectors using the Gram–Schmidt process.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector.
v2 | `array` | The second vector.

### Returns:
`bool`: True if the vectors were orthonormalized.

## xVec3Project
```
xVec3Project(vector, screen, world, view, projection)
```
Projects the vector from world space into screen space.

### Arguments:
Name | Type | Description
---- | ---- | -----------
vector | `array` | The vector.
screen | `array` | An array containing `[screenWidth, screenHeight]`.
world | `array` | The world matrix.
view | `array` | The view matrix.
projection | `array` | The projection matrix.

## xVec3Reflect
```
xVec3Reflect(v, n)
```
Reflects the incident vector `v` off the normal vector `n`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The incident vector.
v | `array` | The normal vector.

## xVec3Scale
```
xVec3Scale(v, s)
```
Scales the vector's components by the given value.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector.
s | `real` | The value to scale the components by.

## xVec3Slerp
```
xVec3Slerp(v1, v2, s)
```
Performs a spherical linear interpolation between the vectors `v1`, `v2` and stores the result to `v1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector. Should be normalized!
v2 | `array` | The second vector. Should be normalized!
s | `real` | The slerping factor.

## xVec3Subtract
```
xVec3Subtract(v1, v2)
```
Subtracts vector `v2` from `v1` and stores the result into `v1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The vector to subtract from.
v2 | `array` | The vector to subtract.

## xVec3Transform
```
xVec3Transform(v, m)
```
Transforms a 4D vector `[vX, vY, vZ, 1]` by the matrix `m` and stores `[x, y, z]` of the resulting vector to `v`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector to transform.
m | `array` | The transform matrix.

## xVec3Unproject
```
xVec3Unproject(vector, screen, world, view, projection)
```
Unprojects the vector from screen space to world space.

### Arguments:
Name | Type | Description
---- | ---- | -----------
vector | `array` | The vector in screen space.
screen | `array` | An array containing `[screenWidth, screenHeight]`.
world | `array` | The world matrix.
view | `array` | The view matrix.
projection | `array` | The projection matrix.

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

