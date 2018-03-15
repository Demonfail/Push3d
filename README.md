# X
A collection of useful scripts/shaders/objects for GameMaker Studio 2.

Maintained by: [kraifpatrik](https://github.com/kraifpatrik)
Donate: [PayPal.Me](https://www.paypal.me/kraifpatrik/1usd)

# Latest Screenshot
![The latest screenshot](https://raw.githubusercontent.com/GameMakerDiscord/x/master/ScreenshotLatest.png)

# Table of Contents
- [Reference](#reference) 
	- [xAssert](#xassert)
	- [xAssertDsExists](#xassertdsexists)
	- [xColorAlphaToArgb](#xcoloralphatoargb)
	- [xColorArgbToAlpha](#xcolorargbtoalpha)
	- [xColorFromArgb](#xcolorfromargb)
	- [xColorRgbToBgr](#xcolorrgbtobgr)
	- [xCubemapCreate](#xcubemapcreate)
	- [xDsListAddList](#xdslistaddlist)
	- [xDsListAddMap](#xdslistaddmap)
	- [xDsListAddUnique](#xdslistaddunique)
	- [xDsListInsertList](#xdslistinsertlist)
	- [xDsListInsertMap](#xdslistinsertmap)
	- [xDsListInsertUnique](#xdslistinsertunique)
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
	- [xMeshCreate](#xmeshcreate)
	- [xMeshDestroy](#xmeshdestroy)
	- [xMeshInit](#xmeshinit)
	- [xMeshLoadFromJson](#xmeshloadfromjson)
	- [xMeshLoadFromObj](#xmeshloadfromobj)
	- [xMeshRecalculateTangentW](#xmeshrecalculatetangentw)
	- [xMeshSaveAsJson](#xmeshsaveasjson)
	- [xMeshToVBuffer](#xmeshtovbuffer)
	- [xQuaternionAdd](#xquaternionadd)
	- [xQuaternionClone](#xquaternionclone)
	- [xQuaternionConjugate](#xquaternionconjugate)
	- [xQuaternionCreate](#xquaternioncreate)
	- [xQuaternionCreateFromAxisAngle](#xquaternioncreatefromaxisangle)
	- [xQuaternionCreateFromToRotation](#xquaternioncreatefromtorotation)
	- [xQuaternionCreateIdentity](#xquaternioncreateidentity)
	- [xQuaternionCreateLookRotation](#xquaternioncreatelookrotation)
	- [xQuaternionDot](#xquaterniondot)
	- [xQuaternionInverse](#xquaternioninverse)
	- [xQuaternionLength](#xquaternionlength)
	- [xQuaternionLengthSqr](#xquaternionlengthsqr)
	- [xQuaternionLerp](#xquaternionlerp)
	- [xQuaternionMultiply](#xquaternionmultiply)
	- [xQuaternionNormalize](#xquaternionnormalize)
	- [xQuaternionRotate](#xquaternionrotate)
	- [xQuaternionScale](#xquaternionscale)
	- [xQuaternionSubtract](#xquaternionsubtract)
	- [xQuaternionToAngle](#xquaterniontoangle)
	- [xQuaternionToAxis](#xquaterniontoaxis)
	- [xQuaternionToMatrix](#xquaterniontomatrix)
	- [xSmoothstep](#xsmoothstep)
	- [xSsaoCreateKernel](#xssaocreatekernel)
	- [xSsaoDraw](#xssaodraw)
	- [xSsaoFree](#xssaofree)
	- [xSsaoInit](#xssaoinit)
	- [xSsaoMakeNoiseSurface](#xssaomakenoisesurface)
	- [xStringJoin](#xstringjoin)
	- [xStringJoinArray](#xstringjoinarray)
	- [xStringJoinList](#xstringjoinlist)
	- [xStringRemovePart](#xstringremovepart)
	- [xStringSplitOnFirst](#xstringsplitonfirst)
	- [xSurfaceBlur](#xsurfaceblur)
	- [xSurfaceCheck](#xsurfacecheck)
	- [xSurfaceCreateFromSprite](#xsurfacecreatefromsprite)
	- [xVec2Abs](#xvec2abs)
	- [xVec2Add](#xvec2add)
	- [xVec2Ceil](#xvec2ceil)
	- [xVec2ClampLength](#xvec2clamplength)
	- [xVec2Clone](#xvec2clone)
	- [xVec2Create](#xvec2create)
	- [xVec2CreateBarycentric](#xvec2createbarycentric)
	- [xVec2Dot](#xvec2dot)
	- [xVec2Equals](#xvec2equals)
	- [xVec2Floor](#xvec2floor)
	- [xVec2Frac](#xvec2frac)
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
	- [xVec3Ceil](#xvec3ceil)
	- [xVec3ClampLength](#xvec3clamplength)
	- [xVec3Clone](#xvec3clone)
	- [xVec3Create](#xvec3create)
	- [xVec3CreateBarycentric](#xvec3createbarycentric)
	- [xVec3Cross](#xvec3cross)
	- [xVec3Dot](#xvec3dot)
	- [xVec3Equals](#xvec3equals)
	- [xVec3Floor](#xvec3floor)
	- [xVec3Frac](#xvec3frac)
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
	- [xVec4Abs](#xvec4abs)
	- [xVec4Add](#xvec4add)
	- [xVec4Ceil](#xvec4ceil)
	- [xVec4ClampLength](#xvec4clamplength)
	- [xVec4Clone](#xvec4clone)
	- [xVec4Create](#xvec4create)
	- [xVec4CreateBarycentric](#xvec4createbarycentric)
	- [xVec4Dot](#xvec4dot)
	- [xVec4Equals](#xvec4equals)
	- [xVec4Floor](#xvec4floor)
	- [xVec4Frac](#xvec4frac)
	- [xVec4Length](#xvec4length)
	- [xVec4LengthSqr](#xvec4lengthsqr)
	- [xVec4Lerp](#xvec4lerp)
	- [xVec4MaxComponent](#xvec4maxcomponent)
	- [xVec4Maximize](#xvec4maximize)
	- [xVec4MinComponent](#xvec4mincomponent)
	- [xVec4Minimize](#xvec4minimize)
	- [xVec4Multiply](#xvec4multiply)
	- [xVec4Normalize](#xvec4normalize)
	- [xVec4Scale](#xvec4scale)
	- [xVec4Subtract](#xvec4subtract)
	- [xVec4Transform](#xvec4transform)
	- [xXmlElementAddChild](#xxmlelementaddchild)
	- [xXmlElementCreate](#xxmlelementcreate)
	- [xXmlElementDestroy](#xxmlelementdestroy)
	- [xXmlElementFind](#xxmlelementfind)
	- [xXmlElementFindAll](#xxmlelementfindall)
	- [xXmlElementFindFirstAttribute](#xxmlelementfindfirstattribute)
	- [xXmlElementFindNextAttribute](#xxmlelementfindnextattribute)
	- [xXmlElementGetAttribute](#xxmlelementgetattribute)
	- [xXmlElementGetAttributeCount](#xxmlelementgetattributecount)
	- [xXmlElementGetChild](#xxmlelementgetchild)
	- [xXmlElementGetChildCount](#xxmlelementgetchildcount)
	- [xXmlElementGetName](#xxmlelementgetname)
	- [xXmlElementGetParent](#xxmlelementgetparent)
	- [xXmlElementGetValue](#xxmlelementgetvalue)
	- [xXmlElementHasAttribute](#xxmlelementhasattribute)
	- [xXmlElementHasValue](#xxmlelementhasvalue)
	- [xXmlElementRemoveAttribute](#xxmlelementremoveattribute)
	- [xXmlElementSetAttribute](#xxmlelementsetattribute)
	- [xXmlElementSetName](#xxmlelementsetname)
	- [xXmlElementSetValue](#xxmlelementsetvalue)
	- [xXmlParse](#xxmlparse)
	- [xXmlRead](#xxmlread)
	- [xXmlString](#xxmlstring)
	- [xXmlWrite](#xxmlwrite)

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

## xAssertDsExists
```
xAssertDsExists(id, type, msg)
```
Checks if the ds of given id and type exists. If it does not, then aborts the game, showing the error message.

### Arguments:
Name | Type | Description
---- | ---- | -----------
id | `real` | The id of the ds.
type | `real` | The ds type (`ds_type_map`, `ds_type_list`, ...).
msg | `string` | The error message.

### Example:
```
var _map = ds_map_create();
xAssertDsExists(_map, ds_type_map, "This should pass, since we just created it.");
ds_map_destroy(_map);
xAssertDsExists(_map, ds_type_map, "This will abort the game just as expected.");
```

## xColorAlphaToArgb
```
xColorAlphaToArgb(color, alpha)
```
Converts the color and aplha into a ARGB color.

### Arguments:
Name | Type | Description
---- | ---- | -----------
color | `real` | The color.
alpha | `real` | The alpha.

### Returns:
`real`: The ARGB color.

## xColorArgbToAlpha
```
xColorArgbToAlpha(argb)
```
Converts ARGB color to alpha.

### Arguments:
Name | Type | Description
---- | ---- | -----------
argb | `real` | The ARGB color.

### Returns:
`real`: The alpha.

## xColorFromArgb
```
xColorFromArgb(argb)
```
Converts ARGB color to BGR color.

### Arguments:
Name | Type | Description
---- | ---- | -----------
argb | `real` | The ARGB color.

### Returns:
`real`: The BGR color.

## xColorRgbToBgr
```
xColorRgbToBgr(color)
```
Converts between RGB and BGR color format.

### Arguments:
Name | Type | Description
---- | ---- | -----------
color | `real` | The BGR or RGB color.

### Returns:
`real`: The resulting color.

## xCubemapCreate
```
xCubemapCreate(posX, negX, posY, negY, posZ, negZ)
```
Creates a cubemap.

### Arguments:
Name | Type | Description
---- | ---- | -----------
posX | `real` | The surface used for the +X (front) side of the cubemap.
negX | `real` | The surface used for the -X (back) side of the cubemap.
posY | `real` | The surface used for the +Y (right) side of the cubemap.
negY | `real` | The surface used for the -Y (left) side of the cubemap.
posZ | `real` | The surface used for the +Z (top) side of the cubemap.
negZ | `real` | The surface used for the -Z (bottom) side of the cubemap.

### Returns:
`array`: An array representing the cubemap.

## xDsListAddList
```
xDsListAddList(l1, l2)
```
Adds the list l2 into the list l1.

### Arguments:
Name | Type | Description
---- | ---- | -----------
l1 | `real` | The list to add into.
l2 | `real` | The list to be added.

## xDsListAddMap
```
xDsListAddMap(list, map)
```
Adds the map into the list.

### Arguments:
Name | Type | Description
---- | ---- | -----------
list | `real` | The list to add into.
map | `real` | The map to be added.

## xDsListAddUnique
```
xDsListAddUnique(list, value)
```
If the value is not in the list, it is added to it.

### Arguments:
Name | Type | Description
---- | ---- | -----------
list | `real` | The id of the list.
value | `any` | The value to be added.

### Returns:
`real`: The index on which has been the value found or -1.

## xDsListInsertList
```
xDsListInsertList(l1, pos, l2)
```
Inserts the list l2 into the list t1 at the given position.

### Arguments:
Name | Type | Description
---- | ---- | -----------
l1 | `real` | The list to inserted into.
pos | `real` | The index to insert the list at.
l2 | `real` | The list to be inserted.

## xDsListInsertMap
```
xDsListInsertMap(list, pos, map)
```
Inserts the map into the list at the given position.

### Arguments:
Name | Type | Description
---- | ---- | -----------
list | `real` | The list to inserted into.
pos | `real` | The index to insert the list at.
map | `real` | The map to be inserted.

## xDsListInsertUnique
```
xDsListInsertUnique(list, value, position)
```
If the value is not in the list, it is inserted to it at given position.

### Arguments:
Name | Type | Description
---- | ---- | -----------
list | `real` | The id of the list.
value | `any` | The value to be added.
position | `real` | The index to insert the value at.

### Returns:
`real`: The index on which has been the value found or -1.

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

## xMeshCreate
```
xMeshCreate()
```
Creates an empty mesh.

### Returns:
`real`: The id of the ds_map containing mesh data.

## xMeshDestroy
```
xMeshDestroy(mesh)
```
Destroys the mesh.

### Arguments:
Name | Type | Description
---- | ---- | -----------
mesh | `real` | The id of the mesh.

## xMeshInit
```
xMeshInit()
```
Initializes mesh functionality.

## xMeshLoadFromJson
```
xMeshLoadFromJson(file)
```
Loads a mesh from a JSON formatted file.

### Arguments:
Name | Type | Description
---- | ---- | -----------
file | `string` | The file to load the mesh from.

### Returns:
`real`: The id of the mesh on success or `noone` on fail.

## xMeshLoadFromObj
```
xMeshLoadFromObj(file)
```
Loads a 3D mesh data into a ds_map from the *.obj file.

### Arguments:
Name | Type | Description
---- | ---- | -----------
file | `string` | The path to the file.

### Returns:
`real`: The id of the mesh on success or `noone` on fail.

## xMeshRecalculateTangentW
```
xMeshRecalculateTangentW(mesh)
```
Recalculates tangent vectors and bitangent sign for the mesh.

### Arguments:
Name | Type | Description
---- | ---- | -----------
mesh | `real` | The id of the mesh.

### Returns:
`bool`: True on success.

## xMeshSaveAsJson
```
xMeshSaveAsJson(mesh, file)
```
Saves the mesh into a JSON formatted file.

### Arguments:
Name | Type | Description
---- | ---- | -----------
mesh | `real` | The id of the mesh.
file | `string` | The file to save the mesh to.

### Returns:
`bool`: True on success.

## xMeshToVBuffer
```
xMeshToVBuffer(mesh, format)
```
Creates a vertex buffer from the mesh.

### Arguments:
Name | Type | Description
---- | ---- | -----------
mesh | `real` | The id of the mesh.
format | `real` | The vertex buffer format.

### Returns:
`real`: The id of the vertex buffer on success or `noone` on fail.

## xQuaternionAdd
```
xQuaternionAdd(q1, q2)
```
Adds the quaternions `q1`, `q2` and stores the result to `q1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
q1 | `array` | The first quaternion.
q2 | `array` | The second quaternion.

## xQuaternionClone
```
xQuaternionClone(v)
```
Creates a clone of the quaternion.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The quaternion.

### Returns:
`array`: The created quaternion.

## xQuaternionConjugate
```
xQuaternionConjugate(q)
```
Conjugates the quaternion.

### Arguments:
Name | Type | Description
---- | ---- | -----------
q | `array` | The quaternion.

## xQuaternionCreate
```
xQuaternionCreate(x, y, z, w)
```
Creates a quaternion.

### Arguments:
Name | Type | Description
---- | ---- | -----------
x | `real` | The x component of the quaternion.
y | `real` | The y component of the quaternion.
z | `real` | The z component of the quaternion.
w | `real` | The w component of the quaternion.

### Returns:
`array`: The created quaternion.

## xQuaternionCreateFromAxisAngle
```
xQuaternionCreateFromAxisAngle(axis, angle)
```
Creates a quaternion form the axis an the angle.

### Arguments:
Name | Type | Description
---- | ---- | -----------
axis | `array` | A 3D vector representing the axis.
angle | `real` | The angle in degrees.

### Returns:
`array`: The created quaternion.

## xQuaternionCreateFromToRotation
```
xQuaternionCreateFromToRotation(from, to)
```
Creates a quaternion that represents rotation from one vector to another.

### Arguments:
Name | Type | Description
---- | ---- | -----------
from | `array` | The 3D "from" vector.
to | `array` | The 3D "to" vector.

### Returns:
`array`: The created quaternion.

## xQuaternionCreateIdentity
```
xQuaternionCreateIdentity()
```
Creates an identity quaternion.

### Returns:
`array`: The created identity quaternion.

## xQuaternionCreateLookRotation
```
xQuaternionCreateLookRotation(forward, up)
```
Creates a quaternion with the specified forward and up vectors. These vectors must not be parallel! If they are, then an identity quaternion will be returned.

### Arguments:
Name | Type | Description
---- | ---- | -----------
forward | `array` | The 3D forward unit vector.
up | `array` | The 3D up unit vector.

### Returns:
`array`: An array representing the quaternion.

## xQuaternionDot
```
xQuaternionDot(q1, q2)
```
Gets the dot product of the two quaternions.

### Arguments:
Name | Type | Description
---- | ---- | -----------
q1 | `array` | The first quaternion.
q2 | `array` | The second quaternion.

### Returns:
`real`: The dot product of the two quaternions.

## xQuaternionInverse
```
xQuaternionInverse(q)
```
Inverts the quaternion.

### Arguments:
Name | Type | Description
---- | ---- | -----------
q | `array` | The quaternion.

## xQuaternionLength
```
xQuaternionLength(q)
```
Gets the length of the quaternion.

### Arguments:
Name | Type | Description
---- | ---- | -----------
q | `array` | The quaternion.

### Returns:
`real`: The length of the quaternion.

## xQuaternionLengthSqr
```
xQuaternionLengthSqr(q)
```
Gets the squared length of the quaternion.

### Arguments:
Name | Type | Description
---- | ---- | -----------
q | `array` | An array representing the quaternion.

### Returns:
`real`: The squared length of the quaternion.

## xQuaternionLerp
```
xQuaternionLerp(q1, q2, s)
```
Performs a linear interpolation between the quaternions `q1`, `q2` and stores the result to `q1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
q1 | `array` | The first quaternion.
q2 | `array` | The second quaternion.
s | `real` | The lerping factor.

## xQuaternionMultiply
```
xQuaternionMultiply(q1, q2)
```
Multiplies the quaternions `q1`, `q2` and stores the result to `q1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
q1 | `array` | The first quaternion.
q2 | `array` | The second quaternion.

## xQuaternionNormalize
```
xQuaternionNormalize(q)
```
Normalizes the quaternion.

### Arguments:
Name | Type | Description
---- | ---- | -----------
q | `array` | The quaternion.

## xQuaternionRotate
```
xQuaternionRotate(q, v)
```
Rotates the 3D vector by the quaternion.

### Arguments:
Name | Type | Description
---- | ---- | -----------
q | `array` | The quaternion.
v | `array` | The 3D vector.

## xQuaternionScale
```
xQuaternionScale(q, s)
```
Scales a quaternion by the value.

### Arguments:
Name | Type | Description
---- | ---- | -----------
q | `array` | The quaternion.
s | `real` | The value to scale the quaternion by.

## xQuaternionSubtract
```
xQuaternionSubtract(q1, q2)
```
Subtracts quaternion `q2` from `q1` and stores the result into `q1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
q1 | `array` | The quaternion to subtract from.
q2 | `array` | The quaternion to subtract.

## xQuaternionToAngle
```
xQuaternionToAngle(q)
```
Gets quaternion angle in degrees.

### Arguments:
Name | Type | Description
---- | ---- | -----------
q | `array` | The quaternion.

### Returns:
`real`: The quaternion angle in degrees.

## xQuaternionToAxis
```
xQuaternionToAxis(q)
```
Creates 3D axis from the quaternion.

### Arguments:
Name | Type | Description
---- | ---- | -----------
q | `array` | The quaternion.

### Returns:
`array`: The created axis as `[x, y, z]`.

## xQuaternionToMatrix
```
xQuaternionToMatrix(q)
```
Creates a rotation matrix from the quaternion.

### Arguments:
Name | Type | Description
---- | ---- | -----------
q | `array` | The quaternion.

### Returns:
`array`: The created rotation matrix.

## xSmoothstep
```
xSmoothstep(e0, e1, x)
```
Performs smooth Hermite interpolation between 0 and 1 when e0 < x < e1.

### Arguments:
Name | Type | Description
---- | ---- | -----------
e0 | `real` | The lower edge of the Hermite function.
e1 | `real` | The upper edge of the Hermite function.
x | `real` | The source value for interpolation.

### Returns:
`real`: The resulting interpolated value.

## xSsaoCreateKernel
```
xSsaoCreateKernel(size)
```
Generates a kernel of random vectors to be used for the SSAO.

### Arguments:
Name | Type | Description
---- | ---- | -----------
size | `real` | Number of vectors in the kernel.

### Returns:
`array`: The created kernel as `[v1X, v1Y, v1Z, v2X, v2Y, v2Z, ..., vnX, vnY, vnZ]`.

## xSsaoDraw
```
xSsaoDraw(surSsao, surWork, surDepth, surNormal, matView, matProj, clipFar)
```
Renders SSAO into the `surSsao` surface.

### Arguments:
Name | Type | Description
---- | ---- | -----------
surSsao | `real` | The surface to draw the SSAO to.
surWork | `real` | A working surface used for blurring the SSAO. Must have the same size as `surSsao`!
surDepth | `real` | A surface containing the scene depth.
surNormal | `real` | A surface containing the scene normals.
matView | `array` | The view matrix used when rendering the scene.
matProj | `array` | The projection matrix used when rendering the scene.
clipFar | `real` | A distance to the far clipping plane (same as in the projection used when rendering the scene).

## xSsaoFree
```
xSsaoFree()
```
Frees resources used by the SSAO from memory.

## xSsaoInit
```
xSsaoInit(radius, bias, power)
```
Initializes resources necessary for the SSAO funcionality.

### Arguments:
Name | Type | Description
---- | ---- | -----------
radius | `real` | Radius of the occlusion effect. Anything further than that won't add to occlusion.
bias | `real` | Depth bias to avoid too much self occlusion. Higher values mean lower self occlusion.
power | `real` | Strength of the occlusion effect. Should be greater than 0.

## xSsaoMakeNoiseSurface
```
xSsaoMakeNoiseSurface(size)
```
Creates a surface containing a random noise for the SSAO.

### Arguments:
Name | Type | Description
---- | ---- | -----------
size | `real` | Size of the noise surface.

### Returns:
`real`: The created noise surface.

## xStringJoin
```
xStringJoin(string, values...)
```
Joins given values together putting the string between each consecutive two.

### Arguments:
Name | Type | Description
---- | ---- | -----------
string | `string` | The string to put between two consecutive values.
values | `any` | Any number of values to be joined.

### Returns:
`string`: The resulting string.

### Example:
```
show_debug_message(
  xStringJoin(" ", "Player", player.name, "took", _damage, "damage!")
);
```
This could show a debug message saying "Player Patrik took 60 damage!".

## xStringJoinArray
```
xStringJoinArray(string, array)
```
Joins values in the array putting the string between each two consecutive values.

### Arguments:
Name | Type | Description
---- | ---- | -----------
string | `string` | The string to put between two consecutive values.
array | `array` | An array of values that you want to join.

### Returns:
`string`: The resulting string.

### Example:
```
show_message("Numbers: " + xStringJoinArray(", ", [1, 2, 3, 4]));
```
This will show a message saying "Numbers: 1, 2, 3, 4".

## xStringJoinList
```
xStringJoinList(string, list)
```
Joins values in the list putting the string between each two consecutive values.

### Arguments:
Name | Type | Description
---- | ---- | -----------
string | `string` | The string to put between two consecutive values.
list | `real` | The id of the list of values that you want to join.

### Returns:
`string`: The resulting string.

### Example:
```
var _numbers = ds_list_create();
ds_list_add(_numbers, 1, 2, 3, 4);
show_message("Numbers: " + xStringJoinList(", ", _numbers));
```
This will show a message saying "Numbers: 1, 2, 3, 4".

## xStringRemovePart
```
xStringRemovePart(string, startStr, endStr)
```
Removes part beginning with startStr and ending with endStr from the string.

### Arguments:
Name | Type | Description
---- | ---- | -----------
startStr | `string` | The start of the part to remove.
endStr | `string` | The end of the part to remove.
string | `string` | The string to remove the part from.

### Returns:
`string`: The string with the given part removed.

## xStringSplitOnFirst
```
xStringSplitOnFirst(string, delimiter)
```
Splits the string in two at the first occurence of the delimiter.

### Arguments:
Name | Type | Description
---- | ---- | -----------
string | `string` | The string to split.
delimiter | `string` | The delimiter.

### Returns:
`array`: An array containing [firstHalf, secondHalf]. If the delimiter is not found in the string, then secondHalf equals empty string and firstHalf is the original string.

## xSurfaceBlur
```
xSurfaceBlur(target, work, scale)
```
Blurs the target surface.

### Arguments:
Name | Type | Description
---- | ---- | -----------
target | `real` | The id of the surface to be blurred.
work | `real` | The id of the working surface. Must have the same size as the target surface.
scale | `real` | The scale of the blur kernel.

## xSurfaceCheck
```
xSurfaceCheck(surface, width, height)
```
Checks whether the surface exists and if it has correct size. Broken surfaces are recreated. Surfaces of wrong size are resized.

### Arguments:
Name | Type | Description
---- | ---- | -----------
surface | `real` | The id of the surface.
width | `real` | The desired width of the surface.
height | `real` | The desired height of the surface.

### Returns:
`real`: The surface id.

## xSurfaceCreateFromSprite
```
xSurfaceCreateFromSprite(sprite, index)
```
Creates a surface from the sprite.

### Arguments:
Name | Type | Description
---- | ---- | -----------
sprite | `real` | The id of the sprite.
index | `real` | The sprite subimage index.

### Returns:
`real`: The created surface.

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

## xVec2Ceil
```
xVec2Ceil(v)
```
Ceils each component of the vector.

### Arguments:
Name | Type | Description
---- | ---- | -----------
The | `array` | vector to ceil.

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
xVec2Create(x[, y])
```
Creates a new vector with given components. If only the first value is supplied, then it is used for every component.

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

## xVec2Floor
```
xVec2Floor(v)
```
Floors each component of the vector.

### Arguments:
Name | Type | Description
---- | ---- | -----------
The | `array` | vector to floor.

## xVec2Frac
```
xVec2Frac(v)
```
Sets each component of the input vector to it's decimal part.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The input vector.

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
This would make the vector `_v1` equal to `[2, 4]`.
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
This would make the vector `_v1` equal to `[1, 3]`.
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
This would make the vector `_v1` equal to `[3, 8]`.
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

## xVec3Ceil
```
xVec3Ceil(v)
```
Ceils each component of the vector.

### Arguments:
Name | Type | Description
---- | ---- | -----------
The | `array` | vector to ceil.

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
xVec3Create(x[, y, z])
```
Creates a new vector with given components. If only the first value is supplied, then it is used for every component.

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

## xVec3Floor
```
xVec3Floor(v)
```
Floors each component of the vector.

### Arguments:
Name | Type | Description
---- | ---- | -----------
The | `array` | vector to floor.

## xVec3Frac
```
xVec3Frac(v)
```
Sets each component of the input vector to it's decimal part.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The input vector.

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
This would make the vector `_v1` equal to `[2, 4, 6]`.
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
This would make the vector `_v1` equal to `[1, 3, 5]`.
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
This would make the vector `_v1` equal to `[4, 10, 18]`.
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

## xVec4Abs
```
xVec4Abs(v)
```
Sets vector's components to their absolute value.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector.

## xVec4Add
```
xVec4Add(v1, v2)
```
Adds vectors `v1`, `v2` and stores the result into `v1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector.
v2 | `array` | The second vector.

## xVec4Ceil
```
xVec4Ceil(v)
```
Ceils each component of the vector.

### Arguments:
Name | Type | Description
---- | ---- | -----------
The | `array` | vector to ceil.

## xVec4ClampLength
```
xVec4ClampLength(v, min, max)
```
Clamps vector's length between `min` and `max`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector.
min | `real` | The minimum vector length.
max | `real` | The maximum vector length.

## xVec4Clone
```
xVec4Clone(v)
```
Creates a clone of the vector.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector.

### Returns:
`array`: The created clone.

## xVec4Create
```
xVec4Create(x, y, z, w)
```
Creates a new vector with given components. If only the first value is supplied, then it is used for every component.

### Arguments:
Name | Type | Description
---- | ---- | -----------
x | `real` | The first vector component.
y | `real` | The second vector component.
z | `real` | The third vector component.
w | `real` | The fourth vector component.

### Returns:
`array`: The created vector.

### Note:
One could also just write `[x, y, z, w]`, which would give the same result.

## xVec4CreateBarycentric
```
xVec4CreateBarycentric(v1, v2, v3, f, g)
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

## xVec4Dot
```
xVec4Dot(v1, v2)
```
Gets the dot product of vectors `v1` and `v2`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector.
v2 | `array` | The second vector.

### Returns:
`real`: The dot product.

## xVec4Equals
```
xVec4Equals(v1, v2)
```
Gets whether vectors `v1` and `v2` are equal.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector.
v2 | `array` | The second vector.

### Returns:
`bool`: True if the vectors are equal.

## xVec4Floor
```
xVec4Floor(v)
```
Floors each component of the vector.

### Arguments:
Name | Type | Description
---- | ---- | -----------
The | `array` | vector to floor.

## xVec4Frac
```
xVec4Frac(v)
```
Sets each component of the input vector to it's decimal part.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The input vector.

## xVec4Length
```
xVec4Length(v)
```
Gets length of the vector.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector.
The | `real` | vector's length.

## xVec4LengthSqr
```
xVec4LengthSqr(v)
```
Gets squared length of the vector.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector.
The | `real` | vector's squared length.

## xVec4Lerp
```
xVec4Lerp(v1, v2, s)
```
Linearly interpolates between vectors `v1`, `v2` and stores the resulting vector into `v1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector.
v2 | `array` | The second vector.
s | `real` | The interpolation factor.

## xVec4MaxComponent
```
xVec4MaxComponent(v)
```
Gets the largest component of the vector.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector.

### Returns:
`real`: The vetor's largest component.

### Example:
Here the `_max` variable would be equal to `4`.
```
var _vec = [1, 2, 3, 4];
var _max = xVec3MaxComponent(_vec);
```

## xVec4Maximize
```
xVec4Maximize(v1, v2)
```
Gets a vector that is made up of the largest components of the vectors `v1`, `v2` and stores it into `v1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector.
v2 | `array` | The second vector.

### Example:
This would make the vector `_v1` equal to `[2, 4, 6, 8]`.
```
var _v1 = [1, 4, 5, 8];
var _v2 = [2, 3, 6, 7];
xVec4Maximize(_v1, _v2);
```

## xVec4MinComponent
```
xVec4MinComponent(v)
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
var _vec = [1, 2, 3, 4];
var _min = xVec4MinComponent(_vec);
```

## xVec4Minimize
```
xVec4Minimize(v1, v2)
```
Gets a vector that is made up of the smallest components of the vectors `v1`, `v2` and stores it into `v1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector.
v2 | `array` | The second vector.

### Example:
This would make the vector `_v1` equal to `[1, 3, 5, 7]`.
```
var _v1 = [1, 4, 5, 8];
var _v2 = [2, 3, 6, 7];
xVec4Minimize(_v1, _v2);
```

## xVec4Multiply
```
xVec4Multiply(v1, v2)
```
Multiplies the vectors `v1`, `v2` componentwise and stores the result into `v1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The first vector.
v2 | `array` | The second vector.

### Example:
This would make the vector `_v1` equal to `[5, 12, 21, 32]`.
```
var _v1 = [1, 2, 3, 4];
var _v2 = [5, 6, 7, 8];
xVec4Multiply(_v1, _v2);
```

## xVec4Normalize
```
xVec4Normalize(v)
```
Normalizes the vector (makes the vector's length equal to `1`).

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector to be normalized.

## xVec4Scale
```
xVec4Scale(v, s)
```
Scales the vector's components by the given value.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v | `array` | The vector.
s | `real` | The value to scale the components by.

## xVec4Subtract
```
xVec4Subtract(v1, v2)
```
Subtracts vector `v2` from `v1` and stores the result into `v1`.

### Arguments:
Name | Type | Description
---- | ---- | -----------
v1 | `array` | The vector to subtract from.
v2 | `array` | The vector to subtract.

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

## xXmlElementAddChild
```
xXmlElementAddChild(element, child)
```
Adds child to the given element.

### Arguments:
Name | Type | Description
---- | ---- | -----------
element | `real` | The id of the element to add the child to.
child | `real` | The id of the child element.

## xXmlElementCreate
```
xXmlElementCreate([name])
```
Creates a new element.

### Arguments:
Name | Type | Description
---- | ---- | -----------
name | `string` | The name of the element.

### Returns:
`real`: The id of the created element.

## xXmlElementDestroy
```
xXmlElementDestroy(element)
```
Destroys the element and all its children.

### Arguments:
Name | Type | Description
---- | ---- | -----------
element | `real` | The id of the element to be destroyed.

## xXmlElementFind
```
xXmlElementFind(rootElement, name)
```
Finds the first element with given name in the given tree of elements.

### Arguments:
Name | Type | Description
---- | ---- | -----------
rootElement | `real` | The root element of the tree.
name | `string` | The name of the element to be found.

### Returns:
`real`: The id of the found element or noone, if no such element has been found.

## xXmlElementFindAll
```
xXmlElementFindAll(rootElement, name)
```
Finds all elements with given name in the given tree of elements.

### Arguments:
Name | Type | Description
---- | ---- | -----------
rootElement | `real` | The root element of the tree.
name | `string` | The name of elements to be found.

### Returns:
`real`: A ds_list containing all found elements.

## xXmlElementFindFirstAttribute
```
xXmlElementFindFirstAttribute(element)
```
Finds the first attribute of the given element.

### Arguments:
Name | Type | Description
---- | ---- | -----------
element | `real` | The id of the element.

### Returns:
`string/undefiend`: The name of the first attribute or undefined, if the element does not have any.

## xXmlElementFindNextAttribute
```
xXmlElementFindNextAttribute(element, attribute)
```
Finds next element attribute.

### Arguments:
Name | Type | Description
---- | ---- | -----------
element | `real` | The id of the element.
attribute | `string` | Name of the current atribute.

### Returns:
`string/undefined`: Name of the next attribute or undefined, if the element does not have more attributes.

## xXmlElementGetAttribute
```
xXmlElementGetAttribute(element, attribute)
```
Gets value of the element attribute.

### Arguments:
Name | Type | Description
---- | ---- | -----------
element | `real` | The id of the element.
attribute | `string` | The name of the attribute.

### Returns:
`real/string/undefiend`: The attribute value.

## xXmlElementGetAttributeCount
```
xXmlElementGetAttributeCount(element)
```
Gets the number of attributes of the given element.

### Arguments:
Name | Type | Description
---- | ---- | -----------
element | `real` | The id of the element.

### Returns:
`real`: The number of attributes of the given element.

## xXmlElementGetChild
```
xXmlElementGetChild(element, n)
```
Gets n-th child of the given element.

### Arguments:
Name | Type | Description
---- | ---- | -----------
element | `real` | The id of the element.
n | `real` | The index (0...numberOfChildren - 1) of the child element.

### Returns:
`real`: The id of the n-th child of the given element.

## xXmlElementGetChildCount
```
xXmlElementGetChildCount(element)
```
Gets number of children of the given element.

### Arguments:
Name | Type | Description
---- | ---- | -----------
element | `real` | The id of the element.

### Returns:
`real`: Number of children of the given element.

## xXmlElementGetName
```
xXmlElementGetName(element)
```
Gets the name of the element.

### Arguments:
Name | Type | Description
---- | ---- | -----------
element | `real` | The id of the element.

### Returns:
`string`: The name of the element.

## xXmlElementGetParent
```
xXmlElementGetParent(element)
```
Gets the parent of the given element.

### Arguments:
Name | Type | Description
---- | ---- | -----------
element | `real` | The id of the element.

### Returns:
`real`: The parent of the element or noone, if the element does not have a parent.

## xXmlElementGetValue
```
xXmlElementGetValue(element)
```
Gets the value of the given element.

### Arguments:
Name | Type | Description
---- | ---- | -----------
element | `real` | The id of the element.

### Returns:
`real/string/undefined`: The element value or undefined, if the element does not have any value.

## xXmlElementHasAttribute
```
xXmlElementHasAttribute(element, attName)
```
Finds the attribute with given name in the element.

### Arguments:
Name | Type | Description
---- | ---- | -----------
element | `real` | The id of the element.
attName | `string` | The name of the attribute.

### Returns:
`boolean`: True if the element has an attribute with given name.

## xXmlElementHasValue
```
xXmlElementHasValue(element)
```
Finds out if the given element has a value.

### Arguments:
Name | Type | Description
---- | ---- | -----------
element | `real` | The id of the element.

### Returns:
`boolean`: True if the element has a value.

## xXmlElementRemoveAttribute
```
xXmlElementRemoveAttribute(element, attribute)
```
Removes given attribute from the element.

### Arguments:
Name | Type | Description
---- | ---- | -----------
element | `real` | The id of the element.
attribute | `string` | The name of the attribute.

## xXmlElementSetAttribute
```
xXmlElementSetAttribute(element, attribute, value)
```
Sets value of the given element attribute to the given value.

### Arguments:
Name | Type | Description
---- | ---- | -----------
element | `real` | The id of the element.
attribute | `string` | The name of the attribute.
value | `real/string/undefined` | The value of the attribute.

## xXmlElementSetName
```
xXmlElementSetName(element, name)
```
Sets name of the element to the given value.

### Arguments:
Name | Type | Description
---- | ---- | -----------
element | `real` | The id of the element.
name | `string` | The new name of the element.

## xXmlElementSetValue
```
xXmlElementSetValue(element, value)
```
Sets value of the element to the given value.

### Arguments:
Name | Type | Description
---- | ---- | -----------
element | `real` | The id of the element.
value | `real/string/undefined` | The new element value.

## xXmlParse
```
xXmlParse(string)
```
Parses value from the string.

### Arguments:
Name | Type | Description
---- | ---- | -----------
string | `string` | The string to parse.

### Returns:
`real/string`: Real value or a string, where XML character entities are replaced with their original form.

## xXmlRead
```
xXmlRead(fileName)
```
Reads the XML formatted file and stores the contained data into a tree of elements.

### Arguments:
Name | Type | Description
---- | ---- | -----------
fileName | `string` | The name of the XML formatted file.

### Returns:
`real`: The root element of the tree on success or noone on fail.

## xXmlString
```
xXmlString(value)
```
Turns given value into a string. Replaces characters with their XML-safe form.

### Arguments:
Name | Type | Description
---- | ---- | -----------
value | `any` | The value to be turned into a string.

### Returns:
`string`: The resulting string.

## xXmlWrite
```
xXmlWrite(rootElement)
```
Writes the tree of elements into a string.

### Arguments:
Name | Type | Description
---- | ---- | -----------
rootElement | `real` | The root element of the tree.

### Returns:
`string`: The string.

